Return-Path: <linux-mips+bounces-15674-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ad2kK9lNT2rjdwIAu9opvQ
	(envelope-from <linux-mips+bounces-15674-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 09:29:29 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C53772DB34
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 09:29:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=HWufRWkD;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=11R7J76l;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15674-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15674-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C07E303049A
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 07:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D045A3E3167;
	Thu,  9 Jul 2026 07:28:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008513E074E;
	Thu,  9 Jul 2026 07:28:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582136; cv=none; b=G0dmfgKA8ZQ9N66tniVrqwjteL9d47vjSndq0MMSqFG64w20ytVoSLSyA1bhs21W+az27zP3Z9PFq36sRJvUR4zU2k+oVdnJ35OiS3T6nOjWTUWQZldgG/N0h+tti0gxIPFVWRuumYEEGsdefU+G1rHKCZVppeAj01WQjgoPhww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582136; c=relaxed/simple;
	bh=Vz+oV2F+ww1UiHIk9hnAAEzvvymUhtr20umuYz5mb6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UaKwG8OkO2d+E5mF6LYfWMduIAsizX27ibc8yN9uM6mrW8ZFjRv6BkqTUJLrQ95QNTULMBT+oz8EAh/gniWz01VLK9+QoSjM0pa/iZ6fn4Ph/Y8TljO2csrQKevWWwJFANKjsGwTejbcIg0QxXyEXv0so04KgO1S4C8IKHzPAXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HWufRWkD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=11R7J76l; arc=none smtp.client-ip=193.142.43.55
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783582133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0bMWRBTETOLrhpgZM2l9uQQ4I2sG8EOJdt9zaW7pk44=;
	b=HWufRWkDSffE+Zd5VL6ungz/F7ItDcmV1FQEPKhdIa5r0nKiT5rar5FcTQ0M/i67Tgkq0h
	R3flV+Q9XlAjhYxpxdIiKUliU1B2DGLDtjdc+amycqF977/h3qRWhhQ1OWin3jrT+Bf5pr
	ZZb3YCplO0Dku8BaVBfK6Cxx2+rT27Lh1TuEEoshzbqJkIUTg8qtPQCe2rm05yQhi15GnK
	nNi2gCrrNMWrpbk4sQzi1fiPADC5N6nN/uPI0UKbudmyrDe5wHiY9R8VMM+T2tsi7NaD+2
	ivXhtQ4+wbqwqg7+fbWmRa4Fh1amrOmHWYUaaDhR0a17mXOvapXPGtdebbwzPg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783582133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0bMWRBTETOLrhpgZM2l9uQQ4I2sG8EOJdt9zaW7pk44=;
	b=11R7J76ljJBFUHQSP+VdlbjII8WovAPgb/aAbwqfimvrLZ/yLY2BmFDygnZoOmNZY621cu
	9buIYxnVV43LdzBw==
Date: Thu, 09 Jul 2026 09:28:41 +0200
Subject: [PATCH 5/6] vDSO: Drop HAVE_GENERIC_VDSO from architecture kconfig
 files
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-vdso-have_generic_vdso-v1-5-d2e1061f268b@linutronix.de>
References: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
In-Reply-To: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783582129; l=4006;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Vz+oV2F+ww1UiHIk9hnAAEzvvymUhtr20umuYz5mb6Y=;
 b=dR5b5hDDsPtE9R5UOBydqOg+58hjA6DjSGhyfNyyZGVE7lr1ANtJ+jAck5Q+J0yFbMacPU1B8
 thYOGqdgl6SClUvLlrRTa8CKvdgx99wuYE1pYR4uYvBiCC/AcjTSTSW
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15674-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:from_mime,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C53772DB34

Now that GENERIC_GETTIMEOFDAY and VDSO_GETRANDOM enable
HAVE_GENERIC_VDSO automatically, the architecture specific kconfig files
do not need to do so anymore.

Remove the corresponding lines.

Keep them for riscv, loongarch and powerpc as those have their own
explicit usage of the vDSO datastore provided by HAVE_GENERIC_VDSO.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/mm/Kconfig | 1 -
 arch/arm64/Kconfig  | 1 -
 arch/mips/Kconfig   | 1 -
 arch/riscv/Kconfig  | 4 ++--
 arch/s390/Kconfig   | 1 -
 arch/sparc/Kconfig  | 1 -
 arch/x86/Kconfig    | 1 -
 7 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 871bd58d2ccc..f7bea397a201 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -924,7 +924,6 @@ config VDSO
 	bool "Enable VDSO for acceleration of some system calls"
 	depends on AEABI && MMU && CPU_V7
 	default y if ARM_ARCH_TIMER
-	select HAVE_GENERIC_VDSO
 	select GENERIC_GETTIMEOFDAY
 	help
 	  Place in the process address space an ELF shared object
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919..11e733b6a3cf 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -229,7 +229,6 @@ config ARM64
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
-	select HAVE_GENERIC_VDSO
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select HOTPLUG_SMT if HOTPLUG_CPU
 	select IRQ_DOMAIN
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 8555bbf47c63..a06f24317306 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3163,7 +3163,6 @@ config MIPS_EXTERNAL_TIMER
 config MIPS_GENERIC_GETTIMEOFDAY
 	def_bool y
 	select GENERIC_GETTIMEOFDAY
-	select HAVE_GENERIC_VDSO
 	depends on CSRC_R4K || CLKSRC_MIPS_GIC
 	# GCC (at least up to version 9.2) appears to emit function calls that make use
 	# of the GOT when targeting microMIPS, which we can't use in the VDSO due to
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 353cbfcff783..9aa8c4df0cd8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -110,7 +110,7 @@ config RISCV
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_EARLY_IOREMAP
 	select GENERIC_ENTRY
-	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO && 64BIT
+	select GENERIC_GETTIMEOFDAY if MMU && 64BIT
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IOREMAP if MMU
 	select HAVE_IOREMAP_PROT if MMU
@@ -227,7 +227,7 @@ config RISCV
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
 	select UACCESS_MEMCPY if !MMU
-	select VDSO_GETRANDOM if HAVE_GENERIC_VDSO && 64BIT
+	select VDSO_GETRANDOM if MMU && 64BIT
 	select USER_STACKTRACE_SUPPORT
 	select ZONE_DMA32 if 64BIT
 
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 84404e6778d5..c9c55e3ddf1d 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -215,7 +215,6 @@ config S390
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
 	select HAVE_GCC_PLUGINS
-	select HAVE_GENERIC_VDSO
 	select HAVE_IOREMAP_PROT if PCI
 	select HAVE_KERNEL_BZIP2
 	select HAVE_KERNEL_GZIP
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 0e9c906c4b5d..4dd79311133f 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -113,7 +113,6 @@ config SPARC64
 	select ARCH_SUPPORTS_SCHED_SMT if SMP
 	select ARCH_SUPPORTS_SCHED_MC  if SMP
 	select ARCH_HAS_LAZY_MMU_MODE
-	select HAVE_GENERIC_VDSO
 	select GENERIC_GETTIMEOFDAY
 
 config ARCH_PROC_KCORE_TEXT
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index bdad90f210e4..2f4a78024a96 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -302,7 +302,6 @@ config X86
 	select HAVE_UNSTABLE_SCHED_CLOCK
 	select HAVE_UNWIND_USER_FP		if X86_64
 	select HAVE_USER_RETURN_NOTIFIER
-	select HAVE_GENERIC_VDSO
 	select VDSO_GETRANDOM			if X86_64
 	select HOTPLUG_PARALLEL			if SMP && X86_64
 	select HOTPLUG_SMT			if SMP

-- 
2.55.0


