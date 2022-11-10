Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 757D5624199
	for <lists+linux-mips@lfdr.de>; Thu, 10 Nov 2022 12:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbiKJLkF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Nov 2022 06:40:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbiKJLkB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Nov 2022 06:40:01 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA0F71F13
        for <linux-mips@vger.kernel.org>; Thu, 10 Nov 2022 03:39:59 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id v17so2627561edc.8
        for <linux-mips@vger.kernel.org>; Thu, 10 Nov 2022 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ck1BFgYQUoxfjthSY0Z/ICMvhRDs51HkE0D/E51e4wU=;
        b=cLoqN/9Hw4WN89uoDoxpq9Ce/Ps341RBpybWaA/Ttn7dX0XjEZSpQMeE/cLupilSy+
         h9M/AwRJwi+wD3lcUZtgCbl5J3Y1/4+a+UG987xrzyBKVQSsdTGx1Fm9p56BVwQCgeqw
         ImbNP+V0cuLG09qZBqDEVWEBH4JmnDYapBzy20rI0QOEnuyEvU41wtqwWtHQ/Ku+SIq6
         z/iAwWeg98cPs684u3jM1bZkrHRFlxBeM553WE2HZydhyBqAswoiUSyHfbMc8MScHPVp
         jTxj/0bSYX2PEajd6PNI/IV0ZBru+l7g17Wn1GCvWMrBI6s8qLNSd3U7dwQx3hiin+sp
         LiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ck1BFgYQUoxfjthSY0Z/ICMvhRDs51HkE0D/E51e4wU=;
        b=fMwgEN75DfZRWGm/ZK/BfEqCivjEq2akq28rOaZjmjuUO5b7b8s4l1rdEvwXwrzIeZ
         CR6emZt95ou8Wg7UABbAygb7SOJfVPpNzWwq2y0HccHe9oXArlzDCpeuu0xQd/mOF2ge
         d+85nE9XEeaGh2DpXgf1bx0KP5wwAInj00y0Ry/Hq2YGdo+m7M3u6dRX7M4Dk9rcwKhW
         x8MZJwIlrV569r01NAzUs+XU07aVbE501fuexzI0HduT/wQEablqfP7T9tAhPWVINC8R
         nsGsoGdLiZatVJo8CINrLPymUh5dcrLO/iczzPNReTsPm4w43Y0tq/QIteVGomkpJmxL
         fbIQ==
X-Gm-Message-State: ACrzQf1Mg73QFehfykao0bpC1Zp4xrSBidltKSiiqZM4c44qbLOcpTQV
        Msn2ZtH6feFEVJM26OYoduisrwc4rltjBSeOGxZ2Mw==
X-Google-Smtp-Source: AMsMyM6KPfAGNVILTJIJybxZbWNcNW1j294XPOEkghGZsATADMyuAh5FXMGRYiA9Y0UOLTHKSZCe9zdW3Mb4U369XWo=
X-Received: by 2002:a05:6402:4002:b0:463:bc31:2604 with SMTP id
 d2-20020a056402400200b00463bc312604mr2100488eda.32.1668080397979; Thu, 10 Nov
 2022 03:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech> <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com>
In-Reply-To: <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Nov 2022 12:39:46 +0100
Message-ID: <CACRpkdYOj8uozJZO4MV-_OAKeOsQHhoEM=PyynVuNY-JkpgTOw@mail.gmail.com>
Subject: Re: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Maxime Ripard <maxime@cerno.tech>, Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Takashi Iwai <tiwai@suse.com>,
        David Airlie <airlied@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        David Lechner <david@lechnology.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-stm32@st-md-mailman.stormreply.com,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        patches@opensource.cirrus.com, linux-tegra@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 10, 2022 at 12:29 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Fri, 4 Nov 2022 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
> > hook, but doesn't provide a determine_rate implementation.
> >
> > This is a bit odd, since set_parent() is there to, as its name implies,
> > change the parent of a clock. However, the most likely candidate to
> > trigger that parent change is a call to clk_set_rate(), with
> > determine_rate() figuring out which parent is the best suited for a
> > given rate.
> >
> > The other trigger would be a call to clk_set_parent(), but it's far less
> > used, and it doesn't look like there's any obvious user for that clock.
>
> If I recall correctly, that is the use case we did target for these
> types of clocks. See sound/soc/ux500/ux500_ab85xx.c, for example.

Hm I am trying to get that driver to work ... from time to time.
It's just that ALSA SoC DT has changed to much that it turns out
into a complete rewrite :/

So in sound/soc/ux500/mop500_ab8500.c
I see this:

        status = clk_set_parent(drvdata->clk_ptr_intclk, clk_ptr);
        if (status)
(...)

and there is elaborate code to switch between "SYSCLK" and
"ULPCLK" (ulta-low power clock). Just like you say... however
a clock named SYSCLK or ULPCLK does not appear in the
code in drivers/clk/ux500 or any DT bindings so... it seems to
be non-working for the time being.

Yours,
Linus Walleij
