Return-Path: <linux-mips+bounces-5418-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB34A97066D
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 12:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ECCC1F21D63
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 10:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4637D14D71D;
	Sun,  8 Sep 2024 10:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="rlzUsJnh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XMVp9hIS"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0C914D2B4;
	Sun,  8 Sep 2024 10:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790823; cv=none; b=RIA9UP/TzNMOi6ybuvDj5Aj38Dr0BnkhRX14QvbhVau8fK7gcNUWl0XThY6v8MyJYLJyQFMxUPvFWuxTH5GALyZ8XkEj8XPhJY8YoQbBRYmgn/rU7HOjcQcC1QOw6aphsgoMLPHf6pr9lmWupMKwwRL3JuzYtSvyhsTpw23o90s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790823; c=relaxed/simple;
	bh=58n5oftC2DnQwV0ikeHMBkl408v+iyUjhXM5NNBBF8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qkVUNIPUAl32jo8i7cTauG8n8HMbunert485yPlzgp+olZNFwRw1AfyBwvrDRjYObnt/CI/b5R+TzU+IoIOKl4HhsHDY6zrm4mzmI1TPiocL+mYigQK+ONvTqpPWfU9XUDVW3wAbWBlWpOTKN0keAy5eMFRViZN6J7mZEyQs4Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=rlzUsJnh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XMVp9hIS; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id B0B8B13802F0;
	Sun,  8 Sep 2024 06:20:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 08 Sep 2024 06:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725790820;
	 x=1725877220; bh=UQirE3E0tG/YLAxLIT4NHU72WgW4GIoXMBPlaai6CFo=; b=
	rlzUsJnhBKZwx/JqeYjaS4wnowXSD3lGmZ7hBUtED/RbgIFkjS164Q+IsGWzUM5z
	7h0pJ6Oq3YUnZEF/+mdtH5WqIrBkmcZPdExQMlBwuVo88jsCFO3pUVZjdRhWKJvJ
	UVPLfukjNyn+ZW/c7rQLHmTw5e3LMuFoo/4o+9GZxD/rr+48PVZNP8iuKPQ1s0nF
	JhC2/VLoVxluj2HzB4DRoJHGHPp8mZ3CQWsgl4ySwihzr0iFO4+P6yTU3D3O8SL7
	U5hDM6C9auaXE5AOXe95CivcWZpoyA/cr+NBm8uK/HTLepK6u7bmxGafHAzuc5T0
	rHy45s0shS8PCSyYFmaFQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725790820; x=
	1725877220; bh=UQirE3E0tG/YLAxLIT4NHU72WgW4GIoXMBPlaai6CFo=; b=X
	MVp9hIS9XLCMbQOScXt0oQHNVaiPwN5ao66kvQR9Ysw573O1aS7ID021ieRY7HXa
	eTSB1BmfTa/o6hT6oKDCOgMfwRJhhA6yfkb/bGhaDS06JF2eOxMiuV6bCvarnZop
	gA48q4MqBacfHbob1GZbLLshK/BYNQLXzOlyKkoI6OTS5CdJCQITVoYDOpij+1V9
	z2UOlmKha4ZbveN+wawWGSLJE92YKFwWLP/yxW+vZ2Y3JCano9O5zsYjaLLqKjI1
	mc5MX7ntodBaZJ/PQt/7RY+z/Tt032D9GrujVG0+u5DsUF2zvh1z9VPeFhBrjozt
	RRhGKlPUcAAIwO+pNJuDQ==
X-ME-Sender: <xms:ZHrdZnqh_j4Y-HP1taoHlE9xfrkBhL2JNsoQ_TO3EKXVLX4wrwW5ug>
    <xme:ZHrdZhp57IfzGSxQ3quVn7AVCqOhTIIeYoFamcRiMeLmu4NrdSjW9RFb3aSmlZLL9
    XOASNdgAjgvKgoTaDo>
X-ME-Received: <xmr:ZHrdZkNE1XsqsbpbKn6LKTrPghyGfNPB1LjnT4OVpVXnFC5_dEdg8Qjdh-klu5DBkOA>
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
X-ME-Proxy: <xmx:ZHrdZq6uyaH5vUAvyHkmwBtxg_TVu1nZx930n1cPCQZ8147aOErTaA>
    <xmx:ZHrdZm54ez4D6ob5azy4ovJSlRk_MimaXT-m29b6fgONlW7Y5ZEO3A>
    <xmx:ZHrdZii3E3Mxg0TqtiZJwZa_fn_ShOjPMkTJijcNzIdVin4GVXqgFg>
    <xmx:ZHrdZo59cLHoLwu9tOijCcz-Cq1Y0PI4mSNCjpRZkr7FG53xf3M-wA>
    <xmx:ZHrdZjwCiTZtHyoziZ5CdNGo_ufBN5iMkR0kA_r3ckbUVPy0tuYAP62->
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Sep 2024 06:20:19 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 08 Sep 2024 11:20:13 +0100
Subject: [PATCH v5 02/10] MIPS: smp: Manage IPI interrupts as percpu_devid
 interrupts
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-b4-mips-ipi-improvements-v5-2-be8617dd2e53@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3252;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=58n5oftC2DnQwV0ikeHMBkl408v+iyUjhXM5NNBBF8I=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS7VQnlCcL103ur0+ZoHZTlbK+ZvTgt57jk/okb/m7m/
 WjRPdGqo5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACZyQJuRodVp9wWv92aNTjGB
 W6bnfle8Hyyp9C3ocf8Jj6t/fk4qvcvwV6pKPFWG17ttkkWwS8/hl10BKikztcQfpzJOrVetfCr
 DAQA=
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


