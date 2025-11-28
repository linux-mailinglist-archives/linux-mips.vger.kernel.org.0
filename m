Return-Path: <linux-mips+bounces-12368-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B35C91842
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 10:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 91841348329
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 09:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A1430595B;
	Fri, 28 Nov 2025 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JOi7Dg/L"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375292FBDF4
	for <linux-mips@vger.kernel.org>; Fri, 28 Nov 2025 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764323363; cv=none; b=PAfO5W2bdBEcDHo/hjJvQ+v8+9h9U6TeDD5QkoLVgnUHMECb59ZzDOIc49I50Q1lWnP8GovVp1d5phr7KIXt9ovLjisHHhxGJokLEsT9Uki17S0HE83wRJ/cKpbdgVbGyqqga3Uc2cK9f1KRIkdOGh+l6rh4b/JgznUO9riDPl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764323363; c=relaxed/simple;
	bh=0ZspJz73evHURHmiLCyoJ0nhxF39VWjJkTDbSFMIEZE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZRvURK2TFJ8qgZqXfNpxXUH4CkBikoOqxjyDiWt5k42JriAA/r2bKbBsdbX7paFsPf80MDF+ATLoETscFlCbl4NYJ7dd1FIDpGb9ElzOxE5TJUvf5KqR7APIcdfculPpsQRkGujTLs9xumWx+WYwiQWr4fQ/kW1EF4KcPdz9K20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JOi7Dg/L; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 98D334E41942;
	Fri, 28 Nov 2025 09:49:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6C16E60706;
	Fri, 28 Nov 2025 09:49:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 341BA103C8F6E;
	Fri, 28 Nov 2025 10:49:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764323358; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=poFRywdDw4b5kkwZmyK4oI1lM/Jt1iTCeXkK8T/qMZI=;
	b=JOi7Dg/LM5TzombJrQ065O6lY82NOE0PqDpI62p9G+hCU2Nny6Zibx6DElFKgfJlkaOgGs
	lkKgXIj8WeA098pZeP3jZ6qod1/LwYfFdaLkOzROuR5VSMPwvZrWDHcUb5WCNdX614W4cg
	/uNXuPuUS5aGYOTAjWLsNMLKmGNdc9a7L48csqvGS3C+bG7XtEHNsY6/zoiGhyaQAoIVvq
	3NUZYfA4cGXi8RJqMy2OWkRV4yeY/5wm8hPtelwVrh9Hy1rXMBolEEbSxA7lMZTOQ3B3l1
	ZBsyHAn8D6rfGXu6KZ2SpHYGc/ubtfv2kqLstQlKxC0cIbeeexd4fWcOYXslbQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: =?utf-8?Q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir
 Kondratiev
 <vladimir.kondratiev@mobileye.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham
 I <kishon@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, =?utf-8?Q?Beno=C3=AEt?= Monin
 <benoit.monin@bootlin.com>, Maxime
 Chevallier <maxime.chevallier@bootlin.com>, Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v4 6/7] MIPS: mobileye: eyeq5: add two Cadence GEM
 Ethernet controllers
In-Reply-To: <20251124-macb-phy-v4-6-955c625a81a7@bootlin.com>
References: <20251124-macb-phy-v4-0-955c625a81a7@bootlin.com>
 <20251124-macb-phy-v4-6-955c625a81a7@bootlin.com>
Date: Fri, 28 Nov 2025 10:49:13 +0100
Message-ID: <87y0nq4hd2.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Thomas,

> Add both MACB/GEM instances found in the Mobileye EyeQ5 SoC.
>
> Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Can you confirm that you will include this patch and the following one
in your mips-next branch?

As you gave your Acked-by on it, I believe this will be the case, but I
want to be sure they aren't forgotten.

Thanks!

Gregory

> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  arch/mips/boot/dts/mobileye/eyeq5.dtsi | 45 ++++++++++++++++++++++++++++=
++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/=
mobileye/eyeq5.dtsi
> index 36a73e8a63a1..cec5ad875228 100644
> --- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
> +++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
> @@ -77,6 +77,8 @@ aliases {
>  		serial0 =3D &uart0;
>  		serial1 =3D &uart1;
>  		serial2 =3D &uart2;
> +		ethernet0 =3D &macb0;
> +		ethernet1 =3D &macb1;
>  	};
>=20=20
>  	cpu_intc: interrupt-controller {
> @@ -231,6 +233,7 @@ olb: system-controller@e00000 {
>  			#clock-cells =3D <1>;
>  			clocks =3D <&xtal>;
>  			clock-names =3D "ref";
> +			#phy-cells =3D <1>;
>  		};
>=20=20
>  		gic: interrupt-controller@140000 {
> @@ -305,6 +308,48 @@ gpio1: gpio@1500000 {
>  			#interrupt-cells =3D <2>;
>  			resets =3D <&olb 0 26>;
>  		};
> +
> +		iocu-bus {
> +			compatible =3D "simple-bus";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges;
> +			dma-coherent;
> +			dma-ranges =3D <0x10 0x00000000 0x0 0x0 0x10 0>;
> +
> +			macb0: ethernet@2a00000 {
> +				compatible =3D "mobileye,eyeq5-gem";
> +				reg =3D <0x0 0x02a00000 0x0 0x4000>;
> +				interrupt-parent =3D <&gic>;
> +				/* One interrupt per queue */
> +				interrupts =3D <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
> +				clock-names =3D "pclk", "hclk", "tsu_clk";
> +				clocks =3D <&pclk>, <&pclk>, <&tsu_clk>;
> +				nvmem-cells =3D <&eth0_mac>;
> +				nvmem-cell-names =3D "mac-address";
> +				phys =3D <&olb 0>;
> +			};
> +
> +			macb1: ethernet@2b00000 {
> +				compatible =3D "mobileye,eyeq5-gem";
> +				reg =3D <0x0 0x02b00000 0x0 0x4000>;
> +				interrupt-parent =3D <&gic>;
> +				/* One interrupt per queue */
> +				interrupts =3D <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
> +				clock-names =3D "pclk", "hclk", "tsu_clk";
> +				clocks =3D <&pclk>, <&pclk>, <&tsu_clk>;
> +				nvmem-cells =3D <&eth1_mac>;
> +				nvmem-cell-names =3D "mac-address";
> +				phys =3D <&olb 1>;
> +			};
> +		};
> +
>  	};
>  };
>=20=20
>
> --=20
> 2.51.2
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

