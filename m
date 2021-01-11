Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19DE2F2258
	for <lists+linux-mips@lfdr.de>; Mon, 11 Jan 2021 23:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732524AbhAKWAE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Jan 2021 17:00:04 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:41898 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbhAKWAD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Jan 2021 17:00:03 -0500
Received: by mail-oi1-f178.google.com with SMTP id 15so193732oix.8;
        Mon, 11 Jan 2021 13:59:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=neicyE0bmSE7XtEGiUy5qH5sWNhjeDoJxOGTdmqaB5g=;
        b=A5rlfS88l+t/TslAWGH2LClpkIp4Z/7FlsZSUZhqTrG7SZqVLSg4r3XmpX+mLJ4cTx
         BKPkZQWkQ114jd3o0QRoRG4WsZfGu9/7wSrlmlu1v77+uIMieUjlpqOorDmmanryzTm0
         JYTvZalnmlpvEalJeSYIggPBHajn14ebtg5WRH1+8FGLoD0tuL5R2AzhC/YMnVo/Feqn
         /5g9aesn6fB8ABFdJN4RTiTrBaYWqBriD8WDn1wkV4DDR8xVvx4Vti3zlylS4P9hQlHt
         j35Qv9IwKJBxXJNp+XHmgEdJ9QqAopSptBWB+YKhg5hpEonYLQRq8pJY8/GscybINhlt
         Dxug==
X-Gm-Message-State: AOAM533MpUZm9PSg7oLbY3wfj8TcvdkdMCFQF/PkQ+uYSp9DUlbAWZXs
        nJviF+NYopbkHFVM1qHx1Q==
X-Google-Smtp-Source: ABdhPJzevo/CCNCRYdP94NcRED0kgTA26btwhv9nQvKZQhV5gp1VX1y6C2fHL6jbfju5LVVZpCFwjw==
X-Received: by 2002:aca:b656:: with SMTP id g83mr559390oif.6.1610402362661;
        Mon, 11 Jan 2021 13:59:22 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 73sm227750otv.26.2021.01.11.13.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 13:59:21 -0800 (PST)
Received: (nullmailer pid 3132674 invoked by uid 1000);
        Mon, 11 Jan 2021 21:59:20 -0000
Date:   Mon, 11 Jan 2021 15:59:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bert Vermeulen <bert@biot.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sander Vanheule <sander@svanheule.net>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Birger Koblitz <mail@birger-koblitz.de>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH v3 1/4] Add support for Realtek RTL838x/RTL839x switch
 SoCs
Message-ID: <20210111215920.GA3121911@robh.at.kernel.org>
References: <20201230212205.2605383-1-bert@biot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230212205.2605383-1-bert@biot.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 30, 2020 at 10:22:02PM +0100, Bert Vermeulen wrote:
> The RTL838x/839x family of SoCs are Realtek switches with an embedded
> MIPS core.
> 
> * RTL838x - 500MHz 4kce single core - 1Gbit ports and L2 features
> * RTL839x - 700MHz 34Kc single core - 1Gbit ports and L2 features
> 
> These switches, depending on the exact part number, will have anywhere
> between 8 and 50 ports. The MIPS core is wired to a switch cpu port which
> has a tagging feature allowing us to make use of the DSA subsystem.
> The SoCs are somewhat basic in certain areas, getting better with more
> advanced features on newer series.
> 
> The switch functionality is MMIO-mapped via a large MFD region.
> 
> The SoCs have the following peripherals
> * ethernet
> * switch
> * uart - ns16550a
> * spi-flash interface
> * gpio
> * wdt
> * led
> 
> The code was derived from various vendor SDKs based on Linux v2.6
> kernels.
> 
> This patchset allows us to boot RTL838x/RTL839x units with basic support.
> Most of the other drivers are already written and functional, and work to
> get them upstream is already in progress.
> 
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
> Signed-off-by: Bert Vermeulen <bert@biot.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
>  .../devicetree/bindings/mips/realtek-rtl.yaml | 24 ++++++

Generally, this should be a separate patch.

>  arch/mips/boot/dts/Makefile                   |  1 +
>  arch/mips/boot/dts/realtek/rtl838x.dtsi       | 21 +++++
>  arch/mips/boot/dts/realtek/rtl839x.dtsi       | 21 +++++
>  arch/mips/boot/dts/realtek/rtl83xx.dtsi       | 83 +++++++++++++++++++
>  5 files changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/realtek-rtl.yaml
>  create mode 100644 arch/mips/boot/dts/realtek/rtl838x.dtsi
>  create mode 100644 arch/mips/boot/dts/realtek/rtl839x.dtsi
>  create mode 100644 arch/mips/boot/dts/realtek/rtl83xx.dtsi
> 
> diff --git a/Documentation/devicetree/bindings/mips/realtek-rtl.yaml b/Documentation/devicetree/bindings/mips/realtek-rtl.yaml
> new file mode 100644
> index 000000000000..aadff8ce0f49
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/realtek-rtl.yaml
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/realtek-rtl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek RTL83xx/93xx SoC series device tree bindings
> +
> +maintainers:
> +  - Bert Vermeulen <bert@biot.com>
> +  - Sander Vanheule <sander@svanheule.net>
> +
> +properties:
> +  $nodename:
> +    const: "/"
> +  compatible:
> +    oneOf:
> +      # RTL8382-based boards
> +      - items:
> +          - enum:
> +              - cisco,sg220-26
> +          - const: realtek,rtl8382-soc
> +
> +additionalProperties: true
> diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
> index 0259238d7a2e..60bd7d2a9ad8 100644
> --- a/arch/mips/boot/dts/Makefile
> +++ b/arch/mips/boot/dts/Makefile
> @@ -14,6 +14,7 @@ subdir-$(CONFIG_FIT_IMAGE_FDT_NI169445)	+= ni
>  subdir-$(CONFIG_MACH_PIC32)		+= pic32
>  subdir-$(CONFIG_ATH79)			+= qca
>  subdir-$(CONFIG_RALINK)			+= ralink
> +subdir-$(CONFIG_MACH_REALTEK_RTL)	+= realtek
>  subdir-$(CONFIG_FIT_IMAGE_FDT_XILFPGA)	+= xilfpga
>  
>  obj-$(CONFIG_BUILTIN_DTB)	:= $(addsuffix /, $(subdir-y))
> diff --git a/arch/mips/boot/dts/realtek/rtl838x.dtsi b/arch/mips/boot/dts/realtek/rtl838x.dtsi
> new file mode 100644
> index 000000000000..6cc4ff5c0d19
> --- /dev/null
> +++ b/arch/mips/boot/dts/realtek/rtl838x.dtsi
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
> +
> +/ {
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			compatible = "mips,mips4KEc";
> +			reg = <0>;
> +			clocks = <&baseclk 0>;
> +			clock-names = "cpu";
> +		};
> +	};
> +
> +	baseclk: baseclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <500000000>;
> +	};
> +};
> diff --git a/arch/mips/boot/dts/realtek/rtl839x.dtsi b/arch/mips/boot/dts/realtek/rtl839x.dtsi
> new file mode 100644
> index 000000000000..2b5bad8fcf2f
> --- /dev/null
> +++ b/arch/mips/boot/dts/realtek/rtl839x.dtsi
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
> +
> +/ {
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
> +		clock-frequency = <500000000>;
> +	};
> +};
> diff --git a/arch/mips/boot/dts/realtek/rtl83xx.dtsi b/arch/mips/boot/dts/realtek/rtl83xx.dtsi
> new file mode 100644
> index 000000000000..17fa90002e00
> --- /dev/null
> +++ b/arch/mips/boot/dts/realtek/rtl83xx.dtsi
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
> +
> +/ {
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
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0xb8000000 0x10000>;
> +
> +		spi: spi@1200 {
> +			compatible = "realtek,rtl-spi";

Not documented. Needs to have an SoC specific compatible.

> +			reg = <0x1200 0x100>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		uart0: uart@2000 {

serial@2000

Build the dtb with W=1 and run 'make dtbs_check' and fix any warnings. 
The above issue should show up.

> +			compatible = "ns16550a";

No quirks for this? Best to have a more specific compatible in case you 
do.

> +			reg = <0x2000 0x100>;
> +
> +			clock-frequency = <200000000>;
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
> +
> +		uart1: uart@2100 {
> +			compatible = "ns16550a";
> +			reg = <0x2100 0x100>;
> +
> +			clock-frequency = <200000000>;
> +
> +			interrupt-parent = <&intc>;
> +			interrupts = <30>;
> +
> +			reg-io-width = <1>;
> +			reg-shift = <2>;
> +			fifo-size = <1>;
> +			no-loopback-test;
> +
> +			status = "disabled";
> +		};
> +
> +		intc: interrupt-controller@3000 {
> +			compatible = "realtek,rtl-intc";

Not documented.

> +			#interrupt-cells = <1>;
> +			interrupt-controller;
> +			reg = <0x3000 0x20>;
> +		};
> +	};
> +
> +	switch_bus: switch-bus@bb000000 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0xbb000000 0x10000>;
> +	};
> +};
> -- 
> 2.25.1
> 
