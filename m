Return-Path: <linux-mips+bounces-5407-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE8597020A
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 13:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDC231C21940
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 11:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572BE15FA7C;
	Sat,  7 Sep 2024 11:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="1wyb4qLs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="r8c97WPm"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C754615ECC8;
	Sat,  7 Sep 2024 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725709713; cv=none; b=NMPOv98i+G8R/fITn+Xsx7pZNBYO5mwCoazOqJUu3q4uj5NTjPTtseE++CjtMus+uBPpFYCGUIZzCJPeS3O1qDWGiNEKsfxavzKQya/VtZtnMr+3fergNKCir8WxIcPaZXAxh8AZx9WquCrGe5H9jvM+hO3N1d9P1eWxWeP13sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725709713; c=relaxed/simple;
	bh=FZsZgMo0PlKhdv7fIPEiO4rijAlOP5RWzA8dZssIKZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UlK0mi3u2jsfuPC0o29oE1OXlxKpAPgWrrStnzCOb/YAMFLSdHXcXA67+7JoSjKJWJF+rfMtlIZiH0LpC4DFKPTGAc6V4DHCZJaCv7qW+JYFsqOjeHzFMz5qC02XEDC3RqaX61UJTsmH5DTaa8ePoy9hikGl5r4koJHuvIEixQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=1wyb4qLs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=r8c97WPm; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C934C114038A;
	Sat,  7 Sep 2024 07:48:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 07 Sep 2024 07:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725709710;
	 x=1725796110; bh=TD23Dk7CP3pr5Nxa9Vsf3EzqXkorQe0K8fg3rzSx+pU=; b=
	1wyb4qLs6I20HmuUI9DFUwtiAiyUIPYtETv56XmxKJo5TEHLupehfxSYocjeOgfe
	ULPta46SGkJDjsD9rwdTf6S1C+8xrdQRhxF6F6F2gQ9LI2YU9EmuEy1IlS1EwuK/
	TS6ephdBjuY9eo3yu0Q9jCYsulBI9f51Qtxv+0lTs2VmUWwILWQJmc/lpSE1QhlY
	xs1oviXJIeyy0GV0fDp7fL2GbvF7VuAH9uhI2B6pdDD98UP8k0rjceWIMQ6L52tK
	ii4N1Bm+WDkHSbApDAq8k3cdCxX8lAvcyLmN3BnPd6nVIbTXfUwXDZjQFu2pA05A
	86026e/vu+FRr6n1jFKpCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725709710; x=
	1725796110; bh=TD23Dk7CP3pr5Nxa9Vsf3EzqXkorQe0K8fg3rzSx+pU=; b=r
	8c97WPmx7xBvmOVM9ILJXO3baNtESCLZhtknwwLE8xLiCRtz84dwifC3yxqSZue4
	iJrtJ3cYzXhJIkgNFl/qJ/fcQcISCbPaM5I15rWh2G0tR92e802sR3DGKNqb34Rf
	spJLqK4aZAJfIBoxXj4hHREAq6keexnETDMQZf52RTcLq8A9yi0UEXdp1yW7D8cX
	PyawY9Togl4uWEW3KUdCS18JRadekQOnbz1dShiVFyD0gGW2VUe0Jn/8DYExz/DL
	zG0y+dcoJogMHVHhyco3bVY4kZ770C91B1HfekP8z3dmawD4rO65XlhpPfRUqPFm
	+AXxQhZ458d/GLZlwaxhw==
X-ME-Sender: <xms:jj3cZqeq8XuiZAFoNCOUSsPb45EubCP_eR9pC-v-k7up--T9I8dydA>
    <xme:jj3cZkPPIVGoUrEDhr_xwoWc_gRQJiVD0aUcDEfsBbaIHNt8_1Nw2W1s95MroJBmK
    hOvqw644udHIlfI02w>
X-ME-Received: <xmr:jj3cZrjJvw6hwnj9w78eFOjkzM8HC7KMb8ll_SSUSmXgeIvHEnXEjwqWhWjGcloob_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeifedggeejucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:jj3cZn-fZ2EbSQ1Q1p-DKnHYHEa5cQ-PkBL6Cb_HgTkXr5oRJACfkw>
    <xmx:jj3cZmvHwvkuhyVrH320h4ipVpnd5ui-JAuAnfusAk9zKrUWWOG1Uw>
    <xmx:jj3cZuGmo3gDfSnnqRBw1vfJ7kX68CrwBJ6A6w8jCRj-YsgbiLoFOw>
    <xmx:jj3cZlPFpc0d7h-LidG7xQmA10rROhoBMkETcBFL9it9OBXtlPBI6w>
    <xmx:jj3cZnkK5vw-6Un-FVZEdvv35teNkuxbfePhe5H9oIt2oBXU8ujOwZQP>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Sep 2024 07:48:29 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Sep 2024 12:48:14 +0100
Subject: [PATCH v4 08/10] MIPS: GIC: Implement get_sw_int hook
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-b4-mips-ipi-improvements-v4-8-ac288f9aff0b@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2526;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=FZsZgMo0PlKhdv7fIPEiO4rijAlOP5RWzA8dZssIKZI=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQ7tnWKT9k2B58UkNkZEBbWwd8070JG8Pv7t7Y7TNgo3
 7fhz5EbHaUsDGJcDLJiiiwhAkp9GxovLrj+IOsPzBxWJpAhDFycAjCRTR8ZGS41JSuXss6dfUSr
 8sFOlf8MXmyWi6YEiN61v+FXt3hexWOG/zEK2x8kRLF8Fzv7seyR2dHQnFeOH+8JuO85muejvtX
 2Dx8A
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

SW0 and SW1 interrupts are routed through GIC in EIC
mode, implement get_sw_int hook for GIC and generic platform
to create IRQ mapping for SW0 and SW1 in such mode.

Tested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/generic/irq.c          | 15 +++++++++++++++
 arch/mips/include/asm/mips-gic.h | 10 ++++++++++
 drivers/irqchip/irq-mips-gic.c   | 15 +++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/arch/mips/generic/irq.c b/arch/mips/generic/irq.c
index 933119262943..bc3599a76014 100644
--- a/arch/mips/generic/irq.c
+++ b/arch/mips/generic/irq.c
@@ -11,6 +11,7 @@
 #include <linux/types.h>
 
 #include <asm/irq.h>
+#include <asm/irq_cpu.h>
 #include <asm/mips-cps.h>
 #include <asm/time.h>
 
@@ -59,3 +60,17 @@ unsigned int get_c0_compare_int(void)
 
 	return mips_cpu_timer_irq;
 }
+
+int get_mips_sw_int(int hwint)
+{
+	int mips_sw_int_irq;
+
+	if (mips_gic_present())
+		mips_sw_int_irq = gic_get_sw_int(hwint);
+	else if (cpu_has_veic)
+		panic("Unimplemented!");
+	else
+		mips_sw_int_irq = mips_cpu_get_sw_int(hwint);
+
+	return mips_sw_int_irq;
+}
diff --git a/arch/mips/include/asm/mips-gic.h b/arch/mips/include/asm/mips-gic.h
index fd9da5e3beaa..3e9d1b252500 100644
--- a/arch/mips/include/asm/mips-gic.h
+++ b/arch/mips/include/asm/mips-gic.h
@@ -388,4 +388,14 @@ extern int gic_get_c0_perfcount_int(void);
  */
 extern int gic_get_c0_fdc_int(void);
 
+/**
+ * gic_get_sw_int() - Return software interrupt virq
+ *
+ * Determine the virq number to use for SWINT0 or SWINT1 interrupts,
+ * which may be routed via the GIC.
+ *
+ * Returns the virq number or a negative error number.
+ */
+extern int gic_get_sw_int(int hwirq);
+
 #endif /* __MIPS_ASM_MIPS_CPS_H__ */
diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 53c585d598b9..57b8deb40489 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -152,6 +152,21 @@ int gic_get_c0_fdc_int(void)
 				  GIC_LOCAL_TO_HWIRQ(GIC_LOCAL_INT_FDC));
 }
 
+int gic_get_sw_int(int hwint)
+{
+	int local_irq;
+
+	WARN_ON(hwint > 1);
+
+	local_irq = GIC_LOCAL_INT_SWINT0 + hwint;
+
+	if (!gic_local_irq_is_routable(local_irq))
+		return MIPS_CPU_IRQ_BASE + hwint;
+
+	return irq_create_mapping(gic_irq_domain,
+				  GIC_LOCAL_TO_HWIRQ(local_irq));
+}
+
 static void gic_handle_shared_int(bool chained)
 {
 	unsigned int intr;

-- 
2.46.0


