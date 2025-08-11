Return-Path: <linux-mips+bounces-10176-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3E4B210DE
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 18:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 566F27B8813
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 16:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB5B2DE1FE;
	Mon, 11 Aug 2025 15:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wup8ElIv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A352E0926;
	Mon, 11 Aug 2025 15:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927454; cv=none; b=jxGWiSJl886XcXWC0gvZaaWqOkA7jQmww5A1ult3PPw2eG4ApwcKjlwBkxIfzpw1+aa0qyj//EtnzDrO0G5uFAB4bq+fXCQ3UOudFOuGq1Fj9UY+jpgwE9tsCCbSO2+WiN1y1GnLH2EYE5ZptzmeMGs30HEMT94c7OGK8Ut4gNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927454; c=relaxed/simple;
	bh=3MrMePu5qHYOOUklAMogGuKMAutTQLNLRBh4z2IBUxA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qIu4TNU3S1ZoRNx0JjS/ft7K15LYR9L2JqIIOIUQAriwAx7i1m/v0V6w8Sz3/XEC6jj5KJ93mfrPl9t+c0UFOB7HCrkmf7zBKzp1wrSHwq/45dkuu8kMCsrV8auAG3pn93/kGP/+wYtttEAF6oG+iZ2OI1VC+cGvPEsNKo/xpqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wup8ElIv; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-615460d9897so5212528a12.0;
        Mon, 11 Aug 2025 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927451; x=1755532251; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gtZQ94WBszTISCSHtIKTauM3dit5VcpLWsofgTPpah4=;
        b=Wup8ElIvPHTB/kwFguFnPS+JSJqgriXAq/y8Znf60hTwcA8vZ7pAGzPeZ9BfmB8Kjr
         ChsCd1OIhcNsEIy8bNHUnVIxkKYRsOfzi0vUPuNLz89RV6Wj8KSSCxymJa/HR3vcf6Xn
         c1De3VtigqKniHhLfJ7ujs68zbzpa1vocKgoxX/9CP15Aw+X2Et53MmWS7kym5Z4kLaI
         W+ZydTyc1WBcOjZkxMY9qsu4UPukrYgCxLC9EPnbXSF6H5ue8rwc1wzQVXU9BSYggdZ9
         9gKEIHPzBbMn0LFb9Cq4Op/kdTs6oug++w4QhGdpWHtfMeVOXkp6lxuNV2hSichJq4o9
         YQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927451; x=1755532251;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtZQ94WBszTISCSHtIKTauM3dit5VcpLWsofgTPpah4=;
        b=BqF0FmtvgQASP6Gw5k+MIC+q6HI1SV2ayKVERiKKxzSB2gIMTBITSQIak+2+eP74eR
         rIToarxHbAWjMf+5AGFsDP0//Eggw4TUfvdcoM3CBUmMCyhYIOofWfzKifLBWCY3xB9B
         z7Y0QN+wbeE5IBO/A7bgHMgQrVwZIxC7Ll3QrdQMFwlLbr3k1boNo/7/adsAxzgZhJ0Q
         JlYRt+uKL3UVD9TvR2Ztat+nJACDqMu10z5NQ2ptedCw6DxTWIyBvhdncvkJ3a4xGA06
         OXekikv2B9RBv1E9P4gZCWxu14D+cAHXt6vZVS8NgQ6i/o9sOU5Zn5qcQAznXy5hw4d5
         0fZA==
X-Forwarded-Encrypted: i=1; AJvYcCUvuk2Zpu3/UBRCEY4UC6GbDsgjaj8jjBzZJ1fPK5sPv3oOUde7k1p0SNE3XDI33bfTv4jP8RUZU6bsJw==@vger.kernel.org, AJvYcCV1wiQjTj+rKrL3EacnrgDwd69qRtHLyG8Gb7HPAcUUia5MXuJAzkyyclH86FObiyQN5VcrADecBj6AmOiOr0x1ZQc=@vger.kernel.org, AJvYcCW0K2tJezYCK5IG1BF67qNanHA62O9F78irFZMNjjwJPWiS06Apvjjb44nHxG1x8YKNQECrdhAkc4bXnIZ7@vger.kernel.org, AJvYcCWP5WewCmnK2eYo0ysUO5anp6TZKvsMxq9Ay2KypVnhenjMQ+zicBrKzPjASN5ptWwgq2cy8z5FbQwo9Q7Z+g==@vger.kernel.org, AJvYcCWzsQDVqX7e6Qg96yw5hnCH5WSi90Qr5B69M1HhvKy9NADKOuZASDHL/StZT57IAXf45XYfQaSPqkDYWBwy9ufL5Bc=@vger.kernel.org, AJvYcCXc22zAE761os2kWOK0dvLqCsPKIuJQJNS2W9JLDKc1ly6Ss26Jn/FgwN1iV76lQXyWCesMS5Mz2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHBaWeuLg7oam9m05D3MuIcvPnoGfEWJOJzUvYjmpgpZFlUlR
	6CjzybhmDY4GWu0Xs5+HUNzcTxXWjFRAiZWbZmQ5z58LT9RnNh0HyaQ8
X-Gm-Gg: ASbGncuSp6nUmsoZ1Akh8viexfAlBO2/6h5XQbJ+go625hiUH+ABqBK/YQCedRC3P+8
	WNYUTuyJSY+do7w9sINoNZngvTCFyi62zmUfbOk8W4xDFmTB97X4mHl5zMuzYSopO/T4D78AbO2
	0Bz5c0pOiAh+3jF5RdKFwA3KMkLeCRIKZD6whn1gtumR5NsKupr5E83oz2FHZFMBQrbiKqeC+GW
	K9GdbltBuuzh0s/29p5cWi2m0LuPe3uPEl6P8XuPIzyrmn4FMllu3l+7p6KNTcUb+aUaFsMj0nZ
	2+ScjgXgAXY7npzB0aDBFyoRy/vRN1CE7O0fEKqq8Wt7/uMSxYZOfdHzGk/yEu5/Imos1ybHBrv
	YpBLGJTWZ9+ilodTytYvtC4EnDJxJYyameOc9AIxvSmvf7qto0A==
X-Google-Smtp-Source: AGHT+IHe8ajBJUyXwu1jxvqnFBotZVZqGKDHQgYwFn+fyltnooA7uDIcyyMAL7hOfbd71etw3G4PSg==
X-Received: by 2002:a05:6402:26c2:b0:618:3a61:b1c with SMTP id 4fb4d7f45d1cf-6183a610b1fmr2169187a12.31.1754927450586;
        Mon, 11 Aug 2025 08:50:50 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f000c3sm18680418a12.4.2025.08.11.08.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:50:50 -0700 (PDT)
Message-ID: <d3b0ae61d0bb5dc4e115ace27e1672444ae90d83.camel@gmail.com>
Subject: Re: [PATCH 014/114] clk: ep93xx: convert from round_rate() to
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
Date: Mon, 11 Aug 2025 17:50:46 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-14-b3bf97b038dc@redhat.com>
References: 
	<20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-14-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-08-11 at 11:18 -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
>=20
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/clk/clk-ep93xx.c | 18 ++++++++++--------
> =C2=A01 file changed, 10 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/clk/clk-ep93xx.c b/drivers/clk/clk-ep93xx.c
> index 4bd8d6ecf6a2bde26287e4e949b062a5660139e6..b081ef920e250dd99134af684=
5c443ee11266da8 100644
> --- a/drivers/clk/clk-ep93xx.c
> +++ b/drivers/clk/clk-ep93xx.c
> @@ -389,23 +389,25 @@ static unsigned long ep93xx_div_recalc_rate(struct =
clk_hw *hw,
> =C2=A0	return DIV_ROUND_CLOSEST(parent_rate, clk->div[index]);
> =C2=A0}
> =C2=A0
> -static long ep93xx_div_round_rate(struct clk_hw *hw, unsigned long rate,
> -				=C2=A0=C2=A0 unsigned long *parent_rate)
> +static int ep93xx_div_determine_rate(struct clk_hw *hw,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_rate_request *req)
> =C2=A0{
> =C2=A0	struct ep93xx_clk *clk =3D ep93xx_clk_from(hw);
> =C2=A0	unsigned long best =3D 0, now;
> =C2=A0	unsigned int i;
> =C2=A0
> =C2=A0	for (i =3D 0; i < clk->num_div; i++) {
> -		if ((rate * clk->div[i]) =3D=3D *parent_rate)
> -			return rate;
> +		if (req->rate * clk->div[i] =3D=3D req->best_parent_rate)
> +			return 0;
> =C2=A0
> -		now =3D DIV_ROUND_CLOSEST(*parent_rate, clk->div[i]);
> -		if (!best || is_best(rate, now, best))
> +		now =3D DIV_ROUND_CLOSEST(req->best_parent_rate, clk->div[i]);
> +		if (!best || is_best(req->rate, now, best))
> =C2=A0			best =3D now;
> =C2=A0	}
> =C2=A0
> -	return best;
> +	req->rate =3D best;
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int ep93xx_div_set_rate(struct clk_hw *hw, unsigned long rat=
e,
> @@ -437,7 +439,7 @@ static const struct clk_ops ep93xx_div_ops =3D {
> =C2=A0	.disable =3D ep93xx_clk_disable,
> =C2=A0	.is_enabled =3D ep93xx_clk_is_enabled,
> =C2=A0	.recalc_rate =3D ep93xx_div_recalc_rate,
> -	.round_rate =3D ep93xx_div_round_rate,
> +	.determine_rate =3D ep93xx_div_determine_rate,
> =C2=A0	.set_rate =3D ep93xx_div_set_rate,
> =C2=A0};

--=20
Alexander Sverdlin.

