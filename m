Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 269606D3295
	for <lists+linux-mips@lfdr.de>; Sat,  1 Apr 2023 18:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjDAQVO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Apr 2023 12:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjDAQVM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Apr 2023 12:21:12 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B6742D5E
        for <linux-mips@vger.kernel.org>; Sat,  1 Apr 2023 09:21:11 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pidxN-00089G-VF; Sat, 01 Apr 2023 18:19:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pidxD-008GPi-EI; Sat, 01 Apr 2023 18:19:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pidxC-009kf7-7s; Sat, 01 Apr 2023 18:19:46 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
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
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org, linux-oxnas@groups.io,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: [PATCH 00/49] mtd: nand: Convert to platform remove callback returning void
Date:   Sat,  1 Apr 2023 18:18:49 +0200
Message-Id: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7821; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=8nRDgN5CqU2nRF//FRAdHbfY+cIFaqsEtSZQEPh7QiU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFjvp7868qd0VsHN6SrxaEO8NTL3D3fmpZjg3 cwKJmJerMqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChY7wAKCRCPgPtYfRL+ TmkoB/9SLYo/ZDac4CvKk1I5MwZ2nAQBqeUpre7ZKONouC+Gkder1fO1RUM4NlhPPEffEi+2yVj hvcHL7KB5t8UeLrH1vE4Nfi5/3wVAmPww7pWHCPy5AF29t7fgt3U/IYs9QHSysdj+FA73SP/62S ZWdZgdVuVhqYvfPh2RsBg7QJYkAjbhmhA3ZY080V2LH7EpMW6GwOSdQ0OEZ6da9H82tbY9Uz4zk Rb5KLVyrwfuT0n3Dw5q7/YmB6D8y15Diqty+SnJAGLqjGgKNbPUxVOuBDgnXJHcMdA2etpWvgh/ zGMY8LDnJKc/tIuA8o341utDrcxym5uDPWg81ONd0MsBvTHu
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

this series adapts the platform drivers below drivers/mtd/nand to use the
.remove_new() callback. Compared to the traditional .remove() callback
.remove_new() returns no value. This is a good thing because the driver core
doesn't (and cannot) cope for errors during remove. The only effect of a
non-zero return value in .remove() is that the driver core emits a warning. The
device is removed anyhow and an early return from .remove() usually yields a
resource leak.

By changing the remove callback to return void driver authors cannot
reasonably assume any more that there is some kind of cleanup later.

As all drivers already return 0 in their .remove callback, they can be
converted trivially.

Thanks
Uwe

Uwe Kleine-König (49):
  mtd: nand: mxic-ecc: Convert to platform remove callback returning
    void
  mtd: onenand: generic: Convert to platform remove callback returning
    void
  mtd: onenand: omap2: Convert to platform remove callback returning
    void
  mtd: onenand: samsung: Convert to platform remove callback returning
    void
  mtd: rawnand: ams-delta: Convert to platform remove callback returning
    void
  mtd: rawnand: arasan: Convert to platform remove callback returning
    void
  mtd: rawnand: atmel: Convert to platform remove callback returning
    void
  mtd: rawnand: au1550nd: Convert to platform remove callback returning
    void
  mtd: rawnand: bcm47xxnflash: Convert to platform remove callback
    returning void
  mtd: rawnand: cadence: Convert to platform remove callback returning
    void
  mtd: rawnand: davinci: Convert to platform remove callback returning
    void
  mtd: rawnand: denali_dt: Convert to platform remove callback returning
    void
  mtd: rawnand: fsl_elbc: Convert to platform remove callback returning
    void
  mtd: rawnand: fsl_ifc: Convert to platform remove callback returning
    void
  mtd: rawnand: fsl_upm: Convert to platform remove callback returning
    void
  mtd: rawnand: fsmc: Convert to platform remove callback returning void
  mtd: rawnand: gpio: Convert to platform remove callback returning void
  mtd: rawnand: gpmi: Convert to platform remove callback returning void
  mtd: rawnand: hisi504: Convert to platform remove callback returning
    void
  mtd: rawnand: ingenic: Convert to platform remove callback returning
    void
  mtd: rawnand: intel: Convert to platform remove callback returning
    void
  mtd: rawnand: lpc32xx_mlc: Convert to platform remove callback
    returning void
  mtd: rawnand: lpc32xx_slc: Convert to platform remove callback
    returning void
  mtd: rawnand: marvell: Convert to platform remove callback returning
    void
  mtd: rawnand: meson: Convert to platform remove callback returning
    void
  mtd: rawnand: mpc5121_nfc: Convert to platform remove callback
    returning void
  mtd: rawnand: mtk: Convert to platform remove callback returning void
  mtd: rawnand: mxc: Convert to platform remove callback returning void
  mtd: rawnand: mxic: Convert to platform remove callback returning void
  mtd: rawnand: ndfc: Convert to platform remove callback returning void
  mtd: rawnand: omap2: Convert to platform remove callback returning
    void
  mtd: rawnand: omap_elm: Convert to platform remove callback returning
    void
  mtd: rawnand: orion: Convert to platform remove callback returning
    void
  mtd: rawnand: oxnas: Convert to platform remove callback returning
    void
  mtd: rawnand: pasemi: Convert to platform remove callback returning
    void
  mtd: rawnand: pl35x: Convert to platform remove callback returning
    void
  mtd: rawnand: plat: Convert to platform remove callback returning void
  mtd: rawnand: qcom: Convert to platform remove callback returning void
  mtd: rawnand: renesas: Convert to platform remove callback returning
    void
  mtd: rawnand: rockchip: Convert to platform remove callback returning
    void
  mtd: rawnand: s3c2410: Convert to platform remove callback returning
    void
  mtd: rawnand: sh_flctl: Convert to platform remove callback returning
    void
  mtd: rawnand: sharpsl: Convert to platform remove callback returning
    void
  mtd: rawnand: socrates: Convert to platform remove callback returning
    void
  mtd: rawnand: stm32_fmc2: Convert to platform remove callback
    returning void
  mtd: rawnand: sunxi: Convert to platform remove callback returning
    void
  mtd: rawnand: tegra: Convert to platform remove callback returning
    void
  mtd: rawnand: vf610_nfc: Convert to platform remove callback returning
    void
  mtd: rawnand: xway: Convert to platform remove callback returning void

 drivers/mtd/nand/ecc-mxic.c                     | 6 ++----
 drivers/mtd/nand/onenand/generic.c              | 6 ++----
 drivers/mtd/nand/onenand/onenand_omap2.c        | 6 ++----
 drivers/mtd/nand/onenand/onenand_samsung.c      | 6 ++----
 drivers/mtd/nand/raw/ams-delta.c                | 6 ++----
 drivers/mtd/nand/raw/arasan-nand-controller.c   | 6 ++----
 drivers/mtd/nand/raw/atmel/nand-controller.c    | 6 ++----
 drivers/mtd/nand/raw/au1550nd.c                 | 5 ++---
 drivers/mtd/nand/raw/bcm47xxnflash/main.c       | 6 ++----
 drivers/mtd/nand/raw/cadence-nand-controller.c  | 6 ++----
 drivers/mtd/nand/raw/davinci_nand.c             | 6 ++----
 drivers/mtd/nand/raw/denali_dt.c                | 6 ++----
 drivers/mtd/nand/raw/fsl_elbc_nand.c            | 6 ++----
 drivers/mtd/nand/raw/fsl_ifc_nand.c             | 6 ++----
 drivers/mtd/nand/raw/fsl_upm.c                  | 6 ++----
 drivers/mtd/nand/raw/fsmc_nand.c                | 6 ++----
 drivers/mtd/nand/raw/gpio.c                     | 6 ++----
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c      | 5 ++---
 drivers/mtd/nand/raw/hisi504_nand.c             | 6 ++----
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 6 ++----
 drivers/mtd/nand/raw/intel-nand-controller.c    | 6 ++----
 drivers/mtd/nand/raw/lpc32xx_mlc.c              | 6 ++----
 drivers/mtd/nand/raw/lpc32xx_slc.c              | 6 ++----
 drivers/mtd/nand/raw/marvell_nand.c             | 6 ++----
 drivers/mtd/nand/raw/meson_nand.c               | 6 ++----
 drivers/mtd/nand/raw/mpc5121_nfc.c              | 6 ++----
 drivers/mtd/nand/raw/mtk_nand.c                 | 6 ++----
 drivers/mtd/nand/raw/mxc_nand.c                 | 6 ++----
 drivers/mtd/nand/raw/mxic_nand.c                | 5 ++---
 drivers/mtd/nand/raw/ndfc.c                     | 6 ++----
 drivers/mtd/nand/raw/omap2.c                    | 5 ++---
 drivers/mtd/nand/raw/omap_elm.c                 | 5 ++---
 drivers/mtd/nand/raw/orion_nand.c               | 6 ++----
 drivers/mtd/nand/raw/oxnas_nand.c               | 6 ++----
 drivers/mtd/nand/raw/pasemi_nand.c              | 6 ++----
 drivers/mtd/nand/raw/pl35x-nand-controller.c    | 6 ++----
 drivers/mtd/nand/raw/plat_nand.c                | 6 ++----
 drivers/mtd/nand/raw/qcom_nandc.c               | 6 ++----
 drivers/mtd/nand/raw/renesas-nand-controller.c  | 6 ++----
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 6 ++----
 drivers/mtd/nand/raw/s3c2410.c                  | 8 +++-----
 drivers/mtd/nand/raw/sh_flctl.c                 | 6 ++----
 drivers/mtd/nand/raw/sharpsl.c                  | 6 ++----
 drivers/mtd/nand/raw/socrates_nand.c            | 6 ++----
 drivers/mtd/nand/raw/stm32_fmc2_nand.c          | 6 ++----
 drivers/mtd/nand/raw/sunxi_nand.c               | 6 ++----
 drivers/mtd/nand/raw/tegra_nand.c               | 6 ++----
 drivers/mtd/nand/raw/vf610_nfc.c                | 5 ++---
 drivers/mtd/nand/raw/xway_nand.c                | 6 ++----
 49 files changed, 99 insertions(+), 191 deletions(-)

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

