Return-Path: <linux-mips+bounces-13274-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MyuHcVAoWnsrQQAu9opvQ
	(envelope-from <linux-mips+bounces-13274-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 07:59:17 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F211B3994
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 07:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4766C3123317
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 06:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD093ECBEB;
	Fri, 27 Feb 2026 06:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w0103LqB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dwQQbZwa"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6956A3D903C;
	Fri, 27 Feb 2026 06:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772175472; cv=none; b=nDLX4xEpJp7PhKBRmDkP45IgtyJJD0teufKK1cjxW7wp9uO2IeDSfZGZUmSMoV+E8Z65+ioG7NcRpEULVZIpo5S9tPhUaeH4TgOZH8kG5H48SsoHXVzHJIxOVX8o7+5OnKz+da6EKZKpES0HHjxksq7yNKJx59S9dvy6y0zUGUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772175472; c=relaxed/simple;
	bh=Xv3eH/9VHgNpvqglSUhIiLYYyy1PpoIoaT4yuSsTW5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tZYYRuoPCLzjNryHeHw2MZCPsRqYbBR8v9BaFCLGsDmU9KtP+j3k7o7g+QmYqXn3Bi6rVcuxJVmORAW1+C2rirxg7V4nvZq5gZAEPLo4ekOPAhEisTdIwjzJ4RPS3molMe5sFv8v+oZYGuQ9H3S5Gn7Qrbr8+xMhuf30QwudNvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=w0103LqB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dwQQbZwa; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772175469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tB8OLfzV0yLcpSZIz+yX61nKI7piyON1S04PRpwPwsA=;
	b=w0103LqBgb+JA2hk7slblHRyqhjUgMxbAPY1uaHto4KknOa65o5qZhZJlSzj8WaWXUL5rJ
	KLQwaABcEs70WKppllRY1NLTTt2BT0xHaV0kBtAvE7bFTL2FPzPjEa4GOXFIYJ/jmoGkhr
	UUvlfEzXcdEgDcn1zS4TirH4v9LMx/IHqPQmd/W+N1tbZaRayrZUWQ6d6bti51du61LToX
	NJXofMLo0aDmkuXFlmANrlPNT8nqVo9yLDssTkhF5+JJH6ARgWCCEwM1DB/H7/ZtUuOvRc
	CoXCN/nr3ixC4OrC+cVsh8RWFkHdVUgZUcfm0zezs16N1YdLY0FvPLFXdILOFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772175469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tB8OLfzV0yLcpSZIz+yX61nKI7piyON1S04PRpwPwsA=;
	b=dwQQbZwa0iNY4Z2tCRDuTF0yTx5tJzYwPhL58hNbssVKjkzYmrS56sigv0jtjlcjwdR3qc
	sBdobaHcn+xe0xAA==
Date: Fri, 27 Feb 2026 07:57:43 +0100
Subject: [PATCH 4/7] powerpc/vdso: Respect COMPAT_32BIT_TIME
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-compat_32bit_time-v1-4-3f0286a7bac3@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175466; l=4469;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Xv3eH/9VHgNpvqglSUhIiLYYyy1PpoIoaT4yuSsTW5M=;
 b=MdmjO5KPhmsMXEd+ePjxhegLEWrjviduid5rr6rky5WJ94+NBzZC0pKA3jwyXKw3kLi1cCcfS
 /XYsS38ugRTB2pvIoZOiDkb7YT3sStIbRvJA37ZRPZfVvanqzK6DEU9
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13274-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: D9F211B3994
X-Rspamd-Action: no action

If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
provide any 32-bit time related functionality. This is the intended
effect of the kconfig option and also the fallback system calls would
also not be implemented.

Currently the kconfig option does not affect the gettimeofday() syscall,
so also keep that in the vDSO.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/kernel/vdso/gettimeofday.S  |  6 ++++++
 arch/powerpc/kernel/vdso/vdso32.lds.S    | 10 ++++++----
 arch/powerpc/kernel/vdso/vgettimeofday.c | 16 ++++++++++------
 3 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kernel/vdso/gettimeofday.S
index 1c8e51691bf8..c8fda56ac520 100644
--- a/arch/powerpc/kernel/vdso/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso/gettimeofday.S
@@ -77,9 +77,11 @@ V_FUNCTION_END(__kernel_gettimeofday)
  * int __kernel_clock_gettime(clockid_t clock_id, struct timespec *tp);
  *
  */
+#if defined(__powerpc64__) || defined(CONFIG_COMPAT_32BIT_TIME)
 V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	cvdso_call __c_kernel_clock_gettime
 V_FUNCTION_END(__kernel_clock_gettime)
+#endif
 
 /*
  * Exact prototype of clock_gettime64()
@@ -99,9 +101,11 @@ V_FUNCTION_END(__kernel_clock_gettime64)
  * int __kernel_clock_getres(clockid_t clock_id, struct timespec *res);
  *
  */
+#if defined(__powerpc64__) || defined(CONFIG_COMPAT_32BIT_TIME)
 V_FUNCTION_BEGIN(__kernel_clock_getres)
 	cvdso_call __c_kernel_clock_getres
 V_FUNCTION_END(__kernel_clock_getres)
+#endif
 
 /*
  * Exact prototype of clock_getres_time64()
@@ -122,6 +126,8 @@ V_FUNCTION_END(__kernel_clock_getres_time64)
  * time_t time(time *t);
  *
  */
+#if defined(__powerpc64__) || defined(CONFIG_COMPAT_32BIT_TIME)
 V_FUNCTION_BEGIN(__kernel_time)
 	cvdso_call __c_kernel_time call_time=1
 V_FUNCTION_END(__kernel_time)
+#endif
diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
index 3f384a2526ae..53fe3796a571 100644
--- a/arch/powerpc/kernel/vdso/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
@@ -119,13 +119,15 @@ VERSION
 {
 	VDSO_VERSION_STRING {
 	global:
-		__kernel_get_syscall_map;
-		__kernel_gettimeofday;
+#ifdef CONFIG_COMPAT_32BIT_TIME
 		__kernel_clock_gettime;
-		__kernel_clock_gettime64;
 		__kernel_clock_getres;
-		__kernel_clock_getres_time64;
 		__kernel_time;
+#endif /* CONFIG_COMPAT_32BIT_TIME */
+		__kernel_gettimeofday;
+		__kernel_get_syscall_map;
+		__kernel_clock_gettime64;
+		__kernel_clock_getres_time64;
 		__kernel_get_tbfreq;
 		__kernel_sync_dicache;
 		__kernel_sigtramp32;
diff --git a/arch/powerpc/kernel/vdso/vgettimeofday.c b/arch/powerpc/kernel/vdso/vgettimeofday.c
index 3c194e1ab562..dfefd13a19e1 100644
--- a/arch/powerpc/kernel/vdso/vgettimeofday.c
+++ b/arch/powerpc/kernel/vdso/vgettimeofday.c
@@ -18,23 +18,25 @@ int __c_kernel_clock_getres(clockid_t clock_id, struct __kernel_timespec *res,
 	return __cvdso_clock_getres_data(vd, clock_id, res);
 }
 #else
+#ifdef CONFIG_COMPAT_32BIT_TIME
 int __c_kernel_clock_gettime(clockid_t clock, struct old_timespec32 *ts,
 			     const struct vdso_time_data *vd)
 {
 	return __cvdso_clock_gettime32_data(vd, clock, ts);
 }
 
-int __c_kernel_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts,
-			       const struct vdso_time_data *vd)
-{
-	return __cvdso_clock_gettime_data(vd, clock, ts);
-}
-
 int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res,
 			    const struct vdso_time_data *vd)
 {
 	return __cvdso_clock_getres_time32_data(vd, clock_id, res);
 }
+#endif /* CONFIG_COMPAT_32BIT_TIME */
+
+int __c_kernel_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts,
+			       const struct vdso_time_data *vd)
+{
+	return __cvdso_clock_gettime_data(vd, clock, ts);
+}
 
 int __c_kernel_clock_getres_time64(clockid_t clock_id, struct __kernel_timespec *res,
 				   const struct vdso_time_data *vd)
@@ -49,7 +51,9 @@ int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz
 	return __cvdso_gettimeofday_data(vd, tv, tz);
 }
 
+#if defined(__powerpc64__) || defined(CONFIG_COMPAT_32BIT_TIME)
 __kernel_old_time_t __c_kernel_time(__kernel_old_time_t *time, const struct vdso_time_data *vd)
 {
 	return __cvdso_time_data(vd, time);
 }
+#endif

-- 
2.53.0


