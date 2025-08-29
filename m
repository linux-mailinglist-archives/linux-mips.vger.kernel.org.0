Return-Path: <linux-mips+bounces-10815-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A133B3B8DC
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D9793B6C44
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C56430E0F6;
	Fri, 29 Aug 2025 10:31:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26ED3093D3;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463486; cv=none; b=tCJZl5ll3XeCGfjSgsfaCA1GPJ/L3wou5m8WKEo2OFlSD6VHPpZNEk6rgEZo6W7ZspGq5Bx4EnnAZnRucvLprGPRj8XSwHZWwWzjjnwJ2b6NbaiT65WSMZ0EDktvtJU+U3exGC0lXquqFvjd3J2IFgB1caONrYt/7ubo3i+4Poo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463486; c=relaxed/simple;
	bh=x0DcpxoaJzC3eABj+pJYwVsNbp9ziU6/CfwsIAiA+d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyCoqUdbYQNT35wzaahSujCRtxjq9ux4whMC9mVOVcmU1Dd5sLj2EODecO1qYnNrBcKpFxiiRrpvd7n5pEkIrvv4bXeWegPd4dF0VVInl+ULaN6vjvuzwvlaPiNu38wYI+hhXLcbDZWoF44zCAwAeg+hKrMV4HIIOSlZjjmdpg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO1-0004Fc-00; Fri, 29 Aug 2025 12:31:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D3433C0965; Fri, 29 Aug 2025 12:23:24 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:23:24 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: lantiq: danube: add missing properties to cpu node
Message-ID: <aLF_nDfoiQ76Yqrj@alpha.franken.de>
References: <20250811115818.735670-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811115818.735670-1-olek2@wp.pl>

On Mon, Aug 11, 2025 at 01:58:15PM +0200, Aleksander Jan Bajkowski wrote:
> This fixes the following warnings:
> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cpus: '#address-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/cpus.yaml#
> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cpus: '#size-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/cpus.yaml#
> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cpu@0 (mips,mips24Kc): 'reg' is a required property
> 	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  arch/mips/boot/dts/lantiq/danube.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/lantiq/danube.dtsi b/arch/mips/boot/dts/lantiq/danube.dtsi
> index 7a7ba66aa534..0a942bc09143 100644
> --- a/arch/mips/boot/dts/lantiq/danube.dtsi
> +++ b/arch/mips/boot/dts/lantiq/danube.dtsi
> @@ -5,8 +5,12 @@ / {
>  	compatible = "lantiq,xway", "lantiq,danube";
>  
>  	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>  		cpu@0 {
>  			compatible = "mips,mips24Kc";
> +			reg = <0>;
>  		};
>  	};
>  
> -- 
> 2.47.2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

