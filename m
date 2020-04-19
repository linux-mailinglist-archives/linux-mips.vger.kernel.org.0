Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 831FA1AFD7E
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2020 21:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgDSTao (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Apr 2020 15:30:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42130 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgDSTan (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 19 Apr 2020 15:30:43 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1237A2A0455;
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
Subject: [PATCH 1/4] mtd: rawnand: au1550nd: Stop using IO_ADDR_{R,W} in au_{read,write}_buf[16]()
Date:   Sun, 19 Apr 2020 21:30:34 +0200
Message-Id: <20200419193037.1544035-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200419193037.1544035-1-boris.brezillon@collabora.com>
References: <20200419193037.1544035-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We are about to re-use those for the exec_op() implementation which
will not rely on au1550_hwcontrol(). Let's patch those helpers to
simply use the iomem address stored in the context.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index 75eb3e97fae3..2f8004f20349 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -23,6 +23,11 @@ struct au1550nd_ctx {
 	void (*write_byte)(struct nand_chip *, u_char);
 };
 
+static struct au1550nd_ctx *chip_to_au_ctx(struct nand_chip *this)
+{
+	return container_of(this, struct au1550nd_ctx, chip);
+}
+
 /**
  * au_read_byte -  read one byte from the chip
  * @this:	NAND chip object
@@ -85,10 +90,11 @@ static void au_write_byte16(struct nand_chip *this, u_char byte)
  */
 static void au_write_buf(struct nand_chip *this, const u_char *buf, int len)
 {
+	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
 	int i;
 
 	for (i = 0; i < len; i++) {
-		writeb(buf[i], this->legacy.IO_ADDR_W);
+		writeb(buf[i], ctx->base + MEM_STNAND_DATA);
 		wmb(); /* drain writebuffer */
 	}
 }
@@ -103,10 +109,11 @@ static void au_write_buf(struct nand_chip *this, const u_char *buf, int len)
  */
 static void au_read_buf(struct nand_chip *this, u_char *buf, int len)
 {
+	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
 	int i;
 
 	for (i = 0; i < len; i++) {
-		buf[i] = readb(this->legacy.IO_ADDR_R);
+		buf[i] = readb(ctx->base + MEM_STNAND_DATA);
 		wmb(); /* drain writebuffer */
 	}
 }
@@ -121,12 +128,13 @@ static void au_read_buf(struct nand_chip *this, u_char *buf, int len)
  */
 static void au_write_buf16(struct nand_chip *this, const u_char *buf, int len)
 {
+	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
 	int i;
 	u16 *p = (u16 *) buf;
 	len >>= 1;
 
 	for (i = 0; i < len; i++) {
-		writew(p[i], this->legacy.IO_ADDR_W);
+		writew(p[i], ctx->base + MEM_STNAND_DATA);
 		wmb(); /* drain writebuffer */
 	}
 
@@ -142,12 +150,13 @@ static void au_write_buf16(struct nand_chip *this, const u_char *buf, int len)
  */
 static void au_read_buf16(struct nand_chip *this, u_char *buf, int len)
 {
+	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
 	int i;
 	u16 *p = (u16 *) buf;
 	len >>= 1;
 
 	for (i = 0; i < len; i++) {
-		p[i] = readw(this->legacy.IO_ADDR_R);
+		p[i] = readw(ctx->base + MEM_STNAND_DATA);
 		wmb(); /* drain writebuffer */
 	}
 }
-- 
2.25.2

