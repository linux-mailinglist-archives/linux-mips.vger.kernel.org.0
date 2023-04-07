Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0386E6DA9CC
	for <lists+linux-mips@lfdr.de>; Fri,  7 Apr 2023 10:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239782AbjDGIL2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 04:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239610AbjDGILM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 04:11:12 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DEBA5DC;
        Fri,  7 Apr 2023 01:11:01 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id D70776000C;
        Fri,  7 Apr 2023 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1680855059;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k62lE0Z84brwUbN0RTewMQPHSeeiOVUlnJEgkCzQsvo=;
        b=R9CLiy5G5LdE9BO36N204fuspyAxiiF7TmcabLrbwrQPeoEl5Pn0pcw2pa9LFURAj+yhqS
        Ku6ulo+yoPDqo0ywa6hZxIhfMa2hfrKY6oIoCe+v26HM6BlIqcgn8p8u0WJDFU+gYVyAOT
        iWOVTokLobBTMlDhc5L2oqSRq3pJIdqQ+s5IqSFwu1iEWL1rH1J0xX63ZpwsrUgxYtF5VC
        JMA7zniKULdwaW97f/g6p4Ec2AzETlg0EBYuF+OIU67+xs5aqnBUa8bo0FWsfGskdfArda
        sO7wxwa4nSLUU/oHmfv/0zUTbea+upPaTGkKYKQ1Sq0BSBr1Ah5yUIuIzPRbHA==
Date:   Fri, 7 Apr 2023 10:10:43 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Valentin Korenblit <vkorenblit@sequans.com>,
        Wang Weiyang <wangweiyang2@huawei.com>,
        Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
        Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
        Han Xu <han.xu@nxp.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chuanhong Guo <gch981213@gmail.com>,
        Roger Quadros <rogerq@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Miaoqian Lin <linmq006@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Kerello <christophe.kerello@foss.st.com>,
        Jack Wang <jinpu.wang@ionos.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Richard Weinberger <richard@nod.at>,
        linux-mtd@lists.infradead.org, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org, linux-oxnas@groups.io,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/49] mtd: nand: Convert to platform remove callback
 returning void
Message-ID: <20230407101043.299f5e22@xps-13>
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Uwe,

u.kleine-koenig@pengutronix.de wrote on Sat,  1 Apr 2023 18:18:49 +0200:

> Hello,
>=20
> this series adapts the platform drivers below drivers/mtd/nand to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver c=
ore
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warnin=
g. The
> device is removed anyhow and an early return from .remove() usually yield=
s a
> resource leak.
>=20
> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
>=20
> As all drivers already return 0 in their .remove callback, they can be
> converted trivially.

I've looked at the different patches, they look good to me but as they
are all trivial and exactly identical, would you mind sending this
again all squashed in a single patch? A subsystem-wide conversion seems
appropriate. In all cases I plan to take this for the next merge
window.

I've collected the tags received so far if you want:

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com> # atmel
Reviewed-by: Paul Cercueil <paul@crapouillou.net> # ingenic
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> # ingenic
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> # intel
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> # mes=
on
Acked-by: Roger Quadros <rogerq@kernel.org> # omap
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
Reviewed-by: Heiko Stuebner <heiko@sntech.de> # rockchip
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com> # sunxi
Acked-by: Thierry Reding <treding@nvidia.com> # tegra

BTW, thanks to all of you who reviewed and answered to this thread!
This is highly appreciated.=20

Thanks,
Miqu=C3=A8l
