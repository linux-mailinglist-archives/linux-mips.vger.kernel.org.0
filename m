Return-Path: <linux-mips+bounces-6033-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF8599C9AA
	for <lists+linux-mips@lfdr.de>; Mon, 14 Oct 2024 14:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 618711F22E95
	for <lists+linux-mips@lfdr.de>; Mon, 14 Oct 2024 12:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D230319F419;
	Mon, 14 Oct 2024 12:04:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F9E158853;
	Mon, 14 Oct 2024 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728907481; cv=none; b=DTbGw4tIwCooXNU7YLykb3986JPPeE9QqnDhaqFlIU6nT9hPagnVfRsZScVNk5BXRhzjPYcCD6Afg+c1ZCAPnBARVjm12Thq5KHRseiq1FcOhJyT2DWsjZEnuFrK0yM/95TzY34/iLJLgiOVvEa1uykejRooEr7xsSCnWup7Wg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728907481; c=relaxed/simple;
	bh=fg3fTJ5VYz/p+QTt7x8s+mXKsYLH63g3EFVGYZqcGlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3q10rUXETgqY5GREnulYqZwsMLdURqZ6yIgoSyo5SiOEl8De0bRS22KKqIR0ilXsuMIteNckX/RPUyjZVz8y42EF08oOIrzSb7SrIUfaC8M/78pAtCE71ri4iQt5j+Tlk5GWug6qBNO6SkyAAMgiC+PMEE1ajmX1fKlG2FZ7/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1t0GMH-0005eb-00; Mon, 14 Oct 2024 10:23:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 4F922C0161; Mon, 14 Oct 2024 10:23:09 +0200 (CEST)
Date: Mon, 14 Oct 2024 10:23:09 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	linux-edac@vger.kernel.org, linux-hams@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: Retire Ralf Baechle
Message-ID: <ZwzU7c9qlxxKckGI@alpha.franken.de>
References: <alpine.DEB.2.21.2410131952550.40463@angie.orcam.me.uk>
 <alpine.DEB.2.21.2410132006220.40463@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2410132006220.40463@angie.orcam.me.uk>

On Sun, Oct 13, 2024 at 08:34:44PM +0100, Maciej W. Rozycki wrote:
> Ralf Baechle has been inactive for years now and the linux-mips.org site 
> has gone down.  No replacement contact information is available.  Thomas 
> has been kind enough to step up as a maintainer for EDAC-CAVIUM OCTEON 
> and IOC3 ETHERNET DRIVER.
> 
> Update MAINTAINERS, CREDITS, and .get_maintainer.ignore accordingly.
> 
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> ---
>  .get_maintainer.ignore |    1 +
>  CREDITS                |    5 +++++
>  MAINTAINERS            |   13 +++++--------
>  3 files changed, 11 insertions(+), 8 deletions(-)
> 
> linux-maintainers-ralf.diff
> Index: linux-macro/.get_maintainer.ignore
> ===================================================================
> --- linux-macro.orig/.get_maintainer.ignore
> +++ linux-macro/.get_maintainer.ignore
> @@ -3,3 +3,4 @@ Alan Cox <root@hraefn.swansea.linux.org.
>  Christoph Hellwig <hch@lst.de>
>  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
>  Marc Gonzalez <marc.w.gonzalez@free.fr>
> +Ralf Baechle <ralf@linux-mips.org>
> Index: linux-macro/CREDITS
> ===================================================================
> --- linux-macro.orig/CREDITS
> +++ linux-macro/CREDITS
> @@ -185,6 +185,11 @@ P: 1024/AF7B30C1 CF 97 C2 CC 6D AE A7 FE
>  D: Linux/MIPS port
>  D: Linux/68k hacker
>  D: AX25 maintainer
> +D: EDAC-CAVIUM OCTEON maintainer
> +D: IOC3 ETHERNET DRIVER maintainer
> +D: NETROM NETWORK LAYER maintainer
> +D: ROSE NETWORK LAYER maintainer
> +D: TURBOCHANNEL SUBSYSTEM maintainer
>  S: Hauptstrasse 19
>  S: 79837 St. Blasien
>  S: Germany
> Index: linux-macro/MAINTAINERS
> ===================================================================
> --- linux-macro.orig/MAINTAINERS
> +++ linux-macro/MAINTAINERS
> @@ -8081,10 +8081,10 @@ S:	Maintained
>  F:	drivers/edac/highbank*
>  
>  EDAC-CAVIUM OCTEON
> -M:	Ralf Baechle <ralf@linux-mips.org>
> +M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>  L:	linux-edac@vger.kernel.org
>  L:	linux-mips@vger.kernel.org
> -S:	Supported
> +S:	Maintained
>  F:	drivers/edac/octeon_edac*
>  
>  EDAC-CAVIUM THUNDERX
> @@ -11902,7 +11902,7 @@ F:	Documentation/devicetree/bindings/iio
>  F:	drivers/iio/gyro/mpu3050*
>  
>  IOC3 ETHERNET DRIVER
> -M:	Ralf Baechle <ralf@linux-mips.org>
> +M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>  L:	linux-mips@vger.kernel.org
>  S:	Maintained
>  F:	drivers/net/ethernet/sgi/ioc3-eth.c
> @@ -16043,9 +16043,8 @@ F:	net/netfilter/
>  F:	tools/testing/selftests/net/netfilter/

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

