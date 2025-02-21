Return-Path: <linux-mips+bounces-7896-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC83A3FD5F
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 18:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAFD43B1333
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 17:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4D324FC07;
	Fri, 21 Feb 2025 17:19:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50C024CEC2;
	Fri, 21 Feb 2025 17:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740158389; cv=none; b=eig1x6EIUbmM4GfsUO/2KhKr7UVj0B9hwYfopDZO2FbZMUUlPQts/zeeOCeE0exH0LwuujnB75UBaY3bRQW44kXG4hAIqDVgroYqd/35K1CxGzPWNcx/i6CSbFtomj7X0ehnVbZQULlCvT9vcIcj0KURrLQsvy5vEwMtWw9JPDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740158389; c=relaxed/simple;
	bh=/DHdgcTv11J19FjTFiLnbR5oX2dg/1u2Cc/F1VKW0yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/SuIVZv1pFbIViGBhkeLRSkSWakBJcn5pHJL6QtOFo1UsW6AYC/kV55Cqxgr0aqpJesbVEboWU56rgFyMtoTdUF6WLFLYdzPaSaMzIKi5LJyGQtxuz3dQh4ql+SXATtiBK+mqlBGq7qWK8CGHTD92u0DwUSlnSu55hT/ysFXlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tlWgj-00028I-00; Fri, 21 Feb 2025 18:19:45 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id DC6B1C0135; Fri, 21 Feb 2025 18:18:32 +0100 (CET)
Date: Fri, 21 Feb 2025 18:18:32 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] mips: dts: ralink: mt7628a: update system
 controller node and its consumers
Message-ID: <Z7i1aDGiHLsOFYyz@alpha.franken.de>
References: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
 <20250120092146.471951-7-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120092146.471951-7-sergio.paracuellos@gmail.com>

On Mon, Jan 20, 2025 at 10:21:46AM +0100, Sergio Paracuellos wrote:
> Current MT7628A device tree file system controller node is wrong since it is
> not matching bindings. Hence, update it to match current bindings updating
> it also to use new introduced clock constants.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  arch/mips/boot/dts/ralink/mt7628a.dtsi | 38 ++++++++++++++++----------
>  1 file changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> index 45a15e005cc4..309966049c56 100644
> --- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> @@ -1,4 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> +#include <dt-bindings/clock/mediatek,mtmips-sysc.h>
>  
>  / {
>  	#address-cells = <1>;
> @@ -16,11 +17,6 @@ cpu@0 {
>  		};
>  	};
>  
> -	resetc: reset-controller {
> -		compatible = "ralink,rt2880-reset";
> -		#reset-cells = <1>;
> -	};
> -
>  	cpuintc: interrupt-controller {
>  		#address-cells = <0>;
>  		#interrupt-cells = <1>;
> @@ -36,9 +32,11 @@ palmbus@10000000 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  
> -		sysc: system-controller@0 {
> -			compatible = "ralink,mt7620a-sysc", "syscon";
> +		sysc: syscon@0 {
> +			compatible = "ralink,mt7628-sysc", "syscon";
>  			reg = <0x0 0x60>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
>  		};
>  
>  		pinmux: pinmux@60 {
> @@ -138,7 +136,7 @@ watchdog: watchdog@100 {
>  			compatible = "mediatek,mt7621-wdt";
>  			reg = <0x100 0x30>;
>  
> -			resets = <&resetc 8>;
> +			resets = <&sysc 8>;
>  			reset-names = "wdt";
>  
>  			interrupt-parent = <&intc>;
> @@ -154,7 +152,7 @@ intc: interrupt-controller@200 {
>  			interrupt-controller;
>  			#interrupt-cells = <1>;
>  
> -			resets = <&resetc 9>;
> +			resets = <&sysc 9>;
>  			reset-names = "intc";
>  
>  			interrupt-parent = <&cpuintc>;
> @@ -190,7 +188,9 @@ spi: spi@b00 {
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinmux_spi_spi>;
>  
> -			resets = <&resetc 18>;
> +			clocks = <&sysc MT76X8_CLK_SPI1>;
> +
> +			resets = <&sysc 18>;
>  			reset-names = "spi";
>  
>  			#address-cells = <1>;
> @@ -206,7 +206,9 @@ i2c: i2c@900 {
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinmux_i2c_i2c>;
>  
> -			resets = <&resetc 16>;
> +			clocks = <&sysc MT76X8_CLK_I2C>;
> +
> +			resets = <&sysc 16>;
>  			reset-names = "i2c";
>  
>  			#address-cells = <1>;
> @@ -222,7 +224,9 @@ uart0: uartlite@c00 {
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinmux_uart0_uart>;
>  
> -			resets = <&resetc 12>;
> +			clocks = <&sysc MT76X8_CLK_UART0>;
> +
> +			resets = <&sysc 12>;
>  			reset-names = "uart0";
>  
>  			interrupt-parent = <&intc>;
> @@ -238,7 +242,9 @@ uart1: uart1@d00 {
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinmux_uart1_uart>;
>  
> -			resets = <&resetc 19>;
> +			clocks = <&sysc MT76X8_CLK_UART1>;
> +
> +			resets = <&sysc 19>;
>  			reset-names = "uart1";
>  
>  			interrupt-parent = <&intc>;
> @@ -254,7 +260,9 @@ uart2: uart2@e00 {
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinmux_uart2_uart>;
>  
> -			resets = <&resetc 20>;
> +			clocks = <&sysc MT76X8_CLK_UART2>;
> +
> +			resets = <&sysc 20>;
>  			reset-names = "uart2";
>  
>  			interrupt-parent = <&intc>;
> @@ -290,6 +298,8 @@ wmac: wmac@10300000 {
>  		compatible = "mediatek,mt7628-wmac";
>  		reg = <0x10300000 0x100000>;
>  
> +		clocks = <&sysc MT76X8_CLK_WMAC>;
> +
>  		interrupt-parent = <&cpuintc>;
>  		interrupts = <6>;
>  
> -- 
> 2.25.1

I get

  DTC     arch/mips/boot/dts/ralink/vocore2.dtb
/local/tbogendoerfer/korg/linux/arch/mips/boot/dts/ralink/mt7628a.dtsi:275.28-284.4: ERROR (phandle_references): /usb-phy@10120000: Reference to non-existent node or label "resetc"

/local/tbogendoerfer/korg/linux/arch/mips/boot/dts/ralink/mt7628a.dtsi:275.28-284.4: ERROR (phandle_references): /usb-phy@10120000: Reference to non-existent node or label "resetc"

ERROR: Input tree has errors, aborting (use -f to force output)

for CONFIG_DTB_VOCORE2=y and a similair failure for CONFIG_DTB_OMEGA2P=y

I'll apply rest of the series, please send a fixed patch for mt7628a

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

