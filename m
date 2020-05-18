Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F19121D7E6C
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 18:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbgERQ2p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 12:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbgERQ2p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 12:28:45 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096C7C05BD09
        for <linux-mips@vger.kernel.org>; Mon, 18 May 2020 09:28:45 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B2B5C2A0EF5;
        Mon, 18 May 2020 17:28:43 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v2 7/8] mtd: rawnand: bcm47xx: Simplify the init() function
Date:   Mon, 18 May 2020 18:28:36 +0200
Message-Id: <20200518162837.304471-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200518162837.304471-1-boris.brezillon@collabora.com>
References: <20200518162837.304471-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The row and column sizes are now set as part of the exec_op() procedure
and adjusted to match the requested number of address cycles. No need
to set them in the init() function since those values will be
overwritten anyway. As for the other sanity check that was done on the
chip size, I don't think it's really needed.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
* Add R-b
---
 .../mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c  | 31 ++-----------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
index b6c5db9acac9..e34a13b7f919 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
@@ -227,10 +227,6 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 	u16 clock;
 	u8 w0, w1, w2, w3, w4;
 
-	unsigned long chipsize; /* MiB */
-	u8 tbits, col_bits, col_size, row_bits, row_bsize;
-	u32 val;
-
 	nand_controller_init(&b47n->base);
 	b47n->base.ops = &bcm47xxnflash_ops;
 	b47n->nand_chip.controller = &b47n->base;
@@ -264,32 +260,9 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 	err = nand_scan(&b47n->nand_chip, 1);
 	if (err) {
 		pr_err("Could not scan NAND flash: %d\n", err);
-		goto exit;
-	}
-
-	/* Configure FLASH */
-	chipsize = nanddev_target_size(&b47n->nand_chip.base) >> 20;
-	tbits = ffs(chipsize); /* find first bit set */
-	if (!tbits || tbits != fls(chipsize)) {
-		pr_err("Invalid flash size: 0x%lX\n", chipsize);
-		err = -ENOTSUPP;
-		goto exit;
-	}
-	tbits += 19; /* Broadcom increases *index* by 20, we increase *pos* */
-
-	col_bits = b47n->nand_chip.page_shift + 1;
-	col_size = (col_bits + 7) / 8;
-
-	row_bits = tbits - col_bits + 1;
-	row_bsize = (row_bits + 7) / 8;
-
-	val = CONF_ROW_BYTES(row_bsize) | CONF_COL_BYTES(col_size) |
-	      CONF_MAGIC_BIT;
-	bcma_cc_write32(b47n->cc, BCMA_CC_NFLASH_CONF, val);
-
-exit:
-	if (err)
 		bcma_cc_mask32(b47n->cc, BCMA_CC_4706_FLASHSCFG,
 			       ~BCMA_CC_4706_FLASHSCFG_NF1);
+	}
+
 	return err;
 }
-- 
2.25.4

