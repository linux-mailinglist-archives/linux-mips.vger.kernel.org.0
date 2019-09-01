Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16A79A4A55
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbfIAP7v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:59:51 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:58538 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbfIAP7v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:59:51 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 8A0773F53F
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:59:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oT0zFHAzfnQI for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:59:48 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id D70403F52B
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:59:48 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:59:48 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 059/120] MIPS: PS2: SIF: Enable the IOP to issue SIF commands
Message-ID: <eada3aa266c9323eea975a70dd5bc5e99f78fc29.1567326213.git.noring@nocrew.org>
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

Send the SIF_CMD_INIT_CMD command with option argument 0 to let the IOP
issue SIF commands. The supplied address is the MAINADDR.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/ps2/sif.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/ps2/sif.c b/drivers/ps2/sif.c
index fac1a5117d1c..b6c348974bdb 100644
--- a/drivers/ps2/sif.c
+++ b/drivers/ps2/sif.c
@@ -441,6 +441,13 @@ static int iop_reset(void)
 	return iop_reset_arg(IOP_RESET_ARGS);
 }
 
+static int sif_cmd_init(dma_addr_t cmd_buffer)
+{
+	const struct sif_cmd_change_addr_packet cmd = { .addr = cmd_buffer };
+
+	return sif_cmd_opt(SIF_CMD_INIT_CMD, 0, &cmd, sizeof(cmd));
+}
+
 static int sif_read_subaddr(dma_addr_t *subaddr)
 {
 	if (!completed(sif_smflag_cmdinit))
@@ -584,6 +591,8 @@ EXPORT_SYMBOL_GPL(iop_error_message);
  *
  * 11. Service SIF0 RPCs via interrupts.
  *
+ * 12. Enable the IOP to issue SIF commands.
+ *
  * Return: 0 on success, otherwise a negative error number
  */
 static int __init sif_init(void)
@@ -644,8 +653,17 @@ static int __init sif_init(void)
 		goto err_irq_sif0;
 	}
 
+	err = sif_cmd_init(virt_to_phys(sif0_buffer));
+	if (err) {
+		pr_err("sif: Failed to initialise commands with %d\n", err);
+		goto err_cmd_init;
+	}
+
 	return 0;
 
+err_cmd_init:
+	free_irq(IRQ_DMAC_SIF0, NULL);
+
 err_irq_sif0:
 	sif_disable_dma();
 
-- 
2.21.0

