Return-Path: <linux-mips+bounces-5402-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0159A970200
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 13:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8448F1F226E8
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 11:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C3015B559;
	Sat,  7 Sep 2024 11:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="4lOEbOAH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KXMZxpnj"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE6815B103;
	Sat,  7 Sep 2024 11:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725709705; cv=none; b=jwF+HY9yMfQ9E+BYxo319CjO80So7QfL7nLbAkKZMDq0TkliUoDbaTVIxPe3r00ej3ONayfG+TqZg2g80IvS1VIb8TNBG3tpasYL3n6ZjqTJlV7IaWI3UlsUMmds9RcLdlnV8mfozlHHPY3MtgISN8g5alnimbG2pUe6e73qgAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725709705; c=relaxed/simple;
	bh=cxGEu9/e+ohTEUF7vEiqEO8BVWC89yL0ln+4HSyC6Dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qj1ZVChRsoWXh5LgzQmMUCeyAoEaYXzgA4j2vxRrxV7MFMfHpyr28YZxUO/rBsZf4oLY92T0Vr1sm6NG/1h3OgWjXLbx5OSxBhfnaObdhcBI/ihMPPS3VQTKRws2awZUlMgDKPaj/kErqKG6AwqBdBlk1o9zbFthc11Ka8eOD3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=4lOEbOAH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KXMZxpnj; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3EF4C11403A5;
	Sat,  7 Sep 2024 07:48:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sat, 07 Sep 2024 07:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725709703;
	 x=1725796103; bh=1qEjgEDmS59aqiM5bbsGQaznl0i55CgECr+NGuaOlLk=; b=
	4lOEbOAHIVc9iiaJRiIVL6XDfV9MsPZIFbb5K/sVfDdx0laLgKXPk8ca+HAx7jW4
	YazyKXod+THB4tvYYHszX+ERvZaMcgN2dgo2TA7v8iNticG4hOw8XXDhm6GfqMtF
	pkWsupppqSmVhyXWXaQWSvrwOJozpg8QIn+L5wAfmNdRu0pYWZL8ZczKF8PGmgza
	0cotfoCwxublve9Mw4AXRIr/73tPQz3VlNGE1mAYToC0rKf1JB9pqlWhN1rkWXON
	BjJgFWI6NEjuWkOkB2W1qqxJXWm0euKAriO5KjkaJaEuRrM8qUKoies5sLZ5wclG
	uEXkhsoqnYfrjmUoIM9WBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725709703; x=
	1725796103; bh=1qEjgEDmS59aqiM5bbsGQaznl0i55CgECr+NGuaOlLk=; b=K
	XMZxpnju1k2TidejWnsZMdPuXLyUHDV2Xj1SkdI2rW7LrKQHWiWVFygz0k0BCnCb
	tzGj2mVwiUbGwnBOMvtRbqZQW6uHpgf5dROlbYPRdxNp5zuiLEadgZ+SK4+CxlFf
	usP3BYyQl/AYh+TKvVvI7SsGGLHfrshWdvvUhWk++MZOhYIGkhs9l3VD+JmbJBWn
	fSdtdwVCq5uQw5gHxVopP5wnlRabqwnSsow5B2+C5uZextn8tD1EBvVDUmzbVXiA
	w7TlCyyzZgfyxnxGjNpcem95KEgl0d1PPt8OC8kP3a0AqogEfY0iXYvk0QpYSksZ
	/hyjsE7m1JwtoJozWYDXA==
X-ME-Sender: <xms:hz3cZu7W128Vw1eWHwrSj0fmByzKFzQ_FYkYP2rKOsHYablh_z3Hvw>
    <xme:hz3cZn5zXln-WtesbKWdinelRuVyv02N6QW9xo8wqwVeYO1qIcIRo1CDyhNMEHsK5
    hcaYoWCsOQfXKH28u0>
X-ME-Received: <xmr:hz3cZte4gpxnDuL823yo3cptRMW-bm-qpuL4yuGCchV1XziZm4lCLVF0BASEbCXLPBk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeifedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
    necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
    gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
    tghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhm
    rdgtohhmpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpth
    htohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopegt
    hhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmh
    hiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlsghurhht
    ohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehflhhorhhirghnrdhfrghinhgvlh
    hlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhgrnhgtvghrrdhlrghntg
    gvrhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:hz3cZrJJ0TJL0EhZMPDwLwtl0Dd72-6zAgYnTot1uL0xSDNiV9kfDA>
    <xmx:hz3cZiIRrjMtElxZNVpJWuQpos9Yy2MVI2Wf2bFnCOuSpGQ8RWuEpA>
    <xmx:hz3cZsxzwCxAiFvl9mQFig2G3Bzs8Ge_oHKDQZmETS6aVBAKFHBeLw>
    <xmx:hz3cZmInqBDT6dv8N_MBR7Iz2RhPqZskdFs3-hknbQ3DkbEewVEvPA>
    <xmx:hz3cZvAvI48inJGpp8KFmRbkrWwtrXCmgaA-gKK2kHcFZUK5fdTfeaVo>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Sep 2024 07:48:21 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Sep 2024 12:48:09 +0100
Subject: [PATCH v4 03/10] MIPS: smp: Provide platform IPI virq & domain
 hooks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-b4-mips-ipi-improvements-v4-3-ac288f9aff0b@flygoat.com>
References: <20240907-b4-mips-ipi-improvements-v4-0-ac288f9aff0b@flygoat.com>
In-Reply-To: <20240907-b4-mips-ipi-improvements-v4-0-ac288f9aff0b@flygoat.com>
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
 b=kA0DAAoWQ3EMfdd3KcMByyZiAGbcPX6ilaIYNkt5fQyVN1Pxf4guKQsJU433iemz6GZjCn8pt
 4h1BAAWCgAdFiEEVBAijrCB0aDX4Gr8Q3EMfdd3KcMFAmbcPX4ACgkQQ3EMfdd3KcPK0wEA5U+K
 63m/eRc1fWy8NhiXKTAnvRDQTMn5v9h3FtoLKOEBAJerNCVt8XOk9tg4L+AE8rqteoyVjBg5omm
 nghlRxYEH
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


