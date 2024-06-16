Return-Path: <linux-mips+bounces-3704-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB7C909FDC
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 23:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 741BD1F21255
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 21:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956F978C95;
	Sun, 16 Jun 2024 21:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Jx8lS8jg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M4yGCOW2"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136C4770E0;
	Sun, 16 Jun 2024 21:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718571835; cv=none; b=WL0kppPOu/JakdwqbUGTA3WKHj/1rCHhyzM5nqdpTigPncjTLU8uL31/m+Hj/BAygB20b/HaRxFgFhaK9LibwTyR1NL0f88e/qcyzavNscuMuYTmIRDyeKb9ERJygGVYDGkh5yiFczVqIVTdi93JgflPIlTs8x9kQFUdhb0nLAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718571835; c=relaxed/simple;
	bh=M7QLa/e1lk3STQUI3hDEqiWEkdYQ/BEky6bbW4aA6gc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g0Q0FbFcSCc6ECoalBAvLPHoR/AO4E2zlOuIP/l3xg4xw87LYa5oUah060u6KNQOEQP/z2oXlKo/WimknMsakKcVTTue+4VmHehJ63UaVBSd3yGSueRxsU+lbMLzk4evVzmR3CJBUUvphq4Aaj86Z/DnPLYYUKMJLy4SXar48EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Jx8lS8jg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M4yGCOW2; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.west.internal (Postfix) with ESMTP id 8D3171C00096;
	Sun, 16 Jun 2024 17:03:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 16 Jun 2024 17:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718571832;
	 x=1718658232; bh=ntsitKeg5CsLfeZpSVRZzPRKq1noIPQvxwa7wZoq0QM=; b=
	Jx8lS8jgU0MYxmaRAlGEz1VZ0qeGv6uolEPGMKlgtUSkT7zQvh+vLO1Qi7/yJHCU
	rxbxA63nhwhpq+Q1cM3rsPIDG8dsBEJqVilTEOLCxMxzabChKLy1Hw0j5vAPF/Aw
	/MPsJ4tBIYSFfnfCM9fyD/5HEJtHsgXCHSEYkM4V3GYCQmN6CXDmphOB7VeESs39
	QpU1a/Qui+npPnolyUkMjzmhv8vBqGA0o5rScxEZ8xhsm8pr5Tas9xSAhHNONmeV
	uc/0Il/zmNS6GeA0KjbFrVdO/82/sXXIOuHnekVwM1fVXxrdMCN6IDhndL/pDd10
	3sSUA8+yKolwTLjmErFOsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718571832; x=
	1718658232; bh=ntsitKeg5CsLfeZpSVRZzPRKq1noIPQvxwa7wZoq0QM=; b=M
	4yGCOW2sJWN+rz2zTowNuOlGZ2cMey1fTrYm+X32iVuN/Qd2ZJ4DYVOm6coz53Yl
	nt2FhNu9Tmk6CjHNvkyZWLnvgIfuvhhGIv9I+xX+HwhkBlZXlan+0KccDvaodHXz
	+ONBH1L6mlKjAZGyT4F04q/1oTnCXoSoB0XLg5LvLuHnCiV6UpoqYortfkg4Q4pm
	7mYxslMBC6of+Lw50fntCdzXkijr1DDOeuf8md5QVctHK4yBCqapw3rs3wS8bshc
	g/Tp084hlWoF7/JfOdPS0O+kMjCC0fpEKtC327j1E+d658oJ/3w3sq3FSF3/qGNB
	ruftV3OY8fpOqu3xR8fJQ==
X-ME-Sender: <xms:OFNvZitdfqJ7B87RAy2dAVCUGOGxsPPDzOa7uul45CR3Qv0bl4x1QA>
    <xme:OFNvZndpHC2Ga0n8kM0NiIdo7ccWXtIv63JsLafBt7CUMLIRElz_BDaaguLNUjpRN
    5s5NCiyTLBN06bs4_A>
X-ME-Received: <xmr:OFNvZtwp7h5Mwe8hud6-dDJMlZ4hThbU5nOiqwpV6Cnf1Y948pLF4vQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgudehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefh
    ueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:OFNvZtPmtsiVgrelCJXSnfB-69UCi8A4AVdXBwQ3XeXeq2aZ2tf5IQ>
    <xmx:OFNvZi-eCcpNoqfUkbqjVB0QhiJ9D-coKxbk8TTxz-ZE4wtO_Gd-yg>
    <xmx:OFNvZlUwccDzfNyZgPaH-YXUU9rVNsHFvv2J4RaXJ_slaT6knOi5IA>
    <xmx:OFNvZreDl1jRIzxVgBX_b1aqwbTXCbV_uV2l9plRv9dVtdAn94V2uw>
    <xmx:OFNvZj0aYD2gRF8ypIf-gx9DXYz7oL2SIbhbJYGWvVAnszLgKfzYy1dP>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 17:03:50 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 16 Jun 2024 22:03:12 +0100
Subject: [PATCH 08/10] MIPS: GIC: Implement get_sw_int hook
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-b4-mips-ipi-improvements-v1-8-e332687f1692@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2476;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=M7QLa/e1lk3STQUI3hDEqiWEkdYQ/BEky6bbW4aA6gc=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrT8YHlBJ44nRxJXZH9fIXHq+H7B15Vrr9+4FXZH++ey0
 JDUdXOudpSyMIhxMciKKbKECCj1bWi8uOD6g6w/MHNYmUCGMHBxCsBEXi9iZOi9evH8h1ThLeyW
 CyfvYG1cbm4xXaT5y0/WXM1j+/J6Njxi+KfvcDi0VXPavtgFa1053mnWLd47iWHHnWChq49U/Tz
 j1vECAA==
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

SW0 and SW1 interrupts are routed through GIC in EIC
mode, implement get_sw_int hook for GIC and generic platform
to create IRQ mapping for SW0 and SW1 in such mode.

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
index 084cac1c5ea2..83f0d04763bb 100644
--- a/arch/mips/include/asm/mips-gic.h
+++ b/arch/mips/include/asm/mips-gic.h
@@ -370,4 +370,14 @@ extern int gic_get_c0_perfcount_int(void);
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
index eb58392f0e66..1fbd7de3796b 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -143,6 +143,21 @@ int gic_get_c0_fdc_int(void)
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
2.43.0


