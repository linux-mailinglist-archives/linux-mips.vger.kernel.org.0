Return-Path: <linux-mips+bounces-10806-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2B4B3B8C5
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5535817D24E
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CA630BB90;
	Fri, 29 Aug 2025 10:31:24 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFF2308F28;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463484; cv=none; b=odQMkDycrKEuulEAW/7FWJfCr6lw9P3kYh8Ng/YJ2NTYOY+/4a7KzteTDAj7VfoNgoOMRWtmcXtpmFEnN15v80vcA2SKPyERDeVkgos9gsPBRmM+aI0/0jCfwn1fsaJckspWsFiwMuhQYfmQKZnRBC1FRIHi0filqXykboExFt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463484; c=relaxed/simple;
	bh=5p5WJzMjWam2mZ+Jzdrb+nS7rxu+18+BXN1F3zIqdFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Re1piRXUNjof7hk5lMWqJn2qNlWjenRSsWDuCa6efIMvST10vQCT4/bolSOWYYr3PbBMvxhukPGmytF5Jag4YY0pWen1CK6sUnwGEuzN6iwXD8hm0EIiHb3EAM0ka2vDtvj/FsHxq6rHMSOpMx7Gd4rSJHgpykvqrgeC23SMH0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO2-0004Ft-00; Fri, 29 Aug 2025 12:31:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 94711C0BCD; Fri, 29 Aug 2025 12:25:30 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:25:30 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] MIPS: sgi-ip32: Replace deprecated strcpy() in
 plat_mem_setup()
Message-ID: <aLGAGpCK5MKH3e-8@alpha.franken.de>
References: <20250817183728.612012-1-thorsten.blum@linux.dev>
 <20250817183728.612012-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817183728.612012-2-thorsten.blum@linux.dev>

On Sun, Aug 17, 2025 at 08:37:12PM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy() instead.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/sgi-ip32/ip32-setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/sgi-ip32/ip32-setup.c b/arch/mips/sgi-ip32/ip32-setup.c
> index aeb0805aae57..c2ebc4bbd866 100644
> --- a/arch/mips/sgi-ip32/ip32-setup.c
> +++ b/arch/mips/sgi-ip32/ip32-setup.c
> @@ -14,6 +14,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/param.h>
>  #include <linux/sched.h>
> +#include <linux/string.h>
>  
>  #include <asm/bootinfo.h>
>  #include <asm/mipsregs.h>
> @@ -90,7 +91,7 @@ void __init plat_mem_setup(void)
>  			static char options[8] __initdata;
>  			char *baud = ArcGetEnvironmentVariable("dbaud");
>  			if (baud)
> -				strcpy(options, baud);
> +				strscpy(options, baud);
>  			add_preferred_console("ttyS", *(con + 1) == '2' ? 1 : 0,
>  					      baud ? options : NULL);
>  		}
> -- 
> 2.50.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

