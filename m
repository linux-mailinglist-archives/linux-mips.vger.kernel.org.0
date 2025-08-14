Return-Path: <linux-mips+bounces-10298-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65967B26AB2
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 17:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCA077ADFEE
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 15:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223FD21C9E7;
	Thu, 14 Aug 2025 15:19:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDF2215766;
	Thu, 14 Aug 2025 15:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755184756; cv=none; b=aMT4ysYnKn9CFHH6XHZHogIXyW/Ov0rIv64i1dOyOyJn2J/NGHa9xynSoRJIT9w+Y6VSBZpa5T+1F/nXIv861JOzS33ZpRepTKj6touCO8fHzRMvuS3lWuFkJdyM0VMiCqBjxJxoma0TbBGEaSz6Bs2dTDgODu98iUmru+ZU+o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755184756; c=relaxed/simple;
	bh=cL7dYIlmSlciFuIopinblc3YB80GsYEt7bRotIwo9B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AfBIxbBeMxFotcODwinTcSu/DBI6i+n43Jd4shBVwnfQ0lRN0VsW1pIpztA72GL00BRKA1EWljkAsFIqrcCy2AstcmTpp5mMaKoKsZeXsku6RbiSOx6SxSuYu4m1VFRl8kJ5vcZ9I+BSCVaRzIvG9nr1aM/y8NXsSwPm33slctE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-30cce872d9cso1096204fac.1;
        Thu, 14 Aug 2025 08:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755184752; x=1755789552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umiR4j7DjLNlMEowdV58E6T5tLX87kYcXiEtAZnwsfI=;
        b=CqZN/7q9558xE+Oqcna/Dug9g05vTK2uxHOZoDWb7J7m3uwJZUYyoGsbOklIOK9PqQ
         /YW1Ex1ban44vDv/wlu7IUFw8bzSDeXRHdpO+nikHAsPy9d1UTJ3lR6HwFGSUncO+/6U
         2NzofV9Ux13ARqkof1icQKN7QlwQCB0GTUMv6VzOclWq7yxU9n/uKJp/pljJ6Xr6MuYr
         FGsmuOQ0PqUHI0yw+Xm/mVSidSMy3EZaSClB809AA+aKK4GekI+HH+7UPYnFfISosJyV
         ZMMihXiSPVy46zsxlK1IXCVCR6vHbA3XWMyTpA9nkfxsN4wnZ+md1cK0iCG4OAGAG9cM
         k37w==
X-Forwarded-Encrypted: i=1; AJvYcCUFw3NUbVNYtLqvV73UJMjQTeZc6xUx1WkwGV1LmBWLC/jOHzGCdkYfvwEGLyg3zA2VpUmZ4kUyCOuhzLCE@vger.kernel.org, AJvYcCUOFfJZiSbCZeZ+qajNS1MLCPQFRGj3RvtftP2O9rrPfcLov88uZC2MlGUDEBiqAwq5RIdQ+un3WOV4Kd+mBmlrRZw=@vger.kernel.org, AJvYcCVygz/OhzI2L/wnyC0tNlGGb19k7QxdsC9V6fIQksMj4b5dA9db559TZ+RPD5+U3Xad430LisObVKrjZ15G1g==@vger.kernel.org, AJvYcCWfhYQtsh+1xJdkIUORblua9PnLdfVw/eV90bgwziKZlQLaYu09ddgNS2kWsFqbkAlRMPImKIxPhNIu0wEl5rUwSt0=@vger.kernel.org, AJvYcCXBSgt3TSiapsi/ezERWeorvCswp+yqjCoLo3RT0eCBwAi32NNC8ZEEwA6n7f0iswNIFk+noOwmjA==@vger.kernel.org, AJvYcCXI3TFH+3D95Sp+JQXUHdDmB/0frL9ittVy6/j3tRiaLPqJaF8G/iYZ8QVizYyqw2Ykoi7GuRlHK6by@vger.kernel.org, AJvYcCXRHvQYqVKplIBEicNx6JpH0poPiR/t0eLpGjuFA6YeFanCdtHbYr07LjMMOKJUQEYRyFfTHDWulh61dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8HnhY3QWzcvsybV8/C4pdGSz7wP3yRVPej+3Ub90bphh5ZEky
	Pn4L3hnQ2xCikeHSgnofLZxxv6sH0CykHHVPcpej3C9Bgy4NyuJWl6h1h5xfchR+
X-Gm-Gg: ASbGncusEcJ9x8ADQBo2lx9zJ/shnvhKxPzjligGHyO/6qopcl6NfNATBC4LXF8lwTh
	7h/f6lz0EJ2oxP34t+GrVG304jwCv+ykoCJspi6j39J2BFVbqlXOQWQQ1OELrNU94FHUkQx+zDW
	BOY6HCmT9Sai8QvTGI8UPHxdQROaljKDjZ+6CZymuLlKbjrYabI0ypdSMkpwAZv3WoJ0Jj8aC8X
	aRxPpsEO6lXZsnixQJIHySEsfzBP7s6oIIABfU4X+Z5ZA2UgQzf7DujcBPDpBQGeO/8g6+Piq3o
	HHf6aAjyEPskLzB8nv+htA59EdebP6oMF6pKVQdwBpHgga+VwMkj6TjWq0fU7ButTBlbGkrUjnU
	5EwzctM4+lMQ0oJsIMvKIJ6a7gnvEC7Y2Qf7vaOq/DGpc+S/051Yk7jBk0NhTt3VmOjeAzhY=
X-Google-Smtp-Source: AGHT+IE4pV+ULk6KODTO+lPVxDx8ECfT0Y8UM2EXil7mEkrceQtHD+b+lhnMsEr4EaoT1XAsMXpDXg==
X-Received: by 2002:a05:6871:8917:b0:30b:75a2:a45e with SMTP id 586e51a60fabf-30cd1383599mr2304125fac.33.1755184752355;
        Thu, 14 Aug 2025 08:19:12 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7436f9821d8sm1488227a34.39.2025.08.14.08.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 08:19:12 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-74382027898so586633a34.3;
        Thu, 14 Aug 2025 08:19:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1eLXBNZzpneyt9Yr/Qa9uvOK+MFq8Wa1BMRQ/FmWpTwBzIEitqQi7fOS0wb01zqQXcSsR373Yyw==@vger.kernel.org, AJvYcCUz7XU3+RNnca+PKBmUy2BlJSobUKnJ5AlbMnUt+TdG1tlEepuYogYLOQNtcK1LFLZPS13jdduLOCjNQrxPiAOH7Ds=@vger.kernel.org, AJvYcCVQUpZmXo69/VlJa1AAuIiBqTQDK8eOiZiFjLiG+n2A6EbU1Rp5ih2k+DiP6EH83Mh/RHDBkjK1WkGxbw==@vger.kernel.org, AJvYcCVlQipVdy+z+oLlM43JkvW1lfhhbkUpukiyDKUGJzuPx1eFASwfaQNzk+qc2KRWLYDzony41EyBts8NrmK7WHhzSyQ=@vger.kernel.org, AJvYcCW2BOHrZc3hN6iFwqAtTs/F7Zj7VsXMIN/4th+2oAZHF2f99IE9AZkEPZMMgTEMWX40X/zbXKb9lD1Y9OLf@vger.kernel.org, AJvYcCWCbfy8BeT4PumMA8Eezi4nQ37ZwMWX8QQGiETRLFIzSIU2FxHfaPCymwzYZifwJhxrGsOCDaY2u3a1@vger.kernel.org, AJvYcCWK/g4Y+eVP54VnLIlYWzIDIMWaBs2JiQYd5rTZ2ccnr2jND6pbYmO87jgzCtqHFHNVFjCJ8KvpxFakM8OSxQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4192:b0:4fc:1484:5500 with SMTP id
 ada2fe7eead31-50feb4013d9mr1289391137.21.1755184278470; Thu, 14 Aug 2025
 08:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-93-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-93-b3bf97b038dc@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 17:11:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpmdSzNcUOgjWLJhH6+5FkPEF9uruqGqbk-u0SC5z5wg@mail.gmail.com>
X-Gm-Features: Ac12FXzyDBZHsviTnjmg5miZS8Vof98mQ5mu_iqWAq-BW-zvBlKCQTg0qFd90xs
Message-ID: <CAMuHMdUpmdSzNcUOgjWLJhH6+5FkPEF9uruqGqbk-u0SC5z5wg@mail.gmail.com>
Subject: Re: [PATCH 093/114] clk: renesas: rzv2h-cpg: remove round_rate() in
 favor of determine_rate()
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

On Mon, 11 Aug 2025 at 17:18, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
> From: Brian Masney <bmasney@redhat.com>
>
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops, so let's remove the round_rate() clk ops since
> it's unused.
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

