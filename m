Return-Path: <linux-mips+bounces-7528-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A93A164C7
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 02:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53944164AE4
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 01:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215FC33E7;
	Mon, 20 Jan 2025 01:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="nsfdcC3m"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8273B2F32
	for <linux-mips@vger.kernel.org>; Mon, 20 Jan 2025 01:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737336047; cv=none; b=OgffElprSuo0TNYNhpmo49/SpeQgDKc/6Kd67N36vXR/JpHN0ADBAEu8DBU83T+JVWwDkXvN4XitB6UubN38de13/nGUCZ+d3ADnyz9s+AAT5gJkHOqzbD1W1diab9Vbmjh3ALM1PA6Z1enFnfyAdnZjND0EyzrPewNokNIeb34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737336047; c=relaxed/simple;
	bh=YrZF61om/tFxn2PDVQvPCVpQwpQeAZNXDN8DajmvyE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IKYrofECI1V3xT7UWfGz8Vn1llWFnuEK1ag/wgZF2KS7o7RwZ9ZpQBjfpi7X2JIhrsUbyYWO/6GCvqb70Mgza9oFPsYpoI6lCBkO/6C4cEPWKrglR6DHKpnMDSzEk2D5R0oCXoFg6puzYJwlJypKEHkY8+gJj1nvaIB0aHTvgik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=nsfdcC3m; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 322E82C00BF;
	Mon, 20 Jan 2025 14:20:41 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1737336041;
	bh=RjBDsf8JQ41bWnEiekWtwjCT7pDbQSPdaI6t/ewHAIY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nsfdcC3m4ek+S98UGpYWyaEnkrqPiQoRkPv4/GNoBChb2LnWTgRBLRpXDRE958VcE
	 I+z6jyNqFferbQTyzoHOzDeDooNHFnGSWii5Wr3MtqnIAdFKS4tqBF0cdqfHAL3Ui6
	 Hlt+nLLkcPv1hZHI5c9vwYwtB7T5fFjzCS0vlSR2ZeqAWvxK5YOZIDZMZC+2Sid/8b
	 YS6xgpsvdWG2xD/XEH5TaMM6+fhblJkP5COIHWZubXj+M9i8Sah1LsOKdGp45JtHGM
	 UhlnFwd5M4tNvDCfmecu7CZktLr24J39H8Hota/US1VCKHwtCVypmdulPmfrXh4ide
	 TOacR0L0ow7uA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B678da4e80000>; Mon, 20 Jan 2025 14:20:40 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 0014F13ED5A;
	Mon, 20 Jan 2025 14:20:39 +1300 (NZDT)
Message-ID: <081f0734-086c-4c5a-9d68-5d7735f4cca9@alliedtelesis.co.nz>
Date: Mon, 20 Jan 2025 14:20:39 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/9] mips: dts: realtek: Decouple RTL930x base DTSI
To: Sander Vanheule <sander@svanheule.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250119183424.259353-1-sander@svanheule.net>
 <20250119183424.259353-2-sander@svanheule.net>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20250119183424.259353-2-sander@svanheule.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=678da4e8 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=jU52IrjdAAAA:8 a=iCwdE0GJ44WkcL9GdY4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=udjdHy_fWrGJRxLc5KTh:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Sander

On 20/01/2025 07:34, Sander Vanheule wrote:
> The RTL930x SoC series is sufficiently different to warrant its own base
> dtsi. This ensures no properties need to be deleted or overwritten, and
> prevents accidental inclusions of updates from rtl83xx.dtsi.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>

Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # For RTL9302C

> ---
>   arch/mips/boot/dts/realtek/rtl930x.dtsi | 133 +++++++++++++++---------
>   1 file changed, 83 insertions(+), 50 deletions(-)
>
> diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts/realtek/rtl930x.dtsi
> index 17577457d159..67261d6fcaa7 100644
> --- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
> +++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
> @@ -1,10 +1,23 @@
>   // SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
>   
> -#include "rtl83xx.dtsi"
> -
>   / {
>   	compatible = "realtek,rtl9302-soc";
>   
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +	};
> +
> +	cpuintc: cpuintc {
> +		compatible = "mti,cpu-interrupt-controller";
> +		#address-cells = <0>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +	};
> +
>   	cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
> @@ -58,64 +71,84 @@ i2c1: i2c@388 {
>   			status = "disabled";
>   		};
>   	};
> -};
>   
> -&soc {
> -	ranges = <0x0 0x18000000 0x20000>;
> +	soc: soc@18000000 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x18000000 0x20000>;
>   
> -	intc: interrupt-controller@3000 {
> -		compatible = "realtek,rtl9300-intc", "realtek,rtl-intc";
> -		reg = <0x3000 0x18>, <0x3018 0x18>;
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
> +		intc: interrupt-controller@3000 {
> +			compatible = "realtek,rtl9300-intc", "realtek,rtl-intc";
> +			reg = <0x3000 0x18>, <0x3018 0x18>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
>   
> -		interrupt-parent = <&cpuintc>;
> -		interrupts = <2>, <3>, <4>, <5>, <6>, <7>;
> -	};
> +			interrupt-parent = <&cpuintc>;
> +			interrupts = <2>, <3>, <4>, <5>, <6>, <7>;
> +		};
>   
> -	spi0: spi@1200 {
> -		compatible = "realtek,rtl8380-spi";
> -		reg = <0x1200 0x100>;
> +		spi0: spi@1200 {
> +			compatible = "realtek,rtl8380-spi";
> +			reg = <0x1200 0x100>;
>   
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -	};
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
>   
> -	timer0: timer@3200 {
> -		compatible = "realtek,rtl9302-timer", "realtek,otto-timer";
> -		reg = <0x3200 0x10>, <0x3210 0x10>, <0x3220 0x10>,
> -		    <0x3230 0x10>, <0x3240 0x10>;
> +		timer0: timer@3200 {
> +			compatible = "realtek,rtl9302-timer", "realtek,otto-timer";
> +			reg = <0x3200 0x10>, <0x3210 0x10>, <0x3220 0x10>,
> +			    <0x3230 0x10>, <0x3240 0x10>;
>   
> -		interrupt-parent = <&intc>;
> -		interrupts = <7>, <8>, <9>, <10>, <11>;
> -		clocks = <&lx_clk>;
> -	};
> +			interrupt-parent = <&intc>;
> +			interrupts = <7>, <8>, <9>, <10>, <11>;
> +			clocks = <&lx_clk>;
> +		};
>   
> -	snand: spi@1a400 {
> -		compatible = "realtek,rtl9301-snand";
> -		reg = <0x1a400 0x44>;
> -		interrupt-parent = <&intc>;
> -		interrupts = <19>;
> -		clocks = <&lx_clk>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		status = "disabled";
> -	};
> -};
> +		snand: spi@1a400 {
> +			compatible = "realtek,rtl9301-snand";
> +			reg = <0x1a400 0x44>;
> +			interrupt-parent = <&intc>;
> +			interrupts = <19>;
> +			clocks = <&lx_clk>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
>   
> -&uart0 {
> -	/delete-property/ clock-frequency;
> -	clocks = <&lx_clk>;
> +		uart0: serial@2000 {
> +			compatible = "ns16550a";
> +			reg = <0x2000 0x100>;
>   
> -	interrupt-parent = <&intc>;
> -	interrupts = <30>;
> -};
> +			clocks = <&lx_clk>;
>   
> -&uart1 {
> -	/delete-property/ clock-frequency;
> -	clocks = <&lx_clk>;
> +			interrupt-parent = <&intc>;
> +			interrupts = <30>;
>   
> -	interrupt-parent = <&intc>;
> -	interrupts = <31>;
> -};
> +			reg-io-width = <1>;
> +			reg-shift = <2>;
> +			fifo-size = <1>;
> +			no-loopback-test;
>   
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@2100 {
> +			compatible = "ns16550a";
> +			reg = <0x2100 0x100>;
> +
> +			clocks = <&lx_clk>;
> +
> +			interrupt-parent = <&intc>;
> +			interrupts = <31>;
> +
> +			reg-io-width = <1>;
> +			reg-shift = <2>;
> +			fifo-size = <1>;
> +			no-loopback-test;
> +
> +			status = "disabled";
> +		};
> +	};
> +};

