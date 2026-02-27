Return-Path: <linux-mips+bounces-13275-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AY2OcxAoWnsrQQAu9opvQ
	(envelope-from <linux-mips+bounces-13275-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 07:59:24 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C0F1B399B
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 07:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4DB33142FCB
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 06:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6FE3ECBFB;
	Fri, 27 Feb 2026 06:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jz3sFWXh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mNoDAPoh"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7AC3E9F80;
	Fri, 27 Feb 2026 06:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772175472; cv=none; b=Of6egeUo/tAb0SVehmjlp56ws210OGP2intlmpn9qjiwAG/i2Jcx6qURFhIPiBRdNGHtr1zVnd+vf9d9lanLdQ/u+lhL7oRYpb8yqZZYvf3bc4QfkUnJxsCrNwZ7mmviqfpNPXsGlsyYfu0QGV8HhPNuhm5rYj+wIvNfGWZReZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772175472; c=relaxed/simple;
	bh=oahUDDzRXbGFMlkc0RC1a89GUCrIJez2IL5R9Ep+PBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TzR0dxm7SEUKTKijiiA2H2gYUaF8F+gLVOzKwJIOXFObQ40hsHxgAKEB8SmQf3ffkhaQwJZ1ZXI0emZ76biGqPm9hA77Xyc6efN48KRkRErNhAPCcZdlLfvXIPRueXvMuYm/ZKA8GsKwTdZsf6ApjdrFqQYtnMqsaktyWmG0vBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jz3sFWXh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mNoDAPoh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772175469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PMoWoELWXhUvJ+5dGoSFr0fxre5mWeKbDwq8tLK0U1w=;
	b=jz3sFWXhcbKGJDvHLemZ34PNAxwppfUXe+wTPhRtV3gLeHLzKe7G/sOWhp432nGhXwdSHn
	MgPHL/ieh4CRL+Sj/V0VrSdeXNrJJWdNoAnA+kUYdLhaxe5hRqxfwTSIVQqT/n2JRu11Db
	54GUiQ3Ep2UOkUDN0lDHYCt1mgYt3lWckWML/nc21HoopTL0vjWSaXA5qYRwVq0Bz0oILh
	Mywz5yZTC95dNZKv+8lxx7sqRgP0XM9ESwO9geQDyk0s6GnuSbY0G6jK3tLh/1UPre0lm2
	maFHxd31Y+gGwZf3eZw3N0MbkkfM5ZYX34hb3FOHezAsDQlFPn+cURluRusTEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772175469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PMoWoELWXhUvJ+5dGoSFr0fxre5mWeKbDwq8tLK0U1w=;
	b=mNoDAPohU52TI7Xd8JWlXSfQ8jNjk3ZTMwand/oL+vE8eWgqiq+6XegH6AjkjIti8lIJxM
	gQC7dMc48YTxE5AQ==
Date: Fri, 27 Feb 2026 07:57:44 +0100
Subject: [PATCH 5/7] MIPS: VDSO: Drop kconfig MIPS_CLOCK_VSYSCALL
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-compat_32bit_time-v1-5-3f0286a7bac3@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
In-Reply-To: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175466; l=3146;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=oahUDDzRXbGFMlkc0RC1a89GUCrIJez2IL5R9Ep+PBo=;
 b=04Iyq9XCQR4S4Ii1jZ1CW+E0jOmqmZS2e+vnTE9U0dCmMRBUvfyhPR94yWmPUG9n2pIN7c9iT
 6C8JYr4OYX/DVncCggJaRcX5U23VD83H+KnRI5WnFMgp2MAlxM6D477
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13275-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: 87C0F1B399B
X-Rspamd-Action: no action

This configuration option exists so "that we don't provide the symbol
when there's no possibility of there being a usable clocksource".
However it only covers __vdso_gettimeofday() and none of the other vDSO
functions which should be affected by the same circumstances.
As these are more widely used than gettimeofday() and nobody seems to
have had an issue with them so far, drop MIPS_CLOCK_VSYSCALL completely.

The removal of the ifdeffery will also make some upcomming changes
easier to read.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/Kconfig              |  3 ---
 arch/mips/vdso/vdso.lds.S      |  2 --
 arch/mips/vdso/vgettimeofday.c | 20 --------------------
 3 files changed, 25 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e48b62b4dc48..4c8592fd1556 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1137,9 +1137,6 @@ config CSRC_R4K
 config CSRC_SB1250
 	bool
 
-config MIPS_CLOCK_VSYSCALL
-	def_bool CSRC_R4K || CLKSRC_MIPS_GIC
-
 config GPIO_TXX9
 	select GPIOLIB
 	bool
diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index 5d08be3a6b85..76b6ad898288 100644
--- a/arch/mips/vdso/vdso.lds.S
+++ b/arch/mips/vdso/vdso.lds.S
@@ -97,9 +97,7 @@ VERSION
 #ifndef CONFIG_MIPS_DISABLE_VDSO
 	global:
 		__vdso_clock_gettime;
-#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
 		__vdso_gettimeofday;
-#endif
 		__vdso_clock_getres;
 #if _MIPS_SIM != _MIPS_SIM_ABI64
 		__vdso_clock_gettime64;
diff --git a/arch/mips/vdso/vgettimeofday.c b/arch/mips/vdso/vgettimeofday.c
index 1d236215e8f6..00f9fcfc327e 100644
--- a/arch/mips/vdso/vgettimeofday.c
+++ b/arch/mips/vdso/vgettimeofday.c
@@ -18,22 +18,12 @@ int __vdso_clock_gettime(clockid_t clock,
 	return __cvdso_clock_gettime32(clock, ts);
 }
 
-#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
-
-/*
- * This is behind the ifdef so that we don't provide the symbol when there's no
- * possibility of there being a usable clocksource, because there's nothing we
- * can do without it. When libc fails the symbol lookup it should fall back on
- * the standard syscall path.
- */
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
 }
 
-#endif /* CONFIG_MIPS_CLOCK_VSYSCALL */
-
 int __vdso_clock_getres(clockid_t clock_id,
 			struct old_timespec32 *res)
 {
@@ -59,22 +49,12 @@ int __vdso_clock_gettime(clockid_t clock,
 	return __cvdso_clock_gettime(clock, ts);
 }
 
-#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
-
-/*
- * This is behind the ifdef so that we don't provide the symbol when there's no
- * possibility of there being a usable clocksource, because there's nothing we
- * can do without it. When libc fails the symbol lookup it should fall back on
- * the standard syscall path.
- */
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
 }
 
-#endif /* CONFIG_MIPS_CLOCK_VSYSCALL */
-
 int __vdso_clock_getres(clockid_t clock_id,
 			struct __kernel_timespec *res)
 {

-- 
2.53.0


