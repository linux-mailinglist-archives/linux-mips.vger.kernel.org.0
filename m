Return-Path: <linux-mips+bounces-14669-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LOFNoSsDmqqBAYAu9opvQ
	(envelope-from <linux-mips+bounces-14669-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:56:04 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F75759FC15
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B41BA306BCF9
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 06:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0948397B06;
	Thu, 21 May 2026 06:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jKENBybm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TBcl2xPb"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02D4395AEB;
	Thu, 21 May 2026 06:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346405; cv=none; b=QF+QWKapj6CWmXzgj3MQQ+Aph++yMUPe6SdFR8ruxR3GYsBXuMEc9m9C7cLgF56sBeon1uZtPjq7RH1QEamJMygInx6KXNqaXO0yD37/WfJD5USON6HTX34UCWJHCXb4rfCYq56PGGX8OYrgMxP/PlPAJpWpCjAJWkyDy3qMnfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346405; c=relaxed/simple;
	bh=s9pAGY/eIOzEZ2CnnlmklgDRvVjcE7ayC9Y8a43CMZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WsK9WkyelsBnak1t4fXuJQM1sx6yJAVt7yO2CUiyVQheUWYdQCeR6Gpqf4Ex7ufNJhuMZIklR/bVVB9GPtcrmKKQr31wWBj6A6m8uk6ALyKIys6/ms/KAiOSjeipRszyyrY4p/WRM9nazitvTUnHAmcy8dC+yxInkYQvDAtZuig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jKENBybm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TBcl2xPb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779346402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7GuSCYZvVyqZH0xl580lwlvyKaoH6Mwa4WGhLxtj9eI=;
	b=jKENBybmBjVsSBpJey/WKyvwv2/DQ0JdaLtZ1DUkY8MGOZkAHI2nZPcehnMCZ+oXS2gPgu
	g9vmZM+H6ZwaO9cW3IQ90E/J6XoSJGGDC4gdmqgfhDwI/hKaUrjOQ2SFOgwWGQhiudvM13
	Zv0V6P+Zt2ew/OhjYRA5PhkoBlK+O3LPgeDf01hlBkw4kECQ4Y7Kgq8CenzQswwRDz/NLj
	JpjYvBW0i8Uz00pJ8EN6Jk1G/qFDLipLRyK5T0AsTEb9SmkXBSTPEW3z5IMngD7HojFbiw
	YGIzybNUELpL6XpddPai3Kw1TNM95nvmHWNlgaIw6z6umbn7uY+P1245ykR/ag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779346402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7GuSCYZvVyqZH0xl580lwlvyKaoH6Mwa4WGhLxtj9eI=;
	b=TBcl2xPbWICwKVthfzn2uat++72JF/TjYcHJzpNX/D3lDm7qdQNiJP9YZ1IfLfRwgvmhCc
	JXHHT/f3dFnsjYCA==
Date: Thu, 21 May 2026 08:53:21 +0200
Subject: [PATCH 7/9] MIPS: VDSO: Fold MIPS_DISABLE_VDSO into
 MIPS_GENERIC_GETTIMEOFDAY
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-vdso-mips-kconfig-v1-7-2f79dcd6c78f@linutronix.de>
References: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
In-Reply-To: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779346397; l=3201;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=s9pAGY/eIOzEZ2CnnlmklgDRvVjcE7ayC9Y8a43CMZM=;
 b=Rfr45FUvI2CbS6/tcMHH97hJEfI+HXnBhznhNNYCW947ZpUENm8Gztm68i0fOsM4mxlMf1WmN
 17Nd/9cK++gAE3iP07Yi7c34Si5shwL7IK13dQBs+7ABzh5RDCfH2hl
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14669-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Queue-Id: 3F75759FC15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The currently used MIPS_DISABLE_VDSO will disable only the userspace
bits of the time-related vDSO. The kernel part is still pointlessly
built and running.

Remove MIPS_DISABLE_VDSO and fold its usecase into
MIPS_GENERIC_GETTIMEOFDAY, which works correctly.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/Kconfig         | 6 ++++--
 arch/mips/vdso/Kconfig    | 6 ------
 arch/mips/vdso/Makefile   | 7 ++-----
 arch/mips/vdso/vdso.lds.S | 2 +-
 4 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3a01cc85bd6a..8a3bd431b16a 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3172,6 +3172,10 @@ config MIPS_GENERIC_GETTIMEOFDAY
 	select GENERIC_GETTIMEOFDAY
 	select GENERIC_TIME_VSYSCALL
 	select HAVE_GENERIC_VDSO
+	# GCC (at least up to version 9.2) appears to emit function calls that make use
+	# of the GOT when targeting microMIPS, which we can't use in the VDSO due to
+	# the lack of relocations. As such, we disable the VDSO for microMIPS builds.
+	depends on !CPU_MICROMIPS
 
 menu "CPU Power Management"
 
@@ -3184,5 +3188,3 @@ source "drivers/cpuidle/Kconfig"
 endmenu
 
 source "arch/mips/kvm/Kconfig"
-
-source "arch/mips/vdso/Kconfig"
diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
deleted file mode 100644
index 70140248da72..000000000000
--- a/arch/mips/vdso/Kconfig
+++ /dev/null
@@ -1,6 +0,0 @@
-# GCC (at least up to version 9.2) appears to emit function calls that make use
-# of the GOT when targeting microMIPS, which we can't use in the VDSO due to
-# the lack of relocations. As such, we disable the VDSO for microMIPS builds.
-
-config MIPS_DISABLE_VDSO
-	def_bool CPU_MICROMIPS
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 69d4593f64fe..00d3ba2c482a 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -4,7 +4,7 @@
 # Include the generic Makefile to check the built vdso.
 include $(srctree)/lib/vdso/Makefile.include
 
-obj-vdso-y := elf.o vgettimeofday.o sigreturn.o
+obj-vdso-y := elf.o sigreturn.o
 
 # Common compiler flags between ABIs.
 ccflags-vdso := \
@@ -36,6 +36,7 @@ aflags-vdso := $(ccflags-vdso) \
 	-D__ASSEMBLY__ -Wa,-gdwarf-2
 
 ifneq ($(c-gettimeofday-y),)
+obj-vdso-y += vgettimeofday.o
 CFLAGS_vgettimeofday.o = -include $(c-gettimeofday-y)
 
 # config-n32-o32-env.c prepares the environment to build a 32bit vDSO
@@ -47,10 +48,6 @@ endif
 
 CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE)
 
-ifdef CONFIG_MIPS_DISABLE_VDSO
-  obj-vdso-y := $(filter-out vgettimeofday.o, $(obj-vdso-y))
-endif
-
 # VDSO linker flags.
 ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
 	$(filter -E%,$(KBUILD_CFLAGS)) -shared \
diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index 5d08be3a6b85..fd263b05d3e7 100644
--- a/arch/mips/vdso/vdso.lds.S
+++ b/arch/mips/vdso/vdso.lds.S
@@ -94,7 +94,7 @@ PHDRS
 VERSION
 {
 	LINUX_2.6 {
-#ifndef CONFIG_MIPS_DISABLE_VDSO
+#ifdef CONFIG_GENERIC_GETTIMEOFDAY
 	global:
 		__vdso_clock_gettime;
 #ifdef CONFIG_MIPS_CLOCK_VSYSCALL

-- 
2.54.0


