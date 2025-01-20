Return-Path: <linux-mips+bounces-7531-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EECA164D9
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 02:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66191165937
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 01:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2B67483;
	Mon, 20 Jan 2025 01:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Gx28zaYH"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6507BBE65
	for <linux-mips@vger.kernel.org>; Mon, 20 Jan 2025 01:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737336211; cv=none; b=DKF7CtaLi/9zdyru/IoD2QekPxaeDnlDEBcX/Uy08Uiuj9kx85UDS4PxWqVkww9Jie1qYskiKirsjEmT9GHLjqYK6+cTLB3ggxuzedfU7KNzQNEMjYWMS5X8fXFJ8yYUSd5lzOVd3+lcI4XonxEV36J6Tt6BXp14OOvXH1lLFtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737336211; c=relaxed/simple;
	bh=w/9+R+A3dZZMP8Ji0q53XjiaUgkcMHKaAaHjnHwWw+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lmREhmNbC2Bmys9fZdAen1z8o+XPUqzmUzpU3qk/tYEflW3Tk0XYUpxmy7+HzaZWSjCjiw+soQRJqzj137nCyi2zBoxzdtOCDjlrhOLc9NJOt7oaGOo6xhFgWjP7iMchBpXdRzouXPJTZZSSQz1sHlUi34+CY4Zkofx2pGJgSis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Gx28zaYH; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8E52D2C00BF;
	Mon, 20 Jan 2025 14:23:26 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1737336206;
	bh=dT7vK7vCH84/4+7kyAUtI6jLTq44qYXOy01AAXA415k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gx28zaYHjAcwNjfBt3Fo972zq5zl7ow7rIRIPgTTHsMtcrRi8PSroMmViwAVXZkEg
	 aT71TntISABh1B+g1P0GwF+BUfLEIfdnQ3MGEex2cPZhZdlxFRGlI4xSGhnU0QkyZo
	 aQBfoQlOnLGfQozsDuCSWS3xFOvqny0+BXrH2YZrH00rkhoi88Pdq2OQSjCHYO8wm+
	 uLyzYc/X+jnjaqK0P9Bszj1aE+avD6BghW2f2uZx4Zct9sqZ26cAbzRFFzr6jGc1KU
	 Z/m479gvh4Kn5ulsKsJOFOG3+F0pqLsfNlRO4Zu2zjkNUEtGmh3xrPShujVyXRWnz9
	 xe1BM1n5AUkdA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B678da58e0000>; Mon, 20 Jan 2025 14:23:26 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 316B913ED5A;
	Mon, 20 Jan 2025 14:23:26 +1300 (NZDT)
Message-ID: <8d5f5d4b-4b70-405f-9111-edcd28ee0395@alliedtelesis.co.nz>
Date: Mon, 20 Jan 2025 14:23:26 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 4/9] mips: dts: realtek: Fold rtl83xx into rtl838x
To: Sander Vanheule <sander@svanheule.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250119183424.259353-1-sander@svanheule.net>
 <20250119183424.259353-5-sander@svanheule.net>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20250119183424.259353-5-sander@svanheule.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=678da58e a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=jU52IrjdAAAA:8 a=LxuNzVeYt8EW_ZCwuS8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=udjdHy_fWrGJRxLc5KTh:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat


On 20/01/2025 07:34, Sander Vanheule wrote:
> rtl83xx.dtsi was once (presumably) created as a base for both RTL838x
> and RTL839x SoCs. Both SoCs have a different CPU and the peripherals
> require different compatibles. Fold rtl83xx.dtsi into rtl838x.dtsi,
> currently only supporting RTL838x SoCs, and create the RTL839x base
> include later when required.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>   arch/mips/boot/dts/realtek/cisco_sg220-26.dts |  1 -
>   arch/mips/boot/dts/realtek/rtl838x.dtsi       | 56 ++++++++++++++++++
>   arch/mips/boot/dts/realtek/rtl83xx.dtsi       | 59 -------------------
>   3 files changed, 56 insertions(+), 60 deletions(-)
>   delete mode 100644 arch/mips/boot/dts/realtek/rtl83xx.dtsi
>
> diff --git a/arch/mips/boot/dts/realtek/cisco_sg220-26.dts b/arch/mips/boot/dts/realtek/cisco_sg220-26.dts
> index 1cdbb09297ef..cb85d172a1d3 100644
> --- a/arch/mips/boot/dts/realtek/cisco_sg220-26.dts
> +++ b/arch/mips/boot/dts/realtek/cisco_sg220-26.dts
> @@ -2,7 +2,6 @@
>   
>   /dts-v1/;
>   
> -#include "rtl83xx.dtsi"
>   #include "rtl838x.dtsi"
>   
>   / {
> diff --git a/arch/mips/boot/dts/realtek/rtl838x.dtsi b/arch/mips/boot/dts/realtek/rtl838x.dtsi
> index d2c6baabb38c..907449094536 100644
> --- a/arch/mips/boot/dts/realtek/rtl838x.dtsi
> +++ b/arch/mips/boot/dts/realtek/rtl838x.dtsi
> @@ -1,6 +1,14 @@
>   // SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
>   
>   / {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +	};
> +
>   	cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
> @@ -18,4 +26,52 @@ baseclk: baseclk {
>   		#clock-cells = <0>;
>   		clock-frequency = <500000000>;
>   	};
> +
> +	cpuintc: cpuintc {
> +		compatible = "mti,cpu-interrupt-controller";
> +		#address-cells = <0>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +	};
> +
> +	soc@18000000 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x18000000 0x10000>;
> +
> +		uart0: serial@2000 {
> +			compatible = "ns16550a";
> +			reg = <0x2000 0x100>;
> +
> +			clock-frequency = <200000000>;
> +
> +			interrupt-parent = <&cpuintc>;
> +			interrupts = <31>;
> +
> +			reg-io-width = <1>;
> +			reg-shift = <2>;
> +			fifo-size = <1>;
> +			no-loopback-test;
> +
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@2100 {
> +			compatible = "ns16550a";
> +			reg = <0x2100 0x100>;
> +
> +			clock-frequency = <200000000>;
> +
> +			interrupt-parent = <&cpuintc>;
> +			interrupts = <30>;
> +
> +			reg-io-width = <1>;
> +			reg-shift = <2>;
> +			fifo-size = <1>;
> +			no-loopback-test;
> +
> +			status = "disabled";
> +		};
> +	};
>   };
> diff --git a/arch/mips/boot/dts/realtek/rtl83xx.dtsi b/arch/mips/boot/dts/realtek/rtl83xx.dtsi
> deleted file mode 100644
> index 1039cb50c7da..000000000000
> --- a/arch/mips/boot/dts/realtek/rtl83xx.dtsi
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
> -
> -/ {
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -
> -	aliases {
> -		serial0 = &uart0;
> -		serial1 = &uart1;
> -	};
> -
> -	cpuintc: cpuintc {
> -		compatible = "mti,cpu-interrupt-controller";
> -		#address-cells = <0>;
> -		#interrupt-cells = <1>;
> -		interrupt-controller;
> -	};
> -
> -	soc@18000000 {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges = <0x0 0x18000000 0x10000>;
> -
> -		uart0: serial@2000 {
> -			compatible = "ns16550a";
> -			reg = <0x2000 0x100>;
> -
> -			clock-frequency = <200000000>;
> -
> -			interrupt-parent = <&cpuintc>;
> -			interrupts = <31>;
> -
> -			reg-io-width = <1>;
> -			reg-shift = <2>;
> -			fifo-size = <1>;
> -			no-loopback-test;
> -
> -			status = "disabled";
> -		};
> -
> -		uart1: serial@2100 {
> -			compatible = "ns16550a";
> -			reg = <0x2100 0x100>;
> -
> -			clock-frequency = <200000000>;
> -
> -			interrupt-parent = <&cpuintc>;
> -			interrupts = <30>;
> -
> -			reg-io-width = <1>;
> -			reg-shift = <2>;
> -			fifo-size = <1>;
> -			no-loopback-test;
> -
> -			status = "disabled";
> -		};
> -	};
> -};

