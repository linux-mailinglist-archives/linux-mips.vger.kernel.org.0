Return-Path: <linux-mips+bounces-3705-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B759B909FDE
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 23:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 416F31F21258
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 21:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F5A823B8;
	Sun, 16 Jun 2024 21:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Z8AQqTam";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LOkZxOgU"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D707C811E0;
	Sun, 16 Jun 2024 21:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718571838; cv=none; b=qwNZltuH+oYYNELKlpRFb3+5cSJhxhLDYogmrZplPvDu0nL0lYC7JlrvXVRu5IsOyhztrCIPUgHxPZuN90Rfr9Xe0AEkE55HBsjz43ERICFPsKBTbiYh2W8JsDBrYpeG/SrMr+2F21XOV/M2GFRG9HjDvHCAI1Rs/FMxUvK9Wfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718571838; c=relaxed/simple;
	bh=t0jFM1TdkV0L/QJh4f56eeC76Lk7sZp8QfAutyHMpjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jNd2gJJpP++VJouK5ryt4QtWee5TxkpqSgxZdCh60EFu8Q7UVGOLy9c8jKT3q+WgzbXOv3LCwQgUu5ZJNYqzYNmgHEGffF+k7YgeN112JGQ7jtrXCv34e459OpRlb05Qgid8leYLgBwAUc0OcLRh0HFbjBQHa7Np02QbOcR9doY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Z8AQqTam; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LOkZxOgU; arc=none smtp.client-ip=64.147.123.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id 6D1BD18000AC;
	Sun, 16 Jun 2024 17:03:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sun, 16 Jun 2024 17:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718571835;
	 x=1718658235; bh=BvspTC56CbdmoNTWhom8B4pXPgn+9ltSQD8Mt84pARk=; b=
	Z8AQqTamFzClAy5d5oKNVNE3FqgQ5ZtXIgUaAM947S4iTlSAEhfHTfcddLMJeis3
	MMQ0SXxuA4CFLL9MMHmkCEfJ7p26Llp9SDxF89TdwcrosnOMligwoU/XV1GRx8La
	z+hkiIKGppRr3bdQTDh46ZqAZLX4IHgXQU3RZZFv4Wj376Zv3L6XrppM5QncpRK6
	Ouu757vhfu9br4ic/dufiSjdFfJmEp6hwpEIanjcptS+KVAQ9GOauo2Gio0Q4mZ7
	R2y4/3pMDq9OMZO5BKcK07OvIvj7O/lh+kBHHaOY1IngxnLEJpfUB3YfqvH/Yr6S
	lUIUGEQs88nKh4X+J+n/UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718571835; x=
	1718658235; bh=BvspTC56CbdmoNTWhom8B4pXPgn+9ltSQD8Mt84pARk=; b=L
	OkZxOgUcHPS2yzuaICn7hdxgNC0qQxt8YDKt9bTl7nblErQ8udSZKNLwTs3OlLjf
	/EiBSXvPXhx7VEMi1lQF35Lv6uwH3dk5wUl4Z4ya5OzgUw5EnViYQZrdpMYPYIhh
	c34Yod0PdgDYXcTrJe8aQR8YWQOBXovjV+gT24xAiT77+irD/cJ7U0owJMU9Vv97
	kTB4PT17tHUn820rTQ5BhZSrpwMyAoeluu48PvraCWcklwRVExxoaWFZze+Gnk0L
	9VDfPvwUxX7wrh1RLq0pMJbok1bKY6KihcTOPFClbHA5H+OKB9NiJSr0XE4aADxM
	OF9rj8qnuA63O18grnG4A==
X-ME-Sender: <xms:OlNvZnKZaE6KZdlCC_YYfQkBDYVGaK1MCGEL3vWrXR2BClUhL_ZvDQ>
    <xme:OlNvZrLdc_UHN1fpGb_bsZwGQiQlTa1DRVdGiLfhlMnJV9QXCBTHe52vb-g8lFwWF
    LlJacS-2Pkppk2SjvE>
X-ME-Received: <xmr:OlNvZvuo-04LCz6giYF79wDyyfuMi8xJQpewHUK3P5G8FBFzh-u7Gws>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefh
    ueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:OlNvZgbhP3G6zeDxLuo61wQuzuJ7O-h8Cspv7NSTzgNtAG9LM36CYw>
    <xmx:OlNvZub3KX4cb8HJTP8fymFd2HqCfZ6v7Fx_uIwGDEVF97R83QH5TQ>
    <xmx:OlNvZkDNhemW8dA6Q_XbTgNU2wMo30WCeoOgxNq34R8Z6Y_ZD9vnyQ>
    <xmx:OlNvZsZ1_c2eJR-mwBEzx6p3NQHhDv9fzcD6o0OqA_IpcFXHtGTrPg>
    <xmx:O1NvZrRPNoGBBiK4NAYcAl31lWJtC6AJFR3ljImO6k2gzvaubg3tn9PF>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 17:03:53 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 16 Jun 2024 22:03:13 +0100
Subject: [PATCH 09/10] irqchip: irq-mips-cpu: Rework software IRQ handling
 flow
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-b4-mips-ipi-improvements-v1-9-e332687f1692@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3767;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=t0jFM1TdkV0L/QJh4f56eeC76Lk7sZp8QfAutyHMpjY=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrT8YPm5CcVGCh/sZ2TU7tYTMJcLKPVcP+/2befuHuGi3
 IdeJsYdpSwMYlwMsmKKLCECSn0bGi8uuP4g6w/MHFYmkCEMXJwCMBGja4wMv471RTEs2p221lCn
 UFmyd5FI9vbAFqWcjfNuKUWxmV7vYmSYoHG4xrbmZ66k59MVb63nJc/fzsJsLRRaYFul9mxihBg
 jAA==
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
2.43.0


