Return-Path: <linux-mips+bounces-14593-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMpdAvLqBWr5dQIAu9opvQ
	(envelope-from <linux-mips+bounces-14593-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 17:32:02 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B10544145
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 17:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E593431192BC
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 15:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29E63E1CE6;
	Thu, 14 May 2026 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="d7HHbXcB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD4B3112AD;
	Thu, 14 May 2026 15:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771639; cv=none; b=VHpPbut8SvJnEFcZp3Sq43pr5NiyZ0GRYI30Y+m9HQuYfh8S7EvJGNUin9xJk85Q51O7i+RxnRnlx8AMxnIE8gzsy/3wNyEN3JRTQJbQDAO341L2Dl3/5PWwKw+fhHOU2wzRIqlsWgGRHKFcyBfRGuexLheUiuYCmuts4yOxEp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771639; c=relaxed/simple;
	bh=2vxVWbCEFhroNy6FC1SCInMlHyLocFTO0lIu7nTbaV8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dvbOK2zG0E00T4h5FY6NvqQSbLV7UFlBt5apjOvu4Gqh5Ns3fjyX7vxCXugMvzzs54pegGngPQ2Km9GsMYNAzstBPsfgiiVVRQdUW5u6ygpMCm+YIi8UG03kY5SXqt/EcrfLqA++WslgyI6mFhLkKHoSbFltg7iqPX9D/9JGkMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=d7HHbXcB; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D85A43DF5A3;
	Thu, 14 May 2026 17:13:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778771623; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5YiLLvhj0LrC++mIg5Uun2rSHvq7Hc6ZeS3hm3nXW+Y=;
	b=d7HHbXcB4McBS/Q5wYwNAAxQ1pUntqKIFzhq0itPi7avZcI6So+ZQlOSqGTSq1BlH1Oa7O
	QLWklWR6hsV0Xlt0L9THKpDoY3BvodIrfbULiftm0UMewKdvs0UmF3Z0aViPOGTW0OAl5g
	dDagLHpLVvExr4eKgUkFGspaP4rK482nwLF55CTsdF7HiyfGveOf98+S9ZtsYjWocZFrdd
	Yqd2Y7tKbL7HWApIfA+uag36KLxJmKOO1q8U0SFG9x75sQN/4gpKYEYrndUcg6lHq3I5Mb
	lgzSHtsROT8UO7VMfB/Bwc2TY/ydqsMuU8K2w5ul5Bp+rDP1mYkfxwtwB8VQkw==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-pci@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	naseefkm@gmail.com,
	ryder.lee@mediatek.com,
	helgaas@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v7 2/2] PCI: mediatek: Add support for EcoNet EN7528 SoC
Date: Thu, 14 May 2026 15:13:18 +0000
Message-Id: <20260514151318.3444959-3-cjd@cjdns.fr>
In-Reply-To: <20260514151318.3444959-1-cjd@cjdns.fr>
References: <20260514151318.3444959-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 91B10544145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,kernel.org,collabora.com,lists.infradead.org,cjdns.fr];
	TAGGED_FROM(0.00)[bounces-14593-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cjdns.fr:email,cjdns.fr:mid,cjdns.fr:dkim]
X-Rspamd-Action: no action

Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.

These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
require re-training after startup.

Co-developed-by: Ahmed Naseef <naseefkm@gmail.com>
Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/pci/controller/Kconfig         |   2 +-
 drivers/pci/controller/pcie-mediatek.c | 155 +++++++++++++++++++++++++
 2 files changed, 156 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 2247709ef6d6..8a3a31b2bc12 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -209,7 +209,7 @@ config PCI_MVEBU
 
 config PCIE_MEDIATEK
 	tristate "MediaTek PCIe controller"
-	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
+	depends on ARCH_AIROHA || ARCH_MEDIATEK || ECONET || COMPILE_TEST
 	depends on OF
 	depends on PCI_MSI
 	select IRQ_MSI_LIB
diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 75722524fe74..3d5e2279286a 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -9,11 +9,13 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/errno.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
+#include <linux/kconfig.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/msi.h>
@@ -77,6 +79,7 @@
 
 #define PCIE_CONF_VEND_ID	0x100
 #define PCIE_CONF_DEVICE_ID	0x102
+#define PCIE_CONF_REV_CLASS	0x104
 #define PCIE_CONF_CLASS_ID	0x106
 
 #define PCIE_INT_MASK		0x420
@@ -89,6 +92,11 @@
 #define MSI_MASK		BIT(23)
 #define MTK_MSI_IRQS_NUM	32
 
+#define EN7528_HOST_MODE	0x00804201
+#define EN7528_LINKUP_REG	0x50
+#define EN7528_RC0_LINKUP	BIT(1)
+#define EN7528_RC1_LINKUP	BIT(2)
+
 #define PCIE_AHB_TRANS_BASE0_L	0x438
 #define PCIE_AHB_TRANS_BASE0_H	0x43c
 #define AHB2PCIE_SIZE(x)	((x) & GENMASK(4, 0))
@@ -148,12 +156,15 @@ struct mtk_pcie_port;
  * @MTK_PCIE_FIX_DEVICE_ID: host's device ID needed to be fixed
  * @MTK_PCIE_NO_MSI: Bridge has no MSI support, and relies on an external block
  * @MTK_PCIE_SKIP_RSTB: Skip calling RSTB bits on PCIe probe
+ * @MTK_PCIE_RETRAIN: Retrain link to bridge after startup because some
+ *                    Gen2-capable devices start as Gen1.
  */
 enum mtk_pcie_quirks {
 	MTK_PCIE_FIX_CLASS_ID = BIT(0),
 	MTK_PCIE_FIX_DEVICE_ID = BIT(1),
 	MTK_PCIE_NO_MSI = BIT(2),
 	MTK_PCIE_SKIP_RSTB = BIT(3),
+	MTK_PCIE_RETRAIN = BIT(4),
 };
 
 /**
@@ -753,6 +764,135 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 	return 0;
 }
 
+static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
+{
+	struct mtk_pcie *pcie = port->pcie;
+	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
+	struct resource *mem = NULL;
+	struct resource_entry *entry;
+	u32 val, link_mask;
+	int err;
+
+	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
+	if (entry)
+		mem = entry->res;
+	if (!mem)
+		return -EINVAL;
+
+	if (!pcie->cfg) {
+		dev_err(pcie->dev, "EN7528: pciecfg syscon not available\n");
+		return -EINVAL;
+	}
+
+	/* Assert all reset signals */
+	writel(0, port->base + PCIE_RST_CTRL);
+
+	/*
+	 * Enable PCIe link down reset, if link status changed from link up to
+	 * link down, this will reset MAC control registers and configuration
+	 * space.
+	 */
+	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
+
+	msleep(PCIE_T_PVPERL_MS);
+
+	/* De-assert PHY, PE, PIPE, MAC and configuration reset */
+	val = readl(port->base + PCIE_RST_CTRL);
+	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
+	       PCIE_MAC_SRSTB | PCIE_CRSTB;
+	writel(val, port->base + PCIE_RST_CTRL);
+
+	writel(PCIE_CLASS_CODE | PCIE_REVISION_ID,
+	       port->base + PCIE_CONF_REV_CLASS);
+	writel(EN7528_HOST_MODE, port->base);
+
+	link_mask = (port->slot == 0) ? EN7528_RC0_LINKUP : EN7528_RC1_LINKUP;
+
+	/* 100ms timeout value should be enough for Gen1/2 training */
+	err = regmap_read_poll_timeout(pcie->cfg, EN7528_LINKUP_REG, val,
+				       !!(val & link_mask), 20,
+				       PCI_PM_D3COLD_WAIT * USEC_PER_MSEC);
+	if (err) {
+		dev_err(pcie->dev, "EN7528: port%d link timeout\n", port->slot);
+		return -ETIMEDOUT;
+	}
+
+	/* Activate INTx interrupts */
+	val = readl(port->base + PCIE_INT_MASK);
+	val &= ~INTX_MASK;
+	writel(val, port->base + PCIE_INT_MASK);
+
+	if (IS_ENABLED(CONFIG_PCI_MSI))
+		mtk_pcie_enable_msi(port);
+
+	/* Set AHB to PCIe translation windows */
+	val = lower_32_bits(mem->start) |
+	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
+
+	val = upper_32_bits(mem->start);
+	writel(val, port->base + PCIE_AHB_TRANS_BASE0_H);
+
+	writel(WIN_ENABLE, port->base + PCIE_AXI_WINDOW0);
+
+	if (!IS_BUILTIN(CONFIG_PCIE_MEDIATEK))
+		dev_info(pcie->dev,
+			 "module not built-in, Gen2 unavailable even if supported\n");
+
+	return 0;
+}
+
+/**
+ * mtk_pcie_retrain - retrain the root bridge link if needed
+ * @dev: The device, for use in logging
+ * @host: The host bridge which contains the link
+ *
+ * Due to what is likely a hardware bug, some devices (notably EcoNet) start up
+ * as Gen1, and must be retrained once after initial configuration in order to
+ * reach Gen2.
+ *
+ * These devices always self-identify as Gen2 capable, but sometimes the PHY is
+ * only capable of Gen1 operation, and sometimes the PCIe card (e.g. wifi) is
+ * only Gen1 capable. Therefore it is most convenient to retrain every port
+ * after startup.
+ */
+static int mtk_pcie_retrain(struct device *dev, struct pci_host_bridge *host)
+{
+	struct pci_dev *rp;
+	int ret = -ENOENT;
+	u16 lnksta = 0;
+	u32 speed;
+
+	/* Should already have been warned about during startup_port */
+	if (!IS_BUILTIN(CONFIG_PCIE_MEDIATEK))
+		return 0;
+
+	for_each_pci_bridge(rp, host->bus) {
+		if (pci_pcie_type(rp) == PCI_EXP_TYPE_ROOT_PORT)
+			goto found_port;
+	}
+
+	/* Should not happen */
+	return dev_err_probe(dev, ret, "root port not found\n");
+
+found_port:
+
+#if IS_BUILTIN(CONFIG_PCIE_MEDIATEK)
+	ret = pcie_retrain_link(rp, true);
+#endif
+
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to retrain port\n");
+
+	pcie_capability_read_word(rp, PCI_EXP_LNKSTA, &lnksta);
+	speed = lnksta & PCI_EXP_LNKSTA_CLS;
+
+	dev_info(dev, "link retrained, speed %s\n",
+		 pci_speed_string(pcie_link_speed[speed]));
+
+	return 0;
+}
+
 static void __iomem *mtk_pcie_map_bus(struct pci_bus *bus,
 				      unsigned int devfn, int where)
 {
@@ -1149,6 +1289,13 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	if (err)
 		goto put_resources;
 
+	/*
+	 * Ignore error because pci_host_probe() was already called, and in any
+	 * case it is possible that the port will still work as Gen1.
+	 */
+	if (pcie->soc->quirks & MTK_PCIE_RETRAIN)
+		mtk_pcie_retrain(dev, host);
+
 	return 0;
 
 put_resources:
@@ -1264,8 +1411,16 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
 	.quirks = MTK_PCIE_FIX_CLASS_ID | MTK_PCIE_FIX_DEVICE_ID,
 };
 
+static const struct mtk_pcie_soc mtk_pcie_soc_en7528 = {
+	.ops = &mtk_pcie_ops_v2,
+	.startup = mtk_pcie_startup_port_en7528,
+	.setup_irq = mtk_pcie_setup_irq,
+	.quirks = MTK_PCIE_RETRAIN,
+};
+
 static const struct of_device_id mtk_pcie_ids[] = {
 	{ .compatible = "airoha,an7583-pcie", .data = &mtk_pcie_soc_an7583 },
+	{ .compatible = "econet,en7528-pcie", .data = &mtk_pcie_soc_en7528 },
 	{ .compatible = "mediatek,mt2701-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt7623-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt2712-pcie", .data = &mtk_pcie_soc_mt2712 },
-- 
2.39.5


