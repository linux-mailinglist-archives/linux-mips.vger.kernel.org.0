Return-Path: <linux-mips+bounces-4840-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F0294DCD5
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 14:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F8561F21AB9
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 12:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB4A15885E;
	Sat, 10 Aug 2024 12:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="e+uoYmjW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rEEqiUcZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F3D15855C;
	Sat, 10 Aug 2024 12:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723293559; cv=none; b=qT3zq9jmXBPQd5MWukw7HMr4b2kT4Rovjt6ZrX5jmv0bJ3d7VTLDe3wGaRoce5w91MAKCi6iTnj5ZjPNfO3M17zKbNx7PNnr009Y1Ey856HmjrE8q1Guz0wSVZJZJ9rtso+pR88d/92JUrwrnRPCtPQKebGaCP+s7Dt7LBKxRIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723293559; c=relaxed/simple;
	bh=58n5oftC2DnQwV0ikeHMBkl408v+iyUjhXM5NNBBF8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MxxdMsDNPTieDrj63UUDmm6zhrZlMUZS97yLDTtwUuJ4AuUcNwqAl5ZQ7yjxnLlai4WdPv+KMo8MaEZw8rYH8MEth9Lw4la5cKFfC+0pEdcHNb5uUZiLOwg+kHuyoGddZLaCM7ki2Utn5rZL9Mu8wRJtL2WnxKItgmzrTWHHv/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=e+uoYmjW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rEEqiUcZ; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 99EA411520C6;
	Sat, 10 Aug 2024 08:39:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sat, 10 Aug 2024 08:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1723293556;
	 x=1723379956; bh=UQirE3E0tG/YLAxLIT4NHU72WgW4GIoXMBPlaai6CFo=; b=
	e+uoYmjWuFHtaskjKEBpFB7Kac8ICXmggrMs3dnpr4bLjGmVXe8gDryacBPVHb+I
	QpnhHu5WnCC7grnsZMLRyfkbTpVqQIF0jr5AxZkajF8aT2IO2K1sF9s1cCfMhoQd
	VJSD5NsYuhlRN0Pz9xuou+9JcA0gwMfmrRwRgeccZXlwLbVyCwRaczN2lqBrO9VG
	KWg3pw10rUdCuJIDPnre2pm/ELUua78Q7IBSkMJ5++Jfiz2Z1souMvA23/5hxdq+
	U9qa0+obKQiytj7vAAEflHStBKpuWBE5UxZmWCW5UJWd7TKri3iTL5jaqDEkpap/
	Tb6VUBEYikreua+9bL4iFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723293556; x=
	1723379956; bh=UQirE3E0tG/YLAxLIT4NHU72WgW4GIoXMBPlaai6CFo=; b=r
	EEqiUcZAVi83QixsXLjoqvY1O2tOFyBYa87LCSr44wac2QPAQcJQTgcQGD+lL2T4
	3OSEaVT/ppHzvRXFsTGxFfDqjEVd6P9+MCIPresYNRdvZUKB42PtM/SI9CWpVFRl
	A3YCFsQy69EL7Q2753e7AEbIzl+3/eiLkmohK1Z3ORfvOnhUxSK3miZlfJo3HvVk
	LfzLUuuagG7NSza0Y6PDwGn6CxMn1EhZWx8Ki7tQp6Wvv9cCbn7RXBiAs6ryLUsB
	zLg/sNO96GXjSbYekhlunEHDRsrN+qfJMYBqCm1691Zhk/4Vr+gyQW+X5jGDmFOO
	plbPXTXCaY+EfHvLDHG0A==
X-ME-Sender: <xms:dF-3ZqtQb-X3qlv7FTzzYWwyvwmCWfBrMfGbRxeJYRuMMzi6KSP5Tg>
    <xme:dF-3ZvcWeaKpaTIk94nAlCFeLrSxWMCnOIZBWAxrusI4PGoFH6sl9sUOkpWzyEQeY
    3K57GRHbhW8NY2FP0A>
X-ME-Received: <xmr:dF-3ZlwJRU1wfDjIWSBkjuiKxpf1PnIeQ-eF-Q013FNgizTpVvSyjQ_1SnZockT0-w>
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
X-ME-Proxy: <xmx:dF-3ZlMQgZqFlEl0fLQH4FtBBQJeWZ_0U4MOabAbmFV3M8E0BclJKQ>
    <xmx:dF-3Zq9JZgDvIsBy8fiAQ3-W-6oD7nqziQSF76Sgk0vZKJdhh3GXcg>
    <xmx:dF-3ZtU1-0Fex1hByGnWbEANqdVJffTCZHiNaKN2m69xERa0QQ5sHg>
    <xmx:dF-3ZjfbTJPQntdKSLcH0wQclJ6v4ZF75RPTN407N2uATIPVwrzFoA>
    <xmx:dF-3Zr2lPnpCoQUKI6stZpkCm1041lTGfGPaQ7Qq5FSJHCsv5hgv9VIl>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Aug 2024 08:39:15 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 10 Aug 2024 13:39:07 +0100
Subject: [PATCH v3 02/10] MIPS: smp: Manage IPI interrupts as percpu_devid
 interrupts
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240810-b4-mips-ipi-improvements-v3-2-1224fd7c4096@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3252;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=58n5oftC2DnQwV0ikeHMBkl408v+iyUjhXM5NNBBF8I=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTt8flTHZc+Er1ZPyvz0vq6hGzPqydM3maqnY3oKrind
 uGVWOvGjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZhIkiwjw93ip2rXvp/IfKfa
 +12VffGK9QfOfv+5SfdhyuqCyMQ/wvqMDO92GjJzPrm2NG8P/8l5fu6G6yXmxXwQXCErvqpjRtP
 lFUwA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

IPI interrupts need to be enabled when a new CPU coming up.

Manage them as percpu_devid interrupts and invoke enable/disable
functions at appropriate time to perform enabling as required,
similar to what RISC-V and Arm doing.

This is required by generic IPI-Mux and some IPI drivers.

Tested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/ipi.h | 11 +++++++++++
 arch/mips/kernel/smp-cps.c  |  1 +
 arch/mips/kernel/smp.c      | 26 ++++++++++++++++++++++++--
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/ipi.h b/arch/mips/include/asm/ipi.h
index df7a0ac4227a..88b507339f51 100644
--- a/arch/mips/include/asm/ipi.h
+++ b/arch/mips/include/asm/ipi.h
@@ -29,6 +29,17 @@ int mips_smp_ipi_allocate(const struct cpumask *mask);
  * Return 0 on success.
  */
 int mips_smp_ipi_free(const struct cpumask *mask);
+
+void mips_smp_ipi_enable(void);
+void mips_smp_ipi_disable(void);
+#else
+static inline void mips_smp_ipi_enable(void)
+{
+}
+
+static inline void mips_smp_ipi_disable(void)
+{
+}
 #endif /* CONFIG_GENERIC_IRQ_IPI */
 #endif /* CONFIG_SMP */
 #endif
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index b7bcbc4770f2..6845884086f4 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -555,6 +555,7 @@ static int cps_cpu_disable(void)
 	smp_mb__after_atomic();
 	set_cpu_online(cpu, false);
 	calculate_cpu_foreign_map();
+	mips_smp_ipi_disable();
 	irq_migrate_all_off_this_cpu();
 
 	return 0;
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 62be2ca9f990..9918bf341ffd 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -186,6 +186,7 @@ irq_handler_t ipi_handlers[IPI_MAX] __read_mostly = {
 };
 
 #ifdef CONFIG_GENERIC_IRQ_IPI
+static DEFINE_PER_CPU_READ_MOSTLY(int, ipi_dummy_dev);
 static int ipi_virqs[IPI_MAX] __ro_after_init;
 static struct irq_desc *ipi_desc[IPI_MAX] __read_mostly;
 
@@ -225,13 +226,29 @@ void mips_smp_send_ipi_mask(const struct cpumask *mask,
 	local_irq_restore(flags);
 }
 
+void mips_smp_ipi_enable(void)
+{
+	int i;
+
+	for (i = 0; i < IPI_MAX; i++)
+		enable_percpu_irq(ipi_virqs[i], IRQ_TYPE_NONE);
+}
+
+void mips_smp_ipi_disable(void)
+{
+	int i;
+
+	for (i = 0; i < IPI_MAX; i++)
+		disable_percpu_irq(ipi_virqs[i]);
+}
+
 static void smp_ipi_init_one(unsigned int virq, const char *name,
 			     irq_handler_t handler)
 {
 	int ret;
 
-	irq_set_handler(virq, handle_percpu_irq);
-	ret = request_irq(virq, handler, IRQF_PERCPU, name, NULL);
+	irq_set_percpu_devid(virq);
+	ret = request_percpu_irq(virq, handler, "IPI", &ipi_dummy_dev);
 	BUG_ON(ret);
 }
 
@@ -343,6 +360,9 @@ static int __init mips_smp_ipi_init(void)
 			return -ENODEV;
 	}
 
+	/* Enable IPI for Boot CPU */
+	mips_smp_ipi_enable();
+
 	return 0;
 }
 early_initcall(mips_smp_ipi_init);
@@ -383,6 +403,8 @@ asmlinkage void start_secondary(void)
 
 	synchronise_count_slave(cpu);
 
+	mips_smp_ipi_enable();
+
 	/* The CPU is running and counters synchronised, now mark it online */
 	set_cpu_online(cpu, true);
 

-- 
2.46.0


