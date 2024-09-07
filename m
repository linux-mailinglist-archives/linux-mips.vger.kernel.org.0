Return-Path: <linux-mips+bounces-5401-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51929701FD
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 13:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 800B7283795
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 11:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5510A15B10B;
	Sat,  7 Sep 2024 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Ffhlocie";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gYRQR6By"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E7515ADA1;
	Sat,  7 Sep 2024 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725709704; cv=none; b=kMZLRG2xqZPVl7WRaeMkIDrwe5pf/GGCUWBT9+7AAQL7Yka4o0lyPz0uGaF4M7RmiXknNMUIo11on0LxGb6PF7OEOXBcVbKatU/f3nfWYS2AQWPhTLbSj/KFRozb++rDXovI+pDOGHe0Mn1hd2yJYadMCf04gqc7PRattGxcu1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725709704; c=relaxed/simple;
	bh=58n5oftC2DnQwV0ikeHMBkl408v+iyUjhXM5NNBBF8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g7b7khGYyqsgRqgajYKqb/+mks9H020t1OcwBfRpG3uefWkVZc2gbP2ktOH8FQ3q8l7+XtieDl9rPBLjL/OuXVSDUQ6wNk3j7ffLzJR6tgVFXRE2aaLtOxT8n3cNLHEIT5Xy1s2dqCCMsXv/KbV2LWJczp/y/J70rDYFFIq+URQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Ffhlocie; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gYRQR6By; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A6B2011401A4;
	Sat,  7 Sep 2024 07:48:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sat, 07 Sep 2024 07:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725709701;
	 x=1725796101; bh=UQirE3E0tG/YLAxLIT4NHU72WgW4GIoXMBPlaai6CFo=; b=
	FfhlocieXvXrAKFImXyBisqc5AJZyIdsurC+20JWKXTRIiGmY8VyFOofXIlCErLB
	ZJ5ZrdXWK7Arspjbd/Lpi7S/8aC5QeG5ivhFQnfgnodKnvwW0edHZ9AfMfsM6er8
	FwDVj4319a3hRcFkMoE4z2iQNrYcEPWk89oKBthzFAKbZZ4/hOWojG9n0eLxtCXa
	vtU8YGy1vS6qIprIQh99Er3OudoJ1gT256K16nwHNt36INBozp5z+mTIIyU0178S
	rDpRXu2B5xI/yOfWJrGo7ye7LlHwlZ/3+6HwWQBLnKSGqkp2q/Pe58RYP6wsZcCQ
	T4N5wN+vXtX1wT++D+Hppw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725709701; x=
	1725796101; bh=UQirE3E0tG/YLAxLIT4NHU72WgW4GIoXMBPlaai6CFo=; b=g
	YRQR6BylmK2+7eZVm894FTODcKUzILzTymQbJUGBTV/JqIePLYP2xqaIPz4eGJFA
	DEQXm4ks5LRzQvOb5pd+CV3VyOKOjD58UigRDRsUIpfZ7Pk8m2YIZs3yHw/exzAO
	n7NtUJHohFWM4AgfPzE1Y2OQ7ljqzXZibut3atotZH89xlZx13QwZydr6KTc19gN
	3FNs1dYlmCVYEgJ/b4KCxh349mJ/FEH+cDmGyaofX03/Xd09Kq7SQqEKU/p0T0GY
	sRCG0fYWl0vxCi6l/sVxQ+JKC34ShQ9Li0r4mZRgYIKiequKq1A/OVbLMsIKYk9s
	/UKha8ohx96B+m++0l9QQ==
X-ME-Sender: <xms:hT3cZmcpGznmql_oGiGAb66xkNp3Y2DFdFTQWml29JDE6X-wo1dnUw>
    <xme:hT3cZgNHrXykqnO7H6Ldbq40Ifi7on1CN3Ed55QWNtDDO1WAWbUeon_dtQTbckm5g
    LfJyzwisnefecoPS2s>
X-ME-Received: <xmr:hT3cZnhGuMvex-Yx37_nOc6BaLEqgujOMGFJgZOX_nYFFiz1phuPf_DuYWt-izBHLNc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeifedggeeiucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:hT3cZj89SZgekJEvjaXd8CMwoUqVCmSiJQTSzmfnkezc1rIvlZ_5vg>
    <xmx:hT3cZityjfjsoAajav3h3xTRQ_14b261rBzvR5bIHl1BVvq6TpIXmg>
    <xmx:hT3cZqHaVvPwgheHJXkwrHv4C-ChBa9ZhGLIRgc-8CyuxzSvmvzd6Q>
    <xmx:hT3cZhNOcUFhnuMv26bQgvsPRvP9qvz15OYmbIhhZABxp9ZbKC3fxw>
    <xmx:hT3cZjnlsKJOvUiVO3giBpfEse8YIS04GiApKaRQpF-huClhOEgrZCTK>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Sep 2024 07:48:19 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Sep 2024 12:48:08 +0100
Subject: [PATCH v4 02/10] MIPS: smp: Manage IPI interrupts as percpu_devid
 interrupts
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-b4-mips-ipi-improvements-v4-2-ac288f9aff0b@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3252;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=58n5oftC2DnQwV0ikeHMBkl408v+iyUjhXM5NNBBF8I=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQ7tnX3hAqfmb4v+itg26nrM/WL2/I1tyNN1q/7WTZtK
 7PpHOEHHaUsDGJcDLJiiiwhAkp9GxovLrj+IOsPzBxWJpAhDFycAjARFl5GhnuO2aJ1LJKJyix/
 /vMF/ttXsPIL8+v3AW8frzOJW/rBo4mR4WvjfJPFnYcvGIq9nG67Y90fIRPmT294Zs9e2MmxLew
 RGxsA
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


