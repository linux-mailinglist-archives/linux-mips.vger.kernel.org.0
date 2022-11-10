Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3C656242D4
	for <lists+linux-mips@lfdr.de>; Thu, 10 Nov 2022 14:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbiKJNF5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Nov 2022 08:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbiKJNFz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Nov 2022 08:05:55 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E5561A388
        for <linux-mips@vger.kernel.org>; Thu, 10 Nov 2022 05:05:54 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso1450961pjc.5
        for <linux-mips@vger.kernel.org>; Thu, 10 Nov 2022 05:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lrV3scjxXBUgyRehk9/on/q8TxNDq8MdTdotV2WeMBQ=;
        b=GVZ09h+ngHWOecbTC/uzghXW93HVi79Hc3aHUMBuHut0K+MRP4qjrmbxOsy9wAvyhh
         CzAf4wAUsz2LX8ScnTSnBYBlU0zD4SfZXHjTGLx4odMNe2HTZmWoc8/O0MjERSTJDuKQ
         9UeL9YNFV2iAuj4M769TxWHJzx0wEKM1UD/fL8Quarzgi8/jAHx03TmKPyEcNniVs1JP
         E1bQ9YyT5yBnS4K6hTH0QDyjNMb9vjtJqKa6/m2IeBhMmf0jPp66hTlfQCyxBUHnorSo
         4QxzB8BVVnzEGtFh63S81NhnvCx7MGrBaQEPEUdQo8KV1MCY/puvxsLONjSQ8GgFephe
         xQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrV3scjxXBUgyRehk9/on/q8TxNDq8MdTdotV2WeMBQ=;
        b=CqrAi2GCbs0XMyNfxenggdUsQhnX/BdRVbO71mN7irhjYSJOf2kg8YchUhRPtwP16i
         BZ+KDNLTgGwV4xRUi1hbTqY6FSLr2antNukPTnksUDQlbMcKMvLlC1Q0NI0likqaIEkg
         ccv/Nm9L0xub6EXURyepD9qBZL9JlUxSdgjyhAusbrl1TxkBUU+DlwtlE0fjxcJ+H6IB
         E4cNBwWt3qaKIPgDWpDPtHbaxvLsXNRWh+CU5ol4XQhvx1EEHJraqkx4N3Oxbic8JK/c
         o7QIPWmVuy3pR1sQTf/EA6C5IKteeUOJqxBJyAKIYUdhZQET2a7+ynsaS7TnBjG/1+vb
         p0yQ==
X-Gm-Message-State: ACrzQf1vjxnHitj3dv/eQQsplJfW9dYFg8hp5e1MtbGOy/50dZrlCjyr
        Tovf+VJcEibLySvOpI/cXfgd/XMXSeIJg1jop/Bddg==
X-Google-Smtp-Source: AMsMyM4ntafpxKu1kZoVYdCyuwK4y2qgGm0PDcBHChl8r8c0pj7m0JmQ6SHmodBY/Un25AY0R73awNrQX1GtCyrtwGQ=
X-Received: by 2002:a17:903:100c:b0:186:63a1:3b5d with SMTP id
 a12-20020a170903100c00b0018663a13b5dmr65965693plb.148.1668085553525; Thu, 10
 Nov 2022 05:05:53 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
 <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com> <CACRpkdYOj8uozJZO4MV-_OAKeOsQHhoEM=PyynVuNY-JkpgTOw@mail.gmail.com>
In-Reply-To: <CACRpkdYOj8uozJZO4MV-_OAKeOsQHhoEM=PyynVuNY-JkpgTOw@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 10 Nov 2022 14:05:16 +0100
Message-ID: <CAPDyKFr6VeF3s47JfzJ9urtMsEem+GiBtHeU=_S8jNaz-D+qnw@mail.gmail.com>
Subject: Re: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
To:     Linus Walleij <linus.walleij@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 10 Nov 2022 at 12:39, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Nov 10, 2022 at 12:29 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Fri, 4 Nov 2022 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
> > > hook, but doesn't provide a determine_rate implementation.
> > >
> > > This is a bit odd, since set_parent() is there to, as its name implies,
> > > change the parent of a clock. However, the most likely candidate to
> > > trigger that parent change is a call to clk_set_rate(), with
> > > determine_rate() figuring out which parent is the best suited for a
> > > given rate.
> > >
> > > The other trigger would be a call to clk_set_parent(), but it's far less
> > > used, and it doesn't look like there's any obvious user for that clock.
> >
> > If I recall correctly, that is the use case we did target for these
> > types of clocks. See sound/soc/ux500/ux500_ab85xx.c, for example.
>
> Hm I am trying to get that driver to work ... from time to time.
> It's just that ALSA SoC DT has changed to much that it turns out
> into a complete rewrite :/
>
> So in sound/soc/ux500/mop500_ab8500.c
> I see this:
>
>         status = clk_set_parent(drvdata->clk_ptr_intclk, clk_ptr);
>         if (status)
> (...)
>
> and there is elaborate code to switch between "SYSCLK" and
> "ULPCLK" (ulta-low power clock). Just like you say... however
> a clock named SYSCLK or ULPCLK does not appear in the
> code in drivers/clk/ux500 or any DT bindings so... it seems to
> be non-working for the time being.

It's definitely not working, but the corresponding clocks ("ulpclk",
"intclk", "audioclk", etc) are being registered in ab8500_reg_clks().

What seems to be missing is a DT conversion for these clocks, so they
can be consumed properly. Right?

Kind regards
Uffe
