Return-Path: <linux-mips+bounces-7884-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8142AA3F05F
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 10:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FAC7189BEA0
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 09:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5F6204597;
	Fri, 21 Feb 2025 09:34:32 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5624C1FFC6A;
	Fri, 21 Feb 2025 09:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130472; cv=none; b=jnx57H2fANLGnIkHzgyS0L6+jhXUkKIJR+nLaq6f091UXXJnXI7XyuRiAPXr8NRnR2wT6RpaszCSnApBN7gpFOxnR5FeaqFNRVtdtlD54hfvh2O7hE1J9OfE9JDxwLH7jjtPdE6tjnpLVu6/O/hxI5D8Vi7JyZMlqMrG2k5ygTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130472; c=relaxed/simple;
	bh=939e4xzWY9ZLhuQx4eXQhu3/rs8cmmlGASKnEn5Mnko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPhC1an85HorLz31dKbu4rtOWl4aCnDKiUlZPGIsoNH91IHzzwOGie/76RR/w42D3GEmnfWmlFLkD0RBK3l/mPL2ByyZifUTAUX0YUY8OzMUsVNDweZ+VDdkeSTyVoPn24AyOYvVwlfBsjYtvylFEjBxAt+Y9/ak2ZEpA0OhuKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tlPQJ-0006BZ-00; Fri, 21 Feb 2025 10:34:19 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5A632C0423; Fri, 21 Feb 2025 10:32:13 +0100 (CET)
Date: Fri, 21 Feb 2025 10:32:13 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] mips: dts: ingenic: Switch to
 simple-audio-card,hp-det-gpios
Message-ID: <Z7hIHToPSDhbZhfE@alpha.franken.de>
References: <7a2884f164a9e088769b6e2f0cf11df6ce184514.1738752640.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a2884f164a9e088769b6e2f0cf11df6ce184514.1738752640.git.geert+renesas@glider.be>

On Wed, Feb 05, 2025 at 11:54:47AM +0100, Geert Uytterhoeven wrote:
> Replace the deprecated "simple-audio-card,hp-det-gpio" property by
> "simple-audio-card,hp-det-gpios" in Simple Audio Card device nodes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
> v2:
>   - Add Reviewed-by.
> ---
>  arch/mips/boot/dts/ingenic/gcw0.dts | 2 +-
>  arch/mips/boot/dts/ingenic/rs90.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts b/arch/mips/boot/dts/ingenic/gcw0.dts
> index 5d33f26fd28c8bd8..8455778928b71cee 100644
> --- a/arch/mips/boot/dts/ingenic/gcw0.dts
> +++ b/arch/mips/boot/dts/ingenic/gcw0.dts
> @@ -91,7 +91,7 @@ sound {
>  			"MIC1N", "Built-in Mic";
>  		simple-audio-card,pin-switches = "Speaker", "Headphones";
>  
> -		simple-audio-card,hp-det-gpio = <&gpf 21 GPIO_ACTIVE_LOW>;
> +		simple-audio-card,hp-det-gpios = <&gpf 21 GPIO_ACTIVE_LOW>;
>  		simple-audio-card,aux-devs = <&speaker_amp>, <&headphones_amp>;
>  
>  		simple-audio-card,bitclock-master = <&dai_codec>;
> diff --git a/arch/mips/boot/dts/ingenic/rs90.dts b/arch/mips/boot/dts/ingenic/rs90.dts
> index e8df70dd42bf8e4c..6d2c8aea5f499d34 100644
> --- a/arch/mips/boot/dts/ingenic/rs90.dts
> +++ b/arch/mips/boot/dts/ingenic/rs90.dts
> @@ -148,7 +148,7 @@ sound {
>  			"Speaker", "OUTR";
>  		simple-audio-card,pin-switches = "Speaker";
>  
> -		simple-audio-card,hp-det-gpio = <&gpd 16 GPIO_ACTIVE_LOW>;
> +		simple-audio-card,hp-det-gpios = <&gpd 16 GPIO_ACTIVE_LOW>;
>  		simple-audio-card,aux-devs = <&amp>;
>  
>  		simple-audio-card,bitclock-master = <&dai_codec>;
> -- 
> 2.43.0

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

