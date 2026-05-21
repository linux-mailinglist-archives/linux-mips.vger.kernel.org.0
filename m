Return-Path: <linux-mips+bounces-14672-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO2rHv6sDmr6AwYAu9opvQ
	(envelope-from <linux-mips+bounces-14672-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:58:06 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D8159FC67
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1C9730AB817
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 06:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7DB399CE4;
	Thu, 21 May 2026 06:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vEmrbzM2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zxMnuBSR"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9B3395ADA;
	Thu, 21 May 2026 06:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346407; cv=none; b=Rxl4R3xwSxDqeIv3ALJm+0jOySJU2SAiXoWodeiWUcedyJoiWxEN9KWswXZnLx6AAobw0+wLDuUh6aFxcgg8kb4+jTopuAEf7hmBrJAwoXJYEt+5itUZPnl0X2kLEy6EgPsjGFw44M8Eqg4/i+qslJHVP581yZcUxuFD+mQh1NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346407; c=relaxed/simple;
	bh=eag02RGWeVs4N05gOsKq3PdNBZN2b6GqI/QPQiVunD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UTKGimL1mQ71Is6lz6UW4QtuVPfwanUjibY00UYZTd4g7mBfxv1c92FZba/98rkmo8fm6QWzvPpRu4BzvVpjQzlMJ3NvU6IowRGI5Jhu/Oq1st1gWrQx1u2GYzdTIaFukGy45Gobg0LSSrWiVj/LQLtLLaYg37E0nmjU6o0FTiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vEmrbzM2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zxMnuBSR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779346404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J8rCI749cvyOIfOoBqSsJlC5HeQj+h0l8nwmIUsQvwU=;
	b=vEmrbzM2nKlA0grWn8T4+SAAIr6pDpC601rkC2GmCcDUYW4xO2oxz7NaK+xgKoSbU5u/qk
	TprX5vtFBmmcTvQpTVuhc9xqXVPDH2KOZwcCioZELdkPG4/DVGQUZ7Vw76il6EXozG2LeH
	TGeybEqCh6by+D8gG5/EBbFnhgesHbj95rjntR0iaQp1fEUhYq/Vfb37y2diWoSknMHksT
	S/DgVh2gNe7thH/0YVHhiXIkRXp28OR2Xu5sLRVAgRqH91lwKSLv2EEvL6izHk71BtyPLy
	xtOQaoUr+l0DO0FWpNK9sLNY1yOpnu12jemd42HdPevEhYGhztUk7rrNxaZ/JA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779346404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J8rCI749cvyOIfOoBqSsJlC5HeQj+h0l8nwmIUsQvwU=;
	b=zxMnuBSRqAh+HL9hu7muQyC0o6OXj8ibHApzCPn/L+T/ftHbdihEL8pHXdn/E0f2HfPUXx
	3coQ2Sg5z+wX6gCg==
Date: Thu, 21 May 2026 08:53:23 +0200
Subject: [PATCH 9/9] MIPS: VDSO: Fold MIPS_CLOCK_VSYSCALL into
 MIPS_GENERIC_GETTIMEOFDAY
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-vdso-mips-kconfig-v1-9-2f79dcd6c78f@linutronix.de>
References: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
In-Reply-To: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779346397; l=3671;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=eag02RGWeVs4N05gOsKq3PdNBZN2b6GqI/QPQiVunD8=;
 b=LNMq2hdnk+3K9uBLffI+RiDtgv+BBRtgKTMouPXaukLdm1V7L5Hm0VzR/7gZ14wPBR98AjcyM
 ASUeLQSEYVSANyu+t6az6G4rl4V6l5PKYYuz5aWq0cJg1lbm9Jjovyu
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14672-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Queue-Id: D2D8159FC67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This configuration option exists so "that we don't provide the symbol
when there's no possibility of there being a usable clocksource".
However it only covers __vdso_gettimeofday() and none of the other vDSO
functions which should be affected by the same circumstances.slightly slightly.

Remove MIPS_CLOCK_VSYSCALL and fold its usecase into
MIPS_GENERIC_GETTIMEOFDAY, which works correctly.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

---
A different variant of this was originally part of another series [0].

[0] https://lore.kernel.org/lkml/20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de/
---
 arch/mips/Kconfig              |  4 +---
 arch/mips/vdso/vdso.lds.S      |  2 --
 arch/mips/vdso/vgettimeofday.c | 20 --------------------
 3 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d545a50c4bd5..fcfa16b483a8 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1133,9 +1133,6 @@ config CSRC_R4K
 config CSRC_SB1250
 	bool
 
-config MIPS_CLOCK_VSYSCALL
-	def_bool CSRC_R4K || CLKSRC_MIPS_GIC
-
 config GPIO_TXX9
 	select GPIOLIB
 	bool
@@ -3172,6 +3169,7 @@ config MIPS_GENERIC_GETTIMEOFDAY
 	select GENERIC_GETTIMEOFDAY
 	select GENERIC_TIME_VSYSCALL
 	select HAVE_GENERIC_VDSO
+	depends on CSRC_R4K || CLKSRC_MIPS_GIC
 	# GCC (at least up to version 9.2) appears to emit function calls that make use
 	# of the GOT when targeting microMIPS, which we can't use in the VDSO due to
 	# the lack of relocations. As such, we disable the VDSO for microMIPS builds.
diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index fd263b05d3e7..05badf3ae0ff 100644
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
2.54.0


