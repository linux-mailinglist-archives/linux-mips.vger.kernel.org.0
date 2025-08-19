Return-Path: <linux-mips+bounces-10376-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D67D1B2BDD6
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 11:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE1F319646D6
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 09:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA4031A046;
	Tue, 19 Aug 2025 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zmi1XXK4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07695310630
	for <linux-mips@vger.kernel.org>; Tue, 19 Aug 2025 09:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596807; cv=none; b=bEpdxkoRlNREtsUwonaLKQZR94rzsux4rMTbwsKsXteIKos8JPXUP8aDondgmYrWZIkwpYG/1OeSdMht7FweLBW9wvMy29OhwLRnkyyZLNt896Jy3NM1j9sIfBrCyWP3sDQoUmwq3PVEUiYrqHIMEaP0OlnWFYEQDMAcl80Lls0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596807; c=relaxed/simple;
	bh=CnJekPM0wQKG9e7pS0aBHZul0jrDqWHtRHfFM2JeVrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t51xBGCmVMT25SLgUptIpZ5ywaksR0640xlM35hAHQPHIPTqyKK30R2rREkgrdrN1Rpa0atjtcNsPXqBnXUtyR7NSnEK2uYwBK5Apopj6sEENiIz0l8PD+DDitm39w+6F10RgrQzdkwpABQPMKBQ2Irw+xuT6VNeVA1k7wo+xrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zmi1XXK4; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55ce520c9acso5137876e87.1
        for <linux-mips@vger.kernel.org>; Tue, 19 Aug 2025 02:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596803; x=1756201603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnJekPM0wQKG9e7pS0aBHZul0jrDqWHtRHfFM2JeVrQ=;
        b=Zmi1XXK4wKmRuynbrwT8fn72i6E5QZzEJ6LCdcveQ4hFn9whcKtHfr87ay8H4Y+9KV
         lng10Yu1G/9gConL0pN/9mlwVgCgz//l3Px/GwqISBFVaAR93O6sOLumX9p01ykV25TX
         NYzgrhIuOGKm1/dSx6jB33sij3qY19lEC4qaBVyBFx2H9c1CVtmU1IO3I+JGAQR/syBW
         V4nHpsU1JTUQgDv9K65CovKkelbqDhfscqVbIucyf4TQVtHBUgNIefr4QDVOOlThsH4o
         QD/zEu919Zitm4lEL3BSv7hjdX0YxJzt7L6f5y6HkhgmSxUNLcq51f8vAlc+yCO31urf
         rPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596803; x=1756201603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CnJekPM0wQKG9e7pS0aBHZul0jrDqWHtRHfFM2JeVrQ=;
        b=vEKjKxh3eVtns1EaD/8xrGZLjZxIqes4jv/nGCY+uU8O+TYyBMT6qE+jWH9Z2NfDqG
         evW6n4oqYkKC5fdtUI4pxsI0XZ1Cd0YSXWsnxd1xuNtq3nryKz4k5oWjo6SH2FdzjcHi
         q6zvDpO7kyLWPqFQhuJYWmGA+wPQZc5UpPVCv2fKWcemVsjHMyVopIhL5g95XZMiyE4i
         u+vPqdbqgq0XhqEQUhRVqVJBwSMvbV8AueEduxjwj0uYnl+Xl+W/+ZiWC7BcCh1mPEqc
         HQvRF/A8pq+LLQb0menBe/0IvV2cmFfBxasDNHotsxwr8XBGEymjgud1KdN6WDb/r3mk
         yGXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBR0b4M9Xec1nm4s4Lxnten3Xeo/X6DIS0rziu/gLobVSkVvv0pl+8bYpf92WaLK4/M1oqbW6IVWpw@vger.kernel.org
X-Gm-Message-State: AOJu0YyXXro+IWDxCVQJYjnjkCXyNDMoCC19T6JxLMecCAearuW80dSm
	P+PoCb5LpNUyotAOr6ZZPxt/Zhw2sQZ51hWHSq3I6zokmCwh54BZOFXS6/jM0c2351xXz1AAg/U
	8+GBhCHlSYVXtC3iSlLCsUoJDPzpmBytvAR/ChqHzeg==
X-Gm-Gg: ASbGnctIMMPN7XQaViTpiYBzep1fRSbaneMoPy0dACcmHkOJR5SD6mApRhTUmPxAovS
	1iJywZOAxnOiUo9KW0/rFRFaIPFrqKrOsXk3csIE3E92euG46KYxP3GdSe2cmuDvY+Taz2+xzD1
	pKZlwRM3egB1VsmV9clYMPd2oRaBqkY/xahrmQ98i3JUbAcNZbnO5HiIwo2Ekze894cMDdvAuKR
	G0Gak0=
X-Google-Smtp-Source: AGHT+IEnhi69VygT7g84GFEWBMGYd/u/z/IkVXlUwHEo4DfM7Y7k8WnKy5jP9SBDHCTX2vCUgNODYTsIltctm9ywUhA=
X-Received: by 2002:a05:6512:61d4:20b0:55c:c9d5:d337 with SMTP id
 2adb3069b0e04-55e007aecbfmr398443e87.24.1755596802917; Tue, 19 Aug 2025
 02:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-16-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-16-b3bf97b038dc@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:46:31 +0200
X-Gm-Features: Ac12FXzd6X-i_It645W5rQicFyi-TYZe6vnFChkDKrkqPz2wrPccuV5zYO_EO9M
Message-ID: <CACRpkdaeF5VueC44jQZzdJjVJXj2F7cDsOzb6aa6bHLgQJXS7Q@mail.gmail.com>
Subject: Re: [PATCH 016/114] clk: gemini: convert from round_rate() to determine_rate()
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

On Mon, Aug 11, 2025 at 5:18=E2=80=AFPM Brian Masney via B4 Relay
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

