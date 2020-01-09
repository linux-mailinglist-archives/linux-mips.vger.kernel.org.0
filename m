Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8349D135700
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 11:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729471AbgAIKfJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 05:35:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:55314 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729165AbgAIKfJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 05:35:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 7D0176A051;
        Thu,  9 Jan 2020 10:34:45 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v12 1/3] MIPS: PCI: Support mapping of INTB/C/D for pci-xtalk-bridge
Date:   Thu,  9 Jan 2020 11:34:27 +0100
Message-Id: <20200109103430.12057-2-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109103430.12057-1-tbogendoerfer@suse.de>
References: <20200109103430.12057-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Implented mapping of PCI INTB/C/D, which is needed for PCI multifunction
devices, PCI-PCI bridges and IOC3.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/pci/bridge.h |  3 ++-
 arch/mips/pci/pci-xtalk-bridge.c   | 28 ++++++++++++++++++++++++----
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/pci/bridge.h b/arch/mips/include/asm/pci/bridge.h
index 3bc630ff9ad4..9c476a0400e0 100644
--- a/arch/mips/include/asm/pci/bridge.h
+++ b/arch/mips/include/asm/pci/bridge.h
@@ -806,7 +806,8 @@ struct bridge_controller {
 	unsigned long		baddr;
 	unsigned long		intr_addr;
 	struct irq_domain	*domain;
-	unsigned int		pci_int[8];
+	unsigned int		pci_int[8][2];
+	unsigned int		int_mapping[8][2];
 	u32			ioc3_sid[8];
 	nasid_t			nasid;
 };
diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
index 5c1a196be0c5..ef5ca7c13ca5 100644
--- a/arch/mips/pci/pci-xtalk-bridge.c
+++ b/arch/mips/pci/pci-xtalk-bridge.c
@@ -437,17 +437,28 @@ static int bridge_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 	struct irq_alloc_info info;
 	int irq;
 
-	irq = bc->pci_int[slot];
+	switch (pin) {
+	case PCI_INTERRUPT_UNKNOWN:
+	case PCI_INTERRUPT_INTA:
+	case PCI_INTERRUPT_INTC:
+		pin = 0;
+		break;
+	case PCI_INTERRUPT_INTB:
+	case PCI_INTERRUPT_INTD:
+		pin = 1;
+	}
+
+	irq = bc->pci_int[slot][pin];
 	if (irq == -1) {
 		info.ctrl = bc;
 		info.nasid = bc->nasid;
-		info.pin = slot;
+		info.pin = bc->int_mapping[slot][pin];
 
 		irq = irq_domain_alloc_irqs(bc->domain, 1, bc->nasid, &info);
 		if (irq < 0)
 			return irq;
 
-		bc->pci_int[slot] = irq;
+		bc->pci_int[slot][pin] = irq;
 	}
 	return irq;
 }
@@ -458,21 +469,26 @@ static void bridge_setup_ip27_baseio6g(struct bridge_controller *bc)
 {
 	bc->ioc3_sid[2] = IOC3_SID(IOC3_SUBSYS_IP27_BASEIO6G);
 	bc->ioc3_sid[6] = IOC3_SID(IOC3_SUBSYS_IP27_MIO);
+	bc->int_mapping[2][1] = 4;
+	bc->int_mapping[6][1] = 6;
 }
 
 static void bridge_setup_ip27_baseio(struct bridge_controller *bc)
 {
 	bc->ioc3_sid[2] = IOC3_SID(IOC3_SUBSYS_IP27_BASEIO);
+	bc->int_mapping[2][1] = 4;
 }
 
 static void bridge_setup_ip29_baseio(struct bridge_controller *bc)
 {
 	bc->ioc3_sid[2] = IOC3_SID(IOC3_SUBSYS_IP29_SYSBOARD);
+	bc->int_mapping[2][1] = 3;
 }
 
 static void bridge_setup_ip30_sysboard(struct bridge_controller *bc)
 {
 	bc->ioc3_sid[2] = IOC3_SID(IOC3_SUBSYS_IP30_SYSBOARD);
+	bc->int_mapping[2][1] = 4;
 }
 
 static void bridge_setup_menet(struct bridge_controller *bc)
@@ -655,7 +671,11 @@ static int bridge_probe(struct platform_device *pdev)
 
 	for (slot = 0; slot < 8; slot++) {
 		bridge_set(bc, b_device[slot].reg, BRIDGE_DEV_SWAP_DIR);
-		bc->pci_int[slot] = -1;
+		bc->pci_int[slot][0] = -1;
+		bc->pci_int[slot][1] = -1;
+		/* default interrupt pin mapping */
+		bc->int_mapping[slot][0] = slot;
+		bc->int_mapping[slot][1] = slot ^ 4;
 	}
 	bridge_read(bc, b_wid_tflush);	  /* wait until Bridge PIO complete */
 
-- 
2.24.1

