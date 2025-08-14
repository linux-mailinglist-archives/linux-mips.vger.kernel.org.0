Return-Path: <linux-mips+bounces-10297-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E54E1B26AC7
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 17:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FC6056545F
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 15:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F65F21C16B;
	Thu, 14 Aug 2025 15:16:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A9921ABA4;
	Thu, 14 Aug 2025 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755184617; cv=none; b=AumI7WSdaBXL9BbE42b5x/ttazIaJdfHSWu97l/JuE3ei9ou2VA6b4qZaFFSiv9CTFX0/RVk2eR9UrIvOTa6ZvbgSWsJHf7cMD9ju3xk1aWfi8EquY0m6pSz/ivZoe18BsM/29PZiMX4Xgg25cueaY/Frux2JvtmcWuaR7jWHPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755184617; c=relaxed/simple;
	bh=PMFf9xzg7pxujnDyrrhyaKEYpp1klQQY8RGxuDDnp2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Foc47pchPHR53/m+ITLfaI1PlxFcQ+5FzsIkD/y8Wwduf0OgYx7ym32EM7Nekz8nHEPFwMaKIQ0l5mHmsOhw3scmP6LHjyhGgYT8TfxQc9poSdka9z91Xcx3sJj/oABBQKG9m+ZENDiJCQd+vZmXy9mzsVwOIQiWF1py4y9JB/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-30cce83fb5fso690993fac.1;
        Thu, 14 Aug 2025 08:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755184614; x=1755789414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUx5rdSAym75bidV8LMMjvhD6atsKdb4p+2dl0DoyhU=;
        b=l5Q21Ytj861r/MJ2QcB6qBEvYCQQw2vzULZaUyb9libIMq3z5kQ2xixcs9dZf8xKtK
         YXZu2e8M9qk5wRP83rh+1q53qj4w+HRkHrAacWucdN0Zb5OkmukS59wPgQnth+Nh3orc
         Ci7mpxAKXlt8KsoFmv54fVayQaSOTe6YE5ho2paEvcbjpWwXV1UHi4hoS6VJgMwg5Y2i
         jNI/3pRdiWjK+88bYHH4KLlZgqLsTJ5NoTQxQMhoNcx2ThptO4aK1s2iZ8gT0tb2ay90
         INwa9azF6cCk04+r318+8gQhWYFo/6iaA5iE102yCtIy8pr3S4nILJnzMEjGDkkpv5EL
         SQ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2rLaOtKqrhBLCCEQkbaLeEBDNucWro5BTuCf1momoHs0cGyDDmfeU7U927WOPa4FZDDNXTcNVEg6b+Kn6@vger.kernel.org, AJvYcCVsuiAo5oobAaos1XJcUgosg6ZEwmglC4z0JB2I+DYpsW8dX9oHBxmDw/RCkt8BMYEaXmYWdw7b5JegGAANWQ==@vger.kernel.org, AJvYcCW/6zUTxAY6nY6r0f99bOGad8FrhIeI/66V4sc1UmAJ8QGlpEnOpVlu7+UvNvFRJFYr2MKCn7DUbh2IWQ==@vger.kernel.org, AJvYcCWcQvJ043y17WJpQLuEZeQ9ylXCk/vw+aSw0PBFS/ZOBOLfkmGXvRPDftvnHHSZkmtqhVpUpJAw7EkQvIm3LgXwrcE=@vger.kernel.org, AJvYcCWe9Ej+5tuAoGgBKFS7FhNLu2wLiw6mcShMuWJHs1/7ilWqOx1657D5sJvklPhrXtRcdUMhAveLiw==@vger.kernel.org, AJvYcCXPbUip6cp5Wsjq0RUC8oU3jIN5dCCKY181R02AktHwX0vuCErIgfmqKCU78e+SA7uUdZvbMG2Tgcr2@vger.kernel.org, AJvYcCXWKK2qqtXFkmiIxXlukO14na9wNdyqrkf42XYB0As7IaFHZ+mSFOr5VfuhqcxoKmyXty9WRoqglpySsKQRPMMsjy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwwPtJeBVhYnkUqAliMg2K5tYsHfjZoytTDo6D7CxPy91OejcP
	fUG42DsFc84vnTJK8prrQagV7+weQSruQe3mvZVz1ztdF5WX7/BnZE7q5tAqyvlf
X-Gm-Gg: ASbGncteX2oD5SfKKOUCIL3hI+V+usQmPKBOkSVaIkSpngiIgF6i0SMzq1yJV76ycTi
	DrfbnYEkVUkjFbY5BbaQl+O+7EJIEhfpYZQVnonSVLFHAvtVL5wA6ia82YuwZDoAYqTmmGQN4/n
	9YFqefhS3Zd8JSzgiwc3+Klnh6RsD2a/19gFnRjMyhIEkih9qSgi3gzsPRUyVVCWX5+htzBx+pp
	z8BAvsogtQMDorRnd+/XJ3+R51Sug6yn2ClPWc1bVB9X1HvPtlFa3GLO5szn39a6ZAQYmyl/VV+
	WFeEPOEZRksa5KIYoLgvEzkDkwxthAX9SMxT2q1++fOnOL4CnMog5IiZyPH0J5cNtkok/E0205r
	JiPaIONa1uE4WInGoDNo/MF6TCeM5C8x9S8W1NSsCpOujCOEfBBX/wjeWm5SS
X-Google-Smtp-Source: AGHT+IHleF1KhCQRwQpLHBVeZ+jksRslQfFyEIsTwcpiCcsptA+0rXQr1GPfUSEE9xIWH7UtUzWUoA==
X-Received: by 2002:a05:6870:9726:b0:30c:99ff:730a with SMTP id 586e51a60fabf-30cd12cabb4mr2387487fac.23.1755184614186;
        Thu, 14 Aug 2025 08:16:54 -0700 (PDT)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com. [209.85.160.53])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7436f982410sm1476336a34.40.2025.08.14.08.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 08:16:53 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-30cce83fb5fso690983fac.1;
        Thu, 14 Aug 2025 08:16:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6okWnQAYfYw+vCM3Z1ql6X8tQkVb+5j6u/HhrOXA/hiXKR3wH0ME92KCXnM8sQsyCE+HGQv96CKe6UAN3zQ==@vger.kernel.org, AJvYcCVswhOg7x9NUu8Z0xaDl+T87z3fC/vTRORtFC/7bmNnRKolV2so5foPicmfheXELibuslKprwlW0ZThMcbUf2mSzfE=@vger.kernel.org, AJvYcCWfMO9gabqXobIs9IaR5OfmokZglfZx9mfOF3D6Re1oeaCTvcD/NLoO7rtt2LBjiVvktAfAZEbqwLLXRd0g@vger.kernel.org, AJvYcCWkU4UY00BpWaPU4jdDK4VNJGhF/RDekehglCECnXr5o/2cBQNXEO/8VqNs0wgVaEfw8oOFt90Sl2sP@vger.kernel.org, AJvYcCXLUlXlKbYvPeDSohLPnRvR1tSD8LbSZFQUDfgaSOAo5u5LymsOIvWvav4jhi+u9GNgnzelYPhDIdnANg==@vger.kernel.org, AJvYcCXcdoWc7WanchgGoUNlTaP0EGnaPHszw+BdXQXbb7xVSobDDPyz9jaax40C2Gz4ZXi/VRVhEvCyTfyMGes2VfvBFOA=@vger.kernel.org, AJvYcCXh9HAOeWp0vc73LPyouBtKPvpLXDM2+HRN73dWXh5uZ0aQu0iFMUIj5i/903eIiW3DmL7QjUtxEg==@vger.kernel.org
X-Received: by 2002:a05:6102:e09:b0:4fc:b033:cdc5 with SMTP id
 ada2fe7eead31-50fe9974df5mr1305485137.22.1755184225208; Thu, 14 Aug 2025
 08:10:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-111-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-111-b3bf97b038dc@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 17:10:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnN+4B1=RhOOHZ9mCN4e4WnfjtY_HO1t+176=dSs26Qw@mail.gmail.com>
X-Gm-Features: Ac12FXz03sJgdAZuxBhvZVUnciJ_u8JIfA74KaWnv048j9en2I4ZzU7p0Ef3ecQ
Message-ID: <CAMuHMdXnN+4B1=RhOOHZ9mCN4e4WnfjtY_HO1t+176=dSs26Qw@mail.gmail.com>
Subject: Re: [PATCH 111/114] clk: divider: remove round_rate() in favor of determine_rate()
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
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops. Also all clk drivers that directly calls
> divider's round_rate() have been migrated over to determine_rate(). So
> let's remove the round_rate() clk ops.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

