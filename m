Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD6832E8112
	for <lists+linux-mips@lfdr.de>; Thu, 31 Dec 2020 16:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgLaPrF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 31 Dec 2020 10:47:05 -0500
Received: from [115.28.160.31] ([115.28.160.31]:35076 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726080AbgLaPrF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 31 Dec 2020 10:47:05 -0500
X-Greylist: delayed 454 seconds by postgrey-1.27 at vger.kernel.org; Thu, 31 Dec 2020 10:47:02 EST
Received: from [192.168.9.172] (unknown [101.224.80.228])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E860F600FE;
        Thu, 31 Dec 2020 23:38:53 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1609429134; bh=s62fMn7OjmgpaUy+yjEdicdYdheetvzSydHhBGvy0tA=;
        h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
        b=xqrJ2E9IYKxMCfAlMawdoXfvGVbYx4xZX6SJR0PZJXqplx6w0f+KcGDAhQrVzPEXe
         kIomFWgFQB77uMIQ9eqPpbo7cI85amL291PGEtmSRXHi3GABg0LV8xNeAKG4fQPbKd
         V2rjfb8hwzbHv8WQ0TUzDTHTpZ/3FzsRf3JKMj5w=
Message-ID: <7bce9302-2921-ca0a-73b1-b094f92e21cc@xen0n.name>
Date:   Thu, 31 Dec 2020 23:38:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0a1
Subject: Re: [PATCH 1/3] MIPS: Add vulnerabilities infrastructure
Content-Language: en-US
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
References: <20201230032314.10042-1-jiaxun.yang@flygoat.com>
From:   WANG Xuerui <kernel@xen0n.name>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, Paul Burton <paulburton@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Huacai Chen <chenhc@lemote.com>, YunQiang Su <syq@debian.org>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org
In-Reply-To: <20201230032314.10042-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,

Overall a nice step towards a more conformant arch/mips! Some nits below 
though.


On 12/30/20 11:23 AM, Jiaxun Yang wrote:
> Add infrastructure to display CPU vulnerabilities.
> As most MIPS CPU vendors are dead today and we can't confirm
> vulnerabilities states with them, we'll display vulnerabilities
> as "Unknown" by default and override them in cpu-probe.c
Add trailing period.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/Kconfig                |  1 +
>   arch/mips/include/asm/cpu-info.h |  5 ++++
>   arch/mips/include/asm/cpu.h      |  7 +++++
>   arch/mips/kernel/Makefile        |  2 +-
>   arch/mips/kernel/vulnbl.c        | 46 ++++++++++++++++++++++++++++++++
>   5 files changed, 60 insertions(+), 1 deletion(-)
>   create mode 100644 arch/mips/kernel/vulnbl.c
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index ef5b2a177b1b..524053b8f769 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -24,6 +24,7 @@ config MIPS
>   	select GENERIC_CLOCKEVENTS
>   	select GENERIC_CMOS_UPDATE
>   	select GENERIC_CPU_AUTOPROBE
> +	select GENERIC_CPU_VULNERABILITIES
>   	select GENERIC_GETTIMEOFDAY
>   	select GENERIC_IOMAP
>   	select GENERIC_IRQ_PROBE
> diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu-info.h
> index a600670d00e9..1a964dbfc0a8 100644
> --- a/arch/mips/include/asm/cpu-info.h
> +++ b/arch/mips/include/asm/cpu-info.h
> @@ -106,6 +106,11 @@ struct cpuinfo_mips {
>   	unsigned int		guestid_mask;
>   	unsigned int		guestid_cache;
>   
> +	/* Vulnerabilities */
> +	unsigned int		vulnerabilities; /* Vulnerabilities states that we known */
> +	unsigned int		vulnerable; /* Vulnerabilities affated */
> +	unsigned int		mitigations; /* Mitigations */

Could you make the field names a little clearer? Like "known_mask", 
"affected_mask" and "mitigated_mask"?

Also I wonder if removing the first mask is okay, since if a bit is 
neither "affected" nor "mitigated" then it must belong to the "unknown" 
case.

> +
>   #ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
>   	/* CPUCFG data for this CPU, synthesized at probe time.
>   	 *
> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
> index f5b04e8f6061..3414c9f5464e 100644
> --- a/arch/mips/include/asm/cpu.h
> +++ b/arch/mips/include/asm/cpu.h
> @@ -447,4 +447,11 @@ enum cpu_type_enum {
>   #define MIPS_ASE_LOONGSON_EXT	0x00002000 /* Loongson EXTensions */
>   #define MIPS_ASE_LOONGSON_EXT2	0x00004000 /* Loongson EXTensions R2 */
>   
> +/*
> + * CPU security vulnerabilities
> + */
> +#define MIPS_VULNBL_MELTDOWN	BIT(0)
> +#define MIPS_VULNBL_SPECTRE_V1	BIT(1)
> +#define MIPS_VULNBL_SPECTRE_V2	BIT(2)
Looking at the arch/x86 vulnerabilities code, I tend to think that 
"VULNBL" is not (rather ugly) shorthand for "vulnerability", but 
"vulnerability blacklist" (!), because they have "VULNWL" for apparently 
"whitelist". So I suggest writing out "VULNERABILITY" fully for clarity.
> +
>   #endif /* _ASM_CPU_H */
> diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
> index 13a26d254829..39abc8ead5e0 100644
> --- a/arch/mips/kernel/Makefile
> +++ b/arch/mips/kernel/Makefile
> @@ -8,7 +8,7 @@ extra-y		:= head.o vmlinux.lds
>   obj-y		+= cmpxchg.o cpu-probe.o branch.o elf.o entry.o genex.o idle.o irq.o \
>   		   process.o prom.o ptrace.o reset.o setup.o signal.o \
>   		   syscall.o time.o topology.o traps.o unaligned.o watch.o \
> -		   vdso.o cacheinfo.o
> +		   vdso.o cacheinfo.o vulnbl.o
>   
>   ifdef CONFIG_FUNCTION_TRACER
>   CFLAGS_REMOVE_ftrace.o = -pg
> diff --git a/arch/mips/kernel/vulnbl.c b/arch/mips/kernel/vulnbl.c
> new file mode 100644
> index 000000000000..fc73da6214fe
> --- /dev/null
> +++ b/arch/mips/kernel/vulnbl.c
Same with this filename.
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Copyright (C) 2020, Jiaxun Yang <jiaxun.yang@flygoat.com>
> + *  MIPS CPU vulnerabilities
> + */
> +
> +#include <linux/device.h>
> +
> +#include <asm/cpu-info.h>
> +#include <asm/cpu.h>
> +
> +ssize_t cpu_show_meltdown(struct device *dev,
> +			  struct device_attribute *attr, char *buf)
> +{
> +	if (!(boot_cpu_data.vulnerabilities & MIPS_VULNBL_MELTDOWN))
> +		return sprintf(buf, "Unknown\n");
> +
> +	if (!(boot_cpu_data.vulnerable & MIPS_VULNBL_MELTDOWN))
> +		return sprintf(buf, "Not affected\n");
> +
> +	return sprintf(buf, "Affected\n");
Be consistent with other arches and use "Vulnerable"?
> +}
> +
> +ssize_t cpu_show_spectre_v1(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	if (!(boot_cpu_data.vulnerabilities & MIPS_VULNBL_SPECTRE_V1))
> +		return sprintf(buf, "Unknown\n");
> +
> +	if (!(boot_cpu_data.vulnerable & MIPS_VULNBL_SPECTRE_V1))
> +		return sprintf(buf, "Not affected\n");
> +
> +	return sprintf(buf, "Affected\n");
Same as above.
> +}
> +
> +ssize_t cpu_show_spectre_v2(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	if (!(boot_cpu_data.vulnerabilities & MIPS_VULNBL_SPECTRE_V2))
> +		return sprintf(buf, "Unknown\n");
> +
> +	if (!(boot_cpu_data.vulnerable & MIPS_VULNBL_SPECTRE_V2))
> +		return sprintf(buf, "Not affected\n");
> +
> +	return sprintf(buf, "Affected\n");
Same as above.
> +}
