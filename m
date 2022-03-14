Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4324D869F
	for <lists+linux-mips@lfdr.de>; Mon, 14 Mar 2022 15:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242242AbiCNOS2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Mar 2022 10:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242228AbiCNOS2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Mar 2022 10:18:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2191D19C31
        for <linux-mips@vger.kernel.org>; Mon, 14 Mar 2022 07:17:17 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVM-0004zh-01; Mon, 14 Mar 2022 15:17:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVM-000f3A-Ca; Mon, 14 Mar 2022 15:16:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVK-0097b5-7o; Mon, 14 Mar 2022 15:16:58 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Paul Cercueil <paul@crapouillou.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        linux-mips@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v8 09/16] rtc: ingenic: Simplify using devm_clk_get_enabled()
Date:   Mon, 14 Mar 2022 15:16:36 +0100
Message-Id: <20220314141643.22184-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1594; i=uwe@kleine-koenig.org; h=from:subject; bh=FeAj6Ohg9mkpr+zt239XYH6V0/QlOhGXtSKI9NFJOhU=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiL04I04iODxa+kI91syZiUDXI2CeBN8AaiC2n/y4O g+rD3nuJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYi9OCAAKCRDB/BR4rcrsCYJeB/ 9+fceY++w2qiCyAKn43cDe3s1P3VvLC68fdLkbHJm4jywsslju+hq7fSs2r4AD4nBXG7pywqfs0ZSU FJUWrBWnSjXTUctP7slKWVag5kR4jAUmt4ChfPvw5jTdcC1QS5jwPR1Hzkr2zHucE31nimhProcDHy xN5fLrSD29P8qhA+Tj6XsoNAtyMHiOYri1z2bwK/uOylK9bor99hXnBgCerbbNIJOmF9UPG7IQmYNt md3btgA77WDUhDXdw+/vvFdPYQIKhfnAw3c+KlSV2yad2C/5lTvxxjMMtEjsG/VCYDw2zfC4zBSEQw uvy7n+Ob+p2scOYh5nHNCwvUqlXYu5
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

With devm_clk_get_enabled() caring to disable (and unprepare) the clock,
the probe function can be simplified accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-jz4740.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 6e51df72fd65..9b7bb6ce93ee 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -257,11 +257,6 @@ static void jz4740_rtc_power_off(void)
 	kernel_halt();
 }
 
-static void jz4740_rtc_clk_disable(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
 static const struct of_device_id jz4740_rtc_of_match[] = {
 	{ .compatible = "ingenic,jz4740-rtc", .data = (void *)ID_JZ4740 },
 	{ .compatible = "ingenic,jz4760-rtc", .data = (void *)ID_JZ4760 },
@@ -329,24 +324,12 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc->base))
 		return PTR_ERR(rtc->base);
 
-	clk = devm_clk_get(dev, "rtc");
+	clk = devm_clk_get_enabled(dev, "rtc");
 	if (IS_ERR(clk)) {
-		dev_err(dev, "Failed to get RTC clock\n");
+		dev_err(dev, "Failed to get enabled RTC clock\n");
 		return PTR_ERR(clk);
 	}
 
-	ret = clk_prepare_enable(clk);
-	if (ret) {
-		dev_err(dev, "Failed to enable clock\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(dev, jz4740_rtc_clk_disable, clk);
-	if (ret) {
-		dev_err(dev, "Failed to register devm action\n");
-		return ret;
-	}
-
 	spin_lock_init(&rtc->lock);
 
 	platform_set_drvdata(pdev, rtc);
-- 
2.35.1

