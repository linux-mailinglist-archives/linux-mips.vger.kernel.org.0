Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C93A6DBB8C
	for <lists+linux-mips@lfdr.de>; Sat,  8 Apr 2023 16:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbjDHOVZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Apr 2023 10:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjDHOVZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Apr 2023 10:21:25 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 08 Apr 2023 07:21:21 PDT
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64F3B745
        for <linux-mips@vger.kernel.org>; Sat,  8 Apr 2023 07:21:21 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id l9QLp3IARv5uIl9QMpqhGQ; Sat, 08 Apr 2023 16:20:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1680963617; bh=wifWBJ6qfgodTW6lqO+1Lc2Mdnrjnbgk+jwslnoMwWg=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=D5j69f3RhllFFYSnhJ76YfGhN4yjhnL/xfX866qOIVX1ju135O2RgHtVBXpjYjbXa
         eTls1BG48NvQ12hRu99EdnwstnOENEHKiX6V0ZgRcZfVHg7dXVxwPneZiyLYM98fY8
         IlUczfEmUxb8vX70zvxTf3maSE2tGFMRaif/DEBEy/lRL+thz7GfXzvC4m7UYr7DMR
         QRan4GqBM9ENNJGHgEC1fPxKaHwwo55Gj5+91EdvgpHITR2FkkuQEFU7bHxwPQbSM6
         32vC2L+x6o4TR9ZoTdZTmK9AF9zEfbT/gaSqpHvOD8n70o0865d090XBSM3Cih0rsU
         hBfnRKEwOf/3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1680963617; bh=wifWBJ6qfgodTW6lqO+1Lc2Mdnrjnbgk+jwslnoMwWg=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=D5j69f3RhllFFYSnhJ76YfGhN4yjhnL/xfX866qOIVX1ju135O2RgHtVBXpjYjbXa
         eTls1BG48NvQ12hRu99EdnwstnOENEHKiX6V0ZgRcZfVHg7dXVxwPneZiyLYM98fY8
         IlUczfEmUxb8vX70zvxTf3maSE2tGFMRaif/DEBEy/lRL+thz7GfXzvC4m7UYr7DMR
         QRan4GqBM9ENNJGHgEC1fPxKaHwwo55Gj5+91EdvgpHITR2FkkuQEFU7bHxwPQbSM6
         32vC2L+x6o4TR9ZoTdZTmK9AF9zEfbT/gaSqpHvOD8n70o0865d090XBSM3Cih0rsU
         hBfnRKEwOf/3Q==
Date:   Sat, 8 Apr 2023 16:20:13 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        YunQiang Su <wzssyqa@gmail.com>,
        Anushka Singh <anushka.singh1@wipro.com>,
        Lukasz Majczak <lma@semihalf.com>,
        Peter Swain <peter.swain@marvell.com>
Subject: Re: Moving Octeon ethernet out of staging
Message-ID: <ZDF4HdeoFWiDP1DT@lenoch>
References: <Y6rsbaT0l5cNBGbu@lenoch>
 <520df165-305c-2e18-568c-dfbfc1ce1a26@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <520df165-305c-2e18-568c-dfbfc1ce1a26@alliedtelesis.co.nz>
X-CMAE-Envelope: MS4wfCEIMDjpYhsSnOPhBxhVKMKsqPeGt4oxATJdPXhXJtfDlyhCEedaIPnb2/W7w9Rwh9YNGBxdhvjYJfNtKvi8MfjSNL4gbG8ZaBSXUJ74Gm5Ej3zPaFUF
 RS6/Oxj1XcUlrLGWrQ1HAn+8F70YVyaGgCdDu+Gn10bCqbexDsk7g/Q2TNaZC8EdLdNHPcIpcxHVX3jZmvsKxoUKixkJ1UzkNPMjuAGJ5hBLGuzGryzn+rY4
 2XsnAyWADboxVuHJjnl6ZqVHfa6xWMWQSzGkB5Tv1GrroeBIwAMFC5Vrmv/iBIvoXKrd5AZG/EpYZj3kF2K43RCJp4R9skF97tzMQw0+hd9XyGYJNyr6tlW6
 C3I/JPvQPMMvGIGU4+MzG1ViDDHrVA==
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Chris,

[snip]
On Sun, Jan 08, 2023 at 08:59:55PM +0000, Chris Packham wrote:
> From our end we still have our Octeon MIPS based routers which we still 
> want to support but for various reasons these aren't seeing the kernel 
> updates that I might like. And because these are technically legacy I'm 
> having a hard time convincing anyone to dedicate any resources to 
> helping with any effort to improve these drivers (whatever is happening 
> is just "spare time" work).

At this end, the intention is still to use mainline kernel. So far the
show-stoppers are SFP and AGL support. Therefore TODO list looks like:
1. Covert driver to use PHYLINK (see attached patch)
2. Implement phylink_mac_ops using code from arch/mips/cavium-octeon/executive
   (cvmx-helper-rgmii.c, cvmx-helper-sgmii.c, etc...)
3. Now it should be easy to add AGL after DT representation is decided.
4. Fix GPIO driver as it does not currently service interrupts, causing
   troubles to both SFP and MDIO hanging there.
5. Let people test it.
6. Move out of staging ;-)

> As a user I can say that we'd probably be OK if we had to make some dts 
> updates as we ship our kernel+dtb+initrd as a FIT image so we can update 
> the kernel+dtb at the same time if necessary.

Indeed, it all boils down to DT representation. I'd probably go with
topology, interfaces and port register address taken from device tree.

Patch bellow does not make things worse and you'll get SFP for free.
There are some glitches, for example setting ports up:
octeon_ethernet 11800a0000000.pip eth0: configuring for inband/1000base-x link mode
octeon_ethernet 11800a0000000.pip eth1: PHY [8001180000001800:00] driver [Generic PHY] (irq=POLL)
octeon_ethernet 11800a0000000.pip eth1: configuring for phy/sgmii link mode
octeon_ethernet 11800a0000000.pip eth2: PHY [8001180000001800:01] driver [Generic PHY] (irq=POLL)
octeon_ethernet 11800a0000000.pip eth2: configuring for phy/sgmii link mode
octeon_ethernet 11800a0000000.pip eth0: switched to inband/sgmii link mode
octeon_ethernet 11800a0000000.pip eth0: PHY [i2c:sfp:16] driver [Marvell 88E1111] (irq=POLL)
octeon_ethernet 11800a0000000.pip eth3: PHY [8001180000001800:02] driver [Marvell 88E1340S] (irq=25)
octeon_ethernet 11800a0000000.pip eth3: configuring for phy/sgmii link mode
octeon_ethernet 11800a0000000.pip eth4: PHY [8001180000001800:03] driver [Marvell 88E1340S] (irq=25)
octeon_ethernet 11800a0000000.pip eth4: configuring for phy/sgmii link mode
octeon_ethernet 11800a0000000.pip eth1: Link is Up - 100Mbps/Full - flow control off
I do not know why are eth1 and eth2 attached to Generic PHY, while
the rest to the Marvell 88E1111 - all nodes are the same.

Comments welcome,
	ladis

From: Ladislav Michl <ladis@linux-mips.org>
Subject: [PATCH] staging: octeon: phylink

---
 drivers/staging/octeon/Kconfig           |   2 +-
 drivers/staging/octeon/ethernet-mdio.c   | 171 ++++++++++++++---------
 drivers/staging/octeon/ethernet-rgmii.c  |  13 +-
 drivers/staging/octeon/ethernet.c        |  55 +++-----
 drivers/staging/octeon/octeon-ethernet.h |   8 +-
 5 files changed, 131 insertions(+), 118 deletions(-)

diff --git a/drivers/staging/octeon/Kconfig b/drivers/staging/octeon/Kconfig
index 5319909eb2f6..fda90025710d 100644
--- a/drivers/staging/octeon/Kconfig
+++ b/drivers/staging/octeon/Kconfig
@@ -3,7 +3,7 @@ config OCTEON_ETHERNET
 	tristate "Cavium Networks Octeon Ethernet support"
 	depends on CAVIUM_OCTEON_SOC || COMPILE_TEST
 	depends on NETDEVICES
-	select PHYLIB
+	select PHYLINK
 	select MDIO_OCTEON
 	help
 	  This driver supports the builtin ethernet ports on Cavium
diff --git a/drivers/staging/octeon/ethernet-mdio.c b/drivers/staging/octeon/ethernet-mdio.c
index b3049108edc4..a14fb4dbb2fd 100644
--- a/drivers/staging/octeon/ethernet-mdio.c
+++ b/drivers/staging/octeon/ethernet-mdio.c
@@ -9,7 +9,7 @@
 #include <linux/ethtool.h>
 #include <linux/phy.h>
 #include <linux/ratelimit.h>
-#include <linux/of_mdio.h>
+#include <linux/of_net.h>
 #include <generated/utsrelease.h>
 #include <net/dst.h>
 
@@ -26,23 +26,27 @@ static void cvm_oct_get_drvinfo(struct net_device *dev,
 	strscpy(info->bus_info, "Builtin", sizeof(info->bus_info));
 }
 
-static int cvm_oct_nway_reset(struct net_device *dev)
+static int cvm_oct_get_link_ksettings(struct net_device *dev,
+				      struct ethtool_link_ksettings *cmd)
 {
-	if (!capable(CAP_NET_ADMIN))
-		return -EPERM;
+	struct octeon_ethernet *priv = netdev_priv(dev);
+
+	return phylink_ethtool_ksettings_get(priv->phylink, cmd);
+}
 
-	if (dev->phydev)
-		return phy_start_aneg(dev->phydev);
+static int cvm_oct_set_link_ksettings(struct net_device *dev,
+				      const struct ethtool_link_ksettings *cmd)
+{
+	struct octeon_ethernet *priv = netdev_priv(dev);
 
-	return -EINVAL;
+	return phylink_ethtool_ksettings_set(priv->phylink, cmd);
 }
 
 const struct ethtool_ops cvm_oct_ethtool_ops = {
 	.get_drvinfo = cvm_oct_get_drvinfo,
-	.nway_reset = cvm_oct_nway_reset,
 	.get_link = ethtool_op_get_link,
-	.get_link_ksettings = phy_ethtool_get_link_ksettings,
-	.set_link_ksettings = phy_ethtool_set_link_ksettings,
+	.get_link_ksettings = cvm_oct_get_link_ksettings,
+	.set_link_ksettings = cvm_oct_set_link_ksettings,
 };
 
 /**
@@ -55,53 +59,80 @@ const struct ethtool_ops cvm_oct_ethtool_ops = {
  */
 int cvm_oct_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
-	if (!netif_running(dev))
-		return -EINVAL;
+	struct octeon_ethernet *priv = netdev_priv(dev);
 
-	if (!dev->phydev)
-		return -EINVAL;
+	return phylink_mii_ioctl(priv->phylink, rq, cmd);
+}
 
-	return phy_mii_ioctl(dev->phydev, rq, cmd);
+static void cvm_oct_mac_get_state(struct phylink_config *config,
+				  struct phylink_link_state *state)
+{
+	union cvmx_helper_link_info link_info;
+	struct net_device *dev = to_net_dev(config->dev);
+	struct octeon_ethernet *priv = netdev_priv(dev);
+
+	link_info = cvmx_helper_link_get(priv->port);
+	state->link = link_info.s.link_up;
+	state->duplex = link_info.s.full_duplex ? DUPLEX_FULL : DUPLEX_HALF;
+	state->speed = link_info.s.speed;
 }
 
-void cvm_oct_note_carrier(struct octeon_ethernet *priv,
-			  union cvmx_helper_link_info li)
+static void cvm_oct_mac_config(struct phylink_config *config,
+			       unsigned int mode,
+			       const struct phylink_link_state *state)
 {
-	if (li.s.link_up) {
-		pr_notice_ratelimited("%s: %u Mbps %s duplex, port %d, queue %d\n",
-				      netdev_name(priv->netdev), li.s.speed,
-				      (li.s.full_duplex) ? "Full" : "Half",
-				      priv->port, priv->queue);
-	} else {
-		pr_notice_ratelimited("%s: Link down\n",
-				      netdev_name(priv->netdev));
-	}
 }
 
-void cvm_oct_adjust_link(struct net_device *dev)
+static void cvm_oct_mac_link_down(struct phylink_config *config,
+				  unsigned int mode, phy_interface_t interface)
 {
+	union cvmx_helper_link_info link_info;
+	struct net_device *dev = to_net_dev(config->dev);
 	struct octeon_ethernet *priv = netdev_priv(dev);
+
+	link_info.u64		= 0;
+	link_info.s.link_up	= 0;
+	link_info.s.full_duplex = 0;
+	link_info.s.speed	= 0;
+	priv->link_info		= link_info.u64;
+
+	cvmx_helper_link_set(priv->port, link_info);
+
+	priv->poll_used = false;
+}
+
+static void cvm_oct_mac_link_up(struct phylink_config *config,
+				struct phy_device *phy,
+				unsigned int mode, phy_interface_t interface,
+				int speed, int duplex,
+				bool tx_pause, bool rx_pause)
+{
 	union cvmx_helper_link_info link_info;
+	struct net_device *dev = to_net_dev(config->dev);
+	struct octeon_ethernet *priv = netdev_priv(dev);
 
 	link_info.u64		= 0;
-	link_info.s.link_up	= dev->phydev->link ? 1 : 0;
-	link_info.s.full_duplex = dev->phydev->duplex ? 1 : 0;
-	link_info.s.speed	= dev->phydev->speed;
+	link_info.s.link_up	= 1;
+	link_info.s.full_duplex = duplex == DUPLEX_FULL ? 1 : 0;
+	link_info.s.speed	= speed;
 	priv->link_info		= link_info.u64;
 
-	/*
-	 * The polling task need to know about link status changes.
-	 */
-	if (priv->poll)
-		priv->poll(dev);
+	cvmx_helper_link_set(priv->port, link_info);
 
-	if (priv->last_link != dev->phydev->link) {
-		priv->last_link = dev->phydev->link;
-		cvmx_helper_link_set(priv->port, link_info);
-		cvm_oct_note_carrier(priv, link_info);
+	if (!phy && priv->poll) {
+		priv->poll_used = true;
+		priv->poll(dev);
 	}
 }
 
+static const struct phylink_mac_ops cvm_oct_phylink_ops = {
+	.validate = phylink_generic_validate,
+	.mac_pcs_get_state = cvm_oct_mac_get_state,
+	.mac_config = cvm_oct_mac_config,
+	.mac_link_down = cvm_oct_mac_link_down,
+	.mac_link_up = cvm_oct_mac_link_up,
+};
+
 int cvm_oct_common_stop(struct net_device *dev)
 {
 	struct octeon_ethernet *priv = netdev_priv(dev);
@@ -116,15 +147,14 @@ int cvm_oct_common_stop(struct net_device *dev)
 
 	priv->poll = NULL;
 
-	if (dev->phydev)
-		phy_disconnect(dev->phydev);
+	phylink_stop(priv->phylink);
+	phylink_disconnect_phy(priv->phylink);
 
 	if (priv->last_link) {
 		link_info.u64 = 0;
 		priv->last_link = 0;
 
 		cvmx_helper_link_set(priv->port, link_info);
-		cvm_oct_note_carrier(priv, link_info);
 	}
 	return 0;
 }
@@ -138,34 +168,45 @@ int cvm_oct_common_stop(struct net_device *dev)
  */
 int cvm_oct_phy_setup_device(struct net_device *dev)
 {
+	phy_interface_t phy_mode;
+	struct phylink *phylink;
 	struct octeon_ethernet *priv = netdev_priv(dev);
-	struct device_node *phy_node;
-	struct phy_device *phydev = NULL;
 
-	if (!priv->of_node)
-		goto no_phy;
-
-	phy_node = of_parse_phandle(priv->of_node, "phy-handle", 0);
-	if (!phy_node && of_phy_is_fixed_link(priv->of_node))
-		phy_node = of_node_get(priv->of_node);
-	if (!phy_node)
-		goto no_phy;
+	priv->phylink_config.dev = &dev->dev;
+	priv->phylink_config.type = PHYLINK_NETDEV;
+	priv->phylink_config.mac_capabilities = MAC_ASYM_PAUSE |
+						MAC_10 | MAC_100 | MAC_1000;
+	__set_bit(PHY_INTERFACE_MODE_MII,
+		  priv->phylink_config.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_RMII,
+		  priv->phylink_config.supported_interfaces);
+
+	switch (priv->imode) {
+	case CVMX_HELPER_INTERFACE_MODE_RGMII:
+		phy_interface_set_rgmii(priv->phylink_config.supported_interfaces);
+		break;
+	case CVMX_HELPER_INTERFACE_MODE_SGMII:
+		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+			  priv->phylink_config.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_SGMII,
+			  priv->phylink_config.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_QSGMII,
+			  priv->phylink_config.supported_interfaces);
+		break;
+	default:
+		break;
+	}
 
-	phydev = of_phy_connect(dev, phy_node, cvm_oct_adjust_link, 0,
-				priv->phy_mode);
-	of_node_put(phy_node);
+	if (of_get_phy_mode(priv->of_node, &phy_mode) == 0)
+		priv->phy_mode = phy_mode;
 
-	if (!phydev)
-		return -EPROBE_DEFER;
+	phylink = phylink_create(&priv->phylink_config,
+				 of_fwnode_handle(priv->of_node),
+				 priv->phy_mode, &cvm_oct_phylink_ops);
+	if (IS_ERR(phylink))
+		return PTR_ERR(phylink);
 
-	priv->last_link = 0;
-	phy_start(phydev);
+	priv->phylink = phylink;
 
-	return 0;
-no_phy:
-	/* If there is no phy, assume a direct MAC connection and that
-	 * the link is up.
-	 */
-	netif_carrier_on(dev);
 	return 0;
 }
diff --git a/drivers/staging/octeon/ethernet-rgmii.c b/drivers/staging/octeon/ethernet-rgmii.c
index 0c4fac31540a..8c6eb0b87254 100644
--- a/drivers/staging/octeon/ethernet-rgmii.c
+++ b/drivers/staging/octeon/ethernet-rgmii.c
@@ -115,17 +115,8 @@ static void cvm_oct_rgmii_poll(struct net_device *dev)
 
 	cvm_oct_check_preamble_errors(dev);
 
-	if (likely(!status_change))
-		return;
-
-	/* Tell core. */
-	if (link_info.s.link_up) {
-		if (!netif_carrier_ok(dev))
-			netif_carrier_on(dev);
-	} else if (netif_carrier_ok(dev)) {
-		netif_carrier_off(dev);
-	}
-	cvm_oct_note_carrier(priv, link_info);
+	if (likely(status_change))
+		phylink_mac_change(priv->phylink, link_info.s.link_up);
 }
 
 int cvm_oct_rgmii_open(struct net_device *dev)
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 949ef51bf896..20b06fb3649c 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -10,7 +10,7 @@
 #include <linux/module.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
-#include <linux/phy.h>
+#include <linux/phylink.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/of_mdio.h>
@@ -128,7 +128,7 @@ static void cvm_oct_periodic_worker(struct work_struct *work)
 						    struct octeon_ethernet,
 						    port_periodic_work.work);
 
-	if (priv->poll)
+	if (priv->poll_used && priv->poll)
 		priv->poll(cvm_oct_device[priv->port]);
 
 	cvm_oct_device[priv->port]->netdev_ops->ndo_get_stats
@@ -446,23 +446,19 @@ int cvm_oct_common_init(struct net_device *dev)
 
 void cvm_oct_common_uninit(struct net_device *dev)
 {
-	if (dev->phydev)
-		phy_disconnect(dev->phydev);
+	struct octeon_ethernet *priv = netdev_priv(dev);
+
+	phylink_destroy(priv->phylink);
 }
 
 int cvm_oct_common_open(struct net_device *dev,
 			void (*link_poll)(struct net_device *))
 {
+	int err;
 	union cvmx_gmxx_prtx_cfg gmx_cfg;
 	struct octeon_ethernet *priv = netdev_priv(dev);
 	int interface = INTERFACE(priv->port);
 	int index = INDEX(priv->port);
-	union cvmx_helper_link_info link_info;
-	int rv;
-
-	rv = cvm_oct_phy_setup_device(dev);
-	if (rv)
-		return rv;
 
 	gmx_cfg.u64 = cvmx_read_csr(CVMX_GMXX_PRTX_CFG(index, interface));
 	gmx_cfg.s.en = 1;
@@ -473,20 +469,17 @@ int cvm_oct_common_open(struct net_device *dev,
 	if (octeon_is_simulation())
 		return 0;
 
-	if (dev->phydev) {
-		int r = phy_read_status(dev->phydev);
-
-		if (r == 0 && dev->phydev->link == 0)
-			netif_carrier_off(dev);
-		cvm_oct_adjust_link(dev);
-	} else {
-		link_info = cvmx_helper_link_get(priv->port);
-		if (!link_info.s.link_up)
-			netif_carrier_off(dev);
-		priv->poll = link_poll;
-		link_poll(dev);
+	err = phylink_of_phy_connect(priv->phylink, priv->of_node, 0);
+	if (err) {
+		netdev_err(dev, "Could not attach PHY (%d)\n", err);
+		return err;
 	}
 
+	priv->poll_used = false;
+	priv->poll = link_poll;
+
+	phylink_start(priv->phylink);
+
 	return 0;
 }
 
@@ -504,13 +497,7 @@ void cvm_oct_link_poll(struct net_device *dev)
 	else
 		priv->link_info = link_info.u64;
 
-	if (link_info.s.link_up) {
-		if (!netif_carrier_ok(dev))
-			netif_carrier_on(dev);
-	} else if (netif_carrier_ok(dev)) {
-		netif_carrier_off(dev);
-	}
-	cvm_oct_note_carrier(priv, link_info);
+	phylink_mac_change(priv->phylink, link_info.s.link_up);
 }
 
 static int cvm_oct_xaui_open(struct net_device *dev)
@@ -797,7 +784,6 @@ static int cvm_oct_probe(struct platform_device *pdev)
 		}
 	}
 
-	num_interfaces = cvmx_helper_get_number_of_interfaces();
 	for (interface = 0; interface < num_interfaces; interface++) {
 		cvmx_helper_interface_mode_t imode =
 		    cvmx_helper_interface_get_mode(interface);
@@ -886,13 +872,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 				break;
 			}
 
-			if (priv->of_node && of_phy_is_fixed_link(priv->of_node)) {
-				if (of_phy_register_fixed_link(priv->of_node)) {
-					netdev_err(dev, "Failed to register fixed link for interface %d, port %d\n",
-						   interface, priv->port);
-					dev->netdev_ops = NULL;
-				}
-			}
+			if (cvm_oct_phy_setup_device(dev))
+				dev->netdev_ops = NULL;
 
 			if (!dev->netdev_ops) {
 				free_netdev(dev);
diff --git a/drivers/staging/octeon/octeon-ethernet.h b/drivers/staging/octeon/octeon-ethernet.h
index a6140705706f..fc9bc0974a2a 100644
--- a/drivers/staging/octeon/octeon-ethernet.h
+++ b/drivers/staging/octeon/octeon-ethernet.h
@@ -12,7 +12,7 @@
 #define OCTEON_ETHERNET_H
 
 #include <linux/of.h>
-#include <linux/phy.h>
+#include <linux/phylink.h>
 
 #ifdef CONFIG_CAVIUM_OCTEON_SOC
 
@@ -62,6 +62,8 @@ struct octeon_ethernet {
 	int imode;
 	/* PHY mode */
 	phy_interface_t phy_mode;
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
 	/* List of outstanding tx buffers per queue */
 	struct sk_buff_head tx_free_list[16];
 	unsigned int last_speed;
@@ -69,6 +71,7 @@ struct octeon_ethernet {
 	/* Last negotiated link state */
 	u64 link_info;
 	/* Called periodically to check link status */
+	bool poll_used;
 	void (*poll)(struct net_device *dev);
 	struct delayed_work	port_periodic_work;
 	struct device_node	*of_node;
@@ -86,12 +89,9 @@ void cvm_oct_spi_uninit(struct net_device *dev);
 
 int cvm_oct_common_init(struct net_device *dev);
 void cvm_oct_common_uninit(struct net_device *dev);
-void cvm_oct_adjust_link(struct net_device *dev);
 int cvm_oct_common_stop(struct net_device *dev);
 int cvm_oct_common_open(struct net_device *dev,
 			void (*link_poll)(struct net_device *));
-void cvm_oct_note_carrier(struct octeon_ethernet *priv,
-			  union cvmx_helper_link_info li);
 void cvm_oct_link_poll(struct net_device *dev);
 
 extern int always_use_pow;
-- 
2.32.0

