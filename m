Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E07F0A4A7B
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbfIAQSU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:18:20 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:44238 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbfIAQSU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:18:20 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id B6F443F65F
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:18:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fHsoRL-32Jy5 for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:18:17 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id EE5183F58C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:18:16 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:18:16 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 077/120] MIPS: PS2: GS: Write privileged registers
Message-ID: <758ac4deba96217ee4ec40dc06429951e4d4495c.1567326213.git.noring@nocrew.org>
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

All privileged Graphics Synthesizer register functions follow the same
pattern. For example, the CSR register has the following functions:

    bool gs_valid_csr(void);
    void gs_writeq_csr(u64 value);

gs_valid_csr() indicates whether CSR is readable, which is always true,
since CSR is read-write in hardware. The IMR register however is write-
only in hardware, so its shadow register is only valid and readable once
it is written at least once. Reading nonvalid registers is not permitted.

The following registers have functions: PMODE, SMODE1, SMODE2, SYNCH1,
SYNCH2, SYNCV, SRFSH, DISPFB1, DISPLAY1, DISPFB2, DISPLAY2, EXTBUF,
EXTDATA, EXTWRITE, BGCOLOR, CSR, IMR, BUSDIR and SIGLBLID.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/gs-registers.h |  48 +++++++
 drivers/ps2/Makefile                          |   2 +
 drivers/ps2/gs-registers.c                    | 121 ++++++++++++++++++
 3 files changed, 171 insertions(+)
 create mode 100644 drivers/ps2/gs-registers.c

diff --git a/arch/mips/include/asm/mach-ps2/gs-registers.h b/arch/mips/include/asm/mach-ps2/gs-registers.h
index ab59c751190f..291b503447e4 100644
--- a/arch/mips/include/asm/mach-ps2/gs-registers.h
+++ b/arch/mips/include/asm/mach-ps2/gs-registers.h
@@ -545,4 +545,52 @@ struct gs_siglblid {
 	u64 lblid : 32;
 };
 
+#define GS_DECLARE_VALID_REG(reg)			\
+	bool gs_valid_##reg(void)
+
+#define GS_DECLARE_WQ_REG(reg)				\
+	void gs_writeq_##reg(u64 value)
+
+#define GS_DECLARE_RW_REG(reg)				\
+	GS_DECLARE_VALID_REG(reg);			\
+	GS_DECLARE_WQ_REG(reg)
+
+/**
+ * DOC:
+ *
+ * All privileged Graphics Synthesizer register functions follow the same
+ * pattern. For example, the CSR register has the following functions::
+ *
+ *	bool gs_valid_csr(void);
+ *	void gs_writeq_csr(u64 value);
+ *
+ * gs_valid_csr() indicates whether CSR is readable, which is always true,
+ * since CSR is read-write in hardware. The IMR register however is write-
+ * only in hardware, so its shadow register is only valid and readable once
+ * it is written at least once. Reading nonvalid registers is not permitted.
+ *
+ * The following registers have functions: PMODE, SMODE1, SMODE2, SRFSH,
+ * SYNCH1, SYNCH2, SYNCV, DISPFB1 , DISPLAY1, DISPFB2, DISPLAY2, EXTBUF,
+ * EXTDATA, EXTWRITE, BGCOLOR, CSR, IMR, BUSDIR and SIGLBLID.
+ */
+GS_DECLARE_RW_REG(pmode);
+GS_DECLARE_RW_REG(smode1);
+GS_DECLARE_RW_REG(smode2);
+GS_DECLARE_RW_REG(srfsh);
+GS_DECLARE_RW_REG(synch1);
+GS_DECLARE_RW_REG(synch2);
+GS_DECLARE_RW_REG(syncv);
+GS_DECLARE_RW_REG(dispfb1 );
+GS_DECLARE_RW_REG(display1);
+GS_DECLARE_RW_REG(dispfb2);
+GS_DECLARE_RW_REG(display2);
+GS_DECLARE_RW_REG(extbuf);
+GS_DECLARE_RW_REG(extdata);
+GS_DECLARE_RW_REG(extwrite);
+GS_DECLARE_RW_REG(bgcolor);
+GS_DECLARE_RW_REG(csr);
+GS_DECLARE_RW_REG(imr);
+GS_DECLARE_RW_REG(busdir);
+GS_DECLARE_RW_REG(siglblid);
+
 #endif /* __ASM_MACH_PS2_GS_REGISTERS_H */
diff --git a/drivers/ps2/Makefile b/drivers/ps2/Makefile
index dd00eff52ef3..533ab86d6a58 100644
--- a/drivers/ps2/Makefile
+++ b/drivers/ps2/Makefile
@@ -1,3 +1,5 @@
+obj-$(CONFIG_PS2_GS)		+= gs-registers.o
+
 obj-m				+= iop-heap.o
 obj-m				+= iop-irq.o
 obj-m				+= iop-memory.o
diff --git a/drivers/ps2/gs-registers.c b/drivers/ps2/gs-registers.c
new file mode 100644
index 000000000000..781604b874b5
--- /dev/null
+++ b/drivers/ps2/gs-registers.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 privileged Graphics Synthesizer (GS) registers
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#include <linux/build_bug.h>
+#include <linux/ctype.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include <asm/io.h>
+
+#include <asm/mach-ps2/gs-registers.h>
+
+/* Shadow write-only privileged Graphics Synthesizer registers. */
+static struct {
+	spinlock_t lock;	/* Must be taken to access shadow registers. */
+
+	struct {
+		u64 value;
+		bool valid;	/* True if value is written at least once. */
+	} pmode,
+	  smode1,
+	  smode2,
+	  srfsh,
+	  synch1,
+	  synch2,
+	  syncv,
+	  dispfb1,
+	  display1,
+	  dispfb2,
+	  display2,
+	  extbuf,
+	  extdata,
+	  extwrite,
+	  bgcolor,
+	  imr,
+	  busdir;
+} gs_registers = {
+	.lock = __SPIN_LOCK_UNLOCKED(gs_registers.lock),
+};
+
+/* Read-write registers are not shadowed and are always valid. */
+#define GS_DEFINE_VALID_RW_REG(reg, addr)				\
+	bool gs_valid_##reg(void)					\
+	{								\
+		return true;						\
+	}								\
+	EXPORT_SYMBOL_GPL(gs_valid_##reg)
+
+/* Read-write registers are not shadowed and trivially write. */
+#define GS_DEFINE_WQ_RW_REG(reg, addr)					\
+	void gs_writeq_##reg(u64 value)					\
+	{								\
+		outq(value, addr);					\
+	}								\
+	EXPORT_SYMBOL_GPL(gs_writeq_##reg)
+
+/* Write-only registers are shadowed and valid only if previously written. */
+#define GS_DEFINE_VALID_WO_REG(reg, addr)				\
+	bool gs_valid_##reg(void)					\
+	{								\
+		unsigned long flags;					\
+		bool valid;						\
+		spin_lock_irqsave(&gs_registers.lock, flags);		\
+		valid = gs_registers.reg.valid;				\
+		spin_unlock_irqrestore(&gs_registers.lock, flags);	\
+		return valid;						\
+	}								\
+	EXPORT_SYMBOL_GPL(gs_valid_##reg)
+
+/* Write-only registers are shadowed and reading requires a previous write. */
+#define GS_DEFINE_WQ_WO_REG(reg, addr)					\
+	void gs_writeq_##reg(u64 value)					\
+	{								\
+		unsigned long flags;					\
+		spin_lock_irqsave(&gs_registers.lock, flags);		\
+		gs_registers.reg.value = value;				\
+		gs_registers.reg.valid = true;				\
+		outq(value, addr);					\
+		spin_unlock_irqrestore(&gs_registers.lock, flags);	\
+	}								\
+	EXPORT_SYMBOL_GPL(gs_writeq_##reg)
+
+/* Only CSR and SIGLBLID are read-write (RW) with hardware. */
+#define GS_DEFINE_RW_REG(reg, addr)					\
+	GS_DEFINE_VALID_RW_REG(reg, addr);				\
+	GS_DEFINE_WQ_RW_REG(reg, addr)
+
+/* The rest are write-only (WO) with reading emulated by shadow registers. */
+#define GS_DEFINE_WO_REG(reg, addr)					\
+	GS_DEFINE_VALID_WO_REG(reg, addr);				\
+	GS_DEFINE_WQ_WO_REG(reg, addr)
+
+GS_DEFINE_WO_REG(pmode,    GS_PMODE);
+GS_DEFINE_WO_REG(smode1,   GS_SMODE1);
+GS_DEFINE_WO_REG(smode2,   GS_SMODE2);
+GS_DEFINE_WO_REG(srfsh,    GS_SRFSH);
+GS_DEFINE_WO_REG(synch1,   GS_SYNCH1);
+GS_DEFINE_WO_REG(synch2,   GS_SYNCH2);
+GS_DEFINE_WO_REG(syncv,    GS_SYNCV);
+GS_DEFINE_WO_REG(dispfb1,  GS_DISPFB1);
+GS_DEFINE_WO_REG(display1, GS_DISPLAY1);
+GS_DEFINE_WO_REG(dispfb2,  GS_DISPFB2);
+GS_DEFINE_WO_REG(display2, GS_DISPLAY2);
+GS_DEFINE_WO_REG(extbuf,   GS_EXTBUF);
+GS_DEFINE_WO_REG(extdata,  GS_EXTDATA);
+GS_DEFINE_WO_REG(extwrite, GS_EXTWRITE);
+GS_DEFINE_WO_REG(bgcolor,  GS_BGCOLOR);
+GS_DEFINE_RW_REG(csr,      GS_CSR);		/* Read-write */
+GS_DEFINE_WO_REG(imr,      GS_IMR);
+GS_DEFINE_WO_REG(busdir,   GS_BUSDIR);
+GS_DEFINE_RW_REG(siglblid, GS_SIGLBLID);	/* Read-write */
+
+MODULE_DESCRIPTION("PlayStation 2 privileged Graphics Synthesizer registers");
+MODULE_AUTHOR("Fredrik Noring");
+MODULE_LICENSE("GPL");
-- 
2.21.0

