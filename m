Return-Path: <linux-mips+bounces-5423-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA42B970677
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 12:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55A491F21C91
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 10:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A646415442F;
	Sun,  8 Sep 2024 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="46/Nm4ih";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lVbeeBfz"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C811531ED;
	Sun,  8 Sep 2024 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790830; cv=none; b=Elyv06F/Csv3zk5sqnUCROTrx6Mf21SQeHUqvLf/uQ2l4YZAo9in2c/eMac4kTAKa5cFUuLRC5IdmxOPxH+v6ifqGDVcOCIxaU+G75qk5aAOIFYK3mh4ntFyN70UsJkS8k/xS/7aLno0VTJHL+wTLmU4WHt/2SH8exgjw+EH//s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790830; c=relaxed/simple;
	bh=eIhrStCFhvy6UxtCOWmxnItdfmDtk8eGTHQjAvagVJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJumwScrT7V2hK4EUnRFBiPe5lliIzdh6ZJFkabZKmbmcPiqn3uUwp+haVe8+e4LMedvdCYazrRCAZmwy7jZbKwtTVCvtl/KGXvzly4cpqID4GrSjvO29PtewLbO8ZvxZ9kmUebKaI+KiwHP0FbMjhf/u2hrbnHauz+cJkiuJKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=46/Nm4ih; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lVbeeBfz; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 12C4A1140292;
	Sun,  8 Sep 2024 06:20:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sun, 08 Sep 2024 06:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725790828;
	 x=1725877228; bh=CrRlxBx9BNlgfuT4leF0ZpEwcFYthm6BbRrRIv9TLgk=; b=
	46/Nm4ihxTJqEyK7Kkz+naW3+RJ3x9VJJrIoQ7l5s74T+yyobIAjdOEqL0wLAkQD
	4OyoYUWnkpAH49qF5HhQ0T1DMpIaf6iPdu5kxvMkdpxI8kDOjHgnFpII767WyrCo
	cxiWU/IjRZ9DPFfRhbnfEEbtmKF+rIEmYMz3AML8NwYm+TlUIfsCMt1Ij87pV+UU
	sHoBNb4/lBRSYUgquytVZKhR2Mo6rxW2D8rNkN+aJUGngYY6YLkLYystaB2FufRf
	KGCrt4bHa8aOr4C1AewHzICpIcyrg5kV6fitGsZO3zRboxLG3elHVXfJyYfW7EkK
	rmLg9LQJJ3ZfRFLAYry7zQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725790828; x=
	1725877228; bh=CrRlxBx9BNlgfuT4leF0ZpEwcFYthm6BbRrRIv9TLgk=; b=l
	VbeeBfz7wR0oJ41uU8h/K77DNwIUUyvghtKUZd+lAeHkS0LFmEktRHNq05ZxRoy3
	bQM71iNoBFB9WNdC+qI+B4/trrNFFXHXu19/2ROCpHgg3MGe8g1bNvQEDSBdOXtQ
	eCtTxRpabtI8Hj/BVM/T0KmOayTfc2RfyGz/yUZa5nLxpnv0jo3wVTvDFZ4kSr6z
	DYXV8DyNww+r7mGCNnIW6/pqZzxpoJwQqZM3zKBIpu9ge6TLzGHUpnd3rjkEcSHv
	NPA1+lOXQ8qvd8Nta0ez4RIK0UG18EfHhDoLWU2mw8mCfEK5yJNaOEAKDwN/pPgx
	XxGmksPVI8OA9BCBdkEEA==
X-ME-Sender: <xms:a3rdZhkzTFeV0qv6chV5ILx7WhZAAGdxXSeS1GRvGD1X-q-fhvZ4tg>
    <xme:a3rdZs1TXLKqTDKyz7WHk-HDfFvLAkEG5LnJGhh5sFyIH8cZPq9f07dKNH6stDkts
    ES-V1POatxTB9XmHm0>
X-ME-Received: <xmr:a3rdZno09uInGgK9K4zLx2zJrIcuhBWJnJVQc8VdFji9VBO-cSluq2490GJiDaDd4fY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeihedgvdeiucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:a3rdZhlgVUfcHXNDJp5OzonU3aCjiEOdVloXoE7wN2z51dvYaBkGIA>
    <xmx:a3rdZv0kAJXh05xbAkj-_0Ul85_Bvx6SAKfVlmXaH9CkgpDnQV6CQw>
    <xmx:a3rdZguqbZIQPKuh37yKvts9A10P1noOTPhFQ-PGMzRveUJ7ZQWoiQ>
    <xmx:a3rdZjXaOJ5Fkre6FTk06d_QEEZjFd1GvD18g_FY5mkIPuEFWtFMxA>
    <xmx:bHrdZovwXQiE48qUQX1DluuCA9SNJhF5yziDChPK78_W8npYTQOay2L1>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Sep 2024 06:20:26 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 08 Sep 2024 11:20:18 +0100
Subject: [PATCH v5 07/10] MIPS: Implement get_mips_sw_int hook
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-b4-mips-ipi-improvements-v5-7-be8617dd2e53@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2807;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=eIhrStCFhvy6UxtCOWmxnItdfmDtk8eGTHQjAvagVJQ=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS7VQk715h9OBe1rE9MZ++UvyUaXy1PPS07Urf1ukOKm
 NvUzc4LO0pZGMS4GGTFFFlCBJT6NjReXHD9QdYfmDmsTCBDGLg4BWAiOYwM/+yq386Un+S8apGA
 5qQK09c19lX1V5aX50Xa9Hy8mlrrd5Dhn5EyW7O1Fcen9v9n9+0rsdFlEHjlML82cvGiOa23g/m
 7WQE=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

For MIPS CPUs with VEIC, SW0 and SW1 interrupts are also
routed through external sources.

We need such hook to allow architecture code to get interrupt
source from platform EIC controllers.

Tested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/irq.h     |  1 +
 arch/mips/include/asm/irq_cpu.h |  3 +++
 arch/mips/kernel/irq.c          | 17 +++++++++++++++++
 drivers/irqchip/irq-mips-cpu.c  | 11 +++++++++++
 4 files changed, 32 insertions(+)

diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
index 3a848e7e69f7..6edad40ef663 100644
--- a/arch/mips/include/asm/irq.h
+++ b/arch/mips/include/asm/irq.h
@@ -51,6 +51,7 @@ static inline int irq_canonicalize(int irq)
 #else
 #define irq_canonicalize(irq) (irq)	/* Sane hardware, sane code ... */
 #endif
+int get_mips_sw_int(int hwint);
 
 asmlinkage void plat_irq_dispatch(void);
 
diff --git a/arch/mips/include/asm/irq_cpu.h b/arch/mips/include/asm/irq_cpu.h
index 83d7331ab215..50a99ba2d503 100644
--- a/arch/mips/include/asm/irq_cpu.h
+++ b/arch/mips/include/asm/irq_cpu.h
@@ -9,7 +9,10 @@
 #ifndef _ASM_IRQ_CPU_H
 #define _ASM_IRQ_CPU_H
 
+#include <linux/irqdomain.h>
+
 extern void mips_cpu_irq_init(void);
+extern int mips_cpu_get_sw_int(int hwint);
 
 #ifdef CONFIG_IRQ_DOMAIN
 struct device_node;
diff --git a/arch/mips/kernel/irq.c b/arch/mips/kernel/irq.c
index c3ea8d80e0cb..c79504b12134 100644
--- a/arch/mips/kernel/irq.c
+++ b/arch/mips/kernel/irq.c
@@ -26,10 +26,27 @@
 #include <linux/atomic.h>
 #include <linux/uaccess.h>
 
+#include <asm/irq_cpu.h>
 #include <asm/ipi.h>
 
 void *irq_stack[NR_CPUS];
 
+int __weak get_mips_sw_int(int hwint)
+{
+	/* Only SW0 and SW1 */
+	WARN_ON(hwint > 1);
+
+	/* SW int is routed to external source */
+	if (cpu_has_veic)
+		return 0;
+
+#ifdef CONFIG_IRQ_MIPS_CPU
+	return mips_cpu_get_sw_int(hwint);
+#endif
+
+	return MIPS_CPU_IRQ_BASE + hwint;
+}
+
 /*
  * 'what should we do if we get a hw irq event on an illegal vector'.
  * each architecture has to answer this themselves.
diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.c
index 0c7ae71a0af0..7b3501485d95 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -254,6 +254,17 @@ static inline void mips_cpu_register_ipi_domain(struct device_node *of_node) {}
 
 #endif /* !CONFIG_GENERIC_IRQ_IPI */
 
+int mips_cpu_get_sw_int(int hwint)
+{
+	/* Only 0 and 1 for SW INT */
+	WARN_ON(hwint > 1);
+
+	if (!irq_domain)
+		return 0;
+
+	return irq_create_mapping(irq_domain, hwint);
+}
+
 static void __init __mips_cpu_irq_init(struct device_node *of_node)
 {
 	/* Mask interrupts. */

-- 
2.46.0


