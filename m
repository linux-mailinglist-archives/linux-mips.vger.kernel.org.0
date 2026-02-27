Return-Path: <linux-mips+bounces-13272-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE3wI4xAoWnsrQQAu9opvQ
	(envelope-from <linux-mips+bounces-13272-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 07:58:20 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CE01B396D
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 07:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 394F930BC964
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 06:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87AB3E959F;
	Fri, 27 Feb 2026 06:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aXlbJ/p9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P+yurFpS"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6760D38A718;
	Fri, 27 Feb 2026 06:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772175470; cv=none; b=mgQx/U/2PWNraJfrggPgPSjx1mLWIBzKh5xSHUMsppKjR8TLaqC6UAqiFadKC/emPjyohEowLoMdDG9CGJhp1QDOehtCOly25HYiBxfBQ5rfsLPFHc8kelZkyxVYrxGv4hzAosbMhxQfH7x5Ck9l8rCrx62H5mxwm0YQLlET2ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772175470; c=relaxed/simple;
	bh=JKP7Wzpv+BQAhD2mx0Ezvftbepun/bCnQO02h8+Mf/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sFQFDZEzTPbnR5zaOi39hjsXKNKnn+OxGFqUgQeo1CeLn3FuGGTriBUIIVX5xso314nJPjKOSXZvEKjWa7H2WNdTO7ESg9sJljDYiwKJ1EI4B9XUQSe+DfX+G5fueSPx44oaiJDK4N6C0Gzl4eyXUAPhtcNdfhG8lXUhddN3j2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aXlbJ/p9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P+yurFpS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772175467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXdJGc4nT9NOOKX+UZdPuq+ndE9REXVmbUjc0fDDCMI=;
	b=aXlbJ/p94I8vyOXRf4fwSomLr3yWPo8GZFeu6OrlP5IMBVGJUEf5fEwOED8eIkjOuiE8om
	akxR7tbHwLZziv+IZkREeUJuRcdQW2b8W1X/SAnX3csxcytBmcMa/TIoEE5XP/ZWcevTro
	dIQJJIOkIJsTCPnXWN2qOaAT5JqpVRc2EWx0gjIZuS5B/lzVQBq98vXVjgyDfIti0DzW1h
	cXtNOU0D0wGVbSYj1QqtYfquKGUHKLpmYLpCr/1AYfDD4AZjwJw3uxMDuS57szAquUZXaA
	WDNCcSzabajTyWFOje9cg2J/EwuMKnkp3IEW4jKk1e/YsMKuHGfFwbku6IMQ3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772175467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXdJGc4nT9NOOKX+UZdPuq+ndE9REXVmbUjc0fDDCMI=;
	b=P+yurFpSuVj8ak8+qsSSmyIxRmwYTP5FGrYkiAWDOqmH31s02Njiz+IUO1sS/ia5UFGb8S
	Okc3qETrJbJuUZDA==
Date: Fri, 27 Feb 2026 07:57:41 +0100
Subject: [PATCH 2/7] ARM: VDSO: Respect COMPAT_32BIT_TIME
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-compat_32bit_time-v1-2-3f0286a7bac3@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175466; l=2370;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JKP7Wzpv+BQAhD2mx0Ezvftbepun/bCnQO02h8+Mf/U=;
 b=6sVnm5WpE3/hhnKxB+rbIhSWVt0/eDVaHudV3chXN806w8ViXp2xoJGa/NWrh2YQ0UA4id8fC
 Q00LvueQZP0CIimPd0uVUn9R8HEtw/qNzxzOvXX1wgJmvPiDiJaWtD8
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13272-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: 27CE01B396D
X-Rspamd-Action: no action

If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
provide any 32-bit time related functionality. This is the intended
effect of the kconfig option and also the fallback system calls would
also not be implemented.

Currently the kconfig option does not affect the gettimeofday() syscall,
so also keep that in the vDSO.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/vdso/vdso.lds.S      |  4 +++-
 arch/arm/vdso/vgettimeofday.c | 14 ++++++++------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm/vdso/vdso.lds.S b/arch/arm/vdso/vdso.lds.S
index 74d8d8bc8a40..766aa632e16c 100644
--- a/arch/arm/vdso/vdso.lds.S
+++ b/arch/arm/vdso/vdso.lds.S
@@ -70,9 +70,11 @@ VERSION
 {
 	LINUX_2.6 {
 	global:
+#ifdef CONFIG_COMPAT_32BIT_TIME
 		__vdso_clock_gettime;
-		__vdso_gettimeofday;
 		__vdso_clock_getres;
+#endif /* CONFIG_COMPAT_32BIT_TIME */
+		__vdso_gettimeofday;
 		__vdso_clock_gettime64;
 		__vdso_clock_getres_time64;
 	local: *;
diff --git a/arch/arm/vdso/vgettimeofday.c b/arch/arm/vdso/vgettimeofday.c
index f7a2f5dc2fdc..31702f2f0547 100644
--- a/arch/arm/vdso/vgettimeofday.c
+++ b/arch/arm/vdso/vgettimeofday.c
@@ -10,17 +10,19 @@
 #include <asm/unwind.h>
 #include <vdso/gettime.h>
 
+#ifdef CONFIG_COMPAT_32BIT_TIME
 int __vdso_clock_gettime(clockid_t clock,
 			 struct old_timespec32 *ts)
 {
 	return __cvdso_clock_gettime32(clock, ts);
 }
 
-int __vdso_clock_gettime64(clockid_t clock,
-			   struct __kernel_timespec *ts)
+int __vdso_clock_getres(clockid_t clock_id,
+			struct old_timespec32 *res)
 {
-	return __cvdso_clock_gettime(clock, ts);
+	return __cvdso_clock_getres_time32(clock_id, res);
 }
+#endif /* CONFIG_COMPAT_32BIT_TIME */
 
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
@@ -28,10 +30,10 @@ int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 	return __cvdso_gettimeofday(tv, tz);
 }
 
-int __vdso_clock_getres(clockid_t clock_id,
-			struct old_timespec32 *res)
+int __vdso_clock_gettime64(clockid_t clock,
+			   struct __kernel_timespec *ts)
 {
-	return __cvdso_clock_getres_time32(clock_id, res);
+	return __cvdso_clock_gettime(clock, ts);
 }
 
 int __vdso_clock_getres_time64(clockid_t clock_id, struct __kernel_timespec *res)

-- 
2.53.0


