Return-Path: <linux-mips+bounces-13346-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CJ2Mvrkp2mrlAAAu9opvQ
	(envelope-from <linux-mips+bounces-13346-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 08:53:30 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB321FBFC0
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 08:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27FEF30AB65F
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 07:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A0A390C9B;
	Wed,  4 Mar 2026 07:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lTOD78Xe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="g73Ugvgn"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992C638F254;
	Wed,  4 Mar 2026 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772610564; cv=none; b=WvlhDmb0g1hiXQTcDwlsszX9/AsN8Y64AgHVTo43bIfT0iYi/DWWkR0FC56hgk8oYAx3b3u6p/S+IqO2oYNda6TFpD5aAV/2O0qUXdNZAKrooquLrmJtlVnJzHpY37YTmK92nOGPjomyG2pcFITBQe1Sh4hsN4ZL6mQgqzpaNqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772610564; c=relaxed/simple;
	bh=MNZEUW6M8syIcj66jnZDrROQra2sbKC2bYbyN7iI9dE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e934yorbp1C0E0IdWZi909XRuBHHpb9LbL2jY47tzMLK13GpH4kQhPa/7Z/g07r4h1XHCj8Hs6Cb1nmstV/2P2gCCNTSCN3x05z/SppnSBb3J1gnJSglMUs012jnw3Du0+cPv9Y2oDEusNKd0Eg4nOCZaMGb2+utIQztmK4eVNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lTOD78Xe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=g73Ugvgn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772610555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bg7n45l3BhxjQl2mgK6tZyeAOE3I5YycolIzoCC4NDY=;
	b=lTOD78Xe94uc1KdWphFN02t8RRANHlqTV+ltXDRfp88yRt+1aIhBO4PYUjTCOqo6c+L9bg
	jmaAbSdKVYJq5zS+tSlawyW9Q+NOflyF6BMQ4E/ARa9Nc/k7aTdv/iIEW+fgsTsjOTBeB+
	pqNaBN2ZdPOSINd2p+kyW83xKMSq4yJcABWiLSWzTSZQKA5oP2AsNW/jDNnjNEyy0mCPvC
	ozz8c2va6gxS17ckMi6wgp4b3FgLAVwrmCNzTErnG9r2qlS44+e42Mv0LJe0OFi4dRnWL+
	dl0ZYar8Z8OgutWi40Vte94dZZIZe/1X6Hrcx3Rc+y2V4+vvLJxCxrseelo7vA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772610555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bg7n45l3BhxjQl2mgK6tZyeAOE3I5YycolIzoCC4NDY=;
	b=g73UgvgnqZt+77yUZp05qYt8zKLP2434x0orfQ+2QiuTsIJXxk3UcM5PQXd5xMNFuAAiwq
	dKJG/IABFLN8ScAA==
Date: Wed, 04 Mar 2026 08:49:06 +0100
Subject: [PATCH v6 09/14] sparc64: vdso: Introduce vdso/processor.h
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-vdso-sparc64-generic-2-v6-9-d8eb3b0e1410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772610551; l=4546;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MNZEUW6M8syIcj66jnZDrROQra2sbKC2bYbyN7iI9dE=;
 b=17XaTEXthlAZd+cHLsVCZsZ7RGr32B6aj0u9EBT6lr2dChc81D5X3sAveJ7v3v/7jDkCGypoW
 yIIPmzALosvDvosr77dMJ4acqURTb45wGP4zJdwYp90fuxyv6epxy/H
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: 7BB321FBFC0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,davemloft.net,gaisler.com,oracle.com,google.com,physik.fu-berlin.de,mit.edu,zx2c4.com,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,onemain.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13346-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:dkim,linutronix.de:email,linutronix.de:mid,gaisler.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

The generic vDSO library expects a vdso/processor.h with an definition of
cpu_relax().

Split out cpu_relax() into this dedicated header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
Acked-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/processor.h      |  3 +++
 arch/sparc/include/asm/processor_32.h   |  2 --
 arch/sparc/include/asm/processor_64.h   | 25 --------------------
 arch/sparc/include/asm/vdso/processor.h | 41 +++++++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/arch/sparc/include/asm/processor.h b/arch/sparc/include/asm/processor.h
index 18295ea625dd..e34de956519a 100644
--- a/arch/sparc/include/asm/processor.h
+++ b/arch/sparc/include/asm/processor.h
@@ -1,6 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef ___ASM_SPARC_PROCESSOR_H
 #define ___ASM_SPARC_PROCESSOR_H
+
+#include <asm/vdso/processor.h>
+
 #if defined(__sparc__) && defined(__arch64__)
 #include <asm/processor_64.h>
 #else
diff --git a/arch/sparc/include/asm/processor_32.h b/arch/sparc/include/asm/processor_32.h
index ba8b70ffec08..a074d313f4f8 100644
--- a/arch/sparc/include/asm/processor_32.h
+++ b/arch/sparc/include/asm/processor_32.h
@@ -91,8 +91,6 @@ unsigned long __get_wchan(struct task_struct *);
 extern struct task_struct *last_task_used_math;
 int do_mathemu(struct pt_regs *regs, struct task_struct *fpt);
 
-#define cpu_relax()	barrier()
-
 extern void (*sparc_idle)(void);
 
 #endif
diff --git a/arch/sparc/include/asm/processor_64.h b/arch/sparc/include/asm/processor_64.h
index 321859454ca4..485070495263 100644
--- a/arch/sparc/include/asm/processor_64.h
+++ b/arch/sparc/include/asm/processor_64.h
@@ -182,31 +182,6 @@ unsigned long __get_wchan(struct task_struct *task);
 #define KSTK_EIP(tsk)  (task_pt_regs(tsk)->tpc)
 #define KSTK_ESP(tsk)  (task_pt_regs(tsk)->u_regs[UREG_FP])
 
-/* Please see the commentary in asm/backoff.h for a description of
- * what these instructions are doing and how they have been chosen.
- * To make a long story short, we are trying to yield the current cpu
- * strand during busy loops.
- */
-#ifdef	BUILD_VDSO
-#define	cpu_relax()	asm volatile("\n99:\n\t"			\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     ::: "memory")
-#else /* ! BUILD_VDSO */
-#define cpu_relax()	asm volatile("\n99:\n\t"			\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     ".section	.pause_3insn_patch,\"ax\"\n\t"\
-				     ".word	99b\n\t"		\
-				     "wr	%%g0, 128, %%asr27\n\t"	\
-				     "nop\n\t"				\
-				     "nop\n\t"				\
-				     ".previous"			\
-				     ::: "memory")
-#endif
-
 /* Prefetch support.  This is tuned for UltraSPARC-III and later.
  * UltraSPARC-I will treat these as nops, and UltraSPARC-II has
  * a shallower prefetch queue than later chips.
diff --git a/arch/sparc/include/asm/vdso/processor.h b/arch/sparc/include/asm/vdso/processor.h
new file mode 100644
index 000000000000..f7a9adc807f7
--- /dev/null
+++ b/arch/sparc/include/asm/vdso/processor.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_SPARC_VDSO_PROCESSOR_H
+#define _ASM_SPARC_VDSO_PROCESSOR_H
+
+#include <linux/compiler.h>
+
+#if defined(__arch64__)
+
+/* Please see the commentary in asm/backoff.h for a description of
+ * what these instructions are doing and how they have been chosen.
+ * To make a long story short, we are trying to yield the current cpu
+ * strand during busy loops.
+ */
+#ifdef	BUILD_VDSO
+#define	cpu_relax()	asm volatile("\n99:\n\t"			\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     ::: "memory")
+#else /* ! BUILD_VDSO */
+#define cpu_relax()	asm volatile("\n99:\n\t"			\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     ".section	.pause_3insn_patch,\"ax\"\n\t"\
+				     ".word	99b\n\t"		\
+				     "wr	%%g0, 128, %%asr27\n\t"	\
+				     "nop\n\t"				\
+				     "nop\n\t"				\
+				     ".previous"			\
+				     ::: "memory")
+#endif /* BUILD_VDSO */
+
+#else /* ! __arch64__ */
+
+#define cpu_relax()	barrier()
+
+#endif /* __arch64__ */
+
+#endif /* _ASM_SPARC_VDSO_PROCESSOR_H */

-- 
2.53.0


