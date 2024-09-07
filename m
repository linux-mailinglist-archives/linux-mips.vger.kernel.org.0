Return-Path: <linux-mips+bounces-5408-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D5197020C
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 13:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 853E41C21996
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 11:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F226160883;
	Sat,  7 Sep 2024 11:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="K/EDRBml";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="T1UsXR4h"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B7715957E;
	Sat,  7 Sep 2024 11:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725709714; cv=none; b=Eyc2ZjWU8TcVILmFMUhnQxWm2R6c/dP3vh11XcuWSWu1sGhqxv7dAOzP38ngPP2Qktw4sm4LItPL1GKZDn7sowuRvLEbKLJSEGn7Ntmc22J0FO9xmjr/MhCHm7TWFU6LLT1D1Lml0JbsessHjXTzYUXUwzEB+OV7oSo/5FbBr8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725709714; c=relaxed/simple;
	bh=4WUwKXY4S6rrZcYJC6tMjl9r4iaCf1PK2jcPhkKx5yU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bBjt2KOnfvzKUbp1YIW41afrwpvBULvrtChb+HUs2UzUp5xRP0QL4DLfO0hQNiHGysQXlHQAmiG+Rqr1MGMpEID3ART/lupo9rNW6rbDPrGCl8VU3+H/KSPfeAQdHMt+Kofj6GLTqv7FFxCa6ran5v+7JOOsQQGM4wcZBI5mpWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=K/EDRBml; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T1UsXR4h; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 62D431380450;
	Sat,  7 Sep 2024 07:48:32 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sat, 07 Sep 2024 07:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725709712;
	 x=1725796112; bh=kA05i1fXhZEAfbPD1jPhI8sd/40p+OHNicYDDwcgaGI=; b=
	K/EDRBml3cxIWH4c/7Ch5vrQK4Rst3WtGFSto3Am4SFuwKacbU76xdlpFUM19KmQ
	QUhz8NwCFuxUUKl9DEIIvuDXa0zbHPoCUoXJVVlv0EuxfR7z3murLVRbwzt3mDOb
	bxluTcQCC2ZAmzH0Lv3/5H76fqPTvXEKAGYWQgr7JoeFuxCtJu4bwlGifSEsc6Hb
	oAK3Zpg9XY9ewcttHUIEOWOYnTMSSJ/u9wiMTg7H1gsbkKAa4GDRwLDHq2fULFQD
	byuivaghOjVDopPth2Jnogr9/XAdxHi+lz45uO7b5ZWBzcKjwp8TicgPiah+7iRe
	Pee9Ujl1uw/c9CHuTicq/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725709712; x=
	1725796112; bh=kA05i1fXhZEAfbPD1jPhI8sd/40p+OHNicYDDwcgaGI=; b=T
	1UsXR4hNzCIOnR9DhgRr8Ea9K9+vPQx8KZYR0VHeiO6mpUBoNFjiuYmPxrv6spB5
	FGQfuGFMXE8bAWp0udo9tuSCC6sVAjurLhAKHXrHwWzbiQ+uxTSWi3VwfDgWih8I
	LOmGB2oBY2Y2SUIKl+rBEHSDvpKvHHse0ultMiReqgeIsAbwteSSwCMZwrO62blx
	NlPkGl936QC0Nzi4sfRzMZFCAzR3Ur0WMJWFXgbAmrg8/k+4mqOGoGIaYDHHf8Ma
	dla94ZLY7sZo/489C0VXxCy/FwjqFk4d7pbPc0Ai02EFWIBqv1r10ui6w1GDsFXR
	zV+18AhDvPnuUrJtDMczw==
X-ME-Sender: <xms:kD3cZlVlkfoC2XC_WGpVEBT1Yz1oPahICE8DlAW9_W4sJCHoijOGcQ>
    <xme:kD3cZlmfRLmYpFr2HlDwmjYpOHitAnLAl4bVO8j5dgJvB_t-1COvIegmG1u_WGLch
    _L72tvsOibTDv9plDQ>
X-ME-Received: <xmr:kD3cZhYnzpRq3Ru2JJ0Zzqx5w6rEPHVBDdVYiWcjvNQ_98qC6nEI2a3kDvYpEeNdzcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeifedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
    necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
    gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenuc
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
X-ME-Proxy: <xmx:kD3cZoXUD_SiRapavan71wv4ZuhU2RaEwXCtro10pyxBXY00OqNWBA>
    <xmx:kD3cZvm-jKDojeXnKe-g8ZBhwSkQ6WMU0tO98BhPLNt9GpxGnIZpbw>
    <xmx:kD3cZlei80ujSsO43O9lVQcXFtdPbzNe9WmLt4TnVaNmfJRwMfZrVg>
    <xmx:kD3cZpHaZ8enZ3nD0VUjP2iEBTEUMNMvyh4U_tlxJa3ZPmY273m4yA>
    <xmx:kD3cZocBdVZ1I8IKaNWC8oq9c8eQMRxZPFNqEXRxSsHIrKOiOlQmxiLj>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Sep 2024 07:48:30 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Sep 2024 12:48:15 +0100
Subject: [PATCH v4 09/10] irqchip/irq-mips-cpu: Rework software IRQ
 handling flow
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-b4-mips-ipi-improvements-v4-9-ac288f9aff0b@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4374;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=4WUwKXY4S6rrZcYJC6tMjl9r4iaCf1PK2jcPhkKx5yU=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQ7tnXr13Bkfu54XZi0ZfPDc6m6cY5uE6/+t+sNtMxyX
 B06dyZjRykLgxgXg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAEzkHAfDHz6egL9XT96VNGlp
 L6h7vtVYYebTcgYB3h1z/5Y4O5/lfs7wh3PW7uA5fdWlRWGM29iuTVxf9GWH78s7UyZrBzB/mPy
 cnwcA
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
index 7b3501485d95..99f9151cc8e7 100644
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


