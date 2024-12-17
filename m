Return-Path: <linux-mips+bounces-7069-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CAC9F59C7
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 23:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BAF116DCDB
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 22:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62941FA8DA;
	Tue, 17 Dec 2024 22:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="NovLET1v"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916021FA14A
	for <linux-mips@vger.kernel.org>; Tue, 17 Dec 2024 22:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734475509; cv=none; b=inRDgtmT6cnvErjZAI+CTgGoS5c14yQjJTQktFVOuVh/rsl2YNPFrrvyzyLIKtNMGQIdhPL9OICofhbOeaQcTpHBn71HDZTkwhA48wJs1imbCwNUHMzKfT7Nc8sx7rgpGas1BZP1HFFZcyTPAbFRQtUEIWVbioJlS3OSQmyAN6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734475509; c=relaxed/simple;
	bh=wpyafckqo22LEgmRFK5sFgm/oXxSyWyTD75JOh7g7E8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbO7do/BqTz+Pz2q2sbstHfMWGvTh5vVAjmmepvSH7tsP0cSyCGoduD0id1DQMMqUdlDHL7lMSv4nnjmoi7OwnvRvILubOpHBmiQ08ad2Sas/MP/iq6QWoxmJEN6Mhq2sqZSDQ1fU42oCQEdEThsHKpY7RP6iiURi8ZbqOp9Iow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=NovLET1v; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 681082C0BE6;
	Wed, 18 Dec 2024 11:45:03 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1734475503;
	bh=tSL6RfI2t9n3wBGEs2DS4vNx+r8WnUJ+JVL9uhfC3MQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NovLET1vsAnEwPt9ytAlesMDjSfFnD1SB5xGcMz9iqZ6G3qRSEue00XKDOaWFwP+z
	 3USJ16whLpud9SkcsMsoXb3m3n0A2DN6rhc26AHjrkg3QIcecOCxQ+Q9Lt88kxMxAK
	 A3om14PXOFBG92hFWTHoWmSmCIM7fzARL6UzsW+LyfC9tUSggXI2csyoj5f+qMZpjs
	 /zY2V+fkgASM3UEC+cFJWk/D8xEMg0vAlzy205VNpKrC/B3RuLa2jXKONpSWGaA6Uw
	 FcQWR9U6XLnGXpMe+D/ZIIGHs27HnJKcYSY3znRAKfqISq0dNgGVogDlh+8H8FmnjF
	 w5HbNLpTDnxRQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6761feef0003>; Wed, 18 Dec 2024 11:45:03 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 11C5513EE9B;
	Wed, 18 Dec 2024 11:45:03 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 0E6102806F6; Wed, 18 Dec 2024 11:45:03 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	tsbogend@alpha.franken.de,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 3/3] net: mdio: Add RTL9300 MDIO driver
Date: Wed, 18 Dec 2024 11:45:01 +1300
Message-ID: <20241217224501.398039-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241217224501.398039-1-chris.packham@alliedtelesis.co.nz>
References: <20241217224501.398039-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=6761feef a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=RZcAm9yDv7YA:10 a=cbL8N3GahYQ3_TZRw_4A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add a driver for the MDIO controller on the RTL9300 family of Ethernet
switches with integrated SoC. There are 4 physical SMI interfaces on the
RTL9300 but access is done using the switch ports so a single MDIO bus
is presented to the rest of the system.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v3:
    - Fix (another) off-by-one error
    Changes in v2:
    - Add clause 22 support
    - Remove commented out code
    - Formatting cleanup
    - Set MAX_PORTS correctly for MDIO interface
    - Fix off-by-one error in pn check

 drivers/net/mdio/Kconfig            |   7 +
 drivers/net/mdio/Makefile           |   1 +
 drivers/net/mdio/mdio-realtek-rtl.c | 341 ++++++++++++++++++++++++++++
 3 files changed, 349 insertions(+)
 create mode 100644 drivers/net/mdio/mdio-realtek-rtl.c

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index 4a7a303be2f7..0c6240c4a7e9 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -185,6 +185,13 @@ config MDIO_IPQ8064
 	  This driver supports the MDIO interface found in the network
 	  interface units of the IPQ8064 SoC
=20
+config MDIO_REALTEK_RTL
+	tristate "Realtek RTL9300 MDIO interface support"
+	depends on MACH_REALTEK_RTL || COMPILE_TEST
+	help
+	  This driver supports the MDIO interface found in the Realtek
+	  RTL9300 family of Ethernet switches with integrated SoC.
+
 config MDIO_REGMAP
 	tristate
 	help
diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
index 1015f0db4531..2cd8b491f301 100644
--- a/drivers/net/mdio/Makefile
+++ b/drivers/net/mdio/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_MDIO_MOXART)		+=3D mdio-moxart.o
 obj-$(CONFIG_MDIO_MSCC_MIIM)		+=3D mdio-mscc-miim.o
 obj-$(CONFIG_MDIO_MVUSB)		+=3D mdio-mvusb.o
 obj-$(CONFIG_MDIO_OCTEON)		+=3D mdio-octeon.o
+obj-$(CONFIG_MDIO_REALTEK_RTL)		+=3D mdio-realtek-rtl.o
 obj-$(CONFIG_MDIO_REGMAP)		+=3D mdio-regmap.o
 obj-$(CONFIG_MDIO_SUN4I)		+=3D mdio-sun4i.o
 obj-$(CONFIG_MDIO_THUNDER)		+=3D mdio-thunder.o
diff --git a/drivers/net/mdio/mdio-realtek-rtl.c b/drivers/net/mdio/mdio-=
realtek-rtl.c
new file mode 100644
index 000000000000..d61a9273e86f
--- /dev/null
+++ b/drivers/net/mdio/mdio-realtek-rtl.c
@@ -0,0 +1,341 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MDIO controller for RTL9300 switches with integrated SoC.
+ *
+ * The MDIO communication is abstracted by the switch. At the software l=
evel
+ * communication uses the switch port to address the PHY with the actual=
 MDIO
+ * bus and address having been setup via the realtek,smi-address propert=
y.
+ */
+
+#include <linux/mdio.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of_mdio.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define SMI_GLB_CTRL			0x000
+#define   GLB_CTRL_INTF_SEL(intf)	BIT(16 + (intf))
+#define SMI_PORT0_15_POLLING_SEL	0x008
+#define SMI_ACCESS_PHY_CTRL_0		0x170
+#define SMI_ACCESS_PHY_CTRL_1		0x174
+#define   PHY_CTRL_RWOP			BIT(2)
+#define   PHY_CTRL_TYPE			BIT(1)
+#define   PHY_CTRL_CMD			BIT(0)
+#define   PHY_CTRL_FAIL			BIT(25)
+#define SMI_ACCESS_PHY_CTRL_2		0x178
+#define SMI_ACCESS_PHY_CTRL_3		0x17c
+#define SMI_PORT0_5_ADDR_CTRL		0x180
+
+#define MAX_PORTS       28
+#define MAX_SMI_BUSSES  4
+#define MAX_SMI_ADDR	0x1f
+
+struct realtek_mdio_priv {
+	struct regmap *regmap;
+	u8 smi_bus[MAX_PORTS];
+	u8 smi_addr[MAX_PORTS];
+	bool smi_bus_isc45[MAX_SMI_BUSSES];
+	u32 reg_base;
+};
+
+static int realtek_mdio_wait_ready(struct realtek_mdio_priv *priv)
+{
+	struct regmap *regmap =3D priv->regmap;
+	u32 reg_base =3D priv->reg_base;
+	u32 val;
+
+	return regmap_read_poll_timeout(regmap, reg_base + SMI_ACCESS_PHY_CTRL_=
1,
+					val, !(val & PHY_CTRL_CMD), 10, 500);
+}
+
+static int realtek_mdio_read_c22(struct mii_bus *bus, int phy_id, int re=
gnum)
+{
+	struct realtek_mdio_priv *priv =3D bus->priv;
+	struct regmap *regmap =3D priv->regmap;
+	u32 reg_base =3D priv->reg_base;
+	u32 val;
+	int err;
+
+	err =3D realtek_mdio_wait_ready(priv);
+	if (err)
+		return err;
+
+	err =3D regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_2, phy_id <=
< 16);
+	if (err)
+		return err;
+
+	err =3D regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_1,
+			   regnum << 20 |  0x1f << 15 | 0xfff << 3 | PHY_CTRL_CMD);
+	if (err)
+		return err;
+
+	err =3D realtek_mdio_wait_ready(priv);
+	if (err)
+		return err;
+
+	err =3D regmap_read(regmap, reg_base + SMI_ACCESS_PHY_CTRL_2, &val);
+	if (err)
+		return err;
+
+	return val & 0xffff;
+}
+
+static int realtek_mdio_write_c22(struct mii_bus *bus, int phy_id, int r=
egnum, u16 value)
+{
+	struct realtek_mdio_priv *priv =3D bus->priv;
+	struct regmap *regmap =3D priv->regmap;
+	u32 reg_base =3D priv->reg_base;
+	u32 val;
+	int err;
+
+	err =3D realtek_mdio_wait_ready(priv);
+	if (err)
+		return err;
+
+	err =3D regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_0, BIT(phy_=
id));
+	if (err)
+		return err;
+
+	err =3D regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_2, value <<=
 16);
+	if (err)
+		return err;
+
+	err =3D regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_1,
+			   regnum << 20 |  0x1f << 15 | 0xfff << 3 | PHY_CTRL_RWOP | PHY_CTRL=
_CMD);
+	if (err)
+		return err;
+
+	err =3D regmap_read_poll_timeout(regmap, reg_base + SMI_ACCESS_PHY_CTRL=
_1,
+				       val, !(val & PHY_CTRL_CMD), 10, 100);
+	if (err)
+		return err;
+
+	if (val & PHY_CTRL_FAIL)
+		return -ENXIO;
+
+	return 0;
+}
+
+static int realtek_mdio_read_c45(struct mii_bus *bus, int phy_id, int de=
v_addr, int regnum)
+{
+	struct realtek_mdio_priv *priv =3D bus->priv;
+	struct regmap *regmap =3D priv->regmap;
+	u32 reg_base =3D priv->reg_base;
+	u32 val;
+	int err;
+
+	err =3D realtek_mdio_wait_ready(priv);
+	if (err)
+		return err;
+
+	err =3D regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_2, phy_id <=
< 16);
+	if (err)
+		return err;
+
+	err =3D regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_3,
+			   dev_addr << 16 | (regnum & 0xffff));
+	if (err)
+		return err;
+
+	err =3D regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_1,
+			   PHY_CTRL_TYPE | PHY_CTRL_CMD);
+	if (err)
+		return err;
+
+	err =3D realtek_mdio_wait_ready(priv);
+	if (err)
+		return err;
+
+	err =3D regmap_read(regmap, reg_base + SMI_ACCESS_PHY_CTRL_2, &val);
+	if (err)
+		return err;
+
+	return val & 0xffff;
+}
+
+static int realtek_mdio_write_c45(struct mii_bus *bus, int phy_id, int d=
ev_addr,
+				  int regnum, u16 value)
+{
+	struct realtek_mdio_priv *priv =3D bus->priv;
+	struct regmap *regmap =3D priv->regmap;
+	u32 reg_base =3D priv->reg_base;
+	u32 val;
+	int err;
+
+	err =3D realtek_mdio_wait_ready(priv);
+	if (err)
+		return err;
+
+	err =3D regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_0, BIT(phy_=
id));
+	if (err)
+		return err;
+
+	err =3D regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_2, value <<=
 16);
+	if (err)
+		return err;
+
+	err =3D regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_3,
+			   dev_addr << 16 | (regnum & 0xffff));
+	if (err)
+		return err;
+
+	err =3D regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_1,
+			   PHY_CTRL_RWOP | PHY_CTRL_TYPE | PHY_CTRL_CMD);
+	if (err)
+		return err;
+
+	err =3D regmap_read_poll_timeout(regmap, reg_base + SMI_ACCESS_PHY_CTRL=
_1,
+				       val, !(val & PHY_CTRL_CMD), 10, 100);
+	if (err)
+		return err;
+
+	if (val & PHY_CTRL_FAIL)
+		return -ENXIO;
+
+	return 0;
+}
+
+static int realtek_mdiobus_init(struct realtek_mdio_priv *priv)
+{
+	u32 glb_ctrl_mask =3D 0, glb_ctrl_val =3D 0;
+	struct regmap *regmap =3D priv->regmap;
+	u32 reg_base =3D priv->reg_base;
+	u32 port_addr[5] =3D { 0 };
+	u32 poll_sel[2] =3D { 0 };
+	int i, err;
+
+	/* Associate the port with the SMI interface and PHY */
+	for (i =3D 0; i < MAX_PORTS; i++) {
+		int pos;
+
+		if (priv->smi_bus[i] > 3)
+			continue;
+
+		pos =3D (i % 6) * 5;
+		port_addr[i / 6] |=3D priv->smi_addr[i] << pos;
+
+		pos =3D (i % 16) * 2;
+		poll_sel[i / 16] |=3D priv->smi_bus[i] << pos;
+	}
+
+	/* Put the interfaces into C45 mode if required */
+	for (i =3D 0; i < MAX_SMI_BUSSES; i++) {
+		if (priv->smi_bus_isc45[i]) {
+			glb_ctrl_mask |=3D GLB_CTRL_INTF_SEL(i);
+			glb_ctrl_val |=3D GLB_CTRL_INTF_SEL(i);
+		}
+	}
+
+	err =3D regmap_bulk_write(regmap, reg_base + SMI_PORT0_5_ADDR_CTRL,
+				port_addr, 5);
+	if (err)
+		return err;
+
+	err =3D regmap_bulk_write(regmap, reg_base + SMI_PORT0_15_POLLING_SEL,
+				poll_sel, 2);
+	if (err)
+		return err;
+
+	err =3D regmap_update_bits(regmap, reg_base + SMI_GLB_CTRL,
+				 glb_ctrl_mask, glb_ctrl_val);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int realtek_mdiobus_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct realtek_mdio_priv *priv;
+	struct fwnode_handle *child;
+	struct mii_bus *bus;
+	int err;
+
+	bus =3D devm_mdiobus_alloc_size(dev, sizeof(*priv));
+	if (!bus)
+		return -ENOMEM;
+
+	bus->name =3D "Reaktek Switch MDIO Bus";
+	bus->read =3D realtek_mdio_read_c22;
+	bus->write =3D realtek_mdio_write_c22;
+	bus->read_c45 =3D realtek_mdio_read_c45;
+	bus->write_c45 =3D  realtek_mdio_write_c45;
+	bus->parent =3D dev;
+	priv =3D bus->priv;
+
+	priv->regmap =3D syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	err =3D device_property_read_u32(dev, "reg", &priv->reg_base);
+	if (err)
+		return err;
+
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
+
+	device_for_each_child_node(dev, child) {
+		u32 pn, smi_addr[2];
+
+		err =3D fwnode_property_read_u32(child, "reg", &pn);
+		if (err)
+			return err;
+
+		if (pn >=3D MAX_PORTS)
+			return dev_err_probe(dev, -EINVAL, "illegal port number %d\n", pn);
+
+		err =3D fwnode_property_read_u32_array(child, "realtek,smi-address", s=
mi_addr, 2);
+		if (err) {
+			smi_addr[0] =3D 0;
+			smi_addr[1] =3D pn;
+		}
+
+		if (smi_addr[0] >=3D MAX_SMI_BUSSES)
+			return dev_err_probe(dev, -EINVAL, "illegal smi bus number %d\n",
+					     smi_addr[0]);
+
+		if (smi_addr[1] > MAX_SMI_ADDR)
+			return dev_err_probe(dev, -EINVAL, "illegal smi addr %d\n", smi_addr[=
1]);
+
+		if (fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45"))
+			priv->smi_bus_isc45[smi_addr[0]] =3D true;
+
+		priv->smi_bus[pn] =3D smi_addr[0];
+		priv->smi_addr[pn] =3D smi_addr[1];
+	}
+
+	err =3D realtek_mdiobus_init(priv);
+	if (err)
+		return dev_err_probe(dev, err, "failed to initialise MDIO bus controll=
er\n");
+
+	err =3D devm_of_mdiobus_register(dev, bus, dev->of_node);
+	if (err)
+		return dev_err_probe(dev, err, "cannot register MDIO bus\n");
+
+	return 0;
+}
+
+static const struct of_device_id realtek_mdio_ids[] =3D {
+	{ .compatible =3D "realtek,rtl9301-mdio" },
+	{ .compatible =3D "realtek,rtl9302b-mdio" },
+	{ .compatible =3D "realtek,rtl9302c-mdio" },
+	{ .compatible =3D "realtek,rtl9303-mdio" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, realtek_mdio_ids);
+
+static struct platform_driver rtl9300_mdio_driver =3D {
+	.probe =3D realtek_mdiobus_probe,
+	.driver =3D {
+		.name =3D "mdio-rtl9300",
+		.of_match_table =3D realtek_mdio_ids,
+	},
+};
+
+module_platform_driver(rtl9300_mdio_driver);
+
+MODULE_DESCRIPTION("RTL9300 MDIO driver");
+MODULE_LICENSE("GPL");
--=20
2.47.1


