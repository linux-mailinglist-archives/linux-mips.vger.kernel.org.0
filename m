Return-Path: <linux-mips+bounces-4839-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A5194DCD4
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 14:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D5281C20EAE
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 12:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED8B1586CF;
	Sat, 10 Aug 2024 12:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="FNn7NxOe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C6I3hXeS"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EBA1E86E;
	Sat, 10 Aug 2024 12:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723293558; cv=none; b=g7IZQf3sYQUqROLJJqNfU2or0ooKFscOGC3iKttONhiFe9Hq1T5vbMYcB2cSCQOrVHkEXfxu8qDsBw2ikoXNmhGepwyI5dT0D0zEUNX5m/F1tM1cf5MDD+X5Y/57jMDYs0fwpn/hwDbtewVmdZF/lu+Ab4AAf+u8WrLo8VnKTd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723293558; c=relaxed/simple;
	bh=5s0h4ltAcE89p/zvUtASu3Xd2xwz+t07XtSjNshoY3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FyIER2UYWJAj+B+mA4NIkA1eXKKKzli9SpOt54QTRowzlPkaCnUNtWJp9zjGKjF36ta+LHcDrNDj1PdywhxkPmFhMzB5WX2T0cqTvXmgJ5snizw6bAn6uQ7+YumOUZV5CgbfktyLpBvLvEuo42AEfeYmhAhPlr56Gmz6T5ZJXLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=FNn7NxOe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C6I3hXeS; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 170A811520B8;
	Sat, 10 Aug 2024 08:39:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sat, 10 Aug 2024 08:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1723293555;
	 x=1723379955; bh=iizr2apqmb8sIr9RYIGCXOfidXaPrevsrVBYN6WI6kk=; b=
	FNn7NxOe3Q+E4fYPSXAa0JMpXsh4UtqzXOkxFQJA/ipBCnq4UH4krf+OR/kgRBFi
	0Zsl6WYNl6toJVzgPePARKl+UQZdxMiUikz9dIbb7117DwcRbVpTtlczf4K1L3r9
	uG0FX1X9qwpg0mlP9N9QaWqxlLLyWlSDl8ya7wbkq3vGQ8+2++H2fQ+BTWyq2GGw
	kr1diyBftKAL8+H5OKtC9+c829GR0H7Mlf1Nd7Dw+cube5AAWUmAOH6D7mwMtPt5
	UeD0nOXzHqeWywW2yUUh6car0STWSs/VK21hptwbGoL5VMx6iA6PdrQ+aCxQwSIU
	rewJ8fx+OQz6o1MfT/2zSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723293555; x=
	1723379955; bh=iizr2apqmb8sIr9RYIGCXOfidXaPrevsrVBYN6WI6kk=; b=C
	6I3hXeShFJ3QDiMwluiMju2TJWNIHfXAmit/IPtLK8K+iVp81c8KXQAcnBSHybtc
	IzQ5grtmlf1QK5thq09qu0u6JVvDIRjwmiv3qognTiQjAcBt2lKJvxqzMZ5Mp1dk
	pt0QrvPzRVcwPt45ty25XQywzIusYPTaSPUazRsh4Kb4YMoetuNcBWlD3CRmP0/D
	Yp+36hL4w7yXCf/s8P0oJAFRKabLxns/O1XvaOQLrFVu9RrdjAHI9FrpvlNNuJO/
	y1nYlJCecL8lKh1kZgtFhYAXYSnXNaI/4tbYnBJrv5BsR+TpUfO7ZeUKcZDQFE9a
	dSfO1jvunTYRPlS1vqkjg==
X-ME-Sender: <xms:cl-3ZtAttdjvpwZZg8Nyn8-1EZuGpLrSEIaLmz_qvV43X1FiCQBvjg>
    <xme:cl-3Zrh9A_A9s_5bxAGaxZOoA3mFTCVpdRtT5Aa02lfgEBaDicaFN3QCHxvWrMTRa
    92X9_UAEVSdZfC_BQA>
X-ME-Received: <xmr:cl-3ZokvcMHSQtDj0oUw3FIIMOLMHnqJ5EVg3a23UOcdkBUuPW1pT8VlMqfu9glO3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrleeigdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeen
    ucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhmqeenucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeeg
    udeghfdtuddugefhueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgt
    ohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopegstghmqdhk
    vghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrdgtohhmpdhrtg
    hpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphht
    thhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtohepthhg
    lhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrih
    hnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehprghulhgsuhhrthho
    nheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:cl-3Zny_qAxqCRnDA5RgsBoUarHNOaHqd_oNw3QrF6rSe3iBkEQS0g>
    <xmx:c1-3ZiS0dkr2ilfSg_93BKw7JnpZ3a-glv5Qfhcmz_dt17TWdEsCXQ>
    <xmx:c1-3ZqaneSRsgHf4Sm3s7DGlhrYuVrrCP-tQGKVqksHdfmTrKWhqUw>
    <xmx:c1-3ZjQXEcio9HYQh5toTov1pEAVdpUnY347wlWoo4IDl1aCEQ-18A>
    <xmx:c1-3ZnKXQobVdXKLvtaS_3ZMhDWiAlTYFMeVwvqijLtRhrMxc-Y25Igu>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Aug 2024 08:39:13 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 10 Aug 2024 13:39:06 +0100
Subject: [PATCH v3 01/10] MIPS: smp: Make IPI interrupts scalable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240810-b4-mips-ipi-improvements-v3-1-1224fd7c4096@flygoat.com>
References: <20240810-b4-mips-ipi-improvements-v3-0-1224fd7c4096@flygoat.com>
In-Reply-To: <20240810-b4-mips-ipi-improvements-v3-0-1224fd7c4096@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=30134;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=5s0h4ltAcE89p/zvUtASu3Xd2xwz+t07XtSjNshoY3U=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTt8fnX7jGIWH2Zk5qV/bJuToif2eST/o1rlZlXTbVI4
 jn+MTito5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACbiGcHI0Dzj9uS3DIddBFRW
 rlIPS5kcYFAp2aW6vaeaZdvKc2eDTzMyTC5omMuf/a49z9Pg8brL/4p2LkjI3f0s9ZKCU+XBXU1
 NbAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Define enum ipi_message_type as other architectures did to
allow easy extension to number of IPI interrupts, fiddle
around platform IPI code to adopt to the new infra, add
extensive BUILD_BUG_ON on IPI numbers to ensure future
extensions won't break existing platforms.

IPI related stuff are pulled to asm/ipi.h to avoid include
linux/interrupt.h in asm/smp.h.

Tested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/cavium-octeon/smp.c         | 111 ++++++++++--------------------
 arch/mips/fw/arc/init.c               |   1 -
 arch/mips/include/asm/ipi.h           |  34 ++++++++++
 arch/mips/include/asm/octeon/octeon.h |   2 +
 arch/mips/include/asm/smp-ops.h       |   8 +--
 arch/mips/include/asm/smp.h           |  41 +++++------
 arch/mips/kernel/smp-bmips.c          |  43 ++++++------
 arch/mips/kernel/smp-cps.c            |   1 +
 arch/mips/kernel/smp.c                | 124 +++++++++++++++++-----------------
 arch/mips/loongson64/smp.c            |  24 +++----
 arch/mips/mm/c-octeon.c               |   3 +-
 arch/mips/sgi-ip27/ip27-smp.c         |  15 ++--
 arch/mips/sgi-ip30/ip30-smp.c         |  15 ++--
 arch/mips/sibyte/bcm1480/smp.c        |  19 +++---
 arch/mips/sibyte/sb1250/smp.c         |  13 ++--
 15 files changed, 221 insertions(+), 233 deletions(-)

diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
index 08ea2cde1eb5..229bb8f1f791 100644
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
+	cvmx_write_csr(CVMX_CIU_MBOX_SETX(coreid), op);
 }
 
-static inline void octeon_send_ipi_mask(const struct cpumask *mask,
-					unsigned int action)
+static void octeon_send_ipi_mask(const struct cpumask *mask,
+				 enum ipi_message_type op)
 {
 	unsigned int i;
 
 	for_each_cpu(i, mask)
-		octeon_send_ipi_single(i, action);
+		octeon_send_ipi_single(i, op);
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
diff --git a/arch/mips/fw/arc/init.c b/arch/mips/fw/arc/init.c
index f9d1dea9b2ca..3d69d2f851bc 100644
--- a/arch/mips/fw/arc/init.c
+++ b/arch/mips/fw/arc/init.c
@@ -12,7 +12,6 @@
 
 #include <asm/bootinfo.h>
 #include <asm/sgialib.h>
-#include <asm/smp-ops.h>
 
 #undef DEBUG_PROM_INIT
 
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
diff --git a/arch/mips/include/asm/octeon/octeon.h b/arch/mips/include/asm/octeon/octeon.h
index 5c1d726c702f..534155e88107 100644
--- a/arch/mips/include/asm/octeon/octeon.h
+++ b/arch/mips/include/asm/octeon/octeon.h
@@ -49,6 +49,8 @@ extern void octeon_init_cvmcount(void);
 extern void octeon_setup_delays(void);
 extern void octeon_io_clk_delay(unsigned long);
 
+extern void octeon_send_ipi_single(int cpu, enum ipi_message_type op);
+
 #define OCTEON_ARGV_MAX_ARGS	64
 #define OCTEON_SERIAL_LEN	20
 
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
index 2427d76f953f..0c7467f15014 100644
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
@@ -46,11 +44,6 @@ extern int __cpu_logical_map[NR_CPUS];
 
 #define NO_PROC_ID	(-1)
 
-#define SMP_RESCHEDULE_YOURSELF 0x1	/* XXX braindead */
-#define SMP_CALL_FUNCTION	0x2
-/* Octeon - Tell another core to flush its icache */
-#define SMP_ICACHE_FLUSH	0x4
-
 /* Mask of CPUs which are currently definitely operating coherently */
 extern cpumask_t cpu_coherent_mask;
 
@@ -62,6 +55,20 @@ extern void calculate_cpu_foreign_map(void);
 
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
@@ -71,7 +78,7 @@ static inline void arch_smp_send_reschedule(int cpu)
 {
 	extern const struct plat_smp_ops *mp_ops;	/* private */
 
-	mp_ops->send_ipi_single(cpu, SMP_RESCHEDULE_YOURSELF);
+	mp_ops->send_ipi_single(cpu, IPI_RESCHEDULE);
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
@@ -108,32 +115,18 @@ static inline void *kexec_nonboot_cpu_func(void)
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
index 35b8d810833c..fa9ccefa8392 100644
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
index 395622c37325..b7bcbc4770f2 100644
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
index 0362fc5df7b0..62be2ca9f990 100644
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
index 147acd972a07..68db4d8625bf 100644
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
@@ -367,35 +367,29 @@ static void ipi_mailbox_buf_init(void)
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
 
 static irqreturn_t loongson3_ipi_interrupt(int irq, void *dev_id)
 {
-	int cpu = smp_processor_id();
-	unsigned int action;
+	int op, cpu = smp_processor_id();
+	unsigned long action;
 
 	action = ipi_read_clear(cpu);
 
-	if (action & SMP_RESCHEDULE_YOURSELF)
-		scheduler_ipi();
-
-	if (action & SMP_CALL_FUNCTION) {
-		irq_enter();
-		generic_smp_call_function_interrupt();
-		irq_exit();
-	}
+	for_each_set_bit(op, &action, IPI_MAX)
+		ipi_handlers[op](0, NULL);
 
 	return IRQ_HANDLED;
 }
diff --git a/arch/mips/mm/c-octeon.c b/arch/mips/mm/c-octeon.c
index b7393b61cfa7..5eef34720b87 100644
--- a/arch/mips/mm/c-octeon.c
+++ b/arch/mips/mm/c-octeon.c
@@ -62,7 +62,6 @@ static void local_octeon_flush_icache_range(unsigned long start,
  */
 static void octeon_flush_icache_all_cores(struct vm_area_struct *vma)
 {
-	extern void octeon_send_ipi_single(int cpu, unsigned int action);
 #ifdef CONFIG_SMP
 	int cpu;
 	cpumask_t mask;
@@ -85,7 +84,7 @@ static void octeon_flush_icache_all_cores(struct vm_area_struct *vma)
 	cpumask_clear_cpu(cpu, &mask);
 #ifdef CONFIG_CAVIUM_OCTEON_SOC
 	for_each_cpu(cpu, &mask)
-		octeon_send_ipi_single(cpu, SMP_ICACHE_FLUSH);
+		octeon_send_ipi_single(cpu, IPI_ICACHE_FLUSH);
 #else
 	smp_call_function_many(&mask, (smp_call_func_t)octeon_local_flush_icache,
 			       NULL, 1);
diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index 62733e049570..0e01484535e0 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -96,15 +96,17 @@ static __init void intr_clear_all(nasid_t nasid)
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
@@ -120,12 +122,13 @@ static void ip27_send_ipi_single(int destid, unsigned int action)
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
2.46.0


