Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFC747A543E
	for <lists+linux-mips@lfdr.de>; Mon, 18 Sep 2023 22:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjIRUnA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 Sep 2023 16:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjIRUm7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 Sep 2023 16:42:59 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0048F118
        for <linux-mips@vger.kernel.org>; Mon, 18 Sep 2023 13:42:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiL4x-0007Lw-6V; Mon, 18 Sep 2023 22:42:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiL4w-007IkJ-8u; Mon, 18 Sep 2023 22:42:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiL4v-002mq3-Vm; Mon, 18 Sep 2023 22:42:45 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
        netdev@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH net-next 44/54] net: ethernet: sgi: Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 22:42:16 +0200
Message-Id: <20230918204227.1316886-45-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918204227.1316886-1-u.kleine-koenig@pengutronix.de>
References: <20230918204227.1316886-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2611; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1DfXxq+y2p1Dyfrf6rxiLk24YbNQXHKjjEfqzpFmej8=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlSObaIt22rk/xs8EnQ7/qCaW0Z+9qKCbVvK61gFItuqt fkPzWbpZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiHfrs/50fbu55eIRBeWnL hrubD0ZUyLimTXdPaZkwRzY9O2gv71TLtdZTHhkvfr4sb2bYmgA/V2dFrrR3i3ml/nFYGPpYa3R dOmd7+qBQ5KUauR0cB4x/9btpK0ed3dbrEegWqHX85pOgSRpzlUxVr8o/FTvwN1BDiktPbVFWFX t39M+navmSVZZPFup/eijUzF/A9XYHxz/NpbVCATcElCsaz4j9sXb1CQ3OSzawkDSItz+58fzq/ JXWtxPKinOcypLztiVP99GQWLfKyUT0QZzKwxv8M44VxD7zyCnJ8NGaes+14NIGm6x+ibCts7Tu 7I3eJqlVbHrmE8OfzasucSnk+ztbT1jGoP7w/d66+HsA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

Trivially convert these drivers from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/net/ethernet/sgi/ioc3-eth.c | 6 ++----
 drivers/net/ethernet/sgi/meth.c     | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/sgi/ioc3-eth.c b/drivers/net/ethernet/sgi/ioc3-eth.c
index 8fc3f5272fa7..98d0b561a057 100644
--- a/drivers/net/ethernet/sgi/ioc3-eth.c
+++ b/drivers/net/ethernet/sgi/ioc3-eth.c
@@ -962,7 +962,7 @@ static int ioc3eth_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int ioc3eth_remove(struct platform_device *pdev)
+static void ioc3eth_remove(struct platform_device *pdev)
 {
 	struct net_device *dev = platform_get_drvdata(pdev);
 	struct ioc3_private *ip = netdev_priv(dev);
@@ -973,8 +973,6 @@ static int ioc3eth_remove(struct platform_device *pdev)
 	unregister_netdev(dev);
 	del_timer_sync(&ip->ioc3_timer);
 	free_netdev(dev);
-
-	return 0;
 }
 
 
@@ -1275,7 +1273,7 @@ static void ioc3_set_multicast_list(struct net_device *dev)
 
 static struct platform_driver ioc3eth_driver = {
 	.probe  = ioc3eth_probe,
-	.remove = ioc3eth_remove,
+	.remove_new = ioc3eth_remove,
 	.driver = {
 		.name = "ioc3-eth",
 	}
diff --git a/drivers/net/ethernet/sgi/meth.c b/drivers/net/ethernet/sgi/meth.c
index 6d850ea2b94c..18b6f93d875e 100644
--- a/drivers/net/ethernet/sgi/meth.c
+++ b/drivers/net/ethernet/sgi/meth.c
@@ -854,19 +854,17 @@ static int meth_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int meth_remove(struct platform_device *pdev)
+static void meth_remove(struct platform_device *pdev)
 {
 	struct net_device *dev = platform_get_drvdata(pdev);
 
 	unregister_netdev(dev);
 	free_netdev(dev);
-
-	return 0;
 }
 
 static struct platform_driver meth_driver = {
 	.probe	= meth_probe,
-	.remove	= meth_remove,
+	.remove_new = meth_remove,
 	.driver = {
 		.name	= "meth",
 	}
-- 
2.40.1

