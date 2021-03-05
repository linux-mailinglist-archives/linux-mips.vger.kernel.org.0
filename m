Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8223232DFAE
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 03:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbhCECcr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 21:32:47 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:32891 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229436AbhCECcq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Mar 2021 21:32:46 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 53AB85C0090;
        Thu,  4 Mar 2021 21:32:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 04 Mar 2021 21:32:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=u
        ly4XdvButdgDELM29dyWpA9ZHuCLzxXZmjwGa94+e4=; b=xP+D8hjP1JjVmXppB
        iAG99NbBD9kXFPW1SR50116sbV+eOG31ygSitmGuoROd1qqVRdMor7mUWEdJ9rMH
        1FWDiOMsPM71uX1O+xWmXYjJ5uq2tFF5eraEDMyBhq1kOHSUCB647eVX/hByJc9o
        f6Kc+94Lvjhg8mDVvmRfyEHacJLuBmG47l+nTSJdnbUCq3OdYvRRSG/ee9orYDB0
        sXDGtI3Aqms2hqnjuorTl7+Vl1Zha8uIUvAuiWUyV3mcEO/NCFHeGqsDxurv7+C4
        67FhfaiXfT/NEIkF9uuQhs0H5c6LLvX6DYM85jWEONWNa90mArdudIBDf5TLIbsl
        Ow8Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=uly4XdvButdgDELM29dyWpA9ZHuCLzxXZmjwGa94+
        e4=; b=uoCecw2lfp2ymWA3EzxfNSwlYDT8EsiOiu1jMOrRgHrZ2JGP+V3VSddT/
        SEYtWLCRVMFE99wYJLMgPeGUwjpE9HUVwLHOu1ahwmHeKAaKPAZSoU9e+Fl3rI7F
        IHo8Rj++KLd9QajS3fB3Q9VS8EJOsokmhbqYNeVoYn+MYavgUCyrYesF0rYbEjz/
        dkji+vCMQP5p8EBsJVrliTlLCREUY2h1lbhJOdZaPIQppLT88pW21jVey1n8MmYI
        bgQ04RAH5zXbkAWt5/TcYlc+uB4GlL9MDIfxYlWgzBxr541Nhmh83ZBtiThAP0/d
        N7ZDtdkM3z1ROxE4XCaH8ouvBMqyA==
X-ME-Sender: <xms:TphBYCHUH6g2v_YtpcZ4eJ8QSnAgjB2dwIgwMgNlo6yQNfDZlSWMqA>
    <xme:TphBYDUUhaK7FCxo9QSJooWQimVRanG0jS7mI7FbSV2e5sluwCiK3ese1DHjD_wDi
    QOAov6BY3t5hkXr4xY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddthedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdeftfenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeefleduiedtvdekffeggfeukeejgeeffeetlefghfekffeuteei
    jeeghefhueffvdenucfkphepgeehrdeffedrhedtrddvheegnecuvehluhhsthgvrhfuih
    iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
    hihgohgrthdrtghomh
X-ME-Proxy: <xmx:TphBYMKQDVFMCw3tfB9wNfKsCRNjikGzwNDxbLKap6Twvvql86hZFw>
    <xmx:TphBYMFakKbphECfEsYTUijBJyLEpQr5v5gdT0EjXc109ZCu7e2i3Q>
    <xmx:TphBYIXOL-GP09mPqH3CM6tIWPyuoO6stzjfAzGaJpnTOp06yG4Azw>
    <xmx:TphBYGzEqHtOg2L4I7zWMKkyJX5PezAotFkGrw7YcsFuAA8eAZ6-Rg>
Received: from [127.0.0.1] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id E60FF1080054;
        Thu,  4 Mar 2021 21:32:43 -0500 (EST)
Subject: Re: [PATCH 2/2] MIPS: Loongson64: Move loongson_system_configuration
 to loongson.h
To:     Qing Zhang <zhangqing@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210304110057.22144-1-zhangqing@loongson.cn>
 <20210304110057.22144-3-zhangqing@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <606a54a3-bf1e-2e71-e2e2-ff5b2c07cbb2@flygoat.com>
Date:   Fri, 5 Mar 2021 10:32:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210304110057.22144-3-zhangqing@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2021/3/4 ÏÂÎç7:00, Qing Zhang Ð´µÀ:
> The purpose of separating loongson_system_configuration from boot_param.h
> is to keep the other structure consistent with the firmware.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>



Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>



- Jiaxun

> ---
>   .../include/asm/mach-loongson64/boot_param.h   | 18 ------------------
>   .../include/asm/mach-loongson64/loongson.h     | 18 ++++++++++++++++++
>   drivers/irqchip/irq-loongson-liointc.c         |  2 +-
>   3 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
> index 1c1cdf57137e..035b1a69e2d0 100644
> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> @@ -198,24 +198,6 @@ enum loongson_bridge_type {
>   	VIRTUAL = 3
>   };
>   
> -struct loongson_system_configuration {
> -	u32 nr_cpus;
> -	u32 nr_nodes;
> -	int cores_per_node;
> -	int cores_per_package;
> -	u16 boot_cpu_id;
> -	u16 reserved_cpus_mask;
> -	enum loongson_cpu_type cputype;
> -	enum loongson_bridge_type bridgetype;
> -	u64 restart_addr;
> -	u64 poweroff_addr;
> -	u64 suspend_addr;
> -	u64 vgabios_addr;
> -	u32 dma_mask_bits;
> -	u64 workarounds;
> -	void (*early_config)(void);
> -};
> -
>   extern struct efi_memory_map_loongson *loongson_memmap;
>   extern struct loongson_system_configuration loongson_sysconf;
>   
> diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
> index ac1c20e172a2..6189deb188cf 100644
> --- a/arch/mips/include/asm/mach-loongson64/loongson.h
> +++ b/arch/mips/include/asm/mach-loongson64/loongson.h
> @@ -12,6 +12,24 @@
>   #include <linux/irq.h>
>   #include <boot_param.h>
>   
> +/* machine-specific boot configuration */
> +struct loongson_system_configuration {
> +	u32 nr_cpus;
> +	u32 nr_nodes;
> +	int cores_per_node;
> +	int cores_per_package;
> +	u16 boot_cpu_id;
> +	u16 reserved_cpus_mask;
> +	enum loongson_cpu_type cputype;
> +	enum loongson_bridge_type bridgetype;
> +	u64 restart_addr;
> +	u64 poweroff_addr;
> +	u64 suspend_addr;
> +	u64 vgabios_addr;
> +	u32 dma_mask_bits;
> +	u64 workarounds;
> +	void (*early_config)(void);
> +};
>   
>   /* machine-specific reboot/halt operation */
>   extern void mach_prepare_reboot(void);
> diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
> index 09b91b81851c..249566a23cc4 100644
> --- a/drivers/irqchip/irq-loongson-liointc.c
> +++ b/drivers/irqchip/irq-loongson-liointc.c
> @@ -16,7 +16,7 @@
>   #include <linux/smp.h>
>   #include <linux/irqchip/chained_irq.h>
>   
> -#include <boot_param.h>
> +#include <loongson.h>
>   
>   #define LIOINTC_CHIP_IRQ	32
>   #define LIOINTC_NUM_PARENT 4
> 
