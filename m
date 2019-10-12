Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8B9D5346
	for <lists+linux-mips@lfdr.de>; Sun, 13 Oct 2019 01:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbfJLXWG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 19:22:06 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:45390 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727189AbfJLXWG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 12 Oct 2019 19:22:06 -0400
Received: from [192.168.1.13] (c-76-114-240-162.hsd1.md.comcast.net [76.114.240.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kumba)
        by smtp.gentoo.org (Postfix) with ESMTPSA id D1EC034BCAC;
        Sat, 12 Oct 2019 23:22:03 +0000 (UTC)
Subject: Re: [PATCH 3/3] rtc: ds1685: add indirect access method and remove
 plat_read/plat_write
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org
References: <20191011150546.9186-1-tbogendoerfer@suse.de>
 <20191011150546.9186-3-tbogendoerfer@suse.de>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <0e160839-9038-6f74-fdb6-8128344fb4b8@gentoo.org>
Date:   Sat, 12 Oct 2019 19:22:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011150546.9186-3-tbogendoerfer@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/11/2019 11:05, Thomas Bogendoerfer wrote:
> Use of provided plat_read/plat_write introduces the problem of possible
> different lifetime of rtc driver and plat_XXX function provider. As
> this was only intended for SGI Octane (IP30) this patchset implements
> a register indirect access method for IP30 and introduces an
> access_type field in platform data to select how registers are
> accessed. And since there are no resource allocating stunts needed
> anymore it also gets rid of alloc_io_resources from platform data.
> 

Actually, I did it this way because IP32 was already in-tree, and IP30 was
not.  So the default ds1685_{read,write} functions were geared for the
in-tree machine, and IP30 brought along its own versions.  If IP30 support
gets merged into the kernel, this isn't needed anymore, but I don't think
this explanation accurately captures that.

The chief difference between IP32 and IP30's manner of accessing the RTC
is that IP32 has a 256-byte gap between each RTC register for unknown
reasons (this is documented in the IP32 hardware data sheets I have), and
access has to be MMIO'ed, since the RTC is hanging off of the MACE PCI
structs, like every other device in IP32's code.  IP30 doesn't have this
register gap to worry about, and it accesses the RTC registers via PIO.


> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> ---
>  arch/mips/sgi-ip32/ip32-platform.c |  2 +-
>  drivers/rtc/rtc-ds1685.c           | 67 ++++++++++++++++++++++++--------------
>  include/linux/rtc/ds1685.h         |  8 +++--
>  3 files changed, 48 insertions(+), 29 deletions(-)
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
> index 349a8d1caca1..9c5d064ebb6c 100644
> --- a/drivers/rtc/rtc-ds1685.c
> +++ b/drivers/rtc/rtc-ds1685.c
> @@ -59,6 +59,32 @@ ds1685_write(struct ds1685_priv *rtc, int reg, u8 value)
>  }
>  /* ----------------------------------------------------------------------- */
>  
> +/* Indirect read/write functions */
> +
> +/**
> + * ds1685_indir_read - read a value from an rtc register.
> + * @rtc: pointer to the ds1685 rtc structure.
> + * @reg: the register address to read.
> + */
> +static u8
> +ds1685_indir_read(struct ds1685_priv *rtc, int reg)
> +{
> +	writeb(reg, rtc->regs);
> +	return readb(rtc->data);
> +}
> +
> +/**
> + * ds1685_indir_write - write a value to an rtc register.
> + * @rtc: pointer to the ds1685 rtc structure.
> + * @reg: the register address to write.
> + * @value: value to write to the register.
> + */
> +static void
> +ds1685_indir_write(struct ds1685_priv *rtc, int reg, u8 value)
> +{
> +	writeb(reg, rtc->regs);
> +	writeb(value, rtc->data);
> +}

IP30 applied a mask of 0x7f on the 'reg' parameter on both of its
read/write functions, which was from Stan's original code.  Is this mask
not needed any more with the other changes you made to the IP30 code?  I
remember trying to do without this mask once long ago, and something broke,
so I have left it in ever since.

>  
>  /* ----------------------------------------------------------------------- */
>  /* Inlined functions */
> @@ -1062,16 +1088,25 @@ ds1685_rtc_probe(struct platform_device *pdev)
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
> +		rtc->read = ds1685_indir_read;
> +		rtc->write = ds1685_indir_write;
> +		break;
>  	}

I believe there should be a default case in the switch statement to catch
and return -ENXIO so that we don't wind up with rtc->{read,write} being
NULL.

I also think the "indir" name isn't really descriptive of why IP32 and
IP30 effectively have different read/write mechanisms.  Might want to add
some comments to explain that IP32 uses MMIO and can just directly
read/write the registers, while IP30 uses PIO and has to go the route of
writing to an 'addr' register, then reading the result from a 'data'
register.


>  
>  	/* Get the register step size. */
> @@ -1080,24 +1115,6 @@ ds1685_rtc_probe(struct platform_device *pdev)
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
