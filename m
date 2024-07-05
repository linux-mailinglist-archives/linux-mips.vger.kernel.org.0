Return-Path: <linux-mips+bounces-4164-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36162928A91
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 16:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87061B266D0
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 14:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7DE16F0ED;
	Fri,  5 Jul 2024 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="cCxqpO5J";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RLeslqk6"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF7816EC0A;
	Fri,  5 Jul 2024 14:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720189078; cv=none; b=qJ3WgDK2g2r7v+VjiiXPmJQkmSOjcg+GIsc3TeGtdOgd4gbZxz4T9U+5vwWEQYRdfJQ97t4K7ognKptoNraUO39pLyRz1jf2OJF43lJuePPW7Sy9rxHfX6yvI4hED5/myTYt4dcCVuyowWOETVZcSHUpfEnjP6tGPMG79i5bNIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720189078; c=relaxed/simple;
	bh=mF8x5POR0JWocejCEm9t9GQmijFAUrqV9j/pcGQiv4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=erOEytxKCjidcbx7a/ZgYJ051FN1E+wPEil5EbAb333b2E/nfZDVfVee9+EMyg7SsSFHNnU1Xk0hYz2f6mMF1muUt/r6Vc778TmZGiHC0tndLanwWX472ofqGGFiiTfLPA9ez1uWpbvy7Nz14P9ChUKwevh36PlHhl/zk12rx18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=cCxqpO5J; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RLeslqk6; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id C4221138016D;
	Fri,  5 Jul 2024 10:17:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 05 Jul 2024 10:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720189075;
	 x=1720275475; bh=jtNsz/USWp6cQ4gHMWhrcXI8O4aiXMuAzcA0q0zAbQo=; b=
	cCxqpO5JgvGj2CsNYmh8GzMup0SvPqp6KfX8i/f1fPkT1Z3RCnMATIiQn18YFJsh
	Lmt0OeOnW7QsWUGfNjzMWjVFd9kVdkxmK5j64Ar3MPjTjbhJj1Lxt4qO+V46fOS4
	m0I4hHSOGTiBrFRzm6R9kRO3j2S9xduQV4kYdgaGJ20v0zaQTgam4ihc6dJVgjsD
	GwYcU+yV1YQb3iKAnITDwUvL89Xh5Wl7+f/b3h6rkO1w2RYPudfH0dPA3V30GtMU
	BNlwMKBIFb8I6qLalr3Edu/xoIi35GeboIDpR2XaNIUIhCk51zn5NhkLNkkntUUu
	DvFHB8R5mXPCnBNl4Ivhmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720189075; x=
	1720275475; bh=jtNsz/USWp6cQ4gHMWhrcXI8O4aiXMuAzcA0q0zAbQo=; b=R
	Leslqk6CB9LfdRo+Wy9SHBlFQ/5sZXu2NREc121K7whT/jnJKLiY8rHsoAONvhu9
	p/65PO64mY4EDxxyeeYBMQFHXJN4oW85YShODqrRzcPuvadTp1LOMRKfI5VDM8ja
	4lgbnsDTwXMA85KgNGFI+x0u+p0Q9hxZ49QuQ20W3ndfcuC/lEGeeg59idvvFDEU
	/TFWOQAkOEtX3JYD9PbmJOdR8gL7IUIGZq2DdnSLyrokbE48eyw9eY//rlFDYZlm
	gDhFQnEISdWnwaUIez1a1Et/hZLPh5OheT9uMXnBVPDgw420gFRy6qmSSemrN9I9
	IqlDZwe/peIANeIhzK9Ug==
X-ME-Sender: <xms:kwCIZqso_k_09zQp4xXBvZqp0iTb5TOeRVxw8BwLqQELTIH7nxWolg>
    <xme:kwCIZvcOW3eb3xY6Qt9f5SLnHLvLuXNYqCBJdnwt021c07Y4JQXjbl86REm9r-5g1
    g3yFTWQz4OGVC1vgdQ>
X-ME-Received: <xmr:kwCIZlyhS5b03kKcBI2xhKaLGvHqOvRiUViBl-KiCmzjPGd6tz11eyN1rm6tY-t2Y84>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefhueev
    geffgedukeejleenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:kwCIZlPI374eojT5YjLzygZ2O5Uly1tZ1dGZso1iOteKOothuA5FuQ>
    <xmx:kwCIZq-hCjbTnMnct8iyU7S8IjMw4x4Z4mfuMYbGHQkMwGXJYH55Vw>
    <xmx:kwCIZtWtBOBRVWnJQHIUySywBDmt3hpM3w2ImMSLxUr7WATX1Nu_Lg>
    <xmx:kwCIZjfzJP9JxPr_Qu1i98-JF9I1Bq5VkjzcTYsKpESO62ff901Pig>
    <xmx:kwCIZr39qEE5uG0MIpj_qW4CjG_-WlmrUtWjGd-9P0AVdhDz0r0TdVnY>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jul 2024 10:17:52 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 05 Jul 2024 22:17:01 +0800
Subject: [PATCH v2 09/10] irqchip: irq-mips-cpu: Rework software IRQ
 handling flow
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-b4-mips-ipi-improvements-v2-9-2d50b56268e8@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3767;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=mF8x5POR0JWocejCEm9t9GQmijFAUrqV9j/pcGQiv4E=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQOhvS8D+wG+iuKwrac4IjifVPU8EPR9WZbyc4o+1N69
 3hvMBZ0lLIwiHExyIopsoQIKPVtaLy44PqDrD8wc1iZQIYwcHEKwERkLRgZvm5XVriyItR6H3vn
 vNNBZhorP/zTO3orwfJQa46fxOwjgQz/lKpTjjpdV/p+m/OTPJfqu+fh7NsMdrjWey09vE5y5q3
 3DAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Remove unnecessary irq_chip hooks for software interrupts,
and don't mask them in ack hook to match kernel's expectation
on handling flow.

Create a irq_chip for regular (non-MT) mode software interrupts
so they will be acked as well.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/irq-mips-cpu.c | 57 +++++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.c
index 7b3501485d95..4854c06ce652 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -49,7 +49,21 @@ static inline void mask_mips_irq(struct irq_data *d)
 	irq_disable_hazard();
 }
 
-static struct irq_chip mips_cpu_irq_controller = {
+static unsigned int mips_sw_irq_startup(struct irq_data *d)
+{
+	clear_c0_cause(C_SW0 << d->hwirq);
+	back_to_back_c0_hazard();
+	unmask_mips_irq(d);
+	return 0;
+}
+
+static void mips_sw_irq_ack(struct irq_data *d)
+{
+	clear_c0_cause(C_SW0 << d->hwirq);
+	back_to_back_c0_hazard();
+}
+
+static const struct irq_chip mips_cpu_irq_controller = {
 	.name		= "MIPS",
 	.irq_ack	= mask_mips_irq,
 	.irq_mask	= mask_mips_irq,
@@ -60,11 +74,19 @@ static struct irq_chip mips_cpu_irq_controller = {
 	.irq_enable	= unmask_mips_irq,
 };
 
+static const struct irq_chip mips_cpu_sw_irq_controller = {
+	.name		= "MIPS",
+	.irq_startup	= mips_sw_irq_startup,
+	.irq_ack	= mips_sw_irq_ack,
+	.irq_mask	= mask_mips_irq,
+	.irq_unmask	= unmask_mips_irq,
+};
+
+#ifdef CONFIG_MIPS_MT
 /*
  * Basically the same as above but taking care of all the MT stuff
  */
-
-static unsigned int mips_mt_cpu_irq_startup(struct irq_data *d)
+static unsigned int mips_mt_sw_irq_startup(struct irq_data *d)
 {
 	unsigned int vpflags = dvpe();
 
@@ -76,14 +98,14 @@ static unsigned int mips_mt_cpu_irq_startup(struct irq_data *d)
 
 /*
  * While we ack the interrupt interrupts are disabled and thus we don't need
- * to deal with concurrency issues.  Same for mips_cpu_irq_end.
+ * to deal with concurrency issues.
  */
-static void mips_mt_cpu_irq_ack(struct irq_data *d)
+static void mips_mt_sw_irq_ack(struct irq_data *d)
 {
 	unsigned int vpflags = dvpe();
+
 	clear_c0_cause(C_SW0 << d->hwirq);
 	evpe(vpflags);
-	mask_mips_irq(d);
 }
 
 #ifdef CONFIG_GENERIC_IRQ_IPI
@@ -108,21 +130,17 @@ static void mips_mt_send_ipi(struct irq_data *d, unsigned int cpu)
 }
 
 #endif /* CONFIG_GENERIC_IRQ_IPI */
-
-static struct irq_chip mips_mt_cpu_irq_controller = {
+static const struct irq_chip mips_mt_cpu_irq_controller = {
 	.name		= "MIPS",
-	.irq_startup	= mips_mt_cpu_irq_startup,
-	.irq_ack	= mips_mt_cpu_irq_ack,
+	.irq_startup	= mips_mt_sw_irq_startup,
+	.irq_ack	= mips_mt_sw_irq_ack,
 	.irq_mask	= mask_mips_irq,
-	.irq_mask_ack	= mips_mt_cpu_irq_ack,
 	.irq_unmask	= unmask_mips_irq,
-	.irq_eoi	= unmask_mips_irq,
-	.irq_disable	= mask_mips_irq,
-	.irq_enable	= unmask_mips_irq,
 #ifdef CONFIG_GENERIC_IRQ_IPI
 	.ipi_send_single = mips_mt_send_ipi,
 #endif
 };
+#endif
 
 asmlinkage void __weak plat_irq_dispatch(void)
 {
@@ -152,11 +170,14 @@ asmlinkage void __weak plat_irq_dispatch(void)
 static int mips_cpu_intc_map(struct irq_domain *d, unsigned int irq,
 			     irq_hw_number_t hw)
 {
-	struct irq_chip *chip;
+	const struct irq_chip *chip;
 
-	if (hw < 2 && cpu_has_mipsmt) {
-		/* Software interrupts are used for MT/CMT IPI */
-		chip = &mips_mt_cpu_irq_controller;
+	if (hw < 2) {
+		chip = &mips_cpu_sw_irq_controller;
+#ifdef CONFIG_MIPS_MT
+		if (cpu_has_mipsmt)
+			chip = &mips_mt_cpu_irq_controller;
+#endif
 	} else {
 		chip = &mips_cpu_irq_controller;
 	}

-- 
2.45.2


