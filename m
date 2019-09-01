Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC8AA4A57
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbfIAQAG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:00:06 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:42542 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbfIAQAF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:00:05 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 83BD03F695
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:00:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id UeXzNYOBe5jT for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:00:02 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id AF39F3F615
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:00:02 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:00:02 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 060/120] MIPS: PS2: SIF: Enable the IOP to issue SIF RPCs
Message-ID: <84fc3fb4961e1b598b772889d28817819d93f74e.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Send the SIF_CMD_INIT_CMD command with option argument 1 to let the IOP
issue remote procedure calls (RPCs). Wait for the IOP to acknowledge by
writing a nonzero value to the SIF_SREG_RPCINIT SIF register.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/ps2/sif.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/ps2/sif.c b/drivers/ps2/sif.c
index b6c348974bdb..7a5aab785237 100644
--- a/drivers/ps2/sif.c
+++ b/drivers/ps2/sif.c
@@ -51,6 +51,8 @@
 #define SIF0_BUFFER_SIZE	PAGE_SIZE
 #define SIF1_BUFFER_SIZE	PAGE_SIZE
 
+#define SIF_SREG_RPCINIT	0
+
 struct sif_rpc_packet_header {
 	u32 rec_id;
 	void *pkt_addr;
@@ -74,6 +76,10 @@ struct sif_rpc_bind_packet {
 	u32 server_id;
 };
 
+struct sif_cmd_change_addr_packet {
+	iop_addr_t addr;
+};
+
 struct sif_cmd_handler
 {
 	sif_cmd_cb cb;
@@ -103,6 +109,25 @@ static void cmd_write_sreg(const struct sif_cmd_header *header,
 	spin_unlock_irqrestore(&sregs_lock, flags);
 }
 
+static s32 read_sreg(u32 reg)
+{
+	unsigned long flags;
+	s32 val;
+
+	BUG_ON(reg >= ARRAY_SIZE(sregs));
+
+	spin_lock_irqsave(&sregs_lock, flags);
+	val = sregs[reg];
+	spin_unlock_irqrestore(&sregs_lock, flags);
+
+	return val;
+}
+
+static bool sif_sreg_rpcinit(void)
+{
+	return read_sreg(SIF_SREG_RPCINIT) != 0;
+}
+
 /**
  * sif_write_msflag - write to set main-to-sub flag register bits
  * @mask: MSFLAG register bit values to set
@@ -296,6 +321,11 @@ static int sif_cmd_copy(u32 cmd_id, const void *pkt, size_t pktsize,
 	return sif_cmd_opt_copy(cmd_id, 0, pkt, pktsize, dst, src, nbytes);
 }
 
+static int sif_cmd_opt(u32 cmd_id, u32 opt, const void *pkt, size_t pktsize)
+{
+	return sif_cmd_opt_copy(cmd_id, opt, pkt, pktsize, 0, NULL, 0);
+}
+
 static int sif_cmd(u32 cmd_id, const void *pkt, size_t pktsize)
 {
 	return sif_cmd_copy(cmd_id, pkt, pktsize, 0, NULL, 0);
@@ -448,6 +478,17 @@ static int sif_cmd_init(dma_addr_t cmd_buffer)
 	return sif_cmd_opt(SIF_CMD_INIT_CMD, 0, &cmd, sizeof(cmd));
 }
 
+static int sif_rpc_init(void)
+{
+	int err;
+
+	err = sif_cmd_opt(SIF_CMD_INIT_CMD, 1, NULL, 0);
+	if (err)
+		return err;
+
+	return completed(sif_sreg_rpcinit) ? 0 : -EIO;
+}
+
 static int sif_read_subaddr(dma_addr_t *subaddr)
 {
 	if (!completed(sif_smflag_cmdinit))
@@ -593,6 +634,8 @@ EXPORT_SYMBOL_GPL(iop_error_message);
  *
  * 12. Enable the IOP to issue SIF commands.
  *
+ * 13. Enable the IOP to issue SIF RPCs.
+ *
  * Return: 0 on success, otherwise a negative error number
  */
 static int __init sif_init(void)
@@ -603,6 +646,7 @@ static int __init sif_init(void)
 	BUILD_BUG_ON(sizeof(struct sif_rpc_request_end_packet) != 32);
 	BUILD_BUG_ON(sizeof(struct sif_rpc_bind_packet) != 20);
 	BUILD_BUG_ON(sizeof(struct sif_cmd_header) != 16);
+	BUILD_BUG_ON(sizeof(struct sif_cmd_change_addr_packet) != 4);
 
 	sif_disable_dma();
 
@@ -659,8 +703,15 @@ static int __init sif_init(void)
 		goto err_cmd_init;
 	}
 
+	err = sif_rpc_init();
+	if (err) {
+		pr_err("sif: Failed to initialise RPC with %d\n", err);
+		goto err_rpc_init;
+	}
+
 	return 0;
 
+err_rpc_init:
 err_cmd_init:
 	free_irq(IRQ_DMAC_SIF0, NULL);
 
-- 
2.21.0

