Return-Path: <linux-mips+bounces-15016-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P2gFIcowKGpf/wIAu9opvQ
	(envelope-from <linux-mips+bounces-15016-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 09 Jun 2026 17:27:06 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B4F661B9C
	for <lists+linux-mips@lfdr.de>; Tue, 09 Jun 2026 17:27:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=kzO8ljim;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=ntozgrfG;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15016-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15016-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFEE931A7E20
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2026 15:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C4248A2A0;
	Tue,  9 Jun 2026 15:04:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C28F481FA6;
	Tue,  9 Jun 2026 15:04:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017447; cv=none; b=WmjhTagCUvQ7jNIAZVAIxi5HHKeUz1pRFA074pl8MrmKg5bUmsjaCD/2STnAlwAim27JUI5AZBaUq1D5gWJO60dDypLMT1dsF9j8XO9C+L2eDuztZNeEkLf4e5l0g/Oib18mOTGK98TXo9bZTdK7bvfe8gxYjkoVxTxgC48ZVVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017447; c=relaxed/simple;
	bh=bT60d23jIzgJbNN8wzEWcEa/xazTrn+G1wpPCM1B09Y=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=PKhYn5Ypguwbq6uULJwL6TqiWdfgckycUpt/EB6jBZpn5ODEFKxBMlWan6sKQ8XWGf4F3JxQiENTXBCn5pv8sawFPqQAFNPwXJVBCbJ8NwPBHFJYAql/L6DT1tyVeCVV/avX7cUEhe+Ze7zoOHIqJn52jqCFxrvg/9OzQM7uNlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kzO8ljim; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ntozgrfG; arc=none smtp.client-ip=193.142.43.55
Date: Tue, 09 Jun 2026 15:04:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781017444;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ToO8Qrmzd/065g6nGrpbdYe7f+GCfMHHuZ01aa8TSSA=;
	b=kzO8ljimGWqsLgtQPuKA5WW0EsO2GTB0IkXwufmTmyonv2k5YRUCtlX2ex6S+ykreRoyRK
	+kftDiLql+9CWxPpjjSBXhWzca0fe1ZaFFpTId5B0xciURhj1YqjYTZgkRWDQC6t1BkY8d
	qSpzLsEEkESWWnTYMu8jtLmxRo098YievITnINXRghC+UPkMcQjmbcaBamvuPHNDdHT0Tr
	bTzeeYAJsQqe8GqkbxHXpHA2dHpW3SWyioAmHQVxCfFQcgvHB5Qe18hng5yOWdkDBvCCOa
	TIvPQWJ/39AqvXQHCLLZfEvrwE4LSmUgzqKAv3InBjn6bV0u6YcK6XptvDv+6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781017444;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ToO8Qrmzd/065g6nGrpbdYe7f+GCfMHHuZ01aa8TSSA=;
	b=ntozgrfGiCMLsre9QJYzju8SFTfYTd3SlEUxUmKJgQe3SspU6+O28vI3pPg/HqeUuiIdKE
	cVooXoUo1bgsBMDw==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] MIPS: VDSO: Fold MIPS_DISABLE_VDSO into
 MIPS_GENERIC_GETTIMEOFDAY
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-mips@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260521-vdso-mips-kconfig-v1-7-2f79dcd6c78f@linutronix.de>
References: <20260521-vdso-mips-kconfig-v1-7-2f79dcd6c78f@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178101744261.529383.4172241930455809223.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-tip-commits@vger.kernel.org,m:thomas.weissschuh@linutronix.de,m:tglx@kernel.org,m:tsbogend@alpha.franken.de,m:daniel.lezcano@kernel.org,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[tip-bot2@linutronix.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15016-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[linutronix.de:+];
	HAS_REPLYTO(0.00)[linux-kernel@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tip-bot2@linutronix.de,linux-mips@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,tip-bot2:mid,vger.kernel.org:replyto,vger.kernel.org:from_smtp,msgid.link:url,arndb.de:email,linutronix.de:dkim,linutronix.de:email,linutronix.de:from_mime,franken.de:email,arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9B4F661B9C

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     51512c216e1d2ab4822282c9ecdd40f43fa1484c
Gitweb:        https://git.kernel.org/tip/51512c216e1d2ab4822282c9ecdd40f43fa=
1484c
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Thu, 21 May 2026 08:53:21 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 09 Jun 2026 17:02:10 +02:00

MIPS: VDSO: Fold MIPS_DISABLE_VDSO into MIPS_GENERIC_GETTIMEOFDAY

The currently used MIPS_DISABLE_VDSO will disable only the userspace
bits of the time-related vDSO. The kernel part is still pointlessly
built and running.

Remove MIPS_DISABLE_VDSO and fold its usecase into
MIPS_GENERIC_GETTIMEOFDAY, which works correctly.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org
Link: https://patch.msgid.link/20260521-vdso-mips-kconfig-v1-7-2f79dcd6c78f@l=
inutronix.de
---
 arch/mips/Kconfig         | 6 ++++--
 arch/mips/vdso/Kconfig    | 6 ------
 arch/mips/vdso/Makefile   | 7 ++-----
 arch/mips/vdso/vdso.lds.S | 2 +-
 4 files changed, 7 insertions(+), 14 deletions(-)
 delete mode 100644 arch/mips/vdso/Kconfig

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f56e1a5..6463b0b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3171,6 +3171,10 @@ config MIPS_GENERIC_GETTIMEOFDAY
 	def_bool y
 	select GENERIC_GETTIMEOFDAY
 	select HAVE_GENERIC_VDSO
+	# GCC (at least up to version 9.2) appears to emit function calls that make=
 use
+	# of the GOT when targeting microMIPS, which we can't use in the VDSO due to
+	# the lack of relocations. As such, we disable the VDSO for microMIPS build=
s.
+	depends on !CPU_MICROMIPS
=20
 menu "CPU Power Management"
=20
@@ -3183,5 +3187,3 @@ source "drivers/cpuidle/Kconfig"
 endmenu
=20
 source "arch/mips/kvm/Kconfig"
-
-source "arch/mips/vdso/Kconfig"
diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
deleted file mode 100644
index 7014024..0000000
--- a/arch/mips/vdso/Kconfig
+++ /dev/null
@@ -1,6 +0,0 @@
-# GCC (at least up to version 9.2) appears to emit function calls that make =
use
-# of the GOT when targeting microMIPS, which we can't use in the VDSO due to
-# the lack of relocations. As such, we disable the VDSO for microMIPS builds.
-
-config MIPS_DISABLE_VDSO
-	def_bool CPU_MICROMIPS
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 69d4593..00d3ba2 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -4,7 +4,7 @@
 # Include the generic Makefile to check the built vdso.
 include $(srctree)/lib/vdso/Makefile.include
=20
-obj-vdso-y :=3D elf.o vgettimeofday.o sigreturn.o
+obj-vdso-y :=3D elf.o sigreturn.o
=20
 # Common compiler flags between ABIs.
 ccflags-vdso :=3D \
@@ -36,6 +36,7 @@ aflags-vdso :=3D $(ccflags-vdso) \
 	-D__ASSEMBLY__ -Wa,-gdwarf-2
=20
 ifneq ($(c-gettimeofday-y),)
+obj-vdso-y +=3D vgettimeofday.o
 CFLAGS_vgettimeofday.o =3D -include $(c-gettimeofday-y)
=20
 # config-n32-o32-env.c prepares the environment to build a 32bit vDSO
@@ -47,10 +48,6 @@ endif
=20
 CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_FTRACE)
=20
-ifdef CONFIG_MIPS_DISABLE_VDSO
-  obj-vdso-y :=3D $(filter-out vgettimeofday.o, $(obj-vdso-y))
-endif
-
 # VDSO linker flags.
 ldflags-y :=3D -Bsymbolic --no-undefined -soname=3Dlinux-vdso.so.1 \
 	$(filter -E%,$(KBUILD_CFLAGS)) -shared \
diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index 5d08be3..fd263b0 100644
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

