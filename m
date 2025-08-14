Return-Path: <linux-mips+bounces-10300-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB19B26AFE
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 17:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B00634E3507
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 15:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0114F222560;
	Thu, 14 Aug 2025 15:30:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8D5217F34;
	Thu, 14 Aug 2025 15:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755185410; cv=none; b=k7rOo7uJVir9MYoLiuz4umSFH/aM7hL3b9G09uOmNUCWQedFh2p9nlMuuZxXfIkfKJCsxkUigagRjheewOfIhdg232rOjRJ4eaYPXthFA+1kVcrYYoB1a77paXHcxWbU8/N4IxxXSMJ7LpGHbyruZcy7Nueu9x68iakeBNNWCvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755185410; c=relaxed/simple;
	bh=QYRUK4EXKQ3Br3Wc32yS0rLX0zRpM2iSrQbV0k4msLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W5HaWJNB5yFOWH6ORohcWcjxlNHxkOlGsKLnAmPqyscyHSFNo7kq5OUrqGGCp6C7e42BMNNGupoqRf6DyZwQ6TFFZSIogP4IZWK4cA74b8oa9iUzFCB7+U+p64mxiQB/mAtjLohw4qzWxsMh3MNWIy5gAXao3fcIRK+Nyv1jb5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-74381ed5567so549123a34.1;
        Thu, 14 Aug 2025 08:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755185408; x=1755790208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9du/Bs1Vwkuk15qOOpl62+YeIchI37tbTZ/WdEUy2s=;
        b=WaHN2/mYnRT+unxLRZOZ+kEa3l1yZdDfqt7WWxL9VEVeCN7GwnyTLXeHAUkrlga27k
         7+OV3iSRxu6EKR5KS8H8hQ47/PGO7LfStqt9DG9dlyginSlE5s30L3XmdiaHRs5LOsjt
         XCMHvOi7AgaNy93QOKKuZ/Bz3/uq3V8QMiRymwVJziXgsXkgNOIx+fUBVQ39LOuWGTIi
         peA8nuuB9l4ZcI0F1zQ2U6rkd5hTccS2ejCK6xQ0DSJ5SxzER4tWaqvGDaZVkCGTXYys
         U8lPGvBBiTKYxiJxFFgewcYuEfOupqaGFQa7WG5uY5w/F36mTJgSNxwLAdalGjOyxP9v
         AC9A==
X-Forwarded-Encrypted: i=1; AJvYcCU4gRhRyvAySezY67c6igw65uZ5HuUFdUpoTdGUxBE2gVibmJQIFkqO8MVWGU6DYNzCRnEMANcH7Q==@vger.kernel.org, AJvYcCUBVf5+8s4eAmJe9ntYm4gGyLCWcDxy/+0J+Q1svNLn6l8p/vCQDAAclRja7xM4LZFq6p7ei6o0LzL0VQ==@vger.kernel.org, AJvYcCUWur4iOlN14ame+Y5nhwwpzIli8pvJxmrW4CqWKzk+tbSygDcmQhE10i921un6B9JsWCFSW1DYKscpekooww==@vger.kernel.org, AJvYcCVVW9nJ++owPEt/fgroLh2NS4H6t88vdsOfxBEVMcwYTHgGa5EmadgnIYKcQvi9XMMJlc9VgmdN6PVom4dYP/Ze4FI=@vger.kernel.org, AJvYcCVs48fAsh1ErLmLhzxf/Fao4/5VJMoacj8/M6ik8A8q8ax4Un4D/DpvAvFSER7QUojHCNxa+Qdwq2YilcC79SZAvR8=@vger.kernel.org, AJvYcCWn8oFMEqlJoluVsfrFni2hJ2x1XxXdUa0PFsmbfbKEkN4hdMzH3LYjl6Ng1Pmih15J/Yj9I12qIFeEGMqf@vger.kernel.org, AJvYcCXGTOzeWqWg5O15R60qs/XJaO5jsrr8x7y17lG23YB0rfG+GT2hCjnllMbhrVi7SG11h4sWf1j56C2y@vger.kernel.org
X-Gm-Message-State: AOJu0YxBDw0THRN4Q46qgLQkFoW8FpLg3CaVPomqdcCkOsZhPQ/woOyx
	kakVk76E0EdfNMXS8TvQBvlQIj4muuTJRldymROE1iPF4IM7o0X29lF++927D1oZ
X-Gm-Gg: ASbGncscS+Sbh+mDgUneinz05aB0yT7boHrW9WHr8ADWJnj8pGBhVVgWQ0gOOEDIbA8
	M2KADpZKSCgrAJFNzv/FqKyQ/ZHwuWHAydHAvTjmEUz+c/Lu4SN34KKYf8q7MMUK4Bb/9zImor+
	VUAipw396zRgvllF1NLWDmiTD5LKdawyfIUzugTlXMUKAIBG/q8CEMU2Grb7J88TJKU43THncG5
	Yg37bn0IHJXSAGfTa9+fprHoWlnWLwPy2wmLqLgJ5rLIwJ8saMw75+CxkOUmZuhQV0jjvhBlY1s
	CedxA0s/4KSeokUBoPmFLWjZFcXoYs/+xW65Qez9q75TBi9m4j1X0ymLkM5oUFeTIWc/gZrQIWw
	4QcHhJ4k2l4jkoIznp1sHJCP9PvRmaMbN/P0XO0hSfWT7v1FEE3nYSL8XDXVS2JIZ7b+md6g=
X-Google-Smtp-Source: AGHT+IEBDxnMmtw1mGlZxi3sooeebHiN8D20hnUAg1n9o8DiDqOJlvJCPF0OHdbMATdI2suzUal3RA==
X-Received: by 2002:a05:6830:661a:b0:741:b827:feda with SMTP id 46e09a7af769-74382c02786mr2278808a34.25.1755185408212;
        Thu, 14 Aug 2025 08:30:08 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7436f7a3e73sm1514152a34.0.2025.08.14.08.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 08:30:07 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-74381dd4c61so502515a34.0;
        Thu, 14 Aug 2025 08:30:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+5+VbG8A5HplG2YF5gMN5YBXYrcmt9co6DXu2dQwbs115RxWEzBT9tkbWPviUZ4scC9pEZTvAXot0phoM@vger.kernel.org, AJvYcCU3caaQfm9J4CkDm4Xxc6tFebVuGkUM7gzmc4IG/nOWQ+RGV7JV3RWHCNb7otHImvLJbTBtV7ug4w==@vger.kernel.org, AJvYcCV2VHiy91g1zcG/3ec3wR8HE3lY+kGnSpTXsd3eOwakmPO7vK8KgU/5s3dipWYSgKPMD4s4IcQNMRdq@vger.kernel.org, AJvYcCW4a0S7PVZTtUTpIQmbikGoIZRXYqpq9pXzuimfZpxc8ANuu8bZjJEInNdct40klHVS83YARanaQoAStmdyQQ==@vger.kernel.org, AJvYcCWN1BCj0jaVuIfUzcr11dN35Ed8iFJQWDts/s9d3mlHrzsFwVOnHGyBnBA8ScXEp4iwHGHqk1dIv+CSO6wvhRuMdoM=@vger.kernel.org, AJvYcCWroU6fm2UL6HGy7s6/1XLC4aiaSan0APJb+J8iwBvVGfR1obVluDaebcomd6+Didl11tP24iNmZOb3CQ==@vger.kernel.org, AJvYcCXxrcwzKyKPkXZczkpFUZYAhPpGyTGoRBJT7H+MGODzLbDOSxwhPLfWHeaesnsC17nG6oo5ueIdRwdnOZbuLMx8Eh8=@vger.kernel.org
X-Received: by 2002:a05:690c:700b:b0:719:f582:be17 with SMTP id
 00721157ae682-71d635fe81bmr48846567b3.35.1755183986689; Thu, 14 Aug 2025
 08:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-92-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-92-b3bf97b038dc@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 17:06:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUR9phiPyhi9=f3gdA_f5oRmaX=ucj8SUquXQEq7bUTkg@mail.gmail.com>
X-Gm-Features: Ac12FXzt8_e3pGt50aBSDpwDZhCGVBhDLrUDheSmsSXHpMoy_pb5BR_R7aHtEdE
Message-ID: <CAMuHMdUR9phiPyhi9=f3gdA_f5oRmaX=ucj8SUquXQEq7bUTkg@mail.gmail.com>
Subject: Re: [PATCH 092/114] clk: renesas: rzg2l-cpg: convert from
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
	Heiko Stuebner <heiko@sntech.de>, Andrea della Porta <andrea.porta@suse.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Alex Helms <alexander.helms.jy@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, 
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

On Mon, 11 Aug 2025 at 17:19, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

