Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D110C21CD
	for <lists+linux-mips@lfdr.de>; Mon, 30 Sep 2019 15:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730524AbfI3NU7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 09:20:59 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33546 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730378AbfI3NU6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Sep 2019 09:20:58 -0400
Received: by mail-oi1-f196.google.com with SMTP id e18so11083831oii.0;
        Mon, 30 Sep 2019 06:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z6qMz/tsOxszsKZbTCPP0U8iC4742xNFFl8lGaeEYZQ=;
        b=KmQVZxznShPLWj/NWevmvs9MOeHhmMjHcZL6F5DH4uBCs3Un5NNOF7Qv/aOUFhAOaU
         /3K1RU/ggO/gDf69WxpW4rCBJWcnfIonuwwfqEC4xKm5mNxu3w0zh8zm7U7z+LhQ1vmG
         ZkTiM7/KASVFa1/lFv564pkOxHCnpvhFV8mXacGOhcTRcsIbtkCLXDPzyXCuUeXocKK/
         TjLJJxwB1leuG+8Pj9ZHwl6AiM1MyOr19i9De+Kj+WbCuUlOUprEHYfWGE2o2mZqcLJZ
         W0/ocDmQBr1TynLq8D50SovGocwvLSnkFYa0lsWAIw72FwsWw7WjJSmoL1RFl21kwaut
         pvHw==
X-Gm-Message-State: APjAAAVRvW4NuSBDxqfJvdzcGU+mFITZ7hooQyC8IgdSSXJ3z1NLnStX
        R9x+WelhrmX/k/g1iheVdw==
X-Google-Smtp-Source: APXvYqzn3K8aGVZHDXuh2rPRTAG9oVFixYVAXtmAm+1SEdcNT8ARXu+qU9ie10qu+l/qbyOPZDM2GA==
X-Received: by 2002:a54:4e05:: with SMTP id a5mr18541679oiy.91.1569849657085;
        Mon, 30 Sep 2019 06:20:57 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t12sm3615197otl.35.2019.09.30.06.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 06:20:56 -0700 (PDT)
Date:   Mon, 30 Sep 2019 08:20:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net,
        maz@kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 14/19] MIPS: Loongson64: Add generic dts
Message-ID: <20190930132055.GA3354@bogus>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
 <20190905144316.12527-15-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905144316.12527-15-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 05, 2019 at 10:43:11PM +0800, Jiaxun Yang wrote:
> Add generic device dts for Loongson-3 devices.
> They seems identical but will be different later.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/Kconfig                           |  4 +-
>  arch/mips/boot/dts/Makefile                 |  1 +
>  arch/mips/boot/dts/loongson/3a-package.dtsi | 69 +++++++++++++++++++++
>  arch/mips/boot/dts/loongson/3a1000_780e.dts | 10 +++
>  arch/mips/boot/dts/loongson/3a2000_780e.dts | 10 +++
>  arch/mips/boot/dts/loongson/3a3000_780e.dts | 10 +++
>  arch/mips/boot/dts/loongson/3b-package.dtsi | 69 +++++++++++++++++++++
>  arch/mips/boot/dts/loongson/3b1x00_780e.dts | 10 +++
>  arch/mips/boot/dts/loongson/Makefile        |  5 ++
>  arch/mips/boot/dts/loongson/rs780e-pch.dtsi | 35 +++++++++++
>  10 files changed, 222 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/boot/dts/loongson/3a-package.dtsi
>  create mode 100644 arch/mips/boot/dts/loongson/3a1000_780e.dts
>  create mode 100644 arch/mips/boot/dts/loongson/3a2000_780e.dts
>  create mode 100644 arch/mips/boot/dts/loongson/3a3000_780e.dts
>  create mode 100644 arch/mips/boot/dts/loongson/3b-package.dtsi
>  create mode 100644 arch/mips/boot/dts/loongson/3b1x00_780e.dts
>  create mode 100644 arch/mips/boot/dts/loongson/Makefile
>  create mode 100644 arch/mips/boot/dts/loongson/rs780e-pch.dtsi
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index b6bdd96ec74e..5bad9aafcbdf 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -489,6 +489,8 @@ config MACH_LOONGSON64
>  	select SYS_SUPPORTS_LITTLE_ENDIAN
>  	select ZONE_DMA32
>  	select SYS_SUPPORTS_ZBOOT
> +	select USE_OF
> +	select BUILTIN_DTB
>  	help
>  	  This enables the support of Loongson-3A/3B/2-series-soc processors
>  
> @@ -3047,7 +3049,7 @@ endchoice
>  choice
>  	prompt "Kernel command line type" if !CMDLINE_OVERRIDE
>  	default MIPS_CMDLINE_FROM_DTB if USE_OF && !ATH79 && !MACH_INGENIC && \
> -					 !MIPS_MALTA && \
> +					 !MACH_LOONGSON64 && !MIPS_MALTA && \
>  					 !CAVIUM_OCTEON_SOC
>  	default MIPS_CMDLINE_FROM_BOOTLOADER
>  
> diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
> index 1e79cab8e269..d429a69bfe30 100644
> --- a/arch/mips/boot/dts/Makefile
> +++ b/arch/mips/boot/dts/Makefile
> @@ -4,6 +4,7 @@ subdir-y	+= cavium-octeon
>  subdir-y	+= img
>  subdir-y	+= ingenic
>  subdir-y	+= lantiq
> +subdir-y	+= loongson
>  subdir-y	+= mscc
>  subdir-y	+= mti
>  subdir-y	+= netlogic
> diff --git a/arch/mips/boot/dts/loongson/3a-package.dtsi b/arch/mips/boot/dts/loongson/3a-package.dtsi
> new file mode 100644
> index 000000000000..739cf43c7310
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/3a-package.dtsi
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpuintc: interrupt-controller {
> +		#address-cells = <0>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		compatible = "mti,cpu-interrupt-controller";
> +	};
> +
> +	package@0 {

bus@1fe00000

> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges = <0 0x1fe00000 0 0x1fe00000 0x100000
> +				0 0x3ff00000 0 0x3ff00000 0x100000
> +				0xEFD 0xFB000000 0xEFD 0xFB000000 0x10000000 /* 3A HT Config Space */>;

Lowercase hex please.

> +
> +		iointc: interrupt-controller@3ff01400 {
> +			compatible = "loongson,ls3-iointc";
> +			reg = <0 0x3ff01400 0x64>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +
> +			interrupt-parent = <&cpuintc>;
> +			interrupts = <2>;
> +			};

Too much indentation.

> +
> +		cpu_uart0: serial@1fe001e0 {
> +			device_type = "serial";

Drop device_type. It's deprecated for everything but cpu, memory, and 
pci.

> +			compatible = "ns16550a";
> +			reg = <0 0x1fe001e0 0x8>;
> +			clock-frequency = <33000000>;
> +			interrupt-parent = <&iointc>;
> +			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
> +			no-loopback-test;
> +		};
> +
> +		cpu_uart1: serial@1fe001e8 {
> +			status = "disabled";
> +			device_type = "serial";
> +			compatible = "ns16550a";
> +			reg = <0 0x1fe001e8 0x8>;
> +			clock-frequency = <33000000>;
> +			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent = <&iointc>;
> +			no-loopback-test;
> +		};
> +
> +		htintc: interrupt-controller@0xEFDFB000080 {

Drop '0x' and lowercase. Building with 'W=12' will tell you this. Do 
that, and fix the warnings.

> +			compatible = "loongson,ls3-htintc";
> +			reg = <0xEFD 0xFB000080 0x100>;

lowercase

> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			interrupt-parent = <&iointc>;
> +			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
> +						<25 IRQ_TYPE_LEVEL_HIGH>,
> +						<26 IRQ_TYPE_LEVEL_HIGH>,
> +						<27 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +	};
> +};
> diff --git a/arch/mips/boot/dts/loongson/3a1000_780e.dts b/arch/mips/boot/dts/loongson/3a1000_780e.dts
> new file mode 100644
> index 000000000000..dc1afe9410c8
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/3a1000_780e.dts
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +
> +#include "3a-package.dtsi"
> +#include "rs780e-pch.dtsi"
> +
> +/ {
> +	compatible = "loongson,ls3a1000-780e";
> +};
> diff --git a/arch/mips/boot/dts/loongson/3a2000_780e.dts b/arch/mips/boot/dts/loongson/3a2000_780e.dts
> new file mode 100644
> index 000000000000..621e0d3b5fbd
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/3a2000_780e.dts
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +
> +#include "3a-package.dtsi"
> +#include "rs780e-pch.dtsi"
> +
> +/ {
> +	compatible = "loongson,ls3a2000-780e";
> +};
> diff --git a/arch/mips/boot/dts/loongson/3a3000_780e.dts b/arch/mips/boot/dts/loongson/3a3000_780e.dts
> new file mode 100644
> index 000000000000..f170f1c2189d
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/3a3000_780e.dts
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +
> +#include "3a-package.dtsi"
> +#include "rs780e-pch.dtsi"
> +
> +/ {
> +	compatible = "loongson,ls3a3000-780e";
> +};
> diff --git a/arch/mips/boot/dts/loongson/3b-package.dtsi b/arch/mips/boot/dts/loongson/3b-package.dtsi
> new file mode 100644
> index 000000000000..af6e115d33c0
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/3b-package.dtsi

Same comments apply to this file.

Looks like this one is pretty similar to 3a-package.dtsi. Can't you 
share more?

> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpuintc: interrupt-controller {
> +		#address-cells = <0>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		compatible = "mti,cpu-interrupt-controller";
> +	};
> +
> +	package@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges = <0 0x1fe00000 0 0x1fe00000 0x100000
> +				0 0x3ff00000 0 0x3ff00000 0x100000
> +				0x1EFD 0xFB000000 0x1EFD 0xFB000000 0x10000000 /* 3B HT Config Space */>;
> +
> +		iointc: interrupt-controller@3ff01400 {
> +			compatible = "loongson,ls3-iointc";
> +			reg = <0 0x3ff01400 0x64>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +
> +			interrupt-parent = <&cpuintc>;
> +			interrupts = <2>;
> +			};
> +
> +		cpu_uart0: serial@1fe001e0 {
> +			device_type = "serial";
> +			compatible = "ns16550a";
> +			reg = <0 0x1fe001e0 0x8>;
> +			clock-frequency = <33000000>;
> +			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent = <&iointc>;
> +			no-loopback-test;
> +		};
> +
> +		cpu_uart1: serial@1fe001e8 {
> +			status = "disabled";
> +			device_type = "serial";
> +			compatible = "ns16550a";
> +			reg = <0 0x1fe001e8 0x8>;
> +			clock-frequency = <33000000>;
> +			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent = <&iointc>;
> +			no-loopback-test;
> +		};
> +
> +		htintc: interrupt-controller@0x1EFDFB000080 {
> +			compatible = "loongson,ls3-htintc";
> +			reg = <0x1EFD 0xFB000080 0x100>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			interrupt-parent = <&iointc>;
> +			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
> +						<25 IRQ_TYPE_LEVEL_HIGH>,
> +						<26 IRQ_TYPE_LEVEL_HIGH>,
> +						<27 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +	};
> +};
> diff --git a/arch/mips/boot/dts/loongson/3b1x00_780e.dts b/arch/mips/boot/dts/loongson/3b1x00_780e.dts
> new file mode 100644
> index 000000000000..9b0dff0b1482
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/3b1x00_780e.dts
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +
> +#include "3b-package.dtsi"
> +#include "rs780e-pch.dtsi"
> +
> +/ {
> +	compatible = "loongson,ls3b-780e";
> +};
> diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
> new file mode 100644
> index 000000000000..a225d84a521e
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX_License_Identifier: GPL_2.0
> +dtb-$(CONFIG_MACH_LOONGSON64)	+= 3a1000_780e.dtb 3a2000_780e.dtb 3a3000_780e.dtb 3b1x00_780e.dtb \
> +
> +
> +obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
> diff --git a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
> new file mode 100644
> index 000000000000..915363eafa2f
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/ {
> +	pch {

bus@10000000

> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges = <0x000 0x10000000 0x000 0x10000000 0x10000000
> +			  0x000 0x40000000 0x000 0x40000000 0x40000000>;
> +
> +		isa {

This doesn't seem like it would be an accurate representation of the 
h/w. I'd expect this would be behind a PCI bridge for example? How do 
you identify a RS780E chip? Using the top level compatible is not the 
right way to do it.

> +			compatible = "isa";
> +			#address-cells = <2>;
> +			#size-cells = <1>;
> +			ranges = <1 0 0 0 0x1000>;
> +
> +			i8259: interrupt-controller@20 {
> +				compatible = "intel,i8259";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +				plat-poll;
> +				interrupts = <0>, <1>, <2>, <3>, <4>, <5>, <6>, <7>,
> +							<8>, <9>, <10>, <11>, <12>, <13>, <14>, <15>;
> +				interrupt-parent = <&htintc>;
> +			};
> +
> +			rtc0: rtc@70 {
> +				compatible = "motorola,mc146818";
> +				reg = <1 0x70 0x8>;
> +				interrupts = <8>;
> +				interrupt-parent = <&i8259>;
> +			};
> +		};
> +	};
> +};
> -- 
> 2.22.0
> 
