Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA52C6DDC6D
	for <lists+linux-mips@lfdr.de>; Tue, 11 Apr 2023 15:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbjDKNnU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Apr 2023 09:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjDKNnT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Apr 2023 09:43:19 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737CCBB;
        Tue, 11 Apr 2023 06:43:17 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 9447D60012;
        Tue, 11 Apr 2023 13:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1681220595;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YG/a/d5U809a62Azy9i6h0lXlFjsDlTWJ9pqm8OP5bU=;
        b=hHX8UiCAZtL5szZpK25h+QcFJybRGblg1lJQbRfyMx4JhQP74URDH1PKlY0KtXD3u0AO2m
        +ojA1YL+HugJT1SJVxxR1NYpviqZqbbpow2rLTyNqPi0WoFB5rz7YxXiVuAr4g5gmsiyxL
        8xeH9vyYgmP34C7BrjUOpRtzFxvVV8P2UmIaJD4/UQDa583WTuDsx7Ds98idmyBl2HFpp3
        zvTwQvoQEzuSkPafSJjtVuXbFV4hd7FtG06jKqZ6fcBnTEJrP4zP/9kNobxXCtGcqWgOlE
        Ef+hIJk5W9JQ94A7C/XGwiY1NyrQCIQ80fZuj6vDKRBjxmLd8EqRkNBiqztvTA==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>
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
        =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
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
        linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
        kernel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3] mtd: nand: Convert to platform remove callback returning void
Date:   Tue, 11 Apr 2023 15:43:04 +0200
Message-Id: <20230411134305.445759-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411113816.3472237-1-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ec185b18c22323cb0cde0319fa90b3e467b1ed2d'
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 2023-04-11 at 11:38:16 UTC, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com> # atmel
> Reviewed-by: Paul Cercueil <paul@crapouillou.net> # ingenic
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org> # ingenic
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> # intel
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> # meson
> Acked-by: Roger Quadros <rogerq@kernel.org> # omap_elm
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> Reviewed-by: Heiko Stuebner <heiko@sntech.de> # rockchip
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com> # sunxi
> Acked-by: Thierry Reding <treding@nvidia.com> # tegra
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
