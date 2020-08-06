Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4DE23D77F
	for <lists+linux-mips@lfdr.de>; Thu,  6 Aug 2020 09:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbgHFHj6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Aug 2020 03:39:58 -0400
Received: from relay2.mymailcheap.com ([151.80.165.199]:43182 "EHLO
        relay2.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbgHFHj6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Aug 2020 03:39:58 -0400
X-Greylist: delayed 158672 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Aug 2020 03:39:56 EDT
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id 178FD3EDEC;
        Thu,  6 Aug 2020 09:39:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id E55E52A4ED;
        Thu,  6 Aug 2020 09:39:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596699594;
        bh=SlXr4N5zUZPies1dpF71kmNZ2wAzVghXtvgdGIbGqCk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jDKBCYuyoBCDue2RBgG+yFcraE8CPRAELSyovv86/tbZuNytDsSjpehAESQZl2huy
         jB9kyyBWKCfM060bRZYxHXon04vTJgnjZlRq7dPAoKtw3NL2lxYP3a9WGTNVRQ4/5R
         eVlenrgcJRUOdYl0eZt0wsqr06ULwyxN7iq7RKVY=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bgKOaq43Ym8n; Thu,  6 Aug 2020 09:39:51 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Thu,  6 Aug 2020 09:39:51 +0200 (CEST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 65DCE41330;
        Thu,  6 Aug 2020 07:39:50 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="DWMIC2Gj";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [203.86.239.91])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id CD8D341330;
        Thu,  6 Aug 2020 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596699583;
        bh=SlXr4N5zUZPies1dpF71kmNZ2wAzVghXtvgdGIbGqCk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DWMIC2GjKyHq7fKIhxVxhNiRvhnkrikjJ6A7vhAtH2wN6QXt1wuicbSPTu5i8CxJa
         R2kxxeRTud+K8DTTJ+dFRkKBNlTiZc2U7HOVNjTZAnzsY2cPNvvliubnbEOER2mpbw
         1gGwL11e5HbVrDeMu5Vrctz6RUYPYeruAEy7adtA=
Subject: Re: [PATCH] MIPS: Introduce cmdline argument writecombine=
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1596697741-3561-1-git-send-email-yangtiezhu@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <10e04885-b775-e7db-b927-6400382fd32d@flygoat.com>
Date:   Thu, 6 Aug 2020 15:39:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1596697741-3561-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: 65DCE41330
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
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
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/8/6 下午3:09, Tiezhu Yang 写道:
> Loongson processors have a writecombine issue that maybe failed to
> write back framebuffer used with ATI Radeon or AMD GPU at times,
> after commit 8a08e50cee66 ("drm: Permit video-buffers writecombine
> mapping for MIPS"), there exists some errors such as blurred screen
> and lockup, and so on.
>
> With this patch, disable writecombine by default for Loongson64 to
> work well with ATI Radeon or AMD GPU, and it has no influence on the
> other platforms due to writecombine is enabled by default.
>
> Additionally, if it is necessary, writecombine=on can be set manually
> in the cmdline to enhance the performance for Loongson LS7A integrated
> graphics in the future.
>
> [   60.958721] radeon 0000:03:00.0: ring 0 stalled for more than 10079msec
> [   60.965315] radeon 0000:03:00.0: GPU lockup (current fence id 0x0000000000000112 last fence id 0x000000000000011d on ring 0)
> [   60.976525] radeon 0000:03:00.0: ring 3 stalled for more than 10086msec
> [   60.983156] radeon 0000:03:00.0: GPU lockup (current fence id 0x0000000000000374 last fence id 0x00000000000003a8 on ring 3)
Hi Tiezhu,

Thanks for your patch.
Personally I didn't have any issue with writecombine on my test systems, 
but there
are some complains about unstable graphic card from users. So generally 
a cmdline
writecombine switch is necessary.

>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   arch/mips/include/asm/pgtable.h |  4 ++++
>   arch/mips/kernel/cpu-probe.c    | 19 +++++++++++++++++++
>   2 files changed, 23 insertions(+)
>
> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
> index dd7a0f5..34869f7 100644
> --- a/arch/mips/include/asm/pgtable.h
> +++ b/arch/mips/include/asm/pgtable.h
> @@ -473,6 +473,10 @@ static inline pgprot_t pgprot_noncached(pgprot_t _prot)
>   static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
>   {
>   	unsigned long prot = pgprot_val(_prot);
> +	extern bool mips_writecombine;
> +
> +	if (!mips_writecombine)
> +		return pgprot_noncached(_prot);

You can simply override c->writecombine to _CACHE_UNCACHED in 
cpu-probe.c with
out this kind of hijack.

>   
>   	/* cpu_data[0].writecombine is already shifted by _CACHE_SHIFT */
>   	prot = (prot & ~_CACHE_MASK) | cpu_data[0].writecombine;
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index e2955f1..98777ca 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -459,6 +459,25 @@ static int __init ftlb_disable(char *s)
>   
>   __setup("noftlb", ftlb_disable);
>   
> +#ifdef CONFIG_MACH_LOONGSON64
> +bool mips_writecombine; /* initialise to false by default */
> +#else
> +bool mips_writecombine = true;
> +#endif
> +EXPORT_SYMBOL(mips_writecombine);
There is no need to export this symbol, see comment before.
> +
> +static int __init writecombine_setup(char *str)
> +{
> +	if (strcmp(str, "on") == 0)
> +		mips_writecombine = true;
> +	else if (strcmp(str, "off") == 0)
> +		mips_writecombine = false;
> +
> +	return 1;
> +}
> +
> +__setup("writecombine=", writecombine_setup);

Use early_param here seems more reasonable, it will be probed earlier.

> +
>   /*
>    * Check if the CPU has per tc perf counters
>    */
Thanks

- Jiaxun
