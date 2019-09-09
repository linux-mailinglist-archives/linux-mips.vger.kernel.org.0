Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D20FAD240
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2019 05:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbfIIDim (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Sep 2019 23:38:42 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36676 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbfIIDim (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Sep 2019 23:38:42 -0400
Received: by mail-pg1-f194.google.com with SMTP id l21so6984925pgm.3
        for <linux-mips@vger.kernel.org>; Sun, 08 Sep 2019 20:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2M8wonX+I/RkSuHWSt9hgNXjdwLVL1UDwyNQ3nExDNQ=;
        b=NAF+6nawyJFMnZA+rrSlwfRH6LX0INQAka5ehJ83pw7fJy3nnlMJ4f260pLWrN1DF6
         CYxfv7DmOzbgAFztrfI0v0RsWBGN2jHMstuQPWxUvuKzbsrZ04byDkrYVsecf7nYXWUJ
         valwGcD2hk7THpn2aAWW+zAEaq4Yb+V4KxZj6OxPY+W/J8oTuMrfo/WWecvFrRI9+n4l
         t7HpRL3mEsoGOTx1o0gV71RLm2FBIRU8vIombUjGhDv57EWr+0e8NAhbJAw03VrqvfXi
         /TfDpp1+BQXPWCpNAs8b1+b2Ap8J0+vHf7jSUS5cI/6v/bs7+I37UjrNJ4l3Il7ik7hO
         +wjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=2M8wonX+I/RkSuHWSt9hgNXjdwLVL1UDwyNQ3nExDNQ=;
        b=T7IaR/lwmASIxvC3pTrGPC6bT6+uBZ/enKiy21nYLdZIDtt83ueZDEMwyPlOE/O+2x
         DhCozR9VGTd41AHQZC9iC21j+2/7k3rT1VYFWszvX5D9Wh2o4u1uqZ6KSBEev6EPmHHN
         rSfiNTqiAUUFkBvFZ9/iWTUjvdNXHj5qwkYa3itj47qj6bYvxrnp8nqwtnF09sANsJHm
         ODDM+jV+aMgfsX+7Ce7TF97mxknjUX+eh2r7/b7csAAaJX2olggCudVPTewWhuXDumXs
         uzi0Bw73CXI3WP61f7uc7CuMoe0PtH2Jmwc6daaVh8T6WephsHNKvcBnNpXxw3i8WHLM
         VnYQ==
X-Gm-Message-State: APjAAAWsYDL9lJuLofCO5XjMqU3jhw8mHNlz97YiP1bDICRj8/A17+4d
        uldKmwCG8aTnWfrW3qe6E8QatV871XN2gQ==
X-Google-Smtp-Source: APXvYqyl6lMEoDDYn9hkhUDArDOxYZiM5hTcf3L7LpTU80V0U35KA06Ix3Hvgdhlvk9cLc/9qCnghg==
X-Received: by 2002:a17:90a:4c:: with SMTP id 12mr22331110pjb.40.1568000320101;
        Sun, 08 Sep 2019 20:38:40 -0700 (PDT)
Received: from software.domain.org ([103.118.43.97])
        by smtp.gmail.com with ESMTPSA id b24sm13939437pfi.75.2019.09.08.20.38.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 08 Sep 2019 20:38:39 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@linux-mips.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V1 3/3] MIPS: Loongson-3: Add CSR IPI support
Date:   Mon,  9 Sep 2019 11:38:23 +0800
Message-Id: <1568000303-771-3-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1568000303-771-1-git-send-email-chenhc@lemote.com>
References: <1568000303-771-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CSR IPI and legacy MMIO use the same infrastructure, but CSR IPI is
faster than legacy MMIO IPI. This patch enable CSR IPI if possible
(except for MailBox, because CSR IPI is too complicated for MailBox).

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/loongson64/loongson-3/smp.c | 70 +++++++++++++++++++++++++++++++----
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/arch/mips/loongson64/loongson-3/smp.c b/arch/mips/loongson64/loongson-3/smp.c
index e999bb1..de8e074 100644
--- a/arch/mips/loongson64/loongson-3/smp.c
+++ b/arch/mips/loongson64/loongson-3/smp.c
@@ -18,6 +18,7 @@
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 #include <loongson.h>
+#include <loongson_regs.h>
 #include <workarounds.h>
 
 #include "smp.h"
@@ -48,6 +49,62 @@ static uint32_t core0_c0count[NR_CPUS];
 		__wbflush();			\
 	} while (0)
 
+u32 (*ipi_read_clear)(int cpu);
+void (*ipi_write_action)(int cpu, u32 action);
+
+static u32 csr_ipi_read_clear(int cpu)
+{
+	u32 action;
+
+	/* Load the ipi register to figure out what we're supposed to do */
+	action = csr_readl(LOONGSON_CSR_IPI_STATUS);
+	/* Clear the ipi register to clear the interrupt */
+	csr_writel(action, LOONGSON_CSR_IPI_CLEAR);
+
+	return action;
+}
+
+static void csr_ipi_write_action(int cpu, u32 action)
+{
+	unsigned int irq = 0;
+
+	while ((irq = ffs(action))) {
+		uint32_t val = CSR_IPI_SEND_BLOCK;
+		val |= (irq - 1);
+		val |= (cpu << CSR_IPI_SEND_CPU_SHIFT);
+		csr_writel(val, LOONGSON_CSR_IPI_SEND);
+		action &= ~BIT(irq - 1);
+	}
+}
+
+static u32 legacy_ipi_read_clear(int cpu)
+{
+	u32 action;
+
+	/* Load the ipi register to figure out what we're supposed to do */
+	action = loongson3_ipi_read32(ipi_status0_regs[cpu_logical_map(cpu)]);
+	/* Clear the ipi register to clear the interrupt */
+	loongson3_ipi_write32(action, ipi_clear0_regs[cpu_logical_map(cpu)]);
+
+	return action;
+}
+
+static void legacy_ipi_write_action(int cpu, u32 action)
+{
+	loongson3_ipi_write32((u32)action, ipi_set0_regs[cpu]);
+}
+
+static void csr_ipi_probe(void)
+{
+	if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_IPI) {
+		ipi_read_clear = csr_ipi_read_clear;
+		ipi_write_action = csr_ipi_write_action;
+	} else {
+		ipi_read_clear = legacy_ipi_read_clear;
+		ipi_write_action = legacy_ipi_write_action;
+	}
+}
+
 static void ipi_set0_regs_init(void)
 {
 	ipi_set0_regs[0] = (void *)
@@ -233,7 +290,7 @@ static void ipi_mailbox_buf_init(void)
  */
 static void loongson3_send_ipi_single(int cpu, unsigned int action)
 {
-	loongson3_ipi_write32((u32)action, ipi_set0_regs[cpu_logical_map(cpu)]);
+	ipi_write_action(cpu_logical_map(cpu), (u32)action);
 }
 
 static void
@@ -242,14 +299,14 @@ loongson3_send_ipi_mask(const struct cpumask *mask, unsigned int action)
 	unsigned int i;
 
 	for_each_cpu(i, mask)
-		loongson3_ipi_write32((u32)action, ipi_set0_regs[cpu_logical_map(i)]);
+		ipi_write_action(cpu_logical_map(i), (u32)action);
 }
 
 #define IPI_IRQ_OFFSET 6
 
 void loongson3_send_irq_by_ipi(int cpu, int irqs)
 {
-	loongson3_ipi_write32(irqs << IPI_IRQ_OFFSET, ipi_set0_regs[cpu_logical_map(cpu)]);
+	ipi_write_action(cpu_logical_map(cpu), irqs << IPI_IRQ_OFFSET);
 }
 
 void loongson3_ipi_interrupt(struct pt_regs *regs)
@@ -257,13 +314,9 @@ void loongson3_ipi_interrupt(struct pt_regs *regs)
 	int i, cpu = smp_processor_id();
 	unsigned int action, c0count, irqs;
 
-	/* Load the ipi register to figure out what we're supposed to do */
-	action = loongson3_ipi_read32(ipi_status0_regs[cpu_logical_map(cpu)]);
+	action = ipi_read_clear(cpu);
 	irqs = action >> IPI_IRQ_OFFSET;
 
-	/* Clear the ipi register to clear the interrupt */
-	loongson3_ipi_write32((u32)action, ipi_clear0_regs[cpu_logical_map(cpu)]);
-
 	if (action & SMP_RESCHEDULE_YOURSELF)
 		scheduler_ipi();
 
@@ -372,6 +425,7 @@ static void __init loongson3_smp_setup(void)
 		num++;
 	}
 
+	csr_ipi_probe();
 	ipi_set0_regs_init();
 	ipi_clear0_regs_init();
 	ipi_status0_regs_init();
-- 
2.7.0

