Return-Path: <linux-mips+bounces-10172-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F540B21059
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E04DC7B3DA1
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DD92E8DE3;
	Mon, 11 Aug 2025 15:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAamtShV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A7F2E2F00;
	Mon, 11 Aug 2025 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754926686; cv=none; b=jL4SE8w+kn4ExJnLZCh78DI+rDdPB4+BVlQ/fzDppHWhtL4jLsMVPn2f/vZK3MeZVdrXfQlTyxym5u+hkMvBSUSCsfV7XAmp/+a3BC9bexw5ASJW2KiFWcyGOxkFtwDrUuBFz1nFE1eZf8fBn+GGoSR3UfVlOd7GzdIXeSwwwRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754926686; c=relaxed/simple;
	bh=CqlyMujMU6ydNDStKnts5DDKJU1MVb00JtDeW/Rdvt0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lrTeczh9ZsmJyye0BbhS9wu9QZWB+jw0awrxn66XrdSHkznC1M8hYkYflPSkmmd/FXEo/41y0k15X2W6P41GidOpTHXq19ndeQu0FWcpMwL1+Zt83+v++htt/3o7CVhD1TdkUDDjvQsVW6Hh8ksdaG9xvcbzGQnVPOILxgRv7eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAamtShV; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-af95b919093so664720466b.2;
        Mon, 11 Aug 2025 08:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754926682; x=1755531482; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2HmgB4i0ef6G9gBd9c3iPtpa4z8Vmw9rM+uJkjjYMMg=;
        b=cAamtShVD9T9SXCvROnAGPRnl/pXKEDLVtz3DHRDgD1mLTmfc1E03BDfp/os9Cw6R5
         HCwG27Q1jGeJprCvhMwha/JBjmq+t6bkWzYT9O2yvNSVGspp2Cv14p9EcLtsGjnjojco
         JgAK0Xo79NcOpzyWWDSUQysqgxKGkbXnJmOmm/fqwfyyauhI+51wtAJ8nudWa153oSCm
         0FlrS9Nvxd3EOgEqseFvk84T2O7nJmUC7lD/pT/71Q303KTn0BZ4Ub61X68cNF9BrTp0
         DPOczqeJORSUBodGefq5ZsRoLYS31cFDA+ro+c9yvNvk/CdleeIsqxJmGaUgAmwMjxis
         wa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926682; x=1755531482;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2HmgB4i0ef6G9gBd9c3iPtpa4z8Vmw9rM+uJkjjYMMg=;
        b=DvcrSXOnyh1BCLcLcIDD4xVjRytiwg0RZzYBrkztcTeOoYA+42JJMdUoe1/GAw1U9I
         btW4Yy0d9QHaZaa7FXaHNAbuIRpbPJBX+UtAg2BFjESeGgT3hIMwiw1hKy22nAUuu1XI
         Ggv903C+dXdVaXScTLc99+Rn+CpeFumVtCi5FuBQRlm/CQJoNU6L6K8t7ZJsk9FqkExA
         nClzOGGELFshy2+ZbquB3Lw2zJejD1HLotxeV1/QXVEUK9mMYypa2tw9FTOclnIID3wQ
         0mZzVQW1fQ9pYhZ4kavMC1fe0kWl+r3BqXM9I2Egs23TmJyViPBwy42dvFNifIIAFItx
         Bdxg==
X-Forwarded-Encrypted: i=1; AJvYcCUhXP3hwJBrgOCvwf4+NyVh1tEM4JyOXSyVb9kfjaEm0cP5cPkiHAurJ8kpxtKlYyfwB3F7n48JZXu6Gg==@vger.kernel.org, AJvYcCWCLERGawAXb54etonkY/IBilrTZl+jQNnKDWSBoLhkVhajdQNsMTW2isd91aJvxxugqkL8GaYgIjrxuqfBU4YKh70=@vger.kernel.org, AJvYcCWtIzKyTNrXfWN/e+PO9F566jOLof1Mv00AbHScD1iWeEvL4SVf5ll1E7jbJ4PH0/tRucy8VOyYuFKl3EL+ww==@vger.kernel.org, AJvYcCX9cZA7leWiYCgRX/3vNyeQkMlzaoXtg8raylj1hTmVe8VAZuYILd7GvSk0U01e3sVgMEFmlmJInA==@vger.kernel.org, AJvYcCXWxY+y5ErsODj92SpWbtIxcFiWw+xwT9hrg4gA9PltN2Hl8a0nfgofUWzSKrcH4Tvz4VW0SzMEmR+E6mZRy2WGT5c=@vger.kernel.org, AJvYcCXp1QiDmATVrfvyFU51oVUnTjg6y9v9tPTQN9fGtaG7IQqb+HCQfKm8x35SxZCUqIAekQr+y5d0mM0hqtOC@vger.kernel.org
X-Gm-Message-State: AOJu0YzJoid5YzzOE4nIHWZm6Cfz5uXd/P9ECG/pQ9TT7O9SpLPodgPc
	3Gl/EjiTmWUHgUPDWGgha6MFCI/KBDRCNwsRJZN9YOn83yPoKFYfTasP
X-Gm-Gg: ASbGnctE9SOPhPKyjre9H9BGQ2lAZc7wsBaR+kfOKPlfRZU1B6XiRf2VcnnfJjfyp9r
	W7gVkH6s7Ah1hb0eTf1ukBj/3MGhsobDTeo+AsKZPsEE8sxtn8v+fuKrZwjQdBCGaR49DTTDWDZ
	wgbU83agc5uQ1Dq3aerq4toGS0nO1vTrdt2PMwl9TuvdqnC+IQiv2N5tLXINPfOiHmio7tkc1Lp
	AIDOzcHSep0jcgRC4u1dAAi7iCbts0+0hghN+yW5Y3h2mgaUoFafSs1U1/MGBibAvOXQn8ogsWl
	aKfgLbMmMBmbp7BFk+RYqcfMx4R40Mmj3dZWzywf6HC2Rb5naEYxlAHTyk1MJ308N847mnBFRNh
	85tu7rWP1WhTVx7Oyc4n1D/yHsKgcxqwYpC3StJc=
X-Google-Smtp-Source: AGHT+IHSK7yv3/D8orY0Pvy2Zzp8DcIZ6EslOLXmLH2atPhWs8y14U6F2aebL6rKGw4mDoY3DumHmw==
X-Received: by 2002:a17:907:7ea8:b0:af9:8c1c:b9be with SMTP id a640c23a62f3a-af9c645d565mr1274686466b.14.1754926682117;
        Mon, 11 Aug 2025 08:38:02 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0afsm2032301266b.117.2025.08.11.08.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:38:01 -0700 (PDT)
Message-ID: <84788b3be1d340f7a085c0d2a5903fd1032dd9eb.camel@gmail.com>
Subject: Re: [PATCH 114/114] clk: fixed-factor: drop round_rate() clk ops
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
Date: Mon, 11 Aug 2025 17:37:58 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-114-b3bf97b038dc@redhat.com>
References: 
	<20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-114-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Brian!

On Mon, 2025-08-11 at 11:19 -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
>=20
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops. Also all clk drivers that directly calls
> fixed-factor's round_rate() have been migrated over to determine_rate().
> So let's remove the round_rate() clk ops.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/clk/clk-fixed-factor.c | 16 ----------------
> =C2=A01 file changed, 16 deletions(-)
>=20
> diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-facto=
r.c
> index 79b9a8c57d4b84be990955d8bc3159b818f38d50..de658c9e4c5386a7a8d220743=
22577e0e9efd2b8 100644
> --- a/drivers/clk/clk-fixed-factor.c
> +++ b/drivers/clk/clk-fixed-factor.c
> @@ -47,21 +47,6 @@ static int clk_factor_determine_rate(struct clk_hw *hw=
,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static long clk_factor_round_rate(struct clk_hw *hw, unsigned long rate,
> -				unsigned long *prate)
> -{
> -	struct clk_fixed_factor *fix =3D to_clk_fixed_factor(hw);
> -
> -	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
> -		unsigned long best_parent;
> -
> -		best_parent =3D (rate / fix->mult) * fix->div;
> -		*prate =3D clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
> -	}
> -
> -	return (*prate / fix->div) * fix->mult;
> -}
> -
> =C2=A0static int clk_factor_set_rate(struct clk_hw *hw, unsigned long rat=
e,
> =C2=A0				unsigned long parent_rate)
> =C2=A0{
> @@ -87,7 +72,6 @@ static unsigned long clk_factor_recalc_accuracy(struct =
clk_hw *hw,
> =C2=A0
> =C2=A0const struct clk_ops clk_fixed_factor_ops =3D {
> =C2=A0	.determine_rate =3D clk_factor_determine_rate,
> -	.round_rate =3D clk_factor_round_rate,
> =C2=A0	.set_rate =3D clk_factor_set_rate,
> =C2=A0	.recalc_rate =3D clk_factor_recalc_rate,
> =C2=A0	.recalc_accuracy =3D clk_factor_recalc_accuracy,

--=20
Alexander Sverdlin.

