Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADCBDE2E9F
	for <lists+linux-mips@lfdr.de>; Thu, 24 Oct 2019 12:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393278AbfJXKSh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Oct 2019 06:18:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:34202 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2392678AbfJXKSh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 24 Oct 2019 06:18:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 04F6BB4F1;
        Thu, 24 Oct 2019 10:18:36 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] MIPS: PCI: make phys_to_dma/dma_to_phys for pci-xtalk-bridge common
Date:   Thu, 24 Oct 2019 12:18:28 +0200
Message-Id: <20191024101829.12543-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

All platforms using pci-xtalk-bridge can share common phys_to_dma/
dma_to_phys function. So we move it form ip27 specific file to
pci-xtalk-bridge.c

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/pci/pci-ip27.c         | 13 -------------
 arch/mips/pci/pci-xtalk-bridge.c | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/mips/pci/pci-ip27.c b/arch/mips/pci/pci-ip27.c
index 0d2eb86e8a1e..8e26b120f994 100644
--- a/arch/mips/pci/pci-ip27.c
+++ b/arch/mips/pci/pci-ip27.c
@@ -14,19 +14,6 @@
 #include <asm/sn/ioc3.h>
 #include <asm/pci/bridge.h>
 
-dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct bridge_controller *bc = BRIDGE_CONTROLLER(pdev->bus);
-
-	return bc->baddr + paddr;
-}
-
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
-{
-	return dma_addr & ~(0xffUL << 56);
-}
-
 #ifdef CONFIG_NUMA
 int pcibus_to_node(struct pci_bus *bus)
 {
diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
index 0dd5edb76cbb..b475cf5aef2f 100644
--- a/arch/mips/pci/pci-xtalk-bridge.c
+++ b/arch/mips/pci/pci-xtalk-bridge.c
@@ -22,6 +22,22 @@
 #define CRC16_INIT	0
 #define CRC16_VALID	0xb001
 
+/*
+ * Common phys<->dma mapping for platforms using pci xtalk bridge
+ */
+dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct bridge_controller *bc = BRIDGE_CONTROLLER(pdev->bus);
+
+	return bc->baddr + paddr;
+}
+
+phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
+{
+	return dma_addr & ~(0xffUL << 56);
+}
+
 /*
  * Most of the IOC3 PCI config register aren't present
  * we emulate what is needed for a normal PCI enumeration
-- 
2.16.4

