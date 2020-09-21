Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3162723ED
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 14:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgIUMc6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 08:32:58 -0400
Received: from crapouillou.net ([89.234.176.41]:41228 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726341AbgIUMc6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Sep 2020 08:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1600691574; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tVS4ej/3zLZ3sk2zDSTgF5J1k9yrLkihVwDA0T36HJ8=;
        b=EJgPDLmQYQ55aeVw/XzHq90ypXv8fyF8RuG87VqQ/hav1J1JJbQGX6MT9oe9I8vQGtLUy9
        kVwXS8PFjRErOBIgKCcg2OgAFE3ntYBegiHb2NDrvlkVGiblEiOX3yg9AXCfpIKX9PXQ25
        eBNNvk/5ptOb05ypmWczJtE/75Lpu+A=
Date:   Mon, 21 Sep 2020 14:32:41 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/1] MIPS: Ingenic: Add CPU nodes for Ingenic SoCs.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     robh+dt@kernel.org, tsbogend@alpha.franken.de,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Message-Id: <HID0HQ.YOE31HIO6RXQ2@crapouillou.net>
In-Reply-To: <20200919113859.88566-2-zhouyanjie@wanyeetech.com>
References: <20200919113859.88566-1-zhouyanjie@wanyeetech.com>
        <20200919113859.88566-2-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le sam. 19 sept. 2020 =C3=A0 19:38, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanji=
e)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Add 'cpus' node to the jz4725b.dtsi, jz4740.dtsi, jz4770.dtsi,
> jz4780.dtsi, x1000.dtsi, and x1830.dtsi files.
>=20
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Tested-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  arch/mips/boot/dts/ingenic/jz4725b.dtsi | 14 ++++++++++++++
>  arch/mips/boot/dts/ingenic/jz4740.dtsi  | 14 ++++++++++++++
>  arch/mips/boot/dts/ingenic/jz4770.dtsi  | 15 ++++++++++++++-
>  arch/mips/boot/dts/ingenic/jz4780.dtsi  | 23 +++++++++++++++++++++++
>  arch/mips/boot/dts/ingenic/x1000.dtsi   | 14 ++++++++++++++
>  arch/mips/boot/dts/ingenic/x1830.dtsi   | 14 ++++++++++++++
>  6 files changed, 93 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/jz4725b.dtsi=20
> b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
> index a8fca560878d..a1f0b71c9223 100644
> --- a/arch/mips/boot/dts/ingenic/jz4725b.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
> @@ -7,6 +7,20 @@
>  	#size-cells =3D <1>;
>  	compatible =3D "ingenic,jz4725b";
>=20
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "ingenic,xburst-mxu1.0";
> +			reg =3D <0>;
> +
> +			clocks =3D <&cgu JZ4725B_CLK_CCLK>;
> +			clock-names =3D "cpu";
> +		};
> +	};
> +
>  	cpuintc: interrupt-controller {
>  		#address-cells =3D <0>;
>  		#interrupt-cells =3D <1>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi=20
> b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> index 1520585c235c..eee523678ce5 100644
> --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> @@ -7,6 +7,20 @@
>  	#size-cells =3D <1>;
>  	compatible =3D "ingenic,jz4740";
>=20
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "ingenic,xburst-mxu1.0";
> +			reg =3D <0>;
> +
> +			clocks =3D <&cgu JZ4740_CLK_CCLK>;
> +			clock-names =3D "cpu";
> +		};
> +	};
> +
>  	cpuintc: interrupt-controller {
>  		#address-cells =3D <0>;
>  		#interrupt-cells =3D <1>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi=20
> b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> index fa11ac950499..018721a9eea9 100644
> --- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> @@ -1,5 +1,4 @@
>  // SPDX-License-Identifier: GPL-2.0
> -
>  #include <dt-bindings/clock/jz4770-cgu.h>
>  #include <dt-bindings/clock/ingenic,tcu.h>
>=20
> @@ -8,6 +7,20 @@
>  	#size-cells =3D <1>;
>  	compatible =3D "ingenic,jz4770";
>=20
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "ingenic,xburst-fpu1.0-mxu1.1";
> +			reg =3D <0>;
> +
> +			clocks =3D <&cgu JZ4770_CLK_CCLK>;
> +			clock-names =3D "cpu";
> +		};
> +	};
> +
>  	cpuintc: interrupt-controller {
>  		#address-cells =3D <0>;
>  		#interrupt-cells =3D <1>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi=20
> b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> index b7f409a7cf5d..dfb5a7e1bb21 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -8,6 +8,29 @@
>  	#size-cells =3D <1>;
>  	compatible =3D "ingenic,jz4780";
>=20
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "ingenic,xburst-fpu1.0-mxu1.1";
> +			reg =3D <0>;
> +
> +			clocks =3D <&cgu JZ4780_CLK_CPU>;
> +			clock-names =3D "cpu";
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type =3D "cpu";
> +			compatible =3D "ingenic,xburst-fpu1.0-mxu1.1";
> +			reg =3D <1>;
> +
> +			clocks =3D <&cgu JZ4780_CLK_CORE1>;
> +			clock-names =3D "cpu";
> +		};
> +	};
> +
>  	cpuintc: interrupt-controller {
>  		#address-cells =3D <0>;
>  		#interrupt-cells =3D <1>;
> diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi=20
> b/arch/mips/boot/dts/ingenic/x1000.dtsi
> index 9de9e7c2d523..1f1f896dd1f7 100644
> --- a/arch/mips/boot/dts/ingenic/x1000.dtsi
> +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
> @@ -8,6 +8,20 @@
>  	#size-cells =3D <1>;
>  	compatible =3D "ingenic,x1000", "ingenic,x1000e";
>=20
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "ingenic,xburst-fpu1.0-mxu1.1";
> +			reg =3D <0>;
> +
> +			clocks =3D <&cgu X1000_CLK_CPU>;
> +			clock-names =3D "cpu";
> +		};
> +	};
> +
>  	cpuintc: interrupt-controller {
>  		#address-cells =3D <0>;
>  		#interrupt-cells =3D <1>;
> diff --git a/arch/mips/boot/dts/ingenic/x1830.dtsi=20
> b/arch/mips/boot/dts/ingenic/x1830.dtsi
> index eb1214481a33..b05dac3ae308 100644
> --- a/arch/mips/boot/dts/ingenic/x1830.dtsi
> +++ b/arch/mips/boot/dts/ingenic/x1830.dtsi
> @@ -8,6 +8,20 @@
>  	#size-cells =3D <1>;
>  	compatible =3D "ingenic,x1830";
>=20
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "ingenic,xburst-fpu2.0-mxu2.0";
> +			reg =3D <0>;
> +
> +			clocks =3D <&cgu X1830_CLK_CPU>;
> +			clock-names =3D "cpu";
> +		};
> +	};
> +
>  	cpuintc: interrupt-controller {
>  		#address-cells =3D <0>;
>  		#interrupt-cells =3D <1>;
> --
> 2.11.0
>=20


