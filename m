Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377403533D5
	for <lists+linux-mips@lfdr.de>; Sat,  3 Apr 2021 13:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236762AbhDCLtO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 3 Apr 2021 07:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236736AbhDCLtN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 3 Apr 2021 07:49:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8C9C061793
        for <linux-mips@vger.kernel.org>; Sat,  3 Apr 2021 04:49:09 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lSelp-0000es-7B; Sat, 03 Apr 2021 13:48:53 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lSell-0007xp-OX; Sat, 03 Apr 2021 13:48:49 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH net-next v1 3/9] net: dsa: qca: ar9331: reorder MDIO write sequence
Date:   Sat,  3 Apr 2021 13:48:42 +0200
Message-Id: <20210403114848.30528-4-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210403114848.30528-1-o.rempel@pengutronix.de>
References: <20210403114848.30528-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In case of this switch we work with 32bit registers on top of 16bit
bus. Some registers (for example access to forwarding database) have
trigger bit on the first 16bit half of request and the result +
configuration of request in the second half. Without this this patch, we would
trigger database operation and overwrite result in one run.

To make it work properly, we should do the second part of transfer
before the first one is done.

So far, this rule seems to work for all registers on this switch.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/net/dsa/qca/ar9331.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/qca/ar9331.c b/drivers/net/dsa/qca/ar9331.c
index ca2ad77b71f1..9a5035b2f0ff 100644
--- a/drivers/net/dsa/qca/ar9331.c
+++ b/drivers/net/dsa/qca/ar9331.c
@@ -837,16 +837,17 @@ static int ar9331_mdio_write(void *ctx, u32 reg, u32 val)
 		return 0;
 	}
 
-	ret = __ar9331_mdio_write(sbus, AR9331_SW_MDIO_PHY_MODE_REG, reg, val);
+	ret = __ar9331_mdio_write(sbus, AR9331_SW_MDIO_PHY_MODE_REG, reg + 2,
+				  val >> 16);
 	if (ret < 0)
 		goto error;
 
-	ret = __ar9331_mdio_write(sbus, AR9331_SW_MDIO_PHY_MODE_REG, reg + 2,
-				  val >> 16);
+	ret = __ar9331_mdio_write(sbus, AR9331_SW_MDIO_PHY_MODE_REG, reg, val);
 	if (ret < 0)
 		goto error;
 
 	return 0;
+
 error:
 	dev_err_ratelimited(&sbus->dev, "Bus error. Failed to write register.\n");
 	return ret;
-- 
2.29.2

