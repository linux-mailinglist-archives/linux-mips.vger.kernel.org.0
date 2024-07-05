Return-Path: <linux-mips+bounces-4160-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0144F928A87
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 16:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56015B25BC5
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 14:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACE316DC04;
	Fri,  5 Jul 2024 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="aXcDa5S5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fX1IKAtU"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C385116D9D7;
	Fri,  5 Jul 2024 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720189061; cv=none; b=f2RYAfQAAjIzJmUJW8XWcYiOY4uroRqJ80U0DLNI1KYfZurPzOIyjz0Hiykl71MJ0KObnHl9SBIt/m+t5Bwmlp0114J5lNYXhFX/8zZ38ggU6FGiiWym8UGDgRWWZ8y18SQr7+BtHtFpcT4F/FV1cBaycDro4UVZdwGO7ypJAKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720189061; c=relaxed/simple;
	bh=JgrXh5b0b3kb7CqdIZH20CH0eWL/loCTfbjij0wpKpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dBfdeLs+LgvrSo/mkHABrj9ZRZt4N6T8GqJ1w0Urd+5u6QdZiSEKkiHZkcsFfnsO7BzOqlu2cR1RtgF2RktMQbIAlJ4csvYT4mhciwipjvXTp+L7rxv0nJVfF3ksRg6DUR0FIcz44Yw9dXv6Cq6lPcKZRw6RGAEHQMJB5OYQyvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=aXcDa5S5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fX1IKAtU; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id C6C06138045B;
	Fri,  5 Jul 2024 10:17:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 05 Jul 2024 10:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720189058;
	 x=1720275458; bh=P85+6svbeBePQGWrJs8s548IqlhdLiIHmy5J5r0xeqw=; b=
	aXcDa5S5/QzX3r7eHETVVBsDzWLT/kg/WXZUqJaAtvsuSeOmqhW0o+qowMstdGsi
	Z7BIVw/uUEVU6QYAMXFC0v2xCpNlP5TwxRRYUmdUi5M0GRemTYxBlaVIO89RWqa3
	/QIERlWDTxwEQtpQnTT7ERtXbwS+tusgYHxWpEBx5h8E6uXNk0PpAdXUfltU/mal
	KZpPGWktdHxijJCN7Dr8guO7Rp3DtBlmUFPRzeLsYvPYQxtcoFqaONZ8m0/d9hsb
	sbOtQdvWclEsazYjcIO/h9CJdxY+VTKPy1IhWYvMDlqM5hA85LSVXW/RO19+ObgZ
	Hz51FKHRM2ePZXSbJU4WhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720189058; x=
	1720275458; bh=P85+6svbeBePQGWrJs8s548IqlhdLiIHmy5J5r0xeqw=; b=f
	X1IKAtUAg87uKdICLeTajQDtyOUFoHGWuHmKwLnHQOVck/MGIgMulSp3I+PD35Ty
	xlw4RAALTO4ej5tggWHCMgYT9K/wth8QeIH5odKJMLaokYBspDBdH0phBgbncnKM
	frtEyq2PUfC8vLjdf2Ks26gGbVtwn892QgAY8lSSOmPL/zfSIV3SYY3Qmt8u9h0F
	9Z4A8vU1Q4vS/M2q28R4NsdYmgQhwHbl4St38coLMvc7/jZteFvOQO5TfYd9NTTJ
	LyglPH4VfP80q0YmLAyJEcksIhOMPx/DGUHsvfEmQ8hxEdTQ6xyZg4T1hSwthgOW
	9HyVNfTWBwqryD/15MU7A==
X-ME-Sender: <xms:gQCIZg1jnb1XLXGTL6lSTjIwF_hJ2izkIImseWmDc3y-IC8K9ojtig>
    <xme:gQCIZrH28gAyKlE3PKLTPIKO9vp1I0kmecmnu5wAL-4qQm4lbQ6DQiVFwJ8xRvB-C
    CS5vw_82RbSfDT4ekE>
X-ME-Received: <xmr:gQCIZo5nopE-UY_mFrrA7zxo-tRK_slhhwQgSZDWupVidkYmFfFLuFHNS3x79dwGUOk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefhueev
    geffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:gQCIZp0X-8pP-pDJs14T6HIDJu6uTNvkChXRrWzsBz2GrCELHkzVyg>
    <xmx:gQCIZjHgHyuUK3tMb73qNFWC4IZ8ZQB_DRiEvX_vKrFQ1POK9lW8Yw>
    <xmx:gQCIZi8XEaw2c6btq0o1p41u7IHTPm3Wc0vHViLV9BdffgfDA4fghw>
    <xmx:gQCIZomqDDLI-WlgR8_iAxiS-kc_8jcUmDUxVK29XjzZIQBuCXFXDw>
    <xmx:ggCIZr_gcrlANSBnBoeu9_y24O-rDoefWwr6jBAvt6xK-d8dgEozc4Tx>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jul 2024 10:17:34 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 05 Jul 2024 22:16:57 +0800
Subject: [PATCH v2 05/10] MIPS: smp: Implement IPI stats
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-b4-mips-ipi-improvements-v2-5-2d50b56268e8@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2658;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=JgrXh5b0b3kb7CqdIZH20CH0eWL/loCTfbjij0wpKpA=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQOhnRWxZS/LsdN3AzWSSgpdFYqV05MM5yp+sE8I+HAC
 63PXLM7SlkYxLgYZMUUWUIElPo2NF5ccP1B1h+YOaxMIEMYuDgFYCKcjIwMHdtd+9+IOZglx7eu
 0GATvXs9J3avHo/We8mfP79lT5rnwMhwZuuT1wIzhZj9Jh4U4zjysXHbHae/mWUXljO2aD/Qc05
 hAAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Show IPI statistics in arch_show_interrupts to help users
analysis IPI performance.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/ipi.h |  9 +++++++++
 arch/mips/kernel/irq.c      |  4 ++++
 arch/mips/kernel/smp.c      | 13 +++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/arch/mips/include/asm/ipi.h b/arch/mips/include/asm/ipi.h
index 0fc8c31c6a52..96c6e76d72c9 100644
--- a/arch/mips/include/asm/ipi.h
+++ b/arch/mips/include/asm/ipi.h
@@ -36,6 +36,7 @@ void mips_smp_ipi_disable(void);
 extern bool mips_smp_ipi_have_virq_range(void);
 void mips_smp_ipi_set_irqdomain(struct irq_domain *d);
 extern void mips_smp_ipi_set_virq_range(int virq, int nr);
+extern void mips_smp_show_ipi_stats(struct seq_file *p, int prec);
 #else
 static inline void mips_smp_ipi_enable(void)
 {
@@ -44,6 +45,10 @@ static inline void mips_smp_ipi_enable(void)
 static inline void mips_smp_ipi_disable(void)
 {
 }
+
+static inline void mips_smp_show_ipi_stats(struct seq_file *p, int prec)
+{
+}
 #endif /* CONFIG_GENERIC_IRQ_IPI */
 #else
 void mips_smp_ipi_set_virq_range(int virq, int nr)
@@ -58,5 +63,9 @@ static inline bool mips_smp_ipi_have_virq_range(void)
 {
 	return false;
 }
+
+static inline void mips_smp_show_ipi_stats(struct seq_file *p, int prec)
+{
+}
 #endif /* CONFIG_SMP */
 #endif
diff --git a/arch/mips/kernel/irq.c b/arch/mips/kernel/irq.c
index 5e11582fe308..c3ea8d80e0cb 100644
--- a/arch/mips/kernel/irq.c
+++ b/arch/mips/kernel/irq.c
@@ -26,6 +26,8 @@
 #include <linux/atomic.h>
 #include <linux/uaccess.h>
 
+#include <asm/ipi.h>
+
 void *irq_stack[NR_CPUS];
 
 /*
@@ -42,6 +44,8 @@ atomic_t irq_err_count;
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
 	seq_printf(p, "%*s: %10u\n", prec, "ERR", atomic_read(&irq_err_count));
+	mips_smp_show_ipi_stats(p, prec);
+
 	return 0;
 }
 
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index f29259d16a37..49be86e15b49 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -243,6 +243,19 @@ void mips_smp_ipi_disable(void)
 		disable_percpu_irq(ipi_virqs[i]);
 }
 
+void mips_smp_show_ipi_stats(struct seq_file *p, int prec)
+{
+	unsigned int cpu, i;
+
+	for (i = 0; i < IPI_MAX; i++) {
+		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
+			   prec >= 4 ? " " : "");
+		for_each_online_cpu(cpu)
+			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
+		seq_printf(p, " %s\n", ipi_names[i]);
+	}
+}
+
 static void smp_ipi_init_one(unsigned int virq, const char *name,
 			     irq_handler_t handler)
 {

-- 
2.45.2


