Return-Path: <linux-mips+bounces-10175-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE972B2112C
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 18:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51E9617DDDF
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 16:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A7329BDA0;
	Mon, 11 Aug 2025 15:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtKBmngQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997F829BD92;
	Mon, 11 Aug 2025 15:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927260; cv=none; b=kib5Ek9i12VjG4OkKaumetYpNoJNNQvsEyVPOmsqc3u7e/AoijLtc37fd+1gRLGSrr6JmN1WfksgVw6wd48JbAn7R161u24XE/ySZTfBVUWpNpjsWQ8MMuXPfF6ZTHkGc6kGvBVNHLsnUn7OQj6X9LA7bHYr/yZqAqu/DwQbic8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927260; c=relaxed/simple;
	bh=HqZVUyZfVpIoagKLdA4Wnmr1ax/f/DpaIg2D3Ho4d+g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LWqW+KDWJWfC3+8sQcJjW2LFiMlnAG0/kfDPrA4Qxtv7sSQFkCuVXVwyNBv1OHxdTzRRiyDWVz5LhpbD/PPQGCve5N7iBp26MKiMoK7VIhoDFy5v+0FoN6tofc5CeJTieyvyLsLzLiHSaGHsDspM8y3sdIOeLBil6hEaJD6dHHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtKBmngQ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-af90fd52147so680495666b.3;
        Mon, 11 Aug 2025 08:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927256; x=1755532056; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HepA4l2VLL2ahLpWoV8gVaUs9oZFV/xKVn3GOH58US4=;
        b=UtKBmngQszzpO/c/ctnB40SRIOUZT6tLbRDUjZi9DKZtMpnr7jFzBrEVy/fwtso+u6
         U0nSQHxxTuuer8Xzkr7pDhmZZRmrh3E/sUX4YdSvvkNaBD6WNspBc4bvEYHWta7X8p95
         1MvDyPU5PptjG23Y3VRxB5HXCdUK+fdtHmfdFT68M/pIDM/KyrJSgwwfok2qrvfvwXWn
         bXjnYn3XbkHspkDNCo4dobqmwYL6NIGhf/Dv5PNttoVIuhmuKsRa6BKCAYohExhXOgw/
         XGhKqQaBqZODgGqYXUP8hkhfNsxi8NpEm3c1+I9cLb6ije4UENh7PCwBJTrjJ2opYt8s
         FzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927256; x=1755532056;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HepA4l2VLL2ahLpWoV8gVaUs9oZFV/xKVn3GOH58US4=;
        b=SD0bSH8/uQjXb1x5yzHai4WVyN4cVhFWdqAeukwkvAAvsKgTHEJ/IfWutFFWDTcj4O
         PfEbq9HlNk8nL7q3+t86ffdoqet8LvkFAbv8fDxz9kLq9dDvvsXEyed5nBW9q5RTP3No
         ZdI8AtO+iqeFMnnDl8cvH5EGFsYcs0NqRk9CEUisGTmsmFmEXHUJVafSCpjLL3GxKQ8z
         snMGBpbSRyc21AhIWsNTLK9011pzdK9PLPWK0SoihKUDhiWgwsQi24tj+qHwX4bT7oiq
         cCRN2pCx0oq9dCpKmzkLw22MPc/7W/G2V7jz0szvXHsaubzZCvFgSNu6ENA1eqIh99xc
         pIOw==
X-Forwarded-Encrypted: i=1; AJvYcCVUIl27eZeb01jvnx7i3Q4Eh4Nob3pNA7TLx/GYVDB2sGPDHjwHM84aPpdwJJZLNUcGg3LQe+YIcZS+gw==@vger.kernel.org, AJvYcCViP9GKPFjtRgjBjpIdLmNJ8LteLbHk+PawV7Ad+S+k7qITMCdfRaI5gZf+iQG6Tu8/QFnJcDALv45dJ1xI@vger.kernel.org, AJvYcCWSrNzpwt193uMS8+bxWWWHZBFp9rnGY6fWf2UrBMZr8nG+tyN6sR/67rzGjfgQjyJyf+7kRYZkTJnrzkEZAA==@vger.kernel.org, AJvYcCXEWYhQaAsvJaah4CFFkK8cihpc5LGTy70MouYRRt2xIP7gjJFTyBPu/TSoVrgRZpCOnlQeUHcw9wcj3rQ8M8+pXiY=@vger.kernel.org, AJvYcCXu8uEI+/nPV18muaMVxxPET5Rsp3IRxmyMPYnYwv1aLfemygLcO689jVGh5nZZHIbD/eK2JLOdrG2kEs2mOlHRxuM=@vger.kernel.org, AJvYcCXy7qNYMFevUdGvdXOHtO1fJxKW0Cnov6rWQZD7hSkxQ9zmyMgmW4qdkxe6G0nbU6XbWQB1hvybJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGT+oXUCXQakCXWVtDvvRpCOA101Q5xHJiN4IyfUe1frynTKhi
	5ZtSYIG3bICUbn24ygIQY831AY1URKkzswdJRoxO0+uJYxc3tqdPqGa2
X-Gm-Gg: ASbGnctEdPi1O2lQ50Mjqxh5yA2hEYeN/l6KW4PvhuFs6k5c9P4JVYT64N6c2ex1oei
	H0KlEBicL/jFp5I7gsYyae0jt8+3aPKG71S2JuCm/r8W6MlzxO8nu6Ax1Fr/6VLuIDo2KBHovsa
	2Imtyv60AAJzX9TdbRuIc6eSjb2of/p+1KDNRRZNpykjIehDC5K1nXVc58JhoHBeKqm9IIlflOZ
	TrYzVg9ckmSn7C4GYzH5/Iftrd5Qox4o+wDR5+ZYU9T9+xeydKH/XDG+8bBsE+ddWL5ihIvn0Z8
	TrLgBbJNaDowBI4mXtdnfGkiV3B7rt1cP5iWYZ8W/9Hy+YClZy2GOKR58bK8HkDWr3TBIqOrat2
	b17maqN4BP2cbgpw1ua5tNk5G/MksJRxepDmJY0g=
X-Google-Smtp-Source: AGHT+IF0QNexCp3wac3HqRrzYFcQwTmRLRgzyDHjNrtoHTrtc/DjgfXz7LJ4ALK6NtSRdUvSvS+HtQ==
X-Received: by 2002:a17:906:9f91:b0:af9:7823:620b with SMTP id a640c23a62f3a-af9c6517c2cmr1234169966b.44.1754927255767;
        Mon, 11 Aug 2025 08:47:35 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a076409sm2048822966b.12.2025.08.11.08.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:47:35 -0700 (PDT)
Message-ID: <597d4a777a13c2b67effaf5ba32959710d2f58f8.camel@gmail.com>
Subject: Re: [PATCH 047/114] clk: sophgo: cv18xx-ip: convert from
 round_rate() to determine_rate()
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
Date: Mon, 11 Aug 2025 17:47:31 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-47-b3bf97b038dc@redhat.com>
References: 
	<20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-47-b3bf97b038dc@redhat.com>
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
> =C2=A0drivers/clk/sophgo/clk-cv18xx-ip.c | 10 ++++++----
> =C2=A01 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/sophgo/clk-cv18xx-ip.c b/drivers/clk/sophgo/clk-=
cv18xx-ip.c
> index b186e64d4813e2701b17520e544c453fc13d0e77..c2b58faf0938b7d537dc3a81a=
ef59c549b9c9c79 100644
> --- a/drivers/clk/sophgo/clk-cv18xx-ip.c
> +++ b/drivers/clk/sophgo/clk-cv18xx-ip.c
> @@ -45,10 +45,12 @@ static unsigned long gate_recalc_rate(struct clk_hw *=
hw,
> =C2=A0	return parent_rate;
> =C2=A0}
> =C2=A0
> -static long gate_round_rate(struct clk_hw *hw, unsigned long rate,
> -			=C2=A0=C2=A0=C2=A0 unsigned long *parent_rate)
> +static int gate_determine_rate(struct clk_hw *hw,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_rate_request *req)
> =C2=A0{
> -	return *parent_rate;
> +	req->rate =3D req->best_parent_rate;
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int gate_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -63,7 +65,7 @@ const struct clk_ops cv1800_clk_gate_ops =3D {
> =C2=A0	.is_enabled =3D gate_is_enabled,
> =C2=A0
> =C2=A0	.recalc_rate =3D gate_recalc_rate,
> -	.round_rate =3D gate_round_rate,
> +	.determine_rate =3D gate_determine_rate,
> =C2=A0	.set_rate =3D gate_set_rate,
> =C2=A0};

--=20
Alexander Sverdlin.

