Return-Path: <linux-mips+bounces-13347-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHOaAPXkp2mrlAAAu9opvQ
	(envelope-from <linux-mips+bounces-13347-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 08:53:25 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A44261FBFA6
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 08:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BCDE30A93A0
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 07:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03943390202;
	Wed,  4 Mar 2026 07:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="si1nHIpe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RBPy+Wwr"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF033890F9;
	Wed,  4 Mar 2026 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772610564; cv=none; b=cAaRYhf5J4c98FYpe7qZUQgJDi2ei27fXIBjUqHLQBnds+cdg3wPXguhKYq+kuxi9E9gKnOszPuH9eLAXWMkKmMxrM7s0tqrw8qT6SdReWQanXp87pMQMA0262eMD3U2z58HDzyhaFoUxWPahwL29eEAjVWMp0j2sjfQ+6IsqzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772610564; c=relaxed/simple;
	bh=C8YCW230M5rXE2VcJlOgioFaWh8W87Cqq8CmebTakik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lkawidqVkmWVJhy7XNQ5AWAa/WughRKyN64FqNVwuvmAEjfgjM4MlVXKvhaiQXP2kkg8prxqoCQDYhmrgmwMWNUWLyVlRbNVFtqsgXLFR7GdUfjZaRRmffjmjGUR6KJZ7Kpo82IwAEluLc0YxdRIbc8GPZoNmr5kt32od+0P470=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=si1nHIpe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RBPy+Wwr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772610557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJZ1pwrXAqlKUYtB5+5jpFWrSTMk86qxlLyLKpnOqTY=;
	b=si1nHIpeDJnRwi+9zITHrh4ndA1vhySIJNOF/s8rpCV51ogvYAWGAufwoi8EBscYMcmgPi
	MPz2eR/gqkEDlEY0L5Y4ENiPv/iEjWWPDNsg3hkGqNPu1F3m4ZeSXmjElZCJORv9AOCS2l
	k26TKVYtJxtpfHMBTJVsEp4f2OOQA4CC3kLJsUVuT4u0vQahYQag4y0QyCfX3g0QuRGK81
	g9ffzoNK0CRCQaHiht+/Sd3z5RCupL+7LMi/9lWO5xl7hfsMFtI/eVvzbPC7eOhXQC7aa/
	srPkr7BGNF+bGQvn077Kdhr8siEebfHVFRFMff8hgjTTAPAZNJYb30dziX0+Tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772610557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJZ1pwrXAqlKUYtB5+5jpFWrSTMk86qxlLyLKpnOqTY=;
	b=RBPy+WwrloZscnb5l/0j/smRrQFN/XY/zTYjhjziioqNYDOoaytL+z04VXi3kU6/RSzauc
	40syK9XYPev06RAA==
Date: Wed, 04 Mar 2026 08:49:10 +0100
Subject: [PATCH v6 13/14] sparc64: vdso: Implement clock_gettime64()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-vdso-sparc64-generic-2-v6-13-d8eb3b0e1410@linutronix.de>
References: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, 
 Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772610551; l=3213;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=C8YCW230M5rXE2VcJlOgioFaWh8W87Cqq8CmebTakik=;
 b=QSIu2p7Bk3dfxgh6a4fNbnxFXTLanj8QRuxQCp+k6gh1o8MLaR+X9yZBaoIqfX6Wh6QLnAvyJ
 kw0HflYyGrtDhom/Z0UaYPNYCr/wIKU+1CGR7R/QaAkSGxpcaHkyIEz
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: A44261FBFA6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,davemloft.net,gaisler.com,oracle.com,google.com,physik.fu-berlin.de,mit.edu,zx2c4.com,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,onemain.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13347-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:dkim,linutronix.de:email,linutronix.de:mid,gaisler.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

To be y2038-safe, 32-bit userspace needs to explicitly call the 64-bit safe
time APIs.

Implement clock_gettime64() in the 32-bit vDSO.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
Acked-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/vdso/gettimeofday.h | 20 ++++++++++++++++++--
 arch/sparc/vdso/vclock_gettime.c           |  8 ++++++++
 arch/sparc/vdso/vdso32/vdso32.lds.S        |  2 ++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/include/asm/vdso/gettimeofday.h b/arch/sparc/include/asm/vdso/gettimeofday.h
index a35875fba454..b0c80c8a28bb 100644
--- a/arch/sparc/include/asm/vdso/gettimeofday.h
+++ b/arch/sparc/include/asm/vdso/gettimeofday.h
@@ -101,6 +101,8 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode, const struct vd
 	"f48", "f50", "f52", "f54", "f56", "f58", "f60", "f62",		\
 	"cc", "memory"
 
+#ifdef CONFIG_SPARC64
+
 static __always_inline
 long clock_gettime_fallback(clockid_t clock, struct __kernel_timespec *ts)
 {
@@ -113,7 +115,20 @@ long clock_gettime_fallback(clockid_t clock, struct __kernel_timespec *ts)
 	return o0;
 }
 
-#ifndef CONFIG_SPARC64
+#else /* !CONFIG_SPARC64 */
+
+static __always_inline
+long clock_gettime_fallback(clockid_t clock, struct __kernel_timespec *ts)
+{
+	register long num __asm__("g1") = __NR_clock_gettime64;
+	register long o0 __asm__("o0") = clock;
+	register long o1 __asm__("o1") = (long) ts;
+
+	__asm__ __volatile__(SYSCALL_STRING : "=r" (o0) : "r" (num),
+			     "0" (o0), "r" (o1) : SYSCALL_CLOBBERS);
+	return o0;
+}
+
 static __always_inline
 long clock_gettime32_fallback(clockid_t clock, struct old_timespec32 *ts)
 {
@@ -125,7 +140,8 @@ long clock_gettime32_fallback(clockid_t clock, struct old_timespec32 *ts)
 			     "0" (o0), "r" (o1) : SYSCALL_CLOBBERS);
 	return o0;
 }
-#endif
+
+#endif /* CONFIG_SPARC64 */
 
 static __always_inline
 long gettimeofday_fallback(struct __kernel_old_timeval *tv, struct timezone *tz)
diff --git a/arch/sparc/vdso/vclock_gettime.c b/arch/sparc/vdso/vclock_gettime.c
index 093a7ff4dafc..1d9859392e4c 100644
--- a/arch/sparc/vdso/vclock_gettime.c
+++ b/arch/sparc/vdso/vclock_gettime.c
@@ -48,4 +48,12 @@ int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts)
 int clock_gettime(clockid_t, struct old_timespec32 *)
 	__weak __alias(__vdso_clock_gettime);
 
+int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts)
+{
+	return __cvdso_clock_gettime(clock, ts);
+}
+
+int clock_gettime64(clockid_t, struct __kernel_timespec *)
+	__weak __alias(__vdso_clock_gettime64);
+
 #endif
diff --git a/arch/sparc/vdso/vdso32/vdso32.lds.S b/arch/sparc/vdso/vdso32/vdso32.lds.S
index 53575ee154c4..a14e4f77e6f2 100644
--- a/arch/sparc/vdso/vdso32/vdso32.lds.S
+++ b/arch/sparc/vdso/vdso32/vdso32.lds.S
@@ -17,6 +17,8 @@ VERSION {
 	global:
 		clock_gettime;
 		__vdso_clock_gettime;
+		clock_gettime64;
+		__vdso_clock_gettime64;
 		gettimeofday;
 		__vdso_gettimeofday;
 	local: *;

-- 
2.53.0


