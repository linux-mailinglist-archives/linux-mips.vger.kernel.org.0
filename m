Return-Path: <linux-mips+bounces-5425-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF0797067C
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 12:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FFC3B21A78
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 10:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB7415853D;
	Sun,  8 Sep 2024 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="I3gn1k9Y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kz1AetKV"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AA7155332;
	Sun,  8 Sep 2024 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790833; cv=none; b=BWvw2LHtg+Xlv23tF8Y9WSgMGBWDZcHOcPtsG7riyjBDBsADzSicpIBB9RctnquB3fdL9oIDT71fEuq+KwdLJ6p3TGckBCVykpPn7Hrfp4l5YSVriEYC0jsEHNkc0AHYrJH9lKLBeB5sPqWVBhb/nMB7y6uALK+Z+45qjdkHjfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790833; c=relaxed/simple;
	bh=sW7dt3s4ypU+bzTb8JNQf1YyDVUNZthZ4SG4UK5zlgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUZQDKA1LcXO06/Cs26sftIt3JY1m4MHPUVmxF/vC1h2O79cOf9oh53fwP2qn1tC6/yp/6lhxyqYV6LL/LBIbjDkmi4VzcaKo/Oybybmq8ZVStecmxsjrgrhrVpYJfZ9QcoCz5CFhUSmOhm88rZYwhRQJEeg0nU9QzhT/Pxz6M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=I3gn1k9Y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kz1AetKV; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 06BE8114025A;
	Sun,  8 Sep 2024 06:20:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sun, 08 Sep 2024 06:20:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725790831;
	 x=1725877231; bh=mvAFV+13e/DGT0Lo7yK48N1Jeu4Lld264/pVi4DAEA4=; b=
	I3gn1k9Yr2a8rOJdbfl4S4FK1cnAzxZGY0PCyvbN8y3seCLDE3MJps0IcvjGZjQ3
	oUDy4MRDxOiZg9zXAzYXi+12urFPTPPU59LqSGZ6RHiOtoncuM1OzNwh3cSsR0xM
	4HM4Svfs/ZQKGoTIc90RdshbabRvnhB1pilqJFpWXtCHva7e/FuYnv+G7zfKpsQj
	0T9tmKTS7jOfTcaS1Cgvjtr7440eYRg7p8RY1jI6E3jvk649avhBcQTqJFuMKIw6
	IBhuSZcn7CA8HPUKJr2B3aXPm1DRcBRRdIuxL8qCZS1PHqNf6DzzKXJ4Iu3Hd6F2
	447S4rByJb0jrCtjbDuEEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725790831; x=
	1725877231; bh=mvAFV+13e/DGT0Lo7yK48N1Jeu4Lld264/pVi4DAEA4=; b=k
	z1AetKVuUosMss9XCAY/HSyn5xW+So5DBihOTHcLsNsKVawILizo5MEGPgyrzaP1
	0ZTgn01wlW+sxR5roq68kpdDhJZpY/cTIOcJxnx6tBRxEPBwwNbHA3NdwTuwQMcW
	FoxVub+1bZBJ0QLEUPsD/WO9rmDAYjn7FNeEjH+5pc27CqbHOVjz6vxZAGWluDJ5
	PXNJF0zcwjKxJgTU3LjGcgaOJIJKsWHHGhODqGR5dV5aO3JJFVIl+VHJKRXXKId5
	/Ax5oTCz/GqsinYLGNdKklXWxJ2l4MTaiEdDTG25h6eVN6f34c3VZhkTe0QRbzzw
	3CF2vVmlrwv/woGnjPK1A==
X-ME-Sender: <xms:bnrdZo6chIhxZEV5rffcSd_oCe3zX2B_JCKSDba3bGQB0wyVxb7K1g>
    <xme:bnrdZp5Y_AMHFi8EaDFePUE5dcWtrucvwaT5uBBfISyFDogVQqQDbghLrPXhRjjTM
    5d-QY7bqbVhuoDSI0c>
X-ME-Received: <xmr:bnrdZncHGBf73otkbzYzNB7vPWlyTgzyb-CK83YOzkjM2702u9z2_ZmxU4IZYZxn6co>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeihedgvdejucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:bnrdZtKDh8SXnKqRgCwz9qA2KCug3K2mUYJIGFegB3sNcWyO4Ng0xQ>
    <xmx:bnrdZsKQ_UspEzCbbd1KuBXZGbX24fTQeipKabNOpmABILRDdI03Ow>
    <xmx:bnrdZuyKw1qD2UeTrGKGN31OgKP97PgQ5N36pcA1o_g_aLdGjLNjLA>
    <xmx:bnrdZgLAP4AJdCfSBJMSpD31oyLeI4_88HXP3TO5xFojfu0aMlCuDg>
    <xmx:b3rdZpDX0S5EPd668Ddvzk-9hXQ1d15tCq-UtVbnPSKkKM1Wq2s3rSGU>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Sep 2024 06:20:29 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 08 Sep 2024 11:20:20 +0100
Subject: [PATCH v5 09/10] irqchip/irq-mips-cpu: Rework software IRQ
 handling flow
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-b4-mips-ipi-improvements-v5-9-be8617dd2e53@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4377;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=sW7dt3s4ypU+bzTb8JNQf1YyDVUNZthZ4SG4UK5zlgg=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS7VQlZRgHVcot3Pn/uahTb88xzX4N+uGajcuOJR82Xl
 sZqiPp0lLIwiHExyIopsoQIKPVtaLy44PqDrD8wc1iZQIYwcHEKwEQ8PBgZtvUfs9E4IbTVJeKW
 WPNDBQWGgk07Jbue8Tq+bt8tqOXbxchwgu3KCd83UpW5Hrp7r653/tf5TjitmsmuZ/9VPXGmfdm
 cAA==
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Remove unnecessary irq_mask_ack, irq_eoi, irq_disable, irq_enable
irq_chip hooks for software interrupts, as they are simple edge
triggered IRQs and there is no need for those duplicated callbacks.

Don't mask IRQ in mips_mt_cpu_irq_ack, that is not expected for
edge IRQ handling flow.

Create a irq_chip for regular (non-MT) mode software interrupts,
as they are edge triggered IRQs thus need startup/ack callbacks
as well.

Tested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v4:
	- Reword commit message
	- Style fixes
---
 drivers/irqchip/irq-mips-cpu.c | 68 +++++++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 20 deletions(-)

diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.c
index 7b3501485d95..b2318e915d88 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -49,7 +49,7 @@ static inline void mask_mips_irq(struct irq_data *d)
 	irq_disable_hazard();
 }
 
-static struct irq_chip mips_cpu_irq_controller = {
+static const struct irq_chip mips_cpu_irq_controller = {
 	.name		= "MIPS",
 	.irq_ack	= mask_mips_irq,
 	.irq_mask	= mask_mips_irq,
@@ -60,11 +60,33 @@ static struct irq_chip mips_cpu_irq_controller = {
 	.irq_enable	= unmask_mips_irq,
 };
 
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
+static const struct irq_chip mips_mt_cpu_sw_irq_controller = {
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
@@ -149,17 +167,27 @@ asmlinkage void __weak plat_irq_dispatch(void)
 	}
 }
 
+#ifdef CONFIG_MIPS_MT
+static inline const struct irq_chip *mips_cpu_get_sw_irqchip(void)
+{
+	return cpu_has_mipsmt ? &mips_mt_cpu_sw_irq_controller : &mips_cpu_sw_irq_controller;
+}
+#else
+static inline const struct irq_chip *mips_cpu_get_sw_irqchip(void)
+{
+	return &mips_cpu_sw_irq_controller;
+}
+#endif
+
 static int mips_cpu_intc_map(struct irq_domain *d, unsigned int irq,
 			     irq_hw_number_t hw)
 {
-	struct irq_chip *chip;
+	const struct irq_chip *chip;
 
-	if (hw < 2 && cpu_has_mipsmt) {
-		/* Software interrupts are used for MT/CMT IPI */
-		chip = &mips_mt_cpu_irq_controller;
-	} else {
+	if (hw < 2)
+		chip = mips_cpu_get_sw_irqchip();
+	else
 		chip = &mips_cpu_irq_controller;
-	}
 
 	if (cpu_has_vint)
 		set_vi_handler(hw, plat_irq_dispatch);

-- 
2.46.0


