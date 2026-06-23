Return-Path: <linux-mips+bounces-15175-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 48zkMWDEOmo4GQgAu9opvQ
	(envelope-from <linux-mips+bounces-15175-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2026 19:37:36 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8596B9204
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2026 19:37:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xry111.site header.s=default header.b=iATYjJfC;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15175-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15175-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=xry111.site;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D40CD300B05F
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2026 17:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A79738D415;
	Tue, 23 Jun 2026 17:37:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A89B318121;
	Tue, 23 Jun 2026 17:37:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782236253; cv=none; b=N/yVnxsau2OsMRJPaU+kSuGxlYCwt71EYOjwMzQMcwwwYWuqYh7hVHgYM1HNLg+yA/40k5lwIvwfMxtR0dBKsKdYIIRdxfmjbSMm7SNpHFCySaI8LL5TStZUIabDRJuXZZCy4tlzkckyRZ2XS0UomizEE7r2ce2ZCrpX6r1MZRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782236253; c=relaxed/simple;
	bh=avjQiiv8cCcIYnt9E2ZpTwjXGjFlEqvPKicig6PEuzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c3nU+oSE1+BDHMBCDLcCW/24EMZXm3bTaCwC0te0mgAWoFsD+SyeJDoc+cgycQfvolXSTr7bcvlBeKXhBUGNedNFyYpI/Ly9wVR9zvBVnkx9wI51Jnsk7a7i8GN9RpOMxMeKuaY+SSBnEUT3QvIfBKKYWkishAMMWkR2UCVF32Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=iATYjJfC; arc=none smtp.client-ip=89.208.246.23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1782235709;
	bh=XF6tbhKDYptAzOTwXbQhHT13O+eZL/ZgRHBgRBiDPAM=;
	h=From:To:Cc:Subject:Date:From;
	b=iATYjJfCOno1uN/xK3hjDEZymMvO2Hac3c769t1Jxfv05I00h/jqTJC+5vC6bIdhE
	 2p+eHPwvNofV0cV1ebLc7qIcyCltKM3qo/zLRqNZjMSbEI2sejrzO2eNM1REkoMOxy
	 EgHDD2nxDwBOvLNLskEXjTCRECV9c00R5eJSMYTA=
Received: from stargazer (unknown [IPv6:2408:824e:303:c231:c427:8c70:2426:a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 9E38365982;
	Tue, 23 Jun 2026 13:28:22 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Mingcong Bai <jeffbai@aosc.io>,
	Henry Chen <chenx97@aosc.io>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Xi Ruoyao <xry111@xry111.site>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH] MIPS: loongson64: add IRQ work based on self-IPI
Date: Wed, 24 Jun 2026 01:27:21 +0800
Message-ID: <20260623172728.191557-1-xry111@xry111.site>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[xry111.site,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[xry111.site:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15175-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:chenhuacai@kernel.org,m:jiaxun.yang@flygoat.com,m:jeffbai@aosc.io,m:chenx97@aosc.io,m:jiayuan.chen@linux.dev,m:xry111@xry111.site,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[xry111@xry111.site,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xry111@xry111.site,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xry111.site:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,xry111.site:dkim,xry111.site:email,xry111.site:mid,xry111.site:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D8596B9204

Since the commit 91840be8f710 ("irq_work: Fix use-after-free in
irq_work_single() on PREEMPT_RT"), we observed the performance of
execve() is significantly impacted on MIPS.

While we are unsure how that commit caused the impact or how to improve
it (or even if it can be improved at all), implementing IRQ work with
self-IPI seems able to mitigate the impaction.

Perhaps this can/should be implemented for other MIPS architecture
processors as well, but we don't have the enough knowledge of them, nor
access to the hardware.  So only implement it for loongson64 here.

Link: https://lore.kernel.org/6be1cdd5f91dd7418a32ff372a6f3ae259b19195.camel@xry111.site/
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/mips/include/asm/irq_work.h |  9 +++++++++
 arch/mips/include/asm/smp.h      |  2 ++
 arch/mips/loongson64/smp.c       | 10 ++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 arch/mips/include/asm/irq_work.h

diff --git a/arch/mips/include/asm/irq_work.h b/arch/mips/include/asm/irq_work.h
new file mode 100644
index 000000000000..d4fa2d80aabc
--- /dev/null
+++ b/arch/mips/include/asm/irq_work.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_MIPS_IRQ_WORK_H
+#define _ASM_MIPS_IRQ_WORK_H
+static inline bool arch_irq_work_has_interrupt(void)
+{
+	return IS_ENABLED(CONFIG_MACH_LOONGSON64) && IS_ENABLED(CONFIG_SMP);
+}
+#endif /* _ASM_MIPS_IRQ_WORK_H */
diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
index 2427d76f953f..a545568f1cac 100644
--- a/arch/mips/include/asm/smp.h
+++ b/arch/mips/include/asm/smp.h
@@ -50,6 +50,8 @@ extern int __cpu_logical_map[NR_CPUS];
 #define SMP_CALL_FUNCTION	0x2
 /* Octeon - Tell another core to flush its icache */
 #define SMP_ICACHE_FLUSH	0x4
+/* Loongson64 - Self IPI for IRQ work */
+#define SMP_IRQ_WORK		0x8
 
 /* Mask of CPUs which are currently definitely operating coherently */
 extern cpumask_t cpu_coherent_mask;
diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index 147acd972a07..e584299d0fde 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -381,6 +381,13 @@ loongson3_send_ipi_mask(const struct cpumask *mask, unsigned int action)
 		ipi_write_action(cpu_logical_map(i), (u32)action);
 }
 
+#ifdef CONFIG_IRQ_WORK
+void arch_irq_work_raise(void)
+{
+	loongson3_send_ipi_single(smp_processor_id(), SMP_IRQ_WORK);
+}
+#endif
+
 static irqreturn_t loongson3_ipi_interrupt(int irq, void *dev_id)
 {
 	int cpu = smp_processor_id();
@@ -397,6 +404,9 @@ static irqreturn_t loongson3_ipi_interrupt(int irq, void *dev_id)
 		irq_exit();
 	}
 
+	if (action & SMP_IRQ_WORK)
+		irq_work_run();
+
 	return IRQ_HANDLED;
 }
 
-- 
2.54.0


