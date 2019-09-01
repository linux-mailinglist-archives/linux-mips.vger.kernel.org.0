Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F801A4A24
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbfIAPrx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:47:53 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:41480 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729151AbfIAPrx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:47:53 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 71A713F65F
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:47:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id rrtjtLf0dTRh for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:47:50 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id C33A73F615
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:47:50 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:47:50 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 028/120] MIPS: PS2: DMAC: Define tag structures
Message-ID: <060f4aecc76fcbdb8a938241ec645bbb82862533.1567326213.git.noring@nocrew.org>
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

The DMA tag is used in chain mode to control the destination and source
memory addresses, transfer size, etc. There are two types of tag: source
chain tag and destination chain tag[1].

References:

[1] "EE User's Manual", version 6.0, Sony Computer Entertainment Inc.,
    pp. 58-61.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/dmac.h | 65 +++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/dmac.h b/arch/mips/include/asm/mach-ps2/dmac.h
index 30a0f72eeab3..fb4c52ad9ad5 100644
--- a/arch/mips/include/asm/mach-ps2/dmac.h
+++ b/arch/mips/include/asm/mach-ps2/dmac.h
@@ -186,4 +186,69 @@
 #define DMAC_ENABLER	0x1000f520	/* Acquisition of DMA suspend status */
 #define DMAC_ENABLEW	0x1000f590	/* DMA suspend control */
 
+enum dma_tag_reg {		/* Data start address:	Next tag address: */
+	dma_tag_id_refe = 0,	/* ADDR			(none) */
+	dma_tag_id_cnts = 0,	/* ADDR			(none) */
+	dma_tag_id_cnt,		/* next to tag		next to transfer data */
+	dma_tag_id_next,	/* next to tag		ADDR */
+	dma_tag_id_ref,		/* ADDR			next to tag */
+	dma_tag_id_refs,	/* ADDR			next to tag */
+	dma_tag_id_call,	/* next to tag		ADDR */
+	dma_tag_id_ret,		/* next to tag		Dn_ASR */
+	dma_tag_id_end		/* next to tag		(none) */
+};
+
+/**
+ * enum dma_tag_spr - memory or scratch-pad RAM
+ * @dma_tag_spr_memory: select memory
+ * @dma_tag_spr_scratchpad: select scratch-pad RAM
+ */
+enum dma_tag_spr {
+	dma_tag_spr_memory,
+	dma_tag_spr_scratchpad
+};
+
+/**
+ * struct dma_tag - DMA tag
+ * @qwc: 128-bit quadword count
+ * @pce: priority control enable
+ * @id: &enum dma_tag_reg tag identifier
+ * @irq: interrupt request
+ * @addr: address with lower 4 bits zero
+ * @spr: &enum dma_tag_spr memory or scratch-pad RAM
+ *
+ * The DMA tag must be aligned with 16 byte boundaries.
+ */
+struct dma_tag {
+	u64 qwc : 16;
+	u64 : 10;
+	u64 pce : 2;
+	u64 id : 3;
+	u64 irq : 1;
+	u64 addr : 31;
+	u64 spr : 1;
+
+	u64 : 64;
+} __attribute__((aligned(16)));
+
+/**
+ * struct iop_dma_tag - I/O processor (IOP) DMA tag
+ * @addr: IOP address
+ * @int_0: assert IOP interupt on completion
+ * @ert: FIXME
+ * @wc: 32-bit word count
+ *
+ * The IOP DMA tag must be aligned with 16 byte boundaries.
+ */
+struct iop_dma_tag {
+	u32 addr : 24;
+	u32 : 6;
+	u32 int_0 : 1;
+	u32 ert : 1;
+
+	u32 wc;
+
+	u64 : 64;
+} __attribute__((aligned(16)));
+
 #endif /* __ASM_MACH_PS2_DMAC_H */
-- 
2.21.0

