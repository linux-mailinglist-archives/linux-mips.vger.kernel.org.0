Return-Path: <linux-mips+bounces-12593-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 950F4CDC5E8
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 14:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4595D3010AA2
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 13:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A536B337699;
	Wed, 24 Dec 2025 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="DEHZIvg4"
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8866831196C;
	Wed, 24 Dec 2025 13:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766583618; cv=none; b=W5uE4pWMOTh36A9e6MJGTTS/UAOHga4ag/qydWAYOvH0jVwNS1R2GFuZVv/vzYo/Y2unsU/RyhyDMajB/chUus6obh8SAuaFV+ZCJrkFXWhy3QMAhJeVuQFEuYd6gGjHWRw6GQbLNaHdcMzt5aBxNKbShCvOD116qfLvqem4W6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766583618; c=relaxed/simple;
	bh=bTY5HM17BasmovFf7os5QH3GUWn/+RHsPCkAtVxwwHA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PAyI/7gWSM8UK1Wj/7IM1NWxugCg35d6EkpTsze3BUVB/fD4mjmOyDNa84q8tfQdCqx4BwciZZLgpwmvJYrzRnPAmoJS5istQUhlgCsWvE666MmSeqg4CdY1P82bC0htEFoBsoUgRsbQ0aKCu1s+gMJvSom1ISGXyS+gpUrCJzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=DEHZIvg4; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1766583118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xbu83KDb8EzV5fBCpVF9Ofv9QvuINTQfWgSaYI2v7SA=;
	b=DEHZIvg4Ki+CGC9dPeVP65atqr2lD/HbbCKx2IgDAZyJ++LHBm6mGdJpLvqm1yVa6wvdCo
	e33UpVsAOyw6MNZnD9cFpL+K1heqU7rD5VAIJijN9F4mwjYwoixKdfDqpvXni9X7q/WsRp
	D55qOu5YZ0UXQidG7niJggEcy9NMSOc=
Message-ID: <e661a947f0cefb1651dcd3f7f57855313ad9fd7a.camel@crapouillou.net>
Subject: Re: [PATCH 3/4] mmc: jz4740: Fix Wvoid-pointer-to-enum-cast warning
From: Paul Cercueil <paul@crapouillou.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Aubin
 Constans <aubin.constans@microchip.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Nicolas Ferre	 <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Robert Richter <rric@kernel.org>, Andrew
 Jeffery	 <andrew@codeconstruct.com.au>, Adrian Hunter
 <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers	 <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-mmc@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	linux-mips@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, 	openbmc@lists.ozlabs.org,
 llvm@lists.linux.dev
Date: Wed, 24 Dec 2025 14:30:56 +0100
In-Reply-To: <20251224124431.208434-7-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
	 <20251224124431.208434-7-krzysztof.kozlowski@oss.qualcomm.com>
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

Hi Krzysztof,

Le mercredi 24 d=C3=A9cembre 2025 =C3=A0 13:44 +0100, Krzysztof Kozlowski a
=C3=A9crit=C2=A0:
> "jz4740" is an enum, thus cast of pointer on 64-bit compile test with
> clang W=3D1 causes:
>=20
> =C2=A0 jz4740_mmc.c:1055:18: error: cast to smaller integer type 'enum
> jz4740_mmc_version' from 'const void *' [-Werror,-Wvoid-pointer-to-
> enum-cast]
>=20
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/mmc/host/jz4740_mmc.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mmc/host/jz4740_mmc.c
> b/drivers/mmc/host/jz4740_mmc.c
> index 6a0d0250d47b..6a3c26b7c82d 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -1052,7 +1052,7 @@ static int jz4740_mmc_probe(struct
> platform_device* pdev)
> =C2=A0	host =3D mmc_priv(mmc);
> =C2=A0
> =C2=A0	/* Default if no match is JZ4740 */
> -	host->version =3D (enum
> jz4740_mmc_version)device_get_match_data(&pdev->dev);
> +	host->version =3D (unsigned long)device_get_match_data(&pdev-
> >dev);
> =C2=A0
> =C2=A0	ret =3D mmc_of_parse(mmc);
> =C2=A0	if (ret)

