Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1753641FE3
	for <lists+linux-mips@lfdr.de>; Sun,  4 Dec 2022 22:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiLDVcA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 4 Dec 2022 16:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbiLDVb4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 4 Dec 2022 16:31:56 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42A313E28
        for <linux-mips@vger.kernel.org>; Sun,  4 Dec 2022 13:31:52 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id n184so12089863yba.6
        for <linux-mips@vger.kernel.org>; Sun, 04 Dec 2022 13:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lI01SEvVv3MktbLdSo/+mTT0yrIOdj+1vIgFJfDfN34=;
        b=ihXgyprU2JPflAJxQ2hlVAlQWQi84KLxjubvaMjwbXraHSizz8TCIx4U240bsQyj7+
         f4S620hisnyPfhiCwKcejyelzlojnRQY4jMp9A5DZ+yb6q2aq4EA73+dpm0+UL0Oxh1a
         IYwnyg3VzbGB2nq4bXM6+FsV3LOGBHWgjtL25AWN7IG9Q1azGQhN55hwsfFxbGLKWiOD
         f/a/T7Q/HJsAQI/owlcuy6xGaGqVr+p5wZVckWegEIRl5Ivc5Qji4Sl+FvX4zG7kVyuj
         +sXdCe5JgrGyvJk71T09UvTiajH6J8eboYF7zb6jD/uuzxRFmOa9C/7E2gTQahmgh7lS
         cwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lI01SEvVv3MktbLdSo/+mTT0yrIOdj+1vIgFJfDfN34=;
        b=3EMRP/B9m4NhM0SfLKbTfgUpO/TFUQxbuxLO3L5BOehYIO5oqYncDfmr39crRUvxEc
         pBlWFKJW0JbEInHyWoq38ZFhR+CQwV0ZJJsycno+Iip1pnajSeXsoVYL7rWVU/i0c59c
         o4yRzRTHTJw1wP/sk/2MCUMw3JvRrA8IuJbvWOzR4sytx4pSEa1XwjhNzBzNKZp7dNA8
         IYgv4FMz1CP+CIMJGUg7z0BFpNco62tb91kiD5HUTLEvF2ljUurHGJUk3qWL7fNcQq7V
         oZBAlk/dgkGcn1w5da2GrULIWCuK/rBdLH1OJ8tR27y79HqOR48p4sniZw/xRCKR3CPI
         5DEg==
X-Gm-Message-State: ANoB5pmZZPhg2sEC8P9RNPTTa63eKXN52ge7cLn8goElM8G6/1Yzs/lx
        IaoTV5XXvb1DJ5ZtafLeN4OQd/+iZfLFOQS4P5Y3MA==
X-Google-Smtp-Source: AA0mqf6AghRoYoTD/xrAAjTRoEs/YU038ITJkX/3Vhiv+Ox9xXlJbEIBdnkIbFDPiPE2mKag2EXwUYp2ImAROIxTvOc=
X-Received: by 2002:a25:c485:0:b0:6be:8e8d:639f with SMTP id
 u127-20020a25c485000000b006be8e8d639fmr72141889ybf.506.1670189512119; Sun, 04
 Dec 2022 13:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20221130141040.32447-1-arinc.unal@arinc9.com> <20221130141040.32447-3-arinc.unal@arinc9.com>
In-Reply-To: <20221130141040.32447-3-arinc.unal@arinc9.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 4 Dec 2022 22:31:40 +0100
Message-ID: <CACRpkdbojTVjR2G+95YS1Xqvau9XmwTkp_KtpaeE7-+v41hgeg@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm: dts: remove label = "cpu" from DSA dt-binding
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc:     Vladimir Oltean <vladimir.oltean@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        soc@kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Stefan Agner <stefan@agner.ch>,
        Heiko Stuebner <heiko@sntech.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Tim Harvey <tharvey@gateworks.com>,
        Peng Fan <peng.fan@nxp.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Frank Wunderlich <frank-w@public-files.de>,
        Michael Riesch <michael.riesch@wolfvision.net>,
        Oleksij Rempel <linux@rempel-privat.de>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Nov 30, 2022 at 3:13 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:

> This is not used by the DSA dt-binding, so remove it from all devicetrees=
.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
