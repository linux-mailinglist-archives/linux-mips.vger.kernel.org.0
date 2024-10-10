Return-Path: <linux-mips+bounces-5853-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CD0997E69
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 09:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC5F21F22B5E
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 07:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0811C2301;
	Thu, 10 Oct 2024 07:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iMS7PJJH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TV4unc1u"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0590D1BE852;
	Thu, 10 Oct 2024 07:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543732; cv=none; b=ecrp2eYdaE9Kzj/OoIFjc2G+mlLaU+kmHYHbgKGo1n4/KA6S3Qf7HmIing2SODcGNk0ouPtIga3lrjlFKTuwyb6s/uMmcZ314S0XeN2GAEhT+DzQttNJt7022jqnPN75voQuCStwQlzFRAvO5hV4vfyqXD3gPY2b5rdGLs4OgKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543732; c=relaxed/simple;
	bh=duktGpmPPCjca1hUrFko89iKyD9xPwp39MHzOJo7rR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DyQ6GFf6eROYz6GPQJwwlfOTtQ5TtBOGqSufa/bpaOg7FZCpioCK/eyJF+47wB2d/NLFo+Ptc0gVzsFv081wXTfjIzaAKbN1uZfJrGFw/TTBSbwwemLlOQXI+vJ4amOYxSGd2EdNd7CgM1rDQ7gSTejVbtAZD3BXy360RFfHlB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iMS7PJJH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TV4unc1u; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jm/2CrqDEYeYltPOiqfTVHvM9k41RoVb5XrgMrSt7cU=;
	b=iMS7PJJHjGGyQAOWkIhx3mGK1ARhnmCDpqbH+A7Ol3abKmvtUbIKI09X8sqoRtM0ZKQ7mx
	VkqlO+WxdeLwlEadLlMyXEIF6llFbYK2Hwg61Pb5O5A5Q1AKY16r/jM4pX3rF7VSA/DF9y
	IZwtcrMl2rDxxcWTxMz/yqj7U4R/9tRCBHnPW39lEYu75V26scajMqFl/aK8kDco9B48ax
	eL2ChHRfRKdTEesLgyw+IkdE0OH5P4818N5UKXA8qVlrfPXHd2AoG1CygP3avo9LH/5iW8
	ILP/eB0/R/rA4pUVmPPCXr0ktkDqJweoX+/URwLfNXXFsTyEOKjYvlTiPb0NmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jm/2CrqDEYeYltPOiqfTVHvM9k41RoVb5XrgMrSt7cU=;
	b=TV4unc1uGTXtFkaS6TTazfjrGgCVpgn8oa3T0LlB5xj7tiIHkUCT6ic8gdd7YU+gxUremR
	Fx/l51wAvwr0ydBw==
Date: Thu, 10 Oct 2024 09:01:15 +0200
Subject: [PATCH 13/28] x86: vdso: Access rng data from kernel without vvar
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-13-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2500;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=duktGpmPPCjca1hUrFko89iKyD9xPwp39MHzOJo7rR4=;
 b=WV9xCByoqmjr2WpGGsix0xq+nmoYDqmnBGL1soMUsv5PBqkCJwXCKiSkCvmLtX8v8ZY4rieFc
 b8m03BVeYmVDGGnR2GuimURiEeBvWIXoti102NiyP/UhkqFrnOZTg3K
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Remove the usage of the vvar _vdso_rng_data from the kernel-space code,
as the x86 vvar machinery is about to be removed.
The definition of the structure is unnecessary, as the data lives in a
page pre-allocated by the linker anyways.
The vdso user-space access to the rng data will be switched soon.

DEFINE_VVAR_SINGLE() is now unused. It will be removed later togehter
with the rest of vvar.h.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/vma.c            | 1 -
 arch/x86/include/asm/vdso/vsyscall.h | 2 +-
 arch/x86/include/asm/vvar.h          | 4 +++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
index b8fed8b8b9ccdb2cdd9912d5ec4cfd6366a6012e..8437906fd4b353ad0fe208d811817a1b6f8f8dcb 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -39,7 +39,6 @@ struct vdso_data *arch_get_vdso_data(void *vvar_page)
 #undef EMIT_VVAR
 
 DEFINE_VVAR(struct vdso_data, _vdso_data);
-DEFINE_VVAR_SINGLE(struct vdso_rng_data, _vdso_rng_data);
 
 unsigned int vclocks_used __read_mostly;
 
diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso/vsyscall.h
index 67fedf1698b5e2b710e0504686318949c738bf29..2cbb32a8a45e2f5c7bc02172af0fa09173f33924 100644
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ b/arch/x86/include/asm/vdso/vsyscall.h
@@ -22,7 +22,7 @@ struct vdso_data *__x86_get_k_vdso_data(void)
 static __always_inline
 struct vdso_rng_data *__x86_get_k_vdso_rng_data(void)
 {
-	return &_vdso_rng_data;
+	return (void *)&__vvar_page + __VDSO_RND_DATA_OFFSET;
 }
 #define __arch_get_k_vdso_rng_data __x86_get_k_vdso_rng_data
 
diff --git a/arch/x86/include/asm/vvar.h b/arch/x86/include/asm/vvar.h
index 01e60e0f671e9625669dc8fdacf3cdddf8cbf4fb..fe3434d3b5b1eef806e8328b86650e001b177de2 100644
--- a/arch/x86/include/asm/vvar.h
+++ b/arch/x86/include/asm/vvar.h
@@ -19,6 +19,8 @@
 #ifndef _ASM_X86_VVAR_H
 #define _ASM_X86_VVAR_H
 
+#define __VDSO_RND_DATA_OFFSET  640
+
 #ifdef EMIT_VVAR
 /*
  * EMIT_VVAR() is used by the kernel linker script to put vvars in the
@@ -62,7 +64,7 @@ DECLARE_VVAR(0, struct vdso_data, _vdso_data)
 
 #if !defined(_SINGLE_DATA)
 #define _SINGLE_DATA
-DECLARE_VVAR_SINGLE(640, struct vdso_rng_data, _vdso_rng_data)
+DECLARE_VVAR_SINGLE(__VDSO_RND_DATA_OFFSET, struct vdso_rng_data, _vdso_rng_data)
 #endif
 
 #undef DECLARE_VVAR

-- 
2.47.0


