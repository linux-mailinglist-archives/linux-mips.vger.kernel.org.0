Return-Path: <linux-mips+bounces-4158-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B095D928A82
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 16:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3A9D1C240FB
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 14:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F67216CD3F;
	Fri,  5 Jul 2024 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="IV58Yzms";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UOa61+p2"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC9216CD11;
	Fri,  5 Jul 2024 14:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720189052; cv=none; b=ndZ0jfMEOLSN7YPrfWOeZB32anvsb8qWFhUuBtLHruc1bonVY6X2LrQYRA8eleSQUEw3VbCN7GPm14wIO4/y1CZJ9HIRYp7TW7BTsQd8DloUfL6sDIKgrGrnF+CrQNBdOzeib28dVnsBU8K95KdRsdkhQ+ZYCDpmKm/hOUalghg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720189052; c=relaxed/simple;
	bh=Br2js4A2Cf1elwIAfgcBCccgVoEMFdJRRdeziSGkutI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJYVzcNz7w000s9AcD6npso09MzkKoUHvbII4LKyd8Yevbxogs4H3UAzIQPK1Rbj5eN4mq73pAnY3+oXSKsByw+bDjTQ7o3SC7OTKJExHqNXf/xVsUvPCpXwC4TVGM7Sz/aCqp4vVFp47WWewCTc4ToFsbATQmKH7wnGPxm5phM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=IV58Yzms; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UOa61+p2; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 1079A13800B8;
	Fri,  5 Jul 2024 10:17:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 05 Jul 2024 10:17:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720189050;
	 x=1720275450; bh=wcuSHIa8hukrwBebB6AD7SpuJq4kKBq0g+3vqQ2Abbs=; b=
	IV58YzmsxvfkWuDu+NnDcqveZI6Qy22R8YS8GeOZzmItBLAaEOiMTMVqtquTQ2nU
	kA3LhsDCJpoZpW2qzF1HZmBXm9pVUhtNlkHx6bPK05sVpccjppL3SVbsxnqgAVIk
	aYZzMQsk0REJDsAJG9k5W/246vANC2i7isv+Y3ir48xlIjaafVvG9ty9G2V0/P2C
	QDGL5jonm8Mm3CvbtSS/vTK+mJqQfAXrquNzfO46iuRR+xL6R0ghvyI0UCn+CPLq
	LG6hNumoOFDEJFkB5Vjx9Yy2TcTmGxotNCf4wryG99VbiovvB/H0x1XFqq+B63xQ
	akrDoZc5SVC2F4dgU0DU8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720189050; x=
	1720275450; bh=wcuSHIa8hukrwBebB6AD7SpuJq4kKBq0g+3vqQ2Abbs=; b=U
	Oa61+p2o/y8vNC+QP5cBS7gRi+2dksymRu2FTlYlBSLGi/LbfCDkwP17Ob2uxKxf
	hiaE4pu9kQEoF/eKVvHYmHJ1FfchmCJhimzK3Niy/iXXKsNQgwINaip0SY+mup88
	eTFfCgIcqYBdLfBJcgpjOU1zDm994L6pfuAyEtg/YBd6w3s/Zuz+GxuB+snTkUTt
	w0A5twLVhayZjMJCtxwPRXvX2uHiVjbJm5Pe+8g/tkJhLEondUnDGyvW7Z2jtxPN
	higpSGa9TZ4ZbAfa6gJ/RXtPcvW/2bGLSTzmDEkAuohNRVi+rWmQ3tpRzNbjybrK
	3pYXlzM3sEUBktZnbsSNg==
X-ME-Sender: <xms:eQCIZmpeAns6Z_hREoYep3olYXERlH18hd4oKU7DAj8lIU1GPguQVg>
    <xme:eQCIZkqLg74hKvRZxvyQBYPhcRwl0MgEnMBmVS5tPfPnYNTmIWSrK36jYl5L5ZM1o
    abN6BZW_O4_06CS7BI>
X-ME-Received: <xmr:eQCIZrMiv9iD6_L1BpMRJQ4UCbfv0gKu70fgO-Ybj8IaBCqX5ehDsTckCMay2CnvJBE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefhueev
    geffgedukeejleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:eQCIZl4Edn5r3lqemYR35kqnUU4XfAeOo3yeZzROAtKZ53OwiEKCxA>
    <xmx:eQCIZl4UGKebYA5mHkO__OmIveCDzUu1-Lt4Hp4jZn6iKWrLzz3ZdQ>
    <xmx:eQCIZli8G5MYMFpCjvrq06aHwVxWRaSUbNKu0W5WGdIZ9laIzI5AKQ>
    <xmx:eQCIZv7Sw_FtoZ8KHd53oapyORpcbjmch6v0L57ufK_J4pBZ3aWuGA>
    <xmx:egCIZix6RKg7yYGAiSh0U9qGXpWZ8zGUZv1zjI1wOCxfbe6AvHPJqbOZ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jul 2024 10:17:25 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 05 Jul 2024 22:16:55 +0800
Subject: [PATCH v2 03/10] MIPS: smp: Provide platform IPI virq & domain
 hooks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-b4-mips-ipi-improvements-v2-3-2d50b56268e8@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4880;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=Br2js4A2Cf1elwIAfgcBCccgVoEMFdJRRdeziSGkutI=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQOhvTfuw5rWu5m/aO8ej7bomqLDxskJvx53M2j+uyD6
 la1DXclO0pZGMS4GGTFFFlCBJT6NjReXHD9QdYfmDmsTCBDGLg4BWAiqVEM/5RfP5/d4y/ccyVz
 9vJPN+Z81rG76mIrcj1/9safR7y1Facz/LM5I66Vq86w8vWTnElV05wXzT+xN2qy2XHJTVUnq8y
 e5HACAA==
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
2.45.2


