Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 799D32A3BFA
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 06:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgKCFdb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Nov 2020 00:33:31 -0500
Received: from relay5.mymailcheap.com ([159.100.241.64]:46956 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgKCFdb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Nov 2020 00:33:31 -0500
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [151.80.165.199])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 75613200FE;
        Tue,  3 Nov 2020 05:33:27 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id E251C3ECDA;
        Tue,  3 Nov 2020 06:33:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 2C34A2A2AC;
        Tue,  3 Nov 2020 00:33:25 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1604381605;
        bh=nThwOyjBWAJcktJqpzjkWAMAlH9oE9b3JGu8MjJPvjQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=mmObzJcw3jfec3MDqauonU9ifBncXLpVbmfReDTOmZImXkaGlxPvLWoSSfl1flz8Q
         dDCcktafC2DnOnak6GeX2A2J5G8J4IQ0FBhtV2pQcd7NQd75NbIO7fvZPFCmoF/Qim
         l5u/zzeHmjx5pWtiZJSwPz8/2ACKRb8hZjG0uQ7k=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ldwlfpXFIyOX; Tue,  3 Nov 2020 00:33:24 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Tue,  3 Nov 2020 00:33:23 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id DD232400C9;
        Tue,  3 Nov 2020 05:33:22 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="u3QOr+xc";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [113.52.132.214])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 0D467400C9;
        Tue,  3 Nov 2020 05:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1604381599;
        bh=nThwOyjBWAJcktJqpzjkWAMAlH9oE9b3JGu8MjJPvjQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=u3QOr+xckya2+HbbVmcqPlrjYt3dmMDYzGy59D+Wy1p4GxyUOSvZXICZMHJDz0qP/
         8WNzwdncFjhUssBtTccWNrm09IYFtcfUDGF1jbo9zxp1OXWDEnLaYTXHoqVajhFzaL
         HouHkaEeqqmy//KT/P+LAIUZiVVwMxqzNGEGqRps=
Subject: Re: [PATCH v2 6/6] MIPS: Loongson64: Move decode_cpucfg() to
 loongson_regs.h
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <1604373306-3599-1-git-send-email-yangtiezhu@loongson.cn>
 <1604373306-3599-7-git-send-email-yangtiezhu@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <e6354e46-648b-ccd1-c0ee-c20158ac8a8e@flygoat.com>
Date:   Tue, 3 Nov 2020 13:33:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1604373306-3599-7-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DD232400C9
X-Spamd-Result: default: False [2.90 / 10.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         RECEIVED_SPAMHAUS_XBL(3.00)[113.52.132.214:received];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all:c];
         RCPT_COUNT_FIVE(0.00)[6];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/11/3 11:15, Tiezhu Yang Ð´µÀ:
> Since decode_cpucfg() is only used for Loongson64, just move
> it to loongson_regs.h to avoid the pollution of common code
> with #ifdef CONFIG_CPU_LOONGSON64.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Hi all,

Don't know if it's a good idea to move this piece of code around...
Also I do think loongson_regs.h should be a common header while
cpucfg_decode won't be reused else where.

But I do respect Thomas's decision if it's necessary.

Thanks

- Jiaxun

> ---
>
> v2: No changes
>
>   .../include/asm/mach-loongson64/loongson_regs.h    | 24 +++++++++++++++++
>   arch/mips/kernel/cpu-probe.c                       | 31 +---------------------
>   2 files changed, 25 insertions(+), 30 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> index 1659935..2d469d6 100644
> --- a/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> +++ b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> @@ -129,6 +129,30 @@ static inline u32 read_cpucfg(u32 reg)
>   #define LOONGSON_CFG7_GCCAEQRP	BIT(0)
>   #define LOONGSON_CFG7_UCAWINP	BIT(1)
>   
> +static inline void decode_cpucfg(struct cpuinfo_mips *c)
> +{
> +	u32 cfg1 = read_cpucfg(LOONGSON_CFG1);
> +	u32 cfg2 = read_cpucfg(LOONGSON_CFG2);
> +	u32 cfg3 = read_cpucfg(LOONGSON_CFG3);
> +
> +	if (cfg1 & LOONGSON_CFG1_MMI)
> +		c->ases |= MIPS_ASE_LOONGSON_MMI;
> +
> +	if (cfg2 & LOONGSON_CFG2_LEXT1)
> +		c->ases |= MIPS_ASE_LOONGSON_EXT;
> +
> +	if (cfg2 & LOONGSON_CFG2_LEXT2)
> +		c->ases |= MIPS_ASE_LOONGSON_EXT2;
> +
> +	if (cfg2 & LOONGSON_CFG2_LSPW) {
> +		c->options |= MIPS_CPU_LDPTE;
> +		c->guest.options |= MIPS_CPU_LDPTE;
> +	}
> +
> +	if (cfg3 & LOONGSON_CFG3_LCAMP)
> +		c->ases |= MIPS_ASE_LOONGSON_CAM;
> +}
> +
>   static inline bool cpu_has_csr(void)
>   {
>   	if (cpu_has_cfg())
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index e685369..1fa2c8b 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -31,6 +31,7 @@
>   #include "fpu-probe.h"
>   
>   #include <asm/mach-loongson64/cpucfg-emul.h>
> +#include <asm/mach-loongson64/loongson_regs.h>
>   
>   /* Hardware capabilities */
>   unsigned int elf_hwcap __read_mostly;
> @@ -1692,33 +1693,6 @@ static inline void cpu_probe_cavium(struct cpuinfo_mips *c, unsigned int cpu)
>   	}
>   }
>   
> -#ifdef CONFIG_CPU_LOONGSON64
> -#include <loongson_regs.h>
> -
> -static inline void decode_cpucfg(struct cpuinfo_mips *c)
> -{
> -	u32 cfg1 = read_cpucfg(LOONGSON_CFG1);
> -	u32 cfg2 = read_cpucfg(LOONGSON_CFG2);
> -	u32 cfg3 = read_cpucfg(LOONGSON_CFG3);
> -
> -	if (cfg1 & LOONGSON_CFG1_MMI)
> -		c->ases |= MIPS_ASE_LOONGSON_MMI;
> -
> -	if (cfg2 & LOONGSON_CFG2_LEXT1)
> -		c->ases |= MIPS_ASE_LOONGSON_EXT;
> -
> -	if (cfg2 & LOONGSON_CFG2_LEXT2)
> -		c->ases |= MIPS_ASE_LOONGSON_EXT2;
> -
> -	if (cfg2 & LOONGSON_CFG2_LSPW) {
> -		c->options |= MIPS_CPU_LDPTE;
> -		c->guest.options |= MIPS_CPU_LDPTE;
> -	}
> -
> -	if (cfg3 & LOONGSON_CFG3_LCAMP)
> -		c->ases |= MIPS_ASE_LOONGSON_CAM;
> -}
> -
>   static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>   {
>   	decode_configs(c);
> @@ -1787,9 +1761,6 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>   		break;
>   	}
>   }
> -#else
> -static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu) { }
> -#endif
>   
>   static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
>   {
