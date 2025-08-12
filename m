Return-Path: <linux-mips+bounces-10232-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 079D1B222FF
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 11:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA24D3AF6A2
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 09:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDFE2E9EC9;
	Tue, 12 Aug 2025 09:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgpR5eZC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C842E92C2;
	Tue, 12 Aug 2025 09:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990260; cv=none; b=O6XlybJvAoSbgyxBcZ4KqVRi6g4w9NknxpHSw8F/UCRuiOcD6UCE07aiNtUhKFkiqa6p2ExEA4Zg+PEcdVPesNxqo61A/lGbisg5Qh9OHBrSUoVvu8ig/jmv5SC2ktWbYY640MPuskpqxySXUGn9W0NAEjmMhAzwFlCfjrQBGkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990260; c=relaxed/simple;
	bh=MgJgkqy4X7VBkdUHQgmnpgJcaBRPxSksxSZ/rty4i9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkFTQP/zdQsAIn4053eSAtP/TBHZhklJkrUgxWOhfO/guCQzerTeKc9u6+KIE35q9hZ5TycqakRaUuMAHkp3feh/avgRXZVncB/mYoK82vHzgauEWQ9xhoPvJjS5tJ/voWljcK4yAzTyxImqYHJ228ox5xuPMo3E8WKdf3fWmzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgpR5eZC; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-433fa926c9eso3134381b6e.0;
        Tue, 12 Aug 2025 02:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754990258; x=1755595058; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OsZfh7jnCZM1qIdbyzshEpg7lU806F0f1eIeVxq5DZ4=;
        b=dgpR5eZC2d8TRvFbRYJkhqN8eEBMTUkC51PFOLOuuoV+qqwq7Bh4ZEdOl27Zg9xYrI
         skh5QFjRtyijhEC/QHmmkWkCM8EUvX38CCTVHTN8QEiZhgzf0VPw2zxbLozqwS+Vt+qx
         AJFhcfvikM/oJk6yu1IoqfHFT3pyYTIEQKlYXO57ARUHX+67yXXgr3KNqcMXUjY4/4VR
         dSI65JfJRtBpks6KCCM0cekfiJUNI9TN4Eet6snpjwo/T9M0YnQALhVCle1GQHV1INNJ
         XoJ7Ao/Je4P0xDNamUsfHw/WWHXOKIr5yUaPL2gnyGoVGXsq/j3ROyZOm+JJRlGfwIXh
         QHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990258; x=1755595058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsZfh7jnCZM1qIdbyzshEpg7lU806F0f1eIeVxq5DZ4=;
        b=lfIAI1skF1O/rk0EAWEeiu6HNK5GiVSOY/TJJ29lSF0OEgqA8ME81uSbqgc/0IuYsD
         +DiJJx4quQ1TlqJcSMLCQzY4RLCgvbezkFyYVyTRTq1nk+dOZx7xMdMDnl7El2E/GChb
         IoU4EQtNF0bZ6bNIFxgbfJQ+69NK2q+oRci7w+R+NYtujsLQdGnlMHMhu2EPrGH0oySv
         Q1KpJFi5D+IFPs9IOXUjaaQO7l3qIyEeGWp3OcgGZThZUMgnLBtXqkCOqpQyOAoCqptl
         CDbD2PzsLsH2IyG2y5xtj6ikF8Hv/vre2eylpC5vBLA0c7yA2ahduD8bVMNYbvlxVivl
         m/MA==
X-Forwarded-Encrypted: i=1; AJvYcCU14KdR0sdckBuOjnpg5DgCaJF0yA8aritcnKRM2yIOouT90/txK+psIjcuOXbzg437LCuk6i2ZpA==@vger.kernel.org, AJvYcCUbA3aWeC7maF85fz6PzczmwrAntNqyaKaP/oT/PdiWG0/wtsfBDU2C3O/wluydrzH6iqFZQyIjn2YS@vger.kernel.org, AJvYcCVE/BOGsSNmf6yncpczhRM86SjHdJytv4AOxl1bAgdT6ZoRXscy3pgF35VjnBO+cLCFix8YPN+KETAA/E4X@vger.kernel.org, AJvYcCVnYWrnTwsBvNa0hWlDaILxJtr4Qtu2wB2hDFvkURydT7Lmk15niJhrPDuvRWsppuO+8Gp+UNLBXgBPOA==@vger.kernel.org, AJvYcCWbjuqhlorFUiEemPY8hzuMYrWPWdK8xlzd7wfW6UZesCBioDZdaVB/+dMYqcxeF+DnE3+tV9TqyKZzV1LZw7oexQE=@vger.kernel.org, AJvYcCXG6J3awt3WSIj0g45MxqO715iv6nBOsZ4hAkXsrW5mz3pfaK0PisnjCEfMhzXSsR6vOd3lmXP0HN69/5GjmkV0r68=@vger.kernel.org, AJvYcCXbXMUH0GmioWdVvvPwRdDbek14OAzlTNKd7MJB2VPilcpecDZ3Jc6TatSa0u+euaSUP+iJ28QHOPZeC3fFxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydCI3g01dnGQsYIs0hhNP+Yy8TLStkCn7Wm6gmIoX9BAy43qub
	lfSg5/dziyNErwqDTin2CGNJciQi/mqP0AzjX3jqb+/ZUNzUnhn/g3Y66gJPHD1fGdTniL3JYeE
	sgsEEdpiXK6phwUnTHmhAlFZuMEVBHwE=
X-Gm-Gg: ASbGncvV/ye5N6hXepPjHi9DNaMzh2CcP489Vk0ZY0gPSkNHLFvQOx0SStnQtcLF5/5
	wE0LdoQvTgxIuLjZEf2Z6TWuIXQ1wYLaCiSsTBXm/fqSLqDusIyuNETCOju2Ql1H5sSM1VP8t55
	cohg5b4WnJAY+8u4rfzAhjUkc7nf8pHFj1ssAeeMRkHlkpe5dzlUsKwOxtCilGYQFzGiG4Rrkd+
	ujHOosnN/NbVolYQcdwug==
X-Google-Smtp-Source: AGHT+IGeKg+1AsHT8OzWJRaAIn4nQ5un+51PPsEFZqXXG7zkpSAAOASU4iUV34U5Po600E/i/8biPwPW0aGpB8iXi3U=
X-Received: by 2002:a05:6808:30a4:b0:433:fd1b:73f3 with SMTP id
 5614622812f47-43597b3b9d0mr10072751b6e.5.1754990257436; Tue, 12 Aug 2025
 02:17:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-53-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-53-b3bf97b038dc@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 12 Aug 2025 17:17:01 +0800
X-Gm-Features: Ac12FXwWvkLhtiiPhiHwQqmN1cgPTqDfCjN_x0Nmsu9rzni9NmKJK-aaPD6k1MI
Message-ID: <CAAfSe-spVF480JyBwxFN=KH82CdKNR0oY87oR6fsR+-CUH356Q@mail.gmail.com>
Subject: Re: [PATCH 053/114] clk: sprd: div: convert from round_rate() to determine_rate()
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
>  drivers/clk/sprd/div.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/sprd/div.c b/drivers/clk/sprd/div.c
> index 936782c241271832c0a1957c99cbecc287351d1b..013423881968002d29c4e9536e7cd7b944779196 100644
> --- a/drivers/clk/sprd/div.c
> +++ b/drivers/clk/sprd/div.c
> @@ -9,13 +9,16 @@
>
>  #include "div.h"
>
> -static long sprd_div_round_rate(struct clk_hw *hw, unsigned long rate,
> -                               unsigned long *parent_rate)
> +static int sprd_div_determine_rate(struct clk_hw *hw,
> +                                  struct clk_rate_request *req)
>  {
>         struct sprd_div *cd = hw_to_sprd_div(hw);
>
> -       return divider_round_rate(&cd->common.hw, rate, parent_rate, NULL,
> -                                 cd->div.width, 0);
> +       req->rate = divider_round_rate(&cd->common.hw, req->rate,
> +                                      &req->best_parent_rate,
> +                                      NULL, cd->div.width, 0);
> +
> +       return 0;
>  }
>
>  unsigned long sprd_div_helper_recalc_rate(struct sprd_clk_common *common,
> @@ -75,7 +78,7 @@ static int sprd_div_set_rate(struct clk_hw *hw, unsigned long rate,
>
>  const struct clk_ops sprd_div_ops = {
>         .recalc_rate = sprd_div_recalc_rate,
> -       .round_rate = sprd_div_round_rate,
> +       .determine_rate = sprd_div_determine_rate,
>         .set_rate = sprd_div_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(sprd_div_ops);
>
> --
> 2.50.1
>
>

