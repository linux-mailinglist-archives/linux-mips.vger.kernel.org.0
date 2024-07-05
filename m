Return-Path: <linux-mips+bounces-4157-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A10928A80
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 16:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC45E1C241A4
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 14:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF1216C87A;
	Fri,  5 Jul 2024 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Dqks+SKA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VzfK/FPA"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFA816C6A3;
	Fri,  5 Jul 2024 14:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720189049; cv=none; b=Jz3t9194dg/wLhzQsTuf+i6XYfufwfty5SjQ5XyEFtn3OVkDqYbQ36yxTeaFzkTITKsXRUsGRrtS6caF8b5WsDdQZd5snMw3INwlzGbiwoAgaAH8Bjyzr2a9NXTEDb0jpLonx6kxDZoSVSEEhK1J681qcD8wTUtJGgtTFSjOFuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720189049; c=relaxed/simple;
	bh=QmvEUCmyhXptfa5Dx5DyMMnQpepc6ypUBq9OV5q7HLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ILcN4UYciU5k2XNjn9yBAuBnRNoPCVvmei3tBuSRUCmohVQUIxRCGVPMP6vC+gge4r7gdAL84rfgTFyHvYUR/zcCb8vMx/sJlu8n3A5Xd3KKr+CpMC60ZMEUmwBCvwSz8eMvXkA+5HyKQWUZzuYuvF7rzxLdFIVND8WJBDUhS+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Dqks+SKA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VzfK/FPA; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id B35AE138024E;
	Fri,  5 Jul 2024 10:17:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 05 Jul 2024 10:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720189045;
	 x=1720275445; bh=vwX5MtwwH9KdyKa29HBdsuoSuR0qfhJDxNQizN8Tafw=; b=
	Dqks+SKA85YJMZuQnGg7YhjSvApgBwLjAzoBi/YXS2G/g5YPSaYTNzlwBfaqvnLb
	tBqLd/snFrz+WztRd4/0Hddhd/xrvkC/4gm/BQqYcZQhTrG5SA+sshJp4mdwDOBH
	5+ba8P5VpqnNcmAnEJB3zSWEznjj60FdHyLgRQbufEBgatnPL8qpEGvzojCjQa/E
	JQ/XwyyoiMIwjfJlacr2u6GMVHYpowzfUfwL0h28mZoosKDnrp23uVinRrrye+lp
	Eg8jxT7kb9rMrTYPO7QIlrAsZxS2av8NZPfr8y41Mr3RYCJiY563/bZMNPXT7ysL
	JRnFLnw49/UgYAikdXpuBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720189045; x=
	1720275445; bh=vwX5MtwwH9KdyKa29HBdsuoSuR0qfhJDxNQizN8Tafw=; b=V
	zfK/FPAhS7i0X7Wdmb3LN9rG/SzwcW38PO58Eq/lGAlETMQLADlDUktnXQqlqgUM
	h5uJ6B+j5OhNmX1aR/qaSYlpy9flsLljZHYJmmQywIq4BibupsQjNmtRhH/is56w
	VOreDU309WgFoH3xUD/JGxQajv4Y54lXEBUZypRftFjNIEBhTd7ZaWYKougSq3oA
	bD7INqME8BiBVRW4hFs/U9CNE32L+qpXPzOQBhoV8Zu9BCORKA3kFdugXM5Mexy6
	t53dvRUNcCDPT5U1zm9kgpOteiago/TlcsItZoKMQ84exKbG5APLwG1Kr9kzrfi6
	5Xg09LSsFtekQOXbNeMlQ==
X-ME-Sender: <xms:dQCIZnPcY9IHSWiAH9R2mMEGc2xw0E6JFOoLAAMUGZS-o-5l75nWbw>
    <xme:dQCIZh9LjoiXBGAXQwr1q_Jk4mZLsK3xI6Icq8Iz1YzgpzcCjMyqlsofXmz0BRmjd
    7wb9EU1b3-TG-u_XzM>
X-ME-Received: <xmr:dQCIZmQuCBb4iI-O6H1fX2oPtaO4d2qnScIz2eQLUrI1gkXtfJDWxr-GX5W8d2eiGmg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefhueev
    geffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:dQCIZrsEPXw8qPF26tz4hcFgAjJxqaufgMziDmowaciwMRxkAtrvHQ>
    <xmx:dQCIZvfJ4np5VUEwVai5KSjAFNHEBexLvi8wuw-4pAZzXk-1nTG9Rg>
    <xmx:dQCIZn2EnvadCBa6ieOJeiBG7My9cnnYXd7iMPdm_7YpZ0vcmVbafg>
    <xmx:dQCIZr9IYGiYADk25-R8MpUzXIxmyOyI2YS-oIRMxu27afVdPbmq1A>
    <xmx:dQCIZgXIe62r_o_ajUQOIOf8TmXwuLMuIMZwoytEQjQ1ASsScEBmVQCf>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jul 2024 10:17:22 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 05 Jul 2024 22:16:54 +0800
Subject: [PATCH v2 02/10] MIPS: smp: Manage IPI interrupts as percpu_devid
 interrupts
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-b4-mips-ipi-improvements-v2-2-2d50b56268e8@flygoat.com>
References: <20240705-b4-mips-ipi-improvements-v2-0-2d50b56268e8@flygoat.com>
In-Reply-To: <20240705-b4-mips-ipi-improvements-v2-0-2d50b56268e8@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3259;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=QmvEUCmyhXptfa5Dx5DyMMnQpepc6ypUBq9OV5q7HLE=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQOhvRHySIp02O6C4Ub65bk6fov03wufG3y/Wmv7GVKK
 iXXWjztKGVhEONikBVTZAkRUOrb0HhxwfUHWX9g5rAygQxh4OIUgIk0qDAyXOC4Y9ds8yVsk6dh
 lUrRhHtCP6aqfDq/63rz1C2/nhupnWJkWHO7UztAyzBrztzLzydfCN244/mMOBth+44FTR3PHmo
 uZAUA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

IPI interrupts need to be enabled when a new CPU coming up.

Manage them as percpu_devid interrupts and invoke enable/disable
functions at appropriate time to perform enabling as required,
similar to what RISC-V and Arm doing.

This is required by generic IPI-Mux and some IPI drivers.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Call mips_smp_ipi_disable in CPS disable flow.
---
 arch/mips/include/asm/ipi.h | 11 +++++++++++
 arch/mips/kernel/smp-cps.c  |  1 +
 arch/mips/kernel/smp.c      | 26 ++++++++++++++++++++++++--
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/ipi.h b/arch/mips/include/asm/ipi.h
index df7a0ac4227a..88b507339f51 100644
--- a/arch/mips/include/asm/ipi.h
+++ b/arch/mips/include/asm/ipi.h
@@ -29,6 +29,17 @@ int mips_smp_ipi_allocate(const struct cpumask *mask);
  * Return 0 on success.
  */
 int mips_smp_ipi_free(const struct cpumask *mask);
+
+void mips_smp_ipi_enable(void);
+void mips_smp_ipi_disable(void);
+#else
+static inline void mips_smp_ipi_enable(void)
+{
+}
+
+static inline void mips_smp_ipi_disable(void)
+{
+}
 #endif /* CONFIG_GENERIC_IRQ_IPI */
 #endif /* CONFIG_SMP */
 #endif
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 8c322f441164..a9adf879e2f3 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -552,6 +552,7 @@ static int cps_cpu_disable(void)
 	smp_mb__after_atomic();
 	set_cpu_online(cpu, false);
 	calculate_cpu_foreign_map();
+	mips_smp_ipi_disable();
 	irq_migrate_all_off_this_cpu();
 
 	return 0;
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index a6cf6444533e..710644d47106 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -186,6 +186,7 @@ irq_handler_t ipi_handlers[IPI_MAX] __read_mostly = {
 };
 
 #ifdef CONFIG_GENERIC_IRQ_IPI
+static DEFINE_PER_CPU_READ_MOSTLY(int, ipi_dummy_dev);
 static int ipi_virqs[IPI_MAX] __ro_after_init;
 static struct irq_desc *ipi_desc[IPI_MAX] __read_mostly;
 
@@ -225,13 +226,29 @@ void mips_smp_send_ipi_mask(const struct cpumask *mask,
 	local_irq_restore(flags);
 }
 
+void mips_smp_ipi_enable(void)
+{
+	int i;
+
+	for (i = 0; i < IPI_MAX; i++)
+		enable_percpu_irq(ipi_virqs[i], IRQ_TYPE_NONE);
+}
+
+void mips_smp_ipi_disable(void)
+{
+	int i;
+
+	for (i = 0; i < IPI_MAX; i++)
+		disable_percpu_irq(ipi_virqs[i]);
+}
+
 static void smp_ipi_init_one(unsigned int virq, const char *name,
 			     irq_handler_t handler)
 {
 	int ret;
 
-	irq_set_handler(virq, handle_percpu_irq);
-	ret = request_irq(virq, handler, IRQF_PERCPU, name, NULL);
+	irq_set_percpu_devid(virq);
+	ret = request_percpu_irq(virq, handler, "IPI", &ipi_dummy_dev);
 	BUG_ON(ret);
 }
 
@@ -343,6 +360,9 @@ static int __init mips_smp_ipi_init(void)
 			return -ENODEV;
 	}
 
+	/* Enable IPI for Boot CPU */
+	mips_smp_ipi_enable();
+
 	return 0;
 }
 early_initcall(mips_smp_ipi_init);
@@ -383,6 +403,8 @@ asmlinkage void start_secondary(void)
 
 	synchronise_count_slave(cpu);
 
+	mips_smp_ipi_enable();
+
 	/* The CPU is running and counters synchronised, now mark it online */
 	set_cpu_online(cpu, true);
 

-- 
2.45.2


