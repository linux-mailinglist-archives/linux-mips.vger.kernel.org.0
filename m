Return-Path: <linux-mips+bounces-8803-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6655EA9E135
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 10:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D58E7AB68C
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 08:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342BC25178D;
	Sun, 27 Apr 2025 08:48:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1A925178E;
	Sun, 27 Apr 2025 08:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745743729; cv=none; b=KcJlSMjGhmYSyrXwotRdH1ZD6AmZ+MWBidgBL+8Gt1WyEAHJvNAgN6rik7foozgwv3y//DEwOMV7geBMX51B05HL/2/aTemSIU9YUiJfJRAjG7rKWqkltAxe4L5nfvIsvqtA+xu8zufm02CyfHDvFLFr0QJWdORO7+Qe6Z2N2oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745743729; c=relaxed/simple;
	bh=R/i3UWuvMC8Y8kBqHMrj/K8JCWtfnW6Fo6LEyskQU1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWFdgnYWEAqRSNJfpNCi4NlOVbnuWu1wWDry86ptPT0oK8YDkZTWtMxmSe++ADis9CFiM16SrAIB4Yx1DriDyiFA7kywEqLRHa5L1RpVVT4zK1sZmtrs3kVrPLnkNQBl2xMpBRMLCFo/yE3vACy6P0TbRS81ZnGbylccy7qQWsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u8wse-0007Ks-00; Sun, 27 Apr 2025 09:56:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 4479CC0B2A; Sun, 27 Apr 2025 09:55:58 +0200 (CEST)
Date: Sun, 27 Apr 2025 09:55:58 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: BCM63XX: Replace strcpy() with strscpy() in
 board_prom_init()
Message-ID: <aA3jDmwoeobJRShD@alpha.franken.de>
References: <20250422074257.544016-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422074257.544016-2-thorsten.blum@linux.dev>

On Tue, Apr 22, 2025 at 09:42:55AM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy() instead.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/bcm63xx/boards/board_bcm963xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> index 9cc8fbf218a5..c5617b889b1c 100644
> --- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
> +++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> @@ -764,7 +764,7 @@ void __init board_prom_init(void)
>  			snprintf(cfe_version, 12, "%s", (char *) &cfe[4]);
>  		}
>  	} else {
> -		strcpy(cfe_version, "unknown");
> +		strscpy(cfe_version, "unknown");
>  	}
>  	pr_info("CFE version: %s\n", cfe_version);
>  
> -- 
> 2.49.0

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

