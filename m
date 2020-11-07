Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27DAF2AA791
	for <lists+linux-mips@lfdr.de>; Sat,  7 Nov 2020 20:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbgKGTP3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 7 Nov 2020 14:15:29 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:8882 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727871AbgKGTP3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 7 Nov 2020 14:15:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604776524;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=VPOKhyfPL8uTs1nvvdkKQu1NRg1ObuQOhSkYNvpYKOY=;
        b=s0F/IYep/oajrlURGo6ZNy6U1lPKLMZ8Gi6BqFOw1AgGF8eHcmxr8IAg6NgMytvQbm
        kvJWkWmHw+kdRHXolcgIDtJlmGOPiPmUXFM2kO7/dhMwkguPwE/N7O1M2YWs531vZgYY
        rgGq4DI5FiMQfZUeVLJyEGDBSzJpGMeI3NF9PqWmstG4BqeeMgXeEvcJaJSxAU7l3S6t
        0yTQax/JAbJsVigBo04X0RuFOuW/+ga9B/M8D7c90jdhASRTES88e8RHztvluA2x551D
        IyP3VSO4TWU3vJU1jmgYABGU5TgZnUsOwBDAUmtivchw0Xo+tbptj+I1FL9pnI8VsB94
        aGWw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSVXAgNkQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id d04888wA7J3K7Tf
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 7 Nov 2020 20:03:20 +0100 (CET)
Subject: Re: [PATCH 1/2] MIPS: Ingenic: Add missing nodes for Ingenic SoCs and boards.
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20201107115251.86182-2-zhouyanjie@wanyeetech.com>
Date:   Sat, 7 Nov 2020 20:03:19 +0100
Cc:     tsbogend@alpha.franken.de, paul@crapouillou.net,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        nixiaoming@huawei.com, paulburton@kernel.org, krzk@kernel.org,
        ak@linux.intel.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <A9536791-F713-4CD8-80B9-4BDA6A136E50@goldelico.com>
References: <20201107115251.86182-1-zhouyanjie@wanyeetech.com> <20201107115251.86182-2-zhouyanjie@wanyeetech.com>
To:     =?utf-8?Q?=22=E5=91=A8=E7=90=B0=E6=9D=B0_=28Zhou_Yanjie=29=22?= 
        <zhouyanjie@wanyeetech.com>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 07.11.2020 um 12:52 schrieb =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou =
Yanjie) <zhouyanjie@wanyeetech.com>:
>=20
> 1.Add OTG/OTG PHY/RNG nodes for JZ4780, CGU/OTG nodes for CI20.
> 2.Add OTG/OTG PHY/RNG/OST nodes for X1000, SSI/CGU/OST/OTG/SC16IS752
>  nodes for CU1000-Neo.
> 3.Add OTG/OTG PHY/DTRNG/OST nodes for X1830, SSI/CGU/OST/OTG/SC16IS752
>  nodes for CU1830-Neo.
>=20
> Tested-by: =E5=91=A8=E6=AD=A3 (Zhou Zheng) <sernia.zhou@foxmail.com>

Comments below for CI20 / jz4780 only.

I tried to test on top of my v5.10 working tree but the CI20 does not =
boot any more.
Maybe the SMP hacks are in the way and I have to remove them first or =
try on top
of v5.9.y

> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) =
<zhouyanjie@wanyeetech.com>
> ---
> arch/mips/boot/dts/ingenic/ci20.dts       | 16 +++++++++
> arch/mips/boot/dts/ingenic/cu1000-neo.dts | 60 =
+++++++++++++++++++++++++++----
> arch/mips/boot/dts/ingenic/cu1830-neo.dts | 60 =
+++++++++++++++++++++++++++----
> arch/mips/boot/dts/ingenic/jz4780.dtsi    | 41 +++++++++++++++++++--
> arch/mips/boot/dts/ingenic/x1000.dtsi     | 52 =
++++++++++++++++++++++++++-
> arch/mips/boot/dts/ingenic/x1830.dtsi     | 54 =
+++++++++++++++++++++++++++-
> 6 files changed, 267 insertions(+), 16 deletions(-)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts =
b/arch/mips/boot/dts/ingenic/ci20.dts
> index 75f5bfbf2c37..b31054a41754 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -93,6 +93,15 @@
> 	clock-frequency =3D <48000000>;
> };
>=20
> +&cgu {
> +	/*
> +	 * Use the 32.768 kHz oscillator as the parent of the RTC for a =
higher
> +	 * precision.
> +	 */
> +	assigned-clocks =3D <&cgu JZ4780_CLK_RTC>;
> +	assigned-clock-parents =3D <&cgu JZ4780_CLK_RTCLK>;
> +};
> +

ok

> &mmc0 {
> 	status =3D "okay";
>=20
> @@ -396,6 +405,13 @@
> 	status =3D "okay";
> };
>=20
> +&otg {
> +	status =3D "okay";
> +
> +	assigned-clocks =3D <&cgu JZ4780_CLK_OTGPHY>;
> +	assigned-clock-rates =3D <48000000>;
> +};
> +

ok

> &pinctrl {
> 	pins_uart0: uart0 {
> 		function =3D "uart0";
> diff --git a/arch/mips/boot/dts/ingenic/cu1000-neo.dts =
b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
> index 22a1066d637b..44d47d12db12 100644
> --- a/arch/mips/boot/dts/ingenic/cu1000-neo.dts
> +++ b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
> @@ -3,7 +3,7 @@
>=20
> #include "x1000.dtsi"
> #include <dt-bindings/gpio/gpio.h>
> -#include <dt-bindings/clock/ingenic,tcu.h>
> +#include <dt-bindings/clock/ingenic,sysost.h>
> #include <dt-bindings/interrupt-controller/irq.h>
>=20
> / {
> @@ -31,6 +31,18 @@
> 		};
> 	};
>=20
> +	ssi: spi-gpio {
> +		compatible =3D "spi-gpio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		num-chipselects =3D <1>;
> +
> +		mosi-gpios =3D <&gpd 2 GPIO_ACTIVE_HIGH>;
> +		miso-gpios =3D <&gpd 3 GPIO_ACTIVE_HIGH>;
> +		sck-gpios =3D <&gpd 0 GPIO_ACTIVE_HIGH>;
> +		cs-gpios =3D <&gpd 1 GPIO_ACTIVE_HIGH>;
> +	};
> +
> 	wlan_pwrseq: msc1-pwrseq {
> 		compatible =3D "mmc-pwrseq-simple";
>=20
> @@ -43,13 +55,19 @@
> 	clock-frequency =3D <24000000>;
> };
>=20
> -&tcu {
> +&cgu {
> +	/*
> +	 * Use the 32.768 kHz oscillator as the parent of the RTC for a =
higher
> +	 * precision.
> +	 */
> +	assigned-clocks =3D <&cgu X1000_CLK_RTC>;
> +	assigned-clock-parents =3D <&cgu X1000_CLK_RTCLK>;
> +};
> +
> +&ost {
> 	/* 1500 kHz for the system timer and clocksource */
> -	assigned-clocks =3D <&tcu TCU_CLK_TIMER0>, <&tcu =
TCU_CLK_TIMER2>;
> +	assigned-clocks =3D <&ost OST_CLK_PERCPU_TIMER>, <&ost =
OST_CLK_GLOBAL_TIMER>;
> 	assigned-clock-rates =3D <1500000>, <1500000>;
> -
> -	/* Use channel #0 for the system timer channel #2 for the =
clocksource */
> -	ingenic,pwm-channels-mask =3D <0xfa>;
> };
>=20
> &uart2 {
> @@ -59,6 +77,32 @@
> 	pinctrl-0 =3D <&pins_uart2>;
> };
>=20
> +&ssi {
> +	status =3D "okay";
> +
> +	spi-max-frequency =3D <50000000>;
> +
> +	sc16is752: expander@0 {
> +		compatible =3D "nxp,sc16is752";
> +		reg =3D <0>; /* CE0 */
> +		spi-max-frequency =3D <4000000>;
> +
> +		clocks =3D <&exclk_sc16is752>;
> +
> +		interrupt-parent =3D <&gpc>;
> +		interrupts =3D <6 IRQ_TYPE_EDGE_FALLING>;
> +
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +
> +		exclk_sc16is752: sc16is752 {
> +			compatible =3D "fixed-clock";
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <48000000>;
> +		};
> +	};
> +};
> +
> &i2c0 {
> 	status =3D "okay";
>=20
> @@ -135,6 +179,10 @@
> 	};
> };
>=20
> +&otg {
> +	status =3D "okay";
> +};
> +
> &pinctrl {
> 	pins_uart2: uart2 {
> 		function =3D "uart2";
> diff --git a/arch/mips/boot/dts/ingenic/cu1830-neo.dts =
b/arch/mips/boot/dts/ingenic/cu1830-neo.dts
> index 640f96c00d63..7a56e344e429 100644
> --- a/arch/mips/boot/dts/ingenic/cu1830-neo.dts
> +++ b/arch/mips/boot/dts/ingenic/cu1830-neo.dts
> @@ -3,7 +3,7 @@
>=20
> #include "x1830.dtsi"
> #include <dt-bindings/gpio/gpio.h>
> -#include <dt-bindings/clock/ingenic,tcu.h>
> +#include <dt-bindings/clock/ingenic,sysost.h>
> #include <dt-bindings/interrupt-controller/irq.h>
>=20
> / {
> @@ -31,6 +31,18 @@
> 		};
> 	};
>=20
> +	ssi0: spi-gpio {
> +		compatible =3D "spi-gpio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		num-chipselects =3D <1>;
> +
> +		mosi-gpios =3D <&gpc 12 GPIO_ACTIVE_HIGH>;
> +		miso-gpios =3D <&gpc 11 GPIO_ACTIVE_HIGH>;
> +		sck-gpios =3D <&gpc 15 GPIO_ACTIVE_HIGH>;
> +		cs-gpios =3D <&gpc 16 GPIO_ACTIVE_HIGH>;
> +	};
> +
> 	wlan_pwrseq: msc1-pwrseq {
> 		compatible =3D "mmc-pwrseq-simple";
>=20
> @@ -43,13 +55,19 @@
> 	clock-frequency =3D <24000000>;
> };
>=20
> -&tcu {
> +&cgu {
> +	/*
> +	 * Use the 32.768 kHz oscillator as the parent of the RTC for a =
higher
> +	 * precision.
> +	 */
> +	assigned-clocks =3D <&cgu X1830_CLK_RTC>;
> +	assigned-clock-parents =3D <&cgu X1830_CLK_RTCLK>;
> +};
> +
> +&ost {
> 	/* 1500 kHz for the system timer and clocksource */
> -	assigned-clocks =3D <&tcu TCU_CLK_TIMER0>, <&tcu =
TCU_CLK_TIMER2>;
> +	assigned-clocks =3D <&ost OST_CLK_PERCPU_TIMER>, <&ost =
OST_CLK_GLOBAL_TIMER>;
> 	assigned-clock-rates =3D <1500000>, <1500000>;
> -
> -	/* Use channel #0 for the system timer channel #2 for the =
clocksource */
> -	ingenic,pwm-channels-mask =3D <0xfa>;
> };
>=20
> &uart1 {
> @@ -59,6 +77,32 @@
> 	pinctrl-0 =3D <&pins_uart1>;
> };
>=20
> +&ssi0 {
> +	status =3D "okay";
> +
> +	spi-max-frequency =3D <50000000>;
> +
> +	sc16is752: expander@0 {
> +		compatible =3D "nxp,sc16is752";
> +		reg =3D <0>; /* CE0 */
> +		spi-max-frequency =3D <4000000>;
> +
> +		clocks =3D <&exclk_sc16is752>;
> +
> +		interrupt-parent =3D <&gpb>;
> +		interrupts =3D <18 IRQ_TYPE_EDGE_FALLING>;
> +
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +
> +		exclk_sc16is752: sc16is752 {
> +			compatible =3D "fixed-clock";
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <48000000>;
> +		};
> +	};
> +};
> +
> &i2c0 {
> 	status =3D "okay";
>=20
> @@ -135,6 +179,10 @@
> 	};
> };
>=20
> +&otg {
> +	status =3D "okay";
> +};
> +
> &pinctrl {
> 	pins_uart1: uart1 {
> 		function =3D "uart1";
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi =
b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> index dfb5a7e1bb21..8837147e5a84 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -61,13 +61,30 @@
> 	};
>=20
> 	cgu: jz4780-cgu@10000000 {
> -		compatible =3D "ingenic,jz4780-cgu";
> +		compatible =3D "ingenic,jz4780-cgu", "simple-mfd";
> 		reg =3D <0x10000000 0x100>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <0x0 0x10000000 0x100>;
> +
> +		#clock-cells =3D <1>;
>=20
> 		clocks =3D <&ext>, <&rtc>;
> 		clock-names =3D "ext", "rtc";
>=20
> -		#clock-cells =3D <1>;
> +		otg_phy: usb-phy@3c {
> +			compatible =3D "ingenic,jz4780-phy";
> +			reg =3D <0x3c 0x10>;
> +
> +			clocks =3D <&cgu JZ4780_CLK_OTG1>;
> +
> +			#phy-cells =3D <0>;
> +		};
> +
> +		rng: rng@d8 {
> +			compatible =3D "ingenic,jz4780-rng";
> +			reg =3D <0xd8 0x8>;
> +		};
> 	};
>=20
> 	tcu: timer@10002000 {
> @@ -494,4 +511,24 @@
>=20
> 		status =3D "disabled";
> 	};
> +
> +	otg: usb@13500000 {
> +		compatible =3D "ingenic,jz4780-otg", "snps,dwc2";
> +		reg =3D <0x13500000 0x40000>;
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <21>;
> +
> +		clocks =3D <&cgu JZ4780_CLK_UHC>;
> +		clock-names =3D "otg";
> +
> +		phys =3D <&otg_phy>;
> +		phy-names =3D "usb2-phy";
> +
> +		g-rx-fifo-size =3D <768>;

I had tested with 256 before and do not see a reason why 768 should not =
work as well.

> +		g-np-tx-fifo-size =3D <256>;
> +		g-tx-fifo-size =3D <256 256 256 256 256 256 256 512>;
> +
> +		status =3D "disabled";
> +	};
> };
> diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi =
b/arch/mips/boot/dts/ingenic/x1000.dtsi
> index 1f1f896dd1f7..854fac58f45e 100644
> --- a/arch/mips/boot/dts/ingenic/x1000.dtsi
> +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
> @@ -52,13 +52,43 @@
> 	};
>=20
> 	cgu: x1000-cgu@10000000 {
> -		compatible =3D "ingenic,x1000-cgu";
> +		compatible =3D "ingenic,x1000-cgu", "simple-mfd";
> 		reg =3D <0x10000000 0x100>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <0x0 0x10000000 0x100>;
>=20
> 		#clock-cells =3D <1>;
>=20
> 		clocks =3D <&exclk>, <&rtclk>;
> 		clock-names =3D "ext", "rtc";
> +
> +		otg_phy: usb-phy@3c {
> +			compatible =3D "ingenic,x1000-phy";
> +			reg =3D <0x3c 0x10>;
> +
> +			clocks =3D <&cgu X1000_CLK_OTGPHY>;
> +
> +			#phy-cells =3D <0>;
> +		};
> +
> +		rng: rng@d8 {
> +			compatible =3D "ingenic,x1000-rng";
> +			reg =3D <0xd8 0x8>;
> +		};
> +	};
> +
> +	ost: timer@12000000 {
> +		compatible =3D "ingenic,x1000-ost";
> +		reg =3D <0x12000000 0x3c>;
> +
> +		#clock-cells =3D <1>;
> +
> +		clocks =3D <&cgu X1000_CLK_OST>;
> +		clock-names =3D "ost";
> +
> +		interrupt-parent =3D <&cpuintc>;
> +		interrupts =3D <3>;
> 	};
>=20
> 	tcu: timer@10002000 {
> @@ -323,4 +353,24 @@
> 			status =3D "disabled";
> 		};
> 	};
> +
> +	otg: usb@13500000 {
> +		compatible =3D "ingenic,x1000-otg", "snps,dwc2";
> +		reg =3D <0x13500000 0x40000>;
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <21>;
> +
> +		clocks =3D <&cgu X1000_CLK_OTG>;
> +		clock-names =3D "otg";
> +
> +		phys =3D <&otg_phy>;
> +		phy-names =3D "usb2-phy";
> +
> +		g-rx-fifo-size =3D <768>;
> +		g-np-tx-fifo-size =3D <256>;
> +		g-tx-fifo-size =3D <256 256 256 256 256 256 256 512>;
> +
> +		status =3D "disabled";
> +	};
> };
> diff --git a/arch/mips/boot/dts/ingenic/x1830.dtsi =
b/arch/mips/boot/dts/ingenic/x1830.dtsi
> index b05dac3ae308..4831350efdf2 100644
> --- a/arch/mips/boot/dts/ingenic/x1830.dtsi
> +++ b/arch/mips/boot/dts/ingenic/x1830.dtsi
> @@ -52,13 +52,38 @@
> 	};
>=20
> 	cgu: x1830-cgu@10000000 {
> -		compatible =3D "ingenic,x1830-cgu";
> +		compatible =3D "ingenic,x1830-cgu", "simple-mfd";
> 		reg =3D <0x10000000 0x100>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <0x0 0x10000000 0x100>;
>=20
> 		#clock-cells =3D <1>;
>=20
> 		clocks =3D <&exclk>, <&rtclk>;
> 		clock-names =3D "ext", "rtc";
> +
> +		otg_phy: usb-phy@3c {
> +			compatible =3D "ingenic,x1830-phy";
> +			reg =3D <0x3c 0x10>;
> +
> +			clocks =3D <&cgu X1830_CLK_OTGPHY>;
> +
> +			#phy-cells =3D <0>;
> +		};
> +	};
> +
> +	ost: timer@12000000 {
> +		compatible =3D "ingenic,x1830-ost", "ingenic,x1000-ost";
> +		reg =3D <0x12000000 0x3c>;
> +
> +		#clock-cells =3D <1>;
> +
> +		clocks =3D <&cgu X1830_CLK_OST>;
> +		clock-names =3D "ost";
> +
> +		interrupt-parent =3D <&cpuintc>;
> +		interrupts =3D <4>;
> 	};
>=20
> 	tcu: timer@10002000 {
> @@ -236,6 +261,13 @@
> 		status =3D "disabled";
> 	};
>=20
> +	dtrng: trng@10072000 {
> +		compatible =3D "ingenic,x1830-dtrng";
> +		reg =3D <0x10072000 0xc>;
> +
> +		clocks =3D <&cgu X1830_CLK_DTRNG>;
> +	};
> +
> 	pdma: dma-controller@13420000 {
> 		compatible =3D "ingenic,x1830-dma";
> 		reg =3D <0x13420000 0x400
> @@ -311,4 +343,24 @@
> 			status =3D "disabled";
> 		};
> 	};
> +
> +	otg: usb@13500000 {
> +		compatible =3D "ingenic,x1830-otg", "snps,dwc2";
> +		reg =3D <0x13500000 0x40000>;
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <21>;
> +
> +		clocks =3D <&cgu X1830_CLK_OTG>;
> +		clock-names =3D "otg";
> +
> +		phys =3D <&otg_phy>;
> +		phy-names =3D "usb2-phy";
> +
> +		g-rx-fifo-size =3D <768>;
> +		g-np-tx-fifo-size =3D <256>;
> +		g-tx-fifo-size =3D <256 256 256 256 256 256 256 512>;
> +
> +		status =3D "disabled";
> +	};
> };
> --=20
> 2.11.0
>=20

