Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62935A4A77
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbfIAQQm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:16:42 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:44044 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728874AbfIAQQm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:16:42 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id CE12D3F63C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:16:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id k6V134FyPbiP for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:16:40 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 39B563F58C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:16:40 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:16:40 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 074/120] MIPS: PS2: SIF: Request RPC IRQ command
Message-ID: <109dfd3e0eee7af923c8451c8f0e1f8f665375f1.1567326213.git.noring@nocrew.org>
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
 arch/mips/include/asm/mach-ps2/irq.h |  5 +++++
 arch/mips/ps2/intc-irq.c             |  6 ++++++
 drivers/ps2/sif.c                    | 11 +++++++++++
 3 files changed, 22 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/irq.h b/arch/mips/include/asm/mach-ps2/irq.h
index 16c96aa7ca09..64d3fbf4789e 100644
--- a/arch/mips/include/asm/mach-ps2/irq.h
+++ b/arch/mips/include/asm/mach-ps2/irq.h
@@ -74,4 +74,9 @@
 int __init intc_irq_init(void);
 int __init dmac_irq_init(void);
 
+/*
+ * IRQs asserted by the I/O processor (IOP) via the sub-system interface (SIF).
+ */
+void intc_sif_irq(unsigned int irq);
+
 #endif /* __ASM_MACH_PS2_IRQ_H */
diff --git a/arch/mips/ps2/intc-irq.c b/arch/mips/ps2/intc-irq.c
index 36cdc3dd31ca..08659758e85f 100644
--- a/arch/mips/ps2/intc-irq.c
+++ b/arch/mips/ps2/intc-irq.c
@@ -85,6 +85,12 @@ static struct irqaction cascade_intc_irqaction = {
 	.handler = intc_cascade,
 };
 
+void intc_sif_irq(unsigned int irq)
+{
+	do_IRQ(irq);
+}
+EXPORT_SYMBOL_GPL(intc_sif_irq);
+
 int __init intc_irq_init(void)
 {
 	size_t i;
diff --git a/drivers/ps2/sif.c b/drivers/ps2/sif.c
index 5c3866c460af..a7f4f00a539c 100644
--- a/drivers/ps2/sif.c
+++ b/drivers/ps2/sif.c
@@ -568,6 +568,16 @@ int sif_request_cmd(u32 cmd_id, sif_cmd_cb cb, void *arg)
 }
 EXPORT_SYMBOL_GPL(sif_request_cmd);
 
+static void cmd_irq_relay(const struct sif_cmd_header *header,
+	const void *data, void *arg)
+{
+	const struct {
+		u32 irq;
+	} *packet = data;
+
+	intc_sif_irq(packet->irq);
+}
+
 static int iop_reset_arg(const char *arg)
 {
 	const size_t arglen = strlen(arg) + 1;
@@ -664,6 +674,7 @@ static int sif_request_cmds(void)
 		struct cmd_data *arg;
 	} cmds[] = {
 		{ SIF_CMD_WRITE_SREG, cmd_write_sreg, NULL },
+		{ SIF_CMD_IRQ_RELAY,  cmd_irq_relay,  NULL },
 
 		{ SIF_CMD_RPC_END,    cmd_rpc_end,    NULL },
 		{ SIF_CMD_RPC_BIND,   cmd_rpc_bind,   NULL },
-- 
2.21.0

