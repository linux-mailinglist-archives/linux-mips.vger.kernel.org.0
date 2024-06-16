Return-Path: <linux-mips+bounces-3698-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E027909FCF
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 23:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 164921F210E9
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 21:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706B76CDAB;
	Sun, 16 Jun 2024 21:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="tarcx+hS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S+kv6tWH"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77EC6BB5C;
	Sun, 16 Jun 2024 21:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718571818; cv=none; b=iqaLnEnBeF02riFsbfhqFW649D3w1tI/ChwYMCF/IbtXv2I2daNbGqFXvYQEsA/WukrMjn1g2+Eecvvb5gtYEl6deZWAIMAVEaIfzI2wQsNhxYRfKb8FZtKbvGIHutlLija0GVTh/JEOAhbwZmo5eyKVd8CbmvHMRzno0y5yMQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718571818; c=relaxed/simple;
	bh=wHsDiD50RoPx24lzv2aOKc2oWoxz6/3EkKTUFYyyMAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZU4iI/B7A7ZS/YFDCCKbwRMogK1wdBa/d0zobr2nXRvWpKNZySN5WuUkVHjT+riVQo4lsHS03wEcORMtLZUVQY4jd9qYyPc5nlAjhxyLMCrXpJn3+mDdontQD82dzb/BpyfsfcU9mvBxSy04M2mSvlNaXAd0NQXL0opYDm/1LvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=tarcx+hS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S+kv6tWH; arc=none smtp.client-ip=64.147.123.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id 67B3718000C9;
	Sun, 16 Jun 2024 17:03:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 16 Jun 2024 17:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718571815;
	 x=1718658215; bh=xeKPCFLBIzT9HCzsGdHFFaJZDOn08aeSjaXQqx0+yro=; b=
	tarcx+hSGrF6xNUSrbMPqXCwveKyYQXyRfTpsoUKHfnXDgtfPvy+vMZCBES2IQ0P
	vON61floAI8FBruWRKjAIuRkpFIlbijjb/0+Q/OHvZLTe0bRNdRFWpS3y8ho1QiI
	XotywrEffh+2en05vVfN9DoI+s5xXd3ql/YxJvqNwAS49u2Xu9h7gBWWLAM/nBuE
	stDLaaSNJDCw4lkcxVo1L/dW29lK9Jn6h3CE6pdX+U/gNxyjJPghB+DxQ5hYU7XY
	9c05/TA6nxfUyJGH/gw1aaJ1yFXCzTE7AtUS8HKTAjm/YAHon0eGuvIrePqxfnPI
	6/medlsT3soy/HwKFcdUQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718571815; x=
	1718658215; bh=xeKPCFLBIzT9HCzsGdHFFaJZDOn08aeSjaXQqx0+yro=; b=S
	+kv6tWH6xLI0UzjJV6Aat4h8fApPndBa0cW09AjvjQNOqad5IW2FT9HQtG8Fotz2
	0OsY8JehEddHkbn2hFQ8pSAvOLxOmr1SO+EshQD2+e7+Ckok7xBGEBZ1YHjdjHS5
	eR0q+ypvSa9sYFsIA+TTPszy7nZ9I01XznW+A4GBawF9MaB7rjYWLYVOKno7DjvZ
	GWSHUByh4NIhLgURuN+lGGx7xvvxklbIvVCh73ptlyzRsvdIimfkKQmSL5ixAwP9
	zaMhHzgIEd8wFH0ab5pxafWNMcww3NsN56TdPz/ZBd2kaXiHnpy0kb6kmU0Ny7VJ
	7qDxgNOeWW2Thz4ksuZiQ==
X-ME-Sender: <xms:JlNvZgtOfJeWW5_G0QsUfX7lm6qonJkcoRPfsAW3JCX21FausaO_jQ>
    <xme:JlNvZtc4JfLst276mOmrCM1xwb8Krda2um5ufqvbUwgcST3G9vhCOLOS_NPgM_bY4
    EgL9YpmT1TZgpf5taE>
X-ME-Received: <xmr:JlNvZry1flqTla5osx1zAuiDkuVOZyw_jxZx8Jv3fbOKE40Sdpo7Izo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefh
    ueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:JlNvZjO1bTVjApIaf5LiDRfVwNjCEncUFy6L9EG-GVh2ajn8T8mQUw>
    <xmx:JlNvZg-9ydG_nBr6pJOq6eFTpoLRhrUxMQVWEOk1ePcjy3Uo1XhvQg>
    <xmx:JlNvZrWVe1-BbJdRkeKKd--zFNqmNIkp2i2w9yJ9iW1N_fBSUXDn7Q>
    <xmx:JlNvZpftmBsrYLhBVAQoy_9chpWsWyuQy0GawfdvqfbEPfdxtMwOoA>
    <xmx:J1NvZh2x5bKsHO7eC3PGIx3V-ou1Cmcrr5bYqMB4aRcHe__W1nJBL9nY>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 17:03:33 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 16 Jun 2024 22:03:06 +0100
Subject: [PATCH 02/10] MIPS: smp: Manage IPI interrupts as percpu_devid
 interrupts
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-b4-mips-ipi-improvements-v1-2-e332687f1692@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2703;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=wHsDiD50RoPx24lzv2aOKc2oWoxz6/3EkKTUFYyyMAw=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrT8YHn15v5VvZtXvrzFMZHxUdzxS4+urXDyun5xx9nOL
 Tx+Rcu5OkpZGMS4GGTFFFlCBJT6NjReXHD9QdYfmDmsTCBDGLg4BWAi9kqMDGdmdUh3JUbe2xpt
 wyP48MC0s8fPxLuEBiSGidxOlbpbqcrIMMNGfdZT2+WdpXN441a/mP9O5d82uyCLB9qLXlg1iqR
 LswAA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

IPI interrupts need to be enabled when a new CPU coming up.

Manage them as percpu_devid interrupts and invoke enable/disable
functions at appropriate time to perform enabling as required,
similar to what RISC-V and Arm doing.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/ipi.h | 11 +++++++++++
 arch/mips/kernel/smp.c      | 26 ++++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

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
2.43.0


