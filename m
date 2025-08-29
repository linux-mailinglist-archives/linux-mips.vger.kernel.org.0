Return-Path: <linux-mips+bounces-10812-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9F8B3B8CE
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 738D11C8625B
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9BF30C62D;
	Fri, 29 Aug 2025 10:31:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0CC3090F5;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463485; cv=none; b=XdMkWxv1O2Afh/5CiuJKkjc9Spg5FZSBDD7sxS32K5wNa+CwrE9euswHkSCEgvVJl5wCG+8vV/p/Q4WF9SruY2LIIfldYcqYlZOP1yBee7n3AN0uoFKGWAuUypW/OLaBROnQF5OwEJMI709O34+EYlyjCvS2yq4x+RrlsJNmLfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463485; c=relaxed/simple;
	bh=Cpial3Non0T0RnStQ1s2F7DK4+A/XB5gDN5G+WWdJ6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arMfdW67hPCYEzKQGnXfwto342u5SH3AOlrga/Sb6uyu2BADORmkmUbXcDHF7G1G9Q2KZgsWeSJ5N6ifyEkK18sSqvPA0rYigsBXv5I/6e35kuUrKr/Z/vOgUpfAtCbywV6HEdI7FNdvq4oNCehWYDCIlzbLHXVf6Ul0+XOL/XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO2-0004G0-00; Fri, 29 Aug 2025 12:31:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 79D50C0D64; Fri, 29 Aug 2025 12:25:44 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:25:44 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] MIPS: sni: Replace deprecated strcpy() in
 sni_console_setup()
Message-ID: <aLGAKCeTQBxV16Ns@alpha.franken.de>
References: <20250817183728.612012-1-thorsten.blum@linux.dev>
 <20250817183728.612012-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817183728.612012-3-thorsten.blum@linux.dev>

On Sun, Aug 17, 2025 at 08:37:13PM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy() instead.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/sni/setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/sni/setup.c b/arch/mips/sni/setup.c
> index 03cb69937258..fc7da12284f5 100644
> --- a/arch/mips/sni/setup.c
> +++ b/arch/mips/sni/setup.c
> @@ -13,6 +13,7 @@
>  #include <linux/export.h>
>  #include <linux/console.h>
>  #include <linux/screen_info.h>
> +#include <linux/string.h>
>  
>  #ifdef CONFIG_FW_ARC
>  #include <asm/fw/arc/types.h>
> @@ -80,7 +81,7 @@ static void __init sni_console_setup(void)
>  			break;
>  		}
>  		if (baud)
> -			strcpy(options, baud);
> +			strscpy(options, baud);
>  		if (strncmp(cdev, "tty552", 6) == 0)
>  			add_preferred_console("ttyS", port,
>  					      baud ? options : NULL);
> -- 
> 2.50.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

