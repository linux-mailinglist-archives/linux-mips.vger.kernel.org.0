Return-Path: <linux-mips+bounces-15015-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u+SrIA4vKGr6/gIAu9opvQ
	(envelope-from <linux-mips+bounces-15015-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 09 Jun 2026 17:19:42 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1257B661A7F
	for <lists+linux-mips@lfdr.de>; Tue, 09 Jun 2026 17:19:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=DgdHf5Nl;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=k3NBYiZe;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15015-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15015-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3739231D8792
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2026 15:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0CB481FA1;
	Tue,  9 Jun 2026 15:04:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9449481ABA;
	Tue,  9 Jun 2026 15:04:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017445; cv=none; b=auON2peEPMD5m2eqTyo/29Gv97aqM9KG/Ll+XUQx89Rd9UnoCtjberzOhQqk+nc683C1VoNyH2a9vgJdObGLbGxH8NB119SSdrrLrLsDaspUu6QobHFBmq7/0DQWlve7pGhaqJJOQuzTeBVBXupQxWykOBsTHNRyY8JthcRht/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017445; c=relaxed/simple;
	bh=X4xhboKxqt4ORQhlXpbdAL8Pu+AiV+mpGgMbTxzU7IQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=YU807kn9BIrmIhzMhKcKkP0pBl6e9Z++gzLjoeHHzwe0RNxFVqVcHEM8jdYk1x5oZC0VyVJbtIXGmHs3iWo4f9gr5wq0vh1Wh2YFawL2rCyxSe2UdEfiznzmXggnZOA9Nb1a5pTStyQ2tw89Q5H8ECBDNiL5biIGNmSXwHRy95g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DgdHf5Nl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=k3NBYiZe; arc=none smtp.client-ip=193.142.43.55
Date: Tue, 09 Jun 2026 15:03:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781017441;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LR7obcT3j33di+gH3CRJeCjwnxbgUo7ZEB19qHcMLGo=;
	b=DgdHf5NlCFbWhNODzZeCEcMtwVDqVxNGW9y7eUinZaV0kFL/Z6KifVpLH8atIdxw9MUC4B
	1+uNYImvBJqV/4Wk4y18AKi1OJe7NbX8ygr7lsVkruiDrCe1LfBdDLyf7xdW7SZ1TAuMUW
	p7ffB+cek07stnACeT/ANIXU6J/4Lud7FFTkQYoCatvG1PZRVxym2T/jn95FnFSCCIoHzQ
	vED8GVmPgXJwJes85n+ikkIBtiZw2Gwgojwo0XuobREDosAFd8JhSgx06LvniBbSKWjFtu
	DxfeiuFh5iBsH1bcxDmuuS0WAylLUGWAXZ1Y6aQqiHMrSjaQtp1iEpOPA+4usw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781017441;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LR7obcT3j33di+gH3CRJeCjwnxbgUo7ZEB19qHcMLGo=;
	b=k3NBYiZeUOiCjNlgmJD+O1MElub+kRD+AnJTeJP0/4DSoRhatYJYxwlagvrXECpj0PoHnR
	+rTydwcNlTBHVpCQ==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] MIPS: VDSO: Fold MIPS_CLOCK_VSYSCALL into
 MIPS_GENERIC_GETTIMEOFDAY
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-mips@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260521-vdso-mips-kconfig-v1-9-2f79dcd6c78f@linutronix.de>
References: <20260521-vdso-mips-kconfig-v1-9-2f79dcd6c78f@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178101743986.529383.15318148364435303032.tip-bot2@tip-bot2>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-tip-commits@vger.kernel.org,m:thomas.weissschuh@linutronix.de,m:tglx@kernel.org,m:tsbogend@alpha.franken.de,m:daniel.lezcano@kernel.org,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tip-bot2@linutronix.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15015-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tip-bot2:mid,arm.com:email,msgid.link:url,vger.kernel.org:replyto,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,franken.de:email,arndb.de:email,linutronix.de:dkim,linutronix.de:email,linutronix.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1257B661A7F

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     8d563bd7904734c05a4f2abf4ecca0e4fe764b50
Gitweb:        https://git.kernel.org/tip/8d563bd7904734c05a4f2abf4ecca0e4fe7=
64b50
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Thu, 21 May 2026 08:53:23 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 09 Jun 2026 17:02:10 +02:00

MIPS: VDSO: Fold MIPS_CLOCK_VSYSCALL into MIPS_GENERIC_GETTIMEOFDAY

This configuration option exists so "that we don't provide the symbol
when there's no possibility of there being a usable clocksource".
However it only covers __vdso_gettimeofday() and none of the other vDSO
functions which should be affected by the same circumstances.slightly slightl=
y.

Remove MIPS_CLOCK_VSYSCALL and fold its usecase into
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
Link: https://patch.msgid.link/20260521-vdso-mips-kconfig-v1-9-2f79dcd6c78f@l=
inutronix.de
---
 arch/mips/Kconfig              |  4 +---
 arch/mips/vdso/vdso.lds.S      |  2 --
 arch/mips/vdso/vgettimeofday.c | 20 --------------------
 3 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ccc66e3..323ca08 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1133,9 +1133,6 @@ config CSRC_R4K
 config CSRC_SB1250
 	bool
=20
-config MIPS_CLOCK_VSYSCALL
-	def_bool CSRC_R4K || CLKSRC_MIPS_GIC
-
 config GPIO_TXX9
 	select GPIOLIB
 	bool
@@ -3171,6 +3168,7 @@ config MIPS_GENERIC_GETTIMEOFDAY
 	def_bool y
 	select GENERIC_GETTIMEOFDAY
 	select HAVE_GENERIC_VDSO
+	depends on CSRC_R4K || CLKSRC_MIPS_GIC
 	# GCC (at least up to version 9.2) appears to emit function calls that make=
 use
 	# of the GOT when targeting microMIPS, which we can't use in the VDSO due to
 	# the lack of relocations. As such, we disable the VDSO for microMIPS build=
s.
diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index fd263b0..05badf3 100644
--- a/arch/mips/vdso/vdso.lds.S
+++ b/arch/mips/vdso/vdso.lds.S
@@ -97,9 +97,7 @@ VERSION
 #ifdef CONFIG_GENERIC_GETTIMEOFDAY
 	global:
 		__vdso_clock_gettime;
-#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
 		__vdso_gettimeofday;
-#endif
 		__vdso_clock_getres;
 #if _MIPS_SIM !=3D _MIPS_SIM_ABI64
 		__vdso_clock_gettime64;
diff --git a/arch/mips/vdso/vgettimeofday.c b/arch/mips/vdso/vgettimeofday.c
index 1d23621..00f9fcf 100644
--- a/arch/mips/vdso/vgettimeofday.c
+++ b/arch/mips/vdso/vgettimeofday.c
@@ -18,22 +18,12 @@ int __vdso_clock_gettime(clockid_t clock,
 	return __cvdso_clock_gettime32(clock, ts);
 }
=20
-#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
-
-/*
- * This is behind the ifdef so that we don't provide the symbol when there's=
 no
- * possibility of there being a usable clocksource, because there's nothing =
we
- * can do without it. When libc fails the symbol lookup it should fall back =
on
- * the standard syscall path.
- */
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
 }
=20
-#endif /* CONFIG_MIPS_CLOCK_VSYSCALL */
-
 int __vdso_clock_getres(clockid_t clock_id,
 			struct old_timespec32 *res)
 {
@@ -59,22 +49,12 @@ int __vdso_clock_gettime(clockid_t clock,
 	return __cvdso_clock_gettime(clock, ts);
 }
=20
-#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
-
-/*
- * This is behind the ifdef so that we don't provide the symbol when there's=
 no
- * possibility of there being a usable clocksource, because there's nothing =
we
- * can do without it. When libc fails the symbol lookup it should fall back =
on
- * the standard syscall path.
- */
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
 }
=20
-#endif /* CONFIG_MIPS_CLOCK_VSYSCALL */
-
 int __vdso_clock_getres(clockid_t clock_id,
 			struct __kernel_timespec *res)
 {

