Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0293D173A50
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 15:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbgB1Ou7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 09:50:59 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47367 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgB1Ou7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 09:50:59 -0500
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1j7gyb-0006mu-Az; Fri, 28 Feb 2020 15:50:53 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1j7gyY-0004ap-Ex; Fri, 28 Feb 2020 15:50:50 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Chris Snook <chris.snook@gmail.com>,
        Jay Cliburn <jcliburn@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Vivien Didelot <vivien.didelot@gmail.com>
Subject: [PATCH v9] net: ag71xx: port to phylink
Date:   Fri, 28 Feb 2020 15:50:49 +0100
Message-Id: <20200228145049.17602-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The port to phylink was done as close as possible to initial
functionality.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
changes v9:
- rebase to latest net-next
- move part of mac_config() implementation to the mac_link_up()

changes v8:
- set the autoneg bit
- provide implementations for the mac_pcs_get_state and mac_an_restart
  methods
- do phylink_disconnect_phy() on _stop()
- rename ag71xx_phy_setup() to ag71xx_phylink_setup() 

 drivers/net/ethernet/atheros/Kconfig  |   2 +-
 drivers/net/ethernet/atheros/ag71xx.c | 188 ++++++++++++++++----------
 2 files changed, 118 insertions(+), 72 deletions(-)

diff --git a/drivers/net/ethernet/atheros/Kconfig b/drivers/net/ethernet/atheros/Kconfig
index 0058051ba925..2720bde5034e 100644
--- a/drivers/net/ethernet/atheros/Kconfig
+++ b/drivers/net/ethernet/atheros/Kconfig
@@ -20,7 +20,7 @@ if NET_VENDOR_ATHEROS
 config AG71XX
 	tristate "Atheros AR7XXX/AR9XXX built-in ethernet mac support"
 	depends on ATH79
-	select PHYLIB
+	select PHYLINK
 	help
 	  If you wish to compile a kernel for AR7XXX/91XXX and enable
 	  ethernet support, then you should always answer Y to this.
diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index e95687a780fb..02b7705393ca 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -32,6 +32,7 @@
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
 #include <linux/of_platform.h>
+#include <linux/phylink.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/clk.h>
@@ -314,6 +315,8 @@ struct ag71xx {
 	dma_addr_t stop_desc_dma;
 
 	phy_interface_t phy_if_mode;
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
 
 	struct delayed_work restart_work;
 	struct timer_list oom_timer;
@@ -845,24 +848,91 @@ static void ag71xx_hw_start(struct ag71xx *ag)
 	netif_wake_queue(ag->ndev);
 }
 
-static void ag71xx_link_adjust(struct ag71xx *ag, bool update)
+static void ag71xx_mac_config(struct phylink_config *config, unsigned int mode,
+			      const struct phylink_link_state *state)
 {
-	struct phy_device *phydev = ag->ndev->phydev;
-	u32 cfg2;
-	u32 ifctl;
-	u32 fifo5;
+	struct ag71xx *ag = netdev_priv(to_net_dev(config->dev));
 
-	if (!phydev->link && update) {
-		ag71xx_hw_stop(ag);
+	if (phylink_autoneg_inband(mode))
 		return;
-	}
 
 	if (!ag71xx_is(ag, AR7100) && !ag71xx_is(ag, AR9130))
 		ag71xx_fast_reset(ag);
 
+	if (ag->tx_ring.desc_split) {
+		ag->fifodata[2] &= 0xffff;
+		ag->fifodata[2] |= ((2048 - ag->tx_ring.desc_split) / 4) << 16;
+	}
+
+	ag71xx_wr(ag, AG71XX_REG_FIFO_CFG3, ag->fifodata[2]);
+}
+
+static void ag71xx_mac_validate(struct phylink_config *config,
+			    unsigned long *supported,
+			    struct phylink_link_state *state)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
+
+	if (state->interface != PHY_INTERFACE_MODE_NA &&
+	    state->interface != PHY_INTERFACE_MODE_GMII &&
+	    state->interface != PHY_INTERFACE_MODE_MII) {
+		bitmap_zero(supported, __ETHTOOL_LINK_MODE_MASK_NBITS);
+		return;
+	}
+
+	phylink_set(mask, MII);
+
+	phylink_set(mask, Autoneg);
+	phylink_set(mask, 10baseT_Half);
+	phylink_set(mask, 10baseT_Full);
+	phylink_set(mask, 100baseT_Half);
+	phylink_set(mask, 100baseT_Full);
+
+	if (state->interface == PHY_INTERFACE_MODE_NA ||
+	    state->interface == PHY_INTERFACE_MODE_GMII) {
+		phylink_set(mask, 1000baseT_Full);
+		phylink_set(mask, 1000baseX_Full);
+	}
+
+	bitmap_and(supported, supported, mask,
+		   __ETHTOOL_LINK_MODE_MASK_NBITS);
+	bitmap_and(state->advertising, state->advertising, mask,
+		   __ETHTOOL_LINK_MODE_MASK_NBITS);
+}
+
+static void ag71xx_mac_pcs_get_state(struct phylink_config *config,
+				     struct phylink_link_state *state)
+{
+	state->link = 0;
+}
+
+static void ag71xx_mac_an_restart(struct phylink_config *config)
+{
+	/* Not Supported */
+}
+
+static void ag71xx_mac_link_down(struct phylink_config *config,
+				 unsigned int mode, phy_interface_t interface)
+{
+	struct ag71xx *ag = netdev_priv(to_net_dev(config->dev));
+
+	ag71xx_hw_stop(ag);
+}
+
+static void ag71xx_mac_link_up(struct phylink_config *config,
+			       struct phy_device *phy,
+			       unsigned int mode, phy_interface_t interface,
+			       int speed, int duplex,
+			       bool tx_pause, bool rx_pause)
+{
+	struct ag71xx *ag = netdev_priv(to_net_dev(config->dev));
+	u32 cfg2;
+	u32 ifctl;
+	u32 fifo5;
+
 	cfg2 = ag71xx_rr(ag, AG71XX_REG_MAC_CFG2);
 	cfg2 &= ~(MAC_CFG2_IF_1000 | MAC_CFG2_IF_10_100 | MAC_CFG2_FDX);
-	cfg2 |= (phydev->duplex) ? MAC_CFG2_FDX : 0;
+	cfg2 |= duplex ? MAC_CFG2_FDX : 0;
 
 	ifctl = ag71xx_rr(ag, AG71XX_REG_MAC_IFCTL);
 	ifctl &= ~(MAC_IFCTL_SPEED);
@@ -870,7 +940,7 @@ static void ag71xx_link_adjust(struct ag71xx *ag, bool update)
 	fifo5 = ag71xx_rr(ag, AG71XX_REG_FIFO_CFG5);
 	fifo5 &= ~FIFO_CFG5_BM;
 
-	switch (phydev->speed) {
+	switch (speed) {
 	case SPEED_1000:
 		cfg2 |= MAC_CFG2_IF_1000;
 		fifo5 |= FIFO_CFG5_BM;
@@ -883,72 +953,38 @@ static void ag71xx_link_adjust(struct ag71xx *ag, bool update)
 		cfg2 |= MAC_CFG2_IF_10_100;
 		break;
 	default:
-		WARN(1, "not supported speed %i\n", phydev->speed);
 		return;
 	}
 
-	if (ag->tx_ring.desc_split) {
-		ag->fifodata[2] &= 0xffff;
-		ag->fifodata[2] |= ((2048 - ag->tx_ring.desc_split) / 4) << 16;
-	}
-
-	ag71xx_wr(ag, AG71XX_REG_FIFO_CFG3, ag->fifodata[2]);
-
 	ag71xx_wr(ag, AG71XX_REG_MAC_CFG2, cfg2);
 	ag71xx_wr(ag, AG71XX_REG_FIFO_CFG5, fifo5);
 	ag71xx_wr(ag, AG71XX_REG_MAC_IFCTL, ifctl);
 
 	ag71xx_hw_start(ag);
-
-	if (update)
-		phy_print_status(phydev);
 }
 
-static void ag71xx_phy_link_adjust(struct net_device *ndev)
-{
-	struct ag71xx *ag = netdev_priv(ndev);
-
-	ag71xx_link_adjust(ag, true);
-}
+static const struct phylink_mac_ops ag71xx_phylink_mac_ops = {
+	.validate = ag71xx_mac_validate,
+	.mac_pcs_get_state = ag71xx_mac_pcs_get_state,
+	.mac_an_restart = ag71xx_mac_an_restart,
+	.mac_config = ag71xx_mac_config,
+	.mac_link_down = ag71xx_mac_link_down,
+	.mac_link_up = ag71xx_mac_link_up,
+};
 
-static int ag71xx_phy_connect(struct ag71xx *ag)
+static int ag71xx_phylink_setup(struct ag71xx *ag)
 {
-	struct device_node *np = ag->pdev->dev.of_node;
-	struct net_device *ndev = ag->ndev;
-	struct device_node *phy_node;
-	struct phy_device *phydev;
-	int ret;
-
-	if (of_phy_is_fixed_link(np)) {
-		ret = of_phy_register_fixed_link(np);
-		if (ret < 0) {
-			netif_err(ag, probe, ndev, "Failed to register fixed PHY link: %d\n",
-				  ret);
-			return ret;
-		}
+	struct phylink *phylink;
 
-		phy_node = of_node_get(np);
-	} else {
-		phy_node = of_parse_phandle(np, "phy-handle", 0);
-	}
+	ag->phylink_config.dev = &ag->ndev->dev;
+	ag->phylink_config.type = PHYLINK_NETDEV;
 
-	if (!phy_node) {
-		netif_err(ag, probe, ndev, "Could not find valid phy node\n");
-		return -ENODEV;
-	}
-
-	phydev = of_phy_connect(ag->ndev, phy_node, ag71xx_phy_link_adjust,
-				0, ag->phy_if_mode);
-
-	of_node_put(phy_node);
-
-	if (!phydev) {
-		netif_err(ag, probe, ndev, "Could not connect to PHY device\n");
-		return -ENODEV;
-	}
-
-	phy_attached_info(phydev);
+	phylink = phylink_create(&ag->phylink_config, ag->pdev->dev.fwnode,
+				 ag->phy_if_mode, &ag71xx_phylink_mac_ops);
+	if (IS_ERR(phylink))
+		return PTR_ERR(phylink);
 
+	ag->phylink = phylink;
 	return 0;
 }
 
@@ -1239,6 +1275,13 @@ static int ag71xx_open(struct net_device *ndev)
 	unsigned int max_frame_len;
 	int ret;
 
+	ret = phylink_of_phy_connect(ag->phylink, ag->pdev->dev.of_node, 0);
+	if (ret) {
+		netif_err(ag, link, ndev, "phylink_of_phy_connect filed with err: %i\n",
+			  ret);
+		goto err;
+	}
+
 	max_frame_len = ag71xx_max_frame_len(ndev->mtu);
 	ag->rx_buf_size =
 		SKB_DATA_ALIGN(max_frame_len + NET_SKB_PAD + NET_IP_ALIGN);
@@ -1251,11 +1294,7 @@ static int ag71xx_open(struct net_device *ndev)
 	if (ret)
 		goto err;
 
-	ret = ag71xx_phy_connect(ag);
-	if (ret)
-		goto err;
-
-	phy_start(ndev->phydev);
+	phylink_start(ag->phylink);
 
 	return 0;
 
@@ -1268,8 +1307,8 @@ static int ag71xx_stop(struct net_device *ndev)
 {
 	struct ag71xx *ag = netdev_priv(ndev);
 
-	phy_stop(ndev->phydev);
-	phy_disconnect(ndev->phydev);
+	phylink_stop(ag->phylink);
+	phylink_disconnect_phy(ag->phylink);
 	ag71xx_hw_disable(ag);
 
 	return 0;
@@ -1414,13 +1453,14 @@ static void ag71xx_restart_work_func(struct work_struct *work)
 {
 	struct ag71xx *ag = container_of(work, struct ag71xx,
 					 restart_work.work);
-	struct net_device *ndev = ag->ndev;
 
 	rtnl_lock();
 	ag71xx_hw_disable(ag);
 	ag71xx_hw_enable(ag);
-	if (ndev->phydev->link)
-		ag71xx_link_adjust(ag, false);
+
+	phylink_stop(ag->phylink);
+	phylink_start(ag->phylink);
+
 	rtnl_unlock();
 }
 
@@ -1759,6 +1799,12 @@ static int ag71xx_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ndev);
 
+	err = ag71xx_phylink_setup(ag);
+	if (err) {
+		netif_err(ag, probe, ndev, "failed to setup phylink (%d)\n", err);
+		goto err_mdio_remove;
+	}
+
 	err = register_netdev(ndev);
 	if (err) {
 		netif_err(ag, probe, ndev, "unable to register net device\n");
-- 
2.25.0

