Return-Path: <linux-mips+bounces-14643-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLTaAC8tDmrz7gUAu9opvQ
	(envelope-from <linux-mips+bounces-14643-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2026 23:52:47 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7EB59B673
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2026 23:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5C7A38920F3
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2026 18:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82623423A77;
	Wed, 20 May 2026 18:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="jgl9S/zb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3E2423A6C;
	Wed, 20 May 2026 18:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779302339; cv=none; b=onne1VkS3D+VlhSyaFwDp853ADWK1jW4EnczETvMM/2bo6oCvpHaib10WLRwskDd8WCmb5zELoR44930t3ZtvDYPIzTv9yJNOFIY4SIT3PPMPlW2+M4KJgT5WKmvTw6zAE3KDwtEH3bu8Zg5sFKcAQhUPMu9zVGYj5+TWkBvT8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779302339; c=relaxed/simple;
	bh=+a3wGo8sRThJd6g5H5ApthN34xOnIrvwiId/Vy4N/UU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XfyCUFPTgPuqmR6hyEEsyJJd6VCIGjlQPNzNhDNUnM+XkZqnP/pCA172Zbzqelm/OfKUQOrPsgGgYmC+IuW668tj5Qus9GURe5ahgGpPv3X/V+93Zt/OC4ulumVk19d3HRbeJS2/Bfwf1mdaS423q/KJb5BMsKOi1WZK5XRPjuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=jgl9S/zb; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30568440E80;
	Wed, 20 May 2026 20:38:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779302334; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=JUupb00qUDRStdXnj1nJ2QrJYhHtRgXvfohXbm+8Fh4=;
	b=jgl9S/zb02YvbpSWBGrl+UzPOWGyOoBohk4peKGufmcxTHyggdEy1yRZCk4BKbazxnb7Gr
	7uOLRMgwlRGwOwyWbsydjwiFA3YI/mu66hxDPCws5iVU+iCQDhRRxR5szr4rzR/DnJ5Nki
	1A4EuxAtn1ysJ8Y8gsIPEyLzzdH2nNRlBnajY966DKXHzBEm6RkiD4MBBSmlEMiIaKMOJz
	02rTiSD6E99wZ3q5P5D+NYUfgC+nC8oe05bVfMtKjjJT/Qx0B2pXIUa2KoP9hM7bcas5+d
	EVKHTtxU0AQ8oOItLNvUOOMcV791Me3UDlj55X4tO5QSbcb9y2HJQWuvewzJRQ==
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
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v8 1/3] PCI: mediatek: Use actual physical address instead of virt_to_phys()
Date: Wed, 20 May 2026 18:38:25 +0000
Message-Id: <20260520183827.908243-2-cjd@cjdns.fr>
In-Reply-To: <20260520183827.908243-1-cjd@cjdns.fr>
References: <20260520183827.908243-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14643-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,kernel.org,collabora.com,lists.infradead.org,oss.qualcomm.com,cjdns.fr];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5D7EB59B673
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The driver previously used virt_to_phys() on the ioremapped register base
(port->base) to compute the MSI message address. Using virt_to_phys() on an
IO mapped address is incorrect because it expects a kernel virtual address.

To fix it, store the physical start of the I/O register region in
mtk_pcie_port->phys_base and use it to build the MSI address. This replaces
the incorrect virt_to_phys() usage and ensures MSI addresses are generated
correctly.

Fixes: 43e6409db64d ("PCI: mediatek: Add MSI support for MT2712 and MT7622")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/pci/controller/pcie-mediatek.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 75722524fe74..c503fbd774d0 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -175,6 +175,7 @@ struct mtk_pcie_soc {
 /**
  * struct mtk_pcie_port - PCIe port information
  * @base: IO mapped register base
+ * @phys_base: Physical address of the I/O register base region
  * @list: port list
  * @pcie: pointer to PCIe host info
  * @reset: pointer to port reset control
@@ -196,6 +197,7 @@ struct mtk_pcie_soc {
  */
 struct mtk_pcie_port {
 	void __iomem *base;
+	phys_addr_t phys_base;
 	struct list_head list;
 	struct mtk_pcie *pcie;
 	struct reset_control *reset;
@@ -405,7 +407,7 @@ static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 	phys_addr_t addr;
 
 	/* MT2712/MT7622 only support 32-bit MSI addresses */
-	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
+	addr = port->phys_base + PCIE_MSI_VECTOR;
 	msg->address_hi = 0;
 	msg->address_lo = lower_32_bits(addr);
 
@@ -520,7 +522,7 @@ static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
 	u32 val;
 	phys_addr_t msg_addr;
 
-	msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
+	msg_addr = port->phys_base + PCIE_MSI_VECTOR;
 	val = lower_32_bits(msg_addr);
 	writel(val, port->base + PCIE_IMSI_ADDR);
 
@@ -953,6 +955,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
 	struct mtk_pcie_port *port;
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
+	struct resource *res;
 	char name[20];
 	int err;
 
@@ -961,7 +964,14 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
 		return -ENOMEM;
 
 	snprintf(name, sizeof(name), "port%d", slot);
-	port->base = devm_platform_ioremap_resource_byname(pdev, name);
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	if (!res) {
+		dev_err(dev, "failed to get port%d base\n", slot);
+		return -EINVAL;
+	}
+
+	port->phys_base = res->start;
+	port->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(port->base)) {
 		dev_err(dev, "failed to map port%d base\n", slot);
 		return PTR_ERR(port->base);
-- 
2.39.5


