Return-Path: <linux-mips+bounces-5419-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAF6970670
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 12:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B10E7B21AC4
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 10:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AC714EC7F;
	Sun,  8 Sep 2024 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="A7b/7cid";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZX+EPVhq"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E6814D6FC;
	Sun,  8 Sep 2024 10:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790824; cv=none; b=KB7lxP94l71Y9MafKEOlejm5h/UrmmfTHV8gpzomtMGZSf3PA7ttTwUyyJfm0CvcoUR7SpvPggHzvNGGGctEnrGP6sUl19xuLnZWpv4ALUsk6Mn/L2LivkQEwpo6JbO+ZNdLN4Uj0pQukPJjqn1BzJ6AZ/EQSWId1gIJVstwj/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790824; c=relaxed/simple;
	bh=cxGEu9/e+ohTEUF7vEiqEO8BVWC89yL0ln+4HSyC6Dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MnnSm88cJhmIwYol+ZKt66WeR6F8pC3c95f/ePFV/Z6L53a2PF+gSnm0LJGddEW3y0F7EOOkGeUTMyKSitYTI9uBLymfWPtobqKmpygeO3ByZObOVz/ILbFHrnQ2RFYlfLWcS3bm+g9UqGRmtutJ3sABDUfpjDboXKeml4mtQjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=A7b/7cid; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZX+EPVhq; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 319CB1140292;
	Sun,  8 Sep 2024 06:20:22 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sun, 08 Sep 2024 06:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725790822;
	 x=1725877222; bh=1qEjgEDmS59aqiM5bbsGQaznl0i55CgECr+NGuaOlLk=; b=
	A7b/7cidqvSv3fQSTytUxhv3+NvvDkxhTSAypqPr7s8Z96Lsf8NxID2aoBq8XEOB
	ulbOshmbBWYixnlAiCCfuO2rk1C45k8+eO9XmnXBxbl97dy1iXkmSIK9YW2fj4wW
	HzuXUet1fwg5WCAC1f004wWeKcbgXHHkujPN+iAMaFvrEEwKHf57uGK54iiRb4M3
	J8rb/Duq1TBlcfX0eT+uQW3KFHPmjgiYlL5QuV97AKEgKAqGq2XuYxiZF22zJOer
	23MOsffpm0q/8q9IlcYC/AZW1q+oip2H1liuG53pef3x6EETTulP80mzDlOvsxsA
	7cgzuPL1rmkJBb1FJbvLxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725790822; x=
	1725877222; bh=1qEjgEDmS59aqiM5bbsGQaznl0i55CgECr+NGuaOlLk=; b=Z
	X+EPVhqXA3LULHt5AVKASFS/rwazTOvdUxCPnRhdtqCWPtg0YmwyyjROi+/ppb9l
	Od85BpU5K1NDPp5luz/Yc4QgP1kIy+j3BkrHCDedrtzf1BrE2twZD6JYCpTglA1G
	Ysou0BvAwfv6K91ewMIfByQXv+6rrRNsM3okIcHSTdb9vih9DiVlW+P1Nb9q1OJ7
	jpcOa1LPnKch2f6L1x5+TWtLBTwoXDhYXvkEEvk960ZoIOX8tCGTXYDB62qaqaaV
	cZj9aeBFbqUu8xI8eJcJKEbFCQk5RtxvPZURo9T0KfOdzL8LKW24u/7P/bKu8/1s
	oi92s9MObYuCkcNeRIyQA==
X-ME-Sender: <xms:ZnrdZrDoy--E_cjCVj0gq5-zAVhpSKnD4NdZigC2B-2jA5MpxiemXw>
    <xme:ZnrdZhhPFrd93TXz_nm4OIOWhwU-z7RhWzccLeRV7B_idyV2AA7gwyD3yMs6WX40f
    hXY9MAl22PJb3LbvbA>
X-ME-Received: <xmr:ZnrdZmmVD7GuDCWlMWE1MmAo5nXnka6Q38Q49bYrDH2NZuuRT75euqWGA1XZvl05czA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeihedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
    necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
    gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
    tghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehfrghntggvrhdrlhgrnhgtvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhi
    rgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehflhhorhhi
    rghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepphgruh
    hlsghurhhtohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmihhp
    shesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrg
    hlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepsggtmhdqkhgvrhhnvghlqdhf
    vggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthhopegthh
    gvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ZnrdZtxfjnNaNSsTkNgNKsGz1Fm3lgmpmQ6LlNJLk59x-3pFj0t5NA>
    <xmx:ZnrdZgQ90oBJ28kaRnhN-zJRbgv5x3v3DKooDqf1fo0FK68e7vCrfw>
    <xmx:ZnrdZgYv7PR-AblKm5ogsiFi-1qjy-0636yHW2J7gvUENGueh9VaUQ>
    <xmx:ZnrdZhT79Hq1MuJUGvX4C8SHOP1DHZLlF6yAIRtFZyF03GCZ5xQsYg>
    <xmx:ZnrdZlIYEhAWYs0ZxKN0kfOaTwD9KfjKX2H79lkbAxJfNbj_kreqlhak>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Sep 2024 06:20:20 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 08 Sep 2024 11:20:14 +0100
Subject: [PATCH v5 03/10] MIPS: smp: Provide platform IPI virq & domain
 hooks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-b4-mips-ipi-improvements-v5-3-be8617dd2e53@flygoat.com>
References: <20240908-b4-mips-ipi-improvements-v5-0-be8617dd2e53@flygoat.com>
In-Reply-To: <20240908-b4-mips-ipi-improvements-v5-0-be8617dd2e53@flygoat.com>
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
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS7VQma82Jv3rzxeu2/h9dPBdRsd1fKexKroqiRt8h69
 6L9HmZXO0pZGMS4GGTFFFlCBJT6NjReXHD9QdYfmDmsTCBDGLg4BWAiB/kZ/kfva9nm8VjlBnvC
 keZF2Tob1r36afOAhfNb+wvGRGND41eMDOcy6oVdpz07mJVxKzDE1P/gQveYH9fiRM2L3B7t9FA
 R4QMA
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


