Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B68EA4A50
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbfIAP6N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:58:13 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:58368 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfIAP6N (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:58:13 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id EE42C402D7
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:58:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id rxyDDRi3tQsW for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:58:10 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 358233FC34
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:58:10 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:58:10 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 054/120] MIPS: PS2: SIF: SIF register write command support
Message-ID: <3710c85c9408ca152a894141ff668162c1506f1f.1567326213.git.noring@nocrew.org>
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

The SIF register write command is used to establish the remote procedure
call (RPC) protocol between the IOP and the kernel. Its full use is
unclear. Only register zero (SIF_SREG_RPCINIT) will be used in a
subsequent change.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/sif.h |  5 ++
 drivers/ps2/sif.c                    | 75 ++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/sif.h b/arch/mips/include/asm/mach-ps2/sif.h
index 94da96bd21d1..9d660155cc5f 100644
--- a/arch/mips/include/asm/mach-ps2/sif.h
+++ b/arch/mips/include/asm/mach-ps2/sif.h
@@ -69,4 +69,9 @@ struct sif_cmd_header
 	u32 opt;
 };
 
+typedef void (*sif_cmd_cb)(const struct sif_cmd_header *header,
+	const void *data, void *arg);
+
+int sif_request_cmd(u32 cmd_id, sif_cmd_cb cb, void *arg);
+
 #endif /* __ASM_MACH_PS2_SIF_H */
diff --git a/drivers/ps2/sif.c b/drivers/ps2/sif.c
index 8320c5b68d17..0edcda0b166d 100644
--- a/drivers/ps2/sif.c
+++ b/drivers/ps2/sif.c
@@ -51,10 +51,29 @@
 #define SIF0_BUFFER_SIZE	PAGE_SIZE
 #define SIF1_BUFFER_SIZE	PAGE_SIZE
 
+static DEFINE_SPINLOCK(sregs_lock);
+static s32 sregs[32];
+
 static iop_addr_t iop_buffer; /* Address of IOP SIF DMA receive address */
 static void *sif0_buffer;
 static void *sif1_buffer;
 
+static void cmd_write_sreg(const struct sif_cmd_header *header,
+	const void *data, void *arg)
+{
+	unsigned long flags;
+	const struct {
+		u32 reg;
+		s32 val;
+	} *packet = data;
+
+	BUG_ON(packet->reg >= ARRAY_SIZE(sregs));
+
+	spin_lock_irqsave(&sregs_lock, flags);
+	sregs[packet->reg] = packet->val;
+	spin_unlock_irqrestore(&sregs_lock, flags);
+}
+
 /**
  * sif_write_msflag - write to set main-to-sub flag register bits
  * @mask: MSFLAG register bit values to set
@@ -236,6 +255,34 @@ static int sif_cmd(u32 cmd_id, const void *pkt, size_t pktsize)
 	return sif_cmd_copy(cmd_id, pkt, pktsize, 0, NULL, 0);
 }
 
+static struct sif_cmd_handler *handler_from_cid(u32 cmd_id)
+{
+	enum { CMD_HANDLER_MAX = 64 };
+
+	static struct sif_cmd_handler sys_cmds[CMD_HANDLER_MAX];
+	static struct sif_cmd_handler usr_cmds[CMD_HANDLER_MAX];
+
+	const u32 id = cmd_id & ~SIF_CMD_ID_SYS;
+	struct sif_cmd_handler *cmd_handlers =
+		(cmd_id & SIF_CMD_ID_SYS) != 0 ?  sys_cmds : usr_cmds;
+
+	return id < CMD_HANDLER_MAX ? &cmd_handlers[id] : NULL;
+}
+
+int sif_request_cmd(u32 cmd_id, sif_cmd_cb cb, void *arg)
+{
+	struct sif_cmd_handler *handler = handler_from_cid(cmd_id);
+
+	if (handler == NULL)
+		return -EINVAL;
+
+	handler->cb = cb;
+	handler->arg = arg;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(sif_request_cmd);
+
 static int iop_reset_arg(const char *arg)
 {
 	const size_t arglen = strlen(arg) + 1;
@@ -306,6 +353,25 @@ static int get_dma_buffers(void)
 	return 0;
 }
 
+static int sif_request_cmds(void)
+{
+	const struct {
+		u32 cmd_id;
+		sif_cmd_cb cb;
+		struct cmd_data *arg;
+	} cmds[] = {
+		{ SIF_CMD_WRITE_SREG, cmd_write_sreg, NULL },
+	};
+	int err = 0;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(cmds) && err == 0; i++)
+		err = sif_request_cmd(cmds[i].cmd_id,
+			cmds[i].cb, cmds[i].arg);
+
+	return err;
+}
+
 static void sif_disable_dma(void)
 {
 	outl(DMAC_CHCR_STOP, DMAC_SIF0_CHCR);
@@ -384,6 +450,8 @@ EXPORT_SYMBOL_GPL(iop_error_message);
  *  8. The kernel reads the final SUBADDR register to obtain the command
  *     buffer for the IOP.
  *
+ *  9. Register SIF commands to enable remote procedure calls (RPCs).
+ *
  * Return: 0 on success, otherwise a negative error number
  */
 static int __init sif_init(void)
@@ -427,8 +495,15 @@ static int __init sif_init(void)
 		goto err_final_subaddr;
 	}
 
+	err = sif_request_cmds();
+	if (err) {
+		pr_err("sif: Failed to request commands with %d\n", err);
+		goto err_request_commands;
+	}
+
 	return 0;
 
+err_request_commands:
 err_final_subaddr:
 err_iop_reset:
 err_provisional_subaddr:
-- 
2.21.0

