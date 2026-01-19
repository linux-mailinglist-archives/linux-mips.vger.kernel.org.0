Return-Path: <linux-mips+bounces-12972-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E924D3B5A8
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jan 2026 19:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52E4830101C8
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jan 2026 18:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5703933F8;
	Mon, 19 Jan 2026 18:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="anIf6K9h"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94123392B97;
	Mon, 19 Jan 2026 18:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768847082; cv=none; b=e2zxGeiDdM7lC0eiyDlPQaBFUKNdTznqg0PWUjlxy8H0lpapaLOYwx+4SsDcq8XnftqiIbgDG1v9/ji1ahP2fFVeRzY6w47LMlieDLNzFH6tSA0R84fy5kjGXxHbf1A4Je2rbxHNtQ7Fs8/Q21ht6cc5TWug8/2zxC64DCn5E7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768847082; c=relaxed/simple;
	bh=rVKyjSfwEXBlwMHJABPAXE+L9WGnExVoTwshvmiGBG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncQSm3vT9ujv0yqkUZtrmturcaGlm6t43WZNOhhQihKnnJ7YpyNKN5gcEU8F0sgSGOwBXK+EtPcpdp1zQ/eyaBWu8dFdtptYjnAM24yIKoXHyFnbmjfdjO+iKh/++3yLo9/qjVmDPQjYycafnPVTAZRQ7c+SHM4L9YTwFPjpMBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=anIf6K9h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D096C116C6;
	Mon, 19 Jan 2026 18:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768847081;
	bh=rVKyjSfwEXBlwMHJABPAXE+L9WGnExVoTwshvmiGBG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=anIf6K9hbgxB60zqcoQuHlhUQUFfstQszQZ0zoxZlw1QOaA7SUduzZkYCAWgO5r0x
	 TdbwmKEVh0Zmfrlro8tJSkvDMZQk1QJq5HTCaouGEC93DNUMO3UybErQIqumkCyWSk
	 hFqT+9miXpsVISZVrGCZ/14sy84Ns78Fh+ow/BnsgW1bTcPTFvYFllR6AAiawshePZ
	 xhw7CJTaGc8F5CWZa8uvkSgEyzPj8v4Glwg0YH/+sZYPuYX2tastAwN3YsvuzmrjpN
	 637rwGzp9L7Fn7rBEWzlTQLlccmLgMFEtIm5TFZ0beXOEan88BlpHWFsXY/BPVoAf/
	 IhJ+C7VxDOCzA==
Date: Mon, 19 Jan 2026 18:24:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: rtc: loongson: Correct Loongson-1C
 interrupts property
Message-ID: <20260119-tricking-premiere-ada70700f804@spud>
References: <cover.1768616276.git.zhoubinbin@loongson.cn>
 <b6295c907410f6708115cba4df0959ee6629f8a5.1768616276.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bojys3mM3aryUS6I"
Content-Disposition: inline
In-Reply-To: <b6295c907410f6708115cba4df0959ee6629f8a5.1768616276.git.zhoubinbin@loongson.cn>


--bojys3mM3aryUS6I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 10:26:48AM +0800, Binbin Zhou wrote:
> The `interrupts` property indicates an RTC alarm interrupt, which is
> required for RTCs that support the alarm feature, which is not supported
> by the Loongson-1C RTC. We exclude it for a more accurate description.
>=20
> Changing the `allowed` property is ABI-breaking behavior, but
> throughout the existing Loongson DTS{i}, the description of the RTC
> nodes conforms to the modified bingding rules.

Right, changing properties is an ABI break, but when following the ABI
would've produced something non-functional, breaking it is not really
relevant.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> Thus, the existing Loongson DTS{i} will not be affected.
>=20
> Fixes: 487ef32caebe ("dt-bindings: rtc: Split loongson,ls2x-rtc into SoC-=
based compatibles")
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../devicetree/bindings/rtc/loongson,rtc.yaml         | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/Do=
cumentation/devicetree/bindings/rtc/loongson,rtc.yaml
> index f89c1f660aee..fac90a18153e 100644
> --- a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> @@ -42,6 +42,17 @@ required:
> =20
>  unevaluatedProperties: false
> =20
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - loongson,ls1c-rtc
> +
> +then:
> +  properties:
> +    interrupts: false
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> --=20
> 2.47.3
>=20

--bojys3mM3aryUS6I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaW524wAKCRB4tDGHoIJi
0qcsAQDwQadTKGf/m7VgqtUK6dcI6Jup5Y/tY3x8IRntQ4JkMAEA/83SzAxBkQ5C
ccwFRxCEHS7NLLied4j6KoRWhtJ13AA=
=ngsi
-----END PGP SIGNATURE-----

--bojys3mM3aryUS6I--

