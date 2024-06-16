Return-Path: <linux-mips+bounces-3701-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B0D909FD6
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 23:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDF241F210D6
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 21:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F156A33B;
	Sun, 16 Jun 2024 21:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="RTA2e6dx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ORQAqRci"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7567373451;
	Sun, 16 Jun 2024 21:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718571826; cv=none; b=a9CQRIFfoAYLdVQsBveIaGT3A8XXMOxCGKSc5TST5Aw7lRlPg8A7D5coCAuQJpYToLQrKOoB1XF1LfnXD8OtKlpuOjQe+ffcNsnAsS4GJSSnPzetJ2jdtdxFt1O/lu+l6VQ+IztB+KLGvMiVw0B02oa4kOmw9Hks7baqPFJc1x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718571826; c=relaxed/simple;
	bh=Q0B3ozZ1+tMaT0GsWlC+CEo9IUlB2PFVElh9ipC7Wl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GjSSTn3kaFdnECHy25+Xwa7D2ffq2VSEgZQ3hAX93jRPm6mUCsLLxba3EbGL/CvzSBTxnSyzNO7dyKP7/oinEDzqSqEhkZfK3R3oGC3lEvnu6ZK94uEqZSEmzDHqTePPW534dnDYkCdQPFGgvmz00XbLEQgPXHXjYLf+ejFoGvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=RTA2e6dx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ORQAqRci; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id 14B3B1C000B9;
	Sun, 16 Jun 2024 17:03:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sun, 16 Jun 2024 17:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718571823;
	 x=1718658223; bh=n57a4JQbTyT/KQQXlMbXsgnB1h30lzLN+SudRRABA34=; b=
	RTA2e6dx94jZvmBQEY1FrwOb2AhnyD3+PtCopGbV7Mj5s2q3lkaABhlL6Xca8AOf
	TvQykxAqDqUcrUHj/nYia31quKNeh8Rvrdei3+xOiqqi4skNcB9tmEYhcgQ1jmzW
	okprIBBhox3T8bJUVFLzJNKRRjhQUwDy1fo/g/MgYbA4vfoqs2Z9TIsIZAz5KuYH
	JoieCo6JeQXq245NDOFkXDzC00WUybd9HLNXIPBs7sM93z469WJO6BY5/wFbWdYc
	p01I8/aMAJd6wiH1RoyIRPkg4sVzx6FFkSTOGQzK9Jfp4vJnD9WDLEA9OG1uw+C0
	I/WeAfzjdnMfJ4Re+E+4ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718571823; x=
	1718658223; bh=n57a4JQbTyT/KQQXlMbXsgnB1h30lzLN+SudRRABA34=; b=O
	RQAqRciQrZzb+ydyl5h9qh6qTZWpOuBG1KS8pf0BvJYuxpfG+F9z4rR10cWEw46I
	xJXsjdPnbiez7nB3XT6M6srPeKEM7Y+STVHDZrP68R8BkXrfbCZlPufIF6bVXoIy
	OYTgMz8F2+spWqeKNpulKTaHH7s3JjFtHcNIEcAF2GtNkx2fJ6o5Gs1gSt/XjGJA
	1ga6WKSPQq8KcqskB4nssR3vL+caA4zfCj2uP5y4DTyIgqT3N75TVMSbezLasyax
	y7IgVsdvFsu9+n0dxQqYhnZt2rwoWg0Mt0mqH75eVF+7Mv2b8h+1MzWpTVQNPu0Z
	zy6MC0hvcEXq0RMvPG7ng==
X-ME-Sender: <xms:L1NvZrSgA8L9RC2VbIcvEMqyWP3SAJDVhuWUleXqZy8Sj9o1FFjsTQ>
    <xme:L1NvZsxA02Mb3vxMfw7DYEIs7JuOQx5EdFAqbDKusOZt1MxlmFZJGFz8Pv0DDx6Ic
    Kw1vUDlOucwU4fKSt0>
X-ME-Received: <xmr:L1NvZg03muj1o_8W3YSPqZ1Iboynmb6j6cPJk8SjN8MYIWtwhi5T-DM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefh
    ueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:L1NvZrCK_uFofYGEQrPnNTZhQKFYNxExHunnOPN9LjhWuknEkJMnbQ>
    <xmx:L1NvZkjxfqB_ILrilZtywg4b84aB6jq-Bi5XRahO9au_JQdjL4kwDw>
    <xmx:L1NvZvoHGsKHOsEE2etjtL489EzhgobsTqfNbcIgXA9YvjjphvcdhA>
    <xmx:L1NvZviSVaEuhTNe8NdOf06nM0lPbOVH2cR1HOm8qY55CKa4PJbQxA>
    <xmx:L1NvZpZlJKOY1gcQ9t3wuqE1ZAA254ZbnyR4aEDK0k-qz-c66JZvJxEv>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 17:03:42 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 16 Jun 2024 22:03:09 +0100
Subject: [PATCH 05/10] MIPS: smp: Implement IPI stats
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-b4-mips-ipi-improvements-v1-5-e332687f1692@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2624;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=Q0B3ozZ1+tMaT0GsWlC+CEo9IUlB2PFVElh9ipC7Wl4=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrT8YPnli6PkHLez7uxN4U++8keXyW6F4/x9uj7cu5ZNW
 7+UXdSyo5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACaykYWRYSPD4d1rniw0PGYn
 Zefte2vjwqhb++wP12XI3mrXvKa7cT4jwyWGZ21e73Nkthw/59zbtmjJRwbW96f6HfcW8Dk/Tei
 V5gcA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Show IPI statistics in arch_show_interrupts as what RISC-V
did.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/ipi.h |  9 +++++++++
 arch/mips/kernel/irq.c      |  4 ++++
 arch/mips/kernel/smp.c      | 13 +++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/arch/mips/include/asm/ipi.h b/arch/mips/include/asm/ipi.h
index 0fc8c31c6a52..1a486f0c934f 100644
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
+static void mips_smp_show_ipi_stats(struct seq_file *p, int prec)
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
+static void mips_smp_show_ipi_stats(struct seq_file *p, int prec)
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
index ddf96c28e2f0..826659214566 100644
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
2.43.0


