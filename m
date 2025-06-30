Return-Path: <linux-mips+bounces-9544-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCECAED5BD
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 09:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B41B163288
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 07:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754C0221286;
	Mon, 30 Jun 2025 07:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NkPVXBLO"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F3F1ABED9;
	Mon, 30 Jun 2025 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268831; cv=none; b=rM5WF+Zn+9la6HClPm+U3DVx1Rg/7Ogp0oQK0jBDVSqsc97IYWfqi8XcFkIUesmjZza2DwNlQbjMFCjz2MtJ5/FlRajKzptdjqDFXT/Oa4wh7EyAeR+JUy3sArufvKm5ZbOB19mk7wWQHF/8DZp/i3ZJ2U8Yz9DWi1Bz/AwOM+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268831; c=relaxed/simple;
	bh=DJHTEQv4/hw/Znph4oB4Nw/gbXO3L4/U9QiCv+OHl0g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DbPq9ikZqgPUlC8fWBTPZcWSBstO7iJ1xv6KodZicNS45as0/gADJLluiyfy30HWE66eYPgZu4BjyyZaXuEmHnq3pSnLijSaF28wuh1Sd42/UOSLHqqaXZKyj3YFRdz0o6TZhf3F9JyeRTejqqRJMGhc7kdtqG0VwhBthSfYdT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NkPVXBLO; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C83E4446E;
	Mon, 30 Jun 2025 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751268820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4UmfBvVb/I4lQOU9Au4t6rTT14BmfLwehVsevL7PaYs=;
	b=NkPVXBLOFGYNXeUp/ByHOq5+fh6CRSa5MOw8lAXBVzrsFhPSoX4/q73bigjuaaxJAF0w2/
	/jMFjh0X2P0DWekH5+e8RzSQ03tW5QHjkaLbh7AlYI6XHShk3hXG73/QkdCJu/xSDcTsI+
	5pg5UGdC4xPCniw0VdNYe5lZJmduwQnlbr1cjP15cGfHbUbLF9nx7GMoQilgNI+Jw39XkD
	hE5PtfPTUTzRptYW6X6KNTzzaEKNekwn67QAUqjj5mxQak62OyHz3iV0rn19NVOM3KLifP
	V+HWWuKFnfbMEwHPDI9aOpuiv4N/VRbWidDw47CpRAXbvOZiZGVDNUTZqx4qTQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Adrian Hunter <adrian.hunter@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>,
 linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 3/6] MIPS: mobileye: dts: eyeq6h: add the emmc controller
In-Reply-To: <9b482b7469695b303269dba26b476ac70695dc3a.1750156323.git.benoit.monin@bootlin.com>
References: <cover.1750156323.git.benoit.monin@bootlin.com>
 <9b482b7469695b303269dba26b476ac70695dc3a.1750156323.git.benoit.monin@bootlin.com>
Date: Mon, 30 Jun 2025 09:33:38 +0200
Message-ID: <87h5zxisz1.fsf@BLaptop.bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffffkgggtgfesthhqredttddtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfegvdehgfdtjedvtefhvdeikefgteeuhfeukeettefgvdeuueettddtkeegveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffeekieemsgdvtgdvmegstghfjeemlegurgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffeekieemsgdvtgdvmegstghfjeemlegurgejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopegsvghnohhithdrmhhonhhinhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehulhhfrdhhrghnshhsohhnsehlihhnrghrohdrohhrghdprhgtphhtthhopehrohgshhesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvg
X-GND-Sasl: gregory.clement@bootlin.com

Hello Beno=C3=AEt,

> Add the MMC/SDHCI controller found in the eyeQ6 SoC. It is based on the
> cadence sd4hc controller and support modes up to HS400 enhanced strobe.
>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

As the binding had been accpeted and merged:

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory


> ---
>  arch/mips/boot/dts/mobileye/eyeq6h.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi b/arch/mips/boot/dts=
/mobileye/eyeq6h.dtsi
> index dabd5ed778b7..bbd463435ad6 100644
> --- a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
> +++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
> @@ -109,6 +109,28 @@ olb_east: system-controller@d3358000 {
>  			clock-names =3D "ref";
>  		};
>=20=20
> +		emmc: sdhci@d8010000 {
> +			compatible =3D "mobileye,eyeq-sd4hc", "cdns,sd4hc";
> +			reg =3D <0 0xd8010000 0x0 0x1000>;
> +			interrupt-parent =3D <&gic>;
> +			interrupts =3D <GIC_SHARED 91 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&olb_south EQ6HC_SOUTH_DIV_EMMC>;
> +			bus-width =3D <8>;
> +			max-frequency =3D <200000000>;
> +			mmc-ddr-1_8v;
> +			sd-uhs-ddr50;
> +			mmc-hs200-1_8v;
> +			mmc-hs400-1_8v;
> +			mmc-hs400-enhanced-strobe;
> +
> +			cdns,phy-input-delay-legacy =3D <4>;
> +			cdns,phy-input-delay-mmc-highspeed =3D <2>;
> +			cdns,phy-input-delay-mmc-ddr =3D <3>;
> +			cdns,phy-dll-delay-sdclk =3D <32>;
> +			cdns,phy-dll-delay-sdclk-hsmmc =3D <32>;
> +			cdns,phy-dll-delay-strobe =3D <32>;
> +		};
> +
>  		olb_south: system-controller@d8013000 {
>  			compatible =3D "mobileye,eyeq6h-south-olb", "syscon";
>  			reg =3D <0x0 0xd8013000 0x0 0x1000>;

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

