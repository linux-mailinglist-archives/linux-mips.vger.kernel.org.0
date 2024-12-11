Return-Path: <linux-mips+bounces-6958-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDAB9EDC4E
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 00:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0EE3188A5FA
	for <lists+linux-mips@lfdr.de>; Wed, 11 Dec 2024 23:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364431F4E4F;
	Wed, 11 Dec 2024 23:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="rBxY97+2"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB171DB933
	for <linux-mips@vger.kernel.org>; Wed, 11 Dec 2024 23:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733961243; cv=none; b=uIqblbpcBh0CWKngFV+raRxr2OCfGOM6h9o3FBkCZj8sSq0SyVpGeqAKo1pIIKkKN8ob3tuars3DsFCtLpZsHi8IUxRvPq0f23S7ff2+h0NbG1Yp7F8EsDmN1g05QYgaMbe+QX5tRVo+RWl8iQwBQkXGAvpd96fvGMvW1dJ2kIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733961243; c=relaxed/simple;
	bh=/b64pgqyFjn+0zdYe/fZWQ7lPUA2K5N4MlLwvF597s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lJP/+cNDOIFL8qGo3GxvL35TXeRNqMYCCXZc7fUahd2+igT+syMuc0pIzygMoIPv1yaVKfPC4oxp9+vvnEvzqsvDIbTh1AVTFSvlOSMgOiD/PFsJCaPSCAlVov8oj8rjyxKyoqHUId2xvJqlNLV5TrfpWqDrie9nQG9JkzraatM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=rBxY97+2; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A1EA82C0504;
	Thu, 12 Dec 2024 12:53:51 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1733961231;
	bh=uFYPmlLq5/1jZhh75uLVt+XpKoL3iixWFn64Iqkf8sk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rBxY97+2xBLyQqft6CivvLQZcCnMsTS3lUG7jFHuVZ6PWSVNIgNFqUEArhjzLpHKT
	 nQp0sJ0xT60yY9ZKZY812DwnUf1j+z9SrofxcPmhyFzMhqHLPnjuVsgMgsPh0RDAei
	 y+2I5cvxIw0Mm09ujNG1r2b0Mdp1ZAGTP7hmv48kGGIZ8oyasbiwddGUMQfXGgDzRo
	 HgU8Clez9usPwQjEYB2I5dnsdOdVJuikrwgdNbQXx1yYtL1/ahfq9qgAIdz+2gJ+NE
	 IX9aq55V/ypgieq2g/xOCZj0SBUvJULsL+BuabqdlbgbrNLdI9kWuysE25R9EbS39e
	 QgaZExZ/AAN6g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B675a260f0004>; Thu, 12 Dec 2024 12:53:51 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 2CD2913EE9C;
	Thu, 12 Dec 2024 12:53:51 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 2B9702807DF; Thu, 12 Dec 2024 12:53:51 +1300 (NZDT)
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
Subject: [PATCH 4/4] net: mdio: Add RTL9300 MDIO driver
Date: Thu, 12 Dec 2024 12:53:42 +1300
Message-ID: <20241211235342.1573926-5-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211235342.1573926-1-chris.packham@alliedtelesis.co.nz>
References: <20241211235342.1573926-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=675a260f a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=RZcAm9yDv7YA:10 a=cUr0DCv8HDOHa6VSQHkA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add a driver for the MDIO controller on the RTL9300 family of Ethernet
switches with integrated SoC. There are 4 physical SMI interfaces on the
RTL9300 but access is done using the switch ports so a single MDIO bus
is presented to the rest of the system.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/net/mdio/Kconfig            |   7 +
 drivers/net/mdio/Makefile           |   1 +
 drivers/net/mdio/mdio-realtek-rtl.c | 264 ++++++++++++++++++++++++++++
 3 files changed, 272 insertions(+)
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
index 000000000000..27d1bc02e1e0
--- /dev/null
+++ b/drivers/net/mdio/mdio-realtek-rtl.c
@@ -0,0 +1,264 @@
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
+#define MAX_PORTS       32
+#define MAX_SMI_BUSSES  4
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
+	u32 val;
+
+	return regmap_read_poll_timeout(priv->regmap, priv->reg_base + SMI_ACCE=
SS_PHY_CTRL_1,
+					val, !(val & PHY_CTRL_CMD), 10, 500);
+}
+
+static int realtek_mdio_read_c45(struct mii_bus *bus, int phy_id, int de=
v_addr, int regnum)
+{
+	struct realtek_mdio_priv *priv =3D bus->priv;
+	u32 val;
+	int err;
+
+	err =3D realtek_mdio_wait_ready(priv);
+	if (err)
+		return err;
+
+	err =3D regmap_write(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL=
_2, phy_id << 16);
+	if (err)
+		return err;
+
+	err =3D regmap_write(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL=
_3,
+			   dev_addr << 16 | (regnum & 0xffff));
+	if (err)
+		return err;
+
+	err =3D regmap_write(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL=
_1,
+			   PHY_CTRL_TYPE | PHY_CTRL_CMD);
+	if (err)
+		return err;
+
+	err =3D realtek_mdio_wait_ready(priv);
+	if (err)
+		return err;
+
+	/* get_phy_c45_ids() will stop the mdio bus scan if we return an error
+	 * here. So even though the SMI controller indicates an error for an
+	 * absent device don't proagate it here.
+	 */
+	//if (val & BIT(25)) {
+	//	err =3D -ENODEV;
+	//	return err;
+	//}
+
+	err =3D regmap_read(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL_=
2, &val);
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
+	u32 val;
+	int err;
+
+	err =3D realtek_mdio_wait_ready(priv);
+	if (err)
+		return err;
+
+	err =3D regmap_write(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL=
_0, BIT(phy_id));
+	if (err)
+		return err;
+
+	err =3D regmap_write(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL=
_2, value << 16);
+	if (err)
+		return err;
+
+	err =3D regmap_write(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL=
_3,
+			   dev_addr << 16 | (regnum & 0xffff));
+	if (err)
+		return err;
+
+	err =3D regmap_write(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL=
_1,
+			   PHY_CTRL_RWOP | PHY_CTRL_TYPE | PHY_CTRL_CMD);
+	if (err)
+		return err;
+
+	err =3D regmap_read_poll_timeout(priv->regmap, priv->reg_base + SMI_ACC=
ESS_PHY_CTRL_1,
+				       val, !(val & PHY_CTRL_CMD), 10, 100);
+	if (err)
+		return err;
+
+	if (val & PHY_CTRL_FAIL) {
+		err =3D -ENXIO;
+		return err;
+	}
+
+	return err;
+}
+
+static int realtek_mdiobus_init(struct realtek_mdio_priv *priv)
+{
+	u32 port_addr[5] =3D { };
+	u32 poll_sel[2] =3D { 0, 0 };
+	u32 glb_ctrl_mask =3D 0, glb_ctrl_val =3D 0;
+	int i, err;
+
+	for (i =3D 0; i < MAX_PORTS; i++) {
+		int pos;
+
+		if (priv->smi_bus[i] > 3)
+			continue;
+
+		pos =3D (i % 6) * 5;
+		port_addr[i / 6] |=3D  priv->smi_addr[i] << pos;
+
+		pos =3D (i % 16) * 2;
+		poll_sel[i / 16] |=3D priv->smi_bus[i] << pos;
+	}
+
+	for (i =3D 0; i < MAX_SMI_BUSSES; i++) {
+		if (priv->smi_bus_isc45[i]) {
+			glb_ctrl_mask |=3D GLB_CTRL_INTF_SEL(i);
+			glb_ctrl_val |=3D GLB_CTRL_INTF_SEL(i);
+		}
+	}
+
+	err =3D regmap_bulk_write(priv->regmap, priv->reg_base + SMI_PORT0_5_AD=
DR_CTRL,
+				port_addr, 5);
+	if (err)
+		return err;
+
+	err =3D regmap_bulk_write(priv->regmap, priv->reg_base + SMI_PORT0_15_P=
OLLING_SEL,
+				poll_sel, 2);
+	if (err)
+		return err;
+
+	err =3D regmap_update_bits(priv->regmap, priv->reg_base + SMI_GLB_CTRL,
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
+		if (pn > MAX_PORTS)
+			return dev_err_probe(dev, -EINVAL, "illegal port number %d\n", pn);
+
+		err =3D fwnode_property_read_u32_array(child, "realtek,smi-address", s=
mi_addr, 2);
+		if (err) {
+			smi_addr[0] =3D 0;
+			smi_addr[1] =3D pn;
+		}
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


