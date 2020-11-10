Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63392AD65D
	for <lists+linux-mips@lfdr.de>; Tue, 10 Nov 2020 13:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731801AbgKJMef (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Nov 2020 07:34:35 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:49247 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731949AbgKJMef (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Nov 2020 07:34:35 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D75AD20004;
        Tue, 10 Nov 2020 12:34:30 +0000 (UTC)
Date:   Tue, 10 Nov 2020 13:34:30 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen.Hegelund@microchip.com
Subject: Re: [PATCH v2 9/9] MIPS: mscc: Add serval support
Message-ID: <20201110123430.GM1769536@piout.net>
References: <20201110114508.1197652-1-gregory.clement@bootlin.com>
 <20201110114508.1197652-10-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110114508.1197652-10-gregory.clement@bootlin.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/11/2020 12:45:08+0100, Gregory CLEMENT wrote:
> Add a device trees and FIT image support for the Microsemi Serval SoC
> which belongs to same family of the Ocelot SoC.
> 
> It is based on the work of Lars Povlsen <lars.povlsen@microchip.com>.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

You have two SoBs here,

Else
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  arch/mips/boot/dts/mscc/Makefile           |   5 +-
>  arch/mips/boot/dts/mscc/serval.dtsi        | 153 +++++++++++++++++++++
>  arch/mips/boot/dts/mscc/serval_common.dtsi | 127 +++++++++++++++++
>  arch/mips/boot/dts/mscc/serval_pcb105.dts  |  17 +++
>  arch/mips/boot/dts/mscc/serval_pcb106.dts  |  17 +++
>  arch/mips/generic/Kconfig                  |   8 ++
>  arch/mips/generic/Platform                 |   1 +
>  arch/mips/generic/board-serval.its.S       |  24 ++++
>  8 files changed, 351 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/boot/dts/mscc/serval.dtsi
>  create mode 100644 arch/mips/boot/dts/mscc/serval_common.dtsi
>  create mode 100644 arch/mips/boot/dts/mscc/serval_pcb105.dts
>  create mode 100644 arch/mips/boot/dts/mscc/serval_pcb106.dts
>  create mode 100644 arch/mips/generic/board-serval.its.S
> 
> diff --git a/arch/mips/boot/dts/mscc/Makefile b/arch/mips/boot/dts/mscc/Makefile
> index befda72ceb26..eeb6b7aae83b 100644
> --- a/arch/mips/boot/dts/mscc/Makefile
> +++ b/arch/mips/boot/dts/mscc/Makefile
> @@ -5,6 +5,9 @@ dtb-$(CONFIG_SOC_VCOREIII)	+= \
>  	jaguar2_pcb118.dtb \
>  	luton_pcb091.dtb \
>  	ocelot_pcb120.dtb \
> -	ocelot_pcb123.dtb
> +	ocelot_pcb123.dtb \
> +	serval_pcb105.dtb \
> +	serval_pcb106.dtb
> +
>  
>  obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
> diff --git a/arch/mips/boot/dts/mscc/serval.dtsi b/arch/mips/boot/dts/mscc/serval.dtsi
> new file mode 100644
> index 000000000000..089ce89df190
> --- /dev/null
> +++ b/arch/mips/boot/dts/mscc/serval.dtsi
> @@ -0,0 +1,153 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2018 Microsemi Corporation
> + */
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "mscc,serval";
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
> +		gpio0 = &gpio;
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
> +			compatible = "mscc,serval-icpu-intr";
> +			reg = <0x70000070 0x70>;
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
> +		gpio: pinctrl@71070034 {
> +			compatible = "mscc,serval-pinctrl";
> +			reg = <0x71070034 0x28>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&gpio 0 0 22>;
> +
> +			sgpio_pins: sgpio-pins {
> +				pins = "GPIO_0", "GPIO_2", "GPIO_3", "GPIO_1";
> +				function = "sg0";
> +			};
> +
> +			i2c_pins: i2c-pins {
> +				pins = "GPIO_6", "GPIO_7";
> +				function = "twi";
> +			};
> +
> +			uart_pins: uart-pins {
> +				pins = "GPIO_26", "GPIO_27";
> +				function = "uart";
> +			};
> +
> +			uart2_pins: uart2-pins {
> +				pins = "GPIO_13", "GPIO_14";
> +				function = "uart2";
> +			};
> +
> +			cs1_pins: cs1-pins {
> +				pins = "GPIO_8";
> +				function = "si";
> +			};
> +
> +			irqext0_pins: irqext0-pins {
> +				pins = "GPIO_28";
> +				function = "irq0";
> +			};
> +
> +			irqext1_pins: irqext1-pins {
> +				pins = "GPIO_29";
> +				function = "irq1";
> +			};
> +		};
> +
> +		i2c0: i2c@70100400 {
> +			compatible = "mscc,ocelot-i2c", "snps,designware-i2c";
> +			status = "disabled";
> +			pinctrl-0 = <&i2c_pins>;
> +			pinctrl-names = "default";
> +			reg = <0x70100400 0x100>, <0x70000190 0x8>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <8>;
> +			clock-frequency = <100000>;
> +			clocks = <&ahb_clk>;
> +		};
> +	};
> +};
> diff --git a/arch/mips/boot/dts/mscc/serval_common.dtsi b/arch/mips/boot/dts/mscc/serval_common.dtsi
> new file mode 100644
> index 000000000000..5b404836db5e
> --- /dev/null
> +++ b/arch/mips/boot/dts/mscc/serval_common.dtsi
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2020 Microsemi Corporation
> + */
> +
> +#include "serval.dtsi"
> +
> +/ {
> +	aliases {
> +		serial0 = &uart0;
> +		i2c104  = &i2c104;
> +		i2c105  = &i2c105;
> +		i2c106  = &i2c106;
> +		i2c107  = &i2c107;
> +		i2c108  = &i2c108;
> +		i2c109  = &i2c109;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	i2c0_imux: i2c0-imux{
> +		compatible = "i2c-mux-pinctrl";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		i2c-parent = <&i2c0>;
> +		pinctrl-names =
> +		"i2c104", "i2c105", "i2c106", "i2c107",
> +		"i2c108", "i2c109", "idle";
> +		pinctrl-0 = <&i2cmux_0>;
> +		pinctrl-1 = <&i2cmux_1>;
> +		pinctrl-2 = <&i2cmux_2>;
> +		pinctrl-3 = <&i2cmux_3>;
> +		pinctrl-4 = <&i2cmux_4>;
> +		pinctrl-5 = <&i2cmux_5>;
> +		pinctrl-6 = <&i2cmux_pins_i>;
> +		i2c104: i2c_sfp0@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c105: i2c_sfp1@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c106: i2c_sfp2@2 {
> +			reg = <2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c107: i2c_sfp3@3 {
> +			reg = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c108: i2c_sfp4@4 {
> +			reg = <4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c109: i2c_sfp5@5 {
> +			reg = <5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +};
> +
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
> +&gpio {
> +	i2c_pins: i2c-pins {
> +		pins = "GPIO_7"; /* No "default" scl for i2c0 */
> +		function = "twi";
> +	};
> +	i2cmux_pins_i: i2cmux-pins-i {
> +		pins = "GPIO_11", "GPIO_12", "GPIO_18", "GPIO_19",
> +			"GPIO_20", "GPIO_21";
> +		function = "twi_scl_m";
> +		output-low;
> +	};
> +	i2cmux_0: i2cmux-0 {
> +		pins = "GPIO_11";
> +		function = "twi_scl_m";
> +		output-high;
> +	};
> +	i2cmux_1: i2cmux-1 {
> +		pins = "GPIO_12";
> +		function = "twi_scl_m";
> +		output-high;
> +	};
> +	i2cmux_2: i2cmux-2 {
> +		pins = "GPIO_18";
> +		function = "twi_scl_m";
> +		output-high;
> +	};
> +	i2cmux_3: i2cmux-3 {
> +		pins = "GPIO_19";
> +		function = "twi_scl_m";
> +		output-high;
> +	};
> +	i2cmux_4: i2cmux-4 {
> +		pins = "GPIO_20";
> +		function = "twi_scl_m";
> +		output-high;
> +	};
> +	i2cmux_5: i2cmux-5 {
> +		pins = "GPIO_21";
> +		function = "twi_scl_m";
> +		output-high;
> +	};
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +	i2c-sda-hold-time-ns = <300>;
> +};
> +
> diff --git a/arch/mips/boot/dts/mscc/serval_pcb105.dts b/arch/mips/boot/dts/mscc/serval_pcb105.dts
> new file mode 100644
> index 000000000000..a1b0012b79d3
> --- /dev/null
> +++ b/arch/mips/boot/dts/mscc/serval_pcb105.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2018 Microsemi Corporation
> + */
> +
> +/dts-v1/;
> +#include "serval_common.dtsi"
> +
> +/ {
> +	model = "Serval PCB105 Reference Board";
> +	compatible = "mscc,serval-pcb105", "mscc,serval";
> +
> +	aliases {
> +	};
> +
> +};
> +
> diff --git a/arch/mips/boot/dts/mscc/serval_pcb106.dts b/arch/mips/boot/dts/mscc/serval_pcb106.dts
> new file mode 100644
> index 000000000000..237be7c8da57
> --- /dev/null
> +++ b/arch/mips/boot/dts/mscc/serval_pcb106.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2018 Microsemi Corporation
> + */
> +
> +/dts-v1/;
> +#include "serval_common.dtsi"
> +
> +/ {
> +	model = "Serval PCB106 Reference Board";
> +	compatible = "mscc,serval-pcb106", "mscc,serval";
> +
> +	aliases {
> +	};
> +
> +};
> +
> diff --git a/arch/mips/generic/Kconfig b/arch/mips/generic/Kconfig
> index c7a840b8eaa6..657dd93c5e76 100644
> --- a/arch/mips/generic/Kconfig
> +++ b/arch/mips/generic/Kconfig
> @@ -94,6 +94,14 @@ config FIT_IMAGE_FDT_JAGUAR2
>  	  from Microsemi in the FIT kernel image.
>  	  This requires u-boot on the platform.
>  
> +config FIT_IMAGE_FDT_SERVAL
> +	bool "Include FDT for Microsemi Serval development platforms"
> +	select SOC_VCOREIII
> +	help
> +	  Enable this to include the FDT for the Serval development platforms
> +	  from Microsemi in the FIT kernel image.
> +	  This requires u-boot on the platform.
> +
>  config BOARD_INGENIC
>  	bool "Support boards based on Ingenic SoCs"
>  	select MACH_INGENIC_GENERIC
> diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
> index 3f2055bea596..b871af16b5b6 100644
> --- a/arch/mips/generic/Platform
> +++ b/arch/mips/generic/Platform
> @@ -22,4 +22,5 @@ its-$(CONFIG_FIT_IMAGE_FDT_NI169445)	+= board-ni169445.its.S
>  its-$(CONFIG_FIT_IMAGE_FDT_OCELOT)	+= board-ocelot.its.S
>  its-$(CONFIG_FIT_IMAGE_FDT_LUTON)	+= board-luton.its.S
>  its-$(CONFIG_FIT_IMAGE_FDT_JAGUAR2)	+= board-jaguar2.its.S
> +its-$(CONFIG_FIT_IMAGE_FDT_SERVAL)	+= board-serval.its.S
>  its-$(CONFIG_FIT_IMAGE_FDT_XILFPGA)	+= board-xilfpga.its.S
> diff --git a/arch/mips/generic/board-serval.its.S b/arch/mips/generic/board-serval.its.S
> new file mode 100644
> index 000000000000..4ea4fc9d757f
> --- /dev/null
> +++ b/arch/mips/generic/board-serval.its.S
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/ {
> +	images {
> +		fdt@serval_pcb105 {
> +			description = "MSCC Serval PCB105 Device Tree";
> +			data = /incbin/("boot/dts/mscc/serval_pcb105.dtb");
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
> +		pcb105 {
> +			description = "Serval Linux kernel";
> +			kernel = "kernel@0";
> +			fdt = "fdt@serval_pcb105";
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
