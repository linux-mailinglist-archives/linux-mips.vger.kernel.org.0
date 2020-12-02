Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9D22CBF29
	for <lists+linux-mips@lfdr.de>; Wed,  2 Dec 2020 15:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgLBOKd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Dec 2020 09:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbgLBOKd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Dec 2020 09:10:33 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96F1FC061A48
        for <linux-mips@vger.kernel.org>; Wed,  2 Dec 2020 06:09:13 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kkSoc-0005oI-Hp; Wed, 02 Dec 2020 15:09:06 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kkSob-0006SC-K2; Wed, 02 Dec 2020 15:09:05 +0100
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
Subject: [PATCH v3 net-next 1/2] net: dsa: add optional stats64 support
Date:   Wed,  2 Dec 2020 15:09:03 +0100
Message-Id: <20201202140904.24748-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201202140904.24748-1-o.rempel@pengutronix.de>
References: <20201202140904.24748-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Allow DSA drivers to export stats64

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 include/net/dsa.h |  3 +++
 net/dsa/slave.c   | 14 +++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 4e60d2610f20..457b89143875 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -655,6 +655,9 @@ struct dsa_switch_ops {
 	int	(*port_change_mtu)(struct dsa_switch *ds, int port,
 				   int new_mtu);
 	int	(*port_max_mtu)(struct dsa_switch *ds, int port);
+
+	void	(*get_stats64)(struct dsa_switch *ds, int port,
+				   struct rtnl_link_stats64 *s);
 };
 
 #define DSA_DEVLINK_PARAM_DRIVER(_id, _name, _type, _cmodes)		\
diff --git a/net/dsa/slave.c b/net/dsa/slave.c
index ff2266d2b998..6e1a4dc18a97 100644
--- a/net/dsa/slave.c
+++ b/net/dsa/slave.c
@@ -1602,6 +1602,18 @@ static struct devlink_port *dsa_slave_get_devlink_port(struct net_device *dev)
 	return dp->ds->devlink ? &dp->devlink_port : NULL;
 }
 
+static void dsa_slave_get_stats64(struct net_device *dev,
+				  struct rtnl_link_stats64 *s)
+{
+	struct dsa_port *dp = dsa_slave_to_port(dev);
+	struct dsa_switch *ds = dp->ds;
+
+	if (!ds->ops->get_stats64)
+		return dev_get_tstats64(dev, s);
+
+	return ds->ops->get_stats64(ds, dp->index, s);
+}
+
 static const struct net_device_ops dsa_slave_netdev_ops = {
 	.ndo_open	 	= dsa_slave_open,
 	.ndo_stop		= dsa_slave_close,
@@ -1621,7 +1633,7 @@ static const struct net_device_ops dsa_slave_netdev_ops = {
 #endif
 	.ndo_get_phys_port_name	= dsa_slave_get_phys_port_name,
 	.ndo_setup_tc		= dsa_slave_setup_tc,
-	.ndo_get_stats64	= dev_get_tstats64,
+	.ndo_get_stats64	= dsa_slave_get_stats64,
 	.ndo_get_port_parent_id	= dsa_slave_get_port_parent_id,
 	.ndo_vlan_rx_add_vid	= dsa_slave_vlan_rx_add_vid,
 	.ndo_vlan_rx_kill_vid	= dsa_slave_vlan_rx_kill_vid,
-- 
2.29.2

