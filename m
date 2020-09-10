Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99FD263F27
	for <lists+linux-mips@lfdr.de>; Thu, 10 Sep 2020 09:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgIJHzr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Sep 2020 03:55:47 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:30606 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726816AbgIJHzp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Sep 2020 03:55:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1599724541;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=e9VBlPiC34M9UVRl+ywLVvWDTj+KHlVFnewnlePw73g=;
        b=WeNhEMBMF7TMc7t9aXIrIPXLqnLpPdYd/eDdgHetgboMncbxc37HJOR+6WH2OTls8o
        /G+mhosvV4bpBGIEhVqCcHrQvhn0CaXBcvv9KmArCf09XWufBVqqZESLXJjpdkNUDTyV
        0Mh0ev1coCIYrEw1MhA4JuukR8ZPVKh+c/Uygk3X7TCttLf+OVwIyNRvCOrzGXI0VVhc
        UgbhV1ce4jpC1w1Z7U5EPFo0cYdlW/sBIKx5XlbPtJVIbgghT42a63cQjZDiuRjSj0kc
        pd18AN1IC+D2yQiGtdMvtoZQcSUI9GrFvecSm2/CrgfULkTReYVwiHZH4Ymhw78RU3/k
        8F/A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSfXA0N8oI="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id n03b0dw8A7qcbdz
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 10 Sep 2020 09:52:38 +0200 (CEST)
Subject: Re: [PATCH v8 5/6] MIPS: Ingenic: Add 'cpus' node for Ingenic SoCs.
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1589898923-60048-7-git-send-email-zhouyanjie@wanyeetech.com>
Date:   Thu, 10 Sep 2020 09:52:37 +0200
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, tsbogend@alpha.franken.de,
        paulburton@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com,
        tglx@linutronix.de, robh+dt@kernel.org, daniel.lezcano@linaro.org,
        keescook@chromium.org, paul@crapouillou.net, krzk@kernel.org,
        ebiederm@xmission.com, dongsheng.qiu@ingenic.com,
        yanfei.li@ingenic.com, rick.tyliu@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <8EBCE2D3-8683-4E57-912F-41D03C943CC9@goldelico.com>
References: <1589898923-60048-1-git-send-email-zhouyanjie@wanyeetech.com> <1589898923-60048-7-git-send-email-zhouyanjie@wanyeetech.com>
To:     =?utf-8?Q?=22=E5=91=A8=E7=90=B0=E6=9D=B0_=28Zhou_Yanjie=29=22?= 
        <zhouyanjie@wanyeetech.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou Yanjie,
what is the status of this series? It does not seem to have arrived in =
linux-next for v5.10-rc1.

BR and thanks,
Nikolaus


> Am 19.05.2020 um 16:35 schrieb =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou =
Yanjie) <zhouyanjie@wanyeetech.com>:
>=20
> Add 'cpus' node to the jz4740.dtsi, jz4770.dtsi, jz4780.dtsi
> and x1000.dtsi files.
>=20
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Tested-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) =
<zhouyanjie@wanyeetech.com>
> ---
>=20
> Notes:
>    v1->v2:
>    No change.
>=20
>    v2->v3:
>    No change.
>=20
>    v3->v4:
>    Rebase on top of kernel 5.6-rc1.
>=20
>    v4->v5:
>    No change.
>=20
>    v5->v6:
>    No change.
>=20
>    v6->v7:
>    Update compatible strings.
>=20
>    v7->v8:
>    No change.
>=20
> arch/mips/boot/dts/ingenic/jz4740.dtsi | 14 ++++++++++++++
> arch/mips/boot/dts/ingenic/jz4770.dtsi | 15 ++++++++++++++-
> arch/mips/boot/dts/ingenic/jz4780.dtsi | 23 +++++++++++++++++++++++
> arch/mips/boot/dts/ingenic/x1000.dtsi  | 14 ++++++++++++++
> 4 files changed, 65 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi =
b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> index a3301ba..1f2f896 100644
> --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> @@ -7,6 +7,20 @@
> 	#size-cells =3D <1>;
> 	compatible =3D "ingenic,jz4740";
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
> 	cpuintc: interrupt-controller {
> 		#address-cells =3D <0>;
> 		#interrupt-cells =3D <1>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi =
b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> index 0bfb9ed..12c7101 100644
> --- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> @@ -1,5 +1,4 @@
> // SPDX-License-Identifier: GPL-2.0
> -
> #include <dt-bindings/clock/jz4770-cgu.h>
>=20
> / {
> @@ -7,6 +6,20 @@
> 	#size-cells =3D <1>;
> 	compatible =3D "ingenic,jz4770";
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
> 	cpuintc: interrupt-controller {
> 		#address-cells =3D <0>;
> 		#interrupt-cells =3D <1>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi =
b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> index bb89653..03aeeff 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -8,6 +8,29 @@
> 	#size-cells =3D <1>;
> 	compatible =3D "ingenic,jz4780";
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
> 	cpuintc: interrupt-controller {
> 		#address-cells =3D <0>;
> 		#interrupt-cells =3D <1>;
> diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi =
b/arch/mips/boot/dts/ingenic/x1000.dtsi
> index 147f7d5..2205e1b 100644
> --- a/arch/mips/boot/dts/ingenic/x1000.dtsi
> +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
> @@ -8,6 +8,20 @@
> 	#size-cells =3D <1>;
> 	compatible =3D "ingenic,x1000", "ingenic,x1000e";
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
> 	cpuintc: interrupt-controller {
> 		#address-cells =3D <0>;
> 		#interrupt-cells =3D <1>;
> --=20
> 2.7.4
>=20

