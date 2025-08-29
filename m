Return-Path: <linux-mips+bounces-10822-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F988B3B8E4
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92819A06AEB
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95CFD3101D0;
	Fri, 29 Aug 2025 10:31:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8673093C6;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463487; cv=none; b=BY4JryNg/K6vePxUPAW/IRRlBW30LFrfJRHW83u1+KhyT0QQH+wJAU6RhQnZ7/rEvmCYQXr0p7C0CKx91mKvgMLMLe8iFTN4pMJe0CXl2W3d5yPyFoWD5AD1GTHx0qEOyDLt5iq4e2B9Pd5/owp6LRTytq7va+1Cg87N9OjIVo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463487; c=relaxed/simple;
	bh=9zaR7hmeHGzMTBLDpcgrDcO8nHvXWelEcyIRRcN0gHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6R9fHbsqIhlwaXTlLtTAwJyMzjmlvIHj0h7jHHczZmC5nY4vykZSk53cdKcV3KDi00QlOH2+9XXGMN7LzDcpqg2B3Q/XsBH6V5F7FIfPOYFRWI8Km/xWaQ2lZoVTpJwws1YkNI6Irz1guP10/BKXqYdfAnGJt368C+z2viFIxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO2-0004G4-00; Fri, 29 Aug 2025 12:31:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 31C33C0D9E; Fri, 29 Aug 2025 12:27:10 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:27:10 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	UNGLinuxDriver@microchip.com, Paul Burton <paulburton@kernel.org>,
	linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] MIPS: generic: Replace deprecated strcpy() in
 ocelot_detect()
Message-ID: <aLGAfj_22Sr0j8Yh@alpha.franken.de>
References: <20250817183728.612012-1-thorsten.blum@linux.dev>
 <20250817183728.612012-8-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817183728.612012-8-thorsten.blum@linux.dev>

On Sun, Aug 17, 2025 at 08:37:18PM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy() instead.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/generic/board-ocelot.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/generic/board-ocelot.c b/arch/mips/generic/board-ocelot.c
> index 7115410acb4f..59a0fb243582 100644
> --- a/arch/mips/generic/board-ocelot.c
> +++ b/arch/mips/generic/board-ocelot.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (c) 2017 Microsemi Corporation
>   */
> +#include <linux/string.h>
>  #include <asm/machine.h>
>  #include <asm/prom.h>
>  
> @@ -41,7 +42,7 @@ static __init bool ocelot_detect(void)
>  
>  		if (prom_argc > 1 && strlen(prom_argv[1]) > 0)
>  			/* ignore all built-in args if any f/w args given */
> -			strcpy(arcs_cmdline, prom_argv[1]);
> +			strscpy(arcs_cmdline, prom_argv[1]);
>  	}
>  
>  	return true;
> -- 
> 2.50.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

