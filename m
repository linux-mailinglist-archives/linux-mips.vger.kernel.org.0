Return-Path: <linux-mips+bounces-12195-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2545BC4DBBD
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 13:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E955E4F7C00
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 12:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEE4358D39;
	Tue, 11 Nov 2025 12:27:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49E9358D28;
	Tue, 11 Nov 2025 12:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762864047; cv=none; b=JGnrvjTivU83Jv9u58RooNoOFxOCgphw7R7fOnzhKkJ9vL5D245QZJdztE+Vu3jwp3x1OhKNkBW1W2+Pu5H/CL7MEgN50gMVqlHYOgug1fDyGtnTkdthxEU1n/XjaaXprYT1tt/l55M7Ds4qxvOqktYtV2+8XNwql2G2DxbjfBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762864047; c=relaxed/simple;
	bh=yLBDgpfb+ZWlt1wIEutyVTcYIut2GF1MDXmgRtt1ScU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvz2EErHaVuUhnK6TT2yC5MWbdjqyd0kSf7+pkgPgbUwwygrVVlN6R+qL4wqZfaAMdWxIAWoYLD7E+/MvsTTtiN6cyjM5Vg9M/pVTAtrnmKokW9v5OYmx9K/COeMsJ7OfLdJcyaw4tEGta4dVCN4isGBF8mBj2F/uRkLgAgu6nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vInSx-0008Ku-00; Tue, 11 Nov 2025 13:27:19 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 04361C06A7; Tue, 11 Nov 2025 13:08:22 +0100 (CET)
Date: Tue, 11 Nov 2025 13:08:21 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: jd@cjdns.fr, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: dts: econet: fix EN751221 core type
Message-ID: <aRMnNcQw8IZvO5Vm@alpha.franken.de>
References: <20251017180124.67687-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017180124.67687-1-olek2@wp.pl>

On Fri, Oct 17, 2025 at 08:01:19PM +0200, Aleksander Jan Bajkowski wrote:
> In fact, it is a multi-threaded MIPS34Kc, not a single-threaded MIPS24Kc.
> 
> Fixes: 0ec488700972 ("mips: dts: Add EcoNet DTS with EN751221 and SmartFiber XP8421-B board")
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  arch/mips/boot/dts/econet/en751221.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/dts/econet/en751221.dtsi b/arch/mips/boot/dts/econet/en751221.dtsi
> index 66197e73d4f0..2abeef5b744a 100644
> --- a/arch/mips/boot/dts/econet/en751221.dtsi
> +++ b/arch/mips/boot/dts/econet/en751221.dtsi
> @@ -18,7 +18,7 @@ cpus: cpus {
>  
>  		cpu@0 {
>  			device_type = "cpu";
> -			compatible = "mips,mips24KEc";
> +			compatible = "mips,mips34Kc";
>  			reg = <0>;
>  		};
>  	};
> -- 
> 2.47.3

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

