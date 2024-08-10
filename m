Return-Path: <linux-mips+bounces-4846-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BC194DCE2
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 14:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AF9428168B
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 12:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB6216CD0A;
	Sat, 10 Aug 2024 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="h/ZsuaHT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FTIGGfBy"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE771586E7;
	Sat, 10 Aug 2024 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723293567; cv=none; b=IcCysZHsyfON/13oq7Gas0b2g0CECpoSXXmoyMnJFopmWNIEMGbSAwRhP1E4f5xPXDnG+Hh6vdteA6Q7FyDJf//ewYg1C9/J5FQRu7HX6ooqrK6xrfWQXpoAK+zcVYvG3+g3rvinFwNsPHyj1ib1sT9u9n7UEdpix1RojvE49HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723293567; c=relaxed/simple;
	bh=TDTS37U7qD5GDQXOexLrM7YcshQgkIo/Ghw7eM8/jyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=caQKukKSxyzto2r8PjT7NlhEtR0e5qwb61EZdq4oEfDYB/gAOqltyZ/TbiUbeZKsO7k/NT/FQ9BlgkYrSAlSsUBRCDPeAffuBY57Ol04uLY+T4yOr0mQwgK3GfkDGRzYkqQo5LIMr5ZxMfitd5nfBYhgrkWNWu/0NVx/RgUqGqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=h/ZsuaHT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FTIGGfBy; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 6929511520B8;
	Sat, 10 Aug 2024 08:39:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 10 Aug 2024 08:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1723293565;
	 x=1723379965; bh=caTouew/1bk1S85iIua6kcrcXDTSLX1rdWHiY3I1WQM=; b=
	h/ZsuaHTIlwH2es3rUxkSjyXszgw42hsV8avbz2DxOynYm1dYxg/kVFOedrMnY/v
	BwFaRx0BDjVyJYsJOwy2YcM0HhFg5o/wPWZPEeiek3ybmezFRf9HmQqtedSUE2Jq
	Px//89i3z0G2dzOpPXcF4L/84o3ARTGQdOIFfnHJqaKKIlQbUqogpbReQxjruwMu
	GAZ+VzL7uGEJhtVN+Vy20qt2fuwdA6Q5uSH6xgol46rCmWOJ5HjnLSV1NUwcZvTl
	+kd2dL+pksSe2sXlzztc8RnVrCs23TgoLeO3lBmx/GpWNQK0TnOKNASbzCfosIR8
	/93gQYhsSR0sbFAdoH3N9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723293565; x=
	1723379965; bh=caTouew/1bk1S85iIua6kcrcXDTSLX1rdWHiY3I1WQM=; b=F
	TIGGfByJPmwV81zFjE9xY2jJ3JwKN9Qg6P+mux2DF9DT1QLUQfgcbEM5F95eMLWe
	Eh8VZuWef9kWlZTpXuH+g12Nx/O9bFqkGVC4oNWnH7fn7QN1HkjpljYHdLwyHuyA
	FHFPbfIdyqssGs+nw9vbvJ26Rd8YY6eAjLeMI/N7zE3ZymmW/Y+iNO0eAh43v8Hl
	hhRBz+T9gf15vIE/7ZG5ov3aLe3smcdyeOP2evxpJsa1zIFWmBg9uKKvcR9mHpef
	V2OLnuInUIQqQPwQ2QmsqmRayuxjNQWrfZNqkytT2hncJe0hViMtDTn6A0jQmBQP
	sc3EwBvMmdtsj573UwdvQ==
X-ME-Sender: <xms:fV-3Zpbzdfu1rqSVsk5Du2xBy8lgQZuR9d2aaRLiPJdFL0a7Ng-N3A>
    <xme:fV-3ZgaXT_S5_Wx2ywluHCo7-3altBdcbW3c36bKmZG7eTUql1hkqvbrNSOMH7DHC
    VTepX_T1Xum__iFL3Q>
X-ME-Received: <xmr:fV-3Zr8Je-zp2nGfk71dfIxOK-ZfYn1V96TeWtRUdYMoU5rNBDRGc21DL9c7IfghMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrleeigdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeen
    ucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhmqeenucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeeg
    udeghfdtuddugefhueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedunecurf
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
X-ME-Proxy: <xmx:fV-3ZnosHB5aK2UhuDiYf7mpu62lTtb8jV7POVqd84xfsSmEJEFTwA>
    <xmx:fV-3ZkpQsCqpa4C5Ap5QxilabEo33XaWfmyfE926-RebE-FwB7tFqQ>
    <xmx:fV-3ZtRHU0ZMjJ9uEYN1sfkbNjcQetDfAl43mVgVFx4SdWQLypGHLw>
    <xmx:fV-3ZsqeC0b-EMnX8mPh_sF3K0TRYjkn6Oc6FDc63xhve9lX5Apxew>
    <xmx:fV-3ZhiJU-n7BRvf4mptaKRKuMmUS9MHVG7nnrfQCuFBMiqpXIg3lr2v>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Aug 2024 08:39:24 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 10 Aug 2024 13:39:13 +0100
Subject: [PATCH v3 08/10] MIPS: GIC: Implement get_sw_int hook
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240810-b4-mips-ipi-improvements-v3-8-1224fd7c4096@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2526;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=TDTS37U7qD5GDQXOexLrM7YcshQgkIo/Ghw7eM8/jyg=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTt8fnT12exfGs+1MSytj/iqoDUt4u97wQ+P81Zo6dzY
 tqk2RqlHaUsDGJcDLJiiiwhAkp9GxovLrj+IOsPzBxWJpAhDFycAjCRg9cZGdZNPf9cXidldd33
 1XXbInLXifiVyPcYC3K57RR/73GC/z8jw4o5Bzc1yGQJH/pbJhzfkC3Gtrvx6+snK6tmu/4X66k
 JZQMA
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
index 0748ef0416f3..23a246082245 100644
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
2.46.0


