Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A353A42C1B4
	for <lists+linux-mips@lfdr.de>; Wed, 13 Oct 2021 15:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234356AbhJMNvt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Oct 2021 09:51:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:10322 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234531AbhJMNvt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Oct 2021 09:51:49 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="227324832"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="227324832"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 06:49:45 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="486911978"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 06:49:43 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1maedZ-000Lfi-SU;
        Wed, 13 Oct 2021 16:49:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v1 2/2] bcm47xx: Replace printk(KERN_ALERT ... pci_devname(dev)) with pci_alert()
Date:   Wed, 13 Oct 2021 16:49:40 +0300
Message-Id: <20211013134940.83295-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013134940.83295-1-andriy.shevchenko@linux.intel.com>
References: <20211013134940.83295-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Replace printk(KERN_ALERT ... pci_devname(dev)) with pci_alert() which
provides PCI device name in a unified way.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/mips/pci/pci-bcm47xx.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/mips/pci/pci-bcm47xx.c b/arch/mips/pci/pci-bcm47xx.c
index e8ff8e32a729..ffac06a5ca20 100644
--- a/arch/mips/pci/pci-bcm47xx.c
+++ b/arch/mips/pci/pci-bcm47xx.c
@@ -41,8 +41,7 @@ static int bcm47xx_pcibios_plat_dev_init_ssb(struct pci_dev *dev)
 
 	res = ssb_pcibios_plat_dev_init(dev);
 	if (res < 0) {
-		printk(KERN_ALERT "PCI: Failed to init device %s\n",
-		       pci_name(dev));
+		pci_alert(dev, "PCI: Failed to init device\n");
 		return res;
 	}
 
@@ -52,8 +51,7 @@ static int bcm47xx_pcibios_plat_dev_init_ssb(struct pci_dev *dev)
 
 	/* IRQ-0 and IRQ-1 are software interrupts. */
 	if (res < 2) {
-		printk(KERN_ALERT "PCI: Failed to map IRQ of device %s\n",
-		       pci_name(dev));
+		pci_alert(dev, "PCI: Failed to map IRQ of device\n");
 		return res;
 	}
 
@@ -69,8 +67,7 @@ static int bcm47xx_pcibios_plat_dev_init_bcma(struct pci_dev *dev)
 
 	res = bcma_core_pci_plat_dev_init(dev);
 	if (res < 0) {
-		printk(KERN_ALERT "PCI: Failed to init device %s\n",
-		       pci_name(dev));
+		pci_alert(dev, "PCI: Failed to init device\n");
 		return res;
 	}
 
@@ -78,8 +75,7 @@ static int bcm47xx_pcibios_plat_dev_init_bcma(struct pci_dev *dev)
 
 	/* IRQ-0 and IRQ-1 are software interrupts. */
 	if (res < 2) {
-		printk(KERN_ALERT "PCI: Failed to map IRQ of device %s\n",
-		       pci_name(dev));
+		pci_alert(dev, "PCI: Failed to map IRQ of device\n");
 		return res;
 	}
 
-- 
2.33.0

