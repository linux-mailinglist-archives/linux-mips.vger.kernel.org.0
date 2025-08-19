Return-Path: <linux-mips+bounces-10379-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85986B2BDF8
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 11:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD74F565D13
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 09:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986C731AF39;
	Tue, 19 Aug 2025 09:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xUGfaqai"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7670E31E0E0
	for <linux-mips@vger.kernel.org>; Tue, 19 Aug 2025 09:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596993; cv=none; b=hgULy6JYyWuUQHPjlltigg2BuvnmQnb0QMwCV5kVBs7AgsZseHV/m4iriMJrJ6j+/ru/7FnraZXe4zHVHg6+WOzBUMVSHm6uX9t5rZFg/mKzGdqLp1Jzg8pKCzbaXwuLZMOMf92dDwWttgqQediXcRgGAwFMPkpikNOlr028euQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596993; c=relaxed/simple;
	bh=tV6Flkuo2P/+55L7Kh0T7daOZ9uv2yK47XAxZBt9LOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l8hJRtzUZTXWcBLbuODK3Gx0ntD4qOzwjdYlR0Ivb4l74sPkgG5HU+rvq0LoduSvAHefHHO8WvALetpndJXyfwj3tyc0QVoQCxoNVHiTUOBEPzDY2iuRJLNKgRpypNNBT6f3qVa+0hYXgBQIbyiNB4MfHkcixGzt3dFJ3XAsaHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xUGfaqai; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55ce526627dso5171309e87.3
        for <linux-mips@vger.kernel.org>; Tue, 19 Aug 2025 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596990; x=1756201790; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV6Flkuo2P/+55L7Kh0T7daOZ9uv2yK47XAxZBt9LOQ=;
        b=xUGfaqailfILgnn9twlZVvknsFLdaaDvd0vqvVv3J2OlV1wmvU4DB0M/sM11KDa2xe
         i8YagmU7rgfupxhwmH+NBPI4s9Vy/uFYXiXNocNTdb+er7NFgOK8bIpnx0DGn9jhhYV+
         iqoLOLHkNqu/hMI2X+KiHL/6IJ7eTiJR3DmkRidipAG7dnS3oyjcpyF6/rW3du8ZMFKR
         dhCSQYm1/LFv+CMJiBBA6OFpM3NfciPZPNmd8f0/u0Qs2dh+1GajWVxUMdsl3UQAcjeN
         G2699YMNi3HziBPSD/pLEVDhCNo0nEaddDRxLpkI2T5pa4zsATVAXEzgm7aNhn1uAL4h
         yJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596990; x=1756201790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tV6Flkuo2P/+55L7Kh0T7daOZ9uv2yK47XAxZBt9LOQ=;
        b=c2PtkvPFQTvT9pHkJikq1atSOF/pdmy+aaqGCWqZY6Yz6Hufs1rH76hSzOyw+HeM1R
         yyux4bi6b1tkxw+0pIubuWtqdn19n05WlNDzVjsmwEAd8oPY/XGy1s82BpkQ4G4m6X/g
         yDYrKR90AIg6Im83YhZ3tZvJ8JuLsuo6Hi2izSJOl+nbM/fc9K76XRI5TVqxi5SL1xsl
         /jC3ujHz8B1BaSM4yZa+Lu3O6Vl5ry5aVRTOKSaKJtxOLZpmilVlqm1MW/gzS7hdZto1
         3CCvnzUwe8xkVzZ6Yqni+BxyiESVRSgcJWOlm/mpRlLjK6Bh5ZbDR2ReinJ8kh/pLzj9
         dL0A==
X-Forwarded-Encrypted: i=1; AJvYcCWqemtJ7o57jMxhhII58WcPB/Hu+UgU0qAkr3xn5PZ1M3ohDn6RBsRF7ugJGViUxlo7bT5V1BU6a8JD@vger.kernel.org
X-Gm-Message-State: AOJu0YzJKOhvoWlB60zeKCAN8SFexZ/z1ZvoNkOyQUB584VeqviVfKA3
	cRZ6Lm+sHtHvw1i7n26RaQD1q5uMbJMOp6cMDhpo1JbxTXf7dkE+ptAa5NKPoCfQBJmlm/1vsZQ
	dx0nnYKEGtklhV1C1Zfi++2ExfIwzT40nk6GX1ngNMA==
X-Gm-Gg: ASbGncu9Z/lDc5F4xE6sLCimEkV5ppqhfGBW26xkaEPzWcxDFrYCop2oZjDaeuBfzez
	rkBegPEOFIAZgbg4lff1CNLy5rTN1FtylqBrhGuyUWYp8P4WO3YL5VlNcfPvAbjZ3HAve5wpx3/
	0RIxyUaf2dqBuGTyj2Ygzrjcytl6muvvGmiGuFusRYQjl4tGXf+uOPISSRbsfWAzdpGJ+VpC8Hc
	h5rSNF4x6r3
X-Google-Smtp-Source: AGHT+IEt8RlqWWvwC2uqrmb7EU75OBtpQ0q0kJ1zr3PFW1jsKW7QqgA/pBKXOLyxKfth/q0XXJuPhRlLhC58Y7ZaIjE=
X-Received: by 2002:a05:6512:ac9:b0:553:51a2:4405 with SMTP id
 2adb3069b0e04-55e00850835mr590681e87.45.1755596989499; Tue, 19 Aug 2025
 02:49:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-109-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-109-b3bf97b038dc@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:49:38 +0200
X-Gm-Features: Ac12FXyEOw7KCbkbFT2OqCP4TngpQPKLbvy9M6n90z-zmlM7tVP9PQNq8vVGJnI
Message-ID: <CACRpkdaW=f7xm+rsD8XUUx-qhuh8sk1mCU-erve-_9S4uUpHbA@mail.gmail.com>
Subject: Re: [PATCH 109/114] clk: versatile: vexpress-osc: convert from
 round_rate() to determine_rate()
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
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Michal Simek <michal.simek@amd.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
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
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
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
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 5:21=E2=80=AFPM Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:

> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

