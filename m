Return-Path: <linux-mips+bounces-3697-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACF9909FCE
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 23:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A4B61C21391
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 21:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853876A33D;
	Sun, 16 Jun 2024 21:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="R2kH3w3s";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ovIofMuG"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8605B1E5;
	Sun, 16 Jun 2024 21:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718571816; cv=none; b=b6/cwfiqe7R6p8ELCFnr6Y4+GYC62tkSFMoW358ovrQP7mhrfYJWKquIgdj1bexn/6oUozFwUs3TBQxdg3gK9ZHKEAcR1gDYRbFSDvKKboprEPVGGkB7C2MsSwdO/1vrhpAlQnaeL/gI41C24/0BQXPaV7J4XL9RuJCD2epGvvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718571816; c=relaxed/simple;
	bh=KsQJA78l2EG1AePEtuNM5A5yp2HhCualT38E0jX+dDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c7fDerRVQZVWpaKkVVPL/FjFlTD1YBuVj+sYzeTYOw2Id3fTZRDaAg6ufrHgGS5oDZ7cqrVky+ksQ3xxnlDGzYFKFEq2x4yBX6v2xx7PS6BgFA0KpHUS3S0TBgvq+cLK8l8z/ayu+wrt+5FSUG2lSCfn9dmpAdpusn58+drzlu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=R2kH3w3s; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ovIofMuG; arc=none smtp.client-ip=64.147.123.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id 87CDD18000AC;
	Sun, 16 Jun 2024 17:03:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 16 Jun 2024 17:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718571812;
	 x=1718658212; bh=x3gpIaj0Pn6na4DuLdp1UEvubuCDt4zg+JvemqwjwM0=; b=
	R2kH3w3ssWvHColII/ZEFBx+6FiR24xKHQk3fgMNsjZaS8cb4zqEx3MY5OJy5+XS
	XXJsvfbUdMtvwOrdJNMu21/Ly4lV//hjWAyGFLYVl0s3rdmovldWv31upn0dra9F
	zXR0BK6vUnM57rm4m3Wp8TfZWW9zIPFt0YjyxpQuGWLWfRJJFBRq6BO/NZswBdCO
	S3IfEzKEJIaSYh9EMrtq0yRKdAtQd2489V6yqw6VvuAoU/V/fUSVWVZkGzVQtUZB
	mZtruvuC9ZeLiKOvfmV+SRzo6O/x+Ck7bgiB69twktpBbKy9z3hw/MLS0CfMaUM2
	CzCP3gDpiactzo6DfbA8zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718571812; x=
	1718658212; bh=x3gpIaj0Pn6na4DuLdp1UEvubuCDt4zg+JvemqwjwM0=; b=o
	vIofMuGRntyoilMNBrKguI4QRdP8g+CJvdE4awUokQ8509HhAJAYifjr6Z9HQ6eM
	AvyC7qGho0tJm8EMssfahIHL/3qZ0COcbu622Nsy2dveMVg5RYQOYUFT9YIYAKbE
	/hLloiw3FX2NLaOs7CWt7OXVCIM3tLcpeIfGdf9vTRkjs4zy3D7l2QAj54RVqxkH
	Dn4MxfASuO8Fx0nWeAtF0PVOY1CKJeCfGqrYRyoEkficQeottJ1o5SBZng0HxRuE
	3YBBkDqp0HVzMA7zCGKBTy7KpyEGcK3cbLRhyt9asPqoOmuAEiUM+uHEZQ907RTN
	dQ8t2JlamGpWB9QMZpBhw==
X-ME-Sender: <xms:I1NvZj5pDGijGYAggKmBGW0a9wY0gL75OSrzxrIsQzAP9ZGr_8B6fQ>
    <xme:I1NvZo6f9ITzbLXjfAsMd80RhI_law0vN6vtImT9RVu4kn1CVisapqDblxKLcKYl3
    ttmppt2K-GozFGzkFM>
X-ME-Received: <xmr:I1NvZqfbyZVVonFyoN5GBW7DLR6RzfKnm6iOU1TEypTmsrMj8MnHLqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefh
    ueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:I1NvZkL8Ibfrwi_Iu5t3kIzEY633FRf9b16DuNDhmWQN0oRjabUm1Q>
    <xmx:I1NvZnJ4N4fmiWG-XuFCnsuTZmdXV5HLOFirKvxCYufYuWH0U6hgIw>
    <xmx:I1NvZtxQ086UErCt6BJY7j4OxqM3hdX9FXUjsbqjR2lcOq7RM-7_7A>
    <xmx:I1NvZjKnDLDYIzELwZZU5BvrUeJXIykV1Eku1maJEmeKgahHJW1iAA>
    <xmx:JFNvZkALFai9jYlpaSBeHWF8AunfD985u8Pwf6NAy_b-GKxn1UGf2ngh>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 17:03:30 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 16 Jun 2024 22:03:05 +0100
Subject: [PATCH 01/10] MIPS: smp: Make IPI interrupts scalable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-b4-mips-ipi-improvements-v1-1-e332687f1692@flygoat.com>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
In-Reply-To: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=30059;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=KsQJA78l2EG1AePEtuNM5A5yp2HhCualT38E0jX+dDE=;
 b=kA0DAAoWQ3EMfdd3KcMByyZiAGZvUx+iS7cpjC/e075p72+UcOYUuQTF+i9UVCcma+OtXKTgc
 Yh1BAAWCgAdFiEEVBAijrCB0aDX4Gr8Q3EMfdd3KcMFAmZvUx8ACgkQQ3EMfdd3KcPvWgD/WaAe
 gVwWYm2U5WKlIHZlkVWVdWuyKWZo42hvYHxvcfoBAJADOnGLLqN7EWpUm5c31nJgEIuR3QhsFSD
 j3kESGa4H
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Define enum ipi_message_type as other architectures did to
allow easy extension to number of IPI interrupts, fiddle
around platform IPI code to adopt to the new infra, add
extensive BUILD_BUG_ON on IPI numbers to ensure future
extensions won't break existing platforms.

IPI related stuff are pulled to asm/ipi.h to avoid include
linux/interrupt.h in asm/smp.h.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/cavium-octeon/smp.c   | 109 ++++++++++++-----------------------
 arch/mips/include/asm/ipi.h     |  34 +++++++++++
 arch/mips/include/asm/smp-ops.h |   8 +--
 arch/mips/include/asm/smp.h     |  42 ++++++--------
 arch/mips/kernel/smp-bmips.c    |  43 +++++++-------
 arch/mips/kernel/smp-cps.c      |   1 +
 arch/mips/kernel/smp.c          | 124 ++++++++++++++++++++--------------------
 arch/mips/loongson64/smp.c      |  51 +++++++++--------
 arch/mips/mm/c-octeon.c         |   2 +-
 arch/mips/sgi-ip27/ip27-smp.c   |  15 +++--
 arch/mips/sgi-ip30/ip30-smp.c   |  15 +++--
 arch/mips/sibyte/bcm1480/smp.c  |  19 +++---
 arch/mips/sibyte/sb1250/smp.c   |  13 +++--
 13 files changed, 236 insertions(+), 240 deletions(-)

diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
index 08ea2cde1eb5..7cf8dd2eddce 100644
--- a/arch/mips/cavium-octeon/smp.c
+++ b/arch/mips/cavium-octeon/smp.c
@@ -17,6 +17,7 @@
 #include <linux/export.h>
 #include <linux/kexec.h>
 
+#include <asm/ipi.h>
 #include <asm/mmu_context.h>
 #include <asm/time.h>
 #include <asm/setup.h>
@@ -40,30 +41,19 @@ EXPORT_SYMBOL(octeon_bootloader_entry_addr);
 
 extern void kernel_entry(unsigned long arg1, ...);
 
-static void octeon_icache_flush(void)
+static irqreturn_t octeon_icache_flush(int irq, void *dev_id)
 {
 	asm volatile ("synci 0($0)\n");
+	return IRQ_HANDLED;
 }
 
-static void (*octeon_message_functions[8])(void) = {
-	scheduler_ipi,
-	generic_smp_call_function_interrupt,
-	octeon_icache_flush,
-};
-
 static irqreturn_t mailbox_interrupt(int irq, void *dev_id)
 {
 	u64 mbox_clrx = CVMX_CIU_MBOX_CLRX(cvmx_get_core_num());
-	u64 action;
-	int i;
+	unsigned long action;
+	int op;
 
-	/*
-	 * Make sure the function array initialization remains
-	 * correct.
-	 */
-	BUILD_BUG_ON(SMP_RESCHEDULE_YOURSELF != (1 << 0));
-	BUILD_BUG_ON(SMP_CALL_FUNCTION       != (1 << 1));
-	BUILD_BUG_ON(SMP_ICACHE_FLUSH        != (1 << 2));
+	BUILD_BUG_ON(IPI_MAX > 8);
 
 	/*
 	 * Load the mailbox register to figure out what we're supposed
@@ -79,16 +69,10 @@ static irqreturn_t mailbox_interrupt(int irq, void *dev_id)
 	/* Clear the mailbox to clear the interrupt */
 	cvmx_write_csr(mbox_clrx, action);
 
-	for (i = 0; i < ARRAY_SIZE(octeon_message_functions) && action;) {
-		if (action & 1) {
-			void (*fn)(void) = octeon_message_functions[i];
-
-			if (fn)
-				fn();
-		}
-		action >>= 1;
-		i++;
+	for_each_set_bit(op, &action, IPI_MAX) {
+		ipi_handlers[op](0, NULL);
 	}
+
 	return IRQ_HANDLED;
 }
 
@@ -97,23 +81,23 @@ static irqreturn_t mailbox_interrupt(int irq, void *dev_id)
  * cpu.	 When the function has finished, increment the finished field of
  * call_data.
  */
-void octeon_send_ipi_single(int cpu, unsigned int action)
+void octeon_send_ipi_single(int cpu, enum ipi_message_type op)
 {
 	int coreid = cpu_logical_map(cpu);
 	/*
 	pr_info("SMP: Mailbox send cpu=%d, coreid=%d, action=%u\n", cpu,
 	       coreid, action);
 	*/
-	cvmx_write_csr(CVMX_CIU_MBOX_SETX(coreid), action);
+	cvmx_write_csr(CVMX_CIU_MBOX_SETX(coreid), BIT(op));
 }
 
 static inline void octeon_send_ipi_mask(const struct cpumask *mask,
-					unsigned int action)
+					enum ipi_message_type op)
 {
 	unsigned int i;
 
 	for_each_cpu(i, mask)
-		octeon_send_ipi_single(i, action);
+		octeon_send_ipi_single(i, BIT(op));
 }
 
 /*
@@ -149,6 +133,9 @@ static void __init octeon_smp_setup(void)
 	unsigned int num_cores = cvmx_octeon_num_cores();
 #endif
 
+	ipi_handlers[IPI_ICACHE_FLUSH] = octeon_icache_flush;
+	ipi_names[IPI_ICACHE_FLUSH] = "Octeon ICache Flush";
+
 	/* The present CPUs are initially just the boot cpu (CPU 0). */
 	for (id = 0; id < NR_CPUS; id++) {
 		set_cpu_possible(id, id == 0);
@@ -427,67 +414,41 @@ static const struct plat_smp_ops octeon_smp_ops = {
 #endif
 };
 
-static irqreturn_t octeon_78xx_reched_interrupt(int irq, void *dev_id)
-{
-	scheduler_ipi();
-	return IRQ_HANDLED;
-}
-
-static irqreturn_t octeon_78xx_call_function_interrupt(int irq, void *dev_id)
-{
-	generic_smp_call_function_interrupt();
-	return IRQ_HANDLED;
-}
-
-static irqreturn_t octeon_78xx_icache_flush_interrupt(int irq, void *dev_id)
-{
-	octeon_icache_flush();
-	return IRQ_HANDLED;
-}
-
 /*
  * Callout to firmware before smp_init
  */
 static void octeon_78xx_prepare_cpus(unsigned int max_cpus)
 {
-	if (request_irq(OCTEON_IRQ_MBOX0 + 0,
-			octeon_78xx_reched_interrupt,
-			IRQF_PERCPU | IRQF_NO_THREAD, "Scheduler",
-			octeon_78xx_reched_interrupt)) {
-		panic("Cannot request_irq for SchedulerIPI");
-	}
-	if (request_irq(OCTEON_IRQ_MBOX0 + 1,
-			octeon_78xx_call_function_interrupt,
-			IRQF_PERCPU | IRQF_NO_THREAD, "SMP-Call",
-			octeon_78xx_call_function_interrupt)) {
-		panic("Cannot request_irq for SMP-Call");
-	}
-	if (request_irq(OCTEON_IRQ_MBOX0 + 2,
-			octeon_78xx_icache_flush_interrupt,
-			IRQF_PERCPU | IRQF_NO_THREAD, "ICache-Flush",
-			octeon_78xx_icache_flush_interrupt)) {
-		panic("Cannot request_irq for ICache-Flush");
+	int i;
+
+	/*
+	 * FIXME: Hardware have 10 MBOX but only 4 virqs are reserved
+	 * for CIU3 MBOX.
+	 */
+	BUILD_BUG_ON(IPI_MAX > 4);
+
+	for (i = 0; i < IPI_MAX; i++) {
+		if (request_irq(OCTEON_IRQ_MBOX0 + i,
+				ipi_handlers[i],
+				IRQF_PERCPU | IRQF_NO_THREAD, "IPI",
+				ipi_handlers[i])) {
+			panic("Cannot request_irq for %s", ipi_names[i]);
+		}
 	}
 }
 
-static void octeon_78xx_send_ipi_single(int cpu, unsigned int action)
+static void octeon_78xx_send_ipi_single(int cpu, enum ipi_message_type op)
 {
-	int i;
-
-	for (i = 0; i < 8; i++) {
-		if (action & 1)
-			octeon_ciu3_mbox_send(cpu, i);
-		action >>= 1;
-	}
+	octeon_ciu3_mbox_send(cpu, op);
 }
 
 static void octeon_78xx_send_ipi_mask(const struct cpumask *mask,
-				      unsigned int action)
+				      enum ipi_message_type op)
 {
 	unsigned int cpu;
 
 	for_each_cpu(cpu, mask)
-		octeon_78xx_send_ipi_single(cpu, action);
+		octeon_78xx_send_ipi_single(cpu, op);
 }
 
 static const struct plat_smp_ops octeon_78xx_smp_ops = {
diff --git a/arch/mips/include/asm/ipi.h b/arch/mips/include/asm/ipi.h
new file mode 100644
index 000000000000..df7a0ac4227a
--- /dev/null
+++ b/arch/mips/include/asm/ipi.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/cpumask.h>
+#include <linux/interrupt.h>
+
+#ifndef __ASM_IPI_H
+#define __ASM_IPI_H
+
+#ifdef CONFIG_SMP
+extern const char *ipi_names[];
+extern irq_handler_t ipi_handlers[];
+
+#ifdef CONFIG_GENERIC_IRQ_IPI
+extern void mips_smp_send_ipi_single(int cpu,
+				     enum ipi_message_type op);
+extern void mips_smp_send_ipi_mask(const struct cpumask *mask,
+				   enum ipi_message_type op);
+
+/*
+ * This function will set up the necessary IPIs for Linux to communicate
+ * with the CPUs in mask.
+ * Return 0 on success.
+ */
+int mips_smp_ipi_allocate(const struct cpumask *mask);
+
+/*
+ * This function will free up IPIs allocated with mips_smp_ipi_allocate to the
+ * CPUs in mask, which must be a subset of the IPIs that have been configured.
+ * Return 0 on success.
+ */
+int mips_smp_ipi_free(const struct cpumask *mask);
+#endif /* CONFIG_GENERIC_IRQ_IPI */
+#endif /* CONFIG_SMP */
+#endif
diff --git a/arch/mips/include/asm/smp-ops.h b/arch/mips/include/asm/smp-ops.h
index 1617b207723f..8cf4156cb301 100644
--- a/arch/mips/include/asm/smp-ops.h
+++ b/arch/mips/include/asm/smp-ops.h
@@ -20,8 +20,8 @@
 struct task_struct;
 
 struct plat_smp_ops {
-	void (*send_ipi_single)(int cpu, unsigned int action);
-	void (*send_ipi_mask)(const struct cpumask *mask, unsigned int action);
+	void (*send_ipi_single)(int cpu, enum ipi_message_type op);
+	void (*send_ipi_mask)(const struct cpumask *mask, enum ipi_message_type op);
 	void (*init_secondary)(void);
 	void (*smp_finish)(void);
 	int (*boot_secondary)(int cpu, struct task_struct *idle);
@@ -47,10 +47,6 @@ static inline void plat_smp_setup(void)
 	mp_ops->smp_setup();
 }
 
-extern void mips_smp_send_ipi_single(int cpu, unsigned int action);
-extern void mips_smp_send_ipi_mask(const struct cpumask *mask,
-				      unsigned int action);
-
 #else /* !CONFIG_SMP */
 
 struct plat_smp_ops;
diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
index bc2c240f414b..0c7467f15014 100644
--- a/arch/mips/include/asm/smp.h
+++ b/arch/mips/include/asm/smp.h
@@ -16,8 +16,6 @@
 #include <linux/threads.h>
 #include <linux/cpumask.h>
 
-#include <asm/smp-ops.h>
-
 extern int smp_num_siblings;
 extern cpumask_t cpu_sibling_map[];
 extern cpumask_t cpu_core_map[];
@@ -46,12 +44,6 @@ extern int __cpu_logical_map[NR_CPUS];
 
 #define NO_PROC_ID	(-1)
 
-#define SMP_RESCHEDULE_YOURSELF 0x1	/* XXX braindead */
-#define SMP_CALL_FUNCTION	0x2
-/* Octeon - Tell another core to flush its icache */
-#define SMP_ICACHE_FLUSH	0x4
-#define SMP_ASK_C0COUNT		0x8
-
 /* Mask of CPUs which are currently definitely operating coherently */
 extern cpumask_t cpu_coherent_mask;
 
@@ -63,6 +55,20 @@ extern void calculate_cpu_foreign_map(void);
 
 asmlinkage void start_secondary(void);
 
+enum ipi_message_type {
+	IPI_RESCHEDULE,
+	IPI_CALL_FUNC,
+#ifdef CONFIG_CAVIUM_OCTEON_SOC
+	IPI_ICACHE_FLUSH,
+#endif
+#ifdef CONFIG_MACH_LOONGSON64
+	IPI_ASK_C0COUNT,
+#endif
+	IPI_MAX
+};
+
+#include <asm/smp-ops.h>
+
 /*
  * this function sends a 'reschedule' IPI to another CPU.
  * it goes straight through and wastes no time serializing
@@ -72,7 +78,7 @@ static inline void arch_smp_send_reschedule(int cpu)
 {
 	extern const struct plat_smp_ops *mp_ops;	/* private */
 
-	mp_ops->send_ipi_single(cpu, SMP_RESCHEDULE_YOURSELF);
+	mp_ops->send_ipi_single(cpu, IPI_RESCHEDULE);
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
@@ -109,32 +115,18 @@ static inline void *kexec_nonboot_cpu_func(void)
 }
 #endif
 
-/*
- * This function will set up the necessary IPIs for Linux to communicate
- * with the CPUs in mask.
- * Return 0 on success.
- */
-int mips_smp_ipi_allocate(const struct cpumask *mask);
-
-/*
- * This function will free up IPIs allocated with mips_smp_ipi_allocate to the
- * CPUs in mask, which must be a subset of the IPIs that have been configured.
- * Return 0 on success.
- */
-int mips_smp_ipi_free(const struct cpumask *mask);
-
 static inline void arch_send_call_function_single_ipi(int cpu)
 {
 	extern const struct plat_smp_ops *mp_ops;	/* private */
 
-	mp_ops->send_ipi_single(cpu, SMP_CALL_FUNCTION);
+	mp_ops->send_ipi_single(cpu, IPI_CALL_FUNC);
 }
 
 static inline void arch_send_call_function_ipi_mask(const struct cpumask *mask)
 {
 	extern const struct plat_smp_ops *mp_ops;	/* private */
 
-	mp_ops->send_ipi_mask(mask, SMP_CALL_FUNCTION);
+	mp_ops->send_ipi_mask(mask, IPI_CALL_FUNC);
 }
 
 #endif /* __ASM_SMP_H */
diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index b3dbf9ecb0d6..428b39aee344 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -32,6 +32,7 @@
 #include <asm/processor.h>
 #include <asm/bootinfo.h>
 #include <asm/cacheflush.h>
+#include <asm/ipi.h>
 #include <asm/tlbflush.h>
 #include <asm/mipsregs.h>
 #include <asm/bmips.h>
@@ -282,36 +283,31 @@ static void bmips_smp_finish(void)
  * BMIPS5000 raceless IPIs
  *
  * Each CPU has two inbound SW IRQs which are independent of all other CPUs.
- * IPI0 is used for SMP_RESCHEDULE_YOURSELF
- * IPI1 is used for SMP_CALL_FUNCTION
  */
 
-static void bmips5000_send_ipi_single(int cpu, unsigned int action)
+static void bmips5000_send_ipi_single(int cpu, enum ipi_message_type op)
 {
-	write_c0_brcm_action(ACTION_SET_IPI(cpu, action == SMP_CALL_FUNCTION));
+	write_c0_brcm_action(ACTION_SET_IPI(cpu, op));
 }
 
 static irqreturn_t bmips5000_ipi_interrupt(int irq, void *dev_id)
 {
 	int action = irq - IPI0_IRQ;
 
-	write_c0_brcm_action(ACTION_CLR_IPI(smp_processor_id(), action));
+	BUILD_BUG_ON(IPI_MAX > 2);
 
-	if (action == 0)
-		scheduler_ipi();
-	else
-		generic_smp_call_function_interrupt();
+	write_c0_brcm_action(ACTION_CLR_IPI(smp_processor_id(), action));
 
-	return IRQ_HANDLED;
+	return ipi_handlers[action](0, NULL);
 }
 
 static void bmips5000_send_ipi_mask(const struct cpumask *mask,
-	unsigned int action)
+	enum ipi_message_type op)
 {
 	unsigned int i;
 
 	for_each_cpu(i, mask)
-		bmips5000_send_ipi_single(i, action);
+		bmips5000_send_ipi_single(i, op);
 }
 
 /*
@@ -325,23 +321,26 @@ static void bmips5000_send_ipi_mask(const struct cpumask *mask,
  */
 
 static DEFINE_SPINLOCK(ipi_lock);
-static DEFINE_PER_CPU(int, ipi_action_mask);
+static DEFINE_PER_CPU(unsigned long, ipi_action_mask);
 
-static void bmips43xx_send_ipi_single(int cpu, unsigned int action)
+static void bmips43xx_send_ipi_single(int cpu, enum ipi_message_type op)
 {
 	unsigned long flags;
 
 	spin_lock_irqsave(&ipi_lock, flags);
 	set_c0_cause(cpu ? C_SW1 : C_SW0);
-	per_cpu(ipi_action_mask, cpu) |= action;
+	per_cpu(ipi_action_mask, cpu) |= BIT(op);
 	irq_enable_hazard();
 	spin_unlock_irqrestore(&ipi_lock, flags);
 }
 
 static irqreturn_t bmips43xx_ipi_interrupt(int irq, void *dev_id)
 {
-	unsigned long flags;
-	int action, cpu = irq - IPI0_IRQ;
+	unsigned long flags, action;
+	int cpu = irq - IPI0_IRQ;
+	int op;
+
+	BUILD_BUG_ON(IPI_MAX > BITS_PER_LONG);
 
 	spin_lock_irqsave(&ipi_lock, flags);
 	action = __this_cpu_read(ipi_action_mask);
@@ -349,21 +348,19 @@ static irqreturn_t bmips43xx_ipi_interrupt(int irq, void *dev_id)
 	clear_c0_cause(cpu ? C_SW1 : C_SW0);
 	spin_unlock_irqrestore(&ipi_lock, flags);
 
-	if (action & SMP_RESCHEDULE_YOURSELF)
-		scheduler_ipi();
-	if (action & SMP_CALL_FUNCTION)
-		generic_smp_call_function_interrupt();
+	for_each_set_bit(op, &action, IPI_MAX)
+		ipi_handlers[op](0, NULL);
 
 	return IRQ_HANDLED;
 }
 
 static void bmips43xx_send_ipi_mask(const struct cpumask *mask,
-	unsigned int action)
+	enum ipi_message_type op)
 {
 	unsigned int i;
 
 	for_each_cpu(i, mask)
-		bmips43xx_send_ipi_single(i, action);
+		bmips43xx_send_ipi_single(i, op);
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 9cc087dd1c19..8c322f441164 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -16,6 +16,7 @@
 #include <linux/irq.h>
 
 #include <asm/bcache.h>
+#include <asm/ipi.h>
 #include <asm/mips-cps.h>
 #include <asm/mips_mt.h>
 #include <asm/mipsregs.h>
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 0b53d35a116e..a6cf6444533e 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -31,6 +31,7 @@
 #include <asm/ginvt.h>
 #include <asm/processor.h>
 #include <asm/idle.h>
+#include <asm/ipi.h>
 #include <asm/r4k-timer.h>
 #include <asm/mips-cps.h>
 #include <asm/mmu_context.h>
@@ -92,11 +93,6 @@ static int __init early_smt(char *s)
 }
 early_param("smt", early_smt);
 
-#ifdef CONFIG_GENERIC_IRQ_IPI
-static struct irq_desc *call_desc;
-static struct irq_desc *sched_desc;
-#endif
-
 static inline void set_cpu_sibling_map(int cpu)
 {
 	int i;
@@ -164,13 +160,42 @@ void register_smp_ops(const struct plat_smp_ops *ops)
 	mp_ops = ops;
 }
 
+static irqreturn_t ipi_resched_interrupt(int irq, void *dev_id)
+{
+	scheduler_ipi();
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t ipi_call_interrupt(int irq, void *dev_id)
+{
+	generic_smp_call_function_interrupt();
+
+	return IRQ_HANDLED;
+}
+
+
+const char *ipi_names[IPI_MAX] __read_mostly = {
+	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
+	[IPI_CALL_FUNC]		= "Function call interrupts",
+};
+
+irq_handler_t ipi_handlers[IPI_MAX] __read_mostly = {
+	[IPI_RESCHEDULE]	= ipi_resched_interrupt,
+	[IPI_CALL_FUNC]		= ipi_call_interrupt,
+};
+
 #ifdef CONFIG_GENERIC_IRQ_IPI
-void mips_smp_send_ipi_single(int cpu, unsigned int action)
+static int ipi_virqs[IPI_MAX] __ro_after_init;
+static struct irq_desc *ipi_desc[IPI_MAX] __read_mostly;
+
+void mips_smp_send_ipi_single(int cpu, enum ipi_message_type op)
 {
-	mips_smp_send_ipi_mask(cpumask_of(cpu), action);
+	mips_smp_send_ipi_mask(cpumask_of(cpu), op);
 }
 
-void mips_smp_send_ipi_mask(const struct cpumask *mask, unsigned int action)
+void mips_smp_send_ipi_mask(const struct cpumask *mask,
+			    enum ipi_message_type op)
 {
 	unsigned long flags;
 	unsigned int core;
@@ -178,18 +203,7 @@ void mips_smp_send_ipi_mask(const struct cpumask *mask, unsigned int action)
 
 	local_irq_save(flags);
 
-	switch (action) {
-	case SMP_CALL_FUNCTION:
-		__ipi_send_mask(call_desc, mask);
-		break;
-
-	case SMP_RESCHEDULE_YOURSELF:
-		__ipi_send_mask(sched_desc, mask);
-		break;
-
-	default:
-		BUG();
-	}
+	__ipi_send_mask(ipi_desc[op], mask);
 
 	if (mips_cpc_present()) {
 		for_each_cpu(cpu, mask) {
@@ -211,21 +225,6 @@ void mips_smp_send_ipi_mask(const struct cpumask *mask, unsigned int action)
 	local_irq_restore(flags);
 }
 
-
-static irqreturn_t ipi_resched_interrupt(int irq, void *dev_id)
-{
-	scheduler_ipi();
-
-	return IRQ_HANDLED;
-}
-
-static irqreturn_t ipi_call_interrupt(int irq, void *dev_id)
-{
-	generic_smp_call_function_interrupt();
-
-	return IRQ_HANDLED;
-}
-
 static void smp_ipi_init_one(unsigned int virq, const char *name,
 			     irq_handler_t handler)
 {
@@ -236,11 +235,9 @@ static void smp_ipi_init_one(unsigned int virq, const char *name,
 	BUG_ON(ret);
 }
 
-static unsigned int call_virq, sched_virq;
-
 int mips_smp_ipi_allocate(const struct cpumask *mask)
 {
-	int virq;
+	int virq, i;
 	struct irq_domain *ipidomain;
 	struct device_node *node;
 
@@ -267,33 +264,30 @@ int mips_smp_ipi_allocate(const struct cpumask *mask)
 	 * setup, if we're running with only a single CPU.
 	 */
 	if (!ipidomain) {
-		BUG_ON(num_present_cpus() > 1);
+		WARN_ON(num_present_cpus() > 1);
 		return 0;
 	}
 
-	virq = irq_reserve_ipi(ipidomain, mask);
-	BUG_ON(!virq);
-	if (!call_virq)
-		call_virq = virq;
-
-	virq = irq_reserve_ipi(ipidomain, mask);
-	BUG_ON(!virq);
-	if (!sched_virq)
-		sched_virq = virq;
+	for (i = 0; i < IPI_MAX; i++) {
+		virq = irq_reserve_ipi(ipidomain, mask);
+		WARN_ON(!virq);
+		ipi_virqs[i] = virq;
+	}
 
 	if (irq_domain_is_ipi_per_cpu(ipidomain)) {
 		int cpu;
 
 		for_each_cpu(cpu, mask) {
-			smp_ipi_init_one(call_virq + cpu, "IPI call",
-					 ipi_call_interrupt);
-			smp_ipi_init_one(sched_virq + cpu, "IPI resched",
-					 ipi_resched_interrupt);
+			for (i = 0; i < IPI_MAX; i++) {
+				smp_ipi_init_one(ipi_virqs[i] + cpu, ipi_names[i],
+						 ipi_handlers[i]);
+			}
 		}
 	} else {
-		smp_ipi_init_one(call_virq, "IPI call", ipi_call_interrupt);
-		smp_ipi_init_one(sched_virq, "IPI resched",
-				 ipi_resched_interrupt);
+		for (i = 0; i < IPI_MAX; i++) {
+			smp_ipi_init_one(ipi_virqs[i], ipi_names[i],
+					 ipi_handlers[i]);
+		}
 	}
 
 	return 0;
@@ -301,6 +295,7 @@ int mips_smp_ipi_allocate(const struct cpumask *mask)
 
 int mips_smp_ipi_free(const struct cpumask *mask)
 {
+	int i;
 	struct irq_domain *ipidomain;
 	struct device_node *node;
 
@@ -321,25 +316,32 @@ int mips_smp_ipi_free(const struct cpumask *mask)
 		int cpu;
 
 		for_each_cpu(cpu, mask) {
-			free_irq(call_virq + cpu, NULL);
-			free_irq(sched_virq + cpu, NULL);
+			for (i = 0; i < IPI_MAX; i++)
+				free_irq(ipi_virqs[i] + cpu, NULL);
 		}
 	}
-	irq_destroy_ipi(call_virq, mask);
-	irq_destroy_ipi(sched_virq, mask);
+
+	for (i = 0; i < IPI_MAX; i++)
+		irq_destroy_ipi(ipi_virqs[i], mask);
+
 	return 0;
 }
 
 
 static int __init mips_smp_ipi_init(void)
 {
+	int i;
+
 	if (num_possible_cpus() == 1)
 		return 0;
 
 	mips_smp_ipi_allocate(cpu_possible_mask);
 
-	call_desc = irq_to_desc(call_virq);
-	sched_desc = irq_to_desc(sched_virq);
+	for (i = 0; i < IPI_MAX; i++) {
+		ipi_desc[i] = irq_to_desc(ipi_virqs[i]);
+		if (!ipi_desc[i])
+			return -ENODEV;
+	}
 
 	return 0;
 }
diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index 5a990cdef91a..3c64d7cd835b 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -13,8 +13,8 @@
 #include <linux/smp.h>
 #include <linux/cpufreq.h>
 #include <linux/kexec.h>
+#include <asm/ipi.h>
 #include <asm/processor.h>
-#include <asm/smp.h>
 #include <asm/time.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
@@ -368,44 +368,44 @@ static void ipi_mailbox_buf_init(void)
 /*
  * Simple enough, just poke the appropriate ipi register
  */
-static void loongson3_send_ipi_single(int cpu, unsigned int action)
+static void loongson3_send_ipi_single(int cpu, enum ipi_message_type op)
 {
-	ipi_write_action(cpu_logical_map(cpu), (u32)action);
+	ipi_write_action(cpu_logical_map(cpu), BIT(op));
 }
 
 static void
-loongson3_send_ipi_mask(const struct cpumask *mask, unsigned int action)
+loongson3_send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op)
 {
 	unsigned int i;
 
 	for_each_cpu(i, mask)
-		ipi_write_action(cpu_logical_map(i), (u32)action);
+		ipi_write_action(cpu_logical_map(i), BIT(op));
 }
 
-
-static irqreturn_t loongson3_ipi_interrupt(int irq, void *dev_id)
+static irqreturn_t loongson3_ask_c0count(int irq, void *dev_id)
 {
 	int i, cpu = smp_processor_id();
-	unsigned int action, c0count;
+	unsigned long c0count;
 
-	action = ipi_read_clear(cpu);
+	BUG_ON(cpu != 0);
+	c0count = read_c0_count();
+	c0count = c0count ? c0count : 1;
+	for (i = 1; i < nr_cpu_ids; i++)
+		core0_c0count[i] = c0count;
+	nudge_writes(); /* Let others see the result ASAP */
 
-	if (action & SMP_RESCHEDULE_YOURSELF)
-		scheduler_ipi();
+	return IRQ_HANDLED;
+}
 
-	if (action & SMP_CALL_FUNCTION) {
-		irq_enter();
-		generic_smp_call_function_interrupt();
-		irq_exit();
-	}
+static irqreturn_t loongson3_ipi_interrupt(int irq, void *dev_id)
+{
+	int op, cpu = smp_processor_id();
+	unsigned long action;
 
-	if (action & SMP_ASK_C0COUNT) {
-		BUG_ON(cpu != 0);
-		c0count = read_c0_count();
-		c0count = c0count ? c0count : 1;
-		for (i = 1; i < nr_cpu_ids; i++)
-			core0_c0count[i] = c0count;
-		nudge_writes(); /* Let others see the result ASAP */
+	action = ipi_read_clear(cpu);
+
+	for_each_set_bit(op, &action, IPI_MAX) {
+		ipi_handlers[op](0, NULL);
 	}
 
 	return IRQ_HANDLED;
@@ -435,7 +435,7 @@ static void loongson3_init_secondary(void)
 
 	i = 0;
 	core0_c0count[cpu] = 0;
-	loongson3_send_ipi_single(0, SMP_ASK_C0COUNT);
+	loongson3_send_ipi_single(0, IPI_ASK_C0COUNT);
 	while (!core0_c0count[cpu]) {
 		i++;
 		cpu_relax();
@@ -493,6 +493,9 @@ static void __init loongson3_smp_setup(void)
 		num++;
 	}
 
+	ipi_handlers[IPI_ASK_C0COUNT] = loongson3_ask_c0count;
+	ipi_names[IPI_ASK_C0COUNT] = "Loongson Ask C0 Count";
+
 	csr_ipi_probe();
 	ipi_set0_regs_init();
 	ipi_clear0_regs_init();
diff --git a/arch/mips/mm/c-octeon.c b/arch/mips/mm/c-octeon.c
index b7393b61cfa7..10b201a09859 100644
--- a/arch/mips/mm/c-octeon.c
+++ b/arch/mips/mm/c-octeon.c
@@ -85,7 +85,7 @@ static void octeon_flush_icache_all_cores(struct vm_area_struct *vma)
 	cpumask_clear_cpu(cpu, &mask);
 #ifdef CONFIG_CAVIUM_OCTEON_SOC
 	for_each_cpu(cpu, &mask)
-		octeon_send_ipi_single(cpu, SMP_ICACHE_FLUSH);
+		octeon_send_ipi_single(cpu, IPI_ICACHE_FLUSH);
 #else
 	smp_call_function_many(&mask, (smp_call_func_t)octeon_local_flush_icache,
 			       NULL, 1);
diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index 5d2652a1d35a..87da545d0c3f 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -94,15 +94,17 @@ static __init void intr_clear_all(nasid_t nasid)
 		REMOTE_HUB_CLR_INTR(nasid, i);
 }
 
-static void ip27_send_ipi_single(int destid, unsigned int action)
+static void ip27_send_ipi_single(int destid, enum ipi_message_type op)
 {
 	int irq;
 
-	switch (action) {
-	case SMP_RESCHEDULE_YOURSELF:
+	BUILD_BUG_ON(IPI_MAX > 2);
+
+	switch (op) {
+	case IPI_RESCHEDULE:
 		irq = CPU_RESCHED_A_IRQ;
 		break;
-	case SMP_CALL_FUNCTION:
+	case IPI_CALL_FUNC:
 		irq = CPU_CALL_A_IRQ;
 		break;
 	default:
@@ -118,12 +120,13 @@ static void ip27_send_ipi_single(int destid, unsigned int action)
 	REMOTE_HUB_SEND_INTR(cpu_to_node(destid), irq);
 }
 
-static void ip27_send_ipi_mask(const struct cpumask *mask, unsigned int action)
+static void ip27_send_ipi_mask(const struct cpumask *mask,
+			       enum ipi_message_type op)
 {
 	unsigned int i;
 
 	for_each_cpu(i, mask)
-		ip27_send_ipi_single(i, action);
+		ip27_send_ipi_single(i, op);
 }
 
 static void ip27_init_cpu(void)
diff --git a/arch/mips/sgi-ip30/ip30-smp.c b/arch/mips/sgi-ip30/ip30-smp.c
index 4bfe654602b1..1c674c0cf419 100644
--- a/arch/mips/sgi-ip30/ip30-smp.c
+++ b/arch/mips/sgi-ip30/ip30-smp.c
@@ -43,15 +43,17 @@ struct mpconf {
 	u32 idleflag;
 };
 
-static void ip30_smp_send_ipi_single(int cpu, u32 action)
+static void ip30_smp_send_ipi_single(int cpu, enum ipi_message_type op)
 {
 	int irq;
 
-	switch (action) {
-	case SMP_RESCHEDULE_YOURSELF:
+	BUILD_BUG_ON(IPI_MAX > 2);
+
+	switch (op) {
+	case IPI_RESCHEDULE:
 		irq = HEART_L2_INT_RESCHED_CPU_0;
 		break;
-	case SMP_CALL_FUNCTION:
+	case IPI_CALL_FUNC:
 		irq = HEART_L2_INT_CALL_CPU_0;
 		break;
 	default:
@@ -64,12 +66,13 @@ static void ip30_smp_send_ipi_single(int cpu, u32 action)
 	heart_write(BIT_ULL(irq), &heart_regs->set_isr);
 }
 
-static void ip30_smp_send_ipi_mask(const struct cpumask *mask, u32 action)
+static void ip30_smp_send_ipi_mask(const struct cpumask *mask,
+				   enum ipi_message_type op)
 {
 	u32 i;
 
 	for_each_cpu(i, mask)
-		ip30_smp_send_ipi_single(i, action);
+		ip30_smp_send_ipi_single(i, op);
 }
 
 static void __init ip30_smp_setup(void)
diff --git a/arch/mips/sibyte/bcm1480/smp.c b/arch/mips/sibyte/bcm1480/smp.c
index 5861e50255bf..040230e3f4a0 100644
--- a/arch/mips/sibyte/bcm1480/smp.c
+++ b/arch/mips/sibyte/bcm1480/smp.c
@@ -12,6 +12,7 @@
 
 #include <asm/mmu_context.h>
 #include <asm/io.h>
+#include <asm/ipi.h>
 #include <asm/fw/cfe/cfe_api.h>
 #include <asm/sibyte/sb1250.h>
 #include <asm/sibyte/bcm1480_regs.h>
@@ -64,18 +65,18 @@ void bcm1480_smp_init(void)
  * Simple enough; everything is set up, so just poke the appropriate mailbox
  * register, and we should be set
  */
-static void bcm1480_send_ipi_single(int cpu, unsigned int action)
+static void bcm1480_send_ipi_single(int cpu, enum ipi_message_type op)
 {
-	__raw_writeq((((u64)action)<< 48), mailbox_0_set_regs[cpu]);
+	__raw_writeq((((u64)BIT_ULL(op)) << 48), mailbox_0_set_regs[cpu]);
 }
 
 static void bcm1480_send_ipi_mask(const struct cpumask *mask,
-				  unsigned int action)
+				  enum ipi_message_type op)
 {
 	unsigned int i;
 
 	for_each_cpu(i, mask)
-		bcm1480_send_ipi_single(i, action);
+		bcm1480_send_ipi_single(i, op);
 }
 
 /*
@@ -159,19 +160,21 @@ void bcm1480_mailbox_interrupt(void)
 {
 	int cpu = smp_processor_id();
 	int irq = K_BCM1480_INT_MBOX_0_0;
-	unsigned int action;
+	u64 action;
+
+	BUILD_BUG_ON(IPI_MAX > 2);
 
 	kstat_incr_irq_this_cpu(irq);
 	/* Load the mailbox register to figure out what we're supposed to do */
 	action = (__raw_readq(mailbox_0_regs[cpu]) >> 48) & 0xffff;
 
 	/* Clear the mailbox to clear the interrupt */
-	__raw_writeq(((u64)action)<<48, mailbox_0_clear_regs[cpu]);
+	__raw_writeq(((u64)action) << 48, mailbox_0_clear_regs[cpu]);
 
-	if (action & SMP_RESCHEDULE_YOURSELF)
+	if (action & BIT_ULL(IPI_RESCHEDULE))
 		scheduler_ipi();
 
-	if (action & SMP_CALL_FUNCTION) {
+	if (action & BIT_ULL(IPI_CALL_FUNC)) {
 		irq_enter();
 		generic_smp_call_function_interrupt();
 		irq_exit();
diff --git a/arch/mips/sibyte/sb1250/smp.c b/arch/mips/sibyte/sb1250/smp.c
index 7a794234e3d7..dc2c889fa0b6 100644
--- a/arch/mips/sibyte/sb1250/smp.c
+++ b/arch/mips/sibyte/sb1250/smp.c
@@ -12,6 +12,7 @@
 
 #include <asm/mmu_context.h>
 #include <asm/io.h>
+#include <asm/ipi.h>
 #include <asm/fw/cfe/cfe_api.h>
 #include <asm/sibyte/sb1250.h>
 #include <asm/sibyte/sb1250_regs.h>
@@ -53,18 +54,18 @@ void sb1250_smp_init(void)
  * Simple enough; everything is set up, so just poke the appropriate mailbox
  * register, and we should be set
  */
-static void sb1250_send_ipi_single(int cpu, unsigned int action)
+static void sb1250_send_ipi_single(int cpu, enum ipi_message_type op)
 {
-	__raw_writeq((((u64)action) << 48), mailbox_set_regs[cpu]);
+	__raw_writeq((((u64)BIT_ULL(op)) << 48), mailbox_set_regs[cpu]);
 }
 
 static inline void sb1250_send_ipi_mask(const struct cpumask *mask,
-					unsigned int action)
+					enum ipi_message_type op)
 {
 	unsigned int i;
 
 	for_each_cpu(i, mask)
-		sb1250_send_ipi_single(i, action);
+		sb1250_send_ipi_single(i, op);
 }
 
 /*
@@ -157,10 +158,10 @@ void sb1250_mailbox_interrupt(void)
 	/* Clear the mailbox to clear the interrupt */
 	____raw_writeq(((u64)action) << 48, mailbox_clear_regs[cpu]);
 
-	if (action & SMP_RESCHEDULE_YOURSELF)
+	if (action & BIT(IPI_RESCHEDULE))
 		scheduler_ipi();
 
-	if (action & SMP_CALL_FUNCTION) {
+	if (action & BIT(IPI_CALL_FUNC)) {
 		irq_enter();
 		generic_smp_call_function_interrupt();
 		irq_exit();

-- 
2.43.0


