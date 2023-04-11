Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C76CE6DD98B
	for <lists+linux-mips@lfdr.de>; Tue, 11 Apr 2023 13:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbjDKLkB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Apr 2023 07:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjDKLkB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Apr 2023 07:40:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 673713C28
        for <linux-mips@vger.kernel.org>; Tue, 11 Apr 2023 04:39:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pmCKY-0007yI-JG; Tue, 11 Apr 2023 13:38:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pmCKO-00AUWs-8t; Tue, 11 Apr 2023 13:38:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pmCKN-00CHd1-32; Tue, 11 Apr 2023 13:38:23 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
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
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
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
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v3] mtd: nand: Convert to platform remove callback returning void
Date:   Tue, 11 Apr 2023 13:38:16 +0200
Message-Id: <20230411113816.3472237-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=55417; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=hneQY0CU6ts0ZFlNpdO0y0Yn4R9YUUpBhkhvYpQaELQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkNUanmCLcXvLzqVUi1cn7LRrEcM1Gd6YE7/uLC 1CZNF81RL+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZDVGpwAKCRCPgPtYfRL+ TkIBB/40v26wgPB+D833Lg4kV+INueZcQzYBmDkC3LbHI8xdL6FRnFAOozXKwSgfQ7B+txHnwk+ ByONk16Y+cbez5fHiBkzv3Zx1QSmMlhUY0v2lYT+XltXwXLI2bjY+bzZxd2TeTi3eHnX1NW1fku cFxjLcQpTvvPXeOpFep2DjsVT/1sqYWNoFGGIYBgYwGQwnCkapRQWnbQOZkwQz9RT0Gsid+wS3d X6C5X0kS4Bu1uBs3BBP4eaGVEm0VCQoWYYFOAkg1pcoHRNA0TZUfBa9/R7+jcvqWOtoHaKIej7H CUXRmeImutg7ybDGxXDDW0bnYDqDixVNI5yUMy+j2VqzYvz6
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

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com> # atmel
Reviewed-by: Paul Cercueil <paul@crapouillou.net> # ingenic
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org> # ingenic
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> # intel
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> # meson
Acked-by: Roger Quadros <rogerq@kernel.org> # omap_elm
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
Reviewed-by: Heiko Stuebner <heiko@sntech.de> # rockchip
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com> # sunxi
Acked-by: Thierry Reding <treding@nvidia.com> # tegra
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

I called this v3 even though the earlier submission wasn't explicitly
called v2 (or v1). There are no code changes between these revisions, v1
was split into one patch per driver, v2 was the series squashed into one
patch, this v3 is the same as v2, just with Tudor's Ack and the acks
given for the individual drivers marked with the corresponding driver.

Best regards
Uwe

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

diff --git a/drivers/mtd/nand/ecc-mxic.c b/drivers/mtd/nand/ecc-mxic.c
index 8afdca731b87..915aadd1a170 100644
--- a/drivers/mtd/nand/ecc-mxic.c
+++ b/drivers/mtd/nand/ecc-mxic.c
@@ -847,13 +847,11 @@ static int mxic_ecc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mxic_ecc_remove(struct platform_device *pdev)
+static void mxic_ecc_remove(struct platform_device *pdev)
 {
 	struct mxic_ecc_engine *mxic = platform_get_drvdata(pdev);
 
 	nand_ecc_unregister_on_host_hw_engine(&mxic->external_engine);
-
-	return 0;
 }
 
 static const struct of_device_id mxic_ecc_of_ids[] = {
@@ -870,7 +868,7 @@ static struct platform_driver mxic_ecc_driver = {
 		.of_match_table = mxic_ecc_of_ids,
 	},
 	.probe = mxic_ecc_probe,
-	.remove	= mxic_ecc_remove,
+	.remove_new = mxic_ecc_remove,
 };
 module_platform_driver(mxic_ecc_driver);
 
diff --git a/drivers/mtd/nand/onenand/generic.c b/drivers/mtd/nand/onenand/generic.c
index a4b8b65fe15f..4e7de48f07a6 100644
--- a/drivers/mtd/nand/onenand/generic.c
+++ b/drivers/mtd/nand/onenand/generic.c
@@ -85,7 +85,7 @@ static int generic_onenand_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int generic_onenand_remove(struct platform_device *pdev)
+static void generic_onenand_remove(struct platform_device *pdev)
 {
 	struct onenand_info *info = platform_get_drvdata(pdev);
 	struct resource *res = pdev->resource;
@@ -97,8 +97,6 @@ static int generic_onenand_remove(struct platform_device *pdev)
 		iounmap(info->onenand.base);
 		kfree(info);
 	}
-
-	return 0;
 }
 
 static struct platform_driver generic_onenand_driver = {
@@ -106,7 +104,7 @@ static struct platform_driver generic_onenand_driver = {
 		.name		= DRIVER_NAME,
 	},
 	.probe		= generic_onenand_probe,
-	.remove		= generic_onenand_remove,
+	.remove_new	= generic_onenand_remove,
 };
 
 module_platform_driver(generic_onenand_driver);
diff --git a/drivers/mtd/nand/onenand/onenand_omap2.c b/drivers/mtd/nand/onenand/onenand_omap2.c
index 12825eb97938..ff7af98604df 100644
--- a/drivers/mtd/nand/onenand/onenand_omap2.c
+++ b/drivers/mtd/nand/onenand/onenand_omap2.c
@@ -581,7 +581,7 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int omap2_onenand_remove(struct platform_device *pdev)
+static void omap2_onenand_remove(struct platform_device *pdev)
 {
 	struct omap2_onenand *c = dev_get_drvdata(&pdev->dev);
 
@@ -589,8 +589,6 @@ static int omap2_onenand_remove(struct platform_device *pdev)
 	if (c->dma_chan)
 		dma_release_channel(c->dma_chan);
 	omap2_onenand_shutdown(pdev);
-
-	return 0;
 }
 
 static const struct of_device_id omap2_onenand_id_table[] = {
@@ -601,7 +599,7 @@ MODULE_DEVICE_TABLE(of, omap2_onenand_id_table);
 
 static struct platform_driver omap2_onenand_driver = {
 	.probe		= omap2_onenand_probe,
-	.remove		= omap2_onenand_remove,
+	.remove_new	= omap2_onenand_remove,
 	.shutdown	= omap2_onenand_shutdown,
 	.driver		= {
 		.name	= DRIVER_NAME,
diff --git a/drivers/mtd/nand/onenand/onenand_samsung.c b/drivers/mtd/nand/onenand/onenand_samsung.c
index b64895573515..92151aa52964 100644
--- a/drivers/mtd/nand/onenand/onenand_samsung.c
+++ b/drivers/mtd/nand/onenand/onenand_samsung.c
@@ -943,13 +943,11 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int s3c_onenand_remove(struct platform_device *pdev)
+static void s3c_onenand_remove(struct platform_device *pdev)
 {
 	struct mtd_info *mtd = platform_get_drvdata(pdev);
 
 	onenand_release(mtd);
-
-	return 0;
 }
 
 static int s3c_pm_ops_suspend(struct device *dev)
@@ -996,7 +994,7 @@ static struct platform_driver s3c_onenand_driver = {
 	},
 	.id_table	= s3c_onenand_driver_ids,
 	.probe          = s3c_onenand_probe,
-	.remove         = s3c_onenand_remove,
+	.remove_new     = s3c_onenand_remove,
 };
 
 module_platform_driver(s3c_onenand_driver);
diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 13de39aa3288..fa621ffa6490 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -397,7 +397,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 /*
  * Clean up routine
  */
-static int gpio_nand_remove(struct platform_device *pdev)
+static void gpio_nand_remove(struct platform_device *pdev)
 {
 	struct gpio_nand *priv = platform_get_drvdata(pdev);
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
@@ -410,8 +410,6 @@ static int gpio_nand_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
 	nand_cleanup(mtd_to_nand(mtd));
-
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -434,7 +432,7 @@ MODULE_DEVICE_TABLE(platform, gpio_nand_plat_id_table);
 
 static struct platform_driver gpio_nand_driver = {
 	.probe		= gpio_nand_probe,
-	.remove		= gpio_nand_remove,
+	.remove_new	= gpio_nand_remove,
 	.id_table	= gpio_nand_plat_id_table,
 	.driver		= {
 		.name	= "ams-delta-nand",
diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index ec7e6eeac55f..d513d2db3549 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1496,7 +1496,7 @@ static int anfc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int anfc_remove(struct platform_device *pdev)
+static void anfc_remove(struct platform_device *pdev)
 {
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
 
@@ -1504,8 +1504,6 @@ static int anfc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(nfc->bus_clk);
 	clk_disable_unprepare(nfc->controller_clk);
-
-	return 0;
 }
 
 static const struct of_device_id anfc_ids[] = {
@@ -1525,7 +1523,7 @@ static struct platform_driver anfc_driver = {
 		.of_match_table = anfc_ids,
 	},
 	.probe = anfc_probe,
-	.remove = anfc_remove,
+	.remove_new = anfc_remove,
 };
 module_platform_driver(anfc_driver);
 
diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 41c6bd6e2d72..81e3d682a8cd 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -2626,13 +2626,11 @@ static int atmel_nand_controller_probe(struct platform_device *pdev)
 	return caps->ops->probe(pdev, caps);
 }
 
-static int atmel_nand_controller_remove(struct platform_device *pdev)
+static void atmel_nand_controller_remove(struct platform_device *pdev)
 {
 	struct atmel_nand_controller *nc = platform_get_drvdata(pdev);
 
 	WARN_ON(nc->caps->ops->remove(nc));
-
-	return 0;
 }
 
 static __maybe_unused int atmel_nand_controller_resume(struct device *dev)
@@ -2663,7 +2661,7 @@ static struct platform_driver atmel_nand_controller_driver = {
 		.pm = &atmel_nand_controller_pm_ops,
 	},
 	.probe = atmel_nand_controller_probe,
-	.remove = atmel_nand_controller_remove,
+	.remove_new = atmel_nand_controller_remove,
 };
 module_platform_driver(atmel_nand_controller_driver);
 
diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index 5aa3a06d740c..063a5e0b8d4b 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -337,7 +337,7 @@ static int au1550nd_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int au1550nd_remove(struct platform_device *pdev)
+static void au1550nd_remove(struct platform_device *pdev)
 {
 	struct au1550nd_ctx *ctx = platform_get_drvdata(pdev);
 	struct resource *r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -350,7 +350,6 @@ static int au1550nd_remove(struct platform_device *pdev)
 	iounmap(ctx->base);
 	release_mem_region(r->start, 0x1000);
 	kfree(ctx);
-	return 0;
 }
 
 static struct platform_driver au1550nd_driver = {
@@ -358,7 +357,7 @@ static struct platform_driver au1550nd_driver = {
 		.name	= "au1550-nand",
 	},
 	.probe		= au1550nd_probe,
-	.remove		= au1550nd_remove,
+	.remove_new	= au1550nd_remove,
 };
 
 module_platform_driver(au1550nd_driver);
diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/main.c b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
index dcc70d9dc6e5..ebcf508e0606 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
@@ -57,7 +57,7 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int bcm47xxnflash_remove(struct platform_device *pdev)
+static void bcm47xxnflash_remove(struct platform_device *pdev)
 {
 	struct bcm47xxnflash *nflash = platform_get_drvdata(pdev);
 	struct nand_chip *chip = &nflash->nand_chip;
@@ -66,13 +66,11 @@ static int bcm47xxnflash_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
-
-	return 0;
 }
 
 static struct platform_driver bcm47xxnflash_driver = {
 	.probe	= bcm47xxnflash_probe,
-	.remove = bcm47xxnflash_remove,
+	.remove_new = bcm47xxnflash_remove,
 	.driver = {
 		.name = "bcma_nflash",
 	},
diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 7661a5cf1883..034ec564c2ed 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -3055,18 +3055,16 @@ static int cadence_nand_dt_probe(struct platform_device *ofdev)
 	return 0;
 }
 
-static int cadence_nand_dt_remove(struct platform_device *ofdev)
+static void cadence_nand_dt_remove(struct platform_device *ofdev)
 {
 	struct cadence_nand_dt *dt = platform_get_drvdata(ofdev);
 
 	cadence_nand_remove(&dt->cdns_ctrl);
-
-	return 0;
 }
 
 static struct platform_driver cadence_nand_dt_driver = {
 	.probe		= cadence_nand_dt_probe,
-	.remove		= cadence_nand_dt_remove,
+	.remove_new	= cadence_nand_dt_remove,
 	.driver		= {
 		.name	= "cadence-nand-controller",
 		.of_match_table = cadence_nand_dt_ids,
diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 3e98e3c255bf..415d6aaa8255 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -821,7 +821,7 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int nand_davinci_remove(struct platform_device *pdev)
+static void nand_davinci_remove(struct platform_device *pdev)
 {
 	struct davinci_nand_info *info = platform_get_drvdata(pdev);
 	struct nand_chip *chip = &info->chip;
@@ -835,13 +835,11 @@ static int nand_davinci_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
-
-	return 0;
 }
 
 static struct platform_driver nand_davinci_driver = {
 	.probe		= nand_davinci_probe,
-	.remove		= nand_davinci_remove,
+	.remove_new	= nand_davinci_remove,
 	.driver		= {
 		.name	= "davinci_nand",
 		.of_match_table = of_match_ptr(davinci_nand_of_match),
diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index 8513bb9fcfcc..915047e3fbc2 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -233,7 +233,7 @@ static int denali_dt_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int denali_dt_remove(struct platform_device *pdev)
+static void denali_dt_remove(struct platform_device *pdev)
 {
 	struct denali_dt *dt = platform_get_drvdata(pdev);
 
@@ -243,13 +243,11 @@ static int denali_dt_remove(struct platform_device *pdev)
 	clk_disable_unprepare(dt->clk_ecc);
 	clk_disable_unprepare(dt->clk_x);
 	clk_disable_unprepare(dt->clk);
-
-	return 0;
 }
 
 static struct platform_driver denali_dt_driver = {
 	.probe		= denali_dt_probe,
-	.remove		= denali_dt_remove,
+	.remove_new	= denali_dt_remove,
 	.driver		= {
 		.name	= "denali-nand-dt",
 		.of_match_table	= denali_nand_dt_ids,
diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index e25119e58b69..1e3a80f06f33 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -963,7 +963,7 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_elbc_nand_remove(struct platform_device *pdev)
+static void fsl_elbc_nand_remove(struct platform_device *pdev)
 {
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
 	struct fsl_elbc_mtd *priv = dev_get_drvdata(&pdev->dev);
@@ -984,8 +984,6 @@ static int fsl_elbc_nand_remove(struct platform_device *pdev)
 	}
 	mutex_unlock(&fsl_elbc_nand_mutex);
 
-	return 0;
-
 }
 
 static const struct of_device_id fsl_elbc_nand_match[] = {
@@ -1000,7 +998,7 @@ static struct platform_driver fsl_elbc_nand_driver = {
 		.of_match_table = fsl_elbc_nand_match,
 	},
 	.probe = fsl_elbc_nand_probe,
-	.remove = fsl_elbc_nand_remove,
+	.remove_new = fsl_elbc_nand_remove,
 };
 
 module_platform_driver(fsl_elbc_nand_driver);
diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 02d500176838..fa537fee6701 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -1094,7 +1094,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	return ret;
 }
 
-static int fsl_ifc_nand_remove(struct platform_device *dev)
+static void fsl_ifc_nand_remove(struct platform_device *dev)
 {
 	struct fsl_ifc_mtd *priv = dev_get_drvdata(&dev->dev);
 	struct nand_chip *chip = &priv->chip;
@@ -1113,8 +1113,6 @@ static int fsl_ifc_nand_remove(struct platform_device *dev)
 		kfree(ifc_nand_ctrl);
 	}
 	mutex_unlock(&fsl_ifc_nand_mutex);
-
-	return 0;
 }
 
 static const struct of_device_id fsl_ifc_nand_match[] = {
@@ -1131,7 +1129,7 @@ static struct platform_driver fsl_ifc_nand_driver = {
 		.of_match_table = fsl_ifc_nand_match,
 	},
 	.probe       = fsl_ifc_nand_probe,
-	.remove      = fsl_ifc_nand_remove,
+	.remove_new  = fsl_ifc_nand_remove,
 };
 
 module_platform_driver(fsl_ifc_nand_driver);
diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index b3cc427100a2..086426139173 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -235,7 +235,7 @@ static int fun_probe(struct platform_device *ofdev)
 	return 0;
 }
 
-static int fun_remove(struct platform_device *ofdev)
+static void fun_remove(struct platform_device *ofdev)
 {
 	struct fsl_upm_nand *fun = dev_get_drvdata(&ofdev->dev);
 	struct nand_chip *chip = &fun->chip;
@@ -245,8 +245,6 @@ static int fun_remove(struct platform_device *ofdev)
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
 	nand_cleanup(chip);
-
-	return 0;
 }
 
 static const struct of_device_id of_fun_match[] = {
@@ -261,7 +259,7 @@ static struct platform_driver of_fun_driver = {
 		.of_match_table = of_fun_match,
 	},
 	.probe		= fun_probe,
-	.remove		= fun_remove,
+	.remove_new	= fun_remove,
 };
 
 module_platform_driver(of_fun_driver);
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 6b2bda815b88..d57867089079 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1165,7 +1165,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 /*
  * Clean up routine
  */
-static int fsmc_nand_remove(struct platform_device *pdev)
+static void fsmc_nand_remove(struct platform_device *pdev)
 {
 	struct fsmc_nand_data *host = platform_get_drvdata(pdev);
 
@@ -1184,8 +1184,6 @@ static int fsmc_nand_remove(struct platform_device *pdev)
 		}
 		clk_disable_unprepare(host->clk);
 	}
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1224,7 +1222,7 @@ static const struct of_device_id fsmc_nand_id_table[] = {
 MODULE_DEVICE_TABLE(of, fsmc_nand_id_table);
 
 static struct platform_driver fsmc_nand_driver = {
-	.remove = fsmc_nand_remove,
+	.remove_new = fsmc_nand_remove,
 	.driver = {
 		.name = "fsmc-nand",
 		.of_match_table = fsmc_nand_id_table,
diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index dcf28cff760d..d6cc2cb65214 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -265,7 +265,7 @@ gpio_nand_get_io_sync(struct platform_device *pdev)
 	return platform_get_resource(pdev, IORESOURCE_MEM, 1);
 }
 
-static int gpio_nand_remove(struct platform_device *pdev)
+static void gpio_nand_remove(struct platform_device *pdev)
 {
 	struct gpiomtd *gpiomtd = platform_get_drvdata(pdev);
 	struct nand_chip *chip = &gpiomtd->nand_chip;
@@ -280,8 +280,6 @@ static int gpio_nand_remove(struct platform_device *pdev)
 		gpiod_set_value(gpiomtd->nwp, 0);
 	if (gpiomtd->nce && !IS_ERR(gpiomtd->nce))
 		gpiod_set_value(gpiomtd->nce, 0);
-
-	return 0;
 }
 
 static int gpio_nand_probe(struct platform_device *pdev)
@@ -394,7 +392,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 static struct platform_driver gpio_nand_driver = {
 	.probe		= gpio_nand_probe,
-	.remove		= gpio_nand_remove,
+	.remove_new	= gpio_nand_remove,
 	.driver		= {
 		.name	= "gpio-nand",
 		.of_match_table = of_match_ptr(gpio_nand_id_table),
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index ada83344b0f9..500e7a28d2e4 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2777,7 +2777,7 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int gpmi_nand_remove(struct platform_device *pdev)
+static void gpmi_nand_remove(struct platform_device *pdev)
 {
 	struct gpmi_nand_data *this = platform_get_drvdata(pdev);
 	struct nand_chip *chip = &this->nand;
@@ -2791,7 +2791,6 @@ static int gpmi_nand_remove(struct platform_device *pdev)
 	nand_cleanup(chip);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -2860,7 +2859,7 @@ static struct platform_driver gpmi_nand_driver = {
 		.of_match_table = gpmi_nand_id_table,
 	},
 	.probe   = gpmi_nand_probe,
-	.remove  = gpmi_nand_remove,
+	.remove_new = gpmi_nand_remove,
 };
 module_platform_driver(gpmi_nand_driver);
 
diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index c74f6b2192fc..fe291a2e5c77 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -798,7 +798,7 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int hisi_nfc_remove(struct platform_device *pdev)
+static void hisi_nfc_remove(struct platform_device *pdev)
 {
 	struct hinfc_host *host = platform_get_drvdata(pdev);
 	struct nand_chip *chip = &host->chip;
@@ -807,8 +807,6 @@ static int hisi_nfc_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -860,7 +858,7 @@ static struct platform_driver hisi_nfc_driver = {
 		.pm = &hisi_nfc_pm_ops,
 	},
 	.probe		= hisi_nfc_probe,
-	.remove		= hisi_nfc_remove,
+	.remove_new	= hisi_nfc_remove,
 };
 
 module_platform_driver(hisi_nfc_driver);
diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index ff26c10f295d..b9f135297aa0 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -522,7 +522,7 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int ingenic_nand_remove(struct platform_device *pdev)
+static void ingenic_nand_remove(struct platform_device *pdev)
 {
 	struct ingenic_nfc *nfc = platform_get_drvdata(pdev);
 
@@ -530,8 +530,6 @@ static int ingenic_nand_remove(struct platform_device *pdev)
 		ingenic_ecc_release(nfc->ecc);
 
 	ingenic_nand_cleanup_chips(nfc);
-
-	return 0;
 }
 
 static const struct jz_soc_info jz4740_soc_info = {
@@ -564,7 +562,7 @@ MODULE_DEVICE_TABLE(of, ingenic_nand_dt_match);
 
 static struct platform_driver ingenic_nand_driver = {
 	.probe		= ingenic_nand_probe,
-	.remove		= ingenic_nand_remove,
+	.remove_new	= ingenic_nand_remove,
 	.driver	= {
 		.name	= DRV_NAME,
 		.of_match_table = ingenic_nand_dt_match,
diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 6f4cea81f97c..a9909eb08124 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -706,7 +706,7 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ebu_nand_remove(struct platform_device *pdev)
+static void ebu_nand_remove(struct platform_device *pdev)
 {
 	struct ebu_nand_controller *ebu_host = platform_get_drvdata(pdev);
 	int ret;
@@ -717,8 +717,6 @@ static int ebu_nand_remove(struct platform_device *pdev)
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
 	clk_disable_unprepare(ebu_host->clk);
-
-	return 0;
 }
 
 static const struct of_device_id ebu_nand_match[] = {
@@ -729,7 +727,7 @@ MODULE_DEVICE_TABLE(of, ebu_nand_match);
 
 static struct platform_driver ebu_nand_driver = {
 	.probe = ebu_nand_probe,
-	.remove = ebu_nand_remove,
+	.remove_new = ebu_nand_remove,
 	.driver = {
 		.name = "intel-nand-controller",
 		.of_match_table = ebu_nand_match,
diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index ae7f6429a5f6..b3136ae6f4e9 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -827,7 +827,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 /*
  * Remove NAND device
  */
-static int lpc32xx_nand_remove(struct platform_device *pdev)
+static void lpc32xx_nand_remove(struct platform_device *pdev)
 {
 	struct lpc32xx_nand_host *host = platform_get_drvdata(pdev);
 	struct nand_chip *chip = &host->nand_chip;
@@ -846,8 +846,6 @@ static int lpc32xx_nand_remove(struct platform_device *pdev)
 
 	lpc32xx_wp_enable(host);
 	gpiod_put(host->wp_gpio);
-
-	return 0;
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)
@@ -889,7 +887,7 @@ MODULE_DEVICE_TABLE(of, lpc32xx_nand_match);
 
 static struct platform_driver lpc32xx_nand_driver = {
 	.probe		= lpc32xx_nand_probe,
-	.remove		= lpc32xx_nand_remove,
+	.remove_new	= lpc32xx_nand_remove,
 	.resume		= pm_ptr(lpc32xx_nand_resume),
 	.suspend	= pm_ptr(lpc32xx_nand_suspend),
 	.driver		= {
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 6918737346c9..3139b6107660 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -946,7 +946,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 /*
  * Remove NAND device.
  */
-static int lpc32xx_nand_remove(struct platform_device *pdev)
+static void lpc32xx_nand_remove(struct platform_device *pdev)
 {
 	uint32_t tmp;
 	struct lpc32xx_nand_host *host = platform_get_drvdata(pdev);
@@ -965,8 +965,6 @@ static int lpc32xx_nand_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(host->clk);
 	lpc32xx_wp_enable(host);
-
-	return 0;
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)
@@ -1015,7 +1013,7 @@ MODULE_DEVICE_TABLE(of, lpc32xx_nand_match);
 
 static struct platform_driver lpc32xx_nand_driver = {
 	.probe		= lpc32xx_nand_probe,
-	.remove		= lpc32xx_nand_remove,
+	.remove_new	= lpc32xx_nand_remove,
 	.resume		= pm_ptr(lpc32xx_nand_resume),
 	.suspend	= pm_ptr(lpc32xx_nand_suspend),
 	.driver		= {
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 3034916d2e25..afb424579f0b 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -3004,7 +3004,7 @@ static int marvell_nfc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int marvell_nfc_remove(struct platform_device *pdev)
+static void marvell_nfc_remove(struct platform_device *pdev)
 {
 	struct marvell_nfc *nfc = platform_get_drvdata(pdev);
 
@@ -3017,8 +3017,6 @@ static int marvell_nfc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(nfc->reg_clk);
 	clk_disable_unprepare(nfc->core_clk);
-
-	return 0;
 }
 
 static int __maybe_unused marvell_nfc_suspend(struct device *dev)
@@ -3154,7 +3152,7 @@ static struct platform_driver marvell_nfc_driver = {
 	},
 	.id_table = marvell_nfc_platform_ids,
 	.probe = marvell_nfc_probe,
-	.remove	= marvell_nfc_remove,
+	.remove_new = marvell_nfc_remove,
 };
 module_platform_driver(marvell_nfc_driver);
 
diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 5ee01231ac4c..24f1ad025cda 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1434,20 +1434,18 @@ static int meson_nfc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int meson_nfc_remove(struct platform_device *pdev)
+static void meson_nfc_remove(struct platform_device *pdev)
 {
 	struct meson_nfc *nfc = platform_get_drvdata(pdev);
 
 	meson_nfc_nand_chip_cleanup(nfc);
 
 	meson_nfc_disable_clk(nfc);
-
-	return 0;
 }
 
 static struct platform_driver meson_nfc_driver = {
 	.probe  = meson_nfc_probe,
-	.remove = meson_nfc_remove,
+	.remove_new = meson_nfc_remove,
 	.driver = {
 		.name  = "meson-nand",
 		.of_match_table = meson_nfc_id_table,
diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index f68349cb7824..ab05ee65702c 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -822,7 +822,7 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	return retval;
 }
 
-static int mpc5121_nfc_remove(struct platform_device *op)
+static void mpc5121_nfc_remove(struct platform_device *op)
 {
 	struct device *dev = &op->dev;
 	struct mtd_info *mtd = dev_get_drvdata(dev);
@@ -832,8 +832,6 @@ static int mpc5121_nfc_remove(struct platform_device *op)
 	WARN_ON(ret);
 	nand_cleanup(mtd_to_nand(mtd));
 	mpc5121_nfc_free(dev, mtd);
-
-	return 0;
 }
 
 static const struct of_device_id mpc5121_nfc_match[] = {
@@ -844,7 +842,7 @@ MODULE_DEVICE_TABLE(of, mpc5121_nfc_match);
 
 static struct platform_driver mpc5121_nfc_driver = {
 	.probe		= mpc5121_nfc_probe,
-	.remove		= mpc5121_nfc_remove,
+	.remove_new	= mpc5121_nfc_remove,
 	.driver		= {
 		.name = DRV_NAME,
 		.of_match_table = mpc5121_nfc_match,
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index d540454cbbdf..b2fa6b2074ab 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1601,7 +1601,7 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_nfc_remove(struct platform_device *pdev)
+static void mtk_nfc_remove(struct platform_device *pdev)
 {
 	struct mtk_nfc *nfc = platform_get_drvdata(pdev);
 	struct mtk_nfc_nand_chip *mtk_chip;
@@ -1620,8 +1620,6 @@ static int mtk_nfc_remove(struct platform_device *pdev)
 
 	mtk_ecc_release(nfc->ecc);
 	mtk_nfc_disable_clk(&nfc->clk);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1663,7 +1661,7 @@ static SIMPLE_DEV_PM_OPS(mtk_nfc_pm_ops, mtk_nfc_suspend, mtk_nfc_resume);
 
 static struct platform_driver mtk_nfc_driver = {
 	.probe  = mtk_nfc_probe,
-	.remove = mtk_nfc_remove,
+	.remove_new = mtk_nfc_remove,
 	.driver = {
 		.name  = MTK_NAME,
 		.of_match_table = mtk_nfc_id_table,
diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index f6c96341b896..56c1046cc073 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1831,7 +1831,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int mxcnd_remove(struct platform_device *pdev)
+static void mxcnd_remove(struct platform_device *pdev)
 {
 	struct mxc_nand_host *host = platform_get_drvdata(pdev);
 	struct nand_chip *chip = &host->nand;
@@ -1842,8 +1842,6 @@ static int mxcnd_remove(struct platform_device *pdev)
 	nand_cleanup(chip);
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
-
-	return 0;
 }
 
 static struct platform_driver mxcnd_driver = {
@@ -1852,7 +1850,7 @@ static struct platform_driver mxcnd_driver = {
 		   .of_match_table = mxcnd_dt_ids,
 	},
 	.probe = mxcnd_probe,
-	.remove = mxcnd_remove,
+	.remove_new = mxcnd_remove,
 };
 module_platform_driver(mxcnd_driver);
 
diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index da1070993994..be8050e84b4f 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -553,7 +553,7 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int mxic_nfc_remove(struct platform_device *pdev)
+static void mxic_nfc_remove(struct platform_device *pdev)
 {
 	struct mxic_nand_ctlr *nfc = platform_get_drvdata(pdev);
 	struct nand_chip *chip = &nfc->chip;
@@ -564,7 +564,6 @@ static int mxic_nfc_remove(struct platform_device *pdev)
 	nand_cleanup(chip);
 
 	mxic_nfc_clk_disable(nfc);
-	return 0;
 }
 
 static const struct of_device_id mxic_nfc_of_ids[] = {
@@ -575,7 +574,7 @@ MODULE_DEVICE_TABLE(of, mxic_nfc_of_ids);
 
 static struct platform_driver mxic_nfc_driver = {
 	.probe = mxic_nfc_probe,
-	.remove = mxic_nfc_remove,
+	.remove_new = mxic_nfc_remove,
 	.driver = {
 		.name = "mxic-nfc",
 		.of_match_table = mxic_nfc_of_ids,
diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index 338d6b1a189e..57f3db32122d 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -240,7 +240,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	return 0;
 }
 
-static int ndfc_remove(struct platform_device *ofdev)
+static void ndfc_remove(struct platform_device *ofdev)
 {
 	struct ndfc_controller *ndfc = dev_get_drvdata(&ofdev->dev);
 	struct nand_chip *chip = &ndfc->chip;
@@ -251,8 +251,6 @@ static int ndfc_remove(struct platform_device *ofdev)
 	WARN_ON(ret);
 	nand_cleanup(chip);
 	kfree(mtd->name);
-
-	return 0;
 }
 
 static const struct of_device_id ndfc_match[] = {
@@ -267,7 +265,7 @@ static struct platform_driver ndfc_driver = {
 		.of_match_table = ndfc_match,
 	},
 	.probe = ndfc_probe,
-	.remove = ndfc_remove,
+	.remove_new = ndfc_remove,
 };
 
 module_platform_driver(ndfc_driver);
diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 4a9f2b6c772d..db22b3af16d8 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -2273,7 +2273,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int omap_nand_remove(struct platform_device *pdev)
+static void omap_nand_remove(struct platform_device *pdev)
 {
 	struct mtd_info *mtd = platform_get_drvdata(pdev);
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
@@ -2285,7 +2285,6 @@ static int omap_nand_remove(struct platform_device *pdev)
 		dma_release_channel(info->dma);
 	WARN_ON(mtd_device_unregister(mtd));
 	nand_cleanup(nand_chip);
-	return 0;
 }
 
 /* omap_nand_ids defined in linux/platform_data/mtd-nand-omap2.h */
@@ -2293,7 +2292,7 @@ MODULE_DEVICE_TABLE(of, omap_nand_ids);
 
 static struct platform_driver omap_nand_driver = {
 	.probe		= omap_nand_probe,
-	.remove		= omap_nand_remove,
+	.remove_new	= omap_nand_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.of_match_table = omap_nand_ids,
diff --git a/drivers/mtd/nand/raw/omap_elm.c b/drivers/mtd/nand/raw/omap_elm.c
index 4796a48e1012..6e1eac6644a6 100644
--- a/drivers/mtd/nand/raw/omap_elm.c
+++ b/drivers/mtd/nand/raw/omap_elm.c
@@ -422,11 +422,10 @@ static int elm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int elm_remove(struct platform_device *pdev)
+static void elm_remove(struct platform_device *pdev)
 {
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -561,7 +560,7 @@ static struct platform_driver elm_driver = {
 		.pm	= &elm_pm_ops,
 	},
 	.probe	= elm_probe,
-	.remove	= elm_remove,
+	.remove_new = elm_remove,
 };
 
 module_platform_driver(elm_driver);
diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 1bfecf502216..39a6c6360588 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -207,7 +207,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int orion_nand_remove(struct platform_device *pdev)
+static void orion_nand_remove(struct platform_device *pdev)
 {
 	struct orion_nand_info *info = platform_get_drvdata(pdev);
 	struct nand_chip *chip = &info->chip;
@@ -219,8 +219,6 @@ static int orion_nand_remove(struct platform_device *pdev)
 	nand_cleanup(chip);
 
 	clk_disable_unprepare(info->clk);
-
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -232,7 +230,7 @@ MODULE_DEVICE_TABLE(of, orion_nand_of_match_table);
 #endif
 
 static struct platform_driver orion_nand_driver = {
-	.remove		= orion_nand_remove,
+	.remove_new	= orion_nand_remove,
 	.driver		= {
 		.name	= "orion_nand",
 		.of_match_table = of_match_ptr(orion_nand_of_match_table),
diff --git a/drivers/mtd/nand/raw/oxnas_nand.c b/drivers/mtd/nand/raw/oxnas_nand.c
index cd112d45e0b5..e3c9807df1cd 100644
--- a/drivers/mtd/nand/raw/oxnas_nand.c
+++ b/drivers/mtd/nand/raw/oxnas_nand.c
@@ -171,7 +171,7 @@ static int oxnas_nand_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int oxnas_nand_remove(struct platform_device *pdev)
+static void oxnas_nand_remove(struct platform_device *pdev)
 {
 	struct oxnas_nand_ctrl *oxnas = platform_get_drvdata(pdev);
 	struct nand_chip *chip;
@@ -184,8 +184,6 @@ static int oxnas_nand_remove(struct platform_device *pdev)
 	}
 
 	clk_disable_unprepare(oxnas->clk);
-
-	return 0;
 }
 
 static const struct of_device_id oxnas_nand_match[] = {
@@ -196,7 +194,7 @@ MODULE_DEVICE_TABLE(of, oxnas_nand_match);
 
 static struct platform_driver oxnas_nand_driver = {
 	.probe	= oxnas_nand_probe,
-	.remove	= oxnas_nand_remove,
+	.remove_new = oxnas_nand_remove,
 	.driver	= {
 		.name		= "oxnas_nand",
 		.of_match_table = oxnas_nand_match,
diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index f7ef6ca06ca9..19b2c9d25863 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -197,7 +197,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	return err;
 }
 
-static int pasemi_nand_remove(struct platform_device *ofdev)
+static void pasemi_nand_remove(struct platform_device *ofdev)
 {
 	struct pasemi_ddata *ddata = platform_get_drvdata(ofdev);
 	struct mtd_info *pasemi_nand_mtd;
@@ -218,8 +218,6 @@ static int pasemi_nand_remove(struct platform_device *ofdev)
 
 	/* Free the MTD device structure */
 	kfree(ddata);
-
-	return 0;
 }
 
 static const struct of_device_id pasemi_nand_match[] =
@@ -239,7 +237,7 @@ static struct platform_driver pasemi_nand_driver =
 		.of_match_table = pasemi_nand_match,
 	},
 	.probe		= pasemi_nand_probe,
-	.remove		= pasemi_nand_remove,
+	.remove_new	= pasemi_nand_remove,
 };
 
 module_platform_driver(pasemi_nand_driver);
diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 3c6f6aff649f..28b7bd7e22eb 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1163,13 +1163,11 @@ static int pl35x_nand_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int pl35x_nand_remove(struct platform_device *pdev)
+static void pl35x_nand_remove(struct platform_device *pdev)
 {
 	struct pl35x_nandc *nfc = platform_get_drvdata(pdev);
 
 	pl35x_nand_chips_cleanup(nfc);
-
-	return 0;
 }
 
 static const struct of_device_id pl35x_nand_of_match[] = {
@@ -1180,7 +1178,7 @@ MODULE_DEVICE_TABLE(of, pl35x_nand_of_match);
 
 static struct platform_driver pl35x_nandc_driver = {
 	.probe = pl35x_nand_probe,
-	.remove	= pl35x_nand_remove,
+	.remove_new = pl35x_nand_remove,
 	.driver = {
 		.name = PL35X_NANDC_DRIVER_NAME,
 		.of_match_table = pl35x_nand_of_match,
diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index 7e0d0a8dfd1e..b5c374b51ecd 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -122,7 +122,7 @@ static int plat_nand_probe(struct platform_device *pdev)
 /*
  * Remove a NAND device.
  */
-static int plat_nand_remove(struct platform_device *pdev)
+static void plat_nand_remove(struct platform_device *pdev)
 {
 	struct plat_nand_data *data = platform_get_drvdata(pdev);
 	struct platform_nand_data *pdata = dev_get_platdata(&pdev->dev);
@@ -134,8 +134,6 @@ static int plat_nand_remove(struct platform_device *pdev)
 	nand_cleanup(chip);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
-
-	return 0;
 }
 
 static const struct of_device_id plat_nand_match[] = {
@@ -146,7 +144,7 @@ MODULE_DEVICE_TABLE(of, plat_nand_match);
 
 static struct platform_driver plat_nand_driver = {
 	.probe	= plat_nand_probe,
-	.remove	= plat_nand_remove,
+	.remove_new = plat_nand_remove,
 	.driver	= {
 		.name		= "gen_nand",
 		.of_match_table = plat_nand_match,
diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 198a44794d2d..218c8a840e32 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -3315,7 +3315,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int qcom_nandc_remove(struct platform_device *pdev)
+static void qcom_nandc_remove(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc = platform_get_drvdata(pdev);
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -3337,8 +3337,6 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 
 	dma_unmap_resource(&pdev->dev, nandc->base_dma, resource_size(res),
 			   DMA_BIDIRECTIONAL, 0);
-
-	return 0;
 }
 
 static const struct qcom_nandc_props ipq806x_nandc_props = {
@@ -3405,7 +3403,7 @@ static struct platform_driver qcom_nandc_driver = {
 		.of_match_table = qcom_nandc_of_match,
 	},
 	.probe   = qcom_nandc_probe,
-	.remove  = qcom_nandc_remove,
+	.remove_new = qcom_nandc_remove,
 };
 module_platform_driver(qcom_nandc_driver);
 
diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 1620e25a1147..589021ea9eb2 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1386,15 +1386,13 @@ static int rnandc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rnandc_remove(struct platform_device *pdev)
+static void rnandc_remove(struct platform_device *pdev)
 {
 	struct rnandc *rnandc = platform_get_drvdata(pdev);
 
 	rnandc_chips_cleanup(rnandc);
 
 	pm_runtime_put(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id rnandc_id_table[] = {
@@ -1410,7 +1408,7 @@ static struct platform_driver rnandc_driver = {
 		.of_match_table = rnandc_id_table,
 	},
 	.probe = rnandc_probe,
-	.remove = rnandc_remove,
+	.remove_new = rnandc_remove,
 };
 module_platform_driver(rnandc_driver);
 
diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index f133985cc053..2312e27362cb 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -1427,7 +1427,7 @@ static int rk_nfc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rk_nfc_remove(struct platform_device *pdev)
+static void rk_nfc_remove(struct platform_device *pdev)
 {
 	struct rk_nfc *nfc = platform_get_drvdata(pdev);
 
@@ -1435,8 +1435,6 @@ static int rk_nfc_remove(struct platform_device *pdev)
 	kfree(nfc->oob_buf);
 	rk_nfc_chips_cleanup(nfc);
 	rk_nfc_disable_clks(nfc);
-
-	return 0;
 }
 
 static int __maybe_unused rk_nfc_suspend(struct device *dev)
@@ -1476,7 +1474,7 @@ static const struct dev_pm_ops rk_nfc_pm_ops = {
 
 static struct platform_driver rk_nfc_driver = {
 	.probe = rk_nfc_probe,
-	.remove = rk_nfc_remove,
+	.remove_new = rk_nfc_remove,
 	.driver = {
 		.name = "rockchip-nfc",
 		.of_match_table = rk_nfc_id_table,
diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index 80d96f94d6cb..ac80aaf5b4e3 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -709,12 +709,12 @@ static void s3c2440_nand_write_buf(struct nand_chip *this, const u_char *buf,
 
 /* device management functions */
 
-static int s3c24xx_nand_remove(struct platform_device *pdev)
+static void s3c24xx_nand_remove(struct platform_device *pdev)
 {
 	struct s3c2410_nand_info *info = to_nand_info(pdev);
 
 	if (info == NULL)
-		return 0;
+		return;
 
 	/* Release all our mtds  and their partitions, then go through
 	 * freeing the resources used
@@ -735,8 +735,6 @@ static int s3c24xx_nand_remove(struct platform_device *pdev)
 
 	if (!IS_ERR(info->clk))
 		s3c2410_nand_clk_set_state(info, CLOCK_DISABLE);
-
-	return 0;
 }
 
 static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
@@ -1218,7 +1216,7 @@ MODULE_DEVICE_TABLE(platform, s3c24xx_driver_ids);
 
 static struct platform_driver s3c24xx_nand_driver = {
 	.probe		= s3c24xx_nand_probe,
-	.remove		= s3c24xx_nand_remove,
+	.remove_new	= s3c24xx_nand_remove,
 	.suspend	= s3c24xx_nand_suspend,
 	.resume		= s3c24xx_nand_resume,
 	.id_table	= s3c24xx_driver_ids,
diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index a278829469d6..63bf20c41719 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1203,7 +1203,7 @@ static int flctl_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int flctl_remove(struct platform_device *pdev)
+static void flctl_remove(struct platform_device *pdev)
 {
 	struct sh_flctl *flctl = platform_get_drvdata(pdev);
 	struct nand_chip *chip = &flctl->chip;
@@ -1214,12 +1214,10 @@ static int flctl_remove(struct platform_device *pdev)
 	WARN_ON(ret);
 	nand_cleanup(chip);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static struct platform_driver flctl_driver = {
-	.remove		= flctl_remove,
+	.remove_new	= flctl_remove,
 	.driver = {
 		.name	= "sh_flctl",
 		.of_match_table = of_flctl_match,
diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 52ce5162538a..2402dc5465d5 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -210,7 +210,7 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 /*
  * Clean up routine
  */
-static int sharpsl_nand_remove(struct platform_device *pdev)
+static void sharpsl_nand_remove(struct platform_device *pdev)
 {
 	struct sharpsl_nand *sharpsl = platform_get_drvdata(pdev);
 	struct nand_chip *chip = &sharpsl->chip;
@@ -227,8 +227,6 @@ static int sharpsl_nand_remove(struct platform_device *pdev)
 
 	/* Free the driver's structure */
 	kfree(sharpsl);
-
-	return 0;
 }
 
 static struct platform_driver sharpsl_nand_driver = {
@@ -236,7 +234,7 @@ static struct platform_driver sharpsl_nand_driver = {
 		.name	= "sharpsl-nand",
 	},
 	.probe		= sharpsl_nand_probe,
-	.remove		= sharpsl_nand_remove,
+	.remove_new	= sharpsl_nand_remove,
 };
 
 module_platform_driver(sharpsl_nand_driver);
diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index fb39cc7ebce0..a8b720ffe9e8 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -201,7 +201,7 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 /*
  * Remove a NAND device.
  */
-static int socrates_nand_remove(struct platform_device *ofdev)
+static void socrates_nand_remove(struct platform_device *ofdev)
 {
 	struct socrates_nand_host *host = dev_get_drvdata(&ofdev->dev);
 	struct nand_chip *chip = &host->nand_chip;
@@ -212,8 +212,6 @@ static int socrates_nand_remove(struct platform_device *ofdev)
 	nand_cleanup(chip);
 
 	iounmap(host->io_base);
-
-	return 0;
 }
 
 static const struct of_device_id socrates_nand_match[] =
@@ -232,7 +230,7 @@ static struct platform_driver socrates_nand_driver = {
 		.of_match_table = socrates_nand_match,
 	},
 	.probe		= socrates_nand_probe,
-	.remove		= socrates_nand_remove,
+	.remove_new	= socrates_nand_remove,
 };
 
 module_platform_driver(socrates_nand_driver);
diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 5d627048c420..e3d09dd5963b 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -2021,7 +2021,7 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int stm32_fmc2_nfc_remove(struct platform_device *pdev)
+static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 {
 	struct stm32_fmc2_nfc *nfc = platform_get_drvdata(pdev);
 	struct stm32_fmc2_nand *nand = &nfc->nand;
@@ -2045,8 +2045,6 @@ static int stm32_fmc2_nfc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(nfc->clk);
 
 	stm32_fmc2_nfc_wp_enable(nand);
-
-	return 0;
 }
 
 static int __maybe_unused stm32_fmc2_nfc_suspend(struct device *dev)
@@ -2103,7 +2101,7 @@ MODULE_DEVICE_TABLE(of, stm32_fmc2_nfc_match);
 
 static struct platform_driver stm32_fmc2_nfc_driver = {
 	.probe	= stm32_fmc2_nfc_probe,
-	.remove	= stm32_fmc2_nfc_remove,
+	.remove_new = stm32_fmc2_nfc_remove,
 	.driver	= {
 		.name = "stm32_fmc2_nfc",
 		.of_match_table = stm32_fmc2_nfc_match,
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 13e3e0198d15..9884304634f6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2173,7 +2173,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sunxi_nfc_remove(struct platform_device *pdev)
+static void sunxi_nfc_remove(struct platform_device *pdev)
 {
 	struct sunxi_nfc *nfc = platform_get_drvdata(pdev);
 
@@ -2185,8 +2185,6 @@ static int sunxi_nfc_remove(struct platform_device *pdev)
 		dma_release_channel(nfc->dmac);
 	clk_disable_unprepare(nfc->mod_clk);
 	clk_disable_unprepare(nfc->ahb_clk);
-
-	return 0;
 }
 
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
@@ -2219,7 +2217,7 @@ static struct platform_driver sunxi_nfc_driver = {
 		.of_match_table = sunxi_nfc_ids,
 	},
 	.probe = sunxi_nfc_probe,
-	.remove = sunxi_nfc_remove,
+	.remove_new = sunxi_nfc_remove,
 };
 module_platform_driver(sunxi_nfc_driver);
 
diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index a9b9031ce616..eb0b9d16e8da 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1220,7 +1220,7 @@ static int tegra_nand_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int tegra_nand_remove(struct platform_device *pdev)
+static void tegra_nand_remove(struct platform_device *pdev)
 {
 	struct tegra_nand_controller *ctrl = platform_get_drvdata(pdev);
 	struct nand_chip *chip = ctrl->chip;
@@ -1232,8 +1232,6 @@ static int tegra_nand_remove(struct platform_device *pdev)
 
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
-
-	return 0;
 }
 
 static int __maybe_unused tegra_nand_runtime_resume(struct device *dev)
@@ -1277,7 +1275,7 @@ static struct platform_driver tegra_nand_driver = {
 		.pm = &tegra_nand_pm,
 	},
 	.probe = tegra_nand_probe,
-	.remove = tegra_nand_remove,
+	.remove_new = tegra_nand_remove,
 };
 module_platform_driver(tegra_nand_driver);
 
diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index b643332ea1ff..86522048e271 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -909,7 +909,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int vf610_nfc_remove(struct platform_device *pdev)
+static void vf610_nfc_remove(struct platform_device *pdev)
 {
 	struct vf610_nfc *nfc = platform_get_drvdata(pdev);
 	struct nand_chip *chip = &nfc->chip;
@@ -919,7 +919,6 @@ static int vf610_nfc_remove(struct platform_device *pdev)
 	WARN_ON(ret);
 	nand_cleanup(chip);
 	clk_disable_unprepare(nfc->clk);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -955,7 +954,7 @@ static struct platform_driver vf610_nfc_driver = {
 		.pm	= &vf610_nfc_pm_ops,
 	},
 	.probe		= vf610_nfc_probe,
-	.remove		= vf610_nfc_remove,
+	.remove_new	= vf610_nfc_remove,
 };
 
 module_platform_driver(vf610_nfc_driver);
diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index 035b82aa2f4a..6b1e2a2bba15 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -238,7 +238,7 @@ static int xway_nand_probe(struct platform_device *pdev)
 /*
  * Remove a NAND device.
  */
-static int xway_nand_remove(struct platform_device *pdev)
+static void xway_nand_remove(struct platform_device *pdev)
 {
 	struct xway_nand_data *data = platform_get_drvdata(pdev);
 	struct nand_chip *chip = &data->chip;
@@ -247,8 +247,6 @@ static int xway_nand_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
-
-	return 0;
 }
 
 static const struct of_device_id xway_nand_match[] = {
@@ -258,7 +256,7 @@ static const struct of_device_id xway_nand_match[] = {
 
 static struct platform_driver xway_nand_driver = {
 	.probe	= xway_nand_probe,
-	.remove	= xway_nand_remove,
+	.remove_new = xway_nand_remove,
 	.driver	= {
 		.name		= "lantiq,nand-xway",
 		.of_match_table = xway_nand_match,

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

