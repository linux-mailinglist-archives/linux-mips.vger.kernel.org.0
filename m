Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDA11AFD81
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2020 21:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgDSTap (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Apr 2020 15:30:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42162 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgDSTap (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 19 Apr 2020 15:30:45 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B0A742A059A;
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
Subject: [PATCH 3/4] mtd: rawnand: au1550nd: Get rid of the legacy interface implementation
Date:   Sun, 19 Apr 2020 21:30:36 +0200
Message-Id: <20200419193037.1544035-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200419193037.1544035-1-boris.brezillon@collabora.com>
References: <20200419193037.1544035-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now that exec_op() is implemented we can get rid of all other hooks.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 263 --------------------------------
 1 file changed, 263 deletions(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index 79bf9fbeeb22..dbcbc1c8b6ff 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -29,58 +29,6 @@ static struct au1550nd_ctx *chip_to_au_ctx(struct nand_chip *this)
 	return container_of(this, struct au1550nd_ctx, chip);
 }
 
-/**
- * au_read_byte -  read one byte from the chip
- * @this:	NAND chip object
- *
- * read function for 8bit buswidth
- */
-static u_char au_read_byte(struct nand_chip *this)
-{
-	u_char ret = readb(this->legacy.IO_ADDR_R);
-	wmb(); /* drain writebuffer */
-	return ret;
-}
-
-/**
- * au_write_byte -  write one byte to the chip
- * @this:	NAND chip object
- * @byte:	pointer to data byte to write
- *
- * write function for 8it buswidth
- */
-static void au_write_byte(struct nand_chip *this, u_char byte)
-{
-	writeb(byte, this->legacy.IO_ADDR_W);
-	wmb(); /* drain writebuffer */
-}
-
-/**
- * au_read_byte16 -  read one byte endianness aware from the chip
- * @this:	NAND chip object
- *
- * read function for 16bit buswidth with endianness conversion
- */
-static u_char au_read_byte16(struct nand_chip *this)
-{
-	u_char ret = (u_char) cpu_to_le16(readw(this->legacy.IO_ADDR_R));
-	wmb(); /* drain writebuffer */
-	return ret;
-}
-
-/**
- * au_write_byte16 -  write one byte endianness aware to the chip
- * @this:	NAND chip object
- * @byte:	pointer to data byte to write
- *
- * write function for 16bit buswidth with endianness conversion
- */
-static void au_write_byte16(struct nand_chip *this, u_char byte)
-{
-	writew(le16_to_cpu((u16) byte), this->legacy.IO_ADDR_W);
-	wmb(); /* drain writebuffer */
-}
-
 /**
  * au_write_buf -  write buffer to chip
  * @this:	NAND chip object
@@ -162,206 +110,6 @@ static void au_read_buf16(struct nand_chip *this, u_char *buf, int len)
 	}
 }
 
-/* Select the chip by setting nCE to low */
-#define NAND_CTL_SETNCE		1
-/* Deselect the chip by setting nCE to high */
-#define NAND_CTL_CLRNCE		2
-/* Select the command latch by setting CLE to high */
-#define NAND_CTL_SETCLE		3
-/* Deselect the command latch by setting CLE to low */
-#define NAND_CTL_CLRCLE		4
-/* Select the address latch by setting ALE to high */
-#define NAND_CTL_SETALE		5
-/* Deselect the address latch by setting ALE to low */
-#define NAND_CTL_CLRALE		6
-
-static void au1550_hwcontrol(struct mtd_info *mtd, int cmd)
-{
-	struct nand_chip *this = mtd_to_nand(mtd);
-	struct au1550nd_ctx *ctx = container_of(this, struct au1550nd_ctx,
-						chip);
-
-	switch (cmd) {
-
-	case NAND_CTL_SETCLE:
-		this->legacy.IO_ADDR_W = ctx->base + MEM_STNAND_CMD;
-		break;
-
-	case NAND_CTL_CLRCLE:
-		this->legacy.IO_ADDR_W = ctx->base + MEM_STNAND_DATA;
-		break;
-
-	case NAND_CTL_SETALE:
-		this->legacy.IO_ADDR_W = ctx->base + MEM_STNAND_ADDR;
-		break;
-
-	case NAND_CTL_CLRALE:
-		this->legacy.IO_ADDR_W = ctx->base + MEM_STNAND_DATA;
-		/* FIXME: Nobody knows why this is necessary,
-		 * but it works only that way */
-		udelay(1);
-		break;
-
-	case NAND_CTL_SETNCE:
-		/* assert (force assert) chip enable */
-		alchemy_wrsmem((1 << (4 + ctx->cs)), AU1000_MEM_STNDCTL);
-		break;
-
-	case NAND_CTL_CLRNCE:
-		/* deassert chip enable */
-		alchemy_wrsmem(0, AU1000_MEM_STNDCTL);
-		break;
-	}
-
-	this->legacy.IO_ADDR_R = this->legacy.IO_ADDR_W;
-
-	wmb(); /* Drain the writebuffer */
-}
-
-int au1550_device_ready(struct nand_chip *this)
-{
-	return (alchemy_rdsmem(AU1000_MEM_STSTAT) & 0x1) ? 1 : 0;
-}
-
-/**
- * au1550_select_chip - control -CE line
- *	Forbid driving -CE manually permitting the NAND controller to do this.
- *	Keeping -CE asserted during the whole sector reads interferes with the
- *	NOR flash and PCMCIA drivers as it causes contention on the static bus.
- *	We only have to hold -CE low for the NAND read commands since the flash
- *	chip needs it to be asserted during chip not ready time but the NAND
- *	controller keeps it released.
- *
- * @this:	NAND chip object
- * @chip:	chipnumber to select, -1 for deselect
- */
-static void au1550_select_chip(struct nand_chip *this, int chip)
-{
-}
-
-/**
- * au1550_command - Send command to NAND device
- * @this:	NAND chip object
- * @command:	the command to be sent
- * @column:	the column address for this command, -1 if none
- * @page_addr:	the page address for this command, -1 if none
- */
-static void au1550_command(struct nand_chip *this, unsigned command,
-			   int column, int page_addr)
-{
-	struct mtd_info *mtd = nand_to_mtd(this);
-	struct au1550nd_ctx *ctx = container_of(this, struct au1550nd_ctx,
-						chip);
-	int ce_override = 0, i;
-	unsigned long flags = 0;
-
-	/* Begin command latch cycle */
-	au1550_hwcontrol(mtd, NAND_CTL_SETCLE);
-	/*
-	 * Write out the command to the device.
-	 */
-	if (command == NAND_CMD_SEQIN) {
-		int readcmd;
-
-		if (column >= mtd->writesize) {
-			/* OOB area */
-			column -= mtd->writesize;
-			readcmd = NAND_CMD_READOOB;
-		} else if (column < 256) {
-			/* First 256 bytes --> READ0 */
-			readcmd = NAND_CMD_READ0;
-		} else {
-			column -= 256;
-			readcmd = NAND_CMD_READ1;
-		}
-		ctx->write_byte(this, readcmd);
-	}
-	ctx->write_byte(this, command);
-
-	/* Set ALE and clear CLE to start address cycle */
-	au1550_hwcontrol(mtd, NAND_CTL_CLRCLE);
-
-	if (column != -1 || page_addr != -1) {
-		au1550_hwcontrol(mtd, NAND_CTL_SETALE);
-
-		/* Serially input address */
-		if (column != -1) {
-			/* Adjust columns for 16 bit buswidth */
-			if (this->options & NAND_BUSWIDTH_16 &&
-					!nand_opcode_8bits(command))
-				column >>= 1;
-			ctx->write_byte(this, column);
-		}
-		if (page_addr != -1) {
-			ctx->write_byte(this, (u8)(page_addr & 0xff));
-
-			if (command == NAND_CMD_READ0 ||
-			    command == NAND_CMD_READ1 ||
-			    command == NAND_CMD_READOOB) {
-				/*
-				 * NAND controller will release -CE after
-				 * the last address byte is written, so we'll
-				 * have to forcibly assert it. No interrupts
-				 * are allowed while we do this as we don't
-				 * want the NOR flash or PCMCIA drivers to
-				 * steal our precious bytes of data...
-				 */
-				ce_override = 1;
-				local_irq_save(flags);
-				au1550_hwcontrol(mtd, NAND_CTL_SETNCE);
-			}
-
-			ctx->write_byte(this, (u8)(page_addr >> 8));
-
-			if (this->options & NAND_ROW_ADDR_3)
-				ctx->write_byte(this,
-						((page_addr >> 16) & 0x0f));
-		}
-		/* Latch in address */
-		au1550_hwcontrol(mtd, NAND_CTL_CLRALE);
-	}
-
-	/*
-	 * Program and erase have their own busy handlers.
-	 * Status and sequential in need no delay.
-	 */
-	switch (command) {
-
-	case NAND_CMD_PAGEPROG:
-	case NAND_CMD_ERASE1:
-	case NAND_CMD_ERASE2:
-	case NAND_CMD_SEQIN:
-	case NAND_CMD_STATUS:
-		return;
-
-	case NAND_CMD_RESET:
-		break;
-
-	case NAND_CMD_READ0:
-	case NAND_CMD_READ1:
-	case NAND_CMD_READOOB:
-		/* Check if we're really driving -CE low (just in case) */
-		if (unlikely(!ce_override))
-			break;
-
-		/* Apply a short delay always to ensure that we do wait tWB. */
-		ndelay(100);
-		/* Wait for a chip to become ready... */
-		for (i = this->legacy.chip_delay;
-		     !this->legacy.dev_ready(this) && i > 0; --i)
-			udelay(1);
-
-		/* Release -CE and re-enable interrupts. */
-		au1550_hwcontrol(mtd, NAND_CTL_CLRNCE);
-		local_irq_restore(flags);
-		return;
-	}
-	/* Apply this short delay always to ensure that we do wait tWB. */
-	ndelay(100);
-
-	while(!this->legacy.dev_ready(this));
-}
-
 static int find_nand_cs(unsigned long nand_base)
 {
 	void __iomem *base =
@@ -540,12 +288,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 	}
 	ctx->cs = cs;
 
-	this->legacy.dev_ready = au1550_device_ready;
-	this->legacy.select_chip = au1550_select_chip;
-	this->legacy.cmdfunc = au1550_command;
-
-	/* 30 us command delay time */
-	this->legacy.chip_delay = 30;
 	nand_controller_init(&ctx->controller);
 	ctx->controller.ops = &au1550nd_ops;
 	this->controller = &ctx->controller;
@@ -555,11 +297,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 	if (pd->devwidth)
 		this->options |= NAND_BUSWIDTH_16;
 
-	this->legacy.read_byte = (pd->devwidth) ? au_read_byte16 : au_read_byte;
-	ctx->write_byte = (pd->devwidth) ? au_write_byte16 : au_write_byte;
-	this->legacy.write_buf = (pd->devwidth) ? au_write_buf16 : au_write_buf;
-	this->legacy.read_buf = (pd->devwidth) ? au_read_buf16 : au_read_buf;
-
 	ret = nand_scan(this, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "NAND scan failed with %d\n", ret);
-- 
2.25.2

