Return-Path: <linux-mips+bounces-10230-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FC1B222D4
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 11:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D822B50820A
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 09:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226A42EA758;
	Tue, 12 Aug 2025 09:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjU/zVK6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7162E9EA3;
	Tue, 12 Aug 2025 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990208; cv=none; b=fjWjBlU44+f/QT5ne/LyQjxW6/fZrW8MVSL8LQvS0p5Gzgh/JEyDIuSlAx9F9MiWA1+UPLah2NBGY7wkH4WakmL4isUEQHUHTWwW/8dBFM+dRSNamljxl7ybx1DEw3G05Z9skblZ3P3PGkgSkpa/tOTWVefL9Qwxsa43E9sQLbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990208; c=relaxed/simple;
	bh=XaiybivBLEOc5tyQ377RQv6aOttoAfSI7i2voibQNmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rP8vI1eudup8Gc9jSyKVghTUBqUu7TZUBCiA1UjZjirAD054byNmQqD3fzTyvesNYBuDEW3rRrW5rytCDRVnJcWIMK9ToqzTC2I8/CmIYcSniGAxTXpSAWouonBvTb5hB8Vbc3+0a9lORTedHwG5znLsmZbs8/vo3SOnujoCmdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjU/zVK6; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-433f78705feso1760249b6e.0;
        Tue, 12 Aug 2025 02:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754990205; x=1755595005; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rOGKCteFZMAy3LeuWf1j/2F5b+EEOJ9yxzrgy674/8c=;
        b=NjU/zVK6vbqLI8VfdQg4AnNkm6nuowgSx6FiT6z1edLxob5znvBOVvWQS6icC89RgG
         7/GyykHNqec1bj7f3o3FbD8tNQaufW3/9WczaTTzLtYBqwYXDPEF/0jvJSPfUgHNDNxL
         LLidypZJLNl3+dQTqMUjGJlyklZKXTmo9sSaeWpMewhbPY0kpohxTV3E5B/z/G8LjV8R
         qzTllGvAvPaCPquFJIuMhOlESlR9C1EH1DDH0xj4vxbjUtgEe2YJmatVeBVXxrGJRZCI
         s3DnovxNfAsw+hdMtDUAoQwHhOfPymnEZTu+H1UqxBUYvqsUWMYhw/GZsAEuU0njGau3
         GqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990205; x=1755595005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOGKCteFZMAy3LeuWf1j/2F5b+EEOJ9yxzrgy674/8c=;
        b=q6ArGYxM0rYR1CvLQ+vzVfyc/lQBz40iK+U1BsslJahiWUvu97RKPJodewMDNPUGlj
         tQNrvNSLNjf0MDumyBjuLDqvV3N8ugqY8aPqL9va0Ax84AImGJoWzHIqM/7Q/DBI/YkJ
         kAm91lFbRj0ooA1+RLP7watLg0C33B/A820NjkUedRMRLzQJBi5irKsQuzq2cuIniSOR
         +jG3z7xaKDIjiNw/V52njvzcpybeOtDF1kYICVrDeQ+dXpR3kxxtg0YMVp96el1crGal
         0AJTNqmS0XSoWT3kXSKKViDyWLWi18s7hupav96PJpyQ/PGxs7zmGIfcTsM0Ye22GDsK
         EyBw==
X-Forwarded-Encrypted: i=1; AJvYcCUWVU/g4NlLgW0vMZulHl3CcQ3mpDLY2ASM+5dyJus6u0c4890L5L+SOo8ejYaafDD4eol9BuPmNQ==@vger.kernel.org, AJvYcCUtk7J8CfUjJ4ieHBt/hlVKGFGea4b22aO9yIEjC/duviJPuzfAvsyU6zQRe97Jt9L1c4PwyTJ0q96xmGyu3tE2JnI=@vger.kernel.org, AJvYcCVFaNypN5Mv+dexa9rOUBda2I7jQfPb64xfVOKIHm+aCNJHOjt3573wHWazj6i96SRhUBFnUl53fQMAKIsWKg==@vger.kernel.org, AJvYcCVM1g6RKxvjU4NazZHrt9nQVGcJ0ERnDQLuxByIYwrK6fVzxQt4FzRR334DEpApjmqaMgp/HlaD1FjpXiSh8B0966Y=@vger.kernel.org, AJvYcCVNIdABiuAI+H3ZaptcapKmtlVAkGlMK/zLBG6BlaG2VeoSx2eQIyofEoYQSkaI3H/WxLMdqCXxh1C1@vger.kernel.org, AJvYcCXIjYgtYDJ7qDC+ZyIIpxsd/OthoYesacU8Mum9ejnU87+Ivhe8RX7pmgMKEG2CNSkiGPOtL8nYvJM11g==@vger.kernel.org, AJvYcCXM4nZd4bMoSiwI+UVsiZ6fbFLSwsOEEwQBMWMtX6U4yCB23rv/feUlrFOSEGuAm2vqsI/yEETas1Shmx0l@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzgn20BN2uR9o43qu21hKFaJgBkKns19AQD0VJ5wrsVTADpjWI
	qjMioQ4iIRAsXVlHBWFmSKw2GwwVz88gAnVci8G7MIMRvHcSyZVOa4X6UHrs6Prrh8rD6zOtI1q
	+/1OAH6bWoy4JkHvkErMCdL4bLRCToa4=
X-Gm-Gg: ASbGncvmLMuONpPsbp0yX7L4DZLgM0iWbOGnaNm2OAh4wSTAns2mWSmKkO/ag9BLLBx
	F2W4PtQ3GiAem2HTd/uxieSJM7oxiTGzqJGnX4+7qBLRquu8sLohRVLIg6/3bQpi/EY5xoqcJUw
	jRZNkoKgJ4tej1DN/cP5oc88qYjJwgTYwvoUJJdn8RDgC9L2jNe7TxdR4i8Q5QiI/AhovnVDJSy
	90BtA==
X-Google-Smtp-Source: AGHT+IETTIJEQRSUprmEW/PZ43+7aaIWslt+bYkWZi3Waoz2cOUzGNm7S8/l4wJRhakmB2sfTn3K3AA6daLwKG1Ea8M=
X-Received: by 2002:a05:6808:181a:b0:433:fd1b:73f1 with SMTP id
 5614622812f47-435c90f0e8fmr1519318b6e.6.1754990205351; Tue, 12 Aug 2025
 02:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-54-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-54-b3bf97b038dc@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 12 Aug 2025 17:16:09 +0800
X-Gm-Features: Ac12FXzs0-qDCA0x0Aw1aZmy8texiIAG_F4IY6MycSoBtAjQ1ujDKaGaSXI8gxQ
Message-ID: <CAAfSe-u-YkkwKyS4+6EU+-zg5ghemk-4VJVE8p4Sky1-e4Y13g@mail.gmail.com>
Subject: Re: [PATCH 054/114] clk: sprd: pll: convert from round_rate() to determine_rate()
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Andrea della Porta <andrea.porta@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
	Viresh Kumar <vireshk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Alex Helms <alexander.helms.jy@renesas.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Aug 2025 at 23:18, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
>
> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

> ---
>  drivers/clk/sprd/pll.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/sprd/pll.c b/drivers/clk/sprd/pll.c
> index 13a322b2535ac37ecb17f2c39d17d2c03532cfcb..bc6610d5fcb72faa7406ea78dca4cd9b848e9392 100644
> --- a/drivers/clk/sprd/pll.c
> +++ b/drivers/clk/sprd/pll.c
> @@ -254,16 +254,16 @@ static int sprd_pll_clk_prepare(struct clk_hw *hw)
>         return 0;
>  }
>
> -static long sprd_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> -                               unsigned long *prate)
> +static int sprd_pll_determine_rate(struct clk_hw *hw,
> +                                  struct clk_rate_request *req)
>  {
> -       return rate;
> +       return 0;
>  }
>
>  const struct clk_ops sprd_pll_ops = {
>         .prepare = sprd_pll_clk_prepare,
>         .recalc_rate = sprd_pll_recalc_rate,
> -       .round_rate = sprd_pll_round_rate,
> +       .determine_rate = sprd_pll_determine_rate,
>         .set_rate = sprd_pll_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(sprd_pll_ops);
>
> --
> 2.50.1
>
>

