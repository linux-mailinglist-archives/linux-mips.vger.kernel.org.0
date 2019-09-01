Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1B9A4A59
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728840AbfIAQCJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:02:09 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:58732 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbfIAQCJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:02:09 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 431483F53F
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:02:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5p1iUJeqOgia for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:02:07 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 86BFB3F52B
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:02:07 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:02:07 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 062/120] MIPS: PS2: SIF: sif_rpc_unbind() to release an RPC
 server connection
Message-ID: <eea0946866fa71f7c062d67c8a71a5ebdacffeef.1567326213.git.noring@nocrew.org>
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

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/sif.h |  1 +
 drivers/ps2/sif.c                    | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/sif.h b/arch/mips/include/asm/mach-ps2/sif.h
index 1d9a7ede2fb5..5a3128920c9a 100644
--- a/arch/mips/include/asm/mach-ps2/sif.h
+++ b/arch/mips/include/asm/mach-ps2/sif.h
@@ -86,5 +86,6 @@ struct sif_rpc_client
 };
 
 int sif_rpc_bind(struct sif_rpc_client *client, u32 server_id);
+void sif_rpc_unbind(struct sif_rpc_client *client);
 
 #endif /* __ASM_MACH_PS2_SIF_H */
diff --git a/drivers/ps2/sif.c b/drivers/ps2/sif.c
index ecb26239518c..3c098a46832c 100644
--- a/drivers/ps2/sif.c
+++ b/drivers/ps2/sif.c
@@ -395,6 +395,8 @@ static irqreturn_t sif0_dma_handler(int irq, void *dev_id)
  * A %PAGE_SIZE buffer is allocated to store RPC data. A future improvement is
  * to make its size adjustable.
  *
+ * The connection can be released with sif_rpc_unbind().
+ *
  * Return: 0 on success, otherwise a negative error number
  */
 int sif_rpc_bind(struct sif_rpc_client *client, u32 server_id)
@@ -425,6 +427,20 @@ int sif_rpc_bind(struct sif_rpc_client *client, u32 server_id)
 }
 EXPORT_SYMBOL_GPL(sif_rpc_bind);
 
+/**
+ * sif_rpc_unbind - release a connection to an IOP RPC server
+ * @client: RPC client object to release
+ *
+ * The connection must have been established with sif_rpc_bind().
+ */
+void sif_rpc_unbind(struct sif_rpc_client *client)
+{
+	free_page((unsigned long)client->client_buffer);
+
+	/* FIXME: Release the IOP RPC server part */
+}
+EXPORT_SYMBOL_GPL(sif_rpc_unbind);
+
 static void cmd_rpc_end(const struct sif_cmd_header *header,
 	const void *data, void *arg)
 {
-- 
2.21.0

