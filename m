Return-Path: <linux-mips+bounces-3703-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D62E909FDA
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 23:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 809EE1C20A75
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 21:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9997347F;
	Sun, 16 Jun 2024 21:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="UZQjiHze";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="psr5Pb3G"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C575757EA;
	Sun, 16 Jun 2024 21:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718571832; cv=none; b=a4X6xuhe9vhSKhL7XwXlfflyMs5yaklDvXNafWIDPhqFgem9+eG3YQh6IuX/UtzUSaOMOR/wsqeIj5S/V9LySupcuH8BAkLctrtIbspljmhmLDJQxTYjb3cJp8Z4+AwySgCQcza1PEpsYOFqDfXMB4uD9N67GjXRZWZhFycJvDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718571832; c=relaxed/simple;
	bh=s7QtoyV8CJzkclWybiBuG4D3q2iZmeH1TgYwpMpAX+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fzaO64Nl8yQWbkihxuvUfEMMoyibHjBOFLGK3Sdx7JWqW1SduVK6P5qv3TZ+EOxbfH2Sildvx/9UfLfzAUR/l6d5a1hnPFjxSEJ5J1PBLVSGpL+i+1X4G7BcVeKL+v1IFVF+IQ9zUlFDb5XwGt5NjagL8LnEQ+sPneBHUxtfqzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=UZQjiHze; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=psr5Pb3G; arc=none smtp.client-ip=64.147.123.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id C6F4218000B3;
	Sun, 16 Jun 2024 17:03:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sun, 16 Jun 2024 17:03:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718571829;
	 x=1718658229; bh=TuRWWa0una2yxVoN3twYoJOXAIorrBg19Mp60gwXJOU=; b=
	UZQjiHze4fkfCLQgVcSm3i/gWDuvdK1LupImoPnZM5kndNZtyhgeziroWCnSY6Pt
	Bv3KTAqWErpWx5L/YocDIVh3/NJJtfpbu14YDDLyKTQPdHGtvQnows5KiU0d/9UH
	Z3MscWCCp+NnVbIyWUqFPk6+1JyhSbGSjdGg1IY6RM3VCBBFxVQwkZs+vDicUznG
	c7aBLNpy/L3jFhNIGuyxzJWKqneWIqrdBBLMp1TvtP6h+YK5vxbuWKbdhK1hbZ7f
	weg7x8qIYBYVCfw6XhHbvtulhKrFS9Y3ENJvEp02Dxfb51SOASlpUeG9TjD2j2uw
	Op1d/HpzmYSVKPU6m4Cmlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718571829; x=
	1718658229; bh=TuRWWa0una2yxVoN3twYoJOXAIorrBg19Mp60gwXJOU=; b=p
	sr5Pb3GSFP3Xz+nF2NOYzkLM08zr0KQAm6g7eAsLFhZXI4ERoRzNavmGMxlNUNs7
	Sbo9yQavNYg6q19vOecCA3N7La+SkD7VntqMzzWGp9ChJn+5AUCkMKLkFU8AzYH2
	M7u+M1zZFLciQ7DnjYKmAp4v24cdrhR2xMaBZE0SwPchhwU0Vm/Ztd3pBaPVcn5n
	4W5kZyGPK19X/miWPxH7sm9GjyIKdDlGdf0tbN851mTzAsCfSE+8Smq7VT0DkfxW
	n2wyQcdNe1hpDjHCTrcw7aZBBr2qqPizZoiDHtzlsNhrDdLi7Nx5ZvvQS8gB7JEh
	PLwNEL8apL5nlXzfxHxFg==
X-ME-Sender: <xms:NVNvZiEiaD-BbzTOVmjFZbRUY1_xEF_FpBPkpNi1kJb_gZaYbRmHxg>
    <xme:NVNvZjVKYuoGvMyep1tPhcUzpnYC0vNvXoYJiyNf9TEaNBkCj0h6lbAB3lpIY0Tp4
    seipqB0DFmciF8zI-I>
X-ME-Received: <xmr:NVNvZsKOwXA92TiDqqVBtfA3CJ3udCyZihz1jfEGcXPNpJkLm7UYkgc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefh
    ueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:NVNvZsGAZwSI51l27nU2pwtuXlKjEYBoebS0MUznpCPNcx6MoC_kqw>
    <xmx:NVNvZoX87iknei7kRSUHasrgEOfH7pDxlVvi_itqx6MXDTae5kbKYQ>
    <xmx:NVNvZvOeIzPfVAHu71XTF5yiB8LRUku7LhBfX-2JK5HzUvzq0kKMfA>
    <xmx:NVNvZv2QmnvltO3lDUZVWJSlTf5gIshoqPawnAAlC43pLOWyHN-utg>
    <xmx:NVNvZhO6UWC0lWN9WL8Im5m9t9-On3qHt8pL5fSeWCfuSCKULBMMhYek>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 17:03:47 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 16 Jun 2024 22:03:11 +0100
Subject: [PATCH 07/10] MIPS: Implement get_mips_sw_int hook
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-b4-mips-ipi-improvements-v1-7-e332687f1692@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2757;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=s7QtoyV8CJzkclWybiBuG4D3q2iZmeH1TgYwpMpAX+E=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrT8YPnfZc9+npu5/HNwPJvDrsVOBffX9y/dvmJ7mpNDH
 gvPymyTjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZjILDdGhgmiun19zJX6N8P3
 rL3Du69zo8WhYA6Rjdve5Z5tEXurvIzhn8r0nBNsC97ZfzU6oBUcMG9DzNK5isU926ZvO7AoZNL
 WZTwA
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
2.43.0


