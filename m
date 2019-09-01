Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B82BA4A7E
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728616AbfIAQTx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:19:53 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:44414 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbfIAQTx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:19:53 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 76BF33F660
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:19:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pvqKcEilYgdH for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:19:50 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id D3C8A3F58C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:19:50 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:19:50 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 080/120] MIPS: PS2: GS: Define gs_xorq_imr()
Message-ID: <c11ccb53a7c064ad002b0742cbea0869e72db165.1567326213.git.noring@nocrew.org>
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
Perhaps this function could have a better name?
---
 arch/mips/include/asm/mach-ps2/gs-registers.h |  8 ++++++++
 drivers/ps2/gs-registers.c                    | 17 +++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/gs-registers.h b/arch/mips/include/asm/mach-ps2/gs-registers.h
index 596e277a6940..badcb3cce5c2 100644
--- a/arch/mips/include/asm/mach-ps2/gs-registers.h
+++ b/arch/mips/include/asm/mach-ps2/gs-registers.h
@@ -609,4 +609,12 @@ GS_DECLARE_RW_REG(imr,      imr);
 GS_DECLARE_RW_REG(busdir,   busdir);
 GS_DECLARE_RW_REG(siglblid, siglblid);
 
+/**
+ * gs_xorq_imr - exclusive or (XOR) value with the IMR register
+ * @value: value to XOR with the IMR register
+ *
+ * Return: the resulting IMR value
+ */
+u64 gs_xorq_imr(u64 value);
+
 #endif /* __ASM_MACH_PS2_GS_REGISTERS_H */
diff --git a/drivers/ps2/gs-registers.c b/drivers/ps2/gs-registers.c
index 1bd1d072f4cf..8d2bdd26438d 100644
--- a/drivers/ps2/gs-registers.c
+++ b/drivers/ps2/gs-registers.c
@@ -167,6 +167,23 @@ GS_DEFINE_WO_REG(imr,      imr,      GS_IMR);
 GS_DEFINE_WO_REG(busdir,   busdir,   GS_BUSDIR);
 GS_DEFINE_RW_REG(siglblid, siglblid, GS_SIGLBLID);	/* Read-write */
 
+u64 gs_xorq_imr(u64 value)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&gs_registers.lock, flags);
+
+	WARN_ON_ONCE(!gs_registers.imr.valid);
+	value = value ^ gs_registers.imr.value;
+	gs_registers.imr.value = value;
+	outq(value, GS_IMR);
+
+	spin_unlock_irqrestore(&gs_registers.lock, flags);
+
+	return value;
+}
+EXPORT_SYMBOL_GPL(gs_xorq_imr);
+
 MODULE_DESCRIPTION("PlayStation 2 privileged Graphics Synthesizer registers");
 MODULE_AUTHOR("Fredrik Noring");
 MODULE_LICENSE("GPL");
-- 
2.21.0

