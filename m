Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D02C7336B4
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jun 2023 18:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345728AbjFPQxY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Jun 2023 12:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345835AbjFPQww (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Jun 2023 12:52:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D9FF4218
        for <linux-mips@vger.kernel.org>; Fri, 16 Jun 2023 09:51:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qACfb-0000Dm-Hx; Fri, 16 Jun 2023 18:51:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qACfa-007rU6-IN; Fri, 16 Jun 2023 18:51:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qACfZ-00Eos1-BF; Fri, 16 Jun 2023 18:51:29 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] MIPS: PCI: Convert to platform remove callback returning void
Date:   Fri, 16 Jun 2023 18:51:27 +0200
Message-Id: <20230616165127.1055386-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1962; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Xxm+6kAbJGo5kAxvEECJfQpDBwL0a/CyRctjGwg4iZQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkjJMOtiU37lKelG5JUI8phwY2FAPmgs8C4YrV7 6Y5QGrPnqGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZIyTDgAKCRCPgPtYfRL+ TvaACACEBhnp5Ac1D9pI/0IE00wZMXMVh1YU4nJBjnU2fEI+3UUrywnsvVnPEjqFsmY4UM8LMvo BAPND1NlDJkeFT+vpSnVpledeC6V6kd1Q3rFUZ40yt5pl1zn966cWatBiRsSYb2GmuJAb8anidX XhTph799MOQDPL84CJoJjAM9UqLH/4ee7N8bE3c+AYndoECdbM7rg/Czc/ejgegXClfzID5RG61 rRDVqGN+oniTWDuFslWiqnhR2sHfOfsj6mYNKSfv1SPGZ0g72yDPbBChw/gP95enicPkeqhEY70 OyCGbcTpGcDHM8vgX2dCLZo2SelQbdpSadLAB1LkQVIGw/Li
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

While destroying alignment of the assignments in bridge_driver, do it
consistently and use a single space before =.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/mips/pci/pci-xtalk-bridge.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
index ab9bedb82b28..68d5211afea8 100644
--- a/arch/mips/pci/pci-xtalk-bridge.c
+++ b/arch/mips/pci/pci-xtalk-bridge.c
@@ -733,7 +733,7 @@ static int bridge_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int bridge_remove(struct platform_device *pdev)
+static void bridge_remove(struct platform_device *pdev)
 {
 	struct pci_bus *bus = platform_get_drvdata(pdev);
 	struct bridge_controller *bc = BRIDGE_CONTROLLER(bus);
@@ -745,13 +745,11 @@ static int bridge_remove(struct platform_device *pdev)
 	pci_stop_root_bus(bus);
 	pci_remove_root_bus(bus);
 	pci_unlock_rescan_remove();
-
-	return 0;
 }
 
 static struct platform_driver bridge_driver = {
-	.probe  = bridge_probe,
-	.remove = bridge_remove,
+	.probe = bridge_probe,
+	.remove_new = bridge_remove,
 	.driver = {
 		.name = "xtalk-bridge",
 	}

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

