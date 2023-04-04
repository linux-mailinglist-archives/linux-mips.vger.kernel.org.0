Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE3E46D63A4
	for <lists+linux-mips@lfdr.de>; Tue,  4 Apr 2023 15:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234708AbjDDNpL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Apr 2023 09:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235441AbjDDNo5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Apr 2023 09:44:57 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAAF04C0A
        for <linux-mips@vger.kernel.org>; Tue,  4 Apr 2023 06:44:37 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id f188so20252346ybb.3
        for <linux-mips@vger.kernel.org>; Tue, 04 Apr 2023 06:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680615877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXtgBK14KPM4e26uH259a5f8IZMJzPMN2I/MMharuS0=;
        b=YoKEFBnF4R/KLVFNoyxiZPhJmsqA79Ywp7c5w9VoTLbxOHPkU2UC3C6r9llU7auOt2
         itjfCCAlEVj9pzFONUJdlZR26DS+6eTnTItG8/BdsRaJG+jnGN8Mar9S9nT8YJ6YbIvt
         PczIEgFKHpzSiJdwEFeV5bQ6D7RX1kxyHOzWUeUHZxaA2y7tu1cxjyIo01gmk0ySlvUZ
         2ItBXfsRfASPgjZS7NTX/6Gf1VUStSpHFkFEFZGlN6IDFrz+MYZjApX3UW6qF8oUnIFx
         zKX/hy1RXkULjEErSDvMl/vL0BBq9FAoK0R7e10J9U08+BUnKq4oXitONkTYlPsXrglz
         sC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680615877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXtgBK14KPM4e26uH259a5f8IZMJzPMN2I/MMharuS0=;
        b=LUuoEgLEwqbS8kZ6JU2fzbDQT0MAkaeHPY2r9NW0iVDVHZEgWix9lTViY8hDvFX6qp
         /9AFH6OxYkfIM4EGCdiEhx3kvtXN6VG6C+1uAukw4JLi55sCWlXvx6/kIRmU8rQhgjWj
         V2iklGfs2f9+DiLiACCGosWxvo57qA6S57B9/gmsL5YAzdkhx++6C0T0PwtSc+UELS6K
         5CxPBpYtLD5AxExOs7F1CdOAhnl3KJC2liDjpI6q3YBUr8BU35OXTOzOJhOOgu72sk+q
         6oprlIiCNV/9bMpg2uE6eemdpL0mVed/EgJVilNk7jrJ8cuif2x5KkV+mvHz22fK/rl5
         eeUg==
X-Gm-Message-State: AAQBX9cZZvoSYSv78Jy2d66WxRYPbGwYe+FEI9WAQakbDyKDPStgs0qN
        gNK83NS7E09MvuqYP5M7zm5jA2QEIyxdpngccFGvBA==
X-Google-Smtp-Source: AKy350ZS+8XVi9C6uhFr1kyc6XrkkRM+FluRwKkVz9PMLEz3Sm01NQlNpsxUuoJH/tcqHDQrLl5d34Nf5Z8uV0fle0E=
X-Received: by 2002:a25:df10:0:b0:b75:8ac3:d5d2 with SMTP id
 w16-20020a25df10000000b00b758ac3d5d2mr1901844ybg.4.1680615876928; Tue, 04 Apr
 2023 06:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech> <20221018-clk-range-checks-fixes-v3-34-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-34-9a1358472d52@cerno.tech>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Apr 2023 15:44:25 +0200
Message-ID: <CACRpkdYcHaUBG1qFVb=mi40SyEp=VyYzPmxNn-Zrmpqs1QH+kQ@mail.gmail.com>
Subject: Re: [PATCH v3 34/65] clk: ux500: prcmu: Add a determine_rate hook
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, patches@opensource.cirrus.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        alsa-devel@alsa-project.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 4, 2023 at 2:45=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> wr=
ote:

> The UX500 PRCMU "clkout" clock implements a mux with a set_parent hook,
> but doesn't provide a determine_rate implementation.
>
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.

Not even that.

The parent is selected from the second cell of the device tree
specifier, and the divisor from the third cell. See:
Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml

So this definitely does not reparent.

Yours,
Linus Walleij
