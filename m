Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A0D2E2CEE
	for <lists+linux-mips@lfdr.de>; Sat, 26 Dec 2020 04:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgLZDSg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Dec 2020 22:18:36 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:57343 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725973AbgLZDSf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Dec 2020 22:18:35 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 052C9580343;
        Fri, 25 Dec 2020 22:17:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 25 Dec 2020 22:17:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=i
        IKUWlvNaP6eszI4CfBVq8Um6F76wL4YbB4hKX2XZb8=; b=O9cR6f1RmzFkIY0+g
        W68VfJwXzckrBYoXIFNXhbfWk4MwhO8iQODgoi8rhAFTm3SoecXjLSl2B/YrUcbP
        JeNXmZuZL+S+OEyTIrTRsY4DwwTAzYwWnnYJbkaUITVo7uuaWB46XZ0/rOsHY5+S
        OUeOndUrxUk105CajaGooPnhoUNd6kHjy7jcpLvhIX1mK+6IvuP3RB7NN0ZX+5ar
        E/4rmFEy0tjxehjkRWeGRd0cimUo+j1dWr2WkVTJQjDT7Bz48xNTWK95/igyLwmN
        sq+TIjuvLZ/wiciOr35U3HNoYfjIKZ05nygK3Hl5Ye4P7YtQ+HqJX5xfhYr9quoB
        szeNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=iIKUWlvNaP6eszI4CfBVq8Um6F76wL4YbB4hKX2XZ
        b8=; b=Ps7mRapMYlYD1wyQs2500TMPaF/WjwYAf26k3a88acVsKW1bmHgzpTIrN
        O1FD1S+rR54jntbi9wDy69v5MNm8Y4v4go9uT6JWza+QcR3R+5fl5Pk0TxiALtsn
        6YKuKLRNuHzXhhEjH6Lo3KzdqERI4koyiUlVNwatl4pR4vhBMIfTmc2//eJUIZ8P
        hwC7PJoSybLqOfHd378EmIGYepOUvPf9gfFmXgttTaw9x3o8hWFkfIusgJ9zvd+o
        M+jYPOKny7+C8Yhyj5UFcSiv6uattySEfA9Z0iXPdJumtfceRE7EPpxDbNVMpAvy
        gn2MFVACXNKaFyZd2Dk0nGypaRatQ==
X-ME-Sender: <xms:W6vmX7wZ1SL4VyYghYGYRVMT5ghW_gM90xsLYnmFULsF9F6sOZkJtQ>
    <xme:W6vmXzT5IFMzd-db0JQprZmOvQ3cSTGPsoZQApiAkjg_edelOWPTgH7C6s1AyDgBp
    YIWsfDUpY-_1elEPMU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdduvddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtke
    ertddtfeftnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludeitddvkeffge
    fgueekjeegfeefteelgffhkeffueetieejgeehhfeuffdvnecukfhppeeghedrfeefrdeh
    tddrvdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:W6vmX1UrP9AWR6PJe1-Y6XiQEWHXSxGnTNpwsvv_QPttDjl5YF6d6w>
    <xmx:W6vmX1g9E1nT5zO_5jR2rUS1uxjAfOqkOzm7JClMqgReggOBFw8uAg>
    <xmx:W6vmX9DysU8aUF9i2qPLdwfmMGTQYzQ6f-wRKaQE-Fk9OJ5Iy1UK9w>
    <xmx:XKvmX4-eT_I3HIVW6unSJbuW2sB3IjY03eRsTTj_kiovysdgcIUOsr4GNZs>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id 010E8108005C;
        Fri, 25 Dec 2020 22:17:45 -0500 (EST)
Subject: Re: [PATCH 2/6] mips: Add N64 machine type
To:     Lauri Kasanen <cand@gmx.com>, linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
References: <20201225190016.286a0dfe49385f2bc39d04d4@gmx.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <cb037083-fb29-e080-c2f0-532f38abb9d6@flygoat.com>
Date:   Sat, 26 Dec 2020 11:17:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201225190016.286a0dfe49385f2bc39d04d4@gmx.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ÔÚ 2020/12/26 ÉÏÎç1:00, Lauri Kasanen Ð´µÀ:
> Signed-off-by: Lauri Kasanen <cand@gmx.com>
> ---
>   arch/mips/Kbuild.platforms           |  1 +
>   arch/mips/Kconfig                    | 12 ++++++++
>   arch/mips/include/asm/mach-n64/irq.h |  9 ++++++
>   arch/mips/include/asm/n64/irq.h      | 26 ++++++++++++++++
>   arch/mips/n64/Makefile               |  6 ++++
>   arch/mips/n64/Platform               |  7 +++++
>   arch/mips/n64/init.c                 | 59 ++++++++++++++++++++++++++++++++++++
>   arch/mips/n64/irq.c                  | 34 +++++++++++++++++++++
>   8 files changed, 154 insertions(+)
>   create mode 100644 arch/mips/include/asm/mach-n64/irq.h
>   create mode 100644 arch/mips/include/asm/n64/irq.h
>   create mode 100644 arch/mips/n64/Makefile
>   create mode 100644 arch/mips/n64/Platform
>   create mode 100644 arch/mips/n64/init.c
>   create mode 100644 arch/mips/n64/irq.c
>
> diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
> index 5483e38..3e39590 100644
> --- a/arch/mips/Kbuild.platforms
> +++ b/arch/mips/Kbuild.platforms
> @@ -18,6 +18,7 @@ platform-$(CONFIG_MACH_LOONGSON2EF)	+= loongson2ef/
>   platform-$(CONFIG_MACH_LOONGSON32)	+= loongson32/
>   platform-$(CONFIG_MACH_LOONGSON64)	+= loongson64/
>   platform-$(CONFIG_MIPS_MALTA)		+= mti-malta/
> +platform-$(CONFIG_MIPS_N64)		+= n64/
>   platform-$(CONFIG_NLM_COMMON)		+= netlogic/
>   platform-$(CONFIG_PIC32MZDA)		+= pic32/
>   platform-$(CONFIG_MACH_PISTACHIO)	+= pistachio/
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 4b52588..2922bb6 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -605,6 +605,18 @@ config MACH_VR41XX
>   	select SYS_SUPPORTS_MIPS16
>   	select GPIOLIB
>
> +config MIPS_N64

Hi Lauri,

Thanks for your patch!

I'd prefer name it with MACH_NINTENDO64 or something,
N64 is also MIPS 64bit ABI, it sounds confusing.

> +	bool "Nintendo 64 console"
> +	select CEVT_R4K
> +	select CSRC_R4K
> +	select SYS_HAS_CPU_R4300
> +	select SYS_SUPPORTS_BIG_ENDIAN
> +	select SYS_SUPPORTS_ZBOOT
> +	select SYS_SUPPORTS_32BIT_KERNEL
> +	select SYS_SUPPORTS_64BIT_KERNEL
> +	select DMA_NONCOHERENT
> +	select IRQ_MIPS_CPU
> +
>   config RALINK
>   	bool "Ralink based machines"
>   	select CEVT_R4K
> diff --git a/arch/mips/include/asm/mach-n64/irq.h b/arch/mips/include/asm/mach-n64/irq.h
> new file mode 100644
> index 0000000..4d4a1ea
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-n64/irq.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_MACH_N64_IRQ_H
> +#define __ASM_MACH_N64_IRQ_H
> +
> +#include <asm/n64/irq.h> /* for MIPS_CPU_IRQ_BASE */
> +
> +#include <asm/mach-generic/irq.h>
> +
> +#endif /* __ASM_MACH_N64_IRQ_H */
> diff --git a/arch/mips/include/asm/n64/irq.h b/arch/mips/include/asm/n64/irq.h
> new file mode 100644
> index 0000000..00f89ca
> --- /dev/null
> +++ b/arch/mips/include/asm/n64/irq.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Interrupt numbers for N64
> + *
> + * Copyright (C) 2020 Lauri Kasanen
> + */
> +#ifndef __N64_IRQ_H
> +#define __N64_IRQ_H
> +
> +#define NR_IRQS 8
> +
> +/*
> + * CPU core Interrupt Numbers
> + */
> +#define MIPS_CPU_IRQ_BASE	0
> +#define MIPS_CPU_IRQ(x)		(MIPS_CPU_IRQ_BASE + (x))
> +#define MIPS_SOFTINT0_IRQ	MIPS_CPU_IRQ(0)
> +#define MIPS_SOFTINT1_IRQ	MIPS_CPU_IRQ(1)
> +#define RCP_IRQ			MIPS_CPU_IRQ(2)
> +#define CART_IRQ		MIPS_CPU_IRQ(3)
> +#define PRENMI_IRQ		MIPS_CPU_IRQ(4)
> +#define RDBR_IRQ		MIPS_CPU_IRQ(5)
> +#define RDBW_IRQ		MIPS_CPU_IRQ(6)
> +#define TIMER_IRQ		MIPS_CPU_IRQ(7)
> +
> +#endif /* __N64_IRQ_H */
> diff --git a/arch/mips/n64/Makefile b/arch/mips/n64/Makefile
> new file mode 100644
> index 0000000..b64a05a
> --- /dev/null
> +++ b/arch/mips/n64/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Nintendo 64
> +#
> +
> +obj-y := init.o irq.o
> diff --git a/arch/mips/n64/Platform b/arch/mips/n64/Platform
> new file mode 100644
> index 0000000..bf5edba
> --- /dev/null
> +++ b/arch/mips/n64/Platform
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Nintendo 64
> +#
> +
> +cflags-$(CONFIG_MIPS_N64)    += -I$(srctree)/arch/mips/include/asm/mach-n64
> +load-$(CONFIG_MIPS_N64)      += 0xffffffff80101000
> diff --git a/arch/mips/n64/init.c b/arch/mips/n64/init.c
> new file mode 100644
> index 0000000..6fb622d
> --- /dev/null
> +++ b/arch/mips/n64/init.c
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Nintendo 64 init.
> + *
> + *  Copyright (C) 2020	Lauri Kasanen
> + */
> +#include <linux/init.h>
> +#include <linux/ioport.h>
> +#include <linux/irq.h>
> +#include <linux/memblock.h>
> +#include <linux/string.h>
> +
> +#include <asm/bootinfo.h>
> +#include <asm/time.h>
> +
> +#define IO_MEM_RESOURCE_START	0UL
> +#define IO_MEM_RESOURCE_END	0x1fffffffUL
> +
> +static void __init iomem_resource_init(void)
> +{
> +	iomem_resource.start = IO_MEM_RESOURCE_START;
> +	iomem_resource.end = IO_MEM_RESOURCE_END;
> +}
> +
> +const char *get_system_type(void)
> +{
> +	return "Nintendo 64";
> +}
> +
> +void __init prom_init(void)
> +{
> +	int argc, i;
> +	const char **argv;
> +
> +	argc = fw_arg0;
> +	argv = (const char **)fw_arg1;
> +
> +	for (i = 1; i < argc; i++) {
> +		strlcat(arcs_cmdline, argv[i], COMMAND_LINE_SIZE);
> +		if (i < (argc - 1))
> +			strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
> +	}
> +}

Please use: fw_init_cmdline.

> +
> +void __init prom_free_prom_memory(void)
> +{
> +}
> +
> +void __init plat_mem_setup(void)
> +{
> +	iomem_resource_init();
> +	memblock_add(0x0, 8 * 1024 * 1024); // Bootloader blocks the 4mb config
> +}
> +
> +void __init plat_time_init(void)
> +{
> +	// 93.75 MHz cpu, count register runs at half rate
> +	mips_hpt_frequency = 93750000 / 2;
> +}
> diff --git a/arch/mips/n64/irq.c b/arch/mips/n64/irq.c
> new file mode 100644
> index 0000000..3eb0079
> --- /dev/null
> +++ b/arch/mips/n64/irq.c
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  N64 IRQ
> + *
> + *  Copyright (C) 2020 Lauri Kasanen
> + */
> +#include <linux/export.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +
> +#include <asm/irq_cpu.h>
> +
> +asmlinkage void plat_irq_dispatch(void)
> +{
> +	unsigned int pending = read_c0_cause() & read_c0_status() & ST0_IM;
> +
> +	if (pending & CAUSEF_IP7)
> +		do_IRQ(TIMER_IRQ);
> +	else if (pending & CAUSEF_IP4)
> +		do_IRQ(PRENMI_IRQ);
> +	else if (pending & CAUSEF_IP2)
> +		do_IRQ(RCP_IRQ);
> +	else if (pending & CAUSEF_IP0)
> +		do_IRQ(MIPS_SOFTINT0_IRQ);
> +	else if (pending & CAUSEF_IP1)
> +		do_IRQ(MIPS_SOFTINT1_IRQ);
> +	else
> +		spurious_interrupt();
> +}

Actually we have plat_irq_dispatch at irq-mips-cpu.c.
Any special reason to override it?

Thanks.

- Jiaxun

> +
> +void __init arch_init_irq(void)
> +{
> +	mips_cpu_irq_init();
> +}
> --
> 2.6.2
>

