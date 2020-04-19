Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B948C1AFD80
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2020 21:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgDSTap (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Apr 2020 15:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgDSTap (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 19 Apr 2020 15:30:45 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B39C061A0C
        for <linux-mips@vger.kernel.org>; Sun, 19 Apr 2020 12:30:44 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 615852A0562;
        Sun, 19 Apr 2020 20:30:42 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-mtd@lists.infradead.org
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 2/4] mtd: rawnand: au1550nd: Implement exec_op()
Date:   Sun, 19 Apr 2020 21:30:35 +0200
Message-Id: <20200419193037.1544035-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200419193037.1544035-1-boris.brezillon@collabora.com>
References: <20200419193037.1544035-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

So we can later get rid of the legacy interface implementation.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 110 ++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index 2f8004f20349..79bf9fbeeb22 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -16,6 +16,7 @@
 
 
 struct au1550nd_ctx {
+	struct nand_controller controller;
 	struct nand_chip chip;
 
 	int cs;
@@ -382,6 +383,112 @@ static int find_nand_cs(unsigned long nand_base)
 	return -ENODEV;
 }
 
+static int au1550nd_waitrdy(struct nand_chip *this, unsigned int timeout_ms)
+{
+	unsigned long timeout_jiffies = jiffies;
+
+	timeout_jiffies += msecs_to_jiffies(timeout_ms) + 1;
+	do {
+		if (alchemy_rdsmem(AU1000_MEM_STSTAT) & 0x1)
+			return 0;
+
+		usleep_range(10, 100);
+	} while (time_before(jiffies, timeout_jiffies));
+
+	return -ETIMEDOUT;
+}
+
+static int au1550nd_exec_instr(struct nand_chip *this,
+			       const struct nand_op_instr *instr)
+{
+	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
+	unsigned int i;
+	int ret = 0;
+
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		writeb(instr->ctx.cmd.opcode,
+		       ctx->base + MEM_STNAND_CMD);
+		/* Drain the writebuffer */
+		wmb();
+		break;
+
+	case NAND_OP_ADDR_INSTR:
+		for (i = 0; i < instr->ctx.addr.naddrs; i++) {
+			writeb(instr->ctx.addr.addrs[i],
+			       ctx->base + MEM_STNAND_ADDR);
+			/* Drain the writebuffer */
+			wmb();
+		}
+		break;
+
+	case NAND_OP_DATA_IN_INSTR:
+		if ((this->options & NAND_BUSWIDTH_16) &&
+		    !instr->ctx.data.force_8bit)
+			au_read_buf16(this, instr->ctx.data.buf.in,
+				      instr->ctx.data.len);
+		else
+			au_read_buf(this, instr->ctx.data.buf.in,
+				    instr->ctx.data.len);
+		break;
+
+	case NAND_OP_DATA_OUT_INSTR:
+		if ((this->options & NAND_BUSWIDTH_16) &&
+		    !instr->ctx.data.force_8bit)
+			au_write_buf16(this, instr->ctx.data.buf.out,
+				       instr->ctx.data.len);
+		else
+			au_write_buf(this, instr->ctx.data.buf.out,
+				     instr->ctx.data.len);
+		break;
+
+	case NAND_OP_WAITRDY_INSTR:
+		ret = au1550nd_waitrdy(this, instr->ctx.waitrdy.timeout_ms);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (instr->delay_ns)
+		ndelay(instr->delay_ns);
+
+	return ret;
+}
+
+static int au1550nd_exec_op(struct nand_chip *this,
+			    const struct nand_operation *op,
+			    bool check_only)
+{
+	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
+	unsigned int i;
+	int ret;
+
+	if (check_only)
+		return 0;
+
+	/* assert (force assert) chip enable */
+	alchemy_wrsmem((1 << (4 + ctx->cs)), AU1000_MEM_STNDCTL);
+	/* Drain the writebuffer */
+	wmb();
+
+	for (i = 0; i < op->ninstrs; i++) {
+		ret = au1550nd_exec_instr(this, &op->instrs[i]);
+		if (ret)
+			break;
+	}
+
+	/* deassert chip enable */
+	alchemy_wrsmem(0, AU1000_MEM_STNDCTL);
+	/* Drain the writebuffer */
+	wmb();
+
+	return ret;
+}
+
+static const struct nand_controller_ops au1550nd_ops = {
+	.exec_op = au1550nd_exec_op,
+};
+
 static int au1550nd_probe(struct platform_device *pdev)
 {
 	struct au1550nd_platdata *pd;
@@ -439,6 +546,9 @@ static int au1550nd_probe(struct platform_device *pdev)
 
 	/* 30 us command delay time */
 	this->legacy.chip_delay = 30;
+	nand_controller_init(&ctx->controller);
+	ctx->controller.ops = &au1550nd_ops;
+	this->controller = &ctx->controller;
 	this->ecc.mode = NAND_ECC_SOFT;
 	this->ecc.algo = NAND_ECC_HAMMING;
 
-- 
2.25.2

