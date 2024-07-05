Return-Path: <linux-mips+bounces-4162-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6FA928A8B
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 16:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D748B26254
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 14:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B638F16EB49;
	Fri,  5 Jul 2024 14:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="oH7S6mqX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IDKBf33n"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C4316C444;
	Fri,  5 Jul 2024 14:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720189069; cv=none; b=UnlPKKweMK5bG/nBVdv5DTvO4o6ytieg8jBmzQ4idny9KcDVH6R2MRhxVcfbvqLZEkc59j+1zBfC7mORtIiB5DtjWUX8CpAMbsXmE3h6iwlhpQ7VRLcL6zXzyGJFIURsEAkNHWb+p/PIPIVj3g6KBdhZFki9KnObxnp++/FLp4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720189069; c=relaxed/simple;
	bh=Mtw71kZDNXKmS+k3RytF2dUin0ut6WFNIUi8/LiPrxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EKCJaiLLwwL9e1GCy1ttXzdTQasYK5/YXm8WQS+gL6oywt3cc1Ym6KAIsLJmLuaG7O/Nn5y2q6A5USbvHxJgpOZsQ+1UkAkQKyWWfVXRW9mb8ZiTlnrJAD5ky1w6Jnsf1F0NscYPk4kpHNjvCO2wSgL9x7isfDEN19RcYXdXOiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=oH7S6mqX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IDKBf33n; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 6DF07114012F;
	Fri,  5 Jul 2024 10:17:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 05 Jul 2024 10:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720189067;
	 x=1720275467; bh=OwayQ/jpWvBmzwZjicSGPWrJdk2dM+e2Rs6em9mUXrk=; b=
	oH7S6mqXSciHNd/SOyNFaHRlzatvl8FYabHPwtx8yuse1XATgQuo00XG2XnqkOCy
	ScSvDXQk+OBXkbebxx3XhrHo2db898CfIq4XGJkJTPz9jNpDQSLnke3BFfaqwuC2
	edZYv4O67pf3v7jrC/un8/ABhO3le8g0wrX35ghln8/J/UVZNnNhbgUF7pcei3GG
	XDtasK+Ztz3o+i/w3pgGk/fQJ0V4VlbdwToeWB6v6cScMX5d65B6SRfwfoswik4y
	sYSClzIwewF7oHtYw2E1wXTYzWcCcDm+1LjppN722fDvZuBweLXlRC0Of+U9oRMe
	vsPv3k/onQ7B+guqJjal+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720189067; x=
	1720275467; bh=OwayQ/jpWvBmzwZjicSGPWrJdk2dM+e2Rs6em9mUXrk=; b=I
	DKBf33n7CzboSm+7JJHfYuzCU8GFo+/kvbnA5ULJW/96u0ITtKEEEDtUT8DBKvZi
	LbrBpJJ/a/Nt3Gd5kQmPEBxuoE8Sv+LgrfT8Dmfdz0+/Di/2e4ZBAtqxko4UUlbL
	18JPHxxbK41PpZj2/O79ZcRci756P03kGu9EVrD6DTJmn7mHrsDrXbSSDhMJdgCR
	W67f3edbhcAcQnsabSKqIN13p+9J6s7QDyVBJrOuq/cVooLavhSZtNgAKJdJ3ERo
	FlwQaGGFeFjUsGwLZfB82ykgxLrArjSSbDmO9fLGchNP/yE765bBL3StCsSJnfaP
	Jp1MSwBATHm6wjyj7OpAw==
X-ME-Sender: <xms:iwCIZs09dDhgJXH5yJ4DjFR5I-5lIpSi46xz7on8byQ7PhzW2eQfDw>
    <xme:iwCIZnGa9n--zd_dfkC48gH2qo0l8az1i888zMMyYtMhEpUzeJ9JgspwetRCYhRmv
    QxN6_fgKxaz2oVnEcY>
X-ME-Received: <xmr:iwCIZk6gTWDJqLXyeRO7fJ55ganjsJLFjI3t8QGNqbjtjJp6s1mGixtOaMSFs9oKIqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefhueev
    geffgedukeejleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:iwCIZl3B3m_DrP1AgaiOVz7HXzusV9oHadqIfxNUIS5ai8jseg8hBQ>
    <xmx:iwCIZvGmkefrSIv6xAXQRXBJyKTSWvQ4pSh5E1a9vwW833XC9LSQ4w>
    <xmx:iwCIZu82E9p-uKNWjKouylUBfFt2K2T9CT7B84Lw5IOyHTMYGIJSFg>
    <xmx:iwCIZkmvenYrBocIa7FyGOGOjOAT24xZGAfVbCvVf9MGfVzk2mXrTA>
    <xmx:iwCIZn_X44QFaxEhZbDXaOCOZW1oNoy0p5mbv_Um4LpkqEpI8ITQL7Cm>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jul 2024 10:17:43 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 05 Jul 2024 22:16:59 +0800
Subject: [PATCH v2 07/10] MIPS: Implement get_mips_sw_int hook
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-b4-mips-ipi-improvements-v2-7-2d50b56268e8@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2757;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=Mtw71kZDNXKmS+k3RytF2dUin0ut6WFNIUi8/LiPrxE=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQOhvQ8pgqzeytib34Rl7he/XbC1mJtLeXQNAvtZT+Xv
 KiOvN/fUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABPh+8fwP/V5RNaXMquLv25r
 fdg9c0VkcEjsHh2+GUHn+lil+mNyShkZ5qiLibE1NoZM6st7vkK4dFfz9Juav87d/bCjnSP6mkU
 dKwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

For MIPS CPUs with VEIC, SW0 and SW1 interrupts are also
routed through external sources.

We need such hook to allow architecture code to get interrupt
source from platform EIC controllers.

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
2.45.2


