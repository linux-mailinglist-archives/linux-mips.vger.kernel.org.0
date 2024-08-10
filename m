Return-Path: <linux-mips+bounces-4845-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9BD94DCE0
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 14:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4795B281F21
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 12:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A765D158A3D;
	Sat, 10 Aug 2024 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ByMjdA3v";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YXZHfFmH"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C01168497;
	Sat, 10 Aug 2024 12:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723293566; cv=none; b=OL2/HeHtTdhyXopcnmsXH7cM6I3j+asHZPRSit+JvDxNySaoAc83IY4LF8LDc94gK76ivtyidnAGRbDOHsKwAzD8biY8qU1yO500bLjgGBcZULPoqgflEkg16PrKwZggtN0hFrNR2pgytEIgEerEe8CBNM17ei20V5wfUO2eRkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723293566; c=relaxed/simple;
	bh=eIhrStCFhvy6UxtCOWmxnItdfmDtk8eGTHQjAvagVJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ej9AyFQ2+QC5eKvU05889D0Tj+CFTjPy5oKrJYNZ4dAy16yICJ/gse3OjdDOAcGBH45gany5PIspphriCOFMDncEaYvJypXE/2gkgS9igVJnYelccbsySqBMJepwW5CsRBh6YeiTLAD+Sg1kX/JvLkVzaCqYX5X2UiCtlvjsk8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ByMjdA3v; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YXZHfFmH; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 0DA021152105;
	Sat, 10 Aug 2024 08:39:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sat, 10 Aug 2024 08:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1723293564;
	 x=1723379964; bh=CrRlxBx9BNlgfuT4leF0ZpEwcFYthm6BbRrRIv9TLgk=; b=
	ByMjdA3vrhyf3/AEIxezsi415/okfUcv1DRrrEVxM2bOdd8N1KdAoNXrz5q/Qmta
	uJ3Z+YKpca2BYXVXJSnid9HXikgTZ85xzhR8B9x/EZMM5sb2Sh/2Ka8tu8Q+shAx
	sRjNFc4mmGjwM4EwUG6s7iySrV8TDsiDBVm/9iTg2ygCXfGdW3vF/MYO9BVOZ/3B
	/Vu5W6QiX0LoDUT+ADH65hannmWhTwJnHS+6uWxtTzjA+4yoUjEM8G1WZ58nfn82
	2FY1lkpRiSJ5w9tr5UFzRun/O0/aXIAGwjT3eAQWgXwuS++n1gYhDwIk6a+okwDb
	Y5sBNvUWQj4YkJ4yr7kN5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723293564; x=
	1723379964; bh=CrRlxBx9BNlgfuT4leF0ZpEwcFYthm6BbRrRIv9TLgk=; b=Y
	XZHfFmH16iVq9akxJMQYsiJMZulTgtTMVxAQMiz4aSuxrfXxhqrfcdJRiHJSirdU
	ScF2hWaVoqThvabVwazFZTjzsTtr3FLHRUoPyhuPy4Tvi+1prVpPvA69gZCclUrz
	Ly6ippQlEgFpjwC3QhJ6RjaA8gviBBJZ9c9jLDUX9sCglaOtMNzvuJJS3g3MS/nC
	D195JgMSppJE5lK5MI3eqNc/LqfhJbWAODA9fHSdp4nfNZA9T3wS84JDARK4spMO
	C4vQkVm/8eGjpm8DnaEaPg7IAIhiGh9qazqd68UtYi3P1YV6RjMbpg17I95I3/qO
	jgxvl38oyBj60WCDqVT3w==
X-ME-Sender: <xms:e1-3Zoz-B5anFX0B4TvAgAnIjtR5gQ1jtyidogBHOPBtSaC12_MKNA>
    <xme:e1-3ZsRFH2mOPRttZ8AXzcYcoN2iTWdzPhMquUkQdjy2vSy5mZ1iZkoCyRb-CaAJe
    0uyUxdFHdGfbt7ezRg>
X-ME-Received: <xmr:e1-3ZqUkDxvFtDdscK526SKEh5kTT2NRA_GxRJbwEDajJmuo5hNPxok0JqnWGJDmnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrleeigdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeen
    ucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhmqeenucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeeg
    udeghfdtuddugefhueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedunecurf
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
X-ME-Proxy: <xmx:e1-3ZmhEXkNqYb_lEKp6XWLTr9Gl0fE9gdEpHer198st0FeYHzENIQ>
    <xmx:e1-3ZqBUvNwMsNx2SkB7Ia5HpNdMGL2NQhBnWdBzALX7C-NRxZCWQg>
    <xmx:e1-3ZnJknnTlrBNkF_FWfPmb4g3ihWLaKBZ5FtQrNGzRzZSq45uc2A>
    <xmx:e1-3ZhDCZN1kqCmw5CbbUAzFKPQuC2tJusXG4aPulb6UjoSpraRYPA>
    <xmx:fF-3Zu5OYW1UZqxXzaI5obVf0sSTpj9WclOCTrMla4cTEk36bwW4npL0>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Aug 2024 08:39:22 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 10 Aug 2024 13:39:12 +0100
Subject: [PATCH v3 07/10] MIPS: Implement get_mips_sw_int hook
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240810-b4-mips-ipi-improvements-v3-7-1224fd7c4096@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2807;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=eIhrStCFhvy6UxtCOWmxnItdfmDtk8eGTHQjAvagVJQ=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTt8fmdga+TpDUcTPqWP1tt4P9hmnn6dZv/TBlXuf6q7
 zfTMCzuKGVhEONikBVTZAkRUOrb0HhxwfUHWX9g5rAygQxh4OIUgIkoXWP4pz+tR8548Sf/j+L2
 PbYnlh5QMDv0aAaTj8GPvQXWNutn/mX4HyVgy7Va+k31vckve43UNu9VSRKw/3/u6cl5Xx7cEfW
 ZxwwA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

For MIPS CPUs with VEIC, SW0 and SW1 interrupts are also
routed through external sources.

We need such hook to allow architecture code to get interrupt
source from platform EIC controllers.

Tested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/irq.h     |  1 +
 arch/mips/include/asm/irq_cpu.h |  3 +++
 arch/mips/kernel/irq.c          | 17 +++++++++++++++++
 drivers/irqchip/irq-mips-cpu.c  | 11 +++++++++++
 4 files changed, 32 insertions(+)

diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
index 3a848e7e69f7..6edad40ef663 100644
--- a/arch/mips/include/asm/irq.h
+++ b/arch/mips/include/asm/irq.h
@@ -51,6 +51,7 @@ static inline int irq_canonicalize(int irq)
 #else
 #define irq_canonicalize(irq) (irq)	/* Sane hardware, sane code ... */
 #endif
+int get_mips_sw_int(int hwint);
 
 asmlinkage void plat_irq_dispatch(void);
 
diff --git a/arch/mips/include/asm/irq_cpu.h b/arch/mips/include/asm/irq_cpu.h
index 83d7331ab215..50a99ba2d503 100644
--- a/arch/mips/include/asm/irq_cpu.h
+++ b/arch/mips/include/asm/irq_cpu.h
@@ -9,7 +9,10 @@
 #ifndef _ASM_IRQ_CPU_H
 #define _ASM_IRQ_CPU_H
 
+#include <linux/irqdomain.h>
+
 extern void mips_cpu_irq_init(void);
+extern int mips_cpu_get_sw_int(int hwint);
 
 #ifdef CONFIG_IRQ_DOMAIN
 struct device_node;
diff --git a/arch/mips/kernel/irq.c b/arch/mips/kernel/irq.c
index c3ea8d80e0cb..c79504b12134 100644
--- a/arch/mips/kernel/irq.c
+++ b/arch/mips/kernel/irq.c
@@ -26,10 +26,27 @@
 #include <linux/atomic.h>
 #include <linux/uaccess.h>
 
+#include <asm/irq_cpu.h>
 #include <asm/ipi.h>
 
 void *irq_stack[NR_CPUS];
 
+int __weak get_mips_sw_int(int hwint)
+{
+	/* Only SW0 and SW1 */
+	WARN_ON(hwint > 1);
+
+	/* SW int is routed to external source */
+	if (cpu_has_veic)
+		return 0;
+
+#ifdef CONFIG_IRQ_MIPS_CPU
+	return mips_cpu_get_sw_int(hwint);
+#endif
+
+	return MIPS_CPU_IRQ_BASE + hwint;
+}
+
 /*
  * 'what should we do if we get a hw irq event on an illegal vector'.
  * each architecture has to answer this themselves.
diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.c
index 0c7ae71a0af0..7b3501485d95 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -254,6 +254,17 @@ static inline void mips_cpu_register_ipi_domain(struct device_node *of_node) {}
 
 #endif /* !CONFIG_GENERIC_IRQ_IPI */
 
+int mips_cpu_get_sw_int(int hwint)
+{
+	/* Only 0 and 1 for SW INT */
+	WARN_ON(hwint > 1);
+
+	if (!irq_domain)
+		return 0;
+
+	return irq_create_mapping(irq_domain, hwint);
+}
+
 static void __init __mips_cpu_irq_init(struct device_node *of_node)
 {
 	/* Mask interrupts. */

-- 
2.46.0


