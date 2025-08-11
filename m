Return-Path: <linux-mips+bounces-10174-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5508B210E5
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 18:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31A95687146
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 16:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DB92EBB8E;
	Mon, 11 Aug 2025 15:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H15rXKTN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC782EB5DB;
	Mon, 11 Aug 2025 15:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927167; cv=none; b=VEI0f1rm7ZqWHYlyUzovgEEq+lBtHiTgV41xhdK7HjwESGiu9LvA22r+NQ4xEs0jkXYSrhs1t/OAW0B9O2jzkPnXg9EzcpJNuJk4JJb1Fi+y4k9lsxZZz8klte43LEEkk2R+wyX4XlPsQEvIl42ASlggjmhk0uCaVeoEdbbpbGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927167; c=relaxed/simple;
	bh=Q77wqwAbcHR9HUwTxUgg9jG4ex1oX2nizpAbF8eii58=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jGi1J3IYPiZsY0MB1Dx516sAlssjGQrIEEFD4XWEuykGPaDXif6xz9kr7uioDBrgea8z5QGmUWdZvZ0SJzd65iGiALP6GTEGLNURgxFJOYSJnBgr/8mMUbA9sz9cWsdW3N9dV3tWow3DAXx+B8mnHZS1/KJt7WLMeQk9Y7S9x10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H15rXKTN; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-615756b1e99so6187116a12.0;
        Mon, 11 Aug 2025 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927162; x=1755531962; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0XIy5fUomSBPaFsng7WEyeMEK8C2loF9IYDTwEHeIQg=;
        b=H15rXKTN5mK9YrnzkJEZeXTkwd7uzkX6tlNXWTAmI34fyrujwr8yUPJIivdgqa5Fje
         YOxYOLs1pAVXq70KfI65QxpChKXxXvLUZdOglMMGd6/fdBFuV5niyofZSpZ8bWHIS5Ar
         j7lCYVA2Xmj1PufNlrDi//nxH1kVHEeQ6G9nSbjBRsF9Ni/uYt54xcsERRZSDhjntmS7
         Cje5RWakpGlqEy6CjqfMXB92jJLEAggC7ovQIbfehMj6+gvFhbse1NvBOc2FQyxuKYRP
         zizKQo1yBQrq3Y8O8CarGfqvXdCcIB5Q8WzCzf9IKJeozGPxYonupWPa4vKb4ZFxjFlU
         NP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927162; x=1755531962;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XIy5fUomSBPaFsng7WEyeMEK8C2loF9IYDTwEHeIQg=;
        b=RvjWz/zIL99YfzNuutlkrmmZoBAs3yO7i02TlxwAX4kd/t9MJyCRtR0rHBry5GEnGd
         BQhRHNCBFRB/TTh924PfI4fK8JRfKGJTJKXRus81Nzam0I/X5Sm2pwUky4Ah8a+buFbq
         1rwDtCfa/u1ojBTko80lb1yDKm8/vxWA0sact1HWiFOPIZvaI3KwsvgYdVM9ksL/ZNzO
         2P26TB5+de2mYcqKsAKVVPWmUkErvnI1Vd9c/7N2NGxqisG9ZjSKNisG7pHWFioCmXcp
         91IrFDqV5q3VISXi3ETAv79wmG/AtfgZEkYim34jEXGnAl/DGOqk6i9fkDg0DJl3UwiO
         Bt/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPRjdIsWijRKB1TO0o9ms5f3MlbfxCoxnrrY2TFSmjPVPGGMM55NOTgNTZ//LKEskwLqZOvXwz0oIC9tjyrw==@vger.kernel.org, AJvYcCUmDNAmLiGcHw9xmv7xmEYNEB4s4AQ/TvMD5vzKY17lAGA/FUi2G5EvdqBQRR//fXEtkqxFxrt+IoHI4Xfo@vger.kernel.org, AJvYcCW/2BJ4BfdFWf2AnpG1dQ/PXilsi4UagVLprOs3yvDynLCI0Dadt6v7nVwgYWoo6L152SVrBhsp9g4031iy//O/tyA=@vger.kernel.org, AJvYcCWF5V80OKSBk5KWlwb3t5pPLd+mDTpXlHXQ69kBEps+VLFN+GkrdFYjoJBOgyRjqtMKVkZcqoJ7Hg==@vger.kernel.org, AJvYcCWa9DmzqKW0RgOBR7tN403OE5LFod/qVUpLNW5hH7M26jAddYqQIAIiqICvU8eCXQ76t0ni1piLHeUXAxpk4Wh+o6s=@vger.kernel.org, AJvYcCWgJsMfZo8L0+glLS9jk6nPYwfCIcJk5aC3q/Msrfm5HRktGdd33Z8tc0bJQXBJnrCM6oJo92Lqt7Y7Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp3XoHSLSryLfZah0B39LGLcZYyUfWig5J/j/UUhLQUy5iJ3oi
	becKUDJzOrUexhhDKXzHGWDfIwleJsqFBiZyfeso0+A9p1XakvLEeewG
X-Gm-Gg: ASbGnctR8sKyEmE2QK51neEA2mQOwHOwj69J4AdmE4A/QLWf8gV+eZcbcA0odyLUgIa
	vrtLF9FYTob5lf5/ZlLyvT7CN8QmqEjSYAJp6rDf5NIDH6EPy5LVec9Bwdap7jIScE7UzLn8D0k
	6Sn9SJB5G4iWaQd3XlK1PltfMnrXmctmwb8ZOxBzLnuJwqvK7BSxWWPRaD1DjxsTfAOw8KW5Wr5
	fDbBlIEIa3JAjj3lb123CKRHFzBHB9LQIv95aC3ijP+WenEr1bAZnWZVmTnbjmdDYvglE9dTHOX
	3eEP5iN9NRZ6mI4lNjA3k01mB8frfAvlH2kl5FNPpTmsVlI0O1wm9RB6JhKElfu05J4Wk8qkxCa
	I65OO+019D3XSYDrJOAfwURh27aTKIw3FZkPwbE4=
X-Google-Smtp-Source: AGHT+IGKOhTznscGhTdRt3W/yuNZg42+gjVjgTXKMoiUalIdY18fOpSzUHq5EIPnFUdAaOuOrYQZJA==
X-Received: by 2002:a05:6402:2106:b0:615:5353:5e2c with SMTP id 4fb4d7f45d1cf-617e2e5311dmr11886624a12.19.1754927161809;
        Mon, 11 Aug 2025 08:46:01 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f25739sm18957452a12.21.2025.08.11.08.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:46:01 -0700 (PDT)
Message-ID: <9379f132e52c972b2735cad768242cb784b0ed2b.camel@gmail.com>
Subject: Re: [PATCH 048/114] clk: sophgo: sg2042-clkgen: convert from
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
Date: Mon, 11 Aug 2025 17:45:57 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-48-b3bf97b038dc@redhat.com>
References: 
	<20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-48-b3bf97b038dc@redhat.com>
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
> ---
> =C2=A0drivers/clk/sophgo/clk-sg2042-clkgen.c | 17 +++++++++--------
> =C2=A01 file changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/=
clk-sg2042-clkgen.c
> index 9e61288d34f3757315702c355f2669577b29676f..1d3b1656bcf2e6655e0299e68=
ab39f32189744dc 100644
> --- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
> +++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> @@ -176,9 +176,8 @@ static unsigned long sg2042_clk_divider_recalc_rate(s=
truct clk_hw *hw,
> =C2=A0	return ret_rate;
> =C2=A0}
> =C2=A0
> -static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
> -					=C2=A0 unsigned long rate,
> -					=C2=A0 unsigned long *prate)
> +static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_rate_request *req)
> =C2=A0{
> =C2=A0	struct sg2042_divider_clock *divider =3D to_sg2042_clk_divider(hw)=
;
> =C2=A0	unsigned long ret_rate;
> @@ -192,15 +191,17 @@ static long sg2042_clk_divider_round_rate(struct cl=
k_hw *hw,
> =C2=A0			bestdiv =3D readl(divider->reg) >> divider->shift;
> =C2=A0			bestdiv &=3D clk_div_mask(divider->width);
> =C2=A0		}
> -		ret_rate =3D DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
> +		ret_rate =3D DIV_ROUND_UP_ULL((u64)*&req->best_parent_rate, bestdiv);
                                                 ^^
May "*&" be redundand?


> =C2=A0	} else {
> -		ret_rate =3D divider_round_rate(hw, rate, prate, NULL,
> +		ret_rate =3D divider_round_rate(hw, req->rate, &req->best_parent_rate,=
 NULL,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 divider->width, divider->div_fl=
ags);
> =C2=A0	}
> =C2=A0
> =C2=A0	pr_debug("--> %s: divider_round_rate: val =3D %ld\n",
> =C2=A0		 clk_hw_get_name(hw), ret_rate);
> -	return ret_rate;
> +	req->rate =3D ret_rate;
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
> @@ -258,13 +259,13 @@ static int sg2042_clk_divider_set_rate(struct clk_h=
w *hw,
> =C2=A0
> =C2=A0static const struct clk_ops sg2042_clk_divider_ops =3D {
> =C2=A0	.recalc_rate =3D sg2042_clk_divider_recalc_rate,
> -	.round_rate =3D sg2042_clk_divider_round_rate,
> +	.determine_rate =3D sg2042_clk_divider_determine_rate,
> =C2=A0	.set_rate =3D sg2042_clk_divider_set_rate,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct clk_ops sg2042_clk_divider_ro_ops =3D {
> =C2=A0	.recalc_rate =3D sg2042_clk_divider_recalc_rate,
> -	.round_rate =3D sg2042_clk_divider_round_rate,
> +	.determine_rate =3D sg2042_clk_divider_determine_rate,
> =C2=A0};

--=20
Alexander Sverdlin.

