Return-Path: <linux-mips+bounces-4841-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 542A894DCD7
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 14:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10F7A281085
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 12:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEADE1591F3;
	Sat, 10 Aug 2024 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="PXVpAzJE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RxrDs8yr"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88A61586E7;
	Sat, 10 Aug 2024 12:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723293560; cv=none; b=r3tvPwPthYDJNT7YDaNeu6U/ScRq8Dp7yhgrNNXzAJxeWadLcv2nZAhMQhT4SgwW2lcMP9BdjSP64vuGDbm8FBBTrGiy/DY2Z8Y7l9Fl3OdSd4DOKvsJw+L/3F0fyafIOBnCO8m2q/laPzD5VD+gRxqykbEi4YTuIcNxRi2m2/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723293560; c=relaxed/simple;
	bh=cxGEu9/e+ohTEUF7vEiqEO8BVWC89yL0ln+4HSyC6Dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZzKyotVnusDFYnelN4tMdiMRDVaEUvt7Lx+Ei8Ru8Vr66OgeN0gn1BogAbVv0Y3iv9vzW3cZFXnzMltlrEMddvrPjgKDudq0xbrMuIHqUv4FHyztXg/gsZGBvcHxfng51IOMvBCPcWkBouPBPNW8w1tfHRLQnhlOwdl+MpLXaOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=PXVpAzJE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RxrDs8yr; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 2017913903C8;
	Sat, 10 Aug 2024 08:39:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 10 Aug 2024 08:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1723293558;
	 x=1723379958; bh=1qEjgEDmS59aqiM5bbsGQaznl0i55CgECr+NGuaOlLk=; b=
	PXVpAzJEmEe7K4GxxMeV6QDfjS3XY4Us6cLdpXvVYa2zVKHBViQDnsvSGEmAgx1u
	2K5zIBIgRIv9p55wniD6XUjXnVyB84OmfOMJs5eXs75Dzp2VNaZwEB5lLN53tFHQ
	S3LWtgXOCiTWYt3zFdzVdgw2qc/OTFr7dHlpCj6et3cH6+zFIl5DKEVfvPSbztX+
	Su/02P2kwux5EZ/MTHC897rzLW3N0SrglzsZxJgbOempoPhuQTUe2epj8mFmj0wN
	0R6hMtzaa23gobtbGFWi+nBtSpbKdlTF6TPHCHxgpRDy4/PFj76rIhapw0wOfPX4
	pZTHcwtP8LdyxI29xhNoUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723293558; x=
	1723379958; bh=1qEjgEDmS59aqiM5bbsGQaznl0i55CgECr+NGuaOlLk=; b=R
	xrDs8yrbUNEB4gszFpE+/pFV+782wB4ySNflX3pHtsxuKBkz+cvHmZZvgwjPo3OE
	Mt63lLVA5lYjkRCERD2vt4ImRNwj1iHWZJe5esRWoHDX3AXYEkM+MHxV7irbAZZc
	wWcSsh2I3QMgUYHdm9zp29hrQDM28+SymaWrr0iVZEyad5v5QJl0AeK1oIhhVA/C
	EnRuDWV+ze0GYUO6WYXa1I5ktqgQN6iC8K+lTSav4JiL+rsuc7pYPRVJDpOdoEPL
	YB2lho1V0cMIrGiYxWLC7cnPdIBbvuvrlzzBkXiDE0PSg2y7oTuowa9cRn41GzZm
	BnYp+C9EQiOde46kFAkQA==
X-ME-Sender: <xms:dV-3ZgZoDZSsc22TDp8O3k74_lmWgZKJp0OxUytMCMPgbpOR1zfiRg>
    <xme:dV-3ZrbKqHYB6H8m_veRbPqP38GExXqfsvm-dbI4nx2sVU22jfaFtF3l9LHYaNl3J
    QbgPpJizT3khHmsUpY>
X-ME-Received: <xmr:dV-3Zq8rJtfmQ7uIv6-8zI1KXKDWXzKAdIL5IVQ_XZLImLyYlxDg4GuSh8IeKzhj-g>
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
X-ME-Proxy: <xmx:dl-3Zqo_tzLClMH_9QDieFqp6YJ4YKxE7gNKr0rH6mZhimHZbHPl7g>
    <xmx:dl-3ZrqbNJTj9fiBiSj-jUR3pTIRIfGKa9LKUlP0r5aNBDNcUn5ECA>
    <xmx:dl-3ZoQGrrqdhUZjTSE5ALWBLtCXu2BxEcigEJKB1zYajN-XxFN-6w>
    <xmx:dl-3ZrrvQMLPczRRITLPwm-bCQheaf37rp0hH2-5aFCfrsiTnAIYGg>
    <xmx:dl-3ZoiQQesF6UvC63ISLq8dr02FWCWbB660_R38fs3jagaV0IFI3nFU>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Aug 2024 08:39:16 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 10 Aug 2024 13:39:08 +0100
Subject: [PATCH v3 03/10] MIPS: smp: Provide platform IPI virq & domain
 hooks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240810-b4-mips-ipi-improvements-v3-3-1224fd7c4096@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4958;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=cxGEu9/e+ohTEUF7vEiqEO8BVWC89yL0ln+4HSyC6Dk=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTt8fnlIc+PLHBe9kGxoFnlVvjUI6HW/KubVXzKj7cXi
 mTumajUUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABNZv5Lhn/rPgz5iWcYGPj6b
 Hy7buHerlWg+Q5aMip545pVTu/44BDMyrLMP0J/09s28mLL04rsHYm3jpKbnhVqsza68k9vLUP6
 UBwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Provide platform virq & domain hooks to allow platform
interrupt controllers or SMP code to override IPI interrupt
allocation.

This is required by ipi-mux, the API is aligned with RISC-V
and Arm.

Tested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/ipi.h | 17 ++++++++++
 arch/mips/kernel/smp.c      | 78 +++++++++++++++++++++++++--------------------
 2 files changed, 61 insertions(+), 34 deletions(-)

diff --git a/arch/mips/include/asm/ipi.h b/arch/mips/include/asm/ipi.h
index 88b507339f51..7cac0f4ccf37 100644
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
+static inline void mips_smp_ipi_set_virq_range(int virq, int nr)
+{
+}
+
+static inline void mips_smp_ipi_set_irqdomain(struct irq_domain *d)
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
index 9918bf341ffd..d3c7486fee3d 100644
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
2.46.0


