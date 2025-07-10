Return-Path: <linux-mips+bounces-9717-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A011B001B7
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 14:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85C1A6405B9
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 12:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED752505A9;
	Thu, 10 Jul 2025 12:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBZZ/5G2"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1CD24C068;
	Thu, 10 Jul 2025 12:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150475; cv=none; b=jkPUA9vUKODHF0ySHQr0AiKFn7p3nCsiG/oeQT67Wx8lx48WIadnmlMdEcBvH9AmQJuh/zYyBssNHSdyVICe6m5kIfGG7HjVr9hbFi+HxWfCD8iF/9IKaBr0nydbiNDlkOrEv1ShgVkDXk7C+hdJw5hBzVHI3xBN6uxKN53WRYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150475; c=relaxed/simple;
	bh=cFB/EhdezCpnpkMXdJFVEGoonbjQEG6w7wqWiZXZcyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLFffDxkqfgi7Bv0XvQ5+LgTt8Wxw9Mp4MID9BAfwbDm60sanf8miGE7zu8JeYnKimobvSgtrWmHFuHCurk08AUMLBXpZ85imVMrk1iXYAAC4WX0qp/Cj+uv7x4/czY3tBEj+dNhp9VV4W62B2hhntziRr/cqSOl5uZqaVP+aJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBZZ/5G2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C0BC4CEE3;
	Thu, 10 Jul 2025 12:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752150474;
	bh=cFB/EhdezCpnpkMXdJFVEGoonbjQEG6w7wqWiZXZcyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BBZZ/5G2NnuDX8Glsh7TEY33ApFcHma+adNsE2fxlWCIoisPvpEO5TlEH/6gKiijp
	 ewJYvlUGepHnrWmDaLdCzTKVHhXnHKk0hn4WBKX+/UVMRPDS8QhhbplbVCVYDOMCgu
	 ROD/E0xrjzlyN3zBOoBFFz72Kk+yaBDM+ME8Z90aRC42MxKbMU2dOKKVxff0NvBFCh
	 JQ+43mxwjp7uMHk0ChS4WoSeI4HurbnWXlnWx5t8KIOhpGkZuBW9SdWLGQOOUpCryK
	 3565DUOd+W+Sg/JfQAaTQTbOVqZ0oTowXQU7lZorqo/hH1Krf6PJtp2yE2/NSaY7Nz
	 gl0xBvvRZhtyw==
Date: Thu, 10 Jul 2025 14:27:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/9] MIPS: dts: loongson: Add LS1B-DEMO board
Message-ID: <20250710-ancient-ibex-of-adventure-30030a@krzk-bin>
References: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
 <20250709-loongson1-arch-v2-3-bcff6e518c09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709-loongson1-arch-v2-3-bcff6e518c09@gmail.com>

On Wed, Jul 09, 2025 at 07:05:54PM +0800, Keguang Zhang wrote:
> Add a device tree for LS1B-DEMO board, supporting CPU, clock, INTC,
> UART, Ethernet, GPIO, USB host, RTC, watchdog, DMA, NAND, and AC97.
> 
> Additionally, since the current bootloader for Loongson1 does not support
> FDT, introduce CONFIG_BUILTIN_DTB_NAME to enable a built-in DTB.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
>  MAINTAINERS                                 |   1 +
>  arch/mips/boot/dts/Makefile                 |   1 +
>  arch/mips/boot/dts/loongson/Makefile        |   6 +
>  arch/mips/boot/dts/loongson/loongson1.dtsi  | 136 +++++++++++++++++++
>  arch/mips/boot/dts/loongson/loongson1b.dtsi | 198 ++++++++++++++++++++++++++++
>  arch/mips/boot/dts/loongson/ls1b-demo.dts   | 108 +++++++++++++++
>  6 files changed, 450 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3f7fbd0d67a..0089ebca31cf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16683,6 +16683,7 @@ M:	Keguang Zhang <keguang.zhang@gmail.com>
>  L:	linux-mips@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/*/loongson,ls1*.yaml
> +F:	arch/mips/boot/dts/loongson/loongson1*
>  F:	arch/mips/include/asm/mach-loongson32/
>  F:	arch/mips/loongson32/
>  F:	drivers/*/*loongson1*
> diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
> index 7375c6ced82b..6d9dbe945541 100644
> --- a/arch/mips/boot/dts/Makefile
> +++ b/arch/mips/boot/dts/Makefile
> @@ -8,6 +8,7 @@ subdir-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= img
>  subdir-$(CONFIG_MACH_INGENIC)		+= ingenic
>  subdir-$(CONFIG_LANTIQ)			+= lantiq
>  subdir-$(CONFIG_MACH_LOONGSON64)	+= loongson
> +subdir-$(CONFIG_MACH_LOONGSON32)	+= loongson
>  subdir-$(CONFIG_SOC_VCOREIII)		+= mscc
>  subdir-$(CONFIG_MIPS_MALTA)		+= mti
>  subdir-$(CONFIG_LEGACY_BOARD_SEAD3)	+= mti
> diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
> index 5e3ab984d70f..2facf251fb6a 100644
> --- a/arch/mips/boot/dts/loongson/Makefile
> +++ b/arch/mips/boot/dts/loongson/Makefile
> @@ -5,3 +5,9 @@ dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_4core_rs780e.dtb
>  dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_8core_rs780e.dtb
>  dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64g_4core_ls7a.dtb
>  dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64v_4core_virtio.dtb
> +
> +ifneq ($(CONFIG_BUILTIN_DTB_NAME),)
> +dtb-y	:= $(addsuffix .dtb, $(CONFIG_BUILTIN_DTB_NAME))
> +else

This does not really look related to new board.

> +dtb-$(CONFIG_MACH_LOONGSON32)	+= ls1b-demo.dtb
> +endif
> diff --git a/arch/mips/boot/dts/loongson/loongson1.dtsi b/arch/mips/boot/dts/loongson/loongson1.dtsi
> new file mode 100644
> index 000000000000..5ba5a5d131ba

...

> +		opp-220000000 {
> +			opp-hz = /bits/ 64 <220000000>;
> +		};
> +	};
> +
> +	clocksource: timer@1fe5c030 {

This should be in the SoC (see writing bindings, maintainer soc, DTS
coding style).

> +		compatible = "loongson,ls1b-pwmtimer";
> +		reg = <0x1fe5c030 0x10>;
> +		clocks = <&clkc LS1X_CLKID_APB>;
> +		interrupt-parent = <&intc0>;
> +		interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	clkc: clock-controller@1fe78030 {
> +		compatible = "loongson,ls1b-clk";
> +		reg = <0x1fe78030 0x8>;
> +		clocks = <&xtal>;
> +		#clock-cells = <1>;
> +	};
> +};
> +
> +&soc {
> +	syscon: syscon@420 {
> +		compatible = "loongson,ls1b-syscon", "syscon";
> +		reg = <0x420 0x8>;
> +	};
> +
> +	dma: dma-controller@1160 {
> +		compatible = "loongson,ls1b-apbdma";
> +		reg = <0x1160 0x4>;
> +		interrupt-parent = <&intc0>;
> +		interrupts = <13 IRQ_TYPE_EDGE_RISING>,
> +			     <14 IRQ_TYPE_EDGE_RISING>,
> +			     <15 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "ch0", "ch1", "ch2";
> +		#dma-cells = <1>;
> +	};
> +
> +	ehci: usb@100000 {
> +		compatible = "generic-ehci";
> +		reg = <0x100000 0x100>;
> +		interrupt-parent = <&intc1>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +		status = "disabled";
> +	};
> +
> +	ohci: usb@108000 {
> +		compatible = "generic-ohci";
> +		reg = <0x108000 0x100>;
> +		interrupt-parent = <&intc1>;
> +		interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
> +		status = "disabled";
> +	};
> +
> +	gmac0: ethernet@110000 {
> +		compatible = "loongson,ls1b-gmac", "snps,dwmac-3.50a";
> +		reg = <0x110000 0x10000>;
> +		clocks = <&clkc LS1X_CLKID_AHB>;
> +		clock-names = "stmmaceth";
> +		interrupt-parent = <&intc1>;
> +		interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "macirq";
> +		loongson,ls1-syscon = <&syscon>;
> +		snps,pbl = <1>;
> +		status = "disabled";
> +	};
> +
> +	gmac1: ethernet@120000 {
> +		compatible = "loongson,ls1b-gmac", "snps,dwmac-3.50a";
> +		reg = <0x120000 0x10000>;
> +		clocks = <&clkc LS1X_CLKID_AHB>;
> +		clock-names = "stmmaceth";
> +		interrupt-parent = <&intc1>;
> +		interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "macirq";
> +		loongson,ls1-syscon = <&syscon>;
> +		snps,pbl = <1>;
> +		status = "disabled";
> +	};
> +};
> +
> +&apb {
> +	watchdog: watchdog@1c060 {
> +		compatible = "loongson,ls1b-wdt";
> +		reg = <0x1c060 0xc>;
> +		clocks = <&clkc LS1X_CLKID_APB>;
> +		status = "disabled";
> +	};
> +
> +	rtc: rtc@24000 {
> +		compatible = "loongson,ls1b-rtc";
> +		reg = <0x24000 0x78>;
> +		interrupt-parent = <&intc0>;
> +		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
> +		status = "disabled";
> +	};
> +
> +	ac97: audio-controller@34000 {
> +		compatible = "loongson,ls1b-ac97";
> +		reg = <0x34000 0x60>, <0x32420 0x4>, <0x34c4c 0x4>;
> +		reg-names = "ac97", "audio-tx", "audio-rx";
> +		dmas = <&dma 1>, <&dma 2>;
> +		dma-names = "tx", "rx";
> +		#sound-dai-cells = <0>;
> +		status = "disabled";
> +	};
> +
> +	nand: nand-controller@38000 {
> +		compatible = "loongson,ls1b-nand-controller";
> +		reg = <0x38000 0x24>, <0x38040 0x4>;
> +		reg-names = "nand", "nand-dma";
> +		dmas = <&dma 0>;
> +		dma-names = "rxtx";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +
> +		nand@0 {
> +			reg = <0>;
> +			label = "ls1x-nand";
> +			nand-use-soft-ecc-engine;
> +			nand-ecc-algo = "hamming";
> +		};
> +	};
> +};
> +
> +&cpu0 {
> +	operating-points-v2 = <&cpu_opp_table>;
> +};
> +
> +&gpio0 {
> +	ngpios = <31>;
> +};
> +
> +&gpio1 {
> +	ngpios = <30>;
> +};
> +
> +&uart1 {
> +	interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&uart2 {
> +	interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&uart3 {
> +	interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
> +};
> diff --git a/arch/mips/boot/dts/loongson/ls1b-demo.dts b/arch/mips/boot/dts/loongson/ls1b-demo.dts
> new file mode 100644
> index 000000000000..19ea772e6649
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/ls1b-demo.dts
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023-2025 Keguang Zhang <keguang.zhang@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +#include "loongson1b.dtsi"
> +
> +/ {
> +	compatible = "loongson,ls1b-demo", "loongson,ls1b";
> +	model = "LS1B-DEMO Board";
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x10000000>;
> +	};
> +
> +	aliases {
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio1;
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS0,38400";

Drop bootargs. You duplicate stdout path.

> +		stdout-path = "serial0:38400n8";
> +	};

Best regards,
Krzysztof


