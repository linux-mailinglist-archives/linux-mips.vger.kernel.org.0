Return-Path: <linux-mips+bounces-10179-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E8AB2114D
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 18:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ECC56833E2
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 16:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B312E285C;
	Mon, 11 Aug 2025 16:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKKKt/+/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4F1238C16;
	Mon, 11 Aug 2025 16:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754928056; cv=none; b=Jb8hnWdjwTOGtHX9YQAU9RDzgZpCbgGlK5t4Z2heUU8iEOKbgQFdqJiWp1bVWyYLgbSn8AXCXOn13l4r3og/jLK4IG2BuzRO3F4KudqTO3x8S2CVXJNKURoyZNxv9N2peSTTArl/2qURKKyFW+EwIKpsgEnVgzQdHqmc+lsWrX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754928056; c=relaxed/simple;
	bh=c4dnBdft5abWpi6v7xsGcdHktYX5OXpwZTFm+IlP2U8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gPICEyF6aAesto2kmgHctqcRl7mntZ1NiJiNsh2SMBgUViUWczRnpN4JthEXmEWrLVfaZzX9QNeVnUfjUoYM8OOCpvNxrFHv+T8f2LSLYSsU0iM6DbJbVqyflFWpTAYYvmzvw4SPUGjkgfc/ebk/lUq7JoazIRI3kMLbVete648=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKKKt/+/; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-af910372ab3so940249066b.1;
        Mon, 11 Aug 2025 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754928051; x=1755532851; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cmIrlL5AjQp5OrtEkcw9eDi4LGiI7a6CtQnHd0I7Fpk=;
        b=TKKKt/+/lPvxvJoH6AhdboX7XWHzzv8s4r7qdWbt1nqUAOuzYb4qppIC7kqhZeYAsj
         8vUijOcscMmYDLK+u0zozoVcEVF9U3pdY7Wmehj8w3LurhPAB9iCB4hZ80K/1SeJRnzK
         VlwLKC9zGPb9FocwS79tv52JIpwhDEJvo/u7DmIb5obpeDgzKHiKR4BH+D0xRq0ctqWW
         0a7hmvs5v7rqj5lOVhoFPdCIUDaFBLjTvOtAksHv8buk4JKI/TogFCpfhv0lw150gzJi
         1jj3bLYYYVqvw/wwg7uATKTCTvRUlPRoQ/tONCdId4oNRU+fM/Mob+plqpDOBCDdv4kP
         z7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754928051; x=1755532851;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cmIrlL5AjQp5OrtEkcw9eDi4LGiI7a6CtQnHd0I7Fpk=;
        b=dWs7zZH0tMJw7mVVB9286GHWLMLZdQcU329/aqa41wBajdPzsrVc3Aedp4i5oqOlra
         f7NT9CztPnckESis/lYg5V6dzSnGqZ3nO4w8PdasTVlkLmI8o2a4b0kry9EUyPyT/0Ri
         SLMv+M5mCEgwWDWtJyq82PIkXV/2iy2omGfqqTYnUoZN10bY8TB1nF3NTGZD/xcRii0m
         09ivyv5Nu5zOQMzrL9XL5XM10PDRWmUjk1jR6T53OQlOLLoFrhoJSuilC44XPbH/QxyV
         bg0F9oZACUIm/3pkUP66NuAdNqMzuH0fZKEZlBdZoU1/2RDjW62LY17gGC7soSfsfTYO
         tJ+g==
X-Forwarded-Encrypted: i=1; AJvYcCUUmDmZr1gRK/vZaUWNhtSZsVgfwO7g0TGvC5qXbZdQXAHE49d27ejMltUVDWhgkQPDK3pWO0ORL95r7ylJ7oMOV0Q=@vger.kernel.org, AJvYcCVOlHZ0+qEq2gE4NYc/VeSKDantkRBgiBBR1ycchED8srMd5MIPQyxIXdkHdqjHaB5KlUL6bSO9bw==@vger.kernel.org, AJvYcCVpTxjhag8ixMJq1NamIfIaU8QJEl1jj+TpO+pvHeCIvT8GNs7lqeW9VVjGRi7W2tLdGpHsZobruTWejEKNURgZ9Rg=@vger.kernel.org, AJvYcCW//lh0tgFO8v28t7QmWJ3a74jGrVwJh5NJtW4OHlQFAs/8YpSYt3AmG3CtaLAGmiAOwOVhb+8zJCfJHox35g==@vger.kernel.org, AJvYcCWJ9rN97iPk+/RzvjkstyYYYQlLnxeej3drfduXlMi3zQyiD2pQ0vYF7xWWlHl3YyenCqM4/VnZoNuxjp4X@vger.kernel.org, AJvYcCXOuix/LFS0fI5hNaikkBLdjTE4u70U/SDTP8jdo3Nwf82mKE/qDgz6P4oMKNv++z4bOIuQ6QoeUpEyDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4H51npszQRqjHklz7Y6mLI28GmRJxFALmprjVvgEp8isbCR2V
	eNgixD95XzhA3rXGEQ9rt1MLeZlbBcoOfWYOtna0mTN2qID1sKy/+5pq
X-Gm-Gg: ASbGncvbGswzTdXEpTwmO7trVfyIhTlJkzrCvlqO2WrF9HwdIJG59I8gUiPNO65AUGC
	e/e90IlZ62y8y8go0Qkr/ttNQ0y7mz8GMpD/JuepleRjigzlDV+Ktzb9N19aSw3o5/gmjew7QxR
	R1+6ejKYMdPh4Je81E4VjdbP+mtjQ21ssYb0CsnG7EJ7MXg4Rs66QwfoPoxZ2nGxM8bzxvuNgAt
	ERuvo/oPHY3Nhk21o+nGUjxXErPkdArZtwfYAKTtRw4b/5YxhgnKyTA9sOzMFYtPNXTTqIOC/BO
	KXRtpTu0uNKFenbc2IlXMxgPeLuyJY8X9/gOVuQHjc68pwxmdNd9zvVIg0u0bY5GN0pSAjR4Fof
	8ePzYYgv3U3iYhexwyfM1yCGFE3zQdH/FA2Kax2EF2iOmGa2ICQ==
X-Google-Smtp-Source: AGHT+IGh6yl4CupkZ+bbkqrg8mnCZBWOoNaEnJApexkC1cSCi5mW8bJYL756B85cuxjEowuHPJgNRQ==
X-Received: by 2002:a17:907:9486:b0:af2:31a9:c981 with SMTP id a640c23a62f3a-afa1d7233bdmr11410366b.23.1754928050948;
        Mon, 11 Aug 2025 09:00:50 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a07643asm2049410666b.15.2025.08.11.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 09:00:50 -0700 (PDT)
Message-ID: <c7f1fb05a6b7703ab18770bb5b58af0c58154f1f.camel@gmail.com>
Subject: Re: [PATCH 002/114] clk: at91: peripheral: convert from
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
Date: Mon, 11 Aug 2025 18:00:47 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-2-b3bf97b038dc@redhat.com>
References: 
	<20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-2-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-08-11 at 11:17 -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
>=20
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> This driver already has a clk_sam9x5_peripheral_determine_rate()
> implementation, however it can change the parent rate. The existing
> round rate does not have this functionality. I could add a check
> for CLK_SET_RATE_PARENT, and combine the two functions, however there
> are some other minor differences in the two implementations. I don't
> have access to this particular hardware. I believe that they could
> be combined, however it would need to be tested on real hardware.
> So, let's play it safe and convert the existing round rate
> implementation to ensure that the driver keeps the same functionality
> as before.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/clk/at91/clk-peripheral.c | 41 +++++++++++++++++++++++-----=
-----------
> =C2=A01 file changed, 24 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-per=
ipheral.c
> index 629f050a855aaebfd1a03ff87c2b016cd2284a5a..e700f40fd87f9327365f25036=
6f7f7bde01f5987 100644
> --- a/drivers/clk/at91/clk-peripheral.c
> +++ b/drivers/clk/at91/clk-peripheral.c
> @@ -335,50 +335,57 @@ static int clk_sam9x5_peripheral_determine_rate(str=
uct clk_hw *hw,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static long clk_sam9x5_peripheral_round_rate(struct clk_hw *hw,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long rate,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *parent_rate)
> +static int clk_sam9x5_peripheral_no_parent_determine_rate(struct clk_hw =
*hw,
> +							=C2=A0 struct clk_rate_request *req)
> =C2=A0{
> =C2=A0	int shift =3D 0;
> =C2=A0	unsigned long best_rate;
> =C2=A0	unsigned long best_diff;
> -	unsigned long cur_rate =3D *parent_rate;
> +	unsigned long cur_rate =3D req->best_parent_rate;
> =C2=A0	unsigned long cur_diff;
> =C2=A0	struct clk_sam9x5_peripheral *periph =3D to_clk_sam9x5_peripheral(=
hw);
> =C2=A0
> -	if (periph->id < PERIPHERAL_ID_MIN || !periph->range.max)
> -		return *parent_rate;
> +	if (periph->id < PERIPHERAL_ID_MIN || !periph->range.max) {
> +		req->rate =3D req->best_parent_rate;
> +
> +		return 0;
> +	}
> =C2=A0
> =C2=A0	if (periph->range.max) {
> =C2=A0		for (; shift <=3D PERIPHERAL_MAX_SHIFT; shift++) {
> -			cur_rate =3D *parent_rate >> shift;
> +			cur_rate =3D req->best_parent_rate >> shift;
> =C2=A0			if (cur_rate <=3D periph->range.max)
> =C2=A0				break;
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	if (rate >=3D cur_rate)
> -		return cur_rate;
> +	if (req->rate >=3D cur_rate) {
> +		req->rate =3D cur_rate;
> +
> +		return 0;
> +	}
> =C2=A0
> -	best_diff =3D cur_rate - rate;
> +	best_diff =3D cur_rate - req->rate;
> =C2=A0	best_rate =3D cur_rate;
> =C2=A0	for (; shift <=3D PERIPHERAL_MAX_SHIFT; shift++) {
> -		cur_rate =3D *parent_rate >> shift;
> -		if (cur_rate < rate)
> -			cur_diff =3D rate - cur_rate;
> +		cur_rate =3D req->best_parent_rate >> shift;
> +		if (cur_rate < req->rate)
> +			cur_diff =3D req->rate - cur_rate;
> =C2=A0		else
> -			cur_diff =3D cur_rate - rate;
> +			cur_diff =3D cur_rate - req->rate;
> =C2=A0
> =C2=A0		if (cur_diff < best_diff) {
> =C2=A0			best_diff =3D cur_diff;
> =C2=A0			best_rate =3D cur_rate;
> =C2=A0		}
> =C2=A0
> -		if (!best_diff || cur_rate < rate)
> +		if (!best_diff || cur_rate < req->rate)
> =C2=A0			break;
> =C2=A0	}
> =C2=A0
> -	return best_rate;
> +	req->rate =3D best_rate;
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int clk_sam9x5_peripheral_set_rate(struct clk_hw *hw,
> @@ -430,7 +437,7 @@ static const struct clk_ops sam9x5_peripheral_ops =3D=
 {
> =C2=A0	.disable =3D clk_sam9x5_peripheral_disable,
> =C2=A0	.is_enabled =3D clk_sam9x5_peripheral_is_enabled,
> =C2=A0	.recalc_rate =3D clk_sam9x5_peripheral_recalc_rate,
> -	.round_rate =3D clk_sam9x5_peripheral_round_rate,
> +	.determine_rate =3D clk_sam9x5_peripheral_no_parent_determine_rate,
> =C2=A0	.set_rate =3D clk_sam9x5_peripheral_set_rate,
> =C2=A0	.save_context =3D clk_sam9x5_peripheral_save_context,
> =C2=A0	.restore_context =3D clk_sam9x5_peripheral_restore_context,

--=20
Alexander Sverdlin.

