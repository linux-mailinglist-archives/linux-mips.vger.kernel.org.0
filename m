Return-Path: <linux-mips+bounces-5856-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF98A997E78
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 09:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FE21B21F6D
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 07:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8411C3F04;
	Thu, 10 Oct 2024 07:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SVOAmEfp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fxHYPA0y"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B631C2439;
	Thu, 10 Oct 2024 07:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543734; cv=none; b=FLhU5vtOTJm4udMx+Qwma/L+4n2r9FEWYoul4/MVvIjz9dHQq7Kvz5zHdw+DH6GkmovcwTqR0rlJuWt1MTZW8oLB4z1biIsp0QiNeJdKCz+H3aWSvtSyrVmMf+t1xUJnntQWfy1RuvjzKSTcjZC4FAWeDYADwWD2y6ji00Y3gnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543734; c=relaxed/simple;
	bh=mPoW5wkTlEwrk7j/HBgEku1axNP1bE6//krdhLeEj6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XDqWnAihtPJTJjs8WPXjM2Mmo49U7etdxGUjXaQigtywlncLfgRXuSJqDdV1BI8v37EVMeHCqFZw0ZeIuCIcMz+tbPxr0N397LYt0qFdLsRDCjEM67xszJbhpSl6y4t83AJ1e4lmuIxJNHoMotUYBoZR8++f21xVtQDvMP8AFDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SVOAmEfp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fxHYPA0y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOmDYcigYQIrIJIh3Um8635h5qr4veQV5uL1dAIYrXA=;
	b=SVOAmEfpcB9zjCSlIl/abBlZtdgNslJZDJhREX69+DVllRbdyJNzuQ9AUCZ75N6Gz4WpZ7
	ZzujaAdmYucVDATv5ONGlJ2963QEzqFmk/Rk9S6pFIMYiCxodZILexuFmlQMMzMDNC+87s
	K0BdiS1EdKrWR0R5MRBmx7Ffm4zulKbHUGftMJBMzRtA0nmpseK4qzdOKsuVVkSxDG2VHq
	lHdzYfeiBMnlcxyrOurvyj6FQlKxtzMxqhO2rciK5mFv1Nkp817+IPI2195wt4Q35Br1Ea
	wqlXmTuoPsoo1NFKXetYn4Ucz4lsPC0KyLg6pbZvs6LOWRxmNNASWOz5JhGhGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOmDYcigYQIrIJIh3Um8635h5qr4veQV5uL1dAIYrXA=;
	b=fxHYPA0y490ySRRaI+Ew/229aCO/TeUTWvw3My8s0Y/ybAlV0Dr/e+mn6NyTne6zMb0eLm
	w824UqsUTq7vi+BA==
Date: Thu, 10 Oct 2024 09:01:18 +0200
Subject: [PATCH 16/28] x86: vdso: Access rng vdso data without vvar.h
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-16-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2664;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=mPoW5wkTlEwrk7j/HBgEku1axNP1bE6//krdhLeEj6A=;
 b=SOS85n3wR1QQHupApY/YV5xsjsehWzr0JxWLt8ReYzlvQC1/64wff4+HN/GVvYTspFT1+NgJm
 f2EbWP1fw2vAOLJykZQlYW9djXtP20HkUIkKEWSQ98SEQdV4MsIKmia
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The vdso_rng_data is at a well-known offset in the vvar page.
Make use of this invariant to remove the usage of vvar.h.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/vdso-layout.lds.S | 2 ++
 arch/x86/include/asm/vdso/getrandom.h | 8 ++++----
 arch/x86/include/asm/vvar.h           | 5 -----
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso-layout.lds.S b/arch/x86/entry/vdso/vdso-layout.lds.S
index 51c0cc0119748dda0f29d577197c520f272fd02f..acce60732e541f49dfc21d75e1b525c8a74f2341 100644
--- a/arch/x86/entry/vdso/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/vdso-layout.lds.S
@@ -24,6 +24,8 @@ SECTIONS
 #include <asm/vvar.h>
 #undef EMIT_VVAR
 
+	vdso_rng_data = vvar_page + __VDSO_RND_DATA_OFFSET;
+
 	pvclock_page = vvar_start + PAGE_SIZE;
 	hvclock_page = vvar_start + 2 * PAGE_SIZE;
 	timens_page  = vvar_start + 3 * PAGE_SIZE;
diff --git a/arch/x86/include/asm/vdso/getrandom.h b/arch/x86/include/asm/vdso/getrandom.h
index d0713c829254cc8172c5903a1fdba168b52ff1ea..2bf9c0e970c3e7d2a2ddfcb1d007cb73da200494 100644
--- a/arch/x86/include/asm/vdso/getrandom.h
+++ b/arch/x86/include/asm/vdso/getrandom.h
@@ -8,7 +8,6 @@
 #ifndef __ASSEMBLY__
 
 #include <asm/unistd.h>
-#include <asm/vvar.h>
 
 /**
  * getrandom_syscall - Invoke the getrandom() syscall.
@@ -28,13 +27,14 @@ static __always_inline ssize_t getrandom_syscall(void *buffer, size_t len, unsig
 	return ret;
 }
 
-#define __vdso_rng_data (VVAR(_vdso_rng_data))
+extern struct vdso_rng_data vdso_rng_data
+	__attribute__((visibility("hidden")));
 
 static __always_inline const struct vdso_rng_data *__arch_get_vdso_rng_data(void)
 {
 	if (IS_ENABLED(CONFIG_TIME_NS) && __arch_get_vdso_data()->clock_mode == VDSO_CLOCKMODE_TIMENS)
-		return (void *)&__vdso_rng_data + ((void *)&timens_page - (void *)__arch_get_vdso_data());
-	return &__vdso_rng_data;
+		return (void *)&vdso_rng_data + ((void *)&timens_page - (void *)__arch_get_vdso_data());
+	return &vdso_rng_data;
 }
 
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/x86/include/asm/vvar.h b/arch/x86/include/asm/vvar.h
index fe3434d3b5b1eef806e8328b86650e001b177de2..b605914f4d4347c16344e5b5e063697538d4895e 100644
--- a/arch/x86/include/asm/vvar.h
+++ b/arch/x86/include/asm/vvar.h
@@ -62,11 +62,6 @@ extern char __vvar_page;
 
 DECLARE_VVAR(0, struct vdso_data, _vdso_data)
 
-#if !defined(_SINGLE_DATA)
-#define _SINGLE_DATA
-DECLARE_VVAR_SINGLE(__VDSO_RND_DATA_OFFSET, struct vdso_rng_data, _vdso_rng_data)
-#endif
-
 #undef DECLARE_VVAR
 #undef DECLARE_VVAR_SINGLE
 

-- 
2.47.0


