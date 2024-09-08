Return-Path: <linux-mips+bounces-5421-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F15EA970674
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 12:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C22F1F221EC
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 10:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7101531CD;
	Sun,  8 Sep 2024 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="oF24tzdM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E4h/RMmL"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A5514F9E1;
	Sun,  8 Sep 2024 10:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790827; cv=none; b=CDcAwZ8r0Phv0Aa3g04BaQ2PB37XOBJc9WeHNUQqJ83umfh8d3jq1dGtEEM3aff4K1OJuG+sgvrZ11NueDN6i5IE0/TXNBAYmPdrw9pFslq2yEcMOkA0yeKjmkUpCHLNfWnb9gi8wjj0C49ByIvyhmH93hSNdJ70Z1GnfvMG8Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790827; c=relaxed/simple;
	bh=ErvuYehZlH7OfBsYVUKd73rir6ScJ5aBTq7g7ZdVsaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oAssFN+38Piatgebw27SRVmzo4tVbkm4jE/VYlCwabSj1xQk68OMvck0QQ66NgxgRnIDmgdxyJGqRGJNlcXMqJvkh/zrOnEoDkZJnamV9YF+mtami0tpDYzpcFmV9sM36dCCV9ygmCT/74AdSBUFYZ4mFdqw4E8jnmFQ122y5Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=oF24tzdM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E4h/RMmL; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 1390713802FF;
	Sun,  8 Sep 2024 06:20:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sun, 08 Sep 2024 06:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725790825;
	 x=1725877225; bh=TLhrQlpte+h4C4JBu2pe373WSb7OWOLjGh/btfBRXrQ=; b=
	oF24tzdMetABusJjpPZEPENH8boPIM91QAPKodHrMdQquIrlMvh7TPWTDXWCJzjt
	G+YzIIAhhNl4CASxqtmLK9JfRVdak5i4mKJDVlh0pQZyyo+g2oQtxCehGYjTWKiz
	gvLmgyXYYO90AwXXnUfAq7k7mbykU9qv1kcfIJSn5CUYpy6aNIXrRIkeJloMPxB9
	3ZKaL2VPIseQ8jlr9hiDiHYu/33HQAvgVKTQTUiZG5N3kdFxbNURc8Wtv3ECenAG
	gQHvtv2peoeGC7HBXhv4pMu40Flp9eQAZjnHeBR5YDKk4SC7utq2fWjnvIOGk/ei
	ZHlTB/b/U6iel8MXlenVbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725790825; x=
	1725877225; bh=TLhrQlpte+h4C4JBu2pe373WSb7OWOLjGh/btfBRXrQ=; b=E
	4h/RMmLdcgNuRwiyA7WkU7l2grM6hk/p7T86nevVls0CltON5+nzYunPB/WDFBrt
	nClOHe6JGZ457AJcrj32B+4u+Ft/x96wHwQO3DiyxmFV4/jHqOVUJqstL4SQtGYD
	PrLmldiHdy4J2qqrq8c+aSpWB6vI7zpIw2Sp+YJ+nlY4DIKgQdu3m5Mw63avM6t5
	3/QT2mBEDeciCRVpNTaUNqOwXFRpZF5vWZJWbJpGa0yFK5r6dThg4yOfcCMB9RAI
	CctbNJtMVQ5I6sIWuWZs8lJW9c/NbjaFJWfUfhgpKQsO2Rsg9mpaHUJt8TgLxInX
	WJGJ1sOFcZcYcefu4AX8A==
X-ME-Sender: <xms:aHrdZsmG4bF763aw4QcIRbr5QkIkdLXlP859K08t1D5FiG9OswhNeQ>
    <xme:aHrdZr0VYTN31XOHCGVfz9P_zth1nofKhW7qhl8fSSzZKU_DOLalUc6AhSIlb5HGG
    kJT3d18i-oWsSsZCnM>
X-ME-Received: <xmr:aHrdZqpnegHqJ3UhEv_0ZaAKZkqtRTFsdqhYGZ5TfIMjbA7Jc8iajK8CXuXmCf0U35c>
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
X-ME-Proxy: <xmx:aHrdZolL3NvkZN7VQhg1fZz44CoYA30hgWadfSFmo2kpiSWMG2lnng>
    <xmx:aHrdZq0DOTUy8hJqb4sBuTp52n0CdtF6gntF173ZI5aLxg36ibJaMw>
    <xmx:aHrdZvua9szKDz34DQPoxc51wg0c6KipOjowYLu6uTpuLqeO-_cLuQ>
    <xmx:aHrdZmUQP9As8F_bE_4rs6Y7KKUaqMdQUkUPdXVNPXbRhFvKgRCHDQ>
    <xmx:aXrdZjvbSxAWeRU9hf2iVt-auJo_Sr1vPpvJtN6IyEwZk0CwPJZnpwkv>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Sep 2024 06:20:23 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 08 Sep 2024 11:20:16 +0100
Subject: [PATCH v5 05/10] MIPS: smp: Implement IPI stats
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-b4-mips-ipi-improvements-v5-5-be8617dd2e53@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2722;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=ErvuYehZlH7OfBsYVUKd73rir6ScJ5aBTq7g7ZdVsaE=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS7VQmTV8wNM9MU29pe+5Llw8+JCyY+Ut9hwdynniuve
 ofL7l5IRykLgxgXg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAExEyZyR4cZ329TG7af8bT5w
 MiyXnFbtv525Ztd/J84T/X81GW4EMjD807lo8WjPzDuzbggbyUu4cDjpl5Q5e8dl9Vb1rYgp557
 FAAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Show IPI statistics in arch_show_interrupts to help users
analysis IPI performance.

Tested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/ipi.h |  9 +++++++++
 arch/mips/kernel/irq.c      |  4 ++++
 arch/mips/kernel/smp.c      | 13 +++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/arch/mips/include/asm/ipi.h b/arch/mips/include/asm/ipi.h
index 7cac0f4ccf37..7d310012962f 100644
--- a/arch/mips/include/asm/ipi.h
+++ b/arch/mips/include/asm/ipi.h
@@ -36,6 +36,7 @@ void mips_smp_ipi_disable(void);
 extern bool mips_smp_ipi_have_virq_range(void);
 void mips_smp_ipi_set_irqdomain(struct irq_domain *d);
 extern void mips_smp_ipi_set_virq_range(int virq, int nr);
+extern void mips_smp_show_ipi_stats(struct seq_file *p, int prec);
 #else
 static inline void mips_smp_ipi_enable(void)
 {
@@ -44,6 +45,10 @@ static inline void mips_smp_ipi_enable(void)
 static inline void mips_smp_ipi_disable(void)
 {
 }
+
+static inline void mips_smp_show_ipi_stats(struct seq_file *p, int prec)
+{
+}
 #endif /* CONFIG_GENERIC_IRQ_IPI */
 #else
 static inline void mips_smp_ipi_set_virq_range(int virq, int nr)
@@ -58,5 +63,9 @@ static inline bool mips_smp_ipi_have_virq_range(void)
 {
 	return false;
 }
+
+static inline void mips_smp_show_ipi_stats(struct seq_file *p, int prec)
+{
+}
 #endif /* CONFIG_SMP */
 #endif
diff --git a/arch/mips/kernel/irq.c b/arch/mips/kernel/irq.c
index 5e11582fe308..c3ea8d80e0cb 100644
--- a/arch/mips/kernel/irq.c
+++ b/arch/mips/kernel/irq.c
@@ -26,6 +26,8 @@
 #include <linux/atomic.h>
 #include <linux/uaccess.h>
 
+#include <asm/ipi.h>
+
 void *irq_stack[NR_CPUS];
 
 /*
@@ -42,6 +44,8 @@ atomic_t irq_err_count;
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
 	seq_printf(p, "%*s: %10u\n", prec, "ERR", atomic_read(&irq_err_count));
+	mips_smp_show_ipi_stats(p, prec);
+
 	return 0;
 }
 
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 81ae65f21f73..aa02ca2e0fcf 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -243,6 +243,19 @@ void mips_smp_ipi_disable(void)
 		disable_percpu_irq(ipi_virqs[i]);
 }
 
+void mips_smp_show_ipi_stats(struct seq_file *p, int prec)
+{
+	unsigned int cpu, i;
+
+	for (i = 0; i < IPI_MAX; i++) {
+		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
+			   prec >= 4 ? " " : "");
+		for_each_online_cpu(cpu)
+			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
+		seq_printf(p, " %s\n", ipi_names[i]);
+	}
+}
+
 static void smp_ipi_init_one(unsigned int virq, const char *name,
 			     irq_handler_t handler)
 {

-- 
2.46.0


