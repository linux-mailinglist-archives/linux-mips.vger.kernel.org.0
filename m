Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5D53A4A54
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbfIAP7g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:59:36 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:42514 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728734AbfIAP7g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:59:36 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 9C7353F684
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:59:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Zr7hUvFCrHSd for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:59:33 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id E74BC3F615
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:59:33 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:59:33 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 058/120] MIPS: PS2: SIF: Handle SIF0 (sub-to-main) RPCs via
 interrupts
Message-ID: <4f70dc50d49675c21ef1e835e21ebbb9dc95a256.1567326213.git.noring@nocrew.org>
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

The SIF0 DMA controller asserts an interrupt on RPC completion. The
kernel invokes the corresponding callback in the command table, and then
resets the SIF0 DMA to receive the next command.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/ps2/sif.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/ps2/sif.c b/drivers/ps2/sif.c
index d077a0a97e02..fac1a5117d1c 100644
--- a/drivers/ps2/sif.c
+++ b/drivers/ps2/sif.c
@@ -164,11 +164,21 @@ static bool sif_smflag_bootend(void)
 	return (sif_read_smflag() & SIF_STATUS_BOOTEND) != 0;
 }
 
+static bool sif0_busy(void)
+{
+	return (inl(DMAC_SIF0_CHCR) & DMAC_CHCR_BUSY) != 0;
+}
+
 static bool sif1_busy(void)
 {
 	return (inl(DMAC_SIF1_CHCR) & DMAC_CHCR_BUSY) != 0;
 }
 
+/*
+ * sif1_ready may be called via cmd_rpc_bind that is a response from
+ * SIF_CMD_RPC_BIND via sif0_dma_handler from IRQ_DMAC_SIF0. Thus we
+ * currently have to busy-wait here if SIF1 is busy.
+ */
 static bool sif1_ready(void)
 {
 	size_t countout = 50000;	/* About 5 s */
@@ -305,6 +315,48 @@ static struct sif_cmd_handler *handler_from_cid(u32 cmd_id)
 	return id < CMD_HANDLER_MAX ? &cmd_handlers[id] : NULL;
 }
 
+static void cmd_call_handler(
+	const struct sif_cmd_header *header, const void *data)
+{
+	const struct sif_cmd_handler *handler = handler_from_cid(header->cmd);
+
+	if (!handler || !handler->cb) {
+		pr_err_once("sif: Invalid command 0x%x ignored\n", header->cmd);
+		return;
+	}
+
+	handler->cb(header, data, handler->arg);
+}
+
+static irqreturn_t sif0_dma_handler(int irq, void *dev_id)
+{
+	const struct sif_cmd_header *header = sif0_buffer;
+	const void *payload = &header[1];
+
+	if (sif0_busy())
+		return IRQ_NONE;
+
+	dma_cache_inv((unsigned long)sif0_buffer, SIF_CMD_PACKET_MAX);
+
+	if (header->data_size)
+		dma_cache_inv((unsigned long)phys_to_virt(header->data_addr),
+				header->data_size);
+
+	if (header->packet_size < sizeof(*header) ||
+	    header->packet_size > SIF_CMD_PACKET_MAX) {
+		pr_err_once("sif: Invalid command header size %u bytes\n",
+			header->packet_size);
+		goto err;
+	}
+
+	cmd_call_handler(header, payload);
+
+err:
+	sif0_reset_dma();	/* Reset DMA for the next incoming packet. */
+
+	return IRQ_HANDLED;
+}
+
 static void cmd_rpc_end(const struct sif_cmd_header *header,
 	const void *data, void *arg)
 {
@@ -530,6 +582,8 @@ EXPORT_SYMBOL_GPL(iop_error_message);
  *
  * 10. Reset the SIF0 (sub-to-main) DMA controller.
  *
+ * 11. Service SIF0 RPCs via interrupts.
+ *
  * Return: 0 on success, otherwise a negative error number
  */
 static int __init sif_init(void)
@@ -584,8 +638,17 @@ static int __init sif_init(void)
 
 	sif0_reset_dma();
 
+	err = request_irq(IRQ_DMAC_SIF0, sif0_dma_handler, 0, "SIF0 DMA", NULL);
+	if (err) {
+		pr_err("sif: Failed to setup SIF0 handler with %d\n", err);
+		goto err_irq_sif0;
+	}
+
 	return 0;
 
+err_irq_sif0:
+	sif_disable_dma();
+
 err_request_commands:
 err_final_subaddr:
 err_iop_reset:
@@ -600,6 +663,8 @@ static void __exit sif_exit(void)
 {
 	sif_disable_dma();
 
+	free_irq(IRQ_DMAC_SIF0, NULL);
+
 	put_dma_buffers();
 }
 
-- 
2.21.0

