Return-Path: <linux-mips+bounces-4847-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA8F94DCE4
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 14:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5C28280E81
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 12:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DD416D4C2;
	Sat, 10 Aug 2024 12:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="DdF2X6OH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YNC8UbH+"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD52116C856;
	Sat, 10 Aug 2024 12:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723293569; cv=none; b=gI/Ggp9hfYXzQgv8+VwzJ9qKs5d23+pPU1RmppKC5ygQugLymJo7btWuifNSbppSybnoTSkpTluqCdF2BD9tcqgtOkCeNeNi5VogEGOMzOL5M9BW5UK5x1U2Gak+w2MSJ3E4Pjs0q6P8dc2smJtTB7VFcmYkMAqjyTCVaMBg43k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723293569; c=relaxed/simple;
	bh=QtTWy2Q+e5XNNE3vkRpp+K1MfQ6P5KmM8+2jFpqTlyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tddANKDYvDsjhDhiXxEtG7KxfuC9EkRRXoX2V96HOrqsgKHM6HIVmLS8IhtbkgTSV2hZ9fw6P6D2brBAf0Lar1+z1tOqfsQkc2xjeDcKsjIdZLYhHC7nQAjN3rwZQBwFJmSSmLmxpupQizoQcAR5NlOLtf3Riv9ir7fogoz1O2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=DdF2X6OH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YNC8UbH+; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id DD3E911520C0;
	Sat, 10 Aug 2024 08:39:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 10 Aug 2024 08:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1723293566;
	 x=1723379966; bh=O37E/93vAVxyCl9larORo9jnjuMSnFyGoEFMbtvjK1k=; b=
	DdF2X6OHPMcKhr7Za0R9+czgHektYbE1XlCnEUM4jaE1RD+IdBwgJC7kQA3jxVwp
	hg9IkhuD+qno5L8wdue+q4Srr1Z5GeJvSxIQ+4APjvSeMP4OqLkMaFAzl/TqEoks
	XxMsAPpXfrjUI0hVJjyy6kv6k20C+kmGQHIsauuBds/MjKNjzx1B5fo5bMR7oAel
	Sez1k95TVkIW8jyC1igcCaZNcUGtI6nUgeCMDUvyVaMJgXCkkERbbYrkiQbvDO5U
	zghV2S47Tmmy3nswc/oVUPciCx6pmjz93CKwZA1Tv/2QvIqR37qOh1z1dJ6QyWYj
	Wwht7Wgv/uXxwV4du39Xog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723293566; x=
	1723379966; bh=O37E/93vAVxyCl9larORo9jnjuMSnFyGoEFMbtvjK1k=; b=Y
	NC8UbH+qCDlAe2G5ZubyCb7JnqK52j7AqfhYC0gV5uh0WrLI2xhheZvKA66q0/Nd
	DWdvGrvubiAuW8AQo9NsWjjrKJlZcyr/GYEE6HBUWQpGbrsOez4vgXoGaSsEqF1r
	7oAvpKkvAhPq1pvbulrRaoe14G4yhUFp6tymwl2cZioZMe0NeVJkf5sfwCIoPR1n
	0W/XrzFtwtlcp77GZ2hGP9VHRK6yhcNBOYrzkfNG8xPvJOEDlDS+hJLXCteyAa1d
	b2N4JhGqKhnlvWE+EdhHE1ih/t9ruL9MDZhcucpDcbyAqDJpF/0T0jjCNDPNka9J
	z/QqDSe3O4uY8SZBgI/ow==
X-ME-Sender: <xms:fl-3ZlU_2SDg0NZoxOxmryJCEFpwdLZ6BitFSQC33-tfFJ-4QaBAaA>
    <xme:fl-3ZllxuItIeVtToivGU2B-S0sSPjTh1EaF1Q0dOcQUClyZ1qOCzdAMDqyaQDHGG
    BXEz19TanZvOPPYBfU>
X-ME-Received: <xmr:fl-3ZhaRytYhvDCLUl9gPrncDLIGiWuU_GY93EYEt74pRISiTJrYgepDysM4Q3-bxg>
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
X-ME-Proxy: <xmx:fl-3ZoX2xIuWcYcXbzXzFiP8QAuOLkl863_aT1qEjqK3bYA2THHawA>
    <xmx:fl-3Zvk4OE043lzrtO_HyWbY1CHwzcSmoPg9GdDEZZaUbyBYGRlGZg>
    <xmx:fl-3ZleUklh5LJOpaSOEZY9YKGtvJdN-5ta0qwXOPsydHDiakr5wYQ>
    <xmx:fl-3ZpHkgAz4vOEupBTVxO7bqYoaKORUJtb-teMUHgVC1SdO9dFDBg>
    <xmx:fl-3Zof78sxyH6q4ImkWrVoBBvHBiwZ_otr_-yhjCKXkIXTx5sLzNCcL>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Aug 2024 08:39:25 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 10 Aug 2024 13:39:14 +0100
Subject: [PATCH v3 09/10] irqchip: irq-mips-cpu: Rework software IRQ
 handling flow
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240810-b4-mips-ipi-improvements-v3-9-1224fd7c4096@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3817;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=QtTWy2Q+e5XNNE3vkRpp+K1MfQ6P5KmM8+2jFpqTlyI=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTt8fnR1XuZz/zmn6LvMTfy4Az7As6F26wlUwuVjKzXL
 Zy4JEG5o5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACbioM/I8I5FmJ957XnLGbLf
 a74Yf1x2iKPJyFWlMXaKksKHF9N/HmFkWDv9/6LtHhUzFLnbZn2dsFBAzYj1lOXC308/7I1aaD6
 tlgsA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Remove unnecessary irq_chip hooks for software interrupts,
and don't mask them in ack hook to match kernel's expectation
on handling flow.

Create a irq_chip for regular (non-MT) mode software interrupts
so they will be acked as well.

Tested-by: Serge Semin <fancer.lancer@gmail.com>
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
2.46.0


