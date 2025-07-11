Return-Path: <linux-mips+bounces-9744-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C55B01F13
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 16:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A184A3A8FD2
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 14:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F742E7188;
	Fri, 11 Jul 2025 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L5Gtn6ts"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECBE2E7173;
	Fri, 11 Jul 2025 14:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752243881; cv=none; b=WdNlWU8qPgk5c38vwAPno2vIEqNa34qgejeXhJZv3BpUuVyFYwkvnSETfuaaWjCLGSM+iIDFpoNJMRAc+h5cOu0Ktk1MHxsY1/vJ2E+h60dRBTyJNLf8qaetkloWZlpqzMIkq4Ag8CTja/4rp4R3CEgv1LsVoZTHZgNk4Wn8a9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752243881; c=relaxed/simple;
	bh=P39kone9XZuitcmbOsxdyjGpJUGQ2368IZcGwihY4FQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HcCPTheu2wZqXGghGErMWDx47p2rHmw1wRLsjBOKGvTaX6XhDKpSJlXmZ4l3y+43qYKxlr0nuCGCmygyrUkHkDLAKTxvvQT+sFqU1mxtHN4xVKFC7A+b08Czm2EUvM03mP25j+6zkn/G8Lg8pPwemTsjjod+AHZfWijjXb7FFFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L5Gtn6ts; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 973CF4433D;
	Fri, 11 Jul 2025 14:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752243878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X250uNXRjCdPYbf+o4AQHLp5HVh20/o2yTh9cFPa6P8=;
	b=L5Gtn6tsEGWCH2xjJvTrWlXU/YT/vbnkXwelwxLDuwjMuzacyl+ATAAqQ1VeU5vqiS3WnP
	dkzkQGpd1IhWXqdb8V2csamplGQnnuLY/gLPWeWXlbMERSs72VvVjhORlOIRZCcMHe871V
	uYrvmENzQRyhkHMDgrm1tZOUtV+/jNkY2/9KNE5uQCRta2ai48dl7zHMhu0NOodIsjT+Xo
	gvJ1jcQBLxll8Axo+fsshoYXwTOFoORRnaLvmHNTxS3mIHm7MeTz4hATh4n0KW0ppVgCS8
	VQn1sjsBQrrIP2h+zM1t4JoNA31NhlSETx4Rb0Ewq5LhORgVqSVTOTJTzJamtw==
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
 <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 6/6] MIPS: eyeq5_defconfig: add I2C subsystem, driver
 and temp sensor driver
In-Reply-To: <20250704-of-commits-v1-6-dc2006bf2846@bootlin.com>
References: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>
 <20250704-of-commits-v1-6-dc2006bf2846@bootlin.com>
Date: Fri, 11 Jul 2025 16:24:37 +0200
Message-ID: <875xfyzty2.fsf@BLaptop.bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffffkgggtgfesthhqredttddtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfegvdehgfdtjedvtefhvdeikefgteeuhfeukeettefgvdeuueettddtkeegveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeegtgejkeemvdektggvmeeftgejgeemfeeggegtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeegtgejkeemvdektggvmeeftgejgeemfeeggegtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehvlhgru
 ghimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtrgiffhhikhdrsggrhihouhhksehmohgsihhlvgihvgdrtghomh
X-GND-Sasl: gregory.clement@bootlin.com

Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> writes:

> Enable I2C support on the EyeQ5 platform. The evaluation board has a
> temperature sensor mounted which helps test the integration.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory
> ---
>  arch/mips/configs/eyeq5_defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/mips/configs/eyeq5_defconfig b/arch/mips/configs/eyeq5_=
defconfig
> index 05a579e21970eed203d96bd4b8103d030e39f262..2064b79b59b6d94bf003f0c2c=
95e61948c77b1b0 100644
> --- a/arch/mips/configs/eyeq5_defconfig
> +++ b/arch/mips/configs/eyeq5_defconfig
> @@ -62,10 +62,14 @@ CONFIG_CAN_M_CAN=3Dy
>  CONFIG_SERIAL_AMBA_PL011=3Dy
>  CONFIG_SERIAL_AMBA_PL011_CONSOLE=3Dy
>  CONFIG_HW_RANDOM=3Dy
> +CONFIG_I2C=3Dy
> +CONFIG_I2C_CHARDEV=3Dy
> +CONFIG_I2C_NOMADIK=3Dy
>  # CONFIG_PTP_1588_CLOCK is not set
>  CONFIG_PINCTRL=3Dy
>  CONFIG_GPIOLIB=3Dy
>  CONFIG_GPIO_NOMADIK=3Dy
> +CONFIG_SENSORS_LM75=3Dy
>  CONFIG_MFD_SYSCON=3Dy
>  CONFIG_HID_A4TECH=3Dy
>  CONFIG_HID_BELKIN=3Dy
>
> --=20
> 2.50.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

