Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557562AD6C7
	for <lists+linux-mips@lfdr.de>; Tue, 10 Nov 2020 13:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729183AbgKJMsW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Nov 2020 07:48:22 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:35796 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgKJMsV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Nov 2020 07:48:21 -0500
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 9B6453A4132
        for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2020 12:31:58 +0000 (UTC)
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9996D200003;
        Tue, 10 Nov 2020 12:31:35 +0000 (UTC)
Date:   Tue, 10 Nov 2020 13:31:35 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen.Hegelund@microchip.com
Subject: Re: [PATCH v2 5/9] MIPS: mscc: Add luton dtsi
Message-ID: <20201110123135.GH1769536@piout.net>
References: <20201110114508.1197652-1-gregory.clement@bootlin.com>
 <20201110114508.1197652-6-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110114508.1197652-6-gregory.clement@bootlin.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/11/2020 12:45:04+0100, Gregory CLEMENT wrote:
> Add a device tree include file for the Microsemi Luton SoC which
> belongs to same family of the Ocelot SoC.
> 
> It is based on the work of Lars Povlsen <lars.povlsen@microchip.com>.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  arch/mips/boot/dts/mscc/luton.dtsi | 116 +++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 arch/mips/boot/dts/mscc/luton.dtsi
> 
> diff --git a/arch/mips/boot/dts/mscc/luton.dtsi b/arch/mips/boot/dts/mscc/luton.dtsi
> new file mode 100644
> index 000000000000..2a170b84c5a9
> --- /dev/null
> +++ b/arch/mips/boot/dts/mscc/luton.dtsi
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020 Microsemi Corporation */
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "mscc,luton";
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			compatible = "mips,mips24KEc";
> +			device_type = "cpu";
> +			clocks = <&cpu_clk>;
> +			reg = <0>;
> +		};
> +	};
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	cpuintc: interrupt-controller {
> +		#address-cells = <0>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		compatible = "mti,cpu-interrupt-controller";
> +	};
> +
> +	cpu_clk: cpu-clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <416666666>;
> +	};
> +
> +	ahb_clk: ahb-clk {
> +		compatible = "fixed-factor-clock";
> +		#clock-cells = <0>;
> +		clocks = <&cpu_clk>;
> +		clock-div = <2>;
> +		clock-mult = <1>;
> +	};
> +
> +	ahb@60000000 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0x60000000 0x20000000>;
> +
> +		interrupt-parent = <&intc>;
> +
> +		cpu_ctrl: syscon@10000000 {
> +			compatible = "mscc,ocelot-cpu-syscon", "syscon";
> +			reg = <0x10000000 0x2c>;
> +		};
> +
> +		intc: interrupt-controller@10000084 {
> +			compatible = "mscc,luton-icpu-intr";
> +			reg = <0x10000084 0x70>;
> +			#interrupt-cells = <1>;
> +			interrupt-controller;
> +			interrupt-parent = <&cpuintc>;
> +			interrupts = <2>;
> +		};
> +
> +		uart0: serial@10100000 {
> +			pinctrl-0 = <&uart_pins>;
> +			pinctrl-names = "default";
> +			compatible = "ns16550a";
> +			reg = <0x10100000 0x20>;
> +			interrupts = <6>;
> +			clocks = <&ahb_clk>;
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
> +
> +			status = "disabled";
> +		};
> +
> +		i2c0: i2c@10100400 {
> +			compatible = "mscc,ocelot-i2c", "snps,designware-i2c";
> +			pinctrl-0 = <&i2c_pins>;
> +			pinctrl-names = "default";
> +			reg = <0x10100400 0x100>, <0x100002a4 0x8>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <11>;
> +			clocks = <&ahb_clk>;
> +
> +			status = "disabled";
> +		};
> +
> +		gpio: pinctrl@70068 {
> +			compatible = "mscc,luton-pinctrl";
> +			reg = <0x70068 0x28>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&gpio 0 0 32>;
> +			interrupt-controller;
> +			interrupts = <13>;
> +			#interrupt-cells = <2>;
> +
> +			i2c_pins: i2c-pins {
> +				pins = "GPIO_5", "GPIO_6";
> +				function = "twi";
> +			};
> +
> +			uart_pins: uart-pins {
> +				pins = "GPIO_30", "GPIO_31";
> +				function = "uart";
> +			};
> +
> +		};
> +	};
> +};
> -- 
> 2.28.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
