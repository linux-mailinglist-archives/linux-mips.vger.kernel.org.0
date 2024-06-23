Return-Path: <linux-mips+bounces-3861-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 703179138A1
	for <lists+linux-mips@lfdr.de>; Sun, 23 Jun 2024 09:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2FBE1F223BE
	for <lists+linux-mips@lfdr.de>; Sun, 23 Jun 2024 07:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AE81805E;
	Sun, 23 Jun 2024 07:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/W89Niq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6645B16419;
	Sun, 23 Jun 2024 07:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719126962; cv=none; b=WjbKv4kxdMBfEtFjZ4adTfvECIYExnFQswtflTij7LhCxpcrbWfHuVFK/IuxQ/p+Im/ANy7Z8ij7l5EIU64kFDBBi+1kppuwGUDRu2U1AhnzbENKqSl+l/2WtdaR0GuOTcA7IDwF5qdKBvbLu/RjnvcUYNmj+ZkUwnCp948GyCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719126962; c=relaxed/simple;
	bh=kvi33n7OkM2//Cwxig7e4n0YCswTp6CpYoaVzl3d164=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ETHCqMimzmZ/sO6MeP0bAef/bpsd39QmJsZQQ1tMKu0sn62yzn5VG+uAgoLEJw+GY+dBDNz5yipBU6nKaN/d6y1zsn2umBZZRw0+pfDMQcYx1oMgde54klXnXaiGwL9blyuZp/Wnxv9imhjI1yP7ZwHxY5Iyiv0xh45NM22+R3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/W89Niq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F240C2BD10;
	Sun, 23 Jun 2024 07:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719126961;
	bh=kvi33n7OkM2//Cwxig7e4n0YCswTp6CpYoaVzl3d164=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q/W89NiqGUqdL2Cz6lds2CxXPuIPAVqDQ1S/BT4RUkBFKppETr7SSOAABkozBcoXx
	 Ay43fJxp/TrWu49CEokBlHLnakGwTkig4Ltr8dJ9fIIsKSOVaL2yd4EYFUAzwO7/JA
	 3//5IuN6DtYQNFFTbeh5FoignQ3sVUj3bRpL8/bIjj0wjqcP0v8Iquy+bL9sZ6u93G
	 dd1KXX5fIL3yJhpFoqpcSBVlJMFCnDoqoD4FBtshke+nfKIuWRqUbD0jw2WqLIU2iV
	 aGecwUhSiPL3wRCWT9r3e0Qa5QsG2wsKpJVZM6HwLKAlAb1g2m2DE6j+CHoAUgyFXj
	 8LizBFlB4v3Mg==
Message-ID: <c05da1a1-5d22-449e-874f-80028e2b88ec@kernel.org>
Date: Sun, 23 Jun 2024 09:15:53 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] mips: dts: realtek: Add RTL9302C board
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, tglx@linutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, daniel.lezcano@linaro.org, paulburton@kernel.org,
 peterz@infradead.org, mail@birger-koblitz.de, bert@biot.com,
 john@phrozen.org, sander@svanheule.net
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, kabel@kernel.org, ericwouds@gmail.com
References: <20240621042737.674128-1-chris.packham@alliedtelesis.co.nz>
 <20240621042737.674128-7-chris.packham@alliedtelesis.co.nz>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240621042737.674128-7-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/06/2024 06:27, Chris Packham wrote:
> Add support for the RTL930x SoC and the RTL9302C reference board.
> 
> The RTL930x family of SoCs are Realtek switches with an embedded MIPS
> core (800MHz 34Kc). Most of the peripherals are similar to the RTL838x
> SoC and can make use of many existing drivers.
> 
> Add in full DSA switch support is still a work in progress.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  arch/mips/boot/dts/realtek/Makefile     |  1 +
>  arch/mips/boot/dts/realtek/RTL9302C.dts | 74 +++++++++++++++++++++++
>  arch/mips/boot/dts/realtek/rtl930x.dtsi | 78 +++++++++++++++++++++++++
>  3 files changed, 153 insertions(+)
>  create mode 100644 arch/mips/boot/dts/realtek/RTL9302C.dts
>  create mode 100644 arch/mips/boot/dts/realtek/rtl930x.dtsi
> 
> diff --git a/arch/mips/boot/dts/realtek/Makefile b/arch/mips/boot/dts/realtek/Makefile
> index fba4e93187a6..54dc2d280cd5 100644
> --- a/arch/mips/boot/dts/realtek/Makefile
> +++ b/arch/mips/boot/dts/realtek/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-y	+= cisco_sg220-26.dtb
> +dtb-y	+= RTL9302C.dtb
> diff --git a/arch/mips/boot/dts/realtek/RTL9302C.dts b/arch/mips/boot/dts/realtek/RTL9302C.dts
> new file mode 100644
> index 000000000000..d921067d5006
> --- /dev/null
> +++ b/arch/mips/boot/dts/realtek/RTL9302C.dts
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/dts-v1/;
> +
> +#include "rtl930x.dtsi"
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/thermal/thermal.h>
> +
> +/ {
> +	compatible = "realtek,RTL9302C", "realtek,rtl930x-soc";

Really, this wasn't ever tested.

> +	model = "RTL9302C Development Board";
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x8000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "earlycon";

Drop. earlycon is debugging tool, not a wide-mainline usage configuration.

> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	status = "okay";
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <10000000>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				label = "u-boot";
> +				reg = <0x0 0xe0000>;
> +				read-only;
> +			};
> +			partition@e0000 {
> +				label = "u-boot-env";
> +				reg = <0xe0000 0x10000>;
> +			};
> +			partition@f0000 {
> +				label = "u-boot-env2";
> +				reg = <0xf0000 0x10000>;
> +				read-only;
> +			};
> +			partition@100000 {
> +				label = "jffs";
> +				reg = <0x100000 0x100000>;
> +			};
> +			partition@200000 {
> +				label = "jffs2";
> +				reg = <0x200000 0x100000>;
> +			};
> +			partition@300000 {
> +				label = "runtime";
> +				reg = <0x300000 0xe80000>;
> +			};
> +			partition@1180000 {
> +				label = "runtime2";
> +				reg = <0x1180000 0xe80000>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts/realtek/rtl930x.dtsi
> new file mode 100644
> index 000000000000..5e088c90d2ee
> --- /dev/null
> +++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
> +
> +#include "rtl83xx.dtsi"
> +
> +/ {
> +	compatible = "realtek,rtl930x-soc";
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			compatible = "mips,mips34Kc";
> +			reg = <0>;
> +			clocks = <&baseclk 0>;
> +			clock-names = "cpu";
> +		};
> +	};
> +
> +	baseclk: baseclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <800000000>;
> +	};
> +
> +	lx_clk: lx_clk {

No underscors in node names.

Use recommended clock names, see:
Documentation/devicetree/bindings/clock/fixed-clock.yaml


> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency  = <175000000>;
> +	};
> +};
> +
> +&soc {
> +	intc: interrupt-controller@3000 {
> +		compatible = "realtek,rtl9300-intc", "realtek,rtl-intc";
> +		reg = <0x3000 0x18>, <0x3018 0x18>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		interrupt-parent = <&cpuintc>;
> +		interrupts = <2>, <3>, <4>, <5>, <6>, <7>;
> +	};
> +
> +	spi0: spi@1200 {
> +		compatible = "realtek,rtl8380-spi";
> +		reg = <0x1200 0x100>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +
> +	timer0: timer@3200 {
> +		compatible = "realtek,rtl930x-timer", "realtek,otto-timer";
> +		reg = <0x3200 0x10>, <0x3210 0x10>, <0x3220 0x10>,
> +		    <0x3230 0x10>, <0x3240 0x10>;
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <7 4>, <8 4>, <9 4>, <10 4>, <11 4>;

Are you open-coding IRQ flags?

> +		clocks = <&lx_clk>;
> +	};
> +};
> +
> +&uart0 {
> +	/delete-property/ clock-frequency;
> +	clocks = <&lx_clk>;
> +
> +	interrupt-parent = <&intc>;
> +	interrupts = <30 1>;

Are you open-coding IRQ flags?


> +};
> +
> +&uart1 {
> +	/delete-property/ clock-frequency;
> +	clocks = <&lx_clk>;
> +
> +	interrupt-parent = <&intc>;
> +	interrupts = <31 0>;

Are you open-coding IRQ flags?

> +};
> +

Best regards,
Krzysztof


