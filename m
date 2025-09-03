Return-Path: <linux-mips+bounces-11016-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C0FB429B0
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 21:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BD09580F65
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 19:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901F13629B9;
	Wed,  3 Sep 2025 19:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="Z0xvlH/E"
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B252D8DB7;
	Wed,  3 Sep 2025 19:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756927239; cv=none; b=nnqO3evFtIt+5VADF09bwF1HgonZNMZillNczluLDofxUAWprcMKcB3MdaKNC+G0yELSvAYyYWM3/1r+mHdbbEoLXb7qMi7RBU8lxS3GpD98h1u6h1kE/4CciP8JiEDCIr/IjT1lvNreIGsnSmpOoLD4eRqew7GLb5kZRiy+w5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756927239; c=relaxed/simple;
	bh=kRSOTd5XrHRhOT4S3xBCr2B49OtJoj5AOBsWHzaGwXc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SW+LUlAyNFUKkbFyzCxAYsYgo7L+nQuD32k9quKV7nNvIckun8/7uC9smO8/k11vLnjyJWuLQKX2aCUZb0RiJH/JcUVPfuX2TAQMP1cCZZc+D2cOXPLtqO/LitGtaZxxc/aCcHa4xkpwXJSHAhiPxOP7n8xuIdSf3MHE4y5H0Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=Z0xvlH/E; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1756927235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=c+ZgGU/Y7ymCGJS4a8iBSCEwRU68y0Cdd3gwtYGpdv4=;
	b=Z0xvlH/ECfsC59swm4ATc7moQPplDnhXIzmBF4X35r6pJmnBDDeoU1Ie5Ab1yxhe+1ln8W
	GcUQb2ZLGdW9NnPudS1kvJ3oXxwi39axE8bJQYRDLCQpq4QuYcwKIMP6MOFv74jzcnlQqN
	tMc5uO4lOOAAr/7RBg88uyXzuq33+zQ=
Message-ID: <f19aa842d210bf4cd3d7abf03ea7323f9e52df75.camel@crapouillou.net>
Subject: Re: [PATCH 024/114] clk: ingenic: x1000-cgu: convert from
 round_rate() to determine_rate()
From: Paul Cercueil <paul@crapouillou.net>
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Date: Wed, 03 Sep 2025 21:20:32 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-24-b3bf97b038dc@redhat.com>
References: 
	<20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-24-b3bf97b038dc@redhat.com>
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

Le lundi 11 ao=C3=BBt 2025 =C3=A0 11:18 -0400, Brian Masney via B4 Relay a
=C3=A9crit=C2=A0:
> From: Brian Masney <bmasney@redhat.com>
>=20
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/clk/ingenic/x1000-cgu.c | 19 ++++++++++---------
> =C2=A01 file changed, 10 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/clk/ingenic/x1000-cgu.c
> b/drivers/clk/ingenic/x1000-cgu.c
> index
> feb03eed4fe8c8f617ef98254a522d72d452ac17..d80886caf393309a0c908c06fb5
> aa8b59aced127 100644
> --- a/drivers/clk/ingenic/x1000-cgu.c
> +++ b/drivers/clk/ingenic/x1000-cgu.c
> @@ -84,16 +84,17 @@ static unsigned long
> x1000_otg_phy_recalc_rate(struct clk_hw *hw,
> =C2=A0	return parent_rate;
> =C2=A0}
> =C2=A0
> -static long x1000_otg_phy_round_rate(struct clk_hw *hw, unsigned
> long req_rate,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *parent_rate)
> +static int x1000_otg_phy_determine_rate(struct clk_hw *hw,
> +					struct clk_rate_request
> *req)
> =C2=A0{
> -	if (req_rate < 18000000)
> -		return 12000000;
> -
> -	if (req_rate < 36000000)
> -		return 24000000;
> +	if (req->rate < 18000000)
> +		req->rate =3D 12000000;
> +	else if (req->rate < 36000000)
> +		req->rate =3D 24000000;
> +	else
> +		req->rate =3D 48000000;
> =C2=A0
> -	return 48000000;
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int x1000_otg_phy_set_rate(struct clk_hw *hw, unsigned long
> req_rate,
> @@ -161,7 +162,7 @@ static int x1000_usb_phy_is_enabled(struct clk_hw
> *hw)
> =C2=A0
> =C2=A0static const struct clk_ops x1000_otg_phy_ops =3D {
> =C2=A0	.recalc_rate =3D x1000_otg_phy_recalc_rate,
> -	.round_rate =3D x1000_otg_phy_round_rate,
> +	.determine_rate =3D x1000_otg_phy_determine_rate,
> =C2=A0	.set_rate =3D x1000_otg_phy_set_rate,
> =C2=A0
> =C2=A0	.enable		=3D x1000_usb_phy_enable,

