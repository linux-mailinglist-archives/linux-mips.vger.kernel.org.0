Return-Path: <linux-mips+bounces-11015-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B85B429A5
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 21:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 349B91BC5B51
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 19:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDDD362099;
	Wed,  3 Sep 2025 19:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="M013U4Ma"
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C282D7DD5;
	Wed,  3 Sep 2025 19:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756927099; cv=none; b=IqHyQiV/pJjlKUvIuBcNiRcu3jJYlkilGiue0r7a8rU381yxi13qrwXzFYSjraPAJXBuUk1hwfWcEhcpHgaXhUc8Pd4+8RdYaWQgeduIj3I/l1UhJ1qblQVM7iFnXDtojfbbnGmjoiDlmBSijGELUf3iOkn3lo77jRNeaGF2tVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756927099; c=relaxed/simple;
	bh=83cV/7EoxlRdQz7wlI4WnGn5t/IKXeIv5jWCwnuB+14=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aocHHxX/hMc1Zj01hIw721pZ6iQCwG3iNVFSsI/nbKCW2kxz4+vpyzRUHgSCnf48l+py0dMJ+HmjlNmoqPCaIcoB3ySVRoB9m/Lqo67YwA+FeUXQSuPF0uipeiR63zgK8Qc5X7nP6Y++bm6JsjNER//MNyvn3Mf1bouzD577BBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=M013U4Ma; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1756927095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zUd3hbPutfTlDAjUwHIkED1FOMMH63fasP77ATNMKWI=;
	b=M013U4MaToItOZxUrRJlNgf3goruACFm3i1msJg9jS7+HrTxirIsbgBywDk0B5jKoJZNHe
	5GoEutO36JaVJOooUiUSeVBruDzW1fnbZkbLEJf2t0JycvE4miuhDdGhJAyVfZ57ChqOga
	N/tyTnB51UGdvYdyVgUUSZcxz127gLI=
Message-ID: <9387ed0a6d4e4c77ffd0f7aee55eaa1ff6ecd22e.camel@crapouillou.net>
Subject: Re: [PATCH 022/114] clk: ingenic: cgu: convert from round_rate() to
 determine_rate()
From: Paul Cercueil <paul@crapouillou.net>
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Cristian
 Marussi	 <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto	 <inochiama@gmail.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Keguang Zhang	 <keguang.zhang@gmail.com>, Taichi Sugaya
 <sugaya.taichi@socionext.com>,  Takao Orito <orito.takao@socionext.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer	 <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung
 <schung@nuvoton.com>,  Vladimir Zapolskiy	 <vz@mleia.com>, Piotr
 Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>,
 Yixun Lan	 <dlan@gentoo.org>, Steen Hegelund
 <Steen.Hegelund@microchip.com>, Daniel Machon	
 <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Orson Zhai	
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue	 <alexandre.torgue@foss.st.com>, Michal Simek
 <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, Andreas
 =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,  Manivannan Sadhasivam	
 <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau
 <j@jannau.net>,  Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa
 <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,  Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>,  Romain Perier <romain.perier@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement	
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth	
 <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner
 <heiko@sntech.de>, Andrea della Porta <andrea.porta@suse.com>,  Krzysztof
 Kozlowski	 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi	 <cw00.choi@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Qin Jian	 <qinjian@cqplus1.com>, Viresh Kumar
 <vireshk@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Alex Helms	 <alexander.helms.jy@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>,  Liviu Dudau
 <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Nobuhiro
 Iwamatsu	 <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Date: Wed, 03 Sep 2025 21:18:09 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-22-b3bf97b038dc@redhat.com>
References: 
	<20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-22-b3bf97b038dc@redhat.com>
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

Hi Brian,

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
> =C2=A0drivers/clk/ingenic/cgu.c | 12 +++++++-----
> =C2=A01 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
> index
> 0c9c8344ad1103b13337a26e14b0d5d5c340d705..91e7ac0cc3342e3552acb9d2ec0
> 0865a5234ad4f 100644
> --- a/drivers/clk/ingenic/cgu.c
> +++ b/drivers/clk/ingenic/cgu.c
> @@ -174,14 +174,16 @@ ingenic_pll_calc(const struct
> ingenic_cgu_clk_info *clk_info,
> =C2=A0		n * od);
> =C2=A0}
> =C2=A0
> -static long
> -ingenic_pll_round_rate(struct clk_hw *hw, unsigned long req_rate,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *prate)
> +static int ingenic_pll_determine_rate(struct clk_hw *hw,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_rate_request *req)
> =C2=A0{
> =C2=A0	struct ingenic_clk *ingenic_clk =3D to_ingenic_clk(hw);
> =C2=A0	const struct ingenic_cgu_clk_info *clk_info =3D
> to_clk_info(ingenic_clk);
> =C2=A0
> -	return ingenic_pll_calc(clk_info, req_rate, *prate, NULL,
> NULL, NULL);
> +	req->rate =3D ingenic_pll_calc(clk_info, req->rate, req-
> >best_parent_rate,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL, NULL);
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static inline int ingenic_pll_check_stable(struct ingenic_cgu *cgu,
> @@ -317,7 +319,7 @@ static int ingenic_pll_is_enabled(struct clk_hw
> *hw)
> =C2=A0
> =C2=A0static const struct clk_ops ingenic_pll_ops =3D {
> =C2=A0	.recalc_rate =3D ingenic_pll_recalc_rate,
> -	.round_rate =3D ingenic_pll_round_rate,
> +	.determine_rate =3D ingenic_pll_determine_rate,
> =C2=A0	.set_rate =3D ingenic_pll_set_rate,
> =C2=A0
> =C2=A0	.enable =3D ingenic_pll_enable,

