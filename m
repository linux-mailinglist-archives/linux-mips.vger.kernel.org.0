Return-Path: <linux-mips+bounces-7221-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3D39FF997
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 14:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AEF67A1913
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 13:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AC54C96;
	Thu,  2 Jan 2025 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="ObA9p5hA"
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53671C36;
	Thu,  2 Jan 2025 13:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.234.176.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735822929; cv=none; b=e3P4DXx0xil/Y1R5waDLrVRCTlxN9f74XCYfQnaKyGfgT6IeiLwhvh5/b+s8cMbqwQzB2C+jacf5nnXel3ECSDEw1NUKZF17vp/YBMAMUQM/VnxpK/EGj3amCTaSacMvwgTByteP2mHlq1dfsLLMf0+tMcFqI/lR+iGIDwcPYd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735822929; c=relaxed/simple;
	bh=82avXnlIJs9wRO2RyM2JA2ssKHzJb+p3Va7vKo18mwQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kVM4gvXpZ33k0+rJF71bEBXChxRjjCjvMmukOdgt873zFSVfKVtavhG3WUI2WeDT5zG/hY7aUxOQrOvCBI4t3LTuit0AiwauPbv8g//56j9gcsuIkhwXk3jwMl+wUhCnbN8DewwIZwvYNINUHyGcB5YrnZLnbM7pjSeZ6HjYVno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=ObA9p5hA; arc=none smtp.client-ip=89.234.176.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1735822489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OtN+/tCVZejvZH4tYxrxMjY3zXUbUecyTqppStMTjJo=;
	b=ObA9p5hABgmpVGGae0VpUnRf+tjbs6ULdKJQQ1j8zMH4CMihPAGtiB5Fv/LV5gVPFsPpCz
	PsSduBFyPrNdgPMVlb2a0pNesQLArh0EvhszYX4o+9Wk3tzvOeGPBfIFr9iLZKU+tsLwmR
	kjpRtSHhOVjjatc9kyNJgCjpRVoXY48=
Message-ID: <ab308c135c3ea5e050bbfb0b94a832c8d52d5380.camel@crapouillou.net>
Subject: Re: [PATCH RESEND] phy: ingenic: fix unbalanced regulator_disable()
 warning
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Vinod Koul
 <vkoul@kernel.org>,  Kishon Vijay Abraham I	 <kishon@kernel.org>, Zhou
 Yanjie <zhouyanjie@wanyeetech.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	letux-kernel@openphoenux.org, kernel@pyra-handheld.com, 
	linux-mips@vger.kernel.org
Date: Thu, 02 Jan 2025 13:53:47 +0100
In-Reply-To: <96da5fe557f3b2501447358895bd78decc4633ef.1735482146.git.hns@goldelico.com>
References: 
	<96da5fe557f3b2501447358895bd78decc4633ef.1735482146.git.hns@goldelico.com>
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

Le dimanche 29 d=C3=A9cembre 2024 =C3=A0 15:22 +0100, H. Nikolaus Schaller =
a
=C3=A9crit=C2=A0:
> if ingenic_usb_phy_exit is called the regulator is already disabled
> through ingenic_usb_phy_power_off() leading to
>=20
> [=C2=A0=C2=A0=C2=A0 5.367301] WARNING: CPU: 0 PID: 20 at
> drivers/regulator/core.c:2953 _regulator_disable+0x200/0x230
> [=C2=A0=C2=A0=C2=A0 5.368209] unbalanced disables for regulator-dummy
> [=C2=A0=C2=A0=C2=A0 5.370364] Modules linked in: phy_ingenic_usb
> ...
> [=C2=A0=C2=A0=C2=A0 5.373441] [<8054601c>] regulator_disable+0x40/0x80
> [=C2=A0=C2=A0=C2=A0 5.372952] [<c02450f8>] ingenic_usb_phy_exit+0x48/0x60
> [phy_ingenic_usb]
> [=C2=A0=C2=A0=C2=A0 5.374283] [<8050839c>] phy_exit+0xd8/0x104
> [=C2=A0=C2=A0=C2=A0 5.373104] [<80657a24>] __dwc2_lowlevel_hw_disable+0xe=
0/0xe8
> [=C2=A0=C2=A0=C2=A0 5.373393] [<80658ad4>] dwc2_driver_probe+0x818/0x834
> ...
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Looks good to me. The regulator is not enabled in
ingenic_usb_phy_init(), so it should not be disabled in
ingenic_usb_phy_exit().

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul


> ---
>=20
> Notes:
> =C2=A0=C2=A0=C2=A0 Resent because linux-mips@vger.kernel.org=C2=A0was not=
 automatically
> added by
> =C2=A0=C2=A0=C2=A0 get_maintainer.pl (drivers/phy/ingenic missing in MAIN=
TAINERS
> record?)
>=20
> =C2=A0drivers/phy/ingenic/phy-ingenic-usb.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/phy/ingenic/phy-ingenic-usb.c
> b/drivers/phy/ingenic/phy-ingenic-usb.c
> index eb2721f72a4c1..35984dd8a1bd7 100644
> --- a/drivers/phy/ingenic/phy-ingenic-usb.c
> +++ b/drivers/phy/ingenic/phy-ingenic-usb.c
> @@ -124,7 +124,6 @@ static int ingenic_usb_phy_exit(struct phy *phy)
> =C2=A0	struct ingenic_usb_phy *priv =3D phy_get_drvdata(phy);
> =C2=A0
> =C2=A0	clk_disable_unprepare(priv->clk);
> -	regulator_disable(priv->vcc_supply);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}

