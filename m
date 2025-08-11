Return-Path: <linux-mips+bounces-10181-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD14B211C9
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 18:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4946C5056DB
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 16:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3292E2DE7;
	Mon, 11 Aug 2025 16:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpkByJqd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AA2311C01;
	Mon, 11 Aug 2025 16:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754928161; cv=none; b=hQc3TSl9YInaXl30ncFh29J/8zWYU9+iKHDLAXIZMgoHVk0r0wdoOuIHFaS4vOId5gCssHSOH+W7nbUH1xLIy2091v3BWdKmY4gKX0bxi82mamBU+G5YkLwiCZ7iuDoMaHO6v4FWjowxB62oUlPu/cEh585fTxApwagsZQ/5HkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754928161; c=relaxed/simple;
	bh=M33qPuWnVVgzCedegGUFoIha4X57RIz2xTh8sZTNpAA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ijY0ZualkxFFbD5VHbPBO//P889jQNhS32nwJUAnebKijshnGjEcPP2Dc3gGPeq74bmIqT7DundrnKAluzsbUBceClYTXTgUUVS5zhhlds5SdXyKlLkAzlMmiHbi5LFzmd49gWErm4ugSo+5qBpb6twCQQMjvSMVo2XVLQb4Y9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpkByJqd; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af968aa2de4so828780366b.1;
        Mon, 11 Aug 2025 09:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754928158; x=1755532958; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qaouqb4fO7JIvY1JD8PEt300KWG5mGmc4W0R7yQs6hc=;
        b=OpkByJqdcmrWDFzXadVs2sws+8t3GcYAXrIlH7idM6SqBpaxerqXQ+Q3ZYgnWWobH6
         TKZXoQGVZBUO3laehNXeV+fYHWbjtkRkiFPfHBZyg+PfOE1hRfewob/Ak1m9wYo0GVK7
         n+xg9Vuj08sedZ7CkHWvemFRyoN/nxfSO8bjiKpJYou039yQOyst8b1wifpYibXWeI/7
         4TF8/xj17OTwIzqz37+WFJ/5tjIsDPix0HkQe5eRngQm4ro9uybjmxbIkoc0iscJkA1z
         44jGHZwxaN5cjHCYmgdjqwFT+R/Wka0Du+3H0GG5L+G9P4z7LDNxgPlwqOHmoRc63F/b
         bb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754928158; x=1755532958;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qaouqb4fO7JIvY1JD8PEt300KWG5mGmc4W0R7yQs6hc=;
        b=QvMaRBBiiByhHAk7oXGAvNyr015TK+DrvTFDjztdXe1GrSeLznj8D1vVssBn09wb2b
         hLg5GIMjCjrrO658EDdi4nwk/DlHw/TjAvrlUCWD9CiAI6SY0h1Ao98ciILtUKZdeUdU
         +Vo1tNzO8ta8B5RpPAaihwOX4tTrCSJBstOsnobyRsuPLaWKB35nB3pdRpQBDlQ8la4W
         10QfIhNVR7L62qzoVZ2jSP84TULkvMmy/mjtOCHIjn4BJUhnohRMfjsRMT1azuOvBjYu
         sns+OsmB1xCMvkbjLlIAy8dudXIDQ1yWwqrZYBHOLRvDN/PRgl/wOCWlD/buQEAGnYWf
         Cgug==
X-Forwarded-Encrypted: i=1; AJvYcCUUjTbB62Hq+RrXGaKebYWo0HBS4hAzIpzAGNVs4dgbeMP6Nx5a7w+0fR3Ij0rTRsSioGfOsxTdWFm05MoTwB5ON5A=@vger.kernel.org, AJvYcCVD3YhQachFtksPB6EHmbZjdKEoD5UxheWyYyc0qNAf3XxsCxFnjRLITzy5X2jpWIrgUP8jqhBgYywZAg==@vger.kernel.org, AJvYcCW7+Yi7By/2xphQyttU49axGdZHjXf1QL8rl9HNHC9ltYALAynONgAfrOJfYcufN2LFAzeTn7nfHdMjWTM+pg==@vger.kernel.org, AJvYcCWZeEtbCyPiwwxNfH64tsF6Nv4hvarY5x0i1r7QcZkUpcAuwfv5094N6ENi4aPe3Q0fZUu4ISckMHKI3wNa3PGrPgc=@vger.kernel.org, AJvYcCXsOjtu5wkOIaE6mUWjQhzMjHQGMLxmCcUPuL02Ig7LLhzyEt2fMjXjb7NF+3dS5nMxa8frp4HVOQ==@vger.kernel.org, AJvYcCXywCItPwdxiQ8HKBMFCDwCPIu7XATYeruzhdn5AbrVfGznJgOZ5l09S6VpzZNDRXeDv4z+5lbxsBA5nIOq@vger.kernel.org
X-Gm-Message-State: AOJu0YyfJVxg8zspn63RftVEiOvoVGeHZrfarC8ulif6OMvPnv1wQAE2
	Xkb9UJSATCbYlinWxZHjiHA64pTj1YNVZos5PxDNjCpEY/3hcUBiBEb9
X-Gm-Gg: ASbGnctn7fW7bZ0v3fX5pbYOcmBk2k2vt28TM1+RNrIuiiyWxfmulLHukE6+tHsIqBq
	p5hGvQ+j9GdhEbNJVMmhqvE+fmXnj6rOBc+Y9uY4LOevZTYhos8xIbcV+AnbIiZRfDbd9qplykD
	tGC7CJsqKY/LgQ7nCLTjIijjseLEaU7px8VsyHxFCSgSOpuQjiXQefoQw25EUPvGrAQvKM2OBv7
	FIf/qHoGgmKe9QbUcBLsPB9GWYXPuxZMgyRJd8h8adKDyVOq0iirqmxJ+61+mrLK9A2AoBjmn7j
	/W0tgKFMXTTrsXTBVKLrLGSSZ1sMWP1njhuxW/mHo/0Lei3CaMopYu6GlvXtkvUh9gkuJlZdXXE
	kGliRyfNvdYRRMXM4+4d9N2Mje7aYK/a5lE0V3iA=
X-Google-Smtp-Source: AGHT+IFlPGC8RqUZcNmE1sb0v/JytUS2YpnMYnX0fy/68mQiQooD3eH6nJnAu7hadMRuF3cZL/qgqg==
X-Received: by 2002:a17:907:7f1a:b0:ae0:d78a:2366 with SMTP id a640c23a62f3a-af9c63b0a5bmr1282562266b.4.1754928157418;
        Mon, 11 Aug 2025 09:02:37 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e6cecsm2050387666b.70.2025.08.11.09.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 09:02:36 -0700 (PDT)
Message-ID: <dfca56ede9bdd6295f79403bf01fb9913ba95d6c.camel@gmail.com>
Subject: Re: [PATCH 111/114] clk: divider: remove round_rate() in favor of
 determine_rate()
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Cristian
 Marussi	 <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto	 <inochiama@gmail.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil	 <paul@crapouillou.net>, Keguang Zhang
 <keguang.zhang@gmail.com>, Taichi Sugaya	 <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>,  Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jacky Huang	
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Vladimir
 Zapolskiy	 <vz@mleia.com>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan	 <dlan@gentoo.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon	
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
Date: Mon, 11 Aug 2025 18:02:33 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-111-b3bf97b038dc@redhat.com>
References: 
	<20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-111-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-08-11 at 11:19 -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
>=20
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops. Also all clk drivers that directly calls
> divider's round_rate() have been migrated over to determine_rate(). So
> let's remove the round_rate() clk ops.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/clk/clk-divider.c | 23 -----------------------
> =C2=A01 file changed, 23 deletions(-)
>=20
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index c1f426b8a5043cb5a1de08e1da385928ec54a2ed..2601b6155afb7391c6a0ffb91=
c58fa66cde98197 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -431,27 +431,6 @@ long divider_ro_round_rate_parent(struct clk_hw *hw,=
 struct clk_hw *parent,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(divider_ro_round_rate_parent);
> =C2=A0
> -static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate=
,
> -				unsigned long *prate)
> -{
> -	struct clk_divider *divider =3D to_clk_divider(hw);
> -
> -	/* if read only, just return current value */
> -	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
> -		u32 val;
> -
> -		val =3D clk_div_readl(divider) >> divider->shift;
> -		val &=3D clk_div_mask(divider->width);
> -
> -		return divider_ro_round_rate(hw, rate, prate, divider->table,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 divider->width, divider->flags,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 val);
> -	}
> -
> -	return divider_round_rate(hw, rate, prate, divider->table,
> -				=C2=A0 divider->width, divider->flags);
> -}
> -
> =C2=A0static int clk_divider_determine_rate(struct clk_hw *hw,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_rate_request *req)
> =C2=A0{
> @@ -527,7 +506,6 @@ static int clk_divider_set_rate(struct clk_hw *hw, un=
signed long rate,
> =C2=A0
> =C2=A0const struct clk_ops clk_divider_ops =3D {
> =C2=A0	.recalc_rate =3D clk_divider_recalc_rate,
> -	.round_rate =3D clk_divider_round_rate,
> =C2=A0	.determine_rate =3D clk_divider_determine_rate,
> =C2=A0	.set_rate =3D clk_divider_set_rate,
> =C2=A0};
> @@ -535,7 +513,6 @@ EXPORT_SYMBOL_GPL(clk_divider_ops);
> =C2=A0
> =C2=A0const struct clk_ops clk_divider_ro_ops =3D {
> =C2=A0	.recalc_rate =3D clk_divider_recalc_rate,
> -	.round_rate =3D clk_divider_round_rate,
> =C2=A0	.determine_rate =3D clk_divider_determine_rate,
> =C2=A0};
> =C2=A0EXPORT_SYMBOL_GPL(clk_divider_ro_ops);

--=20
Alexander Sverdlin.

