Return-Path: <linux-mips+bounces-13424-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBx3BPrIrmlwIwIAu9opvQ
	(envelope-from <linux-mips+bounces-13424-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 09 Mar 2026 14:19:54 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F42239974
	for <lists+linux-mips@lfdr.de>; Mon, 09 Mar 2026 14:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40522302A1A6
	for <lists+linux-mips@lfdr.de>; Mon,  9 Mar 2026 13:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7DC3C2790;
	Mon,  9 Mar 2026 13:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="pnmFChtk"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88003B52E0;
	Mon,  9 Mar 2026 13:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773062351; cv=none; b=O2mMRR8T6+CijaSuBzABFf6W4MVUps85cjfEpIvXOgtWcKqdYrUNdOycQy6+wWwsdkSJgEeKmTL7jBOR9RAiZnUxbgltmxrpVWAQsUNHHblC2nFPm+3+MDkwPnwVUBRiMgpbUwuxzbh5B7isf8g6eGs2JA5yRRbt2LQ6UTYmxis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773062351; c=relaxed/simple;
	bh=FD4BI1Gb3m19FPn08PLkbT5uw/0VcS7n03LI5QfIoP0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PdJDaHiC+t1MNEe2vxL6bJQLaOac6tNkT5grU09zToTaOvbaZlt1yrT+YWkGjRlrhn8omBsZDO/oU2ehC7Ysw1Yoz8O7TVxvlNxIhz7NE4Sol0B1mxtvbB3Q1fRMe/8Q7pnWpnnC4fLLiYLCH5zO6qQ35zhlhxSJ2X2yDr2PepI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=pnmFChtk; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6223F2861EC;
	Mon,  9 Mar 2026 14:19:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773062347; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=HuHaP85Of4AqfnaoFvV68qQ7iaLR88P52Epoh/9OC4Q=;
	b=pnmFChtkt4LokGmhRv0fEs4jfOzaJdDa2ru6kXEp+sneiFOF4Ws0oBzuByRVTQwQJgrMXQ
	ORafaY0xuamaCWq7QVYYls6YQOOep5AohUsAq+NqjFBZVIrJgXwqvVu5yPsS5S38CpQL6X
	f7wqmn0+tJp205nmuDP/NULmv3UA/uHZcakJWusPIWULqR/g8w6sDInGUC2L6EJ/9DVxFa
	gOURfm+JsmUT5wpJVgEp13q999xpGIvbOrcPiYjcRDiRDaKXO6E/qlddHhwArOhxJaw6Hg
	0/oP+nZ9PQOWbFxJnb/vxKNHFmItTPjhwHGlY5VKpuL86g9I+4DcjMH7wPa92g==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: naseefkm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjd@cjdns.fr,
	tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nbd@nbd.name,
	ansuelsmth@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 6/8] PCI: mediatek: Add support for EcoNet EN7528 SoC
Date: Mon,  9 Mar 2026 13:18:16 +0000
Message-Id: <20260309131818.74467-7-cjd@cjdns.fr>
In-Reply-To: <20260309131818.74467-1-cjd@cjdns.fr>
References: <20260309131818.74467-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 79F42239974
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,baylibre.com,kernel.org,cjdns.fr,alpha.franken.de,mediatek.com,google.com,linaro.org,pengutronix.de,collabora.com,nbd.name,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13424-lists,linux-mips=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_TWELVE(0.00)[29];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:dkim,cjdns.fr:email,cjdns.fr:mid]
X-Rspamd-Action: no action

Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.

These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
require re-training after startup.

Co-developed-by: Ahmed Naseef <naseefkm@gmail.com>
Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/pci/controller/Kconfig         |   2 +-
 drivers/pci/controller/pcie-mediatek.c | 118 +++++++++++++++++++++++++
 2 files changed, 119 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 5aaed8ac6e44..f6a5fcacb38d 100644
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
index 5defa5cc4c2b..84064061652a 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -14,6 +14,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
+#include <linux/kconfig.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/msi.h>
@@ -77,6 +78,7 @@
 
 #define PCIE_CONF_VEND_ID	0x100
 #define PCIE_CONF_DEVICE_ID	0x102
+#define PCIE_CONF_REV_CLASS	0x104
 #define PCIE_CONF_CLASS_ID	0x106
 
 #define PCIE_INT_MASK		0x420
@@ -89,6 +91,11 @@
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
@@ -753,6 +760,86 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
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
+	/*
+	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
+	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST#
+	 * should be delayed 100ms (TPVPERL) for the power and clock to become
+	 * stable.
+	 */
+	msleep(100);
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
+				       100 * USEC_PER_MSEC);
+	if (err) {
+		dev_err(pcie->dev, "EN7528: port%d link timeout\n", port->slot);
+		return -ETIMEDOUT;
+	}
+
+	/* Set INTx mask */
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
+	return 0;
+}
+
 static void __iomem *mtk_pcie_map_bus(struct pci_bus *bus,
 				      unsigned int devfn, int where)
 {
@@ -1149,6 +1236,30 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	if (err)
 		goto put_resources;
 
+	/* Retrain Gen1 links to reach Gen2 where supported */
+	if (pcie->soc->startup == mtk_pcie_startup_port_en7528) {
+		struct pci_bus *bus = host->bus;
+		struct pci_dev *rc = NULL;
+
+		while ((rc = pci_get_class(PCI_CLASS_BRIDGE_PCI << 8, rc))) {
+			int ret = -EOPNOTSUPP;
+
+			if (rc->bus != bus)
+				continue;
+
+			#if IS_BUILTIN(CONFIG_PCIE_MEDIATEK)
+			ret = pcie_retrain_link(rc, true);
+			#endif
+
+			if (!ret)
+				dev_info(dev, "port%d link retrained\n",
+					 PCI_SLOT(rc->devfn));
+			else
+				dev_info(dev, "port%d failed to retrain %pe\n",
+					 PCI_SLOT(rc->devfn), ERR_PTR(ret));
+		}
+	}
+
 	return 0;
 
 put_resources:
@@ -1264,8 +1375,15 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
 	.quirks = MTK_PCIE_FIX_CLASS_ID | MTK_PCIE_FIX_DEVICE_ID,
 };
 
+static const struct mtk_pcie_soc mtk_pcie_soc_en7528 = {
+	.ops = &mtk_pcie_ops_v2,
+	.startup = mtk_pcie_startup_port_en7528,
+	.setup_irq = mtk_pcie_setup_irq,
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


