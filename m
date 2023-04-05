Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0DB6D7EC7
	for <lists+linux-mips@lfdr.de>; Wed,  5 Apr 2023 16:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238545AbjDEOLU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Apr 2023 10:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238302AbjDEOKy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Apr 2023 10:10:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 820B461A7
        for <linux-mips@vger.kernel.org>; Wed,  5 Apr 2023 07:10:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q4-0003FF-W1; Wed, 05 Apr 2023 16:10:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q3-009Abf-Ve; Wed, 05 Apr 2023 16:10:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q2-00AmTp-Vv; Wed, 05 Apr 2023 16:10:15 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 02/10] usb: musb: jz4740: Convert to platform remove callback returning void
Date:   Wed,  5 Apr 2023 16:10:01 +0200
Message-Id: <20230405141009.3400693-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
References: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1655; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=LInJ1VCltnR5zQZF3u3QFfDFUTQVLF2/3mjdDDUK2yk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkLYEyTrllnyAk+4A0JArG+9Z/8Sf3w+R94F9Np ubxA2IrkuiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZC2BMgAKCRCPgPtYfRL+ TjL3B/9f8A8Z7sDaUMrpsotRlJ7ybY+bjEYSC1gxqkgn4tREYbIL1JbtbPZWL/TpGStVeFj5cMr 0odUsl8fFZCjUekBIrcoTyh8L01dd5OgNaK8984RFHipQs9cpN1F/akKcrxZwyWe2CAtxqd3MHg t9QO++Kc8bX2u4oiQlsEbC7kulRlOCUSZrAYFa0LV1UqUNi+Ii0cR2qj0DwekW9bcbkwyQdxSfq AYmp5OkU/BIKhto8XMg3n1dKD1TN4oSw/LWkCApRVpJ74V+FKz4xYLGyLBNznAIeWvoMnFcvS39 kTXzmrmau+fHdXFuyaIyyYTxx4eD6HiN2vOyiT5/3fPSbn9o
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
 drivers/usb/musb/jz4740.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index c7b1d2a394d9..5aabdd7e2511 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -308,14 +308,12 @@ static int jz4740_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int jz4740_remove(struct platform_device *pdev)
+static void jz4740_remove(struct platform_device *pdev)
 {
 	struct jz4740_glue *glue = platform_get_drvdata(pdev);
 
 	platform_device_unregister(glue->pdev);
 	clk_disable_unprepare(glue->clk);
-
-	return 0;
 }
 
 static const struct of_device_id jz4740_musb_of_match[] = {
@@ -327,7 +325,7 @@ MODULE_DEVICE_TABLE(of, jz4740_musb_of_match);
 
 static struct platform_driver jz4740_driver = {
 	.probe		= jz4740_probe,
-	.remove		= jz4740_remove,
+	.remove_new	= jz4740_remove,
 	.driver		= {
 		.name	= "musb-jz4740",
 		.of_match_table = jz4740_musb_of_match,
-- 
2.39.2

