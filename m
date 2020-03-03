Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB0A9177730
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2020 14:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgCCNdb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Mar 2020 08:33:31 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:55358 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbgCCNdb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Mar 2020 08:33:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1583242407; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iSlH7pb0xYuVMpMdsTbWcoW1/wUTkHc5Y3ywcj+WIo0=;
        b=YxSUTn6Uy9SLYxoG/bKkmRsfWb3gn+20GKjrAVEF03z5uMLH3NwxmbiGPiFfXL5Tqgt1+s
        tzUV6PkDFxRGOxCxgBPNGqcnJo8eOb+/yB5sALQRDBiEH0BJqyglu1amQpe5u4MeG4iI8t
        lDyII3YeOv30S+QpltAw1UAjFzJFECo=
Date:   Tue, 03 Mar 2020 10:33:04 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] MIPS: Ingenic: Add missing nodes for X1000 and
 CU1000-Neo.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= "(Zhou Yanjie)" 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        rick.tyliu@ingenic.com, jason@lakedaemon.net,
        keescook@chromium.org, geert+renesas@glider.be, krzk@kernel.org,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, ebiederm@xmission.com
Message-Id: <1583242384.3.0@crapouillou.net>
In-Reply-To: <1579021428-43535-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1579021428-43535-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1579021428-43535-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le mer., janv. 15, 2020 at 01:03, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)=
=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Add I2C0/I2C1/I2C2 nodes for X1000 and add I2C0, ADS7830,
> MSC1, AP6212A, wlan_pwrseq nodes for CU1000-Neo.
>=20
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> ---
>  arch/mips/boot/dts/ingenic/cu1000-neo.dts | 71=20
> +++++++++++++++++++++++++++++++
>  arch/mips/boot/dts/ingenic/x1000.dtsi     | 45 ++++++++++++++++++++

Just as a rule of thumb it's preferred to split devicetree changes into=20
two commits, one that touches the SoC's DTSI, and the second for the=20
board.

Cheers,
-Paul

>  2 files changed, 116 insertions(+)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/cu1000-neo.dts=20
> b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
> index b0733da..03abd94 100644
> --- a/arch/mips/boot/dts/ingenic/cu1000-neo.dts
> +++ b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
> @@ -4,6 +4,7 @@
>  #include "x1000.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/clock/ingenic,tcu.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>=20
>  / {
>  	compatible =3D "yna,cu1000-neo", "ingenic,x1000";
> @@ -21,6 +22,22 @@
>  		device_type =3D "memory";
>  		reg =3D <0x0 0x04000000>;
>  	};
> +
> +	wlan_pwrseq: msc1-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +
> +		clocks =3D <&lpoclk>;
> +		clock-names =3D "ext_clock";
> +
> +		reset-gpios =3D <&gpc 17 GPIO_ACTIVE_LOW>;
> +		post-power-on-delay-ms =3D <200>;
> +
> +		lpoclk: ap6212a {
> +			compatible =3D "fixed-clock";
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <32768>;
> +		};
> +	};
>  };
>=20
>  &exclk {
> @@ -36,6 +53,20 @@
>  	ingenic,pwm-channels-mask =3D <0xfa>;
>  };
>=20
> +&i2c0 {
> +	status =3D "okay";
> +
> +	clock-frequency =3D <400000>;
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pins_i2c0>;
> +
> +	ads7830@48 {
> +		compatible =3D "ti,ads7830";
> +		reg =3D <0x48>;
> +	};
> +};
> +
>  &uart2 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pins_uart2>;
> @@ -78,7 +109,41 @@
>  	status =3D "okay";
>  };
>=20
> +&msc1 {
> +	bus-width =3D <4>;
> +	max-frequency =3D <50000000>;
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pins_msc1>;
> +
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	non-removable;
> +
> +	mmc-pwrseq =3D <&wlan_pwrseq>;
> +
> +	status =3D "okay";
> +
> +	ap6212a: wifi@1 {
> +		compatible =3D "brcm,bcm4329-fmac";
> +		reg =3D <1>;
> +
> +		interrupt-parent =3D <&gpc>;
> +		interrupts =3D <16 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-names =3D "host-wake";
> +
> +		brcm,drive-strength =3D <10>;
> +	};
> +};
> +
>  &pinctrl {
> +	pins_i2c0: i2c0 {
> +		function =3D "i2c0";
> +		groups =3D "i2c0-data";
> +		bias-disable;
> +	};
> +
>  	pins_uart2: uart2 {
>  		function =3D "uart2";
>  		groups =3D "uart2-data-d";
> @@ -96,4 +161,10 @@
>  		groups =3D "mmc0-1bit", "mmc0-4bit", "mmc0-8bit";
>  		bias-disable;
>  	};
> +
> +	pins_msc1: msc1 {
> +		function =3D "mmc1";
> +		groups =3D "mmc1-1bit", "mmc1-4bit";
> +		bias-disable;
> +	};
>  };
> diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi=20
> b/arch/mips/boot/dts/ingenic/x1000.dtsi
> index ea54263..376df1b 100644
> --- a/arch/mips/boot/dts/ingenic/x1000.dtsi
> +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
> @@ -169,6 +169,51 @@
>  		};
>  	};
>=20
> +	i2c0: i2c-controller@10050000 {
> +		compatible =3D "ingenic,x1000-i2c";
> +		reg =3D <0x10050000 0x1000>;
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <60>;
> +
> +		clocks =3D <&cgu X1000_CLK_I2C0>;
> +
> +		status =3D "disabled";
> +	};
> +
> +	i2c1: i2c-controller@10051000 {
> +		compatible =3D "ingenic,x1000-i2c";
> +		reg =3D <0x10051000 0x1000>;
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <59>;
> +
> +		clocks =3D <&cgu X1000_CLK_I2C1>;
> +
> +		status =3D "disabled";
> +	};
> +
> +	i2c2: i2c-controller@10052000 {
> +		compatible =3D "ingenic,x1000-i2c";
> +		reg =3D <0x10052000 0x1000>;
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <58>;
> +
> +		clocks =3D <&cgu X1000_CLK_I2C2>;
> +
> +		status =3D "disabled";
> +	};
> +
>  	uart0: serial@10030000 {
>  		compatible =3D "ingenic,x1000-uart";
>  		reg =3D <0x10030000 0x100>;
> --
> 2.7.4
>=20

=

