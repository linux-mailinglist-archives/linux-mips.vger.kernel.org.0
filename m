Return-Path: <linux-mips+bounces-2761-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D25C8A4A74
	for <lists+linux-mips@lfdr.de>; Mon, 15 Apr 2024 10:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E74A1C22140
	for <lists+linux-mips@lfdr.de>; Mon, 15 Apr 2024 08:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733C73BBEF;
	Mon, 15 Apr 2024 08:36:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9C23BBEB
	for <linux-mips@vger.kernel.org>; Mon, 15 Apr 2024 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713170167; cv=none; b=IZrhDyrWP8IbTfSUfJepxudtiIWS29dSbkKRJrcgHf0gTm+XU1ezrUskfc9jXNlEBrGFt9i+CBI6uy7QbWJby5Zb5f1djmKh7L3BOaCu3As0sFIZdHWsvMaP29I3o5k7IOXLJ2DER6exSN7FF0/RF7ID/1M1EBbck1qbTstOEbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713170167; c=relaxed/simple;
	bh=cx+lsjyh/sdp7kr55rSduoD8MMgundgTDIANjAYz+yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyKIWYJZAXxCxu6oPuOO6HlYpGpbPh7XWA75LLlsfRXzDjpm990xfChiD7+fN0EfVtxGybEeeY9rxn7ri4puSvxkf0bw9J5ysXUZK3D9vtQgPvB8scEqTognLbG4gEZ9T2zwlfE0Z/4qJ51C6zUB3Jx99PyB5uN3LkHBnkjVpS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rwHob-0004hu-00; Mon, 15 Apr 2024 10:35:49 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B764FC061A; Mon, 15 Apr 2024 10:35:35 +0200 (CEST)
Date: Mon, 15 Apr 2024 10:35:35 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: arnd@arndb.de, linux-mips@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH] MIPS: Add prototypes for plat_post_relocation() and
 relocate_kernel()
Message-ID: <Zhzm19RhWVElRPpL@alpha.franken.de>
References: <20240403-mips-kaslr-missing-prototypes-v1-1-26b2390c1b7a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403-mips-kaslr-missing-prototypes-v1-1-26b2390c1b7a@kernel.org>

On Wed, Apr 03, 2024 at 02:26:33PM -0700, Nathan Chancellor wrote:
> When building malta_defconfig with CONFIG_RELOCATABLE=y, there are two
> warnings due to missing prototypes for functions only used when that
> configuration is enabled:
> 
>   arch/mips/kernel/relocate.c:42:12: warning: no previous prototype for 'plat_post_relocation' [-Wmissing-prototypes]
>      42 | int __weak plat_post_relocation(long offset)
>         |            ^~~~~~~~~~~~~~~~~~~~
>   arch/mips/kernel/relocate.c:324:14: warning: no previous prototype for 'relocate_kernel' [-Wmissing-prototypes]
>     324 | void *__init relocate_kernel(void)
>         |              ^~~~~~~~~~~~~~~
> 
> While relocate_kernel() is only called from assembly, it makes sense to
> keep the prototypes together in C to fix the warnings. Add them to
> silence the warnings.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/mips/include/asm/setup.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/mips/include/asm/setup.h b/arch/mips/include/asm/setup.h
> index 4dce41138bad..d8077136372c 100644
> --- a/arch/mips/include/asm/setup.h
> +++ b/arch/mips/include/asm/setup.h
> @@ -2,6 +2,7 @@
>  #ifndef _MIPS_SETUP_H
>  #define _MIPS_SETUP_H
>  
> +#include <linux/init.h>
>  #include <linux/types.h>
>  #include <uapi/asm/setup.h>
>  
> @@ -29,4 +30,9 @@ extern void per_cpu_trap_init(bool);
>  extern void cpu_cache_init(void);
>  extern void tlb_init(void);
>  
> +#ifdef CONFIG_RELOCATABLE
> +extern void * __init relocate_kernel(void);
> +extern int plat_post_relocation(long);
> +#endif
> +
>  #endif /* __SETUP_H */
> 
> ---
> base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f
> change-id: 20240403-mips-kaslr-missing-prototypes-b15cbf88513f
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

