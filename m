Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A05196D328D
	for <lists+linux-mips@lfdr.de>; Sat,  1 Apr 2023 18:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjDAQUE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Apr 2023 12:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjDAQUD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Apr 2023 12:20:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FDBA5E1
        for <linux-mips@vger.kernel.org>; Sat,  1 Apr 2023 09:20:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pidxI-0008J6-HP; Sat, 01 Apr 2023 18:19:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pidxH-008GRB-KD; Sat, 01 Apr 2023 18:19:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pidxG-009kgK-DH; Sat, 01 Apr 2023 18:19:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
        linux-mips@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 20/49] mtd: rawnand: ingenic: Convert to platform remove callback returning void
Date:   Sat,  1 Apr 2023 18:19:09 +0200
Message-Id: <20230401161938.2503204-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wcjtx8KlaSUvzq2Bnb9sgvoi7LKE1iNvYAl9n41L3Oo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFkQfxkqOIajMiniSiCExT7JGOcXyLx06eRkg c7WSGy37MyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZEAAKCRCPgPtYfRL+ TtWkB/9rXtvGRYkvAsfdnUSBj39s9dz0fLhSkpeHxEHVVVSMFVxjwKAKBryDM/hltnbIAtdjwVu CuFuXT2Mx+XmdEDcI0/8ZZyZzs0QbDe4000pWiLQqBxnXdV9t4guJY5DTFGr2zuluPMtz8tJDJa 2cEH6NMoRTGYMThT5387I2P56tjDOKok7q9rD0D7P4aLbsdSDJj25k6aXyPYyBvStSTcDn0Zv2x 7TXNvSCqd4ZgrdlNTo4m0SoyXUhRRc7PBsty565ZHqXdq9KjHT9N4SSQJ60msdM8w3ssKct8dEO TWNUF6oAqGHb93Yk1gZ2yWxwIIwQg9Ed81aMXA34LKJ0+R2R
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

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

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
-- 
2.39.2

