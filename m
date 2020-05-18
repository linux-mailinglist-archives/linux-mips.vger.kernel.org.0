Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31221D7E6F
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 18:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgERQ2r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 12:28:47 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41894 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727938AbgERQ2q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 12:28:46 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0C0CC2A0F0D;
        Mon, 18 May 2020 17:28:44 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v2 8/8] mtd: rawnand: bcm47xx: Merge all source files
Date:   Mon, 18 May 2020 18:28:37 +0200
Message-Id: <20200518162837.304471-9-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200518162837.304471-1-boris.brezillon@collabora.com>
References: <20200518162837.304471-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Given the number of lines it doesn't make sense to split the code.
Let's merge everything and move the driver to drivers/mtd/nand/raw.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v2:
* Fix the Makefile entry
* Merge commits doing the source merge and the file move
* Rename the driver bcm47xx-nand-controller
---
 drivers/mtd/nand/raw/Makefile                 |  2 +-
 ...ps_bcm4706.c => bcm47xx-nand-controller.c} | 81 ++++++++++++++++++-
 drivers/mtd/nand/raw/bcm47xxnflash/Makefile   |  5 --
 .../nand/raw/bcm47xxnflash/bcm47xxnflash.h    | 21 -----
 drivers/mtd/nand/raw/bcm47xxnflash/main.c     | 77 ------------------
 5 files changed, 79 insertions(+), 107 deletions(-)
 rename drivers/mtd/nand/raw/{bcm47xxnflash/ops_bcm4706.c => bcm47xx-nand-controller.c} (81%)
 delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/Makefile
 delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
 delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/main.c

diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 2d136b158fb7..854107365774 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -47,7 +47,7 @@ obj-$(CONFIG_MTD_NAND_RICOH)		+= r852.o
 obj-y					+= ingenic/
 obj-$(CONFIG_MTD_NAND_GPMI_NAND)	+= gpmi-nand/
 obj-$(CONFIG_MTD_NAND_XWAY)		+= xway_nand.o
-obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
+obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xx-nand-controller.o
 obj-$(CONFIG_MTD_NAND_SUNXI)		+= sunxi_nand.o
 obj-$(CONFIG_MTD_NAND_HISI504)	        += hisi504_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xx-nand-controller.c
similarity index 81%
rename from drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
rename to drivers/mtd/nand/raw/bcm47xx-nand-controller.c
index e34a13b7f919..ff8b86a8e923 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/raw/bcm47xx-nand-controller.c
@@ -5,13 +5,14 @@
  * Copyright (C) 2012 Rafał Miłecki <zajec5@gmail.com>
  */
 
-#include "bcm47xxnflash.h"
-
+#include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
-#include <linux/delay.h>
+#include <linux/platform_device.h>
 #include <linux/bcma/bcma.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/rawnand.h>
 
 /* Broadcom uses 1'000'000 but it seems to be too many. Tests on WNDR4500 has
  * shown ~1000 retries as maxiumum. */
@@ -48,6 +49,17 @@
 #define CONF_COL_BYTES(x)		(((x) - 1) << 4)
 #define CONF_ROW_BYTES(x)		(((x) - 1) << 6)
 
+#ifndef pr_fmt
+#define pr_fmt(fmt)		KBUILD_MODNAME ": " fmt
+#endif
+
+struct bcm47xxnflash {
+	struct nand_controller base;
+	struct bcma_drv_cc *cc;
+
+	struct nand_chip nand_chip;
+};
+
 /**************************************************
  * Various helpers
  **************************************************/
@@ -266,3 +278,66 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 
 	return err;
 }
+
+static const char *probes[] = { "bcm47xxpart", NULL };
+
+static int bcm47xxnflash_probe(struct platform_device *pdev)
+{
+	struct bcma_nflash *nflash = dev_get_platdata(&pdev->dev);
+	struct bcm47xxnflash *b47n;
+	struct mtd_info *mtd;
+	int err = 0;
+
+	b47n = devm_kzalloc(&pdev->dev, sizeof(*b47n), GFP_KERNEL);
+	if (!b47n)
+		return -ENOMEM;
+
+	nand_set_controller_data(&b47n->nand_chip, b47n);
+	mtd = nand_to_mtd(&b47n->nand_chip);
+	mtd->dev.parent = &pdev->dev;
+	b47n->cc = container_of(nflash, struct bcma_drv_cc, nflash);
+
+	if (b47n->cc->core->bus->chipinfo.id == BCMA_CHIP_ID_BCM4706) {
+		err = bcm47xxnflash_ops_bcm4706_init(b47n);
+	} else {
+		pr_err("Device not supported\n");
+		err = -ENOTSUPP;
+	}
+	if (err) {
+		pr_err("Initialization failed: %d\n", err);
+		return err;
+	}
+
+	platform_set_drvdata(pdev, b47n);
+
+	err = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
+	if (err) {
+		pr_err("Failed to register MTD device: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int bcm47xxnflash_remove(struct platform_device *pdev)
+{
+	struct bcm47xxnflash *nflash = platform_get_drvdata(pdev);
+
+	nand_release(&nflash->nand_chip);
+
+	return 0;
+}
+
+static struct platform_driver bcm47xxnflash_driver = {
+	.probe	= bcm47xxnflash_probe,
+	.remove = bcm47xxnflash_remove,
+	.driver = {
+		.name = "bcma_nflash",
+	},
+};
+module_platform_driver(bcm47xxnflash_driver);
+
+MODULE_DESCRIPTION("NAND flash driver for BCMA bus");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Rafał Miłecki");
+
diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/Makefile b/drivers/mtd/nand/raw/bcm47xxnflash/Makefile
deleted file mode 100644
index b531a630c9cf..000000000000
--- a/drivers/mtd/nand/raw/bcm47xxnflash/Makefile
+++ /dev/null
@@ -1,5 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-bcm47xxnflash-y				+= main.o
-bcm47xxnflash-y				+= ops_bcm4706.o
-
-obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash.o
diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h b/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
deleted file mode 100644
index 8de0e7e0a3a4..000000000000
--- a/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __BCM47XXNFLASH_H
-#define __BCM47XXNFLASH_H
-
-#ifndef pr_fmt
-#define pr_fmt(fmt)		KBUILD_MODNAME ": " fmt
-#endif
-
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/rawnand.h>
-
-struct bcm47xxnflash {
-	struct nand_controller base;
-	struct bcma_drv_cc *cc;
-
-	struct nand_chip nand_chip;
-};
-
-int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n);
-
-#endif /* BCM47XXNFLASH */
diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/main.c b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
deleted file mode 100644
index 8dae97c1dbe7..000000000000
--- a/drivers/mtd/nand/raw/bcm47xxnflash/main.c
+++ /dev/null
@@ -1,77 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * BCM47XX NAND flash driver
- *
- * Copyright (C) 2012 Rafał Miłecki <zajec5@gmail.com>
- */
-
-#include "bcm47xxnflash.h"
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/platform_device.h>
-#include <linux/bcma/bcma.h>
-
-MODULE_DESCRIPTION("NAND flash driver for BCMA bus");
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Rafał Miłecki");
-
-static const char *probes[] = { "bcm47xxpart", NULL };
-
-static int bcm47xxnflash_probe(struct platform_device *pdev)
-{
-	struct bcma_nflash *nflash = dev_get_platdata(&pdev->dev);
-	struct bcm47xxnflash *b47n;
-	struct mtd_info *mtd;
-	int err = 0;
-
-	b47n = devm_kzalloc(&pdev->dev, sizeof(*b47n), GFP_KERNEL);
-	if (!b47n)
-		return -ENOMEM;
-
-	nand_set_controller_data(&b47n->nand_chip, b47n);
-	mtd = nand_to_mtd(&b47n->nand_chip);
-	mtd->dev.parent = &pdev->dev;
-	b47n->cc = container_of(nflash, struct bcma_drv_cc, nflash);
-
-	if (b47n->cc->core->bus->chipinfo.id == BCMA_CHIP_ID_BCM4706) {
-		err = bcm47xxnflash_ops_bcm4706_init(b47n);
-	} else {
-		pr_err("Device not supported\n");
-		err = -ENOTSUPP;
-	}
-	if (err) {
-		pr_err("Initialization failed: %d\n", err);
-		return err;
-	}
-
-	platform_set_drvdata(pdev, b47n);
-
-	err = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
-	if (err) {
-		pr_err("Failed to register MTD device: %d\n", err);
-		return err;
-	}
-
-	return 0;
-}
-
-static int bcm47xxnflash_remove(struct platform_device *pdev)
-{
-	struct bcm47xxnflash *nflash = platform_get_drvdata(pdev);
-
-	nand_release(&nflash->nand_chip);
-
-	return 0;
-}
-
-static struct platform_driver bcm47xxnflash_driver = {
-	.probe	= bcm47xxnflash_probe,
-	.remove = bcm47xxnflash_remove,
-	.driver = {
-		.name = "bcma_nflash",
-	},
-};
-
-module_platform_driver(bcm47xxnflash_driver);
-- 
2.25.4

