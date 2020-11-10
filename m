Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19C742AD652
	for <lists+linux-mips@lfdr.de>; Tue, 10 Nov 2020 13:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730108AbgKJMd6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Nov 2020 07:33:58 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:60735 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730285AbgKJMd5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Nov 2020 07:33:57 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E064D24000B;
        Tue, 10 Nov 2020 12:33:52 +0000 (UTC)
Date:   Tue, 10 Nov 2020 13:33:52 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen.Hegelund@microchip.com
Subject: Re: [PATCH v2 8/9] MIPS: mscc: Add jaguar2 support
Message-ID: <20201110123352.GL1769536@piout.net>
References: <20201110114508.1197652-1-gregory.clement@bootlin.com>
 <20201110114508.1197652-9-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110114508.1197652-9-gregory.clement@bootlin.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/11/2020 12:45:07+0100, Gregory CLEMENT wrote:
> Add a device trees and FIT image support for the Microsemi Jaguar2 SoC
> which belongs to same family of the Ocelot SoC.
> 
> It is based on the work of Lars Povlsen <lars.povlsen@microchip.com>.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  arch/mips/boot/dts/mscc/Makefile            |   3 +
>  arch/mips/boot/dts/mscc/jaguar2.dtsi        | 167 ++++++++++++
>  arch/mips/boot/dts/mscc/jaguar2_common.dtsi |  25 ++
>  arch/mips/boot/dts/mscc/jaguar2_pcb110.dts  | 267 ++++++++++++++++++++
>  arch/mips/boot/dts/mscc/jaguar2_pcb111.dts  | 107 ++++++++
>  arch/mips/boot/dts/mscc/jaguar2_pcb118.dts  |  57 +++++
>  arch/mips/generic/Kconfig                   |   8 +
>  arch/mips/generic/Platform                  |   1 +
>  arch/mips/generic/board-jaguar2.its.S       |  40 +++
>  9 files changed, 675 insertions(+)
>  create mode 100644 arch/mips/boot/dts/mscc/jaguar2.dtsi
>  create mode 100644 arch/mips/boot/dts/mscc/jaguar2_common.dtsi
>  create mode 100644 arch/mips/boot/dts/mscc/jaguar2_pcb110.dts
>  create mode 100644 arch/mips/boot/dts/mscc/jaguar2_pcb111.dts
>  create mode 100644 arch/mips/boot/dts/mscc/jaguar2_pcb118.dts
>  create mode 100644 arch/mips/generic/board-jaguar2.its.S
> 
> diff --git a/arch/mips/boot/dts/mscc/Makefile b/arch/mips/boot/dts/mscc/Makefile
> index 40699b44ed50..befda72ceb26 100644
> --- a/arch/mips/boot/dts/mscc/Makefile
> +++ b/arch/mips/boot/dts/mscc/Makefile
> @@ -1,5 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  dtb-$(CONFIG_SOC_VCOREIII)	+= \
> +	jaguar2_pcb110.dtb \
> +	jaguar2_pcb111.dtb \
> +	jaguar2_pcb118.dtb \
>  	luton_pcb091.dtb \
>  	ocelot_pcb120.dtb \
>  	ocelot_pcb123.dtb
> diff --git a/arch/mips/boot/dts/mscc/jaguar2.dtsi b/arch/mips/boot/dts/mscc/jaguar2.dtsi
> new file mode 100644
> index 000000000000..42b2b0a51ddc
> --- /dev/null
> +++ b/arch/mips/boot/dts/mscc/jaguar2.dtsi
> @@ -0,0 +1,167 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2020 Microsemi Corporation
> + */
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "mscc,jr2";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart2;
> +		gpio0 = &gpio;
> +	};
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
> +		clock-frequency = <500000000>;
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
> +	ahb: ahb {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		interrupt-parent = <&intc>;
> +
> +		cpu_ctrl: syscon@70000000 {
> +			compatible = "mscc,ocelot-cpu-syscon", "syscon";
> +			reg = <0x70000000 0x2c>;
> +		};
> +
> +		intc: interrupt-controller@70000070 {
> +			compatible = "mscc,jaguar2-icpu-intr";
> +			reg = <0x70000070 0x94>;
> +			#interrupt-cells = <1>;
> +			interrupt-controller;
> +			interrupt-parent = <&cpuintc>;
> +			interrupts = <2>;
> +		};
> +
> +		uart0: serial@70100000 {
> +			pinctrl-0 = <&uart_pins>;
> +			pinctrl-names = "default";
> +			compatible = "ns16550a";
> +			reg = <0x70100000 0x20>;
> +			interrupts = <6>;
> +			clocks = <&ahb_clk>;
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
> +
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@70100800 {
> +			pinctrl-0 = <&uart2_pins>;
> +			pinctrl-names = "default";
> +			compatible = "ns16550a";
> +			reg = <0x70100800 0x20>;
> +			interrupts = <7>;
> +			clocks = <&ahb_clk>;
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
> +
> +			status = "disabled";
> +		};
> +
> +		gpio: pinctrl@71010038 {
> +			compatible = "mscc,jaguar2-pinctrl";
> +			reg = <0x71010038 0x90>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&gpio 0 0 64>;
> +
> +			uart_pins: uart-pins {
> +				pins = "GPIO_10", "GPIO_11";
> +				function = "uart";
> +			};
> +
> +			uart2_pins: uart2-pins {
> +				pins = "GPIO_24", "GPIO_25";
> +				function = "uart2";
> +			};
> +
> +			cs1_pins: cs1-pins {
> +				pins = "GPIO_16";
> +				function = "si";
> +			};
> +
> +			cs2_pins: cs2-pins {
> +				pins = "GPIO_17";
> +				function = "si";
> +			};
> +
> +			cs3_pins: cs3-pins {
> +				pins = "GPIO_18";
> +				function = "si";
> +			};
> +
> +			i2c_pins: i2c-pins {
> +				pins = "GPIO_14", "GPIO_15";
> +				function = "twi";
> +			};
> +
> +			i2c2_pins: i2c2-pins {
> +				pins = "GPIO_28", "GPIO_29";
> +				function = "twi2";
> +			};
> +		};
> +
> +		i2c0: i2c@70100400 {
> +			compatible = "mscc,ocelot-i2c", "snps,designware-i2c";
> +			status = "disabled";
> +			pinctrl-0 = <&i2c_pins>;
> +			pinctrl-names = "default";
> +			reg = <0x70100400 0x100>, <0x700001b8 0x8>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <8>;
> +			clock-frequency = <100000>;
> +			clocks = <&ahb_clk>;
> +		};
> +
> +		i2c2: i2c@70100c00 {
> +			compatible = "mscc,ocelot-i2c", "snps,designware-i2c";
> +			status = "disabled";
> +			pinctrl-0 = <&i2c2_pins>;
> +			pinctrl-names = "default";
> +			reg = <0x70100c00 0x100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <8>;
> +			clock-frequency = <100000>;
> +			clocks = <&ahb_clk>;
> +		};
> +	};
> +};
> diff --git a/arch/mips/boot/dts/mscc/jaguar2_common.dtsi b/arch/mips/boot/dts/mscc/jaguar2_common.dtsi
> new file mode 100644
> index 000000000000..679ff0d8eda8
> --- /dev/null
> +++ b/arch/mips/boot/dts/mscc/jaguar2_common.dtsi
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2020 Microsemi Corporation
> + */
> +
> +#include "jaguar2.dtsi"
> +
> +/ {
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +	i2c-sda-hold-time-ns = <300>;
> +};
> diff --git a/arch/mips/boot/dts/mscc/jaguar2_pcb110.dts b/arch/mips/boot/dts/mscc/jaguar2_pcb110.dts
> new file mode 100644
> index 000000000000..d80cd6842b2a
> --- /dev/null
> +++ b/arch/mips/boot/dts/mscc/jaguar2_pcb110.dts
> @@ -0,0 +1,267 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2020 Microsemi Corporation
> + */
> +
> +/dts-v1/;
> +#include "jaguar2_common.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Jaguar2 Cu8-Sfp16 PCB110 Reference Board";
> +	compatible = "mscc,jr2-pcb110", "mscc,jr2";
> +
> +	aliases {
> +		i2c0    = &i2c0;
> +		i2c108  = &i2c108;
> +		i2c109  = &i2c109;
> +		i2c110  = &i2c110;
> +		i2c111  = &i2c111;
> +		i2c112  = &i2c112;
> +		i2c113  = &i2c113;
> +		i2c114  = &i2c114;
> +		i2c115  = &i2c115;
> +		i2c116  = &i2c116;
> +		i2c117  = &i2c117;
> +		i2c118  = &i2c118;
> +		i2c119  = &i2c119;
> +		i2c120  = &i2c120;
> +		i2c121  = &i2c121;
> +		i2c122  = &i2c122;
> +		i2c123  = &i2c123;
> +		i2c124  = &i2c124;
> +		i2c125  = &i2c125;
> +		i2c126  = &i2c126;
> +		i2c127  = &i2c127;
> +		i2c128  = &i2c128;
> +		i2c129  = &i2c129;
> +		i2c130  = &i2c130;
> +		i2c131  = &i2c131;
> +		i2c149  = &i2c149;
> +		i2c150  = &i2c150;
> +		i2c151  = &i2c151;
> +		i2c152  = &i2c152;
> +	};
> +	i2c0_imux: i2c0-imux {
> +		compatible = "i2c-mux-pinctrl";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		i2c-parent = <&i2c0>;
> +		pinctrl-names =
> +			"i2c149", "i2c150", "i2c151", "i2c152", "idle";
> +		pinctrl-0 = <&i2cmux_0>;
> +		pinctrl-1 = <&i2cmux_1>;
> +		pinctrl-2 = <&i2cmux_2>;
> +		pinctrl-3 = <&i2cmux_3>;
> +		pinctrl-4 = <&i2cmux_pins_i>;
> +		i2c149: i2c@0 {
> +			reg = <0x0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c150: i2c@1 {
> +			reg = <0x1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c151: i2c@2 {
> +			reg = <0x2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c152: i2c@3 {
> +			reg = <0x3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +	i2c0_emux: i2c0-emux {
> +		compatible = "i2c-mux-gpio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		i2c-parent = <&i2c0>;
> +		mux-gpios = <&gpio 51 GPIO_ACTIVE_HIGH
> +			     &gpio 52 GPIO_ACTIVE_HIGH
> +			     &gpio 53 GPIO_ACTIVE_HIGH
> +			     &gpio 58 GPIO_ACTIVE_HIGH
> +			     &gpio 59 GPIO_ACTIVE_HIGH>;
> +		idle-state = <0x0>;
> +		i2c108: i2c@10 {
> +			reg = <0x10>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c109: i2c@11 {
> +			reg = <0x11>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c110: i2c@12 {
> +			reg = <0x12>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c111: i2c@13 {
> +			reg = <0x13>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c112: i2c@14 {
> +			reg = <0x14>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c113: i2c@15 {
> +			reg = <0x15>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c114: i2c@16 {
> +			reg = <0x16>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c115: i2c@17 {
> +			reg = <0x17>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c116: i2c@8 {
> +			reg = <0x8>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c117: i2c@9 {
> +			reg = <0x9>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c118: i2c@a {
> +			reg = <0xa>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c119: i2c@b {
> +			reg = <0xb>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c120: i2c@c {
> +			reg = <0xc>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c121: i2c@d {
> +			reg = <0xd>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c122: i2c@e {
> +			reg = <0xe>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c123: i2c@f {
> +			reg = <0xf>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +};
> +
> +&gpio {
> +	synce_pins: synce-pins {
> +		// GPIO 16 == SI_nCS1
> +		pins = "GPIO_16";
> +		function = "si";
> +	};
> +	synce_builtin_pins: synce-builtin-pins {
> +		// GPIO 49 == SI_nCS13
> +		pins = "GPIO_49";
> +		function = "si";
> +	};
> +	i2cmux_pins_i: i2cmux-pins-i {
> +		pins = "GPIO_17", "GPIO_18", "GPIO_20", "GPIO_21";
> +		function = "twi_scl_m";
> +		output-low;
> +	};
> +	i2cmux_0: i2cmux-0 {
> +		pins = "GPIO_17";
> +		function = "twi_scl_m";
> +		output-high;
> +	};
> +	i2cmux_1: i2cmux-1 {
> +		pins = "GPIO_18";
> +		function = "twi_scl_m";
> +		output-high;
> +	};
> +	i2cmux_2: i2cmux-2 {
> +		pins = "GPIO_20";
> +		function = "twi_scl_m";
> +		output-high;
> +	};
> +	i2cmux_3: i2cmux-3 {
> +		pins = "GPIO_21";
> +		function = "twi_scl_m";
> +		output-high;
> +	};
> +};
> +
> +&i2c0 {
> +	pca9545@70 {
> +		compatible = "nxp,pca9545";
> +		reg = <0x70>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		i2c-mux-idle-disconnect;
> +		i2c124: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +		};
> +		i2c125: i2c@1 {
> +			/* FMC B */
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
> +		i2c126: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +		};
> +		i2c127: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +		};
> +	};
> +	pca9545@71 {
> +		compatible = "nxp,pca9545";
> +		reg = <0x71>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		i2c-mux-idle-disconnect;
> +		i2c128: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +		};
> +		i2c129: i2c@1 {
> +			/* FMC B */
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
> +		i2c130: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +		};
> +		i2c131: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +		};
> +	};
> +};
> diff --git a/arch/mips/boot/dts/mscc/jaguar2_pcb111.dts b/arch/mips/boot/dts/mscc/jaguar2_pcb111.dts
> new file mode 100644
> index 000000000000..813c5e16013c
> --- /dev/null
> +++ b/arch/mips/boot/dts/mscc/jaguar2_pcb111.dts
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2018 Microsemi Corporation
> + */
> +
> +/dts-v1/;
> +#include "jaguar2_common.dtsi"
> +
> +/ {
> +	model = "Jaguar2 Cu48 PCB111 Reference Board";
> +	compatible = "mscc,jr2-pcb111", "mscc,jr2";
> +
> +	aliases {
> +		i2c0    = &i2c0;
> +		i2c149  = &i2c149;
> +		i2c150  = &i2c150;
> +		i2c151  = &i2c151;
> +		i2c152  = &i2c152;
> +		i2c203  = &i2c203;
> +	};
> +
> +	i2c0_imux: i2c0-imux {
> +		compatible = "i2c-mux-pinctrl";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		i2c-parent = <&i2c0>;
> +		pinctrl-names =
> +			"i2c149", "i2c150", "i2c151", "i2c152", "i2c203", "idle";
> +		pinctrl-0 = <&i2cmux_0>;
> +		pinctrl-1 = <&i2cmux_1>;
> +		pinctrl-2 = <&i2cmux_2>;
> +		pinctrl-3 = <&i2cmux_3>;
> +		pinctrl-4 = <&i2cmux_pins_i>; // Added by convention for PoE
> +		pinctrl-5 = <&i2cmux_pins_i>;
> +		i2c149: i2c@0 {
> +			reg = <0x0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c150: i2c@1 {
> +			reg = <0x1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c151: i2c@2 {
> +			reg = <0x2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c152: i2c@3 {
> +			reg = <0x3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c203: i2c@4 {
> +			reg = <0x4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +};
> +
> +&gpio {
> +	synce_builtin_pins: synce-builtin-pins {
> +		// GPIO 49 == SI_nCS13
> +		pins = "GPIO_49";
> +		function = "si";
> +	};
> +	cpld_pins: cpld-pins {
> +		// GPIO 50 == SI_nCS14
> +		pins = "GPIO_50";
> +		function = "si";
> +	};
> +	cpld_fifo_pins: synce-builtin-pins {
> +		// GPIO 51 == SI_nCS15
> +		pins = "GPIO_51";
> +		function = "si";
> +	};
> +};
> +
> +&gpio {
> +	i2cmux_pins_i: i2cmux-pins-i {
> +		pins = "GPIO_17", "GPIO_18";
> +		function = "twi_scl_m";
> +		output-low;
> +	};
> +	i2cmux_0: i2cmux-0 {
> +		pins = "GPIO_17";
> +		function = "twi_scl_m";
> +		output-high;
> +	};
> +	i2cmux_1: i2cmux-1 {
> +		pins = "GPIO_18";
> +		function = "twi_scl_m";
> +		output-high;
> +	};
> +	i2cmux_2: i2cmux-2 {
> +		pins = "GPIO_20";
> +		function = "twi_scl_m";
> +		output-high;
> +	};
> +	i2cmux_3: i2cmux-3 {
> +		pins = "GPIO_21";
> +		function = "twi_scl_m";
> +		output-high;
> +	};
> +};
> diff --git a/arch/mips/boot/dts/mscc/jaguar2_pcb118.dts b/arch/mips/boot/dts/mscc/jaguar2_pcb118.dts
> new file mode 100644
> index 000000000000..27c644f2d17f
> --- /dev/null
> +++ b/arch/mips/boot/dts/mscc/jaguar2_pcb118.dts
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2018 Microsemi Corporation
> + */
> +
> +/dts-v1/;
> +#include "jaguar2_common.dtsi"
> +
> +/ {
> +	model = "Jaguar2/Aquantia PCB118 Reference Board";
> +	compatible = "mscc,jr2-pcb118", "mscc,jr2";
> +
> +	aliases {
> +		i2c150  = &i2c150;
> +		i2c151  = &i2c151;
> +	};
> +
> +	i2c0_imux: i2c0-imux {
> +		compatible = "i2c-mux-pinctrl";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		i2c-parent = <&i2c0>;
> +		pinctrl-names =
> +			"i2c150", "i2c151", "idle";
> +		pinctrl-0 = <&i2cmux_0>;
> +		pinctrl-1 = <&i2cmux_1>;
> +		pinctrl-2 = <&i2cmux_pins_i>;
> +		i2c150: i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c151: i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +};
> +
> +&gpio {
> +	i2cmux_pins_i: i2cmux-pins-i {
> +		pins = "GPIO_17", "GPIO_16";
> +		function = "twi_scl_m";
> +		output-low;
> +	};
> +	i2cmux_0: i2cmux-0 {
> +		pins = "GPIO_17";
> +		function = "twi_scl_m";
> +		output-high;
> +	};
> +	i2cmux_1: i2cmux-1 {
> +		pins = "GPIO_16";
> +		function = "twi_scl_m";
> +		output-high;
> +	};
> +};
> diff --git a/arch/mips/generic/Kconfig b/arch/mips/generic/Kconfig
> index e5a7a1314e71..c7a840b8eaa6 100644
> --- a/arch/mips/generic/Kconfig
> +++ b/arch/mips/generic/Kconfig
> @@ -86,6 +86,14 @@ config FIT_IMAGE_FDT_LUTON
>  	  from Microsemi in the FIT kernel image.
>  	  This requires u-boot on the platform.
>  
> +config FIT_IMAGE_FDT_JAGUAR2
> +	bool "Include FDT for Microsemi Jaguar2 development platforms"
> +	select SOC_VCOREIII
> +	help
> +	  Enable this to include the FDT for the Jaguar2 development platforms
> +	  from Microsemi in the FIT kernel image.
> +	  This requires u-boot on the platform.
> +
>  config BOARD_INGENIC
>  	bool "Support boards based on Ingenic SoCs"
>  	select MACH_INGENIC_GENERIC
> diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
> index 4b6905daa39c..3f2055bea596 100644
> --- a/arch/mips/generic/Platform
> +++ b/arch/mips/generic/Platform
> @@ -21,4 +21,5 @@ its-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= board-boston.its.S
>  its-$(CONFIG_FIT_IMAGE_FDT_NI169445)	+= board-ni169445.its.S
>  its-$(CONFIG_FIT_IMAGE_FDT_OCELOT)	+= board-ocelot.its.S
>  its-$(CONFIG_FIT_IMAGE_FDT_LUTON)	+= board-luton.its.S
> +its-$(CONFIG_FIT_IMAGE_FDT_JAGUAR2)	+= board-jaguar2.its.S
>  its-$(CONFIG_FIT_IMAGE_FDT_XILFPGA)	+= board-xilfpga.its.S
> diff --git a/arch/mips/generic/board-jaguar2.its.S b/arch/mips/generic/board-jaguar2.its.S
> new file mode 100644
> index 000000000000..fb0e589eeff7
> --- /dev/null
> +++ b/arch/mips/generic/board-jaguar2.its.S
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/ {
> +	images {
> +		fdt@jaguar2_pcb110 {
> +			description = "MSCC Jaguar2 PCB110 Device Tree";
> +			data = /incbin/("boot/dts/mscc/jaguar2_pcb110.dtb");
> +			type = "flat_dt";
> +			arch = "mips";
> +			compression = "none";
> +			hash@0 {
> +				algo = "sha1";
> +			};
> +		};
> +		fdt@jaguar2_pcb111 {
> +			description = "MSCC Jaguar2 PCB111 Device Tree";
> +			data = /incbin/("boot/dts/mscc/jaguar2_pcb111.dtb");
> +			type = "flat_dt";
> +			arch = "mips";
> +			compression = "none";
> +			hash@0 {
> +				algo = "sha1";
> +			};
> +		};
> +	};
> +
> +	configurations {
> +		pcb110 {
> +			description = "Jaguar2 Linux kernel";
> +			kernel = "kernel@0";
> +			fdt = "fdt@jaguar2_pcb110";
> +			ramdisk = "ramdisk";
> +		};
> +		pcb111 {
> +			description = "Jaguar2 Linux kernel";
> +			kernel = "kernel@0";
> +			fdt = "fdt@jaguar2_pcb111";
> +			ramdisk = "ramdisk";
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
