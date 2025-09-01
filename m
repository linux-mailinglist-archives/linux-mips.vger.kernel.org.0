Return-Path: <linux-mips+bounces-10864-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA268B3DF16
	for <lists+linux-mips@lfdr.de>; Mon,  1 Sep 2025 11:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A09818888CE
	for <lists+linux-mips@lfdr.de>; Mon,  1 Sep 2025 09:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF7D30C608;
	Mon,  1 Sep 2025 09:55:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21872277813;
	Mon,  1 Sep 2025 09:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720538; cv=none; b=Tsliqz45cZjkZgGGpSU8HVZIUxPFf7ZVpn/h1yBd21SymK7hztyJndE9PBzIPXxR8gOOLKv9UAq96vuQ4Vt+q4AY0IJkGqNoerjv5WOuglB/2huVIs9Vbg0306xOYZaQWgCeRTNCAoFNmQYacpIL9X+rLxAIShGytVxyQF2hphk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720538; c=relaxed/simple;
	bh=ZHCWs4HH+c5lN4IlE9gqTWg9pmmhgAFoeTj2IWPQWHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gP3rpIjhpMrjmvgT8TeP5SiSIUxN04fAcwYIRwuhiTtwe95wEIkJ9cZbquW/1OsWlzJZ+XhKH1Kvoneq8gSmzX+i5csHp+l9WsKpEF2ZNyTUcGkLBJfzJvjO/MfvRcfrFEErUn+b2ju5TBHv9tRYQj5qHhaSOb2wn8qawr/Fdhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7e86faa158fso433481885a.1;
        Mon, 01 Sep 2025 02:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720536; x=1757325336;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tFy+S32zcH8SOQI+WY2rqVzMFSU7CQi//EUuweLF5I=;
        b=gkgVRwmTvrHY8QjA24Ae5C0EU6BTXQJ4h83NWkwEJv3qr7ZdZrzvKtrdxEJqQJy8Op
         y6DgfdGRSQBoMfTkfyJxfqoVrUfBCG2hLXKq8YhJorvSPrhgaHeARofrUxHmSxRPqzWm
         VuWGjx9dUVzde0HzHmnR7vVJzJtAmfLEoyKDPgk1YNOYUdTifQ3RZ40LOLdShW0dyhtL
         ayU0eR76FlL6baN1derAx20KU5vkrddPZ4FWQlSzma7r1bfpJBoWh1JzVRuquwzmUjjF
         sJzpRQfoJCL51DIvr9fOkduFpkhkLOqIJn0xQvsG7mb+SgBen7eaLY0bm8pm4aJK5cE0
         dlsA==
X-Forwarded-Encrypted: i=1; AJvYcCVM69MgPxyoR5Ut5aeWygoHr2XUIaQDJwu1fyTWaibj5wv3J0XXzx7sim4+tW69urS9w2kcpJkq8A==@vger.kernel.org, AJvYcCVbL6OrZIOvBxOjnR+pyPDujq/LoDpLxHhzNZ9oD/DY7jng2U9a8i37TUz8/BYT7beZOHT2EmL5UPAaXQ==@vger.kernel.org, AJvYcCVdop25MYNDUoYyn0qe2IPO/jihXUygnuWkDkWkMq5JD62Wl029HYSBB6cg+A9EVkjdu68ZsFZ80+CCHbMSiAP/qyI=@vger.kernel.org, AJvYcCVeqjHQ21KWXaPYHKnsy/aryWgyEAfHB8rWCG3j38KgkuJvKcoht4IkRS8fC7fby/+h/9MTLfFeXfgnFUTvJA==@vger.kernel.org, AJvYcCWaHvinxtxPdxoeffoboUjY4hchGV/xRfqRPc6USd0Op9t0swuHYuuI955q07VPWXH1OuGRaByyjdBPbH3g@vger.kernel.org, AJvYcCXSVMZ7HMvDMxhqmun1tiiRk9p8fp7hXonWnCXu9vXJAGIOMHbXQpSz2MayBL6w2M1/jCGfK1+lpjaRDexarHk4K70=@vger.kernel.org, AJvYcCXot2odj62uBzP9nx/PMNOiRePPiFxnvNANdVQVRz8kMJBtZBXqH7sTJUaBJZxYkUnwV3l70OKLZM9N@vger.kernel.org
X-Gm-Message-State: AOJu0YwiWOitpcdaO9ZiOGO1JFv1SDQ3Da8V1V6FvQgxtCo+iwWvtksw
	UrNjJIWy5w6UkJ45fRVkeXKRkDNizN1vnUK2QtYMJdRZkPcXjhFTwOlj2UWANFcR
X-Gm-Gg: ASbGnctTlLPATc09KAlNjicABySP6ryuDvuUDlOlvSOc3gNXPynQvjTlaN01aabJy9p
	l7Bn0OCZGVCtNRN5mOxmi0XdM6jWYAdblhQlwJ9QWP8WZR0TUDXZkHSMstxgBr8I6RmZBcRIFBp
	cxT+Niw8ADiVKobPVbQuCRZ4ZkUVRaONb7p5RojucufCT31jBSfr8YLWRueYqdqKhEVh4uYRE+O
	T6COdIlMjXpGdFseIQxUDXohyXdfqVPyFXn1q+e+ZE6kaktAbOT/lsMK7Idimd//aFwDmFuERc3
	wo6Fl1Nwby6OKNDHeX7hXDklTWPZQE8Cen1aiuhBEgNBx2E1Wp3MCV02/ZYfbowMt6wzZMqJW93
	kAunp35i02klmrThHDPFPeRUoIQfrzXFjpmr2h7wJNQvFQJNbFX69Mj4HC7sU9uN1
X-Google-Smtp-Source: AGHT+IF8wII5eWZgQBadnO5DQfaiFS5/z1JMcEs8d28tEnWe/M9RrAxpKwKDZsxBK/TMzbXJ9H2a6w==
X-Received: by 2002:a05:620a:46a5:b0:7e6:81cc:6999 with SMTP id af79cd13be357-7fed6bab7f7mr818725185a.32.1756720535666;
        Mon, 01 Sep 2025 02:55:35 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc1654744csm641029085a.70.2025.09.01.02.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 02:55:35 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7e86faa158fso433481385a.1;
        Mon, 01 Sep 2025 02:55:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXw615kq5XrGvYFkU1BLhtLw4rGwyHzEv7Z2H3SDkwpe43pjhT1RoyPC+thz/DSHqKsfDStgLYH15WArsUpisQZhM=@vger.kernel.org, AJvYcCV5VrtR3uT/x1JzzMIDprdcFs+obhmjjUdj3elf9JcRU1W183Gqu5gkFqUcQqUC/6SAZb62InEUgIgvoQ==@vger.kernel.org, AJvYcCVoIuidq2GYFe0raAPkO6C3zClF02UgpIj/4qPAeZS3K9JKMq9b0JnjQlIXXPQfPYZFS2sjjo+6k3kgG+CEdg==@vger.kernel.org, AJvYcCWF3dvjLB2rAkX28vi0foTXvMYvCBz+56BvqDHySa5EchIKDcjFC3bAy8eX1QwFOZijNt4/KBwMsuKa6a1O@vger.kernel.org, AJvYcCWIYremoaJEEbaaotkhJhxiTdgpTdsfQ33n6yRqVwUsh0i3FKKrW1RblL2LBZxVVQt8j2u+FzfnFw==@vger.kernel.org, AJvYcCWM62SW2FvpqbErLI00vjtChxU5iFI+2NeKrUPoWU/RhLuSS/zraz7DTci1AN6hGUabgfl1V+XycdKZ@vger.kernel.org, AJvYcCWxlejoKbpjStSOSvBW076S1QroRHDeTDl5sWwhSR+Goz3va+z4XuPlHcF2HZUzASRDPGH+4QErwLfbyx40rRchMdg=@vger.kernel.org
X-Received: by 2002:a05:6102:5e8e:b0:50d:feb0:316e with SMTP id
 ada2fe7eead31-52aeb7798e1mr2104974137.2.1756720196368; Mon, 01 Sep 2025
 02:49:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <1907e1c7-2b15-4729-8497-a7e6f0526366@kernel.org> <aKhVVJPEPxCoKKjI@x1>
 <4d31df9e-62c9-4988-9301-2911ff7de229@kernel.org> <aKhr8NYhei59At0s@x1> <7c6cc42c-fc76-4300-b0d2-8dabf54cf337@kernel.org>
In-Reply-To: <7c6cc42c-fc76-4300-b0d2-8dabf54cf337@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 11:49:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUB4QGBaMk5r5eNRCPriUWAY+LBE2C7kVEkE9eCNE1TUA@mail.gmail.com>
X-Gm-Features: Ac12FXwQn8nZWuX__OUteos14KQ8Ceq7TOY9AfEwCR3rwgzCn6YxJiejdZ6ywp8
Message-ID: <CAMuHMdUB4QGBaMk5r5eNRCPriUWAY+LBE2C7kVEkE9eCNE1TUA@mail.gmail.com>
Subject: Re: [PATCH 000/114] clk: convert drivers from deprecated round_rate()
 to determine_rate()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
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
	Andrea della Porta <andrea.porta@suse.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
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

On Sat, 23 Aug 2025 at 18:43, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 22/08/2025 15:09, Brian Masney wrote:
> > On Fri, Aug 22, 2025 at 02:23:50PM +0200, Krzysztof Kozlowski wrote:
> >> On 22/08/2025 13:32, Brian Masney wrote:
> >>> 7 of the 114 patches in this series needs a v2 with a minor fix. I see
> >>> several paths forward to merging this. It's ultimately up to Stephen how
> >>> he wants to proceed.
> >>>
> >>> - I send Stephen a PULL request with all of these patches with the minor
> >>>   cleanups to the 7 patches. Depending on the timing, Stephen can merge
> >>>   the other work first, and I deal with cleaning up the merge conflicts.
> >>>   Or he can if he prefers to instead.
> >>>
> >>> - Stephen applies everyone else's work first to his tree, and then the
> >>>   good 107 patches in this series. He skips anything that doesn't apply
> >>>   due to other people's work and I follow up with a smaller series.
> >>
> >> Both cause cross tree merge conflicts. Anyway, please document clearly
> >> the dependencies between patches.
> >
> > This series only touches drivers/clk, so it shouldn't cause any issues
> > with other subsystems, unless there's a topic branch somewhere, or I'm
> > missing something?
>
> Individual maintainers handle subdirectories.

FWI(still)W, I have taken the Renesas SoC-specific patches through
the renesas-clk tree...

> > There are some drivers under drivers/clk/ where there is an entry in the
> > MAINTAINERS file that's not Stephen, although it wasn't clear to me if
> > all of those people will send PULL requests to Stephen. I described on
> > the cover how how the series was broken up.
> >
> >   - Patches 4-70 are for drivers where there is no clk submaintainer
> >   - Patches 71-110 are for drivers where this is an entry in MAINTAINERS
> >     (for drivers/clk)
>
> It's hidden between multiple other descriptions of patches, so I really
> would not think that this means that it is okay by individual maintainer
> to take the patch.
>
> This really should be the one most important part of the cover letter
> for something like this.
> ..

It was indeed rather implicit:

   "Once all of my conversion patches across the various trees in the kernel
    have been merged, I will post a small series that removes the
    round_rate() op from the clk core and the documentation. Here's the
    other patch series that are currently in flight that need to be merged
    before we can remove round_rate() from the core. [...]"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

