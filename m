Return-Path: <linux-mips+bounces-9742-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B08B9B01F06
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 16:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEF171CC079B
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 14:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BE42E5B26;
	Fri, 11 Jul 2025 14:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pmOMn7Y2"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEEE2E54B8;
	Fri, 11 Jul 2025 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752243757; cv=none; b=MtBpr38he8s01lR50f/n6D9/ORtVQIXRolSXrwKAOqX/E9KtKL7vX4ybpMXUKrW5LfKESc5ZrErHauAx4A49SlAxdtuTjDVhjcLt2493b0w92qzvf5LVL/T+YdkN6v4qDO0VvBGQqgHOyvfntzmzZSdZlOrvexC68GSBFu5/O8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752243757; c=relaxed/simple;
	bh=vUqW1CnXGFRy2YsJi/VeXaNO5jcm79xIZL/zIBC0sdA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bZeVtyfcJXJ7aO1BSk2Mp7zCac+ewhJFXUPcfn+Juv7/m3wLR1RXfHshGIFBU76k2YWAnun+8Rx+cMieHM5hx2reWiDzT8VstHb1Z7fpIF3/bq8zwA6DITVkt/b1d4PtWx+7dFx5pHLM31yzkRQ0fGrfkNwqv2+eUlJaYy1QMMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pmOMn7Y2; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2844F441C3;
	Fri, 11 Jul 2025 14:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752243753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=co9kfUudHzme+ynSewyj4m+ErOxSbwZz/BG/8E0932k=;
	b=pmOMn7Y2hjjP5JVQtku5hzSZmKL6J2+4J2xe47cf5i9Mc3FM3KHAJP41VrNo6z0E6TdWmG
	0dhuHVtvJnDBCqnHSM3rTh1HX9R/FZYM59MaUak0wjbpnHMrHjEoaczCFavwL7XI8AdPXi
	U/LtzZi+/bEc43fGq2rqHNNbOzNWRFkgWqPPLJhE1FKwhH6v6EfBVBIC+XyQldiWrl1Wfp
	0mUrUZ5+9ezUfJWWRZaKerIIxhBQpU+uwqLFCb4gxQ5eBwxYr98fS4wm9j/VpC/jEkA+dR
	eR8DdotfbGfqIMMOzIZiNAy5YOwGaDkDsxtL7IHXN2Q+FRvuPdSAOQyVftrNsA==
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
Subject: Re: [PATCH 4/6] MIPS: mobileye: eyeq5: add two GPIO bank nodes
In-Reply-To: <20250704-of-commits-v1-4-dc2006bf2846@bootlin.com>
References: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>
 <20250704-of-commits-v1-4-dc2006bf2846@bootlin.com>
Date: Fri, 11 Jul 2025 16:22:32 +0200
Message-ID: <87bjpqzu1j.fsf@BLaptop.bootlin.com>
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

> This platform uses the same GPIO controller as Nomadik. It however has
> its own pinconf & pinmux controller. EyeQ5 is the first platform to use
> gpio-nomadik independently from pinctrl-nomadik.
>

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  arch/mips/boot/dts/mobileye/eyeq5.dtsi | 30 ++++++++++++++++++++++++++++=
++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/=
mobileye/eyeq5.dtsi
> index b9b6f2684e675020d0377147a04d7ad5bfc272c1..b8df7906231d065032b12d0ff=
dc93a75c8f3e822 100644
> --- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
> +++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
> @@ -253,6 +253,36 @@ timer {
>  				clocks =3D <&olb EQ5C_CPU_CORE0>;
>  			};
>  		};
> +
> +		gpio0: gpio@1400000 {
> +			compatible =3D "mobileye,eyeq5-gpio";
> +			reg =3D <0x0 0x1400000 0x0 0x1000>;
> +			gpio-bank =3D <0>;
> +			ngpios =3D <29>;
> +			interrupt-parent =3D <&gic>;
> +			interrupts =3D <GIC_SHARED 14 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			gpio-ranges =3D <&olb 0 0 29>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +			resets =3D <&olb 0 26>;
> +		};
> +
> +		gpio1: gpio@1500000 {
> +			compatible =3D "mobileye,eyeq5-gpio";
> +			reg =3D <0x0 0x1500000 0x0 0x1000>;
> +			gpio-bank =3D <1>;
> +			ngpios =3D <23>;
> +			interrupt-parent =3D <&gic>;
> +			interrupts =3D <GIC_SHARED 14 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			gpio-ranges =3D <&olb 0 29 23>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +			resets =3D <&olb 0 26>;
> +		};
>  	};
>  };
>=20=20
>
> --=20
> 2.50.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

