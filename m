Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF20A4A53
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728687AbfIAP7K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:59:10 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:42470 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfIAP7K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:59:10 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id AEC323F684
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:59:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wV-fxDc96UUm for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:59:08 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 118A03F615
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:59:07 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:59:07 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 057/120] MIPS: PS2: SIF: Reset the SIF0 (sub-to-main) DMA
 controller
Message-ID: <4a489e4ef6239afa79af1faa72d8cd9ce4e045e2.1567326213.git.noring@nocrew.org>
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

Put the SIF0 DMA controller in a known state with a reset.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/ps2/sif.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/ps2/sif.c b/drivers/ps2/sif.c
index 095d11810499..d077a0a97e02 100644
--- a/drivers/ps2/sif.c
+++ b/drivers/ps2/sif.c
@@ -251,6 +251,13 @@ static int sif1_write_irq(const struct sif_cmd_header *header,
 	return sif1_write_ert_int_0(header, true, true, dst, src, nbytes);
 }
 
+static void sif0_reset_dma(void)
+{
+	outl(0, DMAC_SIF0_QWC);
+	outl(0, DMAC_SIF0_MADR);
+	outl(DMAC_CHCR_RECVC_TIE, DMAC_SIF0_CHCR);
+}
+
 static int sif_cmd_opt_copy(u32 cmd_id, u32 opt, const void *pkt,
 	size_t pktsize, iop_addr_t dst, const void *src, size_t nbytes)
 {
@@ -521,6 +528,8 @@ EXPORT_SYMBOL_GPL(iop_error_message);
  *
  *  9. Register SIF commands to enable remote procedure calls (RPCs).
  *
+ * 10. Reset the SIF0 (sub-to-main) DMA controller.
+ *
  * Return: 0 on success, otherwise a negative error number
  */
 static int __init sif_init(void)
@@ -573,6 +582,8 @@ static int __init sif_init(void)
 		goto err_request_commands;
 	}
 
+	sif0_reset_dma();
+
 	return 0;
 
 err_request_commands:
-- 
2.21.0

