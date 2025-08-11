Return-Path: <linux-mips+bounces-10171-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E87B210EA
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 18:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 462DC3E8349
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6432E7642;
	Mon, 11 Aug 2025 15:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHll2xB0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856652D6E5F;
	Mon, 11 Aug 2025 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754926573; cv=none; b=Kq1qY7fu7Po2wd86ekrb5mnkZfwJ0+DNlOFtC3kBnGwOcGK4VFnxbQCkxbnr8ooElUWJgBTFTKnxeVXyBQwM5vIJo7ph7uDD6s9X+L8HpNb1pYDoVWODLIULhYJ/LpFkPho045xsiaW1wd9YH8epNIiT4uP4Yg8iV8sgTqiVOIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754926573; c=relaxed/simple;
	bh=T1pm74Y8n64UsGo8mBccdL4qfA6nDQEImGfWpfW7ggc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DQ6VOG1LdL6OCJk/9GrKSfgcEiX70xOBonrXIAioMfFy7E7Sdk/S53lOZVAFSYeyl2MBrlIBlXp8Unw+Ejsqy1gKkfLOAukMxCu4bRBU1eTqjiX2En84ZHfpKlQ594zqzjdpsEW/HC7Cy1rjkvW+S9eBBkSOW964fLCJQomvXhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHll2xB0; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acb5ec407b1so622311866b.1;
        Mon, 11 Aug 2025 08:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754926569; x=1755531369; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o2PLgwzqCzU4aYsyzpQU8Pmm9EwNqnw9dQ2/FdBe/4E=;
        b=kHll2xB0+V1vF+jQarUvKjCyYP76VHT3qqpj3X8PX0E8KIfdivWoGuytvJeoKneVqe
         9II+yMb3AYVZyIotAWd2S0tD+cuyFgRZd+mkk0ISWVOJejFWuqpFFXeQF6kDUGyzK70O
         tDxVRBuQ47mHYbMkFg4dtT39aM3WeAbhkbA2F0Nh5QTX0G8JhvxxgBwICXi9c2M8XT14
         J0FgsHRwJQK00JCcHNRZxcKUCPDc3ir/41gV2yCFpl+vmwdYMnMyQjMDRwP1nzPq0AT7
         wASEwobmc+LlvcMa2DbbK86JzKYUBJd6WPemtml804c/ObztCKb5TpA7fgI+Gcc/vCcD
         q3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926569; x=1755531369;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2PLgwzqCzU4aYsyzpQU8Pmm9EwNqnw9dQ2/FdBe/4E=;
        b=reg6n3yZi8EPAfeYXlPetJAF5iRXdHZzTiFfjofyQMbBror95DN0zPktG14iPLIGmE
         Pc7z4HHF54EebFxUGulDo4gUPPcCocnKcdAwztL5c23FC406boFzor7jAZbHVDo6otdm
         2bOrWeO0hGRhonhtvBeUMy13U+JrgW0fGaXoQS0Wr8yQDS9y1wSQrXlGGTHnZdlrLaoc
         ZNr8tTwQ9wx1WgmqeMc4qos0FDBOFgH8LzvBNI1ufKsxdisEBc14li58Af9a2QhZ0C8S
         GapCwRzCZ0mykKoytOywcxuwER+eAss2S0od8bfwqVl4YDlx1GSKX+t370nlhqSWafKK
         K8aw==
X-Forwarded-Encrypted: i=1; AJvYcCVApfcc8iTVq8HOtRg5ijp++uIm3Q4F/3jQwtXBf3u8N3UyWBsmQGJT7aqraigJ0urzcsV2N2IOG1s5AXNW296AI98=@vger.kernel.org, AJvYcCVeFKuj3F2W15l/N0Gxj5tMltaV8Q/jRSKSjD6/VCeHjdOY9SnK/O9bBfOhyHD8I2fScuADcJJhybJxXTg8fg==@vger.kernel.org, AJvYcCWAywotOjbcWKyq+pWDp5a7eF5FVOnzN2jPKMx8eEKiOwI3HZvhmW0mwnGYVnIL+/QKhVHg5idiNQ==@vger.kernel.org, AJvYcCXLcr6EVieYwZOeu7zikG8C8jHO6Vo7f/9XaBr2tjzyo8F42avxdKh5VNbQRuo2s4tE0RSX3sCy/zpc1A==@vger.kernel.org, AJvYcCXWWvs0d7msv1XlWcglUxLzje4FhD2xDzAuhYxq2QC90AHCbdrMun9OGyJ3MD5WQt4qNcvzz6Cnxy8hMdqHO8TECMw=@vger.kernel.org, AJvYcCXzi6DsciQMOf46D9APkHpYQAJ+55j2mzu+A19qGTi5IlYKF22FNy5cHqxrR32wgrVTmuaQ5Kvw3carec6/@vger.kernel.org
X-Gm-Message-State: AOJu0YwXI9W7LVnU3ukbhLjxhpQJnfvi/t3YCxsWwMq1w1E+drW+QJEo
	yh1P1i+W+gARkTVJH3tmQ4OH2VqBSZQuTw9aoXwBRF1NL47e5FPspCot
X-Gm-Gg: ASbGncvbRAhHBiILz2oV9WxTVzf5PYOSHnV6l0xRq04flb5bgCumUw9QHXrNap09rDr
	M/Xo7KlBESaSvJir8fD5WjHS7mFRE9b6XT4bO/IgCh7lsL6x+N9/mRq00HPLLsu+/sYZHQ9sSKi
	5QnUFZHVe+vb+6zEfqo9pTGWV8ocmVKlAQjRMyVtfZWWHW0FecsURB4c4LTCs6UkwzdDZPRLNGE
	ckX6hsuLyisG96NpzwEWkPYLSkpSXeaO9wPQ9BbTuD6ieK2YGgzm0woHKH8tTCmJpg/cOHXYEJX
	tZN82WqbfwKWJLlr5xT17yeCeym7BFTORzEAgRZsAOpOBmTT0GuG/TYVAKzPGH8UA8EzZdy6UVs
	8cB0QL0BqVr3i1AkdDpGYRlv6pDhWf3VQr7e2YlM=
X-Google-Smtp-Source: AGHT+IEWXGSRjdy4RAu+IcFqNFLSigtkUTeWRQg71jQOmauDsjSiWhFOxk2+KAgssZQX1ci7YH+4nA==
X-Received: by 2002:a17:907:7fa4:b0:ae3:c767:da11 with SMTP id a640c23a62f3a-af9c65de7eemr1091487766b.50.1754926568473;
        Mon, 11 Aug 2025 08:36:08 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615c57f9fd0sm17432655a12.11.2025.08.11.08.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:36:08 -0700 (PDT)
Message-ID: <f6d130cac25b794e0fad1a8f0267d38acf8ee465.camel@gmail.com>
Subject: Re: [PATCH 113/114] clk: sophgo: sg2042-pll: remove round_rate() in
 favor of determine_rate()
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
Date: Mon, 11 Aug 2025 17:36:04 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-113-b3bf97b038dc@redhat.com>
References: 
	<20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-113-b3bf97b038dc@redhat.com>
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
> determine_rate() clk ops, so let's remove the round_rate() clk ops since
> it's unused.
>=20
> The implementation of sg2042_clk_pll_determine_rate() calls
> sg2042_clk_pll_round_rate(), so this folds the two into a single
> function.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> =C2=A0drivers/clk/sophgo/clk-sg2042-pll.c | 24 ++++++++----------------
> =C2=A01 file changed, 8 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk=
-sg2042-pll.c
> index e5fb0bb7ac4f97616f3b472fcab45e5729eb653e..b2cbd50ac73c7538b1acbca51=
7f4259cba885fcc 100644
> --- a/drivers/clk/sophgo/clk-sg2042-pll.c
> +++ b/drivers/clk/sophgo/clk-sg2042-pll.c
> @@ -346,37 +346,30 @@ static unsigned long sg2042_clk_pll_recalc_rate(str=
uct clk_hw *hw,
> =C2=A0	return rate;
> =C2=A0}
> =C2=A0
> -static long sg2042_clk_pll_round_rate(struct clk_hw *hw,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long req_rate,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *prate)
> +static int sg2042_clk_pll_determine_rate(struct clk_hw *hw,
> +					 struct clk_rate_request *req)
> =C2=A0{
> =C2=A0	struct sg2042_pll_ctrl pctrl_table;
> =C2=A0	unsigned int value;
> =C2=A0	long proper_rate;
> =C2=A0	int ret;
> =C2=A0
> -	ret =3D sg2042_get_pll_ctl_setting(&pctrl_table, req_rate, *prate);
> +	ret =3D sg2042_get_pll_ctl_setting(&pctrl_table,
> +					 min(req->rate, req->max_rate),
> +					 req->best_parent_rate);
> =C2=A0	if (ret) {
> =C2=A0		proper_rate =3D 0;
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> =C2=A0	value =3D sg2042_pll_ctrl_encode(&pctrl_table);
> -	proper_rate =3D (long)sg2042_pll_recalc_rate(value, *prate);
> +	proper_rate =3D (long)sg2042_pll_recalc_rate(value, req->best_parent_ra=
te);
> =C2=A0
> =C2=A0out:
> =C2=A0	pr_debug("--> %s: pll_round_rate: val =3D %ld\n",
                          ^^^^^^^^^^^^^^
Now that round_rate has gone, should the above become "pll_determine_rate"?

> =C2=A0		 clk_hw_get_name(hw), proper_rate);
> -	return proper_rate;
> -}
> +	req->rate =3D proper_rate;
> =C2=A0
> -static int sg2042_clk_pll_determine_rate(struct clk_hw *hw,
> -					 struct clk_rate_request *req)
> -{
> -	req->rate =3D sg2042_clk_pll_round_rate(hw, min(req->rate, req->max_rat=
e),
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &req->best_parent_rate);
> -	pr_debug("--> %s: pll_determine_rate: val =3D %ld\n",
> -		 clk_hw_get_name(hw), req->rate);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> @@ -417,14 +410,13 @@ static int sg2042_clk_pll_set_rate(struct clk_hw *h=
w,
> =C2=A0
> =C2=A0static const struct clk_ops sg2042_clk_pll_ops =3D {
> =C2=A0	.recalc_rate =3D sg2042_clk_pll_recalc_rate,
> -	.round_rate =3D sg2042_clk_pll_round_rate,
> =C2=A0	.determine_rate =3D sg2042_clk_pll_determine_rate,
> =C2=A0	.set_rate =3D sg2042_clk_pll_set_rate,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct clk_ops sg2042_clk_pll_ro_ops =3D {
> =C2=A0	.recalc_rate =3D sg2042_clk_pll_recalc_rate,
> -	.round_rate =3D sg2042_clk_pll_round_rate,
> +	.determine_rate =3D sg2042_clk_pll_determine_rate,
> =C2=A0};

--=20
Alexander Sverdlin.

