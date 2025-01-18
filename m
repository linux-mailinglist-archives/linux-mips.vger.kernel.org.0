Return-Path: <linux-mips+bounces-7509-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AE4A15EDB
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2025 22:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0954B1886A6A
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2025 21:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B181B0410;
	Sat, 18 Jan 2025 21:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="uOFfkpFk"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-66.smtpout.orange.fr [80.12.242.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6412126C13;
	Sat, 18 Jan 2025 21:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737234707; cv=none; b=gKz49Qn1G3hLILkeSR1AhLiEz+2kG9tBqYPT/cc4FKUuBJpwTiJ7ecBi9tyz9TPeXKK/+RUeSaOHbOZLUMfZP1BSRrmEzulFTm8Ztc6zI0ELIMOXeHVl5yp3NbyCExcj/F2YuZz6TxsCJ431XZRrfjLwX4tLVSZOp4X/C4LKslc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737234707; c=relaxed/simple;
	bh=Kw/ivMQ+jFMNqe8BnRFbuarJ2BBJyE4wK0VUSKgGCB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6H1Dsi3m3ntzfa2Jf+RpCGdrgoVOlYIEP+MmmWOH2CsMtOnZAchFiVuMGlIslBPz9Wq+VH1Kq5Pq9HaviHBE2Tjd3/DpxHd6TtHe1DfgEhtktZAvzQS3sThP73rAU20fNmJZcy33VSmk97iklF/vqK8KqsvRY6Oczh8exjUftU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=uOFfkpFk; arc=none smtp.client-ip=80.12.242.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id ZG5KtqKB8C4UXZG5Ot28t8; Sat, 18 Jan 2025 22:10:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1737234634;
	bh=AXmfmYFLgFLyYWM2a/Vc8EsNfX0u6O7RsuTm2Dc3z1k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=uOFfkpFkxwNPtsJGkcqoB2K4XzoTM1t3j0oh6MM3Fibqkav3TI5rEHoEFJCv/x6vS
	 RDTL00Cn8MDpokr1QGyIm8Js6tPKvrXhy2s9Lx5VznHEibWDvpAkyc2I6myxkth0tt
	 EHWU4QY9fXV+5c9jhWyNy04fVsONk5yDy/XeKfOnpjGXhFkcxfDIrmZ25IZ9xMxmLQ
	 loDdvQtvmgV6Rs36+AdYRTJQd1DeRKUWNKYQ9Gp3OPx+4dAfOvo2CcaS8ArENc6/td
	 QAvKDbKZpbnSD2TtLuK7pKOCgW+IO2SIPeLygblto/wZSbXHE+3vAzSmd9Uxv0s832
	 zqKmfowMx+6HA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 18 Jan 2025 22:10:34 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Cercueil <paul@crapouillou.net>,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-doc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] usb: musb: Constify struct musb_fifo_cfg
Date: Sat, 18 Jan 2025 22:10:17 +0100
Message-ID: <26e6f3e25dc8e785d0034dd7e59918e455563e60.1737234596.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct musb_fifo_cfg' are not modified in these drivers.

Constifying these structures moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  64381	   5537	    202	  70120	  111e8	drivers/usb/musb/musb_core.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  64957	   4929	    202	  70088	  111c8	drivers/usb/musb/musb_core.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 .../driver-api/usb/writing_musb_glue_layer.rst     |  2 +-
 drivers/usb/musb/jz4740.c                          |  4 ++--
 drivers/usb/musb/mediatek.c                        |  2 +-
 drivers/usb/musb/mpfs.c                            |  2 +-
 drivers/usb/musb/musb_core.c                       | 14 +++++++-------
 drivers/usb/musb/sunxi.c                           |  4 ++--
 include/linux/usb/musb.h                           |  2 +-
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/driver-api/usb/writing_musb_glue_layer.rst b/Documentation/driver-api/usb/writing_musb_glue_layer.rst
index e755c8551bba..0bb96ecdf527 100644
--- a/Documentation/driver-api/usb/writing_musb_glue_layer.rst
+++ b/Documentation/driver-api/usb/writing_musb_glue_layer.rst
@@ -613,7 +613,7 @@ endpoints configuration from the hardware, so we use line 12 instruction
 to bypass reading the configuration from silicon, and rely on a
 hard-coded table that describes the endpoints configuration instead::
 
-    static struct musb_fifo_cfg jz4740_musb_fifo_cfg[] = {
+    static const struct musb_fifo_cfg jz4740_musb_fifo_cfg[] = {
 	{ .hw_ep_num = 1, .style = FIFO_TX, .maxpacket = 512, },
 	{ .hw_ep_num = 1, .style = FIFO_RX, .maxpacket = 512, },
 	{ .hw_ep_num = 2, .style = FIFO_TX, .maxpacket = 64, },
diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index acdeb1117cd3..df56c972986f 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -59,7 +59,7 @@ static irqreturn_t jz4740_musb_interrupt(int irq, void *__hci)
 	return IRQ_NONE;
 }
 
-static struct musb_fifo_cfg jz4740_musb_fifo_cfg[] = {
+static const struct musb_fifo_cfg jz4740_musb_fifo_cfg[] = {
 	{ .hw_ep_num = 1, .style = FIFO_TX, .maxpacket = 512, },
 	{ .hw_ep_num = 1, .style = FIFO_RX, .maxpacket = 512, },
 	{ .hw_ep_num = 2, .style = FIFO_TX, .maxpacket = 64, },
@@ -205,7 +205,7 @@ static const struct musb_hdrc_platform_data jz4740_musb_pdata = {
 	.platform_ops	= &jz4740_musb_ops,
 };
 
-static struct musb_fifo_cfg jz4770_musb_fifo_cfg[] = {
+static const struct musb_fifo_cfg jz4770_musb_fifo_cfg[] = {
 	{ .hw_ep_num = 1, .style = FIFO_TX, .maxpacket = 512, },
 	{ .hw_ep_num = 1, .style = FIFO_RX, .maxpacket = 512, },
 	{ .hw_ep_num = 2, .style = FIFO_TX, .maxpacket = 512, },
diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index aa988d74b58d..c6cbe718b1da 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -365,7 +365,7 @@ static const struct musb_platform_ops mtk_musb_ops = {
 #define MTK_MUSB_MAX_EP_NUM	8
 #define MTK_MUSB_RAM_BITS	11
 
-static struct musb_fifo_cfg mtk_musb_mode_cfg[] = {
+static const struct musb_fifo_cfg mtk_musb_mode_cfg[] = {
 	{ .hw_ep_num = 1, .style = FIFO_TX, .maxpacket = 512, },
 	{ .hw_ep_num = 1, .style = FIFO_RX, .maxpacket = 512, },
 	{ .hw_ep_num = 2, .style = FIFO_TX, .maxpacket = 512, },
diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 7edc8429b274..71e4271cba75 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -29,7 +29,7 @@ struct mpfs_glue {
 	struct clk *clk;
 };
 
-static struct musb_fifo_cfg mpfs_musb_mode_cfg[] = {
+static const struct musb_fifo_cfg mpfs_musb_mode_cfg[] = {
 	{ .hw_ep_num = 1, .style = FIFO_TX, .maxpacket = 512, },
 	{ .hw_ep_num = 1, .style = FIFO_RX, .maxpacket = 512, },
 	{ .hw_ep_num = 2, .style = FIFO_TX, .maxpacket = 512, },
diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 03b1154a6014..3f11bddfa18b 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -1270,7 +1270,7 @@ MODULE_PARM_DESC(fifo_mode, "initial endpoint configuration");
  */
 
 /* mode 0 - fits in 2KB */
-static struct musb_fifo_cfg mode_0_cfg[] = {
+static const struct musb_fifo_cfg mode_0_cfg[] = {
 { .hw_ep_num = 1, .style = FIFO_TX,   .maxpacket = 512, },
 { .hw_ep_num = 1, .style = FIFO_RX,   .maxpacket = 512, },
 { .hw_ep_num = 2, .style = FIFO_RXTX, .maxpacket = 512, },
@@ -1279,7 +1279,7 @@ static struct musb_fifo_cfg mode_0_cfg[] = {
 };
 
 /* mode 1 - fits in 4KB */
-static struct musb_fifo_cfg mode_1_cfg[] = {
+static const struct musb_fifo_cfg mode_1_cfg[] = {
 { .hw_ep_num = 1, .style = FIFO_TX,   .maxpacket = 512, .mode = BUF_DOUBLE, },
 { .hw_ep_num = 1, .style = FIFO_RX,   .maxpacket = 512, .mode = BUF_DOUBLE, },
 { .hw_ep_num = 2, .style = FIFO_RXTX, .maxpacket = 512, .mode = BUF_DOUBLE, },
@@ -1288,7 +1288,7 @@ static struct musb_fifo_cfg mode_1_cfg[] = {
 };
 
 /* mode 2 - fits in 4KB */
-static struct musb_fifo_cfg mode_2_cfg[] = {
+static const struct musb_fifo_cfg mode_2_cfg[] = {
 { .hw_ep_num = 1, .style = FIFO_TX,   .maxpacket = 512, },
 { .hw_ep_num = 1, .style = FIFO_RX,   .maxpacket = 512, },
 { .hw_ep_num = 2, .style = FIFO_TX,   .maxpacket = 512, },
@@ -1298,7 +1298,7 @@ static struct musb_fifo_cfg mode_2_cfg[] = {
 };
 
 /* mode 3 - fits in 4KB */
-static struct musb_fifo_cfg mode_3_cfg[] = {
+static const struct musb_fifo_cfg mode_3_cfg[] = {
 { .hw_ep_num = 1, .style = FIFO_TX,   .maxpacket = 512, .mode = BUF_DOUBLE, },
 { .hw_ep_num = 1, .style = FIFO_RX,   .maxpacket = 512, .mode = BUF_DOUBLE, },
 { .hw_ep_num = 2, .style = FIFO_TX,   .maxpacket = 512, },
@@ -1308,7 +1308,7 @@ static struct musb_fifo_cfg mode_3_cfg[] = {
 };
 
 /* mode 4 - fits in 16KB */
-static struct musb_fifo_cfg mode_4_cfg[] = {
+static const struct musb_fifo_cfg mode_4_cfg[] = {
 { .hw_ep_num =  1, .style = FIFO_TX,   .maxpacket = 512, },
 { .hw_ep_num =  1, .style = FIFO_RX,   .maxpacket = 512, },
 { .hw_ep_num =  2, .style = FIFO_TX,   .maxpacket = 512, },
@@ -1339,7 +1339,7 @@ static struct musb_fifo_cfg mode_4_cfg[] = {
 };
 
 /* mode 5 - fits in 8KB */
-static struct musb_fifo_cfg mode_5_cfg[] = {
+static const struct musb_fifo_cfg mode_5_cfg[] = {
 { .hw_ep_num =  1, .style = FIFO_TX,   .maxpacket = 512, },
 { .hw_ep_num =  1, .style = FIFO_RX,   .maxpacket = 512, },
 { .hw_ep_num =  2, .style = FIFO_TX,   .maxpacket = 512, },
@@ -1446,7 +1446,7 @@ fifo_setup(struct musb *musb, struct musb_hw_ep  *hw_ep,
 	return offset + (maxpacket << ((c_size & MUSB_FIFOSZ_DPB) ? 1 : 0));
 }
 
-static struct musb_fifo_cfg ep0_cfg = {
+static const struct musb_fifo_cfg ep0_cfg = {
 	.style = FIFO_RXTX, .maxpacket = 64,
 };
 
diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index eac1cde86be3..a6bd3e968cc7 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -629,7 +629,7 @@ static const struct musb_platform_ops sunxi_musb_ops = {
 #define SUNXI_MUSB_RAM_BITS	11
 
 /* Allwinner OTG supports up to 5 endpoints */
-static struct musb_fifo_cfg sunxi_musb_mode_cfg_5eps[] = {
+static const struct musb_fifo_cfg sunxi_musb_mode_cfg_5eps[] = {
 	MUSB_EP_FIFO_SINGLE(1, FIFO_TX, 512),
 	MUSB_EP_FIFO_SINGLE(1, FIFO_RX, 512),
 	MUSB_EP_FIFO_SINGLE(2, FIFO_TX, 512),
@@ -643,7 +643,7 @@ static struct musb_fifo_cfg sunxi_musb_mode_cfg_5eps[] = {
 };
 
 /* H3/V3s OTG supports only 4 endpoints */
-static struct musb_fifo_cfg sunxi_musb_mode_cfg_4eps[] = {
+static const struct musb_fifo_cfg sunxi_musb_mode_cfg_4eps[] = {
 	MUSB_EP_FIFO_SINGLE(1, FIFO_TX, 512),
 	MUSB_EP_FIFO_SINGLE(1, FIFO_RX, 512),
 	MUSB_EP_FIFO_SINGLE(2, FIFO_TX, 512),
diff --git a/include/linux/usb/musb.h b/include/linux/usb/musb.h
index 3963e55e88a3..fbdef950f06c 100644
--- a/include/linux/usb/musb.h
+++ b/include/linux/usb/musb.h
@@ -61,7 +61,7 @@ struct musb_hdrc_eps_bits {
 };
 
 struct musb_hdrc_config {
-	struct musb_fifo_cfg	*fifo_cfg;	/* board fifo configuration */
+	const struct musb_fifo_cfg	*fifo_cfg;	/* board fifo configuration */
 	unsigned		fifo_cfg_size;	/* size of the fifo configuration */
 
 	/* MUSB configuration-specific details */
-- 
2.48.1


