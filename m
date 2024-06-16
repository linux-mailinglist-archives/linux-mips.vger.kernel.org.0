Return-Path: <linux-mips+bounces-3699-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE9E909FD2
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 23:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E095F1F21067
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 21:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489656F066;
	Sun, 16 Jun 2024 21:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="lHCSSdlX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kxYmoByL"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913E44964F;
	Sun, 16 Jun 2024 21:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718571821; cv=none; b=d0CJmqh/UOe1b3vK1Oul3fjIup3/z1tON2VTR5kExqkKmEE45iCUXtAgxbqlovkOyYzGQQw4MZvfuFLySYpnbYmxqpYz8wu0fSFNCuPu0lbKvvkq2Wp4/TC0cnJ3VqMZJdwyH/qzvGJGEzHWCR+J3DGsiVDFP9TEginaWmiVP8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718571821; c=relaxed/simple;
	bh=d2OknMMxorxFkf5DImwHqEQaLveM9KNB4VtRA7GbSRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lT6Kq2Uqs9rs+lt4eSBOX0nyRbmVGfzyEhWyctVeYmM0Jh8HzwtF24F221NmoujQuXhSPHsHO02YKXIFHvet1kLShBCKIpvcmLym+IAMfJytOnIk4dqWOIAKwqsKPRyorxuFo/PyAKNtca7bdJyEs6F018e4Ii0Vcqtz5TAEBB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=lHCSSdlX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kxYmoByL; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id 6384A1C000A9;
	Sun, 16 Jun 2024 17:03:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 16 Jun 2024 17:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718571817;
	 x=1718658217; bh=3f+6SXfbFhh9e7SA6hXsiueGsGMJnsyYnROP7YyoBKg=; b=
	lHCSSdlXeFXhCvjMlHb5w0NT0UDeHZBKzzMfm2g/yjnsE4DIzNkdy5SvfwRRQlne
	Fzyne0wi1lSnJuS6OVsnHnUj+vOIA44Dx8VKIdVsEfQr66dQupf1D3Yo02YrQCyi
	gQY7Qh3+9LCnQOI16pvM9vd+CCTqSuN9NyEtPluaAvjBodEP05TmTOT2MHVWfaJh
	Etkf1iIvkTRlRT9m+XUiEUJFdK+a0/YTLJKFiitQHh+PysxfaXFvzfdCL2PYv28T
	tVfPq+mtn4qHxaMJCozvahuKawWUs94w45PNkM1nlgk1vuVyHfJSC3OXod3VGfOV
	lfFHc/M59kDEb6ra7zT04Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718571817; x=
	1718658217; bh=3f+6SXfbFhh9e7SA6hXsiueGsGMJnsyYnROP7YyoBKg=; b=k
	xYmoByL/NzcTVIGAIIf7LSpjuylHJibdRpSUJoWrKKjszg85i5NLRMUt/Jm+zX7/
	/q5JUK+cgUhtfi/SzTl7D+Gb5j4HyEL4KiwiYMS8rhC2hDS+g3HVt9n88x0poChz
	+FnKEFAMW5tl+HpE2P7ioAkF5DvqPfvItr1jbejsV72p+WBdAs2QcxkFE7iIeTCt
	+mmqydwQYfSie9RUCIrYne4OQ8641A+z5Uu/Ukv/fsG7gTfWBAQ7RdhOIZcW/beP
	zKm42X9bxRre7Yehy8OrdEfJY07hi7M5XyADRZ7AAOu3nXA9LNnIVaS8ns861PA3
	Z9KCMKAuqVCjFVS4ZpdUQ==
X-ME-Sender: <xms:KVNvZsW2CzGcYqMPkjgBsRWiUZ5f1MYckTebmG9Tqd5AKE_4nMXFpQ>
    <xme:KVNvZgnswwMI6MCt5tQXOBC5LwD_LyqpDdvCbS0-La0jfVaqNvwEYb2whusBqVmBk
    lOhg23M5Eh_kCztevw>
X-ME-Received: <xmr:KVNvZgbuJ_5e5UoJ44FrF6zol-wwvQzf0dM0rv8ggfPwPkGmmdlnc3s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefh
    ueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:KVNvZrUoRf1LGDLaj0mhPtQTLviBAizDDpJ7LrsttTN8ZRIeRjdTHw>
    <xmx:KVNvZmm3JLKA7iTk3TaF6QojqnmBDyLJe5AJ1NpHUwwR6BoY4qP0sw>
    <xmx:KVNvZgcKHXpD_jre4U_D44Dt1XyKMZFuEku7wUAV8kSnn2gTBQ1jQg>
    <xmx:KVNvZoEgcdg2USuBS7woPfD734y9sebchUXKYFh1_gkW7j8NCDsW1w>
    <xmx:KVNvZvf1u5C_9FCtphOqAFhIfQEPhxLnT1P2vEu4l819I1A2qQWi6nwV>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 17:03:36 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 16 Jun 2024 22:03:07 +0100
Subject: [PATCH 03/10] MIPS: smp: Provide platform IPI virq & domain hooks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-b4-mips-ipi-improvements-v1-3-e332687f1692@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4880;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=d2OknMMxorxFkf5DImwHqEQaLveM9KNB4VtRA7GbSRo=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrT8YPnKSx/4NuhsOdrTcWyRh9DF36pM31tLH7C+Zvt11
 0L4dlJYRykLgxgXg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAExky2lGhvbTGaGie66/1Lnw
 +t4rkZrM65cjtTXm12yNjGOw3tY7YQXD/6zD34yOJTKYPJipIx95dHeU9Z6tkR0/XqS0/bt67LV
 IGTsA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Provide platform virq & domain hooks to allow platform
interrupt controllers or SMP code to override IPI interrupt
allocation.

This is required by ipi-mux, the API is aligned with RISC-V
and Arm.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/ipi.h | 17 ++++++++++
 arch/mips/kernel/smp.c      | 78 +++++++++++++++++++++++++--------------------
 2 files changed, 61 insertions(+), 34 deletions(-)

diff --git a/arch/mips/include/asm/ipi.h b/arch/mips/include/asm/ipi.h
index 88b507339f51..0fc8c31c6a52 100644
--- a/arch/mips/include/asm/ipi.h
+++ b/arch/mips/include/asm/ipi.h
@@ -2,6 +2,7 @@
 
 #include <linux/cpumask.h>
 #include <linux/interrupt.h>
+#include <linux/irqdomain.h>
 
 #ifndef __ASM_IPI_H
 #define __ASM_IPI_H
@@ -32,6 +33,9 @@ int mips_smp_ipi_free(const struct cpumask *mask);
 
 void mips_smp_ipi_enable(void);
 void mips_smp_ipi_disable(void);
+extern bool mips_smp_ipi_have_virq_range(void);
+void mips_smp_ipi_set_irqdomain(struct irq_domain *d);
+extern void mips_smp_ipi_set_virq_range(int virq, int nr);
 #else
 static inline void mips_smp_ipi_enable(void)
 {
@@ -41,5 +45,18 @@ static inline void mips_smp_ipi_disable(void)
 {
 }
 #endif /* CONFIG_GENERIC_IRQ_IPI */
+#else
+void mips_smp_ipi_set_virq_range(int virq, int nr)
+{
+}
+
+void mips_smp_ipi_set_irqdomain(struct irq_domain *d)
+{
+}
+
+static inline bool mips_smp_ipi_have_virq_range(void)
+{
+	return false;
+}
 #endif /* CONFIG_SMP */
 #endif
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 710644d47106..fe053fe52147 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -189,6 +189,7 @@ irq_handler_t ipi_handlers[IPI_MAX] __read_mostly = {
 static DEFINE_PER_CPU_READ_MOSTLY(int, ipi_dummy_dev);
 static int ipi_virqs[IPI_MAX] __ro_after_init;
 static struct irq_desc *ipi_desc[IPI_MAX] __read_mostly;
+static struct irq_domain *ipidomain;
 
 void mips_smp_send_ipi_single(int cpu, enum ipi_message_type op)
 {
@@ -255,11 +256,12 @@ static void smp_ipi_init_one(unsigned int virq, const char *name,
 int mips_smp_ipi_allocate(const struct cpumask *mask)
 {
 	int virq, i;
-	struct irq_domain *ipidomain;
 	struct device_node *node;
 
-	node = of_irq_find_parent(of_root);
-	ipidomain = irq_find_matching_host(node, DOMAIN_BUS_IPI);
+	if (!ipidomain) {
+		node = of_irq_find_parent(of_root);
+		ipidomain = irq_find_matching_host(node, DOMAIN_BUS_IPI);
+	}
 
 	/*
 	 * Some platforms have half DT setup. So if we found irq node but
@@ -291,43 +293,15 @@ int mips_smp_ipi_allocate(const struct cpumask *mask)
 		ipi_virqs[i] = virq;
 	}
 
-	if (irq_domain_is_ipi_per_cpu(ipidomain)) {
-		int cpu;
-
-		for_each_cpu(cpu, mask) {
-			for (i = 0; i < IPI_MAX; i++) {
-				smp_ipi_init_one(ipi_virqs[i] + cpu, ipi_names[i],
-						 ipi_handlers[i]);
-			}
-		}
-	} else {
-		for (i = 0; i < IPI_MAX; i++) {
-			smp_ipi_init_one(ipi_virqs[i], ipi_names[i],
-					 ipi_handlers[i]);
-		}
-	}
-
 	return 0;
 }
 
 int mips_smp_ipi_free(const struct cpumask *mask)
 {
 	int i;
-	struct irq_domain *ipidomain;
-	struct device_node *node;
-
-	node = of_irq_find_parent(of_root);
-	ipidomain = irq_find_matching_host(node, DOMAIN_BUS_IPI);
-
-	/*
-	 * Some platforms have half DT setup. So if we found irq node but
-	 * didn't find an ipidomain, try to search for one that is not in the
-	 * DT.
-	 */
-	if (node && !ipidomain)
-		ipidomain = irq_find_matching_host(NULL, DOMAIN_BUS_IPI);
 
-	BUG_ON(!ipidomain);
+	if (!ipidomain)
+		return -ENODEV;
 
 	if (irq_domain_is_ipi_per_cpu(ipidomain)) {
 		int cpu;
@@ -344,6 +318,25 @@ int mips_smp_ipi_free(const struct cpumask *mask)
 	return 0;
 }
 
+void mips_smp_ipi_set_virq_range(int virq, int nr)
+{
+	int i;
+
+	WARN_ON(nr < IPI_MAX);
+
+	for (i = 0; i < IPI_MAX; i++)
+		ipi_virqs[i] = virq + i;
+}
+
+void mips_smp_ipi_set_irqdomain(struct irq_domain *d)
+{
+	ipidomain = d;
+}
+
+bool mips_smp_ipi_have_virq_range(void)
+{
+	return ipi_virqs[0];
+}
 
 static int __init mips_smp_ipi_init(void)
 {
@@ -352,7 +345,24 @@ static int __init mips_smp_ipi_init(void)
 	if (num_possible_cpus() == 1)
 		return 0;
 
-	mips_smp_ipi_allocate(cpu_possible_mask);
+	if (!mips_smp_ipi_have_virq_range())
+		mips_smp_ipi_allocate(cpu_possible_mask);
+
+	if (ipidomain && irq_domain_is_ipi_per_cpu(ipidomain)) {
+		int cpu;
+
+		for_each_possible_cpu(cpu) {
+			for (i = 0; i < IPI_MAX; i++) {
+				smp_ipi_init_one(ipi_virqs[i] + cpu, ipi_names[i],
+						 ipi_handlers[i]);
+			}
+		}
+	} else {
+		for (i = 0; i < IPI_MAX; i++) {
+			smp_ipi_init_one(ipi_virqs[i], ipi_names[i],
+					 ipi_handlers[i]);
+		}
+	}
 
 	for (i = 0; i < IPI_MAX; i++) {
 		ipi_desc[i] = irq_to_desc(ipi_virqs[i]);

-- 
2.43.0


