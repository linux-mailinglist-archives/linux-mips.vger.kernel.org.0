Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED43A4A5B
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728848AbfIAQCw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:02:52 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:57772 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbfIAQCw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:02:52 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id F17E23F73E
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:02:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id d_36Y4uHjhaA for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:02:50 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 2CCB53F708
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:02:49 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:02:48 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 063/120] MIPS: PS2: SIF: sif_rpc() to issue a remote
 procedure call
Message-ID: <61ca193962cdb57416226ec942def139585d6d1a.1567326213.git.noring@nocrew.org>
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

This is the actual function to perform IOP procedure calls. For
simplicity a call is synchronous. It is certainly possible to make calls
more efficient, asynchronous, and so on, but ease of use is often more
important than performance, for example when allocating IOP memory
during initialisation of a driver.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/sif.h |  3 ++
 drivers/ps2/sif.c                    | 78 ++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/sif.h b/arch/mips/include/asm/mach-ps2/sif.h
index 5a3128920c9a..d0e59692c3c3 100644
--- a/arch/mips/include/asm/mach-ps2/sif.h
+++ b/arch/mips/include/asm/mach-ps2/sif.h
@@ -88,4 +88,7 @@ struct sif_rpc_client
 int sif_rpc_bind(struct sif_rpc_client *client, u32 server_id);
 void sif_rpc_unbind(struct sif_rpc_client *client);
 
+int sif_rpc(struct sif_rpc_client *client, u32 rpc_id,
+	const void *send, size_t send_size, void *recv, size_t recv_size);
+
 #endif /* __ASM_MACH_PS2_SIF_H */
diff --git a/drivers/ps2/sif.c b/drivers/ps2/sif.c
index 3c098a46832c..5c3866c460af 100644
--- a/drivers/ps2/sif.c
+++ b/drivers/ps2/sif.c
@@ -76,6 +76,20 @@ struct sif_rpc_bind_packet {
 	u32 server_id;
 };
 
+struct sif_rpc_call_packet {
+	struct sif_rpc_packet_header header;
+	struct sif_rpc_client *client;
+	u32 rpc_id;
+
+	u32 send_size;
+
+	dma_addr_t recv_addr;
+	u32 recv_size;
+	u32 recv_mode;
+
+	iop_addr_t server;
+};
+
 struct sif_cmd_change_addr_packet {
 	iop_addr_t addr;
 };
@@ -441,6 +455,68 @@ void sif_rpc_unbind(struct sif_rpc_client *client)
 }
 EXPORT_SYMBOL_GPL(sif_rpc_unbind);
 
+static int sif_rpc_dma(struct sif_rpc_client *client, u32 rpc_id,
+	const void *send, size_t send_size, size_t recv_size)
+{
+	const struct sif_rpc_call_packet call = {
+		.rpc_id    = rpc_id,
+		.send_size = send_size,
+		.recv_addr = virt_to_phys(client->client_buffer),
+		.recv_size = recv_size,
+		.recv_mode = 1,
+		.client    = client,
+		.server    = client->server
+	};
+	int err;
+
+	if (call.send_size != send_size)
+		return -EINVAL;
+	if (recv_size > client->client_size_max)
+		return -EINVAL;
+
+	reinit_completion(&client->done);
+
+	err = sif_cmd_copy(SIF_CMD_RPC_CALL, &call, sizeof(call),
+		client->server_buffer, send, send_size);
+	if (err)
+		return err;
+
+	wait_for_completion(&client->done);
+
+	if (recv_size > 0)
+		dma_cache_inv((unsigned long)client->client_buffer, recv_size);
+
+	return 0;
+}
+
+/**
+ * sif_rpc - issue a remote procedure call (RPC)
+ * @client: RPC client object initialised with sif_rpc_bind()
+ * @rpc_id: identification number of remote procedure to call
+ * @send: data to send with the RPC via DMA, or %NULL if @send_size is zero
+ * @send_size: size in bytes of the data to send
+ * @recv: data to receive from the RPC via DMA, or %NULL if @recv_size is zero
+ * @recv_size: size in bytes of the data to receive
+ *
+ * Due to DMA hardware restrictions, the @send buffer must align with 16-byte
+ * memory boundaries and @send_size is rounded up to a 16-byte multiple.
+ *
+ * FIXME: Lift these send restrictions and use memcpy similar to receive?
+ *
+ * Return: 0 on success, otherwise a negative error number
+ */
+int sif_rpc(struct sif_rpc_client *client, u32 rpc_id,
+	const void *send, size_t send_size, void *recv, size_t recv_size)
+{
+	int err = sif_rpc_dma(client, rpc_id, send, send_size, recv_size);
+
+	if (err == 0)
+		memcpy(recv, client->client_buffer, recv_size);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(sif_rpc);
+
 static void cmd_rpc_end(const struct sif_cmd_header *header,
 	const void *data, void *arg)
 {
@@ -699,6 +775,8 @@ static int __init sif_init(void)
 	BUILD_BUG_ON(sizeof(struct sif_rpc_packet_header) != 12);
 	BUILD_BUG_ON(sizeof(struct sif_rpc_request_end_packet) != 32);
 	BUILD_BUG_ON(sizeof(struct sif_rpc_bind_packet) != 20);
+	BUILD_BUG_ON(sizeof(struct sif_rpc_call_packet) != 40);
+
 	BUILD_BUG_ON(sizeof(struct sif_cmd_header) != 16);
 	BUILD_BUG_ON(sizeof(struct sif_cmd_change_addr_packet) != 4);
 
-- 
2.21.0

