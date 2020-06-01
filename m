Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B6F1E9C1F
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 05:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgFADmh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 31 May 2020 23:42:37 -0400
Received: from [115.28.160.31] ([115.28.160.31]:57494 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726002AbgFADmh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 31 May 2020 23:42:37 -0400
Received: from hanazono.local (unknown [116.236.177.50])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 67548600BA;
        Mon,  1 Jun 2020 11:42:34 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590982954; bh=T2FIcl+zGro5B9PIctDniwpbsXCVIpYopHokZSPTuXs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=aDHDuhhgoUzNMR/iujSEfQ3nr0Bl/zckd5lWy7WxSmVpgKs/lMrO0BX7ofVIGXsbw
         vVn1a8qAjOqPRX55C2aj20KXBRSB+dC4IN05UI1EqneNkAHTrR+XF8nRhw/NgpGACn
         VkLgUls4CDCn7fZKOSsQDgEV0s7Q5aBgxY97Dj3w=
Subject: Re: [PATCH] MIPS: Unify naming style of vendor CP0.Config6 bits
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1590981437-9701-1-git-send-email-chenhc@lemote.com>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <54081df9-f723-a832-c9dc-294ead81009d@xen0n.name>
Date:   Mon, 1 Jun 2020 11:42:33 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.0a1
MIME-Version: 1.0
In-Reply-To: <1590981437-9701-1-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Huacai,

On 2020/6/1 11:17, Huacai Chen wrote:
> Other vendor-defined registers use the vendor name as a prefix, not an
> infix, so unify the naming style of CP0.Config6 bits.
>
> Suggested-by: Maciej W. Rozycki" <macro@linux-mips.org>
Stray quotation mark?
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>   arch/mips/include/asm/mipsregs.h   | 28 ++++++++++++++--------------
>   arch/mips/kernel/cpu-probe.c       | 12 ++++++------
>   arch/mips/loongson64/cpucfg-emul.c |  6 +++---
>   arch/mips/mm/c-r4k.c               |  4 ++--
>   4 files changed, 25 insertions(+), 25 deletions(-)
>
> diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> index 796dbb8..ef4912e 100644
> --- a/arch/mips/include/asm/mipsregs.h
> +++ b/arch/mips/include/asm/mipsregs.h
> @@ -689,35 +689,35 @@
>   /* Config6 feature bits for proAptiv/P5600 */
>   
>   /* Jump register cache prediction disable */
> -#define MIPS_CONF6_MTI_JRCD		(_ULCAST_(1) << 0)
> +#define MTI_CONF6_JRCD		(_ULCAST_(1) << 0)
>   /* MIPSr6 extensions enable */
> -#define MIPS_CONF6_MTI_R6		(_ULCAST_(1) << 2)
> +#define MTI_CONF6_R6		(_ULCAST_(1) << 2)
>   /* IFU Performance Control */
> -#define MIPS_CONF6_MTI_IFUPERFCTL	(_ULCAST_(3) << 10)
> -#define MIPS_CONF6_MTI_SYND		(_ULCAST_(1) << 13)
> +#define MTI_CONF6_IFUPERFCTL	(_ULCAST_(3) << 10)
> +#define MTI_CONF6_SYND		(_ULCAST_(1) << 13)
>   /* Sleep state performance counter disable */
> -#define MIPS_CONF6_MTI_SPCD		(_ULCAST_(1) << 14)
> +#define MTI_CONF6_SPCD		(_ULCAST_(1) << 14)
>   /* proAptiv FTLB on/off bit */
> -#define MIPS_CONF6_MTI_FTLBEN		(_ULCAST_(1) << 15)
> +#define MTI_CONF6_FTLBEN	(_ULCAST_(1) << 15)
>   /* Disable load/store bonding */
> -#define MIPS_CONF6_MTI_DLSB		(_ULCAST_(1) << 21)
> +#define MTI_CONF6_DLSB		(_ULCAST_(1) << 21)
>   /* FTLB probability bits */
> -#define MIPS_CONF6_MTI_FTLBP_SHIFT	(16)
> +#define MTI_CONF6_FTLBP_SHIFT	(16)
>   
>   /* Config6 feature bits for Loongson-3 */
>   
>   /* Loongson-3 internal timer bit */
> -#define MIPS_CONF6_LOONGSON_INTIMER	(_ULCAST_(1) << 6)
> +#define LOONGSON_CONF6_INTIMER	(_ULCAST_(1) << 6)
>   /* Loongson-3 external timer bit */
> -#define MIPS_CONF6_LOONGSON_EXTIMER	(_ULCAST_(1) << 7)
> +#define LOONGSON_CONF6_EXTIMER	(_ULCAST_(1) << 7)
>   /* Loongson-3 SFB on/off bit, STFill in manual */
> -#define MIPS_CONF6_LOONGSON_SFBEN	(_ULCAST_(1) << 8)
> +#define LOONGSON_CONF6_SFBEN	(_ULCAST_(1) << 8)
>   /* Loongson-3's LL on exclusive cacheline */
> -#define MIPS_CONF6_LOONGSON_LLEXC	(_ULCAST_(1) << 16)
> +#define LOONGSON_CONF6_LLEXC	(_ULCAST_(1) << 16)
>   /* Loongson-3's SC has a random delay */
> -#define MIPS_CONF6_LOONGSON_SCRAND	(_ULCAST_(1) << 17)
> +#define LOONGSON_CONF6_SCRAND	(_ULCAST_(1) << 17)
>   /* Loongson-3 FTLB on/off bit, VTLBOnly in manual */
> -#define MIPS_CONF6_LOONGSON_FTLBDIS	(_ULCAST_(1) << 22)
> +#define LOONGSON_CONF6_FTLBDIS	(_ULCAST_(1) << 22)
>   
>   #define MIPS_CONF7_WII		(_ULCAST_(1) << 31)
>   
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 6b93162..e5b218d 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -635,14 +635,14 @@ static int set_ftlb_enable(struct cpuinfo_mips *c, enum ftlb_flags flags)
>   		config = read_c0_config6();
>   
>   		if (flags & FTLB_EN)
> -			config |= MIPS_CONF6_MTI_FTLBEN;
> +			config |= MTI_CONF6_FTLBEN;
>   		else
> -			config &= ~MIPS_CONF6_MTI_FTLBEN;
> +			config &= ~MTI_CONF6_FTLBEN;
>   
>   		if (flags & FTLB_SET_PROB) {
> -			config &= ~(3 << MIPS_CONF6_MTI_FTLBP_SHIFT);
> +			config &= ~(3 << MTI_CONF6_FTLBP_SHIFT);
>   			config |= calculate_ftlb_probability(c)
> -				  << MIPS_CONF6_MTI_FTLBP_SHIFT;
> +				  << MTI_CONF6_FTLBP_SHIFT;
>   		}
>   
>   		write_c0_config6(config);
> @@ -662,10 +662,10 @@ static int set_ftlb_enable(struct cpuinfo_mips *c, enum ftlb_flags flags)
>   		config = read_c0_config6();
>   		if (flags & FTLB_EN)
>   			/* Enable FTLB */
> -			write_c0_config6(config & ~MIPS_CONF6_LOONGSON_FTLBDIS);
> +			write_c0_config6(config & ~LOONGSON_CONF6_FTLBDIS);
>   		else
>   			/* Disable FTLB */
> -			write_c0_config6(config | MIPS_CONF6_LOONGSON_FTLBDIS);
> +			write_c0_config6(config | LOONGSON_CONF6_FTLBDIS);
>   		break;
>   	default:
>   		return 1;
> diff --git a/arch/mips/loongson64/cpucfg-emul.c b/arch/mips/loongson64/cpucfg-emul.c
> index cd619b4..630927e 100644
> --- a/arch/mips/loongson64/cpucfg-emul.c
> +++ b/arch/mips/loongson64/cpucfg-emul.c
> @@ -57,11 +57,11 @@ static void decode_loongson_config6(struct cpuinfo_mips *c)
>   {
>   	u32 config6 = read_c0_config6();
>   
> -	if (config6 & MIPS_CONF6_LOONGSON_SFBEN)
> +	if (config6 & LOONGSON_CONF6_SFBEN)
>   		c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_SFBP;
> -	if (config6 & MIPS_CONF6_LOONGSON_LLEXC)
> +	if (config6 & LOONGSON_CONF6_LLEXC)
>   		c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_LLEXC;
> -	if (config6 & MIPS_CONF6_LOONGSON_SCRAND)
> +	if (config6 & LOONGSON_CONF6_SCRAND)
>   		c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_SCRAND;
>   }
>   
> diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
> index 6fb83ac..8f51617 100644
> --- a/arch/mips/mm/c-r4k.c
> +++ b/arch/mips/mm/c-r4k.c
> @@ -1073,12 +1073,12 @@ static inline int alias_74k_erratum(struct cpuinfo_mips *c)
>   		if (rev <= PRID_REV_ENCODE_332(2, 4, 0))
>   			present = 1;
>   		if (rev == PRID_REV_ENCODE_332(2, 4, 0))
> -			write_c0_config6(read_c0_config6() | MIPS_CONF6_MTI_SYND);
> +			write_c0_config6(read_c0_config6() | MTI_CONF6_SYND);
>   		break;
>   	case PRID_IMP_1074K:
>   		if (rev <= PRID_REV_ENCODE_332(1, 1, 0)) {
>   			present = 1;
> -			write_c0_config6(read_c0_config6() | MIPS_CONF6_MTI_SYND);
> +			write_c0_config6(read_c0_config6() | MTI_CONF6_SYND);
>   		}
>   		break;
>   	default:
