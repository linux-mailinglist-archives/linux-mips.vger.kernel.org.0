Return-Path: <linux-mips+bounces-5204-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D3C963F1F
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 10:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45F991C244D8
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 08:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C02018E759;
	Thu, 29 Aug 2024 08:52:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41EC18E76B;
	Thu, 29 Aug 2024 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921548; cv=none; b=OpOmFyTZrEGxjwZ9Drftg85PvMrjkdk8A4rs28zWgFDNk2dDndqp4OJsEZEou6HLn9iUzEBQkbWXuWVljLWsXu2M55gvS1QhY49v8sQB06TZfOnasRmYVnZu+rvXLVZQKOF5YoKTweF5vGiSa7pa1NQC+VEbuR1X55QCftzAMpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921548; c=relaxed/simple;
	bh=OsEAY8FKYxTbNfR1U2jmA5CBcCqYq5otbT6Kd3JNywA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jpsUlmMDeBcvAzev/Gc4GoxD/2PePHKvguGtvIvqdpKjUlAS1duv5rCNzzPbtsiUQeX2PdoezCJXDPbpC0AzvC8zrCrJv27D/HU+f0/ilG/niDUD0WDTqeE1ZVw75NXG8jvwY5JmJ7PQ/kK/xZfKVmYM58mTmme/L16RvihCrwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sjat5-0005mv-00; Thu, 29 Aug 2024 10:52:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id EF03AC014D; Thu, 29 Aug 2024 10:37:29 +0200 (CEST)
Date: Thu, 29 Aug 2024 10:37:29 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Vincent Legoll <vincent.legoll@gmail.com>
Cc: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MIPS: ralink: Fix missing `plat_time_init` prototype
Message-ID: <ZtAzSVE6vnwfWpKt@alpha.franken.de>
References: <20240812131803.16475-1-vincent.legoll@gmail.com>
 <20240812131803.16475-2-vincent.legoll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812131803.16475-2-vincent.legoll@gmail.com>

On Mon, Aug 12, 2024 at 03:17:42PM +0200, Vincent Legoll wrote:
> Fix the following warning:
> 
>   CC      arch/mips/ralink/timer-gic.o
> arch/mips/ralink/timer-gic.c:18:13: warning: no previous prototype for 'plat_time_init' [-Wmissing-prototypes]
>    18 | void __init plat_time_init(void)
>       |             ^~~~~~~~~~~~~~
> 
> Signed-off-by: Vincent Legoll <vincent.legoll@gmail.com>
> ---
>  arch/mips/ralink/timer-gic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/ralink/timer-gic.c b/arch/mips/ralink/timer-gic.c
> index dcf2a44ac51e..926082655a78 100644
> --- a/arch/mips/ralink/timer-gic.c
> +++ b/arch/mips/ralink/timer-gic.c
> @@ -11,6 +11,8 @@
>  #include <linux/of_clk.h>
>  #include <linux/clocksource.h>
>  
> +#include <asm/time.h>
> +
>  #include "common.h"
>  
>  void __init plat_time_init(void)
> -- 
> 2.46.0

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

