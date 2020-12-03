Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083E32CCDBC
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 05:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgLCEHp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Dec 2020 23:07:45 -0500
Received: from relay5.mymailcheap.com ([159.100.248.207]:55203 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgLCEHp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Dec 2020 23:07:45 -0500
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.199.117])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 4B95D260EC;
        Thu,  3 Dec 2020 04:06:53 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id EF6743F1D0;
        Thu,  3 Dec 2020 05:05:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id C0BBE2A6DF;
        Thu,  3 Dec 2020 05:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1606968320;
        bh=XX5cAZ6ApL04S+ctlPnZeQ2tjelEaYSXcOgkF4c+I1E=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZJRjrmtN8q80lF9OWzDAlXzgYBuUfK+AIHzfpvC028z+xoUNuRFsEdrPDS+hh8ezN
         a2XlGxsfB52Jik0yR7zVaNHuweeN+rEXypbM/FrO3aSRQZ8fNlb8BLS/tvO6eVyRl2
         Z55Q/B4BmppqifbdlqAklzfI3TU9Y36Ep8/uFonc=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QSXg-aTgmLXV; Thu,  3 Dec 2020 05:05:19 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Thu,  3 Dec 2020 05:05:19 +0100 (CET)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 25CFF42237;
        Thu,  3 Dec 2020 04:05:19 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="otLco1Ht";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1861-199.members.linode.com [172.105.207.199])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id C8BC44100D;
        Thu,  3 Dec 2020 04:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1606968316;
        bh=XX5cAZ6ApL04S+ctlPnZeQ2tjelEaYSXcOgkF4c+I1E=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=otLco1HtBp7RnkPms9lDxmEc9TURYAfmI3YU7eI8g43jkGzermOXEA+i1KkXO2t9A
         qwEe3kjF8ierr/FWXQrn6mvpJpkayr/rDUV0zZItCpnfDw8KwRq9DDeraeFejlrkTe
         BvCCnzfEZtOUfGj8rEc08WzxvzOuG30FfzOiR2LM=
Subject: Re: [PATCH v2 2/2] MIPS: Loongson64: Add KASLR support
To:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1606298866-7086-1-git-send-email-hejinyang@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <d6e07fad-da7d-065a-3b81-63b4f57f8fc0@flygoat.com>
Date:   Thu, 3 Dec 2020 12:05:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <1606298866-7086-1-git-send-email-hejinyang@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: 25CFF42237
X-Spamd-Result: default: False [2.90 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         RECEIVED_SPAMHAUS_XBL(3.00)[172.105.207.199:received];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
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



ÔÚ 2020/11/25 ÏÂÎç6:07, Jinyang He Ð´µÀ:
> Provide a weak plat_get_fdt() in relocate.c in case some platform enable
> USE_OF while plat_get_fdt() is useless.
>
> 1MB RELOCATION_TABLE_SIZE is small for Loongson64 because too many
> instructions should be relocated. 2MB is enough in present.
>
> Add KASLR support for Loongson64.
>
> KASLR(kernel address space layout randomization)
>
> To enable KASLR on Loongson64:
> First, make loongson3_defconfig.
> Then, enable CONFIG_RELOCATABLE and CONFIG_RANDOMIZE_BASE.
> Finally, compile the kernel.
>
> To test KASLR on Loongson64:
> Start machine with KASLR kernel.
>
> The first time:
> # cat /proc/iomem
> 00200000-0effffff : System RAM
>    02f30000-03895e9f : Kernel code
>    03895ea0-03bc7fff : Kernel data
>    03e30000-04f43f7f : Kernel bss
>
> The second time:
> # cat /proc/iomem
> 00200000-0effffff : System RAM
>    022f0000-02c55e9f : Kernel code
>    02c55ea0-02f87fff : Kernel data
>    031f0000-04303f7f : Kernel bss
>
> We see that code, data and bss sections become randomize.
>
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>
> v2:
> - Define weak plat_get_fdt() in relocate.c
> - Add default RELOCATION_TABLE_SIZE for Loongson64
>
>   arch/mips/Kconfig           | 5 ++++-
>   arch/mips/kernel/relocate.c | 7 +++++++
>   2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 0f638bf..44a47ad 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -488,6 +488,7 @@ config MACH_LOONGSON64
>   	select SYS_SUPPORTS_HIGHMEM
>   	select SYS_SUPPORTS_LITTLE_ENDIAN
>   	select SYS_SUPPORTS_ZBOOT
> +	select SYS_SUPPORTS_RELOCATABLE
>   	select ZONE_DMA32
>   	select NUMA
>   	select SMP
> @@ -2778,7 +2779,8 @@ config RELOCATABLE
>   	depends on CPU_MIPS32_R2 || CPU_MIPS64_R2 || \
>   		   CPU_MIPS32_R5 || CPU_MIPS64_R5 || \
>   		   CPU_MIPS32_R6 || CPU_MIPS64_R6 || \
> -		   CPU_P5600 || CAVIUM_OCTEON_SOC
> +		   CPU_P5600 || CAVIUM_OCTEON_SOC || \
> +		   CPU_LOONGSON64
>   	help
>   	  This builds a kernel image that retains relocation information
>   	  so it can be loaded someplace besides the default 1MB.
> @@ -2789,6 +2791,7 @@ config RELOCATION_TABLE_SIZE
>   	hex "Relocation table size"
>   	depends on RELOCATABLE
>   	range 0x0 0x01000000
> +	default "0x00200000" if CPU_LOONGSON64
>   	default "0x00100000"

Not relevant to the patch but how would we now if the reloc table is to 
small?
Is it possible to have a kind of checking script?

Thanks.

- Jiaxun

>   	help
>   	  A table of relocation data will be appended to the kernel binary
> diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
> index 8561c7a..57bdd276 100644
> --- a/arch/mips/kernel/relocate.c
> +++ b/arch/mips/kernel/relocate.c
> @@ -294,6 +294,13 @@ static inline int __init relocation_addr_valid(void *loc_new)
>   	return 1;
>   }
>   
> +#if defined(CONFIG_USE_OF)
> +void __weak *plat_get_fdt(void)
> +{
> +	return NULL;
> +}
> +#endif
> +
>   void *__init relocate_kernel(void)
>   {
>   	void *loc_new;
