Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97FFF11701B
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2019 16:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfLIPPa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Dec 2019 10:15:30 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:49360 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfLIPPa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Dec 2019 10:15:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1575904528; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8XfP90Nlwni1+fdvvtFIPCYN2PgxWebcTW6S+oGU2DU=;
        b=fVrCyeXpmcJtkdaj0x6BgczRUtY+HTz3bmII6iUJGY1opRCHAqH3xVWglmKWNASEudvk/1
        BqTNVK6oos0oalN6ZkKcmOJTWGKn8m0nNLhHuG6Kvrm/Z7VkiHQbyld/7ghubHKSOOjg7Y
        k+DRmaAIl4KkrzK+aFIYe70rH/4xJiw=
Date:   Mon, 09 Dec 2019 16:15:18 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 5/6] MIPS: X1000: Add missing X1000 nodes.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= "(Zhou Yanjie)" 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        mripard@kernel.org, shawnguo@kernel.org, mark.rutland@arm.com,
        ebiederm@xmission.com, ralf@linux-mips.org, heiko@sntech.de,
        icenowy@aosc.io, laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, geert+renesas@glider.be,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Message-Id: <1575904518.3.3@crapouillou.net>
In-Reply-To: <1575896438-9562-6-git-send-email-zhouyanjie@wanyeetech.com>
References: <1575896438-9562-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1575896438-9562-6-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le lun., d=C3=A9c. 9, 2019 at 21:00, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanj=
ie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Add the appropriate DT node to probe pdma/msc/rtc/watchdog/ethernet
> driver using the devicetree.
>=20
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> ---
>=20
> Notes:
>     v7:
>     New patch, merge[05/12],[07/12],[09/12],[11/12] in v6.
>=20
>  arch/mips/boot/dts/ingenic/x1000.dtsi | 96=20
> +++++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi=20
> b/arch/mips/boot/dts/ingenic/x1000.dtsi
> index 13a6c9ff..398a756 100644
> --- a/arch/mips/boot/dts/ingenic/x1000.dtsi
> +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <dt-bindings/clock/x1000-cgu.h>
> +#include <dt-bindings/dma/x1000-dma.h>
>=20
>  / {
>  	#address-cells =3D <1>;
> @@ -68,6 +69,25 @@
>  		interrupts =3D <27 26 25>;
>  	};
>=20
> +	wdt: watchdog@10002000 {
> +		compatible =3D "ingenic,x1000-watchdog", "ingenic,jz4780-watchdog";
> +		reg =3D <0x10002000 0x10>;
> +
> +		clocks =3D <&cgu X1000_CLK_RTCLK>;
> +		clock-names =3D "rtc";
> +	};

The watchdog node should be a children of the TCU node, see
Documentation/devicetree/bindings/timer/ingenic,tcu.txt


> +
> +	rtc: rtc@10003000 {
> +		compatible =3D "ingenic,x1000-rtc", "ingenic,jz4780-rtc";
> +		reg =3D <0x10003000 0x4c>;
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <32>;
> +
> +		clocks =3D <&cgu X1000_CLK_RTCLK>;
> +		clock-names =3D "rtc";
> +	};
> +
>  	pinctrl: pin-controller@10010000 {
>  		compatible =3D "ingenic,x1000-pinctrl";
>  		reg =3D <0x10010000 0x800>;
> @@ -173,4 +193,80 @@
>=20
>  		status =3D "disabled";
>  	};
> +
> +	pdma: dma-controller@13420000 {
> +		compatible =3D "ingenic,x1000-dma";
> +		reg =3D <0x13420000 0x400
> +			   0x13421000 0x40>;
> +		#dma-cells =3D <2>;
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <10>;
> +
> +		clocks =3D <&cgu X1000_CLK_PDMA>;
> +	};
> +
> +	mac: mac@134b0000 {

Please name the nodes according to the devicetree specification; this=20
should be 'ethernet@134b0000'.


> +		compatible =3D "ingenic,x1000-mac", "snps,dwmac";
> +		reg =3D <0x134b0000 0x2000>;
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <55>;
> +		interrupt-names =3D "macirq";
> +
> +		clocks =3D <&cgu X1000_CLK_MAC>;
> +		clock-names =3D "stmmaceth";
> +
> +		status =3D "disabled";
> +
> +		mdio: mdio {
> +			compatible =3D "snps,dwmac-mdio";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			status =3D "disabled";
> +		};
> +	};
> +
> +	msc0: msc@13450000 {

This should be 'mmc@13450000'


> +		compatible =3D "ingenic,x1000-mmc";
> +		reg =3D <0x13450000 0x1000>;
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <37>;
> +
> +		clocks =3D <&cgu X1000_CLK_MSC0>;
> +		clock-names =3D "mmc";
> +
> +		cap-sd-highspeed;
> +		cap-mmc-highspeed;
> +		cap-sdio-irq;
> +
> +		dmas =3D <&pdma X1000_DMA_MSC0_RX 0xffffffff>,
> +			   <&pdma X1000_DMA_MSC0_TX 0xffffffff>;
> +		dma-names =3D "rx", "tx";
> +
> +		status =3D "disabled";
> +	};
> +
> +	msc1: msc@13460000 {

This should be 'mmc@13460000'.

Cheers,
-Paul

> +		compatible =3D "ingenic,x1000-mmc";
> +		reg =3D <0x13460000 0x1000>;
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <36>;
> +
> +		clocks =3D <&cgu X1000_CLK_MSC1>;
> +		clock-names =3D "mmc";
> +
> +		cap-sd-highspeed;
> +		cap-mmc-highspeed;
> +		cap-sdio-irq;
> +
> +		dmas =3D <&pdma X1000_DMA_MSC1_RX 0xffffffff>,
> +			   <&pdma X1000_DMA_MSC1_TX 0xffffffff>;
> +		dma-names =3D "rx", "tx";
> +
> +		status =3D "disabled";
> +	};
>  };
> --
> 2.7.4
>=20

=

