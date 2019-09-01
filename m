Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4C9A4A51
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728672AbfIAP6j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:58:39 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:58452 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfIAP6j (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:58:39 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 9EC483F53F
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:58:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SLy7WBHKZBmJ for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:58:37 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 05CFE3F52B
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:58:36 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:58:36 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 055/120] MIPS: PS2: SIF: Respond to remote procedure call
 (RPC) bind command
Message-ID: <1e53a1edfcd2c49b32574bde040178c97be11e52.1567326213.git.noring@nocrew.org>
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

The IOP can service remote procedure calls (RPCs) from the main (R5900)
processor. The first step is to send a bind command that the IOP will
respond to, to establish a client connection. The main processor responds
by issuing a bind end command to the IOP.

Allocating IOP memory and linking IOP modules are examples of IOP RPC
services that will be used in subsequent changes. IOP memory is needed
for USB OHCI support.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/sif.h | 11 +++++++
 drivers/ps2/sif.c                    | 49 ++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/sif.h b/arch/mips/include/asm/mach-ps2/sif.h
index 9d660155cc5f..3d163980a4be 100644
--- a/arch/mips/include/asm/mach-ps2/sif.h
+++ b/arch/mips/include/asm/mach-ps2/sif.h
@@ -74,4 +74,15 @@ typedef void (*sif_cmd_cb)(const struct sif_cmd_header *header,
 
 int sif_request_cmd(u32 cmd_id, sif_cmd_cb cb, void *arg);
 
+struct sif_rpc_client
+{
+	iop_addr_t server;
+	iop_addr_t server_buffer;
+
+	size_t client_size_max;
+	void *client_buffer;
+
+	struct completion done;
+};
+
 #endif /* __ASM_MACH_PS2_SIF_H */
diff --git a/drivers/ps2/sif.c b/drivers/ps2/sif.c
index 0edcda0b166d..7d0b120398d1 100644
--- a/drivers/ps2/sif.c
+++ b/drivers/ps2/sif.c
@@ -51,6 +51,35 @@
 #define SIF0_BUFFER_SIZE	PAGE_SIZE
 #define SIF1_BUFFER_SIZE	PAGE_SIZE
 
+struct sif_rpc_packet_header {
+	u32 rec_id;
+	void *pkt_addr;
+	u32 rpc_id;
+};
+
+struct sif_rpc_request_end_packet {
+	struct sif_rpc_packet_header header;
+	struct sif_rpc_client *client;
+	u32 client_id;
+
+	iop_addr_t server;
+	iop_addr_t server_buffer;
+
+	void *client_buffer;
+};
+
+struct sif_rpc_bind_packet {
+	struct sif_rpc_packet_header header;
+	struct sif_rpc_client *client;
+	u32 server_id;
+};
+
+struct sif_cmd_handler
+{
+	sif_cmd_cb cb;
+	void *arg;
+};
+
 static DEFINE_SPINLOCK(sregs_lock);
 static s32 sregs[32];
 
@@ -269,6 +298,21 @@ static struct sif_cmd_handler *handler_from_cid(u32 cmd_id)
 	return id < CMD_HANDLER_MAX ? &cmd_handlers[id] : NULL;
 }
 
+static void cmd_rpc_bind(const struct sif_cmd_header *header,
+	const void *data, void *arg)
+{
+	const struct sif_rpc_bind_packet *bind = data;
+	const struct sif_rpc_request_end_packet packet = {
+		.client    = bind->client,
+		.client_id = SIF_CMD_RPC_BIND,
+	};
+	int err;
+
+	err = sif_cmd(SIF_CMD_RPC_END, &packet, sizeof(packet));
+	if (err)
+		pr_err_once("sif: cmd_rpc_bind failed with %d\n", err);
+}
+
 int sif_request_cmd(u32 cmd_id, sif_cmd_cb cb, void *arg)
 {
 	struct sif_cmd_handler *handler = handler_from_cid(cmd_id);
@@ -361,6 +405,8 @@ static int sif_request_cmds(void)
 		struct cmd_data *arg;
 	} cmds[] = {
 		{ SIF_CMD_WRITE_SREG, cmd_write_sreg, NULL },
+
+		{ SIF_CMD_RPC_BIND,   cmd_rpc_bind,   NULL },
 	};
 	int err = 0;
 	size_t i;
@@ -458,6 +504,9 @@ static int __init sif_init(void)
 {
 	int err;
 
+	BUILD_BUG_ON(sizeof(struct sif_rpc_packet_header) != 12);
+	BUILD_BUG_ON(sizeof(struct sif_rpc_request_end_packet) != 32);
+	BUILD_BUG_ON(sizeof(struct sif_rpc_bind_packet) != 20);
 	BUILD_BUG_ON(sizeof(struct sif_cmd_header) != 16);
 
 	sif_disable_dma();
-- 
2.21.0

