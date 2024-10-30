Return-Path: <linux-mips+bounces-6555-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AA69B6144
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 12:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D410B21CC6
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 11:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4958A1E3DF7;
	Wed, 30 Oct 2024 11:19:52 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979811990CD;
	Wed, 30 Oct 2024 11:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287192; cv=none; b=rseq0eTB7IIyE4y26Zb0oEWVJxxwJMFv4auKIS+PwjL3vCCKt+sJ82W6WeSI2fhl3HZK6axDJhc9cElE6YG+WxHELDVFZYp5FkSp+Jc33W4jZCIP92qhphXyodMGj6h+gI92wgCzm73ax83SY/ccBwq+lFCAowimLkzuiHjUZhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287192; c=relaxed/simple;
	bh=J18O0GxMj9ROjE63qYqs+Ru3LvII7S0kCIZOzjLSOVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cw+Q9zoL+GpPp/vFoLHq3jbvoj5ox3ruJpKmliK7AYUZRxRCg/RtkoHTNVE25UCWaSMdZNe7C7p33jJfMF3LNiiSCxRgrjnCz+tsl6FpUpBTbIXbyN/pbvO8fidwcFZUv7VMfPAdJIf09gvVwV4S1Y9a4Fopr6EKnfb8hwt0lrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1t66jk-00061X-00; Wed, 30 Oct 2024 12:19:40 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3BDC5C0631; Wed, 30 Oct 2024 12:16:09 +0100 (CET)
Date: Wed, 30 Oct 2024 12:16:09 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: asm: fix warning when disabling MIPS_FP_SUPPORT
Message-ID: <ZyIVeSZpqG1co4z6@alpha.franken.de>
References: <20241012-mips-fcr31-warning-v1-1-bac1d869d775@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012-mips-fcr31-warning-v1-1-bac1d869d775@gmail.com>

On Sat, Oct 12, 2024 at 12:12:14PM +0200, Jonas Gorski wrote:
> When MIPS_FP_SUPPORT is disabled, __sanitize_fcr31() is defined as
> nothing, which triggers a gcc warning:
> 
>     In file included from kernel/sched/core.c:79:
>     kernel/sched/core.c: In function 'context_switch':
>     ./arch/mips/include/asm/switch_to.h:114:39: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
>       114 |                 __sanitize_fcr31(next);                                 \
>           |                                       ^
>     kernel/sched/core.c:5316:9: note: in expansion of macro 'switch_to'
>      5316 |         switch_to(prev, next, prev);
>           |         ^~~~~~~~~
> 
> Fix this by providing an empty body for __sanitize_fcr31() like one is
> defined for __mips_mt_fpaff_switch_to().
> 
> Fixes: 36a498035bd2 ("MIPS: Avoid FCSR sanitization when CONFIG_MIPS_FP_SUPPORT=n")
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
>  arch/mips/include/asm/switch_to.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/switch_to.h b/arch/mips/include/asm/switch_to.h
> index a4374b4cb88fd830f8b83caab52d6e3c133fd0c4..d6ccd53440213315ec75a54caf683c32c69dcdbe 100644
> --- a/arch/mips/include/asm/switch_to.h
> +++ b/arch/mips/include/asm/switch_to.h
> @@ -97,7 +97,7 @@ do {									\
>  	}								\
>  } while (0)
>  #else
> -# define __sanitize_fcr31(next)
> +# define __sanitize_fcr31(next) do { (void) (next); } while (0)
>  #endif
>  
>  /*
> 
> ---
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> change-id: 20241012-mips-fcr31-warning-d4eebcfc91c5

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

