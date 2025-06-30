Return-Path: <linux-mips+bounces-9546-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B36AAED5CB
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 09:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F873188603A
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 07:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35774221DB5;
	Mon, 30 Jun 2025 07:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kOK75j+7"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22041FF7D7;
	Mon, 30 Jun 2025 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268927; cv=none; b=Zq51W5HkghNbnTnQyBM2IRDtXjSXaG7OwG5TnkcaSEiiuUF3ARItZ7k66G3EaUgwCUM8rQdSiNabWVyQXoawJxbIDpMhRkhRIKa4DEY6WUEogwi1L39fDmYHZiOTzz7o202pQTDJXXu9NyY4W2K/Vqs9JZPesMiagydOSm54ys8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268927; c=relaxed/simple;
	bh=jkIlxlqR6dkhaRi5tKtg0KroXow+mtT58NSsTlcQK84=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZFo5LQYdvn/hZNGBZ8vKB4HjwAg2udEM3wtuPZEx4yX7YYfMmIMg420LjNxAzNz2PJJXuIxRuNXbh5VkrpHfE0tgT4NiSUu6cgsl8jQbhKM9eA/j8ai6CrUM0Aekcr22/cRCd9JSI/fSZp3CdVf7kP6mp3QDUQNhez/ODF0jl7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kOK75j+7; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A5244436F;
	Mon, 30 Jun 2025 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751268917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JuVJ/CxPFVKaLj6q3g7OpqlgAGq7QUGwLKk52Bvpvho=;
	b=kOK75j+7YnpfYwL2R4pu19Ic3etEL48gJSANQnXMicYqwk9NNVSOK7sNwMywPO4XoUDH/c
	Q0yBqzCKNgteoFeEqaOnLBbLY3+/wIeVL3Wu0AxhOqmGvYJaf0pg0gmTdJ/GegcjKduaL1
	nxqLq93gFCkiMPmEbXaXl6izG5ciJIPvyJX/LSheuyYD1ik+Mb+HZFSRe1R5jWxTjm3Uku
	OCSasTw85InjQ48efBNhqAgI2hhHkMOB6sUs0hJjQ2sPUVK7FusZ70cIjggshfhfyDppHL
	CsEoxzIjWDizKZOpxsJu6m42FkuM+GXM7KWE+u2tp1pQY4drsbPGQlv7C5PCMA==
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
Subject: Re: [PATCH 5/6] MIPS: mobileye: dts: eyeq5: add the emmc controller
In-Reply-To: <1846b26773eb48cc970bba1524e9d2a7a612a2e3.1750156323.git.benoit.monin@bootlin.com>
References: <cover.1750156323.git.benoit.monin@bootlin.com>
 <1846b26773eb48cc970bba1524e9d2a7a612a2e3.1750156323.git.benoit.monin@bootlin.com>
Date: Mon, 30 Jun 2025 09:35:15 +0200
Message-ID: <87bjq5iswc.fsf@BLaptop.bootlin.com>
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

> Add the MMC/SDHCI controller found in the eyeQ5 SoC. It is based on the
> cadence sd4hc controller and support modes up to HS400 enhanced strobe.
>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

The binding being accepted,

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory


> ---
>  arch/mips/boot/dts/mobileye/eyeq5.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/=
mobileye/eyeq5.dtsi
> index a84e6e720619..e15d9ce0bdf4 100644
> --- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
> +++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
> @@ -178,6 +178,28 @@ timer {
>  				clocks =3D <&olb EQ5C_CPU_CORE0>;
>  			};
>  		};
> +
> +		emmc: sdhci@2200000 {
> +			compatible =3D "mobileye,eyeq-sd4hc", "cdns,sd4hc";
> +			reg =3D <0 0x2200000 0x0 0x1000>;
> +			interrupt-parent =3D <&gic>;
> +			interrupts =3D <GIC_SHARED 10 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&olb EQ5C_PER_EMMC>;
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
>  	};
>  };
>=20=20

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

