Return-Path: <linux-mips+bounces-8012-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 843C7A479C1
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 11:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53E767A3B18
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 10:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1294522A4CD;
	Thu, 27 Feb 2025 10:04:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDB3225403;
	Thu, 27 Feb 2025 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740650683; cv=none; b=C9uVmAsiloIGZW65OwEABFbtZi9thar6ngW5WTDY2uGxHEGwYo5Uf0AMV0XQl0pqPuJpkkldQA/fnY3ivZmMIJ28sX7zZyRtMuOQE2+DNAqZ02ztNb95XDfmrIec390GXScsOikKOVqJnYEWrEjxN5NxD5PkB8evCg2IghhoBGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740650683; c=relaxed/simple;
	bh=0FsvhXhbJzNL/h3HtkWu5njVBHCG1utuxAv4T2r/eVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fo/BD0vcJxq6WMYj9rbVRRiEqT0bkDiakwsAdJ8Ec2zvOYKucQ9mQ5DSGQ/TlMPY/Jbd3Fm00+vLQU4gANoFjXJ2VkfSV8SqQrsWZwO8ZUN4pv84X6vhyecZLw6bOpGtRDSo981O7R9t8+akCIlRec05pfam1v7dcJnsWs+Lm8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tnakv-0007xe-00; Thu, 27 Feb 2025 11:04:37 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 11E22C0484; Thu, 27 Feb 2025 11:01:08 +0100 (CET)
Date: Thu, 27 Feb 2025 11:01:08 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: WangYuli <wangyuli@uniontech.com>
Cc: chenlinxuan@uniontech.com, guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	macro@orcam.me.uk, niecheng1@uniontech.com, zhanjun@uniontech.com
Subject: Re: [PATCH 5/7] MIPS: dec: Remove dec_irq_dispatch()
Message-ID: <Z8A35FvJSLcoa4BQ@alpha.franken.de>
References: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
 <222468E85948B141+20250218125842.667798-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <222468E85948B141+20250218125842.667798-1-wangyuli@uniontech.com>

On Tue, Feb 18, 2025 at 08:58:42PM +0800, WangYuli wrote:
> Currently, dec_irq_dispatch() is exclusively invoked by int-handler.S.
> Inline the do_IRQ call into int-handler.S to silence the compiler
> warning.
> 
> Fix follow error with gcc-14 when -Werror:
> 
> arch/mips/dec/setup.c:780:25: error: no previous prototype for ‘dec_irq_dispatch’ [-Werror=missing-prototypes]
>   780 | asmlinkage unsigned int dec_irq_dispatch(unsigned int irq)
>       |                         ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[7]: *** [scripts/Makefile.build:207: arch/mips/dec/setup.o] Error 1
> make[6]: *** [scripts/Makefile.build:465: arch/mips/dec] Error 2
> make[5]: *** [scripts/Makefile.build:465: arch/mips] Error 2
> make[5]: *** Waiting for unfinished jobs....
> make[4]: *** [Makefile:1992: .] Error 2
> make[3]: *** [debian/rules:74: build-arch] Error 2
> dpkg-buildpackage: error: make -f debian/rules binary subprocess returned exit status 2
> make[2]: *** [scripts/Makefile.package:126: bindeb-pkg] Error 2
> make[1]: *** [/mnt/83364c87-f5ee-4ae8-b862-930f1bd74feb/Projects/CommitUpstream/LinuxKernel/Temp/linux/Makefile:1625: bindeb-pkg] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
> 
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  arch/mips/dec/int-handler.S | 2 +-
>  arch/mips/dec/setup.c       | 6 ------
>  2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/arch/mips/dec/int-handler.S b/arch/mips/dec/int-handler.S
> index 011d1d678840..a0b439c90488 100644
> --- a/arch/mips/dec/int-handler.S
> +++ b/arch/mips/dec/int-handler.S
> @@ -277,7 +277,7 @@
>  		 srlv	t3,t1,t2
>  
>  handle_it:
> -		j	dec_irq_dispatch
> +		j	do_IRQ
>  		 nop
>  
>  #if defined(CONFIG_32BIT) && defined(CONFIG_MIPS_FP_SUPPORT)
> diff --git a/arch/mips/dec/setup.c b/arch/mips/dec/setup.c
> index 56a7ecf06b7b..6ba4c4973c9a 100644
> --- a/arch/mips/dec/setup.c
> +++ b/arch/mips/dec/setup.c
> @@ -771,9 +771,3 @@ void __init arch_init_irq(void)
>  			pr_err("Failed to register halt interrupt\n");
>  	}
>  }
> -
> -asmlinkage unsigned int dec_irq_dispatch(unsigned int irq)
> -{
> -	do_IRQ(irq);
> -	return 0;
> -}
> -- 
> 2.47.2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

