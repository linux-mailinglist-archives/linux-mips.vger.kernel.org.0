Return-Path: <linux-mips+bounces-5858-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB48997ED8
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 10:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87118B2278C
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 08:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6238B1C460F;
	Thu, 10 Oct 2024 07:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PVsUO368";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cLvqHqyS"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711B71C330A;
	Thu, 10 Oct 2024 07:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543736; cv=none; b=EoxlcmcT6swDu/rgj28ckBeQfktmXUKHNHppjzSJrTTW1Q+EX7JBU+j9FMvNil1LJ0O8dZ4wt506ml9IcsmgZ1D1+XDmE7RkSRUxMsja4Cp3QeCGHKWrfY6zpSeqP5g6RS9vMfgLOuSL6t+LHyBleN/D8+bL0sfjd4fR6b6+ZL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543736; c=relaxed/simple;
	bh=UVvHeMYo/4L1aZCClOsAJMCXlWGGvhyJSXRP56wXKoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vB8L5ZTT3S3ZwPTC8VI+xSW51uou3ZMJ3fgDsIsLsipxRbJOTdWMcAIBd1u49MwM1NvuB2M5VUO/Ks2KFAYsAtbVjtxwSRyx63Ove5+WFdk3FixY7TpBvpM+Y7QgHaFQmluDvoxTyIkkxz5HFSvmC3CQgLEy6n1nYnBH/QmiMR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PVsUO368; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cLvqHqyS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZZQlViVgS+2LcEo+qdBKA00fw+gxukShi7G3ebpqnY=;
	b=PVsUO368dvql/siKBcpr9l5wYV4gYvcYn+cxK8Bxegv6YBpSjlkgXybg8U/1i1nMy9++e2
	42nElRgzH1PBc+dSbfyFDW8aSC0HBfV3Aadzkj6Cpyp+e59OoY0g+cQndaUKRJbu4CO7DM
	o8rkBzg6kV1RR+JyoGzS2VR73qMblxTf04SSnaKYQK2EYn1rTEb3Pu+SgXzPngSo3ERkQ0
	TofPkQyQHnJ4jtDyurMvGZEZCTa7ECfE4BhsPZlXUYE/Vl6tN9HLshReXkL6u4vAR+7nFs
	SO/EWZU2mJglWlFygDzUbPHhwxnrPFhEH1Vh9KZa/9zbni2aeTD6VtWRsRjEmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZZQlViVgS+2LcEo+qdBKA00fw+gxukShi7G3ebpqnY=;
	b=cLvqHqySEHPZv1US1u8oDr9/h69opZq35kGQUn624MzSrtK+ViZDTJRnanJyDRS+U2H/Hg
	2sObeUVzRaZbQuBg==
Date: Thu, 10 Oct 2024 09:01:20 +0200
Subject: [PATCH 18/28] x86: vdso: Access vdso data without vvar.h
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-18-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2055;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=UVvHeMYo/4L1aZCClOsAJMCXlWGGvhyJSXRP56wXKoU=;
 b=Aw70U3TtTDgXoPoGX+ZU4CBMgh7YOqogGwOrL3DIezjMDNN7aimwPWM/gowDGA3eCE5TmK29N
 cDgvvkWxm5WBH3Pxzm3+MzflaZU+Rl+tz3bBifk8tkeFXLxlyVbS9Y9
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The vdso_data is at the start of the vvar page.
Make use of this invariant to remove the usage of vvar.h.
This also matches the logic for the timens data.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/vdso-layout.lds.S    | 5 -----
 arch/x86/include/asm/vdso/gettimeofday.h | 6 +++---
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso-layout.lds.S b/arch/x86/entry/vdso/vdso-layout.lds.S
index c7e194b6e47def3bfa681b3ec5d45cfffbe839d2..9e602c0615243f8667498ac245c2aaf1b35dcd16 100644
--- a/arch/x86/entry/vdso/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/vdso-layout.lds.S
@@ -20,11 +20,6 @@ SECTIONS
 	vvar_start = . - 4 * PAGE_SIZE;
 	vvar_page  = vvar_start;
 
-	/* Place all vvars at the offsets in asm/vvar.h. */
-#define EMIT_VVAR(name, offset) vvar_ ## name = vvar_page + offset;
-#include <asm/vvar.h>
-#undef EMIT_VVAR
-
 	vdso_rng_data = vvar_page + __VDSO_RND_DATA_OFFSET;
 
 	pvclock_page = vvar_start + PAGE_SIZE;
diff --git a/arch/x86/include/asm/vdso/gettimeofday.h b/arch/x86/include/asm/vdso/gettimeofday.h
index 1e6116172a65cd07ef29092dba6241d719f07448..375a34b0f365792ec108381d7c7229f8351448f7 100644
--- a/arch/x86/include/asm/vdso/gettimeofday.h
+++ b/arch/x86/include/asm/vdso/gettimeofday.h
@@ -14,13 +14,13 @@
 
 #include <uapi/linux/time.h>
 #include <asm/vgtod.h>
-#include <asm/vvar.h>
 #include <asm/unistd.h>
 #include <asm/msr.h>
 #include <asm/pvclock.h>
 #include <clocksource/hyperv_timer.h>
 
-#define __vdso_data (VVAR(_vdso_data))
+extern struct vdso_data vvar_page
+	__attribute__((visibility("hidden")));
 
 extern struct vdso_data timens_page
 	__attribute__((visibility("hidden")));
@@ -277,7 +277,7 @@ static inline u64 __arch_get_hw_counter(s32 clock_mode,
 
 static __always_inline const struct vdso_data *__arch_get_vdso_data(void)
 {
-	return __vdso_data;
+	return &vvar_page;
 }
 
 static inline bool arch_vdso_clocksource_ok(const struct vdso_data *vd)

-- 
2.47.0


