Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D309A4A58
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728830AbfIAQBv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:01:51 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:42688 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbfIAQBv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:01:51 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 626F33F63C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:01:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ToJMRHal35WH for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:01:48 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id B3E6A3F58C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:01:48 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:01:48 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 061/120] MIPS: PS2: SIF: sif_rpc_bind() to request an RPC
 server connection
Message-ID: <560734ac45b85db15b6ad002e433c3db979084dd.1567326213.git.noring@nocrew.org>
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

This is the first initialisation step to perform remote procedure calls.

A PAGE_SIZE buffer is allocated to store RPC data. A future improvement is
to make the buffer size adjustable.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/sif.h |  2 ++
 drivers/ps2/sif.c                    | 38 ++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/sif.h b/arch/mips/include/asm/mach-ps2/sif.h
index 3d163980a4be..1d9a7ede2fb5 100644
--- a/arch/mips/include/asm/mach-ps2/sif.h
+++ b/arch/mips/include/asm/mach-ps2/sif.h
@@ -85,4 +85,6 @@ struct sif_rpc_client
 	struct completion done;
 };
 
+int sif_rpc_bind(struct sif_rpc_client *client, u32 server_id);
+
 #endif /* __ASM_MACH_PS2_SIF_H */
diff --git a/drivers/ps2/sif.c b/drivers/ps2/sif.c
index 7a5aab785237..ecb26239518c 100644
--- a/drivers/ps2/sif.c
+++ b/drivers/ps2/sif.c
@@ -387,6 +387,44 @@ static irqreturn_t sif0_dma_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/**
+ * sif_rpc_bind - request a connection to an IOP RPC server
+ * @client: RPC client object to initialise
+ * @server_id: identification number for the requested IOP RPC server
+ *
+ * A %PAGE_SIZE buffer is allocated to store RPC data. A future improvement is
+ * to make its size adjustable.
+ *
+ * Return: 0 on success, otherwise a negative error number
+ */
+int sif_rpc_bind(struct sif_rpc_client *client, u32 server_id)
+{
+	const struct sif_rpc_bind_packet bind = {
+		.client    = client,
+		.server_id = server_id,
+	};
+	int err;
+
+	memset(client, 0, sizeof(*client));
+	init_completion(&client->done);
+
+	client->client_size_max = SIF0_BUFFER_SIZE;
+	client->client_buffer = (void *)__get_free_page(GFP_DMA);
+	if (client->client_buffer == NULL)
+		return -ENOMEM;
+
+	err = sif_cmd(SIF_CMD_RPC_BIND, &bind, sizeof(bind));
+	if (err) {
+		free_page((unsigned long)client->client_buffer);
+		return err;
+	}
+
+	wait_for_completion(&client->done);
+
+	return client->server ? 0 : -ENXIO;
+}
+EXPORT_SYMBOL_GPL(sif_rpc_bind);
+
 static void cmd_rpc_end(const struct sif_cmd_header *header,
 	const void *data, void *arg)
 {
-- 
2.21.0

