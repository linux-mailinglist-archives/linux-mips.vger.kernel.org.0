Return-Path: <linux-mips+bounces-4163-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2562928A8F
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 16:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BCBBB26539
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 14:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAF616EC08;
	Fri,  5 Jul 2024 14:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="mzK7iLqT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="L4VSJLvI"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946F416EB68;
	Fri,  5 Jul 2024 14:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720189074; cv=none; b=aaf+4S7Om3cCuT8rmLKml39XoxoN4Aru/HNaCUdIStDEkqAnDxpnqkGVKZyshMqoDQasLYCQK73EwkmbG7PMrYFS19iMsWiwajKBLny5b1YPXuAzl/IxNLYRx1YnoNLtrhl/+mLvkXFtdW6bcK0k/gR5aH24aoDnswnDiClc160=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720189074; c=relaxed/simple;
	bh=MbvCb3pQ9sVxGj9YsZ2Bo3mcT7SECuL2ErrwnpMxUQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jbf5qrSdBaW9vtCX8ILGzy5fvPsr1PMW47SAy155MZBSomWx/CG5QvhHLxtrgOPOPeXcV5kD4vmQhgQu+sEpm6kdk+420HYVpRhwiWL92dZMoxmoGI/wW2pYlVNRZyW1LTcaO9GUvpQeh8E0caCY0lsNKofnHpjjhIYVvsR6GZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=mzK7iLqT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=L4VSJLvI; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id C23F31380455;
	Fri,  5 Jul 2024 10:17:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 05 Jul 2024 10:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720189071;
	 x=1720275471; bh=+pkna8QIAs1fgaQPH6H7ayDirkuVCIQG5px4bmS7Rx0=; b=
	mzK7iLqT+C6KK/OjImFylkfO7J+RMRaSEiK8HfmdLGm5x/xTyvAzkeivnRMSY5zL
	PKshXGPM6db+/nQhkv3/jkmptAZyl4ofu+K1JzHhGCp7KOd/j8CnjNoTH0vnrhTO
	3kPIQwFgBjO5J3vXZQaltbTg4HplB7k7olE3bt5KM6vJt61En1KejR/SiWZNgbUz
	Fs8HKdFoRW33Xl4NDmkR9h+ANMi9mpgSViDfr5auTKLptWWhnP9lBzMVb+XyP6me
	bKayP31u15tEhe81N+oCiQESNn5xEWmCPlonJw5TOYODttU91S5G0Yf7O1r3MfO4
	4yYiahfXuzv75hC9F0HDsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720189071; x=
	1720275471; bh=+pkna8QIAs1fgaQPH6H7ayDirkuVCIQG5px4bmS7Rx0=; b=L
	4VSJLvIapCyR3RBY833JMDztUn7d31bxFKvxM0vAU3kAqMQuf0QZMIb1fwvkU0Gn
	NGst3fH7S9h/9VXYtWOGHx1T/Dn43Ssi1Eob7xIkkX+MA19X8u/UYX0gJIQnS8xn
	hsIzTME1i687TfO5fuomj+yVna6dBe8CmVf7/lf5dmq+e8N5ysNfetBQgkijQ18b
	Eg0Q/qCDeMuBpdSeSfzd5A3Yq1DqRK0ADT7LlcAQQ8ha46bZYP209BM5mqf0ZfBs
	c5ezHNA6mwNLMyFJEuP7zDmdi+YYhNgOrkBnf2TpEz8+/9ugdKEq+aSvSJysgYCC
	fMtgKs2vqgDjLvD57d5mg==
X-ME-Sender: <xms:jwCIZjsWJUnhEOQM8-eyI2V9FKaAmL7DhiViGb732_l_NbDpISlFMA>
    <xme:jwCIZkeVHWddOzMdwJEWhJy0MiYbCo2QBgHB5HN-cEfrAGgB9pJzSFMtAW0R1oRpX
    5x6SrU_VSRYrKgfC0k>
X-ME-Received: <xmr:jwCIZmyxiqJE5inVeXYo1PWMK3yOWTnXmHAkL0h_Uq2-EQaGGqli59R_KoBWG36Huvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefhueev
    geffgedukeejleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:jwCIZiP_50xj4I7qyowlG3W6AHBf9nkf6bufLgnMHgEtFYevIbLp_Q>
    <xmx:jwCIZj_YiPjcY1Om-DddmUymcjtMXPq_KvQH50HMLQcizNHlR11KGg>
    <xmx:jwCIZiVJh0FS3qne0BufH5SdarsxW0pui-CT9DyX_dngVzpAVPAH1g>
    <xmx:jwCIZkf0CmkZ7Y5YOxM78lbDKPGVywy8N9x0vAuHIWoNhgog3-xeuA>
    <xmx:jwCIZk34YVkkYzrwJPWXWw86evUF4HstllzHTl5mocYVp-A6iseXbKJB>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jul 2024 10:17:47 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 05 Jul 2024 22:17:00 +0800
Subject: [PATCH v2 08/10] MIPS: GIC: Implement get_sw_int hook
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-b4-mips-ipi-improvements-v2-8-2d50b56268e8@flygoat.com>
References: <20240705-b4-mips-ipi-improvements-v2-0-2d50b56268e8@flygoat.com>
In-Reply-To: <20240705-b4-mips-ipi-improvements-v2-0-2d50b56268e8@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2476;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=MbvCb3pQ9sVxGj9YsZ2Bo3mcT7SECuL2ErrwnpMxUQY=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQOhvSbQiX7dfwXHnip8FE+fe6uwKmGTwMZj2cnuM6Sq
 E1g+9HWUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABMxPcHIsC5Efbfly6acRtae
 a59+MmzsDiyqs/8wXShO2uv6bZdjZxgZeh2clr02MdP/8bYxfMfCS7enRa9a2t3Y9j9VS/QAW/l
 +LgA=
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
2.45.2


