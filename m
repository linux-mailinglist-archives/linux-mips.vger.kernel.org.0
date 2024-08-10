Return-Path: <linux-mips+bounces-4843-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0234C94DCDC
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 14:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 269AD1C20FCB
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 12:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482051607B9;
	Sat, 10 Aug 2024 12:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="HrZ+vDTJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PoxMOnwX"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD9A15F40D;
	Sat, 10 Aug 2024 12:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723293563; cv=none; b=VMwV+FhOHTH0i0pl7zJymsh5AZAziztZ2FJiVZmmEvfic26fmvYYfpGt1xWHYAY8DayeetKsJRdEqjcbECfu2a394mPdX2Lclmjpj9mmhZ54eLR+j+Q72JQ7i14NeT8CxccwkP8i732Sj42kf5euuqW+9SQyWDTnnxDEpFP1Bbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723293563; c=relaxed/simple;
	bh=ErvuYehZlH7OfBsYVUKd73rir6ScJ5aBTq7g7ZdVsaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rJhAk7OHT/YNtG69yN3xeJgf+jSKqJ6NZCB/y67hwmAWMkEzFa2yV8kmPmEwA0uRmls50qAXxwhuXOlhm5CFlRIiGVu2PuOLL1a85b/ISa0IiAITQrb/zT3xcienPivpTNTG6lSEDUuYuBfskqFUYCKXthxCt6A1K0Ha35C6KlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=HrZ+vDTJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PoxMOnwX; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id E9E2E1390486;
	Sat, 10 Aug 2024 08:39:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 10 Aug 2024 08:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1723293560;
	 x=1723379960; bh=TLhrQlpte+h4C4JBu2pe373WSb7OWOLjGh/btfBRXrQ=; b=
	HrZ+vDTJ8L/YcX/8D2QltQMm5UJxkGSXj7RSm307K8auR/9hR+3Y2svq8sKfgJZY
	+bj7322WMRrPFxwkv3Q5eLp+t6VT730zoh7Y4pLlqq+obcaBESp/MCGnYnohOYNF
	RAIpIF2a4kdQqrf6q4mzOKaJxv87SCSrJyDRcMeXL8QJMGSPJk28EP+g548A6lkJ
	0Dw4cKpuqFv58Aj6vkRISmY9sa+CE1jmB2mXV9n6xpyRB9uqjW0/4cH3M+IR7VXx
	ZohhzM/jFHt6r2U1A9Ylof+iKEPtpRm/J21liAZc4ZLpCipcgPqB1fVnY2PD+s1I
	gz0QrHxYCiabgvmPOd6wkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723293560; x=
	1723379960; bh=TLhrQlpte+h4C4JBu2pe373WSb7OWOLjGh/btfBRXrQ=; b=P
	oxMOnwXE9yRXiDwYanZ/AVMUkrdWXcpw5J6l3GBMy6UH6n0pKKDewImGwqp9rlBa
	78M5Rhuqfsnjp66Uojwt1qJup/YkcA6Tg6IkY/qiJJ/3HMmBC8Xc9KvVK1vQd8cr
	GRluzgo58dMOkOdlCpa+qOxbXwleqmdibO1SmsPfBO5sM/FNVWrTnsuQDnpTV/Ef
	DB1i7Kobz8CD+aw/piVVwrkTUlXMC/X8iPImFBXKBiI60IINhkNQ/0YKXvKPPxtu
	cDzQSnbUsnjWyHOYmmEYJYsNiOr3v7v0zqi6zBXP1+2KHOOl/QQf8gDWkOpUHfOZ
	gP9h1d3DzE2LmypCe6maA==
X-ME-Sender: <xms:eF-3ZiXgGcdgpEHaJjITGGth4wjY7bFPQaedVnaFNDunoAUhvZXIsQ>
    <xme:eF-3ZunJdwVi01Kf2ViCGdVp3rFY6q1iok0cXDCEuJYBtNONpmMVX--gMJ4Jq07F2
    mGngTcl7mkhJ4ChhjQ>
X-ME-Received: <xmr:eF-3ZmamlBtMDZTOaHpTeJcTi0xfhJCp77q1euJOKORm8sUb9sFyvz2LMJ62AunV-w>
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
X-ME-Proxy: <xmx:eF-3ZpXptWq3pNF0xg2xbiltU2xRgLeUnAWXQQzxrN_jlS36WA2v5w>
    <xmx:eF-3ZskW8KZKeAfqxnhAIZg8TZZmUrt87a3jSy1pysy15UY5Otet8A>
    <xmx:eF-3Zufl5JgkfiWcVu81QfDJ_k5puJIJ5fve7P-W58_sw-_27Ag-QA>
    <xmx:eF-3ZuH-lHXRQd0XCXz8Ajtw9kjr4-4vmivJ9CNt0Cq82_qyXVOBrw>
    <xmx:eF-3ZlftnYbXEFWCGqArZ8InjeTjnmeulQY5WktCkNq1xUCCZw_LWQoR>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Aug 2024 08:39:19 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 10 Aug 2024 13:39:10 +0100
Subject: [PATCH v3 05/10] MIPS: smp: Implement IPI stats
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240810-b4-mips-ipi-improvements-v3-5-1224fd7c4096@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2722;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=ErvuYehZlH7OfBsYVUKd73rir6ScJ5aBTq7g7ZdVsaE=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTt8flXz/+cfVK4R1pzG3ORU8n8z+LJBkZBbnxm1kYBY
 i2PwnM7SlkYxLgYZMUUWUIElPo2NF5ccP1B1h+YOaxMIEMYuDgFYCJeWxj+yhccP2TA/2PalzcN
 T5+5BnJEB1777Dw3LPap0G+JzwFiFxgZdnrWr10kGbD+tPHPZwbdu25fatvOGRl4NVoo4rPN3LP
 3uQE=
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


