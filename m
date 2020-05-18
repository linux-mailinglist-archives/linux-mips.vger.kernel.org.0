Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A9B1D7E67
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 18:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgERQ2n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 12:28:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41788 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbgERQ2n (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 12:28:43 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C366F2A0DB9;
        Mon, 18 May 2020 17:28:41 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v2 1/8] mtd: rawnand: Add an is_last flag to nand_subop
Date:   Mon, 18 May 2020 18:28:30 +0200
Message-Id: <20200518162837.304471-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200518162837.304471-1-boris.brezillon@collabora.com>
References: <20200518162837.304471-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some controllers need to know when they're passed the last subop so
they can de-assert the CE pin.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
* Add R-b
---
 drivers/mtd/nand/raw/nand_base.c | 2 ++
 include/linux/mtd/rawnand.h      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 169150a7c140..21f8771b00ba 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2169,6 +2169,8 @@ nand_op_parser_match_pat(const struct nand_op_parser_pattern *pat,
 	 */
 	ctx->subop.ninstrs = ninstrs;
 	ctx->subop.last_instr_end_off = instr_offset;
+	if (ctx->subop.instrs + ninstrs == end && !instr_offset)
+		ctx->subop.is_last = true;
 
 	return true;
 }
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 0f45b6984ad1..69f1c1652187 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -715,6 +715,7 @@ struct nand_op_instr {
  *			   of the sub-operation
  * @last_instr_end_off: offset to end at (excluded) for the last instruction
  *			of the sub-operation
+ * @is_last: this sub-operation is the last one
  *
  * Both @first_instr_start_off and @last_instr_end_off only apply to data or
  * address instructions.
@@ -728,6 +729,7 @@ struct nand_subop {
 	unsigned int ninstrs;
 	unsigned int first_instr_start_off;
 	unsigned int last_instr_end_off;
+	bool is_last;
 };
 
 unsigned int nand_subop_get_addr_start_off(const struct nand_subop *subop,
-- 
2.25.4

