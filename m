Return-Path: <linux-mips+bounces-3700-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A2F909FD4
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 23:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C3FC1F211EE
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 21:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0979771B52;
	Sun, 16 Jun 2024 21:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Fa/P4nxz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TQkWxUSO"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA8771748;
	Sun, 16 Jun 2024 21:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718571823; cv=none; b=Tm08bbNuoBPajGplD+H5xm7JRpBi4qXD0H6wPMhm9dG4Njv923Fr88QMib9IziyKNYFRCQZbFJ0M0ylwHbQFuswVxl2J2i6oVhOenuivhNhfJFv/UUDCQlkuUd5OEci5eM6ykqo5Kl4p7f36pkn0NTcDXSMlLtGodhGR3m3FtaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718571823; c=relaxed/simple;
	bh=u+nlZJtxY8gepbbEz7ezIh6OtiFEwscjcqdaTX+j0L0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M+0SA9TGwwAoqISAiwr3b2p0h8A18e6NF4AYCHMamvVFI4FCHGDx4r53+ITxiO4pZD4WYVcSv/O/mt8RIswziEYw0LsR3yC/tN2KCU2bXFis8QH5P46BWTKuOCoADXfHEMM27WQbeqWaXTUnUslJi2IiY8sLT9OU9NrB+bzogSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Fa/P4nxz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TQkWxUSO; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id 3EF551C000BB;
	Sun, 16 Jun 2024 17:03:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 16 Jun 2024 17:03:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718571820;
	 x=1718658220; bh=hnMTOGvhtZ8qp0qPzOnzDl3VInIwtcNEpdbf+QJCiW0=; b=
	Fa/P4nxzvsNM5kyzQYciBPKYU2dZP6VoDAxtCzLO0DsaLfXScYFvM5OFWlIyFJCY
	CoBtjy/ltKJLQ4wHmzeQTks7ynnGSHJ7ITacZfd1iji7KdbzX2bJpCZ68CIoDQ/n
	qgRX6RrrvHREdgVLsLN7X22nRu2RISqgje/epa1uhDFsOgXkQ3tJl1j/kGuqnag3
	CFVqiIUYqRpf1QO4N/8fDlbg/SwgLdBPwAwaaRMbBp1Dc7q5EI8Z5XC/6FtaePq3
	1jl5I7wDCPzzxS5eP+Wg0Y+3KRkrYQdueel71ChZfWc4XDwM3cHEbMP5032Dez5f
	1ndYbrAeX/RbdpolFCB2Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718571820; x=
	1718658220; bh=hnMTOGvhtZ8qp0qPzOnzDl3VInIwtcNEpdbf+QJCiW0=; b=T
	QkWxUSOOQWzI8YbGKcrlpULEAY4bsxozxRztnhBAbWO1FfcYhS+LYbP2H/9kcvgd
	HmjT5JDqlEM6To+HlQ/facLmnaJNFdnxtBXBDIC3/JeY8KNlPeNBRpkSvS+0hdUC
	0jc5suJ7wUlDk/l2Vu3jc4d6EOkIwBbhYvzCfH2ZitMBSrG++CFO2ZDgMm69CNd4
	8xhaPDglzvcOa1731toB4tNMA2SNgkAWpnI3YKw2Zkd+8qXSQHW46Z2JAJeJVR5O
	sJKmTt2DUL4kS3q7IC2mTRcJc74+yp79/OSSMQvhW0f0Lv9eGh7wkLjLo23vcyWF
	Cft1c8kCWgzTC/QBVAwsA==
X-ME-Sender: <xms:LFNvZtRoTOHNXjuSqLTxM_vjGUFxR2N-WKL1QmJsUfa9Sa-kJZUC7w>
    <xme:LFNvZmw2HVckGc-3_TLMieCOSXrnmawic7C-Ll3qewewseJ_ahKP5xdXJBbxD9R8Y
    2tN1zHY3780Qu6Gd9c>
X-ME-Received: <xmr:LFNvZi2MRSE6oI7PCQ0dV8Xxr1sds2ikBprxbDyClnMAGKi_1C7U6rU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefh
    ueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:LFNvZlCJ7CrWAyKlt_fZ6rwYRmReRjBY1LeInqBavpFm8JtwkPqd_Q>
    <xmx:LFNvZmgbGPzFnhrKp98oReQg2W76JhT4Ybyqq_PyibbegSvP4C7DBg>
    <xmx:LFNvZpq3qfMeWEnECuEgEB09YGu-LLWnugRz8qm_Ht4zDadhUwHFew>
    <xmx:LFNvZhgazXosCWANAZB1YIyTWSr8PseC0ILjoS-MQGpWI527zAIqEQ>
    <xmx:LFNvZrZX3C3bVGg_2MXzgesaUgENgL1oITM8bE5TSSSZlTXybGmUzD8F>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 17:03:39 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 16 Jun 2024 22:03:08 +0100
Subject: [PATCH 04/10] MIPS: Move mips_smp_ipi_init call after prepare_cpus
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-b4-mips-ipi-improvements-v1-4-e332687f1692@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=u+nlZJtxY8gepbbEz7ezIh6OtiFEwscjcqdaTX+j0L0=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrT8YPlNpbIzp+7JuyQ1daPbkpyISUzP9xm+6T7zvEwok
 /tekvTqjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZiIhgHDP5XlsW2FX9JefndR
 YX3A0v29iLUvxTFX3k97/XJu7ryvPQz/rLv6l/05qyD+xaLVqlWmkvlle9LF9X+n3J1mrXpV+xo
 vCwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

This will give platform code a genuine chance to setup
IPI IRQ in prepare_cpus.

This is the best place for platforms to setup IPI as smp_setup
is too early for IRQ subsystem.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/smp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index fe053fe52147..ddf96c28e2f0 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -375,7 +375,6 @@ static int __init mips_smp_ipi_init(void)
 
 	return 0;
 }
-early_initcall(mips_smp_ipi_init);
 #endif
 
 /*
@@ -460,12 +459,22 @@ void __init smp_cpus_done(unsigned int max_cpus)
 /* called from main before smp_init() */
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
+	int rc;
+
 	init_new_context(current, &init_mm);
 	current_thread_info()->cpu = 0;
 	mp_ops->prepare_cpus(max_cpus);
 	set_cpu_sibling_map(0);
 	set_cpu_core_map(0);
 	calculate_cpu_foreign_map();
+#ifdef CONFIG_GENERIC_IRQ_IPI
+	rc = mips_smp_ipi_init();
+	if (rc) {
+		pr_err("Failed to initialize IPI - disabling SMP");
+		init_cpu_present(cpumask_of(0));
+		return;
+	}
+#endif
 #ifndef CONFIG_HOTPLUG_CPU
 	init_cpu_present(cpu_possible_mask);
 #endif

-- 
2.43.0


