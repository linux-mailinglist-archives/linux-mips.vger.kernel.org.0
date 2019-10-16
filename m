Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD7A0D8684
	for <lists+linux-mips@lfdr.de>; Wed, 16 Oct 2019 05:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389534AbfJPDbv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Oct 2019 23:31:51 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:49470 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730211AbfJPDbv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 15 Oct 2019 23:31:51 -0400
Received: from [192.168.1.13] (c-76-114-240-162.hsd1.md.comcast.net [76.114.240.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kumba)
        by smtp.gentoo.org (Postfix) with ESMTPSA id CA51334BE71;
        Wed, 16 Oct 2019 03:31:48 +0000 (UTC)
Subject: Re: [PATCH v2] rtc: ds1685: add indirect access method and remove
 plat_read/plat_write
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20191014214621.25257-1-tbogendoerfer@suse.de>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <1d603c03-bb38-52e6-cd7f-4233fd012824@gentoo.org>
Date:   Tue, 15 Oct 2019 23:31:46 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014214621.25257-1-tbogendoerfer@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/14/2019 17:46, Thomas Bogendoerfer wrote:
> SGI Octane (IP30) doesn't have RTC register directly mapped into CPU
> address space, but accesses RTC registers with an address and data
> register.  This is now supported by additional access functions, which
> are selected by a new field in platform data. Removed plat_read/plat_write
> since there is no user and their usage could introduce lifetime issue,
> when functions are placed in different modules.
> 
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> ---
> Changes in v2:
> 
> - check if rtc->read and rtc->write are setup
> - spell out indirect in function names and explain difference
>   between standard and indirect functions
> 
>  arch/mips/sgi-ip32/ip32-platform.c |  2 +-
>  drivers/rtc/rtc-ds1685.c           | 78 +++++++++++++++++++++++++-------------
>  include/linux/rtc/ds1685.h         |  8 ++--
>  3 files changed, 58 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/mips/sgi-ip32/ip32-platform.c b/arch/mips/sgi-ip32/ip32-platform.c
> index 5a2a82148d8d..c3909bd8dd1a 100644
> --- a/arch/mips/sgi-ip32/ip32-platform.c
> +++ b/arch/mips/sgi-ip32/ip32-platform.c
> @@ -115,7 +115,7 @@ ip32_rtc_platform_data[] = {
>  		.bcd_mode = true,
>  		.no_irq = false,
>  		.uie_unsupported = false,
> -		.alloc_io_resources = true,
> +		.access_type = ds1685_reg_direct,
>  		.plat_prepare_poweroff = ip32_prepare_poweroff,
>  	},
>  };
> diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
> index 349a8d1caca1..98d06b3ee913 100644
> --- a/drivers/rtc/rtc-ds1685.c
> +++ b/drivers/rtc/rtc-ds1685.c
> @@ -31,7 +31,10 @@
>  
>  
>  /* ----------------------------------------------------------------------- */
> -/* Standard read/write functions if platform does not provide overrides */
> +/*
> + *  Standard read/write
> + *  all registers are mapped in CPU address space
> + */
>  
>  /**
>   * ds1685_read - read a value from an rtc register.
> @@ -59,6 +62,35 @@ ds1685_write(struct ds1685_priv *rtc, int reg, u8 value)
>  }
>  /* ----------------------------------------------------------------------- */
>  
> +/*
> + * Indirect read/write functions
> + * access happens via address and data register mapped in CPU address space
> + */
> +
> +/**
> + * ds1685_indirect_read - read a value from an rtc register.
> + * @rtc: pointer to the ds1685 rtc structure.
> + * @reg: the register address to read.
> + */
> +static u8
> +ds1685_indirect_read(struct ds1685_priv *rtc, int reg)
> +{
> +	writeb(reg, rtc->regs);
> +	return readb(rtc->data);
> +}
> +
> +/**
> + * ds1685_indirect_write - write a value to an rtc register.
> + * @rtc: pointer to the ds1685 rtc structure.
> + * @reg: the register address to write.
> + * @value: value to write to the register.
> + */
> +static void
> +ds1685_indirect_write(struct ds1685_priv *rtc, int reg, u8 value)
> +{
> +	writeb(reg, rtc->regs);
> +	writeb(value, rtc->data);
> +}
>  
>  /* ----------------------------------------------------------------------- */
>  /* Inlined functions */
> @@ -1062,42 +1094,36 @@ ds1685_rtc_probe(struct platform_device *pdev)
>  	if (!rtc)
>  		return -ENOMEM;
>  
> -	/*
> -	 * Allocate/setup any IORESOURCE_MEM resources, if required.  Not all
> -	 * platforms put the RTC in an easy-access place.  Like the SGI Octane,
> -	 * which attaches the RTC to a "ByteBus", hooked to a SuperIO chip
> -	 * that sits behind the IOC3 PCI metadevice.
> -	 */
> -	if (pdata->alloc_io_resources) {
> +	/* Setup resources and access functions */
> +	switch (pdata->access_type) {
> +	case ds1685_reg_direct:
> +		rtc->regs = devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(rtc->regs))
> +			return PTR_ERR(rtc->regs);
> +		rtc->read = ds1685_read;
> +		rtc->write = ds1685_write;
> +		break;
> +	case ds1685_reg_indirect:
>  		rtc->regs = devm_platform_ioremap_resource(pdev, 0);
>  		if (IS_ERR(rtc->regs))
>  			return PTR_ERR(rtc->regs);
> +		rtc->data = devm_platform_ioremap_resource(pdev, 1);
> +		if (IS_ERR(rtc->data))
> +			return PTR_ERR(rtc->data);
> +		rtc->read = ds1685_indirect_read;
> +		rtc->write = ds1685_indirect_write;
> +		break;
>  	}
>  
> +	if (!rtc->read || !rtc->write)
> +		return -ENXIO;
> +
>  	/* Get the register step size. */
>  	if (pdata->regstep > 0)
>  		rtc->regstep = pdata->regstep;
>  	else
>  		rtc->regstep = 1;
>  
> -	/* Platform read function, else default if mmio setup */
> -	if (pdata->plat_read)
> -		rtc->read = pdata->plat_read;
> -	else
> -		if (pdata->alloc_io_resources)
> -			rtc->read = ds1685_read;
> -		else
> -			return -ENXIO;
> -
> -	/* Platform write function, else default if mmio setup */
> -	if (pdata->plat_write)
> -		rtc->write = pdata->plat_write;
> -	else
> -		if (pdata->alloc_io_resources)
> -			rtc->write = ds1685_write;
> -		else
> -			return -ENXIO;
> -
>  	/* Platform pre-shutdown function, if defined. */
>  	if (pdata->plat_prepare_poweroff)
>  		rtc->prepare_poweroff = pdata->plat_prepare_poweroff;
> diff --git a/include/linux/rtc/ds1685.h b/include/linux/rtc/ds1685.h
> index 101c7adc05a2..67ee9d20cc5a 100644
> --- a/include/linux/rtc/ds1685.h
> +++ b/include/linux/rtc/ds1685.h
> @@ -42,6 +42,7 @@
>  struct ds1685_priv {
>  	struct rtc_device *dev;
>  	void __iomem *regs;
> +	void __iomem *data;
>  	u32 regstep;
>  	int irq_num;
>  	bool bcd_mode;
> @@ -70,12 +71,13 @@ struct ds1685_rtc_platform_data {
>  	const bool bcd_mode;
>  	const bool no_irq;
>  	const bool uie_unsupported;
> -	const bool alloc_io_resources;
> -	u8 (*plat_read)(struct ds1685_priv *, int);
> -	void (*plat_write)(struct ds1685_priv *, int, u8);
>  	void (*plat_prepare_poweroff)(void);
>  	void (*plat_wake_alarm)(void);
>  	void (*plat_post_ram_clear)(void);
> +	enum {
> +		ds1685_reg_direct,
> +		ds1685_reg_indirect
> +	} access_type;
>  };
>  
>  
> -- 2.16.4
> 

Acked-by: Joshua Kinard <kumba@gentoo.org>
Reviewed-by: Joshua Kinard <kumba@gentoo.org>
