Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3533F42C1B3
	for <lists+linux-mips@lfdr.de>; Wed, 13 Oct 2021 15:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234968AbhJMNvt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Oct 2021 09:51:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:10322 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229611AbhJMNvs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Oct 2021 09:51:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="227324831"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="227324831"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 06:49:45 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="480799954"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 06:49:43 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1maedZ-000Lff-Rf;
        Wed, 13 Oct 2021 16:49:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v1 1/2] bcm47xx: Get rid of redundant 'else'
Date:   Wed, 13 Oct 2021 16:49:39 +0300
Message-Id: <20211013134940.83295-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the snipped like

	if (...)
		return ...;
	else

the 'else' is redundant. Get rid of it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/mips/pci/pci-bcm47xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/mips/pci/pci-bcm47xx.c b/arch/mips/pci/pci-bcm47xx.c
index 230d7dd273e2..e8ff8e32a729 100644
--- a/arch/mips/pci/pci-bcm47xx.c
+++ b/arch/mips/pci/pci-bcm47xx.c
@@ -93,12 +93,10 @@ int pcibios_plat_dev_init(struct pci_dev *dev)
 #ifdef CONFIG_BCM47XX_SSB
 	if (bcm47xx_bus_type ==	 BCM47XX_BUS_TYPE_SSB)
 		return bcm47xx_pcibios_plat_dev_init_ssb(dev);
-	else
 #endif
 #ifdef CONFIG_BCM47XX_BCMA
 	if  (bcm47xx_bus_type ==  BCM47XX_BUS_TYPE_BCMA)
 		return bcm47xx_pcibios_plat_dev_init_bcma(dev);
-	else
 #endif
-		return 0;
+	return 0;
 }
-- 
2.33.0

