Return-Path: <linux-mips+bounces-8051-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D7A4A18D
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 19:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82F24175D64
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 18:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1DE2755F6;
	Fri, 28 Feb 2025 18:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="rRXuZPY5"
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58582755E5;
	Fri, 28 Feb 2025 18:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.234.176.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740767374; cv=none; b=pRebwCJBGWcNTtJZwMShou3W/osOQfEqHbX35ceYTMoilxiCq0yqId8ZF+2kTqkal5Ng/eb/WVxJpcTHtO+A/hlgHyHiogwe5scyKeEk9bLELVxF19cRcwqVijBeQMJJW8++qxnv4Y/+Pwc2E89ycC6oN/RkqHgsXf4Ufic8LiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740767374; c=relaxed/simple;
	bh=GdT+FAgbr7YwWuisQ170ntVSMrN/XYHPwVBuOoYX/Zc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rESsofqQ9LnvPFxnLhiZM/i6e6bFyJXARQ3jxmzgHPoQbgvgdfNke6bcjm7sX3f2mBmVVGlnCZBMQKNPgViHzfALXh/9rflH7zB6iA+Xf/v9K/jN/TELS4A5jl27zvnakzWR6Qc4Iqa/Mwe+k3DjLdRhOGJkenZKbWE0GRLEgXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=rRXuZPY5; arc=none smtp.client-ip=89.234.176.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1740767370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GdT+FAgbr7YwWuisQ170ntVSMrN/XYHPwVBuOoYX/Zc=;
	b=rRXuZPY5ppmvJrIqNUkY2LCcwmGUj0xvFH3Ey5JXpY4l7FONLXUlZXmktoc1WX5o+tch7E
	VRMTAo7GnVVTxfovz1qPaOie3uFo1DyeWDNVvhgWFhOvig5DZXxKMEMR132rIO8kWjhazL
	/FVbC0mVSbYoIuFPmBESRc2d7cq+DSA=
Message-ID: <3bf98fabea4b7b35816411a2253e08848d900401.camel@crapouillou.net>
Subject: Re: [PATCH v2 0/4] pinctrl: ingenic: add support for x1600 SoC and
 MII and I2S for jz4730
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Linus Walleij	
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>, Paul Boddie
 <paul@boddie.org.uk>,  Tim Bysun <tim.bysun@ingenic.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Date: Fri, 28 Feb 2025 19:28:28 +0100
In-Reply-To: <cover.1740749637.git.hns@goldelico.com>
References: <cover.1740749637.git.hns@goldelico.com>
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

Hi Nikolaus,

Le vendredi 28 f=C3=A9vrier 2025 =C3=A0 14:33 +0100, H. Nikolaus Schaller a
=C3=A9crit=C2=A0:
> PATCH V2 2025-02-28 14:33:57:
> Fix pwm5/pwm6/pwm7 pin groups (each one can be muxed to one of two
> pads while pwm0-4 have only one pad) for X1600.
>=20
> PATCH V1 2025-02-26 18:14:53:
> This series expands pinctrl support for some Ingenic/Lumissil SoC.
> For the jz4730 we add MII and I2S pinctrl and general x1600 support.
>=20
> The x1600 parts were jointly developed.
>=20
> Code was tested on LX16 board (x1600) and Alpha400 (jz4730) and
> on CI20 (jz4780).
>=20
> Co-authored-by: Andreas Kemnade <andreas@kemnade.info>
> Co-authored-by: H. Nikolaus Schaller <hns@goldelico.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

For the whole patchset, with the nit on patch 4/4.

Either fix it when sending a v3 with my reviewed-by tag above, unless
Linus does it when merging.

Cheers,
-Paul

>=20
>=20
> H. Nikolaus Schaller (3):
> =C2=A0 bindings: ingenic,pinctrl: add x1600
> =C2=A0 pinctrl: ingenic: jz4730: add pinmux for MII
> =C2=A0 pinctrl: ingenic: jz4730: add pinmux for I2S interface
>=20
> Paul Boddie (1):
> =C2=A0 pinctrl: ingenic: add x1600 support
>=20
> =C2=A0.../bindings/pinctrl/ingenic,pinctrl.yaml=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 261
> +++++++++++++++++-
> =C2=A02 files changed, 261 insertions(+), 2 deletions(-)
>=20


