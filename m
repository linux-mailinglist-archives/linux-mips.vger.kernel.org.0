Return-Path: <linux-mips+bounces-9712-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32796AFF3F3
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 23:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2730D1BC8A51
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 21:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDD623B615;
	Wed,  9 Jul 2025 21:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="iVF8f94E"
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB280A92E;
	Wed,  9 Jul 2025 21:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752096922; cv=none; b=WADJmlOxJsWHWOboLQOlpwWphOA7pv18UFQS9Iw9ZV4+rmErX9QWJ2g+TbNJJcBGpXNB6dGy6P3nx43BSMuV2lv+96ytOlGd9ufT6OzNOVHjx7gSkTFZ4j0JNXbvgBi9W61h6IwiSoCpKcQy6x9XRxJJM9Q7Q9+rlj8Nl2fZheE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752096922; c=relaxed/simple;
	bh=ZfO4tTpnHhlOVCTzI4QpGxMpQ9KbzzhoLV0RV1GM5Ew=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GD0ee0nHBAVK0SJRXc2K36C0Rn/svXXhnPHGjHq9EgwKVQO5SOJJ2hQnGRVKpvWQjcFwJU3/SRyVD9tBLZNM5p21qGb0h+MT9jvbLwyVyVSVeKVC84qUtuZJBeBofH5r3rI1/ezmCDYyGTRQIHj3K5Z92qrnvsQRm3I1HsZGfXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=iVF8f94E; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1752096392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AeNyhU0IbImTOM2sec3z2E+lKGcfLSldUoaa9IlHjM8=;
	b=iVF8f94E7W50OAweMt+hTHDfgObOse4sZp8Eo5dQc8thX1hkibCzhxy/9KVJUZHhnhvRMH
	4eM0KB6bD8knnRyAYR8EVPHw3dxxkjb9768f3Nvq8ePRJgS9TJDf6pTcpd4E4aNpTbvJ0u
	DRWRu5b09tEtU9ZhjgXJKyC9Lf2wwfE=
Message-ID: <5a2c7d244d0467d7236dbce920319c6df519bad7.camel@crapouillou.net>
Subject: Re: [PATCH v2 07/12] pinctrl: ingenic: use
 pinmux_generic_add_pinfunction()
From: Paul Cercueil <paul@crapouillou.net>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij	
 <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>,
 Lorenzo Bianconi	 <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 09 Jul 2025 23:25:30 +0200
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-7-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
	 <20250709-pinctrl-gpio-pinfuncs-v2-7-b6135149c0d9@linaro.org>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Bartosz,

Le mercredi 09 juillet 2025 =C3=A0 16:39 +0200, Bartosz Golaszewski a
=C3=A9crit=C2=A0:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Instead of passing individual fields of struct pinfunction to
> pinmux_generic_add_function(), use pinmux_generic_add_pinfunction()
> and
> pass the entire structure directly.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 5 ++---
> =C2=A01 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
> b/drivers/pinctrl/pinctrl-ingenic.c
> index
> 3c660471ec6911ee494f45d2ffc13c4dc496fd2e..79119cf20efcf8cc701647d9ff9
> 79c2b71bf7589 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -4574,9 +4574,8 @@ static int __init ingenic_pinctrl_probe(struct
> platform_device *pdev)
> =C2=A0		const struct function_desc *function =3D &chip_info-
> >functions[i];
> =C2=A0		const struct pinfunction *func =3D &function->func;
> =C2=A0
> -		err =3D pinmux_generic_add_function(jzpc->pctl, func-
> >name,
> -						=C2=A0 func->groups,
> func->ngroups,
> -						=C2=A0 function->data);
> +		err =3D pinmux_generic_add_pinfunction(jzpc->pctl,
> func,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 function-
> >data);
> =C2=A0		if (err < 0) {
> =C2=A0			dev_err(dev, "Failed to register function
> %s\n", func->name);
> =C2=A0			return err;

