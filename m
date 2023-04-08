Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6956DBC76
	for <lists+linux-mips@lfdr.de>; Sat,  8 Apr 2023 20:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjDHSyz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Apr 2023 14:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDHSyy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Apr 2023 14:54:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC4F93C1
        for <linux-mips@vger.kernel.org>; Sat,  8 Apr 2023 11:54:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1plDhE-000534-3V; Sat, 08 Apr 2023 20:53:56 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1plDgs-009t5W-N1; Sat, 08 Apr 2023 20:53:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1plDgr-00BbjC-OH; Sat, 08 Apr 2023 20:53:33 +0200
Date:   Sat, 8 Apr 2023 20:53:32 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lucas Stach <dev@lynxeye.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Miaoqian Lin <linmq006@gmail.com>,
        Stefan Agner <stefan@agner.ch>, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        linux-tegra@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-amlogic@lists.infradead.org,
        Chuanhong Guo <gch981213@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Heiko Stuebner <heiko@sntech.de>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-mediatek@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Jack Wang <jinpu.wang@ionos.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        kernel@pengutronix.de, Arnd Bergmann <arnd@arndb.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Roger Quadros <rogerq@kernel.org>,
        Wang Weiyang <wangweiyang2@huawei.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Han Xu <han.xu@nxp.com>, Chen-Yu Tsai <wens@csie.org>,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christophe Kerello <christophe.kerello@foss.st.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Valentin Korenblit <vkorenblit@sequans.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-renesas-soc@vger.kernel.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        linux-mtd@lists.infradead.org, linux-oxnas@groups.io,
        Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH] mtd: nand: Convert to platform remove callback returning void
Message-ID: <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230407101043.299f5e22@xps-13>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4dc7oddhe3z6p4ux"
Content-Disposition: inline
In-Reply-To: <20230407101043.299f5e22@xps-13>
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


--4dc7oddhe3z6p4ux
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Roger Quadros <rogerq@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---

Hey Miquel,

On Fri, Apr 07, 2023 at 10:10:43AM +0200, Miquel Raynal wrote:
> I've looked at the different patches, they look good to me but as they
> are all trivial and exactly identical, would you mind sending this
> again all squashed in a single patch? A subsystem-wide conversion seems
> appropriate. In all cases I plan to take this for the next merge
> window.

I slightly prefer them separately, because I like small patches and
because the Acks and Reviews only apply to the individual drivers.
But I don't mind seriously, so here comes the series squashed into one.

While going through the changed, probably the s3c24xx driver (which
isn't exactly identical to the other changes) could benefit from an
additional change throwing out the early exit (which---I guess---cannot
be hit).

BTW, I constructed the lists of acks/reviews myself and found the same
set. However b4 wailed about each patch claiming:

	    =E2=9C=97 BADSIG: DKIM/infradead.org

And it didn't like you producing the tags, saying:

	NOTE: some trailers ignored due to from/email mismatches:
	    ! Trailer: Acked-by: Roger Quadros <rogerq@kernel.org>
	     Msg From: Miquel Raynal <miquel.raynal@bootlin.com>
	    [...]

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
@@ -847,13 +847,11 @@ static int mxic_ecc_probe(struct platform_device *pde=
v)
 	return 0;
 }
=20
-static int mxic_ecc_remove(struct platform_device *pdev)
+static void mxic_ecc_remove(struct platform_device *pdev)
 {
 	struct mxic_ecc_engine *mxic =3D platform_get_drvdata(pdev);
=20
 	nand_ecc_unregister_on_host_hw_engine(&mxic->external_engine);
-
-	return 0;
 }
=20
 static const struct of_device_id mxic_ecc_of_ids[] =3D {
@@ -870,7 +868,7 @@ static struct platform_driver mxic_ecc_driver =3D {
 		.of_match_table =3D mxic_ecc_of_ids,
 	},
 	.probe =3D mxic_ecc_probe,
-	.remove	=3D mxic_ecc_remove,
+	.remove_new =3D mxic_ecc_remove,
 };
 module_platform_driver(mxic_ecc_driver);
=20
diff --git a/drivers/mtd/nand/onenand/generic.c b/drivers/mtd/nand/onenand/=
generic.c
index a4b8b65fe15f..4e7de48f07a6 100644
--- a/drivers/mtd/nand/onenand/generic.c
+++ b/drivers/mtd/nand/onenand/generic.c
@@ -85,7 +85,7 @@ static int generic_onenand_probe(struct platform_device *=
pdev)
 	return err;
 }
=20
-static int generic_onenand_remove(struct platform_device *pdev)
+static void generic_onenand_remove(struct platform_device *pdev)
 {
 	struct onenand_info *info =3D platform_get_drvdata(pdev);
 	struct resource *res =3D pdev->resource;
@@ -97,8 +97,6 @@ static int generic_onenand_remove(struct platform_device =
*pdev)
 		iounmap(info->onenand.base);
 		kfree(info);
 	}
-
-	return 0;
 }
=20
 static struct platform_driver generic_onenand_driver =3D {
@@ -106,7 +104,7 @@ static struct platform_driver generic_onenand_driver =
=3D {
 		.name		=3D DRIVER_NAME,
 	},
 	.probe		=3D generic_onenand_probe,
-	.remove		=3D generic_onenand_remove,
+	.remove_new	=3D generic_onenand_remove,
 };
=20
 module_platform_driver(generic_onenand_driver);
diff --git a/drivers/mtd/nand/onenand/onenand_omap2.c b/drivers/mtd/nand/on=
enand/onenand_omap2.c
index 12825eb97938..ff7af98604df 100644
--- a/drivers/mtd/nand/onenand/onenand_omap2.c
+++ b/drivers/mtd/nand/onenand/onenand_omap2.c
@@ -581,7 +581,7 @@ static int omap2_onenand_probe(struct platform_device *=
pdev)
 	return r;
 }
=20
-static int omap2_onenand_remove(struct platform_device *pdev)
+static void omap2_onenand_remove(struct platform_device *pdev)
 {
 	struct omap2_onenand *c =3D dev_get_drvdata(&pdev->dev);
=20
@@ -589,8 +589,6 @@ static int omap2_onenand_remove(struct platform_device =
*pdev)
 	if (c->dma_chan)
 		dma_release_channel(c->dma_chan);
 	omap2_onenand_shutdown(pdev);
-
-	return 0;
 }
=20
 static const struct of_device_id omap2_onenand_id_table[] =3D {
@@ -601,7 +599,7 @@ MODULE_DEVICE_TABLE(of, omap2_onenand_id_table);
=20
 static struct platform_driver omap2_onenand_driver =3D {
 	.probe		=3D omap2_onenand_probe,
-	.remove		=3D omap2_onenand_remove,
+	.remove_new	=3D omap2_onenand_remove,
 	.shutdown	=3D omap2_onenand_shutdown,
 	.driver		=3D {
 		.name	=3D DRIVER_NAME,
diff --git a/drivers/mtd/nand/onenand/onenand_samsung.c b/drivers/mtd/nand/=
onenand/onenand_samsung.c
index b64895573515..92151aa52964 100644
--- a/drivers/mtd/nand/onenand/onenand_samsung.c
+++ b/drivers/mtd/nand/onenand/onenand_samsung.c
@@ -943,13 +943,11 @@ static int s3c_onenand_probe(struct platform_device *=
pdev)
 	return 0;
 }
=20
-static int s3c_onenand_remove(struct platform_device *pdev)
+static void s3c_onenand_remove(struct platform_device *pdev)
 {
 	struct mtd_info *mtd =3D platform_get_drvdata(pdev);
=20
 	onenand_release(mtd);
-
-	return 0;
 }
=20
 static int s3c_pm_ops_suspend(struct device *dev)
@@ -996,7 +994,7 @@ static struct platform_driver s3c_onenand_driver =3D {
 	},
 	.id_table	=3D s3c_onenand_driver_ids,
 	.probe          =3D s3c_onenand_probe,
-	.remove         =3D s3c_onenand_remove,
+	.remove_new     =3D s3c_onenand_remove,
 };
=20
 module_platform_driver(s3c_onenand_driver);
diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-de=
lta.c
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
 	struct gpio_nand *priv =3D platform_get_drvdata(pdev);
 	struct mtd_info *mtd =3D nand_to_mtd(&priv->nand_chip);
@@ -410,8 +410,6 @@ static int gpio_nand_remove(struct platform_device *pde=
v)
 	ret =3D mtd_device_unregister(mtd);
 	WARN_ON(ret);
 	nand_cleanup(mtd_to_nand(mtd));
-
-	return 0;
 }
=20
 #ifdef CONFIG_OF
@@ -434,7 +432,7 @@ MODULE_DEVICE_TABLE(platform, gpio_nand_plat_id_table);
=20
 static struct platform_driver gpio_nand_driver =3D {
 	.probe		=3D gpio_nand_probe,
-	.remove		=3D gpio_nand_remove,
+	.remove_new	=3D gpio_nand_remove,
 	.id_table	=3D gpio_nand_plat_id_table,
 	.driver		=3D {
 		.name	=3D "ams-delta-nand",
diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/na=
nd/raw/arasan-nand-controller.c
index ec7e6eeac55f..d513d2db3549 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1496,7 +1496,7 @@ static int anfc_probe(struct platform_device *pdev)
 	return ret;
 }
=20
-static int anfc_remove(struct platform_device *pdev)
+static void anfc_remove(struct platform_device *pdev)
 {
 	struct arasan_nfc *nfc =3D platform_get_drvdata(pdev);
=20
@@ -1504,8 +1504,6 @@ static int anfc_remove(struct platform_device *pdev)
=20
 	clk_disable_unprepare(nfc->bus_clk);
 	clk_disable_unprepare(nfc->controller_clk);
-
-	return 0;
 }
=20
 static const struct of_device_id anfc_ids[] =3D {
@@ -1525,7 +1523,7 @@ static struct platform_driver anfc_driver =3D {
 		.of_match_table =3D anfc_ids,
 	},
 	.probe =3D anfc_probe,
-	.remove =3D anfc_remove,
+	.remove_new =3D anfc_remove,
 };
 module_platform_driver(anfc_driver);
=20
diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nan=
d/raw/atmel/nand-controller.c
index 41c6bd6e2d72..81e3d682a8cd 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -2626,13 +2626,11 @@ static int atmel_nand_controller_probe(struct platf=
orm_device *pdev)
 	return caps->ops->probe(pdev, caps);
 }
=20
-static int atmel_nand_controller_remove(struct platform_device *pdev)
+static void atmel_nand_controller_remove(struct platform_device *pdev)
 {
 	struct atmel_nand_controller *nc =3D platform_get_drvdata(pdev);
=20
 	WARN_ON(nc->caps->ops->remove(nc));
-
-	return 0;
 }
=20
 static __maybe_unused int atmel_nand_controller_resume(struct device *dev)
@@ -2663,7 +2661,7 @@ static struct platform_driver atmel_nand_controller_d=
river =3D {
 		.pm =3D &atmel_nand_controller_pm_ops,
 	},
 	.probe =3D atmel_nand_controller_probe,
-	.remove =3D atmel_nand_controller_remove,
+	.remove_new =3D atmel_nand_controller_remove,
 };
 module_platform_driver(atmel_nand_controller_driver);
=20
diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550n=
d.c
index 5aa3a06d740c..063a5e0b8d4b 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -337,7 +337,7 @@ static int au1550nd_probe(struct platform_device *pdev)
 	return ret;
 }
=20
-static int au1550nd_remove(struct platform_device *pdev)
+static void au1550nd_remove(struct platform_device *pdev)
 {
 	struct au1550nd_ctx *ctx =3D platform_get_drvdata(pdev);
 	struct resource *r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -350,7 +350,6 @@ static int au1550nd_remove(struct platform_device *pdev)
 	iounmap(ctx->base);
 	release_mem_region(r->start, 0x1000);
 	kfree(ctx);
-	return 0;
 }
=20
 static struct platform_driver au1550nd_driver =3D {
@@ -358,7 +357,7 @@ static struct platform_driver au1550nd_driver =3D {
 		.name	=3D "au1550-nand",
 	},
 	.probe		=3D au1550nd_probe,
-	.remove		=3D au1550nd_remove,
+	.remove_new	=3D au1550nd_remove,
 };
=20
 module_platform_driver(au1550nd_driver);
diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/main.c b/drivers/mtd/nand/r=
aw/bcm47xxnflash/main.c
index dcc70d9dc6e5..ebcf508e0606 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
@@ -57,7 +57,7 @@ static int bcm47xxnflash_probe(struct platform_device *pd=
ev)
 	return 0;
 }
=20
-static int bcm47xxnflash_remove(struct platform_device *pdev)
+static void bcm47xxnflash_remove(struct platform_device *pdev)
 {
 	struct bcm47xxnflash *nflash =3D platform_get_drvdata(pdev);
 	struct nand_chip *chip =3D &nflash->nand_chip;
@@ -66,13 +66,11 @@ static int bcm47xxnflash_remove(struct platform_device =
*pdev)
 	ret =3D mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
-
-	return 0;
 }
=20
 static struct platform_driver bcm47xxnflash_driver =3D {
 	.probe	=3D bcm47xxnflash_probe,
-	.remove =3D bcm47xxnflash_remove,
+	.remove_new =3D bcm47xxnflash_remove,
 	.driver =3D {
 		.name =3D "bcma_nflash",
 	},
diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/n=
and/raw/cadence-nand-controller.c
index 7661a5cf1883..034ec564c2ed 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -3055,18 +3055,16 @@ static int cadence_nand_dt_probe(struct platform_de=
vice *ofdev)
 	return 0;
 }
=20
-static int cadence_nand_dt_remove(struct platform_device *ofdev)
+static void cadence_nand_dt_remove(struct platform_device *ofdev)
 {
 	struct cadence_nand_dt *dt =3D platform_get_drvdata(ofdev);
=20
 	cadence_nand_remove(&dt->cdns_ctrl);
-
-	return 0;
 }
=20
 static struct platform_driver cadence_nand_dt_driver =3D {
 	.probe		=3D cadence_nand_dt_probe,
-	.remove		=3D cadence_nand_dt_remove,
+	.remove_new	=3D cadence_nand_dt_remove,
 	.driver		=3D {
 		.name	=3D "cadence-nand-controller",
 		.of_match_table =3D cadence_nand_dt_ids,
diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/dav=
inci_nand.c
index 3e98e3c255bf..415d6aaa8255 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -821,7 +821,7 @@ static int nand_davinci_probe(struct platform_device *p=
dev)
 	return ret;
 }
=20
-static int nand_davinci_remove(struct platform_device *pdev)
+static void nand_davinci_remove(struct platform_device *pdev)
 {
 	struct davinci_nand_info *info =3D platform_get_drvdata(pdev);
 	struct nand_chip *chip =3D &info->chip;
@@ -835,13 +835,11 @@ static int nand_davinci_remove(struct platform_device=
 *pdev)
 	ret =3D mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
-
-	return 0;
 }
=20
 static struct platform_driver nand_davinci_driver =3D {
 	.probe		=3D nand_davinci_probe,
-	.remove		=3D nand_davinci_remove,
+	.remove_new	=3D nand_davinci_remove,
 	.driver		=3D {
 		.name	=3D "davinci_nand",
 		.of_match_table =3D of_match_ptr(davinci_nand_of_match),
diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali=
_dt.c
index 8513bb9fcfcc..915047e3fbc2 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -233,7 +233,7 @@ static int denali_dt_probe(struct platform_device *pdev)
 	return ret;
 }
=20
-static int denali_dt_remove(struct platform_device *pdev)
+static void denali_dt_remove(struct platform_device *pdev)
 {
 	struct denali_dt *dt =3D platform_get_drvdata(pdev);
=20
@@ -243,13 +243,11 @@ static int denali_dt_remove(struct platform_device *p=
dev)
 	clk_disable_unprepare(dt->clk_ecc);
 	clk_disable_unprepare(dt->clk_x);
 	clk_disable_unprepare(dt->clk);
-
-	return 0;
 }
=20
 static struct platform_driver denali_dt_driver =3D {
 	.probe		=3D denali_dt_probe,
-	.remove		=3D denali_dt_remove,
+	.remove_new	=3D denali_dt_remove,
 	.driver		=3D {
 		.name	=3D "denali-nand-dt",
 		.of_match_table	=3D denali_nand_dt_ids,
diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fs=
l_elbc_nand.c
index e25119e58b69..1e3a80f06f33 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -963,7 +963,7 @@ static int fsl_elbc_nand_probe(struct platform_device *=
pdev)
 	return ret;
 }
=20
-static int fsl_elbc_nand_remove(struct platform_device *pdev)
+static void fsl_elbc_nand_remove(struct platform_device *pdev)
 {
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl =3D fsl_lbc_ctrl_dev->nand;
 	struct fsl_elbc_mtd *priv =3D dev_get_drvdata(&pdev->dev);
@@ -984,8 +984,6 @@ static int fsl_elbc_nand_remove(struct platform_device =
*pdev)
 	}
 	mutex_unlock(&fsl_elbc_nand_mutex);
=20
-	return 0;
-
 }
=20
 static const struct of_device_id fsl_elbc_nand_match[] =3D {
@@ -1000,7 +998,7 @@ static struct platform_driver fsl_elbc_nand_driver =3D=
 {
 		.of_match_table =3D fsl_elbc_nand_match,
 	},
 	.probe =3D fsl_elbc_nand_probe,
-	.remove =3D fsl_elbc_nand_remove,
+	.remove_new =3D fsl_elbc_nand_remove,
 };
=20
 module_platform_driver(fsl_elbc_nand_driver);
diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl=
_ifc_nand.c
index 02d500176838..fa537fee6701 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -1094,7 +1094,7 @@ static int fsl_ifc_nand_probe(struct platform_device =
*dev)
 	return ret;
 }
=20
-static int fsl_ifc_nand_remove(struct platform_device *dev)
+static void fsl_ifc_nand_remove(struct platform_device *dev)
 {
 	struct fsl_ifc_mtd *priv =3D dev_get_drvdata(&dev->dev);
 	struct nand_chip *chip =3D &priv->chip;
@@ -1113,8 +1113,6 @@ static int fsl_ifc_nand_remove(struct platform_device=
 *dev)
 		kfree(ifc_nand_ctrl);
 	}
 	mutex_unlock(&fsl_ifc_nand_mutex);
-
-	return 0;
 }
=20
 static const struct of_device_id fsl_ifc_nand_match[] =3D {
@@ -1131,7 +1129,7 @@ static struct platform_driver fsl_ifc_nand_driver =3D=
 {
 		.of_match_table =3D fsl_ifc_nand_match,
 	},
 	.probe       =3D fsl_ifc_nand_probe,
-	.remove      =3D fsl_ifc_nand_remove,
+	.remove_new  =3D fsl_ifc_nand_remove,
 };
=20
 module_platform_driver(fsl_ifc_nand_driver);
diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index b3cc427100a2..086426139173 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -235,7 +235,7 @@ static int fun_probe(struct platform_device *ofdev)
 	return 0;
 }
=20
-static int fun_remove(struct platform_device *ofdev)
+static void fun_remove(struct platform_device *ofdev)
 {
 	struct fsl_upm_nand *fun =3D dev_get_drvdata(&ofdev->dev);
 	struct nand_chip *chip =3D &fun->chip;
@@ -245,8 +245,6 @@ static int fun_remove(struct platform_device *ofdev)
 	ret =3D mtd_device_unregister(mtd);
 	WARN_ON(ret);
 	nand_cleanup(chip);
-
-	return 0;
 }
=20
 static const struct of_device_id of_fun_match[] =3D {
@@ -261,7 +259,7 @@ static struct platform_driver of_fun_driver =3D {
 		.of_match_table =3D of_fun_match,
 	},
 	.probe		=3D fun_probe,
-	.remove		=3D fun_remove,
+	.remove_new	=3D fun_remove,
 };
=20
 module_platform_driver(of_fun_driver);
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_n=
and.c
index 6b2bda815b88..d57867089079 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1165,7 +1165,7 @@ static int __init fsmc_nand_probe(struct platform_dev=
ice *pdev)
 /*
  * Clean up routine
  */
-static int fsmc_nand_remove(struct platform_device *pdev)
+static void fsmc_nand_remove(struct platform_device *pdev)
 {
 	struct fsmc_nand_data *host =3D platform_get_drvdata(pdev);
=20
@@ -1184,8 +1184,6 @@ static int fsmc_nand_remove(struct platform_device *p=
dev)
 		}
 		clk_disable_unprepare(host->clk);
 	}
-
-	return 0;
 }
=20
 #ifdef CONFIG_PM_SLEEP
@@ -1224,7 +1222,7 @@ static const struct of_device_id fsmc_nand_id_table[]=
 =3D {
 MODULE_DEVICE_TABLE(of, fsmc_nand_id_table);
=20
 static struct platform_driver fsmc_nand_driver =3D {
-	.remove =3D fsmc_nand_remove,
+	.remove_new =3D fsmc_nand_remove,
 	.driver =3D {
 		.name =3D "fsmc-nand",
 		.of_match_table =3D fsmc_nand_id_table,
diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index dcf28cff760d..d6cc2cb65214 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -265,7 +265,7 @@ gpio_nand_get_io_sync(struct platform_device *pdev)
 	return platform_get_resource(pdev, IORESOURCE_MEM, 1);
 }
=20
-static int gpio_nand_remove(struct platform_device *pdev)
+static void gpio_nand_remove(struct platform_device *pdev)
 {
 	struct gpiomtd *gpiomtd =3D platform_get_drvdata(pdev);
 	struct nand_chip *chip =3D &gpiomtd->nand_chip;
@@ -280,8 +280,6 @@ static int gpio_nand_remove(struct platform_device *pde=
v)
 		gpiod_set_value(gpiomtd->nwp, 0);
 	if (gpiomtd->nce && !IS_ERR(gpiomtd->nce))
 		gpiod_set_value(gpiomtd->nce, 0);
-
-	return 0;
 }
=20
 static int gpio_nand_probe(struct platform_device *pdev)
@@ -394,7 +392,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
=20
 static struct platform_driver gpio_nand_driver =3D {
 	.probe		=3D gpio_nand_probe,
-	.remove		=3D gpio_nand_remove,
+	.remove_new	=3D gpio_nand_remove,
 	.driver		=3D {
 		.name	=3D "gpio-nand",
 		.of_match_table =3D of_match_ptr(gpio_nand_id_table),
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
raw/gpmi-nand/gpmi-nand.c
index ada83344b0f9..500e7a28d2e4 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2777,7 +2777,7 @@ static int gpmi_nand_probe(struct platform_device *pd=
ev)
 	return ret;
 }
=20
-static int gpmi_nand_remove(struct platform_device *pdev)
+static void gpmi_nand_remove(struct platform_device *pdev)
 {
 	struct gpmi_nand_data *this =3D platform_get_drvdata(pdev);
 	struct nand_chip *chip =3D &this->nand;
@@ -2791,7 +2791,6 @@ static int gpmi_nand_remove(struct platform_device *p=
dev)
 	nand_cleanup(chip);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
-	return 0;
 }
=20
 #ifdef CONFIG_PM_SLEEP
@@ -2860,7 +2859,7 @@ static struct platform_driver gpmi_nand_driver =3D {
 		.of_match_table =3D gpmi_nand_id_table,
 	},
 	.probe   =3D gpmi_nand_probe,
-	.remove  =3D gpmi_nand_remove,
+	.remove_new =3D gpmi_nand_remove,
 };
 module_platform_driver(gpmi_nand_driver);
=20
diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/his=
i504_nand.c
index c74f6b2192fc..fe291a2e5c77 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -798,7 +798,7 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	return 0;
 }
=20
-static int hisi_nfc_remove(struct platform_device *pdev)
+static void hisi_nfc_remove(struct platform_device *pdev)
 {
 	struct hinfc_host *host =3D platform_get_drvdata(pdev);
 	struct nand_chip *chip =3D &host->chip;
@@ -807,8 +807,6 @@ static int hisi_nfc_remove(struct platform_device *pdev)
 	ret =3D mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
-
-	return 0;
 }
=20
 #ifdef CONFIG_PM_SLEEP
@@ -860,7 +858,7 @@ static struct platform_driver hisi_nfc_driver =3D {
 		.pm =3D &hisi_nfc_pm_ops,
 	},
 	.probe		=3D hisi_nfc_probe,
-	.remove		=3D hisi_nfc_remove,
+	.remove_new	=3D hisi_nfc_remove,
 };
=20
 module_platform_driver(hisi_nfc_driver);
diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/=
nand/raw/ingenic/ingenic_nand_drv.c
index ff26c10f295d..b9f135297aa0 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -522,7 +522,7 @@ static int ingenic_nand_probe(struct platform_device *p=
dev)
 	return 0;
 }
=20
-static int ingenic_nand_remove(struct platform_device *pdev)
+static void ingenic_nand_remove(struct platform_device *pdev)
 {
 	struct ingenic_nfc *nfc =3D platform_get_drvdata(pdev);
=20
@@ -530,8 +530,6 @@ static int ingenic_nand_remove(struct platform_device *=
pdev)
 		ingenic_ecc_release(nfc->ecc);
=20
 	ingenic_nand_cleanup_chips(nfc);
-
-	return 0;
 }
=20
 static const struct jz_soc_info jz4740_soc_info =3D {
@@ -564,7 +562,7 @@ MODULE_DEVICE_TABLE(of, ingenic_nand_dt_match);
=20
 static struct platform_driver ingenic_nand_driver =3D {
 	.probe		=3D ingenic_nand_probe,
-	.remove		=3D ingenic_nand_remove,
+	.remove_new	=3D ingenic_nand_remove,
 	.driver	=3D {
 		.name	=3D DRV_NAME,
 		.of_match_table =3D ingenic_nand_dt_match,
diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nan=
d/raw/intel-nand-controller.c
index 6f4cea81f97c..a9909eb08124 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -706,7 +706,7 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	return ret;
 }
=20
-static int ebu_nand_remove(struct platform_device *pdev)
+static void ebu_nand_remove(struct platform_device *pdev)
 {
 	struct ebu_nand_controller *ebu_host =3D platform_get_drvdata(pdev);
 	int ret;
@@ -717,8 +717,6 @@ static int ebu_nand_remove(struct platform_device *pdev)
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
 	clk_disable_unprepare(ebu_host->clk);
-
-	return 0;
 }
=20
 static const struct of_device_id ebu_nand_match[] =3D {
@@ -729,7 +727,7 @@ MODULE_DEVICE_TABLE(of, ebu_nand_match);
=20
 static struct platform_driver ebu_nand_driver =3D {
 	.probe =3D ebu_nand_probe,
-	.remove =3D ebu_nand_remove,
+	.remove_new =3D ebu_nand_remove,
 	.driver =3D {
 		.name =3D "intel-nand-controller",
 		.of_match_table =3D ebu_nand_match,
diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc3=
2xx_mlc.c
index ae7f6429a5f6..b3136ae6f4e9 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -827,7 +827,7 @@ static int lpc32xx_nand_probe(struct platform_device *p=
dev)
 /*
  * Remove NAND device
  */
-static int lpc32xx_nand_remove(struct platform_device *pdev)
+static void lpc32xx_nand_remove(struct platform_device *pdev)
 {
 	struct lpc32xx_nand_host *host =3D platform_get_drvdata(pdev);
 	struct nand_chip *chip =3D &host->nand_chip;
@@ -846,8 +846,6 @@ static int lpc32xx_nand_remove(struct platform_device *=
pdev)
=20
 	lpc32xx_wp_enable(host);
 	gpiod_put(host->wp_gpio);
-
-	return 0;
 }
=20
 static int lpc32xx_nand_resume(struct platform_device *pdev)
@@ -889,7 +887,7 @@ MODULE_DEVICE_TABLE(of, lpc32xx_nand_match);
=20
 static struct platform_driver lpc32xx_nand_driver =3D {
 	.probe		=3D lpc32xx_nand_probe,
-	.remove		=3D lpc32xx_nand_remove,
+	.remove_new	=3D lpc32xx_nand_remove,
 	.resume		=3D pm_ptr(lpc32xx_nand_resume),
 	.suspend	=3D pm_ptr(lpc32xx_nand_suspend),
 	.driver		=3D {
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc3=
2xx_slc.c
index 6918737346c9..3139b6107660 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -946,7 +946,7 @@ static int lpc32xx_nand_probe(struct platform_device *p=
dev)
 /*
  * Remove NAND device.
  */
-static int lpc32xx_nand_remove(struct platform_device *pdev)
+static void lpc32xx_nand_remove(struct platform_device *pdev)
 {
 	uint32_t tmp;
 	struct lpc32xx_nand_host *host =3D platform_get_drvdata(pdev);
@@ -965,8 +965,6 @@ static int lpc32xx_nand_remove(struct platform_device *=
pdev)
=20
 	clk_disable_unprepare(host->clk);
 	lpc32xx_wp_enable(host);
-
-	return 0;
 }
=20
 static int lpc32xx_nand_resume(struct platform_device *pdev)
@@ -1015,7 +1013,7 @@ MODULE_DEVICE_TABLE(of, lpc32xx_nand_match);
=20
 static struct platform_driver lpc32xx_nand_driver =3D {
 	.probe		=3D lpc32xx_nand_probe,
-	.remove		=3D lpc32xx_nand_remove,
+	.remove_new	=3D lpc32xx_nand_remove,
 	.resume		=3D pm_ptr(lpc32xx_nand_resume),
 	.suspend	=3D pm_ptr(lpc32xx_nand_suspend),
 	.driver		=3D {
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/mar=
vell_nand.c
index 3034916d2e25..afb424579f0b 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -3004,7 +3004,7 @@ static int marvell_nfc_probe(struct platform_device *=
pdev)
 	return ret;
 }
=20
-static int marvell_nfc_remove(struct platform_device *pdev)
+static void marvell_nfc_remove(struct platform_device *pdev)
 {
 	struct marvell_nfc *nfc =3D platform_get_drvdata(pdev);
=20
@@ -3017,8 +3017,6 @@ static int marvell_nfc_remove(struct platform_device =
*pdev)
=20
 	clk_disable_unprepare(nfc->reg_clk);
 	clk_disable_unprepare(nfc->core_clk);
-
-	return 0;
 }
=20
 static int __maybe_unused marvell_nfc_suspend(struct device *dev)
@@ -3154,7 +3152,7 @@ static struct platform_driver marvell_nfc_driver =3D {
 	},
 	.id_table =3D marvell_nfc_platform_ids,
 	.probe =3D marvell_nfc_probe,
-	.remove	=3D marvell_nfc_remove,
+	.remove_new =3D marvell_nfc_remove,
 };
 module_platform_driver(marvell_nfc_driver);
=20
diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson=
_nand.c
index 5ee01231ac4c..24f1ad025cda 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1434,20 +1434,18 @@ static int meson_nfc_probe(struct platform_device *=
pdev)
 	return ret;
 }
=20
-static int meson_nfc_remove(struct platform_device *pdev)
+static void meson_nfc_remove(struct platform_device *pdev)
 {
 	struct meson_nfc *nfc =3D platform_get_drvdata(pdev);
=20
 	meson_nfc_nand_chip_cleanup(nfc);
=20
 	meson_nfc_disable_clk(nfc);
-
-	return 0;
 }
=20
 static struct platform_driver meson_nfc_driver =3D {
 	.probe  =3D meson_nfc_probe,
-	.remove =3D meson_nfc_remove,
+	.remove_new =3D meson_nfc_remove,
 	.driver =3D {
 		.name  =3D "meson-nand",
 		.of_match_table =3D meson_nfc_id_table,
diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5=
121_nfc.c
index f68349cb7824..ab05ee65702c 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -822,7 +822,7 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	return retval;
 }
=20
-static int mpc5121_nfc_remove(struct platform_device *op)
+static void mpc5121_nfc_remove(struct platform_device *op)
 {
 	struct device *dev =3D &op->dev;
 	struct mtd_info *mtd =3D dev_get_drvdata(dev);
@@ -832,8 +832,6 @@ static int mpc5121_nfc_remove(struct platform_device *o=
p)
 	WARN_ON(ret);
 	nand_cleanup(mtd_to_nand(mtd));
 	mpc5121_nfc_free(dev, mtd);
-
-	return 0;
 }
=20
 static const struct of_device_id mpc5121_nfc_match[] =3D {
@@ -844,7 +842,7 @@ MODULE_DEVICE_TABLE(of, mpc5121_nfc_match);
=20
 static struct platform_driver mpc5121_nfc_driver =3D {
 	.probe		=3D mpc5121_nfc_probe,
-	.remove		=3D mpc5121_nfc_remove,
+	.remove_new	=3D mpc5121_nfc_remove,
 	.driver		=3D {
 		.name =3D DRV_NAME,
 		.of_match_table =3D mpc5121_nfc_match,
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nan=
d.c
index d540454cbbdf..b2fa6b2074ab 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1601,7 +1601,7 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	return ret;
 }
=20
-static int mtk_nfc_remove(struct platform_device *pdev)
+static void mtk_nfc_remove(struct platform_device *pdev)
 {
 	struct mtk_nfc *nfc =3D platform_get_drvdata(pdev);
 	struct mtk_nfc_nand_chip *mtk_chip;
@@ -1620,8 +1620,6 @@ static int mtk_nfc_remove(struct platform_device *pde=
v)
=20
 	mtk_ecc_release(nfc->ecc);
 	mtk_nfc_disable_clk(&nfc->clk);
-
-	return 0;
 }
=20
 #ifdef CONFIG_PM_SLEEP
@@ -1663,7 +1661,7 @@ static SIMPLE_DEV_PM_OPS(mtk_nfc_pm_ops, mtk_nfc_susp=
end, mtk_nfc_resume);
=20
 static struct platform_driver mtk_nfc_driver =3D {
 	.probe  =3D mtk_nfc_probe,
-	.remove =3D mtk_nfc_remove,
+	.remove_new =3D mtk_nfc_remove,
 	.driver =3D {
 		.name  =3D MTK_NAME,
 		.of_match_table =3D mtk_nfc_id_table,
diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nan=
d.c
index f6c96341b896..56c1046cc073 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1831,7 +1831,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 	return err;
 }
=20
-static int mxcnd_remove(struct platform_device *pdev)
+static void mxcnd_remove(struct platform_device *pdev)
 {
 	struct mxc_nand_host *host =3D platform_get_drvdata(pdev);
 	struct nand_chip *chip =3D &host->nand;
@@ -1842,8 +1842,6 @@ static int mxcnd_remove(struct platform_device *pdev)
 	nand_cleanup(chip);
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
-
-	return 0;
 }
=20
 static struct platform_driver mxcnd_driver =3D {
@@ -1852,7 +1850,7 @@ static struct platform_driver mxcnd_driver =3D {
 		   .of_match_table =3D mxcnd_dt_ids,
 	},
 	.probe =3D mxcnd_probe,
-	.remove =3D mxcnd_remove,
+	.remove_new =3D mxcnd_remove,
 };
 module_platform_driver(mxcnd_driver);
=20
diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_n=
and.c
index da1070993994..be8050e84b4f 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -553,7 +553,7 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	return err;
 }
=20
-static int mxic_nfc_remove(struct platform_device *pdev)
+static void mxic_nfc_remove(struct platform_device *pdev)
 {
 	struct mxic_nand_ctlr *nfc =3D platform_get_drvdata(pdev);
 	struct nand_chip *chip =3D &nfc->chip;
@@ -564,7 +564,6 @@ static int mxic_nfc_remove(struct platform_device *pdev)
 	nand_cleanup(chip);
=20
 	mxic_nfc_clk_disable(nfc);
-	return 0;
 }
=20
 static const struct of_device_id mxic_nfc_of_ids[] =3D {
@@ -575,7 +574,7 @@ MODULE_DEVICE_TABLE(of, mxic_nfc_of_ids);
=20
 static struct platform_driver mxic_nfc_driver =3D {
 	.probe =3D mxic_nfc_probe,
-	.remove =3D mxic_nfc_remove,
+	.remove_new =3D mxic_nfc_remove,
 	.driver =3D {
 		.name =3D "mxic-nfc",
 		.of_match_table =3D mxic_nfc_of_ids,
diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index 338d6b1a189e..57f3db32122d 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -240,7 +240,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	return 0;
 }
=20
-static int ndfc_remove(struct platform_device *ofdev)
+static void ndfc_remove(struct platform_device *ofdev)
 {
 	struct ndfc_controller *ndfc =3D dev_get_drvdata(&ofdev->dev);
 	struct nand_chip *chip =3D &ndfc->chip;
@@ -251,8 +251,6 @@ static int ndfc_remove(struct platform_device *ofdev)
 	WARN_ON(ret);
 	nand_cleanup(chip);
 	kfree(mtd->name);
-
-	return 0;
 }
=20
 static const struct of_device_id ndfc_match[] =3D {
@@ -267,7 +265,7 @@ static struct platform_driver ndfc_driver =3D {
 		.of_match_table =3D ndfc_match,
 	},
 	.probe =3D ndfc_probe,
-	.remove =3D ndfc_remove,
+	.remove_new =3D ndfc_remove,
 };
=20
 module_platform_driver(ndfc_driver);
diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 4a9f2b6c772d..db22b3af16d8 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -2273,7 +2273,7 @@ static int omap_nand_probe(struct platform_device *pd=
ev)
 	return err;
 }
=20
-static int omap_nand_remove(struct platform_device *pdev)
+static void omap_nand_remove(struct platform_device *pdev)
 {
 	struct mtd_info *mtd =3D platform_get_drvdata(pdev);
 	struct nand_chip *nand_chip =3D mtd_to_nand(mtd);
@@ -2285,7 +2285,6 @@ static int omap_nand_remove(struct platform_device *p=
dev)
 		dma_release_channel(info->dma);
 	WARN_ON(mtd_device_unregister(mtd));
 	nand_cleanup(nand_chip);
-	return 0;
 }
=20
 /* omap_nand_ids defined in linux/platform_data/mtd-nand-omap2.h */
@@ -2293,7 +2292,7 @@ MODULE_DEVICE_TABLE(of, omap_nand_ids);
=20
 static struct platform_driver omap_nand_driver =3D {
 	.probe		=3D omap_nand_probe,
-	.remove		=3D omap_nand_remove,
+	.remove_new	=3D omap_nand_remove,
 	.driver		=3D {
 		.name	=3D DRIVER_NAME,
 		.of_match_table =3D omap_nand_ids,
diff --git a/drivers/mtd/nand/raw/omap_elm.c b/drivers/mtd/nand/raw/omap_el=
m.c
index 4796a48e1012..6e1eac6644a6 100644
--- a/drivers/mtd/nand/raw/omap_elm.c
+++ b/drivers/mtd/nand/raw/omap_elm.c
@@ -422,11 +422,10 @@ static int elm_probe(struct platform_device *pdev)
 	return ret;
 }
=20
-static int elm_remove(struct platform_device *pdev)
+static void elm_remove(struct platform_device *pdev)
 {
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
=20
 #ifdef CONFIG_PM_SLEEP
@@ -561,7 +560,7 @@ static struct platform_driver elm_driver =3D {
 		.pm	=3D &elm_pm_ops,
 	},
 	.probe	=3D elm_probe,
-	.remove	=3D elm_remove,
+	.remove_new =3D elm_remove,
 };
=20
 module_platform_driver(elm_driver);
diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion=
_nand.c
index 1bfecf502216..39a6c6360588 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -207,7 +207,7 @@ static int __init orion_nand_probe(struct platform_devi=
ce *pdev)
 	return ret;
 }
=20
-static int orion_nand_remove(struct platform_device *pdev)
+static void orion_nand_remove(struct platform_device *pdev)
 {
 	struct orion_nand_info *info =3D platform_get_drvdata(pdev);
 	struct nand_chip *chip =3D &info->chip;
@@ -219,8 +219,6 @@ static int orion_nand_remove(struct platform_device *pd=
ev)
 	nand_cleanup(chip);
=20
 	clk_disable_unprepare(info->clk);
-
-	return 0;
 }
=20
 #ifdef CONFIG_OF
@@ -232,7 +230,7 @@ MODULE_DEVICE_TABLE(of, orion_nand_of_match_table);
 #endif
=20
 static struct platform_driver orion_nand_driver =3D {
-	.remove		=3D orion_nand_remove,
+	.remove_new	=3D orion_nand_remove,
 	.driver		=3D {
 		.name	=3D "orion_nand",
 		.of_match_table =3D of_match_ptr(orion_nand_of_match_table),
diff --git a/drivers/mtd/nand/raw/oxnas_nand.c b/drivers/mtd/nand/raw/oxnas=
_nand.c
index cd112d45e0b5..e3c9807df1cd 100644
--- a/drivers/mtd/nand/raw/oxnas_nand.c
+++ b/drivers/mtd/nand/raw/oxnas_nand.c
@@ -171,7 +171,7 @@ static int oxnas_nand_probe(struct platform_device *pde=
v)
 	return err;
 }
=20
-static int oxnas_nand_remove(struct platform_device *pdev)
+static void oxnas_nand_remove(struct platform_device *pdev)
 {
 	struct oxnas_nand_ctrl *oxnas =3D platform_get_drvdata(pdev);
 	struct nand_chip *chip;
@@ -184,8 +184,6 @@ static int oxnas_nand_remove(struct platform_device *pd=
ev)
 	}
=20
 	clk_disable_unprepare(oxnas->clk);
-
-	return 0;
 }
=20
 static const struct of_device_id oxnas_nand_match[] =3D {
@@ -196,7 +194,7 @@ MODULE_DEVICE_TABLE(of, oxnas_nand_match);
=20
 static struct platform_driver oxnas_nand_driver =3D {
 	.probe	=3D oxnas_nand_probe,
-	.remove	=3D oxnas_nand_remove,
+	.remove_new =3D oxnas_nand_remove,
 	.driver	=3D {
 		.name		=3D "oxnas_nand",
 		.of_match_table =3D oxnas_nand_match,
diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pase=
mi_nand.c
index f7ef6ca06ca9..19b2c9d25863 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -197,7 +197,7 @@ static int pasemi_nand_probe(struct platform_device *of=
dev)
 	return err;
 }
=20
-static int pasemi_nand_remove(struct platform_device *ofdev)
+static void pasemi_nand_remove(struct platform_device *ofdev)
 {
 	struct pasemi_ddata *ddata =3D platform_get_drvdata(ofdev);
 	struct mtd_info *pasemi_nand_mtd;
@@ -218,8 +218,6 @@ static int pasemi_nand_remove(struct platform_device *o=
fdev)
=20
 	/* Free the MTD device structure */
 	kfree(ddata);
-
-	return 0;
 }
=20
 static const struct of_device_id pasemi_nand_match[] =3D
@@ -239,7 +237,7 @@ static struct platform_driver pasemi_nand_driver =3D
 		.of_match_table =3D pasemi_nand_match,
 	},
 	.probe		=3D pasemi_nand_probe,
-	.remove		=3D pasemi_nand_remove,
+	.remove_new	=3D pasemi_nand_remove,
 };
=20
 module_platform_driver(pasemi_nand_driver);
diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nan=
d/raw/pl35x-nand-controller.c
index 3c6f6aff649f..28b7bd7e22eb 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1163,13 +1163,11 @@ static int pl35x_nand_probe(struct platform_device =
*pdev)
 	return 0;
 }
=20
-static int pl35x_nand_remove(struct platform_device *pdev)
+static void pl35x_nand_remove(struct platform_device *pdev)
 {
 	struct pl35x_nandc *nfc =3D platform_get_drvdata(pdev);
=20
 	pl35x_nand_chips_cleanup(nfc);
-
-	return 0;
 }
=20
 static const struct of_device_id pl35x_nand_of_match[] =3D {
@@ -1180,7 +1178,7 @@ MODULE_DEVICE_TABLE(of, pl35x_nand_of_match);
=20
 static struct platform_driver pl35x_nandc_driver =3D {
 	.probe =3D pl35x_nand_probe,
-	.remove	=3D pl35x_nand_remove,
+	.remove_new =3D pl35x_nand_remove,
 	.driver =3D {
 		.name =3D PL35X_NANDC_DRIVER_NAME,
 		.of_match_table =3D pl35x_nand_of_match,
diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_n=
and.c
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
 	struct plat_nand_data *data =3D platform_get_drvdata(pdev);
 	struct platform_nand_data *pdata =3D dev_get_platdata(&pdev->dev);
@@ -134,8 +134,6 @@ static int plat_nand_remove(struct platform_device *pde=
v)
 	nand_cleanup(chip);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
-
-	return 0;
 }
=20
 static const struct of_device_id plat_nand_match[] =3D {
@@ -146,7 +144,7 @@ MODULE_DEVICE_TABLE(of, plat_nand_match);
=20
 static struct platform_driver plat_nand_driver =3D {
 	.probe	=3D plat_nand_probe,
-	.remove	=3D plat_nand_remove,
+	.remove_new =3D plat_nand_remove,
 	.driver	=3D {
 		.name		=3D "gen_nand",
 		.of_match_table =3D plat_nand_match,
diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_=
nandc.c
index 198a44794d2d..218c8a840e32 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -3315,7 +3315,7 @@ static int qcom_nandc_probe(struct platform_device *p=
dev)
 	return ret;
 }
=20
-static int qcom_nandc_remove(struct platform_device *pdev)
+static void qcom_nandc_remove(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc =3D platform_get_drvdata(pdev);
 	struct resource *res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -3337,8 +3337,6 @@ static int qcom_nandc_remove(struct platform_device *=
pdev)
=20
 	dma_unmap_resource(&pdev->dev, nandc->base_dma, resource_size(res),
 			   DMA_BIDIRECTIONAL, 0);
-
-	return 0;
 }
=20
 static const struct qcom_nandc_props ipq806x_nandc_props =3D {
@@ -3405,7 +3403,7 @@ static struct platform_driver qcom_nandc_driver =3D {
 		.of_match_table =3D qcom_nandc_of_match,
 	},
 	.probe   =3D qcom_nandc_probe,
-	.remove  =3D qcom_nandc_remove,
+	.remove_new =3D qcom_nandc_remove,
 };
 module_platform_driver(qcom_nandc_driver);
=20
diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/n=
and/raw/renesas-nand-controller.c
index 1620e25a1147..589021ea9eb2 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1386,15 +1386,13 @@ static int rnandc_probe(struct platform_device *pde=
v)
 	return ret;
 }
=20
-static int rnandc_remove(struct platform_device *pdev)
+static void rnandc_remove(struct platform_device *pdev)
 {
 	struct rnandc *rnandc =3D platform_get_drvdata(pdev);
=20
 	rnandc_chips_cleanup(rnandc);
=20
 	pm_runtime_put(&pdev->dev);
-
-	return 0;
 }
=20
 static const struct of_device_id rnandc_id_table[] =3D {
@@ -1410,7 +1408,7 @@ static struct platform_driver rnandc_driver =3D {
 		.of_match_table =3D rnandc_id_table,
 	},
 	.probe =3D rnandc_probe,
-	.remove =3D rnandc_remove,
+	.remove_new =3D rnandc_remove,
 };
 module_platform_driver(rnandc_driver);
=20
diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/=
nand/raw/rockchip-nand-controller.c
index f133985cc053..2312e27362cb 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -1427,7 +1427,7 @@ static int rk_nfc_probe(struct platform_device *pdev)
 	return ret;
 }
=20
-static int rk_nfc_remove(struct platform_device *pdev)
+static void rk_nfc_remove(struct platform_device *pdev)
 {
 	struct rk_nfc *nfc =3D platform_get_drvdata(pdev);
=20
@@ -1435,8 +1435,6 @@ static int rk_nfc_remove(struct platform_device *pdev)
 	kfree(nfc->oob_buf);
 	rk_nfc_chips_cleanup(nfc);
 	rk_nfc_disable_clks(nfc);
-
-	return 0;
 }
=20
 static int __maybe_unused rk_nfc_suspend(struct device *dev)
@@ -1476,7 +1474,7 @@ static const struct dev_pm_ops rk_nfc_pm_ops =3D {
=20
 static struct platform_driver rk_nfc_driver =3D {
 	.probe =3D rk_nfc_probe,
-	.remove =3D rk_nfc_remove,
+	.remove_new =3D rk_nfc_remove,
 	.driver =3D {
 		.name =3D "rockchip-nfc",
 		.of_match_table =3D rk_nfc_id_table,
diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index 80d96f94d6cb..ac80aaf5b4e3 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -709,12 +709,12 @@ static void s3c2440_nand_write_buf(struct nand_chip *=
this, const u_char *buf,
=20
 /* device management functions */
=20
-static int s3c24xx_nand_remove(struct platform_device *pdev)
+static void s3c24xx_nand_remove(struct platform_device *pdev)
 {
 	struct s3c2410_nand_info *info =3D to_nand_info(pdev);
=20
 	if (info =3D=3D NULL)
-		return 0;
+		return;
=20
 	/* Release all our mtds  and their partitions, then go through
 	 * freeing the resources used
@@ -735,8 +735,6 @@ static int s3c24xx_nand_remove(struct platform_device *=
pdev)
=20
 	if (!IS_ERR(info->clk))
 		s3c2410_nand_clk_set_state(info, CLOCK_DISABLE);
-
-	return 0;
 }
=20
 static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
@@ -1218,7 +1216,7 @@ MODULE_DEVICE_TABLE(platform, s3c24xx_driver_ids);
=20
 static struct platform_driver s3c24xx_nand_driver =3D {
 	.probe		=3D s3c24xx_nand_probe,
-	.remove		=3D s3c24xx_nand_remove,
+	.remove_new	=3D s3c24xx_nand_remove,
 	.suspend	=3D s3c24xx_nand_suspend,
 	.resume		=3D s3c24xx_nand_resume,
 	.id_table	=3D s3c24xx_driver_ids,
diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flct=
l.c
index a278829469d6..63bf20c41719 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1203,7 +1203,7 @@ static int flctl_probe(struct platform_device *pdev)
 	return ret;
 }
=20
-static int flctl_remove(struct platform_device *pdev)
+static void flctl_remove(struct platform_device *pdev)
 {
 	struct sh_flctl *flctl =3D platform_get_drvdata(pdev);
 	struct nand_chip *chip =3D &flctl->chip;
@@ -1214,12 +1214,10 @@ static int flctl_remove(struct platform_device *pde=
v)
 	WARN_ON(ret);
 	nand_cleanup(chip);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
=20
 static struct platform_driver flctl_driver =3D {
-	.remove		=3D flctl_remove,
+	.remove_new	=3D flctl_remove,
 	.driver =3D {
 		.name	=3D "sh_flctl",
 		.of_match_table =3D of_flctl_match,
diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 52ce5162538a..2402dc5465d5 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -210,7 +210,7 @@ static int sharpsl_nand_probe(struct platform_device *p=
dev)
 /*
  * Clean up routine
  */
-static int sharpsl_nand_remove(struct platform_device *pdev)
+static void sharpsl_nand_remove(struct platform_device *pdev)
 {
 	struct sharpsl_nand *sharpsl =3D platform_get_drvdata(pdev);
 	struct nand_chip *chip =3D &sharpsl->chip;
@@ -227,8 +227,6 @@ static int sharpsl_nand_remove(struct platform_device *=
pdev)
=20
 	/* Free the driver's structure */
 	kfree(sharpsl);
-
-	return 0;
 }
=20
 static struct platform_driver sharpsl_nand_driver =3D {
@@ -236,7 +234,7 @@ static struct platform_driver sharpsl_nand_driver =3D {
 		.name	=3D "sharpsl-nand",
 	},
 	.probe		=3D sharpsl_nand_probe,
-	.remove		=3D sharpsl_nand_remove,
+	.remove_new	=3D sharpsl_nand_remove,
 };
=20
 module_platform_driver(sharpsl_nand_driver);
diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/so=
crates_nand.c
index fb39cc7ebce0..a8b720ffe9e8 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -201,7 +201,7 @@ static int socrates_nand_probe(struct platform_device *=
ofdev)
 /*
  * Remove a NAND device.
  */
-static int socrates_nand_remove(struct platform_device *ofdev)
+static void socrates_nand_remove(struct platform_device *ofdev)
 {
 	struct socrates_nand_host *host =3D dev_get_drvdata(&ofdev->dev);
 	struct nand_chip *chip =3D &host->nand_chip;
@@ -212,8 +212,6 @@ static int socrates_nand_remove(struct platform_device =
*ofdev)
 	nand_cleanup(chip);
=20
 	iounmap(host->io_base);
-
-	return 0;
 }
=20
 static const struct of_device_id socrates_nand_match[] =3D
@@ -232,7 +230,7 @@ static struct platform_driver socrates_nand_driver =3D {
 		.of_match_table =3D socrates_nand_match,
 	},
 	.probe		=3D socrates_nand_probe,
-	.remove		=3D socrates_nand_remove,
+	.remove_new	=3D socrates_nand_remove,
 };
=20
 module_platform_driver(socrates_nand_driver);
diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/=
stm32_fmc2_nand.c
index 5d627048c420..e3d09dd5963b 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -2021,7 +2021,7 @@ static int stm32_fmc2_nfc_probe(struct platform_devic=
e *pdev)
 	return ret;
 }
=20
-static int stm32_fmc2_nfc_remove(struct platform_device *pdev)
+static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 {
 	struct stm32_fmc2_nfc *nfc =3D platform_get_drvdata(pdev);
 	struct stm32_fmc2_nand *nand =3D &nfc->nand;
@@ -2045,8 +2045,6 @@ static int stm32_fmc2_nfc_remove(struct platform_devi=
ce *pdev)
 	clk_disable_unprepare(nfc->clk);
=20
 	stm32_fmc2_nfc_wp_enable(nand);
-
-	return 0;
 }
=20
 static int __maybe_unused stm32_fmc2_nfc_suspend(struct device *dev)
@@ -2103,7 +2101,7 @@ MODULE_DEVICE_TABLE(of, stm32_fmc2_nfc_match);
=20
 static struct platform_driver stm32_fmc2_nfc_driver =3D {
 	.probe	=3D stm32_fmc2_nfc_probe,
-	.remove	=3D stm32_fmc2_nfc_remove,
+	.remove_new =3D stm32_fmc2_nfc_remove,
 	.driver	=3D {
 		.name =3D "stm32_fmc2_nfc",
 		.of_match_table =3D stm32_fmc2_nfc_match,
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi=
_nand.c
index 13e3e0198d15..9884304634f6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2173,7 +2173,7 @@ static int sunxi_nfc_probe(struct platform_device *pd=
ev)
 	return ret;
 }
=20
-static int sunxi_nfc_remove(struct platform_device *pdev)
+static void sunxi_nfc_remove(struct platform_device *pdev)
 {
 	struct sunxi_nfc *nfc =3D platform_get_drvdata(pdev);
=20
@@ -2185,8 +2185,6 @@ static int sunxi_nfc_remove(struct platform_device *p=
dev)
 		dma_release_channel(nfc->dmac);
 	clk_disable_unprepare(nfc->mod_clk);
 	clk_disable_unprepare(nfc->ahb_clk);
-
-	return 0;
 }
=20
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps =3D {
@@ -2219,7 +2217,7 @@ static struct platform_driver sunxi_nfc_driver =3D {
 		.of_match_table =3D sunxi_nfc_ids,
 	},
 	.probe =3D sunxi_nfc_probe,
-	.remove =3D sunxi_nfc_remove,
+	.remove_new =3D sunxi_nfc_remove,
 };
 module_platform_driver(sunxi_nfc_driver);
=20
diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra=
_nand.c
index a9b9031ce616..eb0b9d16e8da 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1220,7 +1220,7 @@ static int tegra_nand_probe(struct platform_device *p=
dev)
 	return err;
 }
=20
-static int tegra_nand_remove(struct platform_device *pdev)
+static void tegra_nand_remove(struct platform_device *pdev)
 {
 	struct tegra_nand_controller *ctrl =3D platform_get_drvdata(pdev);
 	struct nand_chip *chip =3D ctrl->chip;
@@ -1232,8 +1232,6 @@ static int tegra_nand_remove(struct platform_device *=
pdev)
=20
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
-
-	return 0;
 }
=20
 static int __maybe_unused tegra_nand_runtime_resume(struct device *dev)
@@ -1277,7 +1275,7 @@ static struct platform_driver tegra_nand_driver =3D {
 		.pm =3D &tegra_nand_pm,
 	},
 	.probe =3D tegra_nand_probe,
-	.remove =3D tegra_nand_remove,
+	.remove_new =3D tegra_nand_remove,
 };
 module_platform_driver(tegra_nand_driver);
=20
diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_=
nfc.c
index b643332ea1ff..86522048e271 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -909,7 +909,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	return err;
 }
=20
-static int vf610_nfc_remove(struct platform_device *pdev)
+static void vf610_nfc_remove(struct platform_device *pdev)
 {
 	struct vf610_nfc *nfc =3D platform_get_drvdata(pdev);
 	struct nand_chip *chip =3D &nfc->chip;
@@ -919,7 +919,6 @@ static int vf610_nfc_remove(struct platform_device *pde=
v)
 	WARN_ON(ret);
 	nand_cleanup(chip);
 	clk_disable_unprepare(nfc->clk);
-	return 0;
 }
=20
 #ifdef CONFIG_PM_SLEEP
@@ -955,7 +954,7 @@ static struct platform_driver vf610_nfc_driver =3D {
 		.pm	=3D &vf610_nfc_pm_ops,
 	},
 	.probe		=3D vf610_nfc_probe,
-	.remove		=3D vf610_nfc_remove,
+	.remove_new	=3D vf610_nfc_remove,
 };
=20
 module_platform_driver(vf610_nfc_driver);
diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_n=
and.c
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
 	struct xway_nand_data *data =3D platform_get_drvdata(pdev);
 	struct nand_chip *chip =3D &data->chip;
@@ -247,8 +247,6 @@ static int xway_nand_remove(struct platform_device *pde=
v)
 	ret =3D mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
-
-	return 0;
 }
=20
 static const struct of_device_id xway_nand_match[] =3D {
@@ -258,7 +256,7 @@ static const struct of_device_id xway_nand_match[] =3D {
=20
 static struct platform_driver xway_nand_driver =3D {
 	.probe	=3D xway_nand_probe,
-	.remove	=3D xway_nand_remove,
+	.remove_new =3D xway_nand_remove,
 	.driver	=3D {
 		.name		=3D "lantiq,nand-xway",
 		.of_match_table =3D xway_nand_match,

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
--=20
2.39.2


--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4dc7oddhe3z6p4ux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQxuCsACgkQj4D7WH0S
/k7gpQf/dWiVSr4Ze/MtvcY/dYKoi8aQgSF4Pff7yAla86QcaEYHwDfPsITWOxgE
VlOzQq2NXYUWklYJ/qltSVQhc2Q+DGddL0O0dUBwb3xu2t9avdKHjZY2LHAtGCy0
O7OLUKUZKbqGxVGmQn/jH5nZw93pnCTtpyXkhoS2TQBEsgwJKO5mZw+CoNyDILP9
X1kk3vIciTfZW9cLF/f0tjtO10c14iIrumAIS8iwfCbbvH7BJnE8QaGJywZQPJUf
VjFdTkXeaLeXFrKhU7sGVrxE4EvJSWWFW5549U2XxqGUAF3Mnn2k7rL0LZxo41Zd
WsIt2XTmaXWPr0rrCGA/rj8DN8gXxA==
=u7UZ
-----END PGP SIGNATURE-----

--4dc7oddhe3z6p4ux--
