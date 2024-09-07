Return-Path: <linux-mips+bounces-5406-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FD6970207
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 13:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A368B1C21A17
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 11:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D650F15ECD7;
	Sat,  7 Sep 2024 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="t6gkIibp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C19IDgi8"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AC115D5BE;
	Sat,  7 Sep 2024 11:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725709711; cv=none; b=RtHotGAlijRgjuSrkFnLxo15Begh2Rwxn5rMnmUo8HuRcGejFUbb6lsjdMb82fQfB3HjkRIDZGPCSX3YScQQXrhOSkiRObKzqQf7E4+bHXL+DibyBe3ADMIc2W6rHh1E87/fD6fyUxkWH6kxmnIunyUymzBdexr9aHkjNgqO5OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725709711; c=relaxed/simple;
	bh=eIhrStCFhvy6UxtCOWmxnItdfmDtk8eGTHQjAvagVJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JgPU8BOqEpzEllHyemOCQs1ap2xPQGEQ6dG5Q2af5LpGPmQcs6euUDOUW2M0/hP7zWpSIOTSw6nJBFM5n/TOAAIYiLrqFIUyYeJ9jjQPt8fGNnE8KLLIlldhfARWLa2IqXEGLhlfiIfDs7qp9nbL4kWlHRm1IV4l8M/FOzV5KPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=t6gkIibp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C19IDgi8; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5DDDC114037F;
	Sat,  7 Sep 2024 07:48:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sat, 07 Sep 2024 07:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725709709;
	 x=1725796109; bh=CrRlxBx9BNlgfuT4leF0ZpEwcFYthm6BbRrRIv9TLgk=; b=
	t6gkIibpW6OCEsdrhqGjnJ+Fxj3xbWSvx+TI+8RY0dT4N3X0aemjymaODo3eBptD
	lDe254ZyqnvqJLv6lRUXmNxtoiFp78YWb+71m+KC0DEoUX4G98hTqNonMQjDZUGz
	Lk5kt3LmZLjNF5rICJle9+KTFlQBpl5/oMLi/jJnKaB4URU4NOWjVvlii2kSegc8
	vbG1dSIFGn3GyCpCAu7jwQ4Sx0f9KY/RB08EyQvwNLkQXLxIIgiEGd9CClF2dKn2
	kPloVM8olq2fmo2LtsPQVXz0SVZnEjg6ELFrcAZocEmMddl52AeRIROd+pO/y7AY
	uLVko2vo2dsuYV6YAqyxaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725709709; x=
	1725796109; bh=CrRlxBx9BNlgfuT4leF0ZpEwcFYthm6BbRrRIv9TLgk=; b=C
	19IDgi8H++EwiXxh+Re/+vqE1xVRGBWiFm0tjzgt+pQ+nrpTd6o0YESAmdcDLr2G
	p7RX+y+IMnWy7GHuRf0VEoCF1JGCy1+vZIk1vCvDyl6lNZDQYqO7CkOlNlSs/Dx4
	pu7mRrZwdedYgeRoiPqiVnvZRwnHTPzQyPmlAkvcdmjpU3WH1XQLsGvVh7AfbbUW
	rAkOMxf1G9cd7QTNQTLgKlRJarf3gVXiGtIqRqvqTcd8Hw9a5BoOr7yjg/OgA0p1
	uF8jfqPJc2rk/32IJ8r/OnDaJJOiphvEf0ii7Y5y/ty1LubGwespYPcNIdJicMCm
	soU2cB47sMFovfnu4hKMA==
X-ME-Sender: <xms:jT3cZnEmhLuLLpuKdM-GxkvI_rIdLZ0TD8iTmpUA3j1_PKFtj0Aipg>
    <xme:jT3cZkUA8EczrOntb6_XLGAGRM0Bwzj2NOK-gmEHHUFj0LH1JNVkC3Wn3g-wn_pPD
    TQifmHAcRqdZuT_yvI>
X-ME-Received: <xmr:jT3cZpJzak6Rijme6ITjAUwVJ6azvyAFAeAR8_5FaCge7eWStM3r2_CaG_hCSPpBCfk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeifedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
    necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
    gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenuc
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
X-ME-Proxy: <xmx:jT3cZlHNo3IcEEgsUAGz3p-Jr8pqBqfAmi8cPpIFMPFaGkMvTbtXBQ>
    <xmx:jT3cZtX1JLtxqftnzSn7SJ6_i2le4bEcvmlK8yle6EM_gD46BmvFlA>
    <xmx:jT3cZgOm3Lqjk3_12xYq0JtQDdHN1zT5PyIM0kLVZIZ6QsR0ZRr5ng>
    <xmx:jT3cZs3yeuS83ENQzpXXHvYZdJbUDvZkfCxboslye9X9sro45Kqs6g>
    <xmx:jT3cZmOnOKMUcBBZ2jBNqOT9MrSFBa4fGqdDAkEpi0XbtU9Xc41yQfBS>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Sep 2024 07:48:28 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Sep 2024 12:48:13 +0100
Subject: [PATCH v4 07/10] MIPS: Implement get_mips_sw_int hook
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-b4-mips-ipi-improvements-v4-7-ac288f9aff0b@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2807;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=eIhrStCFhvy6UxtCOWmxnItdfmDtk8eGTHQjAvagVJQ=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQ7tnWveRZEZsY7rjSvye0/9/h5K5PzplyXzSKm2y8+P
 Kd+cu+sjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZjIPxlGhqfOSqePnukTrZOM
 YrK6/FDqGW+EB+NDdr8fzuemvFdv02dk+BO0/5WyuZfrpJvHj2akLEzQeGEkPmtD12kjiV9brtq
 f4gQA
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


