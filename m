Return-Path: <linux-mips+bounces-9741-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA16B01F00
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 16:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07C4D7AA20A
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 14:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE462E5B3D;
	Fri, 11 Jul 2025 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b4QqE7oi"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE052E54B8;
	Fri, 11 Jul 2025 14:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752243717; cv=none; b=WXHfj253AGDIcTfB/950/vnZak0YcjPVKHPH6YzebMCQ+plLJ96zo+vF8KwcxAgLcO99mb5XRq/kbmutIXPL6Veql7OtUNdWnrQtL3pYKjcpueiJ5PEaggvp1znHyjXPyBc364z6FZ1+Ur9p1QH993l9BEH11PxMbtRN31WOPHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752243717; c=relaxed/simple;
	bh=HDy6PFdQ3E4Vdi0jPVdMPslxkqrY7m/jqE5kHMRImH0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tSVEQV0tkwgrjprfJVbkrPuO3AwcggW5Fw5DGNWaoqqx+Rc7oVPJJKszDHY7PavRZCXH1z3La+9vR3IbizAFG7mLpMNmzffhbDmgD0H5jH5fSbDOypByYdxMMi6wqQQz3LiP8PvfYa5bwxrPf8zdECbfFgdATO1KYZZmOlQWr+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b4QqE7oi; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 181C544331;
	Fri, 11 Jul 2025 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752243712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yxTLGEdRZNF/BgRLb1qdklOLUfdDCpyHBsv0ymoPu4Q=;
	b=b4QqE7oi4aaFaXVonAQjRSr+UAFDDM2kNR0GNPmE3NrH7AOAeO/SUTqXTYqRWPVrxY9nn+
	OGl0griKajz3OHa6tNMhHqS+YfjrCTIjVIhJl3dTrJitEl0IgKmfbXUU20E9xRJREXZn2s
	zMLEQH1M132naTSERnD+u4f2FZDYt0Ygb0SMHbqHkoH4Igt/7kql+fObtGNUNSYcjXNOGP
	iUwH2d6qqU1XjA8MX5lQBHuYO1zrfOpT7nE8xmf21ravqoFHUle0QYnM1M9VC9aTVydmlN
	g7f5iuMDHKZgVwPqWgwe3URgsixbR/i6XX69MqV1zPbw3qguHO2Wo6tWx0jnlw==
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
Subject: Re: [PATCH 3/6] MIPS: mobileye: eyeq5: add evaluation board I2C
 temp sensor
In-Reply-To: <20250704-of-commits-v1-3-dc2006bf2846@bootlin.com>
References: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>
 <20250704-of-commits-v1-3-dc2006bf2846@bootlin.com>
Date: Fri, 11 Jul 2025 16:21:51 +0200
Message-ID: <87frf2zu2o.fsf@BLaptop.bootlin.com>
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

> Declare the temperature sensor on I2C bus 2. Its label is the schematics
> identifier.
>
Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  arch/mips/boot/dts/mobileye/eyeq5-epm5.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts b/arch/mips/boot/=
dts/mobileye/eyeq5-epm5.dts
> index 6898b2d8267dfadeea511a84d1df3f70744f17bb..9fc1a1b0a81bec5ec52db1723=
1104c86020d7e3b 100644
> --- a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
> +++ b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
> @@ -21,3 +21,11 @@ memory@0 {
>  		      <0x8 0x02000000 0x0 0x7E000000>;
>  	};
>  };
> +
> +&i2c2 {
> +	temperature-sensor@48 {
> +		compatible =3D "ti,tmp112";
> +		reg =3D <0x48>;
> +		label =3D "U60";
> +	};
> +};
>
> --=20
> 2.50.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

