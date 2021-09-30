Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B4941E3FC
	for <lists+linux-mips@lfdr.de>; Fri,  1 Oct 2021 00:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343577AbhI3Wfj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Sep 2021 18:35:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:40480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229759AbhI3Wfi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Sep 2021 18:35:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EA8A61A63;
        Thu, 30 Sep 2021 22:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633041235;
        bh=tbWf3k8o6Kty0/VGLPw0uDkT0kg0hb4J5EzgYuToWmc=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=GtSnQRK3Ce8FJbeaDg7RWU2j2/0kbmNBvabob93GbHbYi/LpE3W7vayp0diJ2wXIK
         JsYCC2Bnm8iITthgMNo49pZ5WBlpX3doVxwspQ8sLLxGvNw5UujcGMCdHBbI5ceJV8
         2nyL1zQ+5eBP8yoMmHvCx9XLFko9UP0BrZnA0xT92M+4maOSJCHYXfaET2UOaGjHkt
         H9VZC8kaZzRRUCxCD8sNcizQ6D0Cel+OLKnQwsoe2M0/D69proYGEPGvCjNEZ4QNUS
         zDF5B+2pxkghqekjhvcy4XdGF5RfO42T8KcNwNcU78MrcLQCqB6Gs931UD7Zlmpk6E
         Z3ptEqupbwLKQ==
Subject: Re: [PATCH] MIPS: Revert "add support for buggy MT7621S core
 detection"
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Strontium <strntydog@gmail.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Felix Fietkau <nbd@nbd.name>
References: <20210930165741.9662-1-ilya.lipnitskiy@gmail.com>
From:   Greg Ungerer <gerg@kernel.org>
Message-ID: <a932d65e-e515-9a6b-c1d8-23ac21049ecd@kernel.org>
Date:   Fri, 1 Oct 2021 08:33:51 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930165741.9662-1-ilya.lipnitskiy@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 1/10/21 2:57 am, Ilya Lipnitskiy wrote:
> This reverts commit 6decd1aad15f56b169217789630a0098b496de0e. CPULAUNCH
> register is not set properly by some bootloaders, causing a regression
> until a bootloader change is made, which is hard if not impossible on
> some embedded devices. Revert the change until a more robust core
> detection mechanism that works on MT7621S routers such as Netgear R6220
> as well as platforms like Digi EX15 can be made.
> 
> Link: https://lore.kernel.org/lkml/4d9e3b39-7caa-d372-5d7b-42dcec36fec7@kernel.org
> Fixes: 6decd1aad15f ("MIPS: add support for buggy MT7621S core detection")
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

Acked-by: Greg Ungerer <gerg@kernel.org>

Thanks Ilya for taking care of this.

Regards
Greg


> ---
>   arch/mips/include/asm/mips-cps.h | 23 +----------------------
>   1 file changed, 1 insertion(+), 22 deletions(-)
> 
> diff --git a/arch/mips/include/asm/mips-cps.h b/arch/mips/include/asm/mips-cps.h
> index 35fb8ee6dd33..fd43d876892e 100644
> --- a/arch/mips/include/asm/mips-cps.h
> +++ b/arch/mips/include/asm/mips-cps.h
> @@ -10,8 +10,6 @@
>   #include <linux/io.h>
>   #include <linux/types.h>
>   
> -#include <asm/mips-boards/launch.h>
> -
>   extern unsigned long __cps_access_bad_size(void)
>   	__compiletime_error("Bad size for CPS accessor");
>   
> @@ -167,30 +165,11 @@ static inline uint64_t mips_cps_cluster_config(unsigned int cluster)
>    */
>   static inline unsigned int mips_cps_numcores(unsigned int cluster)
>   {
> -	unsigned int ncores;
> -
>   	if (!mips_cm_present())
>   		return 0;
>   
>   	/* Add one before masking to handle 0xff indicating no cores */
> -	ncores = (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
> -
> -	if (IS_ENABLED(CONFIG_SOC_MT7621)) {
> -		struct cpulaunch *launch;
> -
> -		/*
> -		 * Ralink MT7621S SoC is single core, but the GCR_CONFIG method
> -		 * always reports 2 cores. Check the second core's LAUNCH_FREADY
> -		 * flag to detect if the second core is missing. This method
> -		 * only works before the core has been started.
> -		 */
> -		launch = (struct cpulaunch *)CKSEG0ADDR(CPULAUNCH);
> -		launch += 2; /* MT7621 has 2 VPEs per core */
> -		if (!(launch->flags & LAUNCH_FREADY))
> -			ncores = 1;
> -	}
> -
> -	return ncores;
> +	return (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
>   }
>   
>   /**
> 
