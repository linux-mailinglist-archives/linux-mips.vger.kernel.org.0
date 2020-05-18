Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 691DB1D7E6E
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 18:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgERQ2p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 12:28:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41852 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727973AbgERQ2p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 12:28:45 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 131EB2A0B14;
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
Subject: [PATCH v2 5/8] mtd: rawnand: bcm47xx: Implement the exec_op() interface
Date:   Mon, 18 May 2020 18:28:34 +0200
Message-Id: <20200518162837.304471-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200518162837.304471-1-boris.brezillon@collabora.com>
References: <20200518162837.304471-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Implement the exec_op() interface so we can get rid of the convoluted
cmdfunc() implementation.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
This is based on my understanding of how this controller works, and I
think it covers all the use cases covered by the custom cmdfunc()
implementation. I might be wrong of course, so it'd be great to have
someone test on real HW.

Changes in v2:
 * s/i/j/ in exec_cmd_addr()
 * Drop WARN_ON()s
---
 .../nand/raw/bcm47xxnflash/bcm47xxnflash.h    |   1 +
 .../mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c  | 140 ++++++++++++++++++
 2 files changed, 141 insertions(+)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h b/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
index 201b9baa52a0..00d0974b73cb 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
@@ -10,6 +10,7 @@
 #include <linux/mtd/rawnand.h>
 
 struct bcm47xxnflash {
+	struct nand_controller base;
 	struct bcma_drv_cc *cc;
 
 	struct nand_chip nand_chip;
diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
index 543fcff6e4d2..edf0c3d7b561 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
@@ -382,6 +382,143 @@ static void bcm47xxnflash_ops_bcm4706_write_buf(struct nand_chip *nand_chip,
 	pr_err("Invalid command for buf write: 0x%X\n", b47n->curr_command);
 }
 
+static int
+bcm47xxnflash_ops_bcm4706_exec_cmd_addr(struct nand_chip *chip,
+					const struct nand_subop *subop)
+{
+	struct bcm47xxnflash *b47n = nand_get_controller_data(chip);
+	u32 nctl = 0, col = 0, row = 0, ncols = 0, nrows = 0;
+	unsigned int i, j;
+
+	for (i = 0; i < subop->ninstrs; i++) {
+		const struct nand_op_instr *instr = &subop->instrs[i];
+
+		switch (instr->type) {
+		case NAND_OP_CMD_INSTR:
+			if (WARN_ON_ONCE((nctl & NCTL_CMD0) &&
+					 (nctl & NCTL_CMD1W)))
+				return -EINVAL;
+			else if (nctl & NCTL_CMD0)
+				nctl |= NCTL_CMD1W |
+					((u32)instr->ctx.cmd.opcode << 8);
+			else
+				nctl |= NCTL_CMD0 | instr->ctx.cmd.opcode;
+			break;
+		case NAND_OP_ADDR_INSTR:
+			for (j = 0; j < instr->ctx.addr.naddrs; j++) {
+				u32 addr = instr->ctx.addr.addrs[j];
+
+				if (j < 2) {
+					col |= addr << (j * 8);
+					nctl |= NCTL_COL;
+					ncols++;
+				} else {
+					row |= addr << ((j - 2) * 8);
+					nctl |= NCTL_ROW;
+					nrows++;
+				}
+			}
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	/* Keep the CS line asserted if there's something else to execute. */
+	if (!subop->is_last)
+		nctl |= NCTL_CSA;
+
+	bcma_cc_write32(b47n->cc, BCMA_CC_NFLASH_CONF,
+			CONF_MAGIC_BIT |
+			CONF_COL_BYTES(ncols) |
+			CONF_ROW_BYTES(nrows));
+	return bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, nctl);
+}
+
+static int
+bcm47xxnflash_ops_bcm4706_exec_waitrdy(struct nand_chip *chip,
+				       const struct nand_subop *subop)
+{
+	struct bcm47xxnflash *b47n = nand_get_controller_data(chip);
+	const struct nand_op_instr *instr = &subop->instrs[0];
+	unsigned long timeout_jiffies = jiffies;
+
+	timeout_jiffies += msecs_to_jiffies(instr->ctx.waitrdy.timeout_ms) + 1;
+	do {
+		if (bcma_cc_read32(b47n->cc, BCMA_CC_NFLASH_CTL) & NCTL_READY)
+			return 0;
+
+		usleep_range(10, 100);
+	} while (time_before(jiffies, timeout_jiffies));
+
+	return -ETIMEDOUT;
+}
+
+static int
+bcm47xxnflash_ops_bcm4706_exec_rw(struct nand_chip *chip,
+				  const struct nand_subop *subop)
+{
+	struct bcm47xxnflash *b47n = nand_get_controller_data(chip);
+	const struct nand_op_instr *instr = &subop->instrs[0];
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < instr->ctx.data.len; i += 4) {
+		unsigned int nbytes = min_t(unsigned int,
+					    instr->ctx.data.len - i, 4);
+		u32 nctl, data;
+
+		nctl = NCTL_CSA | NCTL_DATA_CYCLES(nbytes);
+		if (instr->type == NAND_OP_DATA_IN_INSTR) {
+			nctl |= NCTL_READ;
+		} else {
+			nctl |= NCTL_WRITE;
+			memcpy(&data, instr->ctx.data.buf.in + i, nbytes);
+			bcma_cc_write32(b47n->cc, BCMA_CC_NFLASH_DATA, data);
+		}
+
+		if (i + nbytes < instr->ctx.data.len)
+			nctl |= NCTL_CSA;
+
+		ret = bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, nctl);
+		if (ret)
+			return ret;
+
+		if (instr->type == NAND_OP_DATA_IN_INSTR) {
+			data = bcma_cc_read32(b47n->cc, BCMA_CC_NFLASH_DATA);
+			memcpy(instr->ctx.data.buf.in + i, &data, nbytes);
+		}
+	}
+
+	return 0;
+}
+
+static const struct nand_op_parser bcm47xxnflash_op_parser = NAND_OP_PARSER(
+	NAND_OP_PARSER_PATTERN(bcm47xxnflash_ops_bcm4706_exec_cmd_addr,
+			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
+			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
+			       NAND_OP_PARSER_PAT_CMD_ELEM(true)),
+	NAND_OP_PARSER_PATTERN(bcm47xxnflash_ops_bcm4706_exec_waitrdy,
+			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
+	NAND_OP_PARSER_PATTERN(bcm47xxnflash_ops_bcm4706_exec_rw,
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 0x200)),
+	NAND_OP_PARSER_PATTERN(bcm47xxnflash_ops_bcm4706_exec_rw,
+			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(false, 0x200)),
+);
+
+static int
+bcm47xxnflash_ops_bcm4706_exec_op(struct nand_chip *chip,
+				  const struct nand_operation *op,
+				  bool check_only)
+{
+	return nand_op_parser_exec_op(chip, &bcm47xxnflash_op_parser, op,
+				      check_only);
+}
+
+static const struct nand_controller_ops bcm47xxnflash_ops = {
+	.exec_op = bcm47xxnflash_ops_bcm4706_exec_op,
+};
+
 /**************************************************
  * Init
  **************************************************/
@@ -398,6 +535,9 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 	u8 tbits, col_bits, col_size, row_bits, row_bsize;
 	u32 val;
 
+	nand_controller_init(&b47n->base);
+	b47n->base.ops = &bcm47xxnflash_ops;
+	b47n->nand_chip.controller = &b47n->base;
 	nand_chip->legacy.select_chip = bcm47xxnflash_ops_bcm4706_select_chip;
 	nand_chip->legacy.cmd_ctrl = bcm47xxnflash_ops_bcm4706_cmd_ctrl;
 	nand_chip->legacy.dev_ready = bcm47xxnflash_ops_bcm4706_dev_ready;
-- 
2.25.4

