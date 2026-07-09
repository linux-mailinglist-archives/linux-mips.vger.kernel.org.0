Return-Path: <linux-mips+bounces-15675-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bYk8DsZOT2o8eAIAu9opvQ
	(envelope-from <linux-mips+bounces-15675-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 09:33:26 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEE172DC03
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 09:33:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=ky9qAtWU;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=aNFlUwkC;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15675-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15675-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D87E30B396C
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 07:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620AB3E3DB4;
	Thu,  9 Jul 2026 07:28:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5742A3E16A9;
	Thu,  9 Jul 2026 07:28:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582137; cv=none; b=d0vxSqxHcLeadW+oUs/4L9LZ0s4pjRyR6G+gt580KnHmpaQh/sytWGxLZMtrLsgw/kD62TyNzCJhxPDsNvneXvAlJofLj1VyutWSdRPg8KTorl2I1HpnoJcXLnvS9anu8AbUGmY07HTBHa6qKZ5/l0TmBOdnuY3TGY3IzOqv4hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582137; c=relaxed/simple;
	bh=UHTG1jcsc/HiIsOHMkDLSLm+vixbkiNBDSonjkotVgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGzg603CgMVYAkOcHCfPBMrxgm6QjOwSREAvBjAp8nEMsLaOnRi/vHFaeQhhKfAfoDy0/2clPLySdcfsy8W7Kns+NZypccHb1tVyCCjw3SBVLAoHgHnCXJmop0j3Xx7bRkuBrKBwVayA1CwRSwa5pNep1UwNjjMzLojVuPJkNDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ky9qAtWU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aNFlUwkC; arc=none smtp.client-ip=193.142.43.55
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783582133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QdEC/fMKLKjG29/RNQxvh9LLmnU6JqfDPZs2E6JVHJU=;
	b=ky9qAtWUl4G4krAYpYF9bxT0k0e9FjJjCCj6RRRmSB4YiTKnrhsQK8nMYow9nTWiKOZqR2
	4slqbYeFRJDM8vDTe1hFFDmmen7kM2WLmfLqGHTljNMgRtlnB1AVArdxJvBlo2aeJ0rq1r
	WnO6glWr8Nvwn0l+QoO5WuGgUjzVuhECdCjO6oYsGG/knW4ziKlBrATdXh234kTH2O3Avb
	4WOlO5OyPOxa2LIY9Lk+0WA/Ml9lD4dhxZgvGEdo7TT1i3zaORaQBN3rtkJbpCqK440eY0
	QgxFW3j3pUH1BoTSsa0EcJ26oCfeFPtOJnZaA0d0rz+zIkwrsiXMBetZV8qGug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783582133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QdEC/fMKLKjG29/RNQxvh9LLmnU6JqfDPZs2E6JVHJU=;
	b=aNFlUwkCl3djG0rc6PlBNzYx62EJ+hvxQZ6OsGrfXQLXIApzZ3EN/BshEjr/5mhICHz4ma
	5B58jHOfVqKc2IBQ==
Date: Thu, 09 Jul 2026 09:28:42 +0200
Subject: [PATCH 6/6] vDSO: Rename HAVE_GENERIC_VDSO to VDSO_DATASTORE
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-vdso-have_generic_vdso-v1-6-d2e1061f268b@linutronix.de>
References: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
In-Reply-To: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783582129; l=4451;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=UHTG1jcsc/HiIsOHMkDLSLm+vixbkiNBDSonjkotVgs=;
 b=9UMNFia3CYsRgBso+G6IBbLhz8ltxGQmRZS9PGROL4pUs7mDYjgLRY/FhuoR5bqZCfC5ZHD2y
 3iH80lek9akD8BwmGF5+P71k6bbSUQG05ZRkaU9kt/nVHp0SpZMaUIE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15675-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:luto@kernel.org,m:tglx@kernel.org,m:vincenzo.frascino@arm.com,m:tsbogend@alpha.franken.de,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:thomas.weissschuh@linutronix.de,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:from_mime,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EEE172DC03

Over time the meaning of HAVE_GENERIC_VDSO has become off.
Today it only controls the availability of the vDSO datastore.

Rename the symbol to match its function.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/loongarch/Kconfig         | 2 +-
 arch/powerpc/Kconfig           | 2 +-
 arch/riscv/Kconfig             | 2 +-
 include/linux/vdso_datastore.h | 6 +++---
 lib/vdso/Kconfig               | 6 +++---
 lib/vdso/Makefile              | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index d8d252325017..41ed648fcec9 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -153,7 +153,6 @@ config LOONGARCH
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
 	select HAVE_GCC_PLUGINS
-	select HAVE_GENERIC_VDSO
 	select HAVE_HW_BREAKPOINT if PERF_EVENTS
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK
@@ -213,6 +212,7 @@ config LOONGARCH
 	select TRACE_IRQFLAGS_SUPPORT
 	select USE_PERCPU_NUMA_NODE_ID
 	select USER_STACKTRACE_SUPPORT
+	select VDSO_DATASTORE
 	select VDSO_GETRANDOM
 	select ZONE_DMA32 if 64BIT
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f7ce5fff81f0..c6bc2cd6cc83 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -256,7 +256,6 @@ config PPC
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER		if !COMPILE_TEST && (PPC64 || (PPC32 && CC_IS_GCC))
 	select HAVE_GCC_PLUGINS
-	select HAVE_GENERIC_VDSO
 	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if PPC_BOOK3S_64 && SMP
 	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
 	select HAVE_HW_BREAKPOINT		if PERF_EVENTS && (PPC_BOOK3S || PPC_8xx)
@@ -328,6 +327,7 @@ config PPC
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
+	select VDSO_DATASTORE
 	select VDSO_GETRANDOM
 	#
 	# Please keep this list sorted alphabetically.
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 9aa8c4df0cd8..019fb4799943 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -171,7 +171,6 @@ config RISCV
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_GCC_PLUGINS
-	select HAVE_GENERIC_VDSO if MMU
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KERNEL_BZIP2 if !EFI_ZBOOT
 	select HAVE_KERNEL_GZIP if !EFI_ZBOOT
@@ -227,6 +226,7 @@ config RISCV
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
 	select UACCESS_MEMCPY if !MMU
+	select VDSO_DATASTORE if MMU
 	select VDSO_GETRANDOM if MMU && 64BIT
 	select USER_STACKTRACE_SUPPORT
 	select ZONE_DMA32 if 64BIT
diff --git a/include/linux/vdso_datastore.h b/include/linux/vdso_datastore.h
index 3dfba9502d78..13b01baf3497 100644
--- a/include/linux/vdso_datastore.h
+++ b/include/linux/vdso_datastore.h
@@ -7,10 +7,10 @@
 extern const struct vm_special_mapping vdso_vvar_mapping;
 struct vm_area_struct *vdso_install_vvar_mapping(struct mm_struct *mm, unsigned long addr);
 
-#ifdef CONFIG_HAVE_GENERIC_VDSO
+#ifdef CONFIG_VDSO_DATASTORE
 void __init vdso_setup_data_pages(void);
-#else /* !CONFIG_HAVE_GENERIC_VDSO */
+#else /* !CONFIG_VDSO_DATASTORE */
 static inline void vdso_setup_data_pages(void) { }
-#endif /* CONFIG_HAVE_GENERIC_VDSO */
+#endif /* CONFIG_VDSO_DATASTORE */
 
 #endif /* _LINUX_VDSO_DATASTORE_H */
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index eedb04974fd5..597f5f0f9681 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -1,11 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 
-config HAVE_GENERIC_VDSO
+config VDSO_DATASTORE
 	bool
 
 config GENERIC_GETTIMEOFDAY
 	bool
-	select HAVE_GENERIC_VDSO
+	select VDSO_DATASTORE
 	help
 	  This is a generic implementation of gettimeofday vdso.
 	  Each architecture that enables this feature has to
@@ -20,6 +20,6 @@ config GENERIC_VDSO_OVERFLOW_PROTECT
 
 config VDSO_GETRANDOM
 	bool
-	select HAVE_GENERIC_VDSO
+	select VDSO_DATASTORE
 	help
 	  Selected by architectures that support vDSO getrandom().
diff --git a/lib/vdso/Makefile b/lib/vdso/Makefile
index 405f743253d7..ac304def42d6 100644
--- a/lib/vdso/Makefile
+++ b/lib/vdso/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-obj-$(CONFIG_HAVE_GENERIC_VDSO) += datastore.o
+obj-$(CONFIG_VDSO_DATASTORE) += datastore.o

-- 
2.55.0


