Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85BE4A4A79
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbfIAQRT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:17:19 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:59124 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbfIAQRT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:17:19 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 8F0A63F7B1
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:17:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3cldcrmmP36D for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:17:16 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id A49E63F752
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:17:16 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:17:16 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 075/120] MIPS: PS2: IOP: IRQ support
Message-ID: <8d4f6f44a2ff5024836a7f1a152c6cd7ab6bdfa2.1567326213.git.noring@nocrew.org>
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

IOP interrupts are not directly available to the kernel. IOP IRQs are
instead serviced by an IRQ relay module, and then forwarded to the
kernel by remote procedure calls (RPCs) via the sub-system interface
(SIF).

The IRQ relay module can also forward IRQs via the SMFLAG (sub-to-main)
register. This is more efficient, but the number of flags is limited.
Currently only RPC forwarding is implemented in the kernel.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/irq.h |  49 ++++++-
 drivers/ps2/Makefile                 |   1 +
 drivers/ps2/iop-irq.c                | 186 +++++++++++++++++++++++++++
 3 files changed, 235 insertions(+), 1 deletion(-)
 create mode 100644 drivers/ps2/iop-irq.c

diff --git a/arch/mips/include/asm/mach-ps2/irq.h b/arch/mips/include/asm/mach-ps2/irq.h
index 64d3fbf4789e..57b3e539ad92 100644
--- a/arch/mips/include/asm/mach-ps2/irq.h
+++ b/arch/mips/include/asm/mach-ps2/irq.h
@@ -13,7 +13,7 @@
 #define INTC_STAT	0x1000f000	/* Flags are cleared by writing 1 */
 #define INTC_MASK	0x1000f010	/* Bits are reversed by writing 1 */
 
-#define NR_IRQS		56
+#define NR_IRQS		128
 
 /*
  * The interrupt controller (INTC) arbitrates interrupts from peripheral
@@ -71,6 +71,53 @@
 #define IRQ_C0_DMAC	51
 #define IRQ_C0_IRQ7	55
 
+/* Input/output processor (IOP) */
+#define IOP_IRQ_BASE	64
+#define IRQ_IOP_VBLANK	64
+#define IRQ_IOP_SBUS	65
+#define IRQ_IOP_CDVD	66
+#define IRQ_IOP_DMA	67
+#define IRQ_IOP_RTC0	68
+#define IRQ_IOP_RTC1	69
+#define IRQ_IOP_RTC2	70
+#define IRQ_IOP_SIO0	71
+#define IRQ_IOP_SIO1	72
+#define IRQ_IOP_SPU	73
+#define IRQ_IOP_PIO	74
+#define IRQ_IOP_EVBLANK	75
+#define IRQ_IOP_DVD	76
+#define IRQ_IOP_DEV9	77
+#define IRQ_IOP_RTC3	78
+#define IRQ_IOP_RTC4	79
+#define IRQ_IOP_RTC5	80
+#define IRQ_IOP_SIO2	81
+#define IRQ_IOP_HTR0	82
+#define IRQ_IOP_HTR1	83
+#define IRQ_IOP_HTR2	84
+#define IRQ_IOP_HTR3	85
+#define IRQ_IOP_USB	86
+#define IRQ_IOP_EXTR	87
+#define IRQ_IOP_ILINK	88
+#define IRQ_IOP_ILNKDMA	89
+
+#define IRQ_IOP_DMAC_MDEC_IN	96	/* Ch 0 */
+#define IRQ_IOP_DMAC_MDEC_OUT	97	/* Ch 1 */
+#define IRQ_IOP_DMAC_SIF2	98	/* Ch 2 */
+#define IRQ_IOP_DMAC_CDVD	99	/* Ch 3 */
+#define IRQ_IOP_DMAC_SPU	100	/* Ch 4 */
+#define IRQ_IOP_DMAC_PIO	101	/* Ch 5 */
+#define IRQ_IOP_DMAC_GPU_OTC	102	/* Ch 6 */
+#define IRQ_IOP_DMAC_BE		103	/* Bus error */
+#define IRQ_IOP_DMAC_SPU2	104	/* Ch 7 */
+#define IRQ_IOP_DMAC_DEV9	105	/* Ch 8 */
+#define IRQ_IOP_DMAC_SIF0	106	/* Ch 9 */
+#define IRQ_IOP_DMAC_SIF1	107	/* Ch 10 */
+#define IRQ_IOP_DMAC_SIO2_IN	108	/* Ch 11 */
+#define IRQ_IOP_DMAC_SIO2_OUT	109	/* Ch 12 */
+
+#define IRQ_IOP_SW1	126	/* R3000A Software Interrupt 1 */
+#define IRQ_IOP_SW2	127	/* R3000A Software Interrupt 2 */
+
 int __init intc_irq_init(void);
 int __init dmac_irq_init(void);
 
diff --git a/drivers/ps2/Makefile b/drivers/ps2/Makefile
index 02a5756cb059..dd00eff52ef3 100644
--- a/drivers/ps2/Makefile
+++ b/drivers/ps2/Makefile
@@ -1,4 +1,5 @@
 obj-m				+= iop-heap.o
+obj-m				+= iop-irq.o
 obj-m				+= iop-memory.o
 obj-m				+= iop-module.o
 obj-m				+= iop-registers.o
diff --git a/drivers/ps2/iop-irq.c b/drivers/ps2/iop-irq.c
new file mode 100644
index 000000000000..859a3f64dd00
--- /dev/null
+++ b/drivers/ps2/iop-irq.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 input/output processor (IOP) IRQs
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+#include <asm/mach-ps2/iop-module.h>
+#include <asm/mach-ps2/irq.h>
+#include <asm/mach-ps2/sif.h>
+
+/**
+ * enum iop_irq_relay_rpc_ops - IOP IRQ relay RPC operations
+ * @rpo_request_irq: request IRQ mapping
+ * @rpo_release_irq: release IRQ mapping
+ * @rpo_remap_irq: remap existing IRQ mapping
+ */
+enum iop_irq_relay_rpc_ops {
+	rpo_request_irq = 1,
+	rpo_release_irq = 2,
+	rpo_remap_irq   = 3,
+};
+
+/**
+ * struct iop_rpc_relay_map - IOP IRQ relay mapping
+ * @u8 iop: IOP IRQ map source
+ * @u8 map: main IRQ map target
+ * @u8 rpc: %true for RPC relay, %false for SMFLAG relay
+ */
+struct iop_rpc_relay_map {
+	u8 iop;
+	u8 map;
+	u8 rpc;
+};
+
+/**
+ * struct iop_rpc_relay_release - IOP IRQ relay to release
+ * @iop: IOP IRQ to release mapping for
+ */
+struct iop_rpc_relay_release {
+	u8 iop;
+};
+
+static struct sif_rpc_client iop_irq_rpc;
+
+static unsigned int iop_irq_startup(struct irq_data *data)
+{
+	static bool irq_relay = false;
+
+	const struct iop_rpc_relay_map arg = {
+		.iop = data->irq - IOP_IRQ_BASE,
+		.map = data->irq,
+		.rpc = true,	/* FIXME: Also implement SMFLAG relay */
+	};
+	s32 status;
+	int err;
+
+	BUG_ON(in_irq());
+
+	if (!irq_relay) {
+		int id;
+
+		/*
+		 * The main reason for requesting the IOP IRQ relay module here
+		 * instead of in irqrelay_init() is that now the console may be
+		 * visible to print messages if there are problems.
+		 */
+		id = iop_module_request("irqrelay", 0x0100, NULL);
+		if (id < 0)
+			return id;
+
+		err = sif_rpc_bind(&iop_irq_rpc, SIF_SID_IRQ_RELAY);
+		if (err < 0) {
+			pr_err("%s: sif_rpc_bind failed with %d\n",
+				__func__, err);
+			return err;
+		}
+
+		irq_relay = true;
+	}
+
+	err = sif_rpc(&iop_irq_rpc, rpo_request_irq,
+		&arg, sizeof(arg),
+		&status, sizeof(status));
+
+	pr_debug("%s: err %d status %d\n", __func__, err, status);
+
+	return err < 0 ? err : status;
+}
+
+static void iop_irq_shutdown(struct irq_data *data)
+{
+	const struct iop_rpc_relay_release arg = {
+		.iop = data->irq - IOP_IRQ_BASE,
+	};
+	s32 status;
+	int err;
+
+	BUG_ON(in_irq());
+
+	err = sif_rpc(&iop_irq_rpc, rpo_release_irq,
+		&arg, sizeof(arg),
+		&status, sizeof(status));
+
+	pr_debug("%s: err %d status %d\n", __func__, err, status);
+}
+
+#define IOP_IRQ_TYPE(irq_, name_)					\
+	{								\
+		.irq = irq_,						\
+		.irq_chip = {						\
+			.name = name_,					\
+			.irq_startup = iop_irq_startup,			\
+			.irq_shutdown = iop_irq_shutdown,		\
+		}							\
+	}
+
+static struct {
+	unsigned int irq;
+	struct irq_chip irq_chip;
+} iop_irqs[] = {
+	IOP_IRQ_TYPE(IRQ_IOP_VBLANK,        "IOP VBLANK"),
+	IOP_IRQ_TYPE(IRQ_IOP_SBUS,          "IOP SBUS"),
+	IOP_IRQ_TYPE(IRQ_IOP_CDVD,          "IOP CDVD"),
+	IOP_IRQ_TYPE(IRQ_IOP_DMA,           "IOP DMA"),
+	IOP_IRQ_TYPE(IRQ_IOP_RTC0,          "IOP RTC0"),
+	IOP_IRQ_TYPE(IRQ_IOP_RTC1,          "IOP RTC1"),
+	IOP_IRQ_TYPE(IRQ_IOP_RTC2,          "IOP RTC2"),
+	IOP_IRQ_TYPE(IRQ_IOP_SIO0,          "IOP SIO0"),
+	IOP_IRQ_TYPE(IRQ_IOP_SIO1,          "IOP SIO1"),
+	IOP_IRQ_TYPE(IRQ_IOP_SPU,           "IOP SPU"),
+	IOP_IRQ_TYPE(IRQ_IOP_PIO,           "IOP PIO"),
+	IOP_IRQ_TYPE(IRQ_IOP_EVBLANK,       "IOP EVBLANK"),
+	IOP_IRQ_TYPE(IRQ_IOP_DVD,           "IOP DVD"),
+	IOP_IRQ_TYPE(IRQ_IOP_DEV9,          "IOP DEV9"),
+	IOP_IRQ_TYPE(IRQ_IOP_RTC3,          "IOP RTC3"),
+	IOP_IRQ_TYPE(IRQ_IOP_RTC4,          "IOP RTC4"),
+	IOP_IRQ_TYPE(IRQ_IOP_RTC5,          "IOP RTC5"),
+	IOP_IRQ_TYPE(IRQ_IOP_SIO2,          "IOP SIO2"),
+	IOP_IRQ_TYPE(IRQ_IOP_HTR0,          "IOP HTR0"),
+	IOP_IRQ_TYPE(IRQ_IOP_HTR1,          "IOP HTR1"),
+	IOP_IRQ_TYPE(IRQ_IOP_HTR2,          "IOP HTR2"),
+	IOP_IRQ_TYPE(IRQ_IOP_HTR3,          "IOP HTR3"),
+	IOP_IRQ_TYPE(IRQ_IOP_USB,           "IOP USB"),
+	IOP_IRQ_TYPE(IRQ_IOP_EXTR,          "IOP EXTR"),
+	IOP_IRQ_TYPE(IRQ_IOP_ILINK,         "IOP iLink"),
+	IOP_IRQ_TYPE(IRQ_IOP_ILNKDMA,       "IOP ILink DMA"),
+	IOP_IRQ_TYPE(IRQ_IOP_DMAC_MDEC_IN,  "IOP DMAC MDEC IN"),
+	IOP_IRQ_TYPE(IRQ_IOP_DMAC_MDEC_OUT, "IOP DMAC MDEC OUT"),
+	IOP_IRQ_TYPE(IRQ_IOP_DMAC_SIF2,     "IOP DMAC SIF2"),
+	IOP_IRQ_TYPE(IRQ_IOP_DMAC_CDVD,     "IOP DMAC CDVD"),
+	IOP_IRQ_TYPE(IRQ_IOP_DMAC_SPU,      "IOP DMAC SPU"),
+	IOP_IRQ_TYPE(IRQ_IOP_DMAC_PIO,      "IOP DMAC PIO"),
+	IOP_IRQ_TYPE(IRQ_IOP_DMAC_GPU_OTC,  "IOP DMAC GPU OTC"),
+	IOP_IRQ_TYPE(IRQ_IOP_DMAC_BE,       "IOP DMAC BE"),
+	IOP_IRQ_TYPE(IRQ_IOP_DMAC_SPU2,     "IOP DMAC SPU2"),
+	IOP_IRQ_TYPE(IRQ_IOP_DMAC_DEV9,     "IOP DMAC DEV9"),
+	IOP_IRQ_TYPE(IRQ_IOP_DMAC_SIF0,     "IOP DMAC SIF0"),
+	IOP_IRQ_TYPE(IRQ_IOP_DMAC_SIF1,     "IOP DMAC SIF1"),
+	IOP_IRQ_TYPE(IRQ_IOP_DMAC_SIO2_IN,  "IOP DMAC SIO2 IN"),
+	IOP_IRQ_TYPE(IRQ_IOP_DMAC_SIO2_OUT, "IOP DMAC SIO2 OUT"),
+	IOP_IRQ_TYPE(IRQ_IOP_SW1,           "IOP SW1"),
+	IOP_IRQ_TYPE(IRQ_IOP_SW2,           "IOP SW2"),
+};
+
+static int __init iop_irq_init(void)
+{
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(iop_irqs); i++)
+		irq_set_chip_and_handler(iop_irqs[i].irq,
+			&iop_irqs[i].irq_chip, handle_level_irq);
+
+	return 0;
+}
+// FIXME: subsys_initcall(iop_irq_init);
+module_init(iop_irq_init);
+
+MODULE_DESCRIPTION("PlayStation 2 input/output processor (IOP) IRQs");
+MODULE_AUTHOR("Fredrik Noring");
+MODULE_LICENSE("GPL");
-- 
2.21.0

