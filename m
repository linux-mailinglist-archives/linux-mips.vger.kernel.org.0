Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B87ED1AFD7F
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2020 21:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgDSTap (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Apr 2020 15:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgDSTap (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 19 Apr 2020 15:30:45 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDFF0C061A0F
        for <linux-mips@vger.kernel.org>; Sun, 19 Apr 2020 12:30:44 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1D0352A05AA;
        Sun, 19 Apr 2020 20:30:43 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-mtd@lists.infradead.org
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 4/4] mtd: rawnand: au1550nd: Patch the read/write buf helper prototypes
Date:   Sun, 19 Apr 2020 21:30:37 +0200
Message-Id: <20200419193037.1544035-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200419193037.1544035-1-boris.brezillon@collabora.com>
References: <20200419193037.1544035-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

To match the types passed by au1550nd_exec_instr() function.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index dbcbc1c8b6ff..7158298119cf 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -37,13 +37,15 @@ static struct au1550nd_ctx *chip_to_au_ctx(struct nand_chip *this)
  *
  * write function for 8bit buswidth
  */
-static void au_write_buf(struct nand_chip *this, const u_char *buf, int len)
+static void au_write_buf(struct nand_chip *this, const void *buf,
+			 unsigned int len)
 {
 	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
+	const u8 *p = buf;
 	int i;
 
 	for (i = 0; i < len; i++) {
-		writeb(buf[i], ctx->base + MEM_STNAND_DATA);
+		writeb(p[i], ctx->base + MEM_STNAND_DATA);
 		wmb(); /* drain writebuffer */
 	}
 }
@@ -56,13 +58,15 @@ static void au_write_buf(struct nand_chip *this, const u_char *buf, int len)
  *
  * read function for 8bit buswidth
  */
-static void au_read_buf(struct nand_chip *this, u_char *buf, int len)
+static void au_read_buf(struct nand_chip *this, void *buf,
+			unsigned int len)
 {
 	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
+	u8 *p = buf;
 	int i;
 
 	for (i = 0; i < len; i++) {
-		buf[i] = readb(ctx->base + MEM_STNAND_DATA);
+		p[i] = readb(ctx->base + MEM_STNAND_DATA);
 		wmb(); /* drain writebuffer */
 	}
 }
@@ -75,18 +79,18 @@ static void au_read_buf(struct nand_chip *this, u_char *buf, int len)
  *
  * write function for 16bit buswidth
  */
-static void au_write_buf16(struct nand_chip *this, const u_char *buf, int len)
+static void au_write_buf16(struct nand_chip *this, const void *buf,
+			   unsigned int len)
 {
 	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
-	int i;
-	u16 *p = (u16 *) buf;
-	len >>= 1;
+	const u16 *p = buf;
+	unsigned int i;
 
+	len >>= 1;
 	for (i = 0; i < len; i++) {
 		writew(p[i], ctx->base + MEM_STNAND_DATA);
 		wmb(); /* drain writebuffer */
 	}
-
 }
 
 /**
@@ -97,13 +101,13 @@ static void au_write_buf16(struct nand_chip *this, const u_char *buf, int len)
  *
  * read function for 16bit buswidth
  */
-static void au_read_buf16(struct nand_chip *this, u_char *buf, int len)
+static void au_read_buf16(struct nand_chip *this, void *buf, unsigned int len)
 {
 	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
-	int i;
-	u16 *p = (u16 *) buf;
-	len >>= 1;
+	unsigned int i;
+	u16 *p = buf;
 
+	len >>= 1;
 	for (i = 0; i < len; i++) {
 		p[i] = readw(ctx->base + MEM_STNAND_DATA);
 		wmb(); /* drain writebuffer */
-- 
2.25.2

