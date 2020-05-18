Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCCE61D7E69
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 18:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgERQ2n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 12:28:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41822 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727020AbgERQ2n (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 12:28:43 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 680892A0E47;
        Mon, 18 May 2020 17:28:42 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v2 3/8] mtd: rawnand: bcm47xx: Allow compiling the driver when COMPILE_TEST=y
Date:   Mon, 18 May 2020 18:28:32 +0200
Message-Id: <20200518162837.304471-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200518162837.304471-1-boris.brezillon@collabora.com>
References: <20200518162837.304471-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Makes it easier to spot compile-time issues.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v2:
* None
---
 drivers/mtd/nand/raw/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 60c4eb9d382f..1f8aa353f764 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -242,7 +242,7 @@ config MTD_NAND_BRCMNAND
 
 config MTD_NAND_BCM47XXNFLASH
 	tristate "BCM4706 BCMA NAND controller"
-	depends on BCMA_NFLASH
+	depends on BCMA_NFLASH || COMPILE_TEST
 	help
 	  BCMA bus can have various flash memories attached, they are
 	  registered by bcma as platform devices. This enables driver for
-- 
2.25.4

