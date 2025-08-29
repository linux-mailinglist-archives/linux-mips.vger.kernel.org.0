Return-Path: <linux-mips+bounces-10817-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1434B3B8DA
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8587F56286B
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E29730E85E;
	Fri, 29 Aug 2025 10:31:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CF83093DB;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463486; cv=none; b=ebBYQtfqnrTsias1GiQisCjkAbG2QYOP4s8wsdkztfSU56VlCi+xwVNV4AXRID7xExxeLck3Qij8R52mIgSgKVFv3OnK/3uLfpCFeoKZQvSKt/s5GAwc9Wb49gBfJ/0pvGrP76XmrVKF36lketPqwIEQ6KOhEERnIoCrZOP7WUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463486; c=relaxed/simple;
	bh=oK1vTC3I1CcIsF3aIfGOa5puBtc8td3Zh60PXSCKEvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4ZG1Azv4PiSifRIP12dyBB078up1YF3xvm10uEy8H+qqHiRiIpdKeMr/ggSCUKBFwo/KrWid0vjhg32V06thfqpBh5tcJ28mwEKNvgPPnWZmEX7w16ZZiuCGVUV1bhEkClLdgYsE0b9Snuug0oSbthLfrn0/V/dWrhqMMXnl1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO2-0004GF-00; Fri, 29 Aug 2025 12:31:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 05BBFC0D9E; Fri, 29 Aug 2025 12:26:32 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:26:32 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] MIPS: octeon: Replace memset(0) + deprecated
 strcpy() with strscpy_pad()
Message-ID: <aLGAWOjB1_nFLbqN@alpha.franken.de>
References: <20250817183728.612012-1-thorsten.blum@linux.dev>
 <20250817183728.612012-6-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817183728.612012-6-thorsten.blum@linux.dev>

On Sun, Aug 17, 2025 at 08:37:16PM +0200, Thorsten Blum wrote:
> Replace memset(0) followed by the deprecated strcpy() with strscpy_pad()
> to improve octeon_fdt_set_phy(). This avoids zeroing the memory before
> copying the string and ensures the destination buffer is only written to
> once, simplifying the code and improving efficiency.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/cavium-octeon/octeon-platform.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/cavium-octeon/octeon-platform.c b/arch/mips/cavium-octeon/octeon-platform.c
> index 5e1dd4e6e82f..47677b5d7ed0 100644
> --- a/arch/mips/cavium-octeon/octeon-platform.c
> +++ b/arch/mips/cavium-octeon/octeon-platform.c
> @@ -13,6 +13,7 @@
>  #include <linux/of_fdt.h>
>  #include <linux/platform_device.h>
>  #include <linux/libfdt.h>
> +#include <linux/string.h>
>  
>  #include <asm/octeon/octeon.h>
>  #include <asm/octeon/cvmx-helper-board.h>
> @@ -538,8 +539,7 @@ static void __init octeon_fdt_set_phy(int eth, int phy_addr)
>  
>  	if (octeon_has_88e1145()) {
>  		fdt_nop_property(initial_boot_params, phy, "marvell,reg-init");
> -		memset(new_name, 0, sizeof(new_name));
> -		strcpy(new_name, "marvell,88e1145");
> +		strscpy_pad(new_name, "marvell,88e1145");
>  		p = fdt_getprop(initial_boot_params, phy, "compatible",
>  				&current_len);
>  		if (p && current_len >= strlen(new_name))
> -- 
> 2.50.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

