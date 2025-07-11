Return-Path: <linux-mips+bounces-9740-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96708B01EFD
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 16:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F9641899EF5
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 14:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354BC2E54D5;
	Fri, 11 Jul 2025 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LNl5IEFV"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B8E2E499A;
	Fri, 11 Jul 2025 14:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752243698; cv=none; b=lcYA91RPxFvfTd0PcyjraCygW98CkM2Mk3969hx0kr4bVT/ZofBCF4c458+Vs1mxwy9Fp2Eu5oHqkUqw7sHaRy9YhCb6mro2no7TIjVRay4DmVSdNhSt8PEDlvkkuUIcphaXmlXg1hfdjUzHfxskCifhP7X0tnJQoz48qQmhs5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752243698; c=relaxed/simple;
	bh=xDO9ZI+VgzovdGPw5qIhe3Di7MzRpMahQn0BuIPnKrI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k4SaeNdSOiW82hkrFePztsv7LHakoBbtlUTZoD+/ieXChIvTCtp0JuhmBh6yOY9kBuKuGPDfpDOg4S8BIdti0Vtzr30yDDb8FL98i5vSabVdxpu2j+ugTNfHfOg6XMKBhyfrkan/9gy1jD+PazNDvNCD6dJBmQZA0DVtNqG+Yr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LNl5IEFV; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4F0E442D4;
	Fri, 11 Jul 2025 14:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752243693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PQfujfpr4jBi7kFmzTG5mVX3fJtqhias2MfqjlRkMKg=;
	b=LNl5IEFV0YRD4Rr3CnV78iMnRoOJXWGWbA++Yl/IC2JmemyaNTuO7FlM3wgQ8rSLKdrfHu
	kDJSgpjqiSOPXw+77DRSSlSDUsTfPRSKA4pwu9p1hArwmB9wev6RwI9A4AkG4N17Bnist6
	u1Fcp80LJcYNgz8u3dihsbXw8FAGvKLi4X9o0jKrWRHT1Xj5RVW+8C7xn6UYoNzGHaagDb
	StX58aiQnjMZ1hRLOMmcjrBuFoOGUPRkClemi3FAE0trnVniPN/pNBRDIBZDB9yL5L206S
	Ed4XsIN/aW5uTWkMwUeZbx+N9U4Mrae0VyJHoM1gIfp/HLTLBsSMnbUJI15yaQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: =?utf-8?Q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Thomas
 Bogendoerfer
 <tsbogend@alpha.franken.de>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, =?utf-8?Q?Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, Andi
 Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 2/6] MIPS: mobileye: eyeq5: add 5 I2C controller nodes
In-Reply-To: <20250704-of-commits-v1-2-dc2006bf2846@bootlin.com>
References: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>
 <20250704-of-commits-v1-2-dc2006bf2846@bootlin.com>
Date: Fri, 11 Jul 2025 16:21:32 +0200
Message-ID: <87ikjyzu37.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffffkgggtgfesthhqredttddtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfegvdehgfdtjedvtefhvdeikefgteeuhfeukeettefgvdeuueettddtkeegveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeegtgejkeemvdektggvmeeftgejgeemfeeggegtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeegtgejkeemvdektggvmeeftgejgeemfeeggegtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehvlhgru
 ghimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtrgiffhhikhdrsggrhihouhhksehmohgsihhlvgihvgdrtghomh
X-GND-Sasl: gregory.clement@bootlin.com

Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> writes:

> Add the SoC I2C controller nodes to the platform devicetree. Use a
> default bus frequency of 400kHz. They are AMBA devices that are matched
> on PeriphID.
>
> Set transfer timeout to 10ms instead of Linux's default of 200ms.
>

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  arch/mips/boot/dts/mobileye/eyeq5.dtsi | 75 ++++++++++++++++++++++++++++=
++++++
>  1 file changed, 75 insertions(+)
>
> diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/=
mobileye/eyeq5.dtsi
> index a84e6e720619ef99e1405ae6296d8bad1aa3fa23..b9b6f2684e675020d0377147a=
04d7ad5bfc272c1 100644
> --- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
> +++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
> @@ -110,6 +110,81 @@ soc: soc {
>  		ranges;
>  		compatible =3D "simple-bus";
>=20=20
> +		i2c0: i2c@300000 {
> +			compatible =3D "mobileye,eyeq5-i2c", "arm,primecell";
> +			reg =3D <0 0x300000 0x0 0x1000>;
> +			interrupt-parent =3D <&gic>;
> +			interrupts =3D <GIC_SHARED 1 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-frequency =3D <400000>; /* Fast mode */
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			clocks =3D <&olb 35>, <&olb EQ5C_PER_I2C>;
> +			clock-names =3D "i2cclk", "apb_pclk";
> +			resets =3D <&olb 0 13>;
> +			i2c-transfer-timeout-us =3D <10000>;
> +			mobileye,olb =3D <&olb 0>;
> +		};
> +
> +		i2c1: i2c@400000 {
> +			compatible =3D "mobileye,eyeq5-i2c", "arm,primecell";
> +			reg =3D <0 0x400000 0x0 0x1000>;
> +			interrupt-parent =3D <&gic>;
> +			interrupts =3D <GIC_SHARED 2 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-frequency =3D <400000>; /* Fast mode */
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			clocks =3D <&olb 35>, <&olb EQ5C_PER_I2C>;
> +			clock-names =3D "i2cclk", "apb_pclk";
> +			resets =3D <&olb 0 14>;
> +			i2c-transfer-timeout-us =3D <10000>;
> +			mobileye,olb =3D <&olb 1>;
> +		};
> +
> +		i2c2: i2c@500000 {
> +			compatible =3D "mobileye,eyeq5-i2c", "arm,primecell";
> +			reg =3D <0 0x500000 0x0 0x1000>;
> +			interrupt-parent =3D <&gic>;
> +			interrupts =3D <GIC_SHARED 3 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-frequency =3D <400000>; /* Fast mode */
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			clocks =3D <&olb 35>, <&olb EQ5C_PER_I2C>;
> +			clock-names =3D "i2cclk", "apb_pclk";
> +			resets =3D <&olb 0 15>;
> +			i2c-transfer-timeout-us =3D <10000>;
> +			mobileye,olb =3D <&olb 2>;
> +		};
> +
> +		i2c3: i2c@600000 {
> +			compatible =3D "mobileye,eyeq5-i2c", "arm,primecell";
> +			reg =3D <0 0x600000 0x0 0x1000>;
> +			interrupt-parent =3D <&gic>;
> +			interrupts =3D <GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-frequency =3D <400000>; /* Fast mode */
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			clocks =3D <&olb 35>, <&olb EQ5C_PER_I2C>;
> +			clock-names =3D "i2cclk", "apb_pclk";
> +			resets =3D <&olb 0 16>;
> +			i2c-transfer-timeout-us =3D <10000>;
> +			mobileye,olb =3D <&olb 3>;
> +		};
> +
> +		i2c4: i2c@700000 {
> +			compatible =3D "mobileye,eyeq5-i2c", "arm,primecell";
> +			reg =3D <0 0x700000 0x0 0x1000>;
> +			interrupt-parent =3D <&gic>;
> +			interrupts =3D <GIC_SHARED 5 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-frequency =3D <400000>; /* Fast mode */
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			clocks =3D <&olb 35>, <&olb EQ5C_PER_I2C>;
> +			clock-names =3D "i2cclk", "apb_pclk";
> +			resets =3D <&olb 0 17>;
> +			i2c-transfer-timeout-us =3D <10000>;
> +			mobileye,olb =3D <&olb 4>;
> +		};
> +
>  		uart0: serial@800000 {
>  			compatible =3D "arm,pl011", "arm,primecell";
>  			reg =3D <0 0x800000 0x0 0x1000>;
>
> --=20
> 2.50.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

