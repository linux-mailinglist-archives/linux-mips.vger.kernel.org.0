Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8D9B5506B1
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jun 2022 22:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiFRUkv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 18 Jun 2022 16:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiFRUku (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 18 Jun 2022 16:40:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE4B11C02
        for <linux-mips@vger.kernel.org>; Sat, 18 Jun 2022 13:40:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o2fFN-0000Fm-R7; Sat, 18 Jun 2022 22:40:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o2fFI-001Jog-Pj; Sat, 18 Jun 2022 22:40:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o2fFJ-00HEzM-Cx; Sat, 18 Jun 2022 22:40:41 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     linux-mips@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] mips: sgi-ip22: Drop redundant check from .remove()
Date:   Sat, 18 Jun 2022 22:40:37 +0200
Message-Id: <20220618204037.35947-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=840; h=from:subject; bh=ObDzHuVgiGP/q5DVUd3A0i/gRJh3vi+u64EHOQwpdaI=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBirjhBgQ02UvjrfOQ8zQix1ziLsYoD54wvhu8Ib0T/ BQkR7xeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYq44QQAKCRDB/BR4rcrsCXtZB/ 4miy+EP9rT0pH5XcKAhuRzQuwUBnv7qqJsFrISAOCThcoCyR8SGY+/QO3shUsYcHSb47eq0PEeOIZB dcw3yJHPlqLZ0bRa2/9PcE6BhVBHO0+/zQAbeotKa+iwnmQ+KyLFjzV/5DZ8HFAJV+qp20nh8udsBN /XNJdJpn+IuWHOzXK6sIbF/mcqgsXUPMD2mZrpy2AQ+lLoUa9ZhLOFJv3t05tjSwom1YrhmBiHjScr kp8wtAMV/SgYtTC2uBzz7hSPr9+nl1Ak4t5o3Sh/JGK6MeGOf9Pvlab6jNEoaaLqORcJ0td43fhoKg SSKx0PWTVSjz2UiVFFzEK9jRJjY5PD
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

The remove callback is only called by the driver core if there is a
driver to unbind, so there is no need to check dev->driver to be
non-NULL.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/mips/sgi-ip22/ip22-gio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/sgi-ip22/ip22-gio.c b/arch/mips/sgi-ip22/ip22-gio.c
index 38d12f417e48..8686e8c1c4e5 100644
--- a/arch/mips/sgi-ip22/ip22-gio.c
+++ b/arch/mips/sgi-ip22/ip22-gio.c
@@ -148,7 +148,7 @@ static void gio_device_remove(struct device *dev)
 	struct gio_device *gio_dev = to_gio_device(dev);
 	struct gio_driver *drv = to_gio_driver(dev->driver);
 
-	if (dev->driver && drv->remove)
+	if (drv->remove)
 		drv->remove(gio_dev);
 }
 

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

