Return-Path: <linux-mips+bounces-5847-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B41997E3E
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 09:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16B5A1F273FD
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 07:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C44C1BD516;
	Thu, 10 Oct 2024 07:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PQ5hRnm0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gKaavZTX"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239CD1BC9EB;
	Thu, 10 Oct 2024 07:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543728; cv=none; b=Yukj7HgAkEhek157mEzRqprn34fBSlztZXM3LPYWiJmXFKNMGbT8Pnm+j6ZrT+WLvYXP0B1uwMqUKt40XhDA3QL1Ps5XTf5IdO4kSVl/vZ+uiUn3d5IWU3WCBoG3AAQbuBRIWgBsfx8SE+R1L3uv3C+pNCWpNjY0VJnY4UPJNCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543728; c=relaxed/simple;
	bh=6Re6IPDsg0EiSptRbunZNSRyEEPrHpkzo4P7+ISqDSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mH4OdoulzbsqeXC1V/mi2LhoHJ9s6EovZxMdcdtNe0Didvvq2aUZYxqGKO+zuucH1+kcFFHUE26xc7eAmdhFV7fWrz8vR93PpFX5JT7QdAo0SKUMdseY/1pXOFbPlsHRqhyb1sPvkOxWLoEnjBTjXjp90ZDAZ2GvFp9JdI3493g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PQ5hRnm0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gKaavZTX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/w4SV1Y0dGlBhI60ju8MIn/OjnT25/XGrSV5vQ9VkA=;
	b=PQ5hRnm0f9UYWTlG6LzTHyD9fPH+nQg/xOsRifCFz96D/eNAPAqPG1vBA+wiPeQBZSOGvj
	PiJkIciUllmrR1BAdqOTzJ0qC0U7h+5030uywATEZwmtat7O78cGT6dUaXq2MHSyIe8UKH
	p8zcqSynsG2FcZdBnnt8XPAY7kasrMRHiyCGOJb+FprXjla6Wl9to5Z/TemOIXavYQD3jT
	WPf5SSBn2UDQpYfbpDUOrrv/lSDf3WFW6ahDCJgyQxWmYPyc/+zPU/bRsTwRPmJbEYjwhy
	ZJpqWynPN6oNR5ViTmGWlwH4/zcEAnVBqeNZoCW2oh804ITwSRKmYzCOdSGdYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/w4SV1Y0dGlBhI60ju8MIn/OjnT25/XGrSV5vQ9VkA=;
	b=gKaavZTXqvJRr+jsvjp+bHPm79VyKKOtnY0AApgyLWhsn2XV8oRWjdhXjNPVpgocX6HGVg
	fqI/T7bPpWSeIRDA==
Date: Thu, 10 Oct 2024 09:01:09 +0200
Subject: [PATCH 07/28] arm: vdso: Remove assembly for datapage access
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-7-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2900;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6Re6IPDsg0EiSptRbunZNSRyEEPrHpkzo4P7+ISqDSI=;
 b=RKzw5wvjbgsa0HF8+jBhQrpsnrQU14AOMrv0q2gs2sUrtA4ASsSZO9n0hyTrQHwhxNNzMRWnU
 NgdQkh9BLtwBXU2tIdz7phptwddOwOAyRAkwG7SWrZwL0R1blOuMFQW
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

vdso/datapage.h provides a hidden declaration for _vdso_data.
When using it the compiler will automatically generate PC-relative
accesses which avoids the need for a custom assembly-based accessor.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/include/asm/vdso/gettimeofday.h |  4 +---
 arch/arm/vdso/Makefile                   |  2 +-
 arch/arm/vdso/datapage.S                 | 16 ----------------
 arch/arm/vdso/vdso.lds.S                 |  3 ++-
 4 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/arch/arm/include/asm/vdso/gettimeofday.h b/arch/arm/include/asm/vdso/gettimeofday.h
index 2134cbd5469feef020ef30494b667b93972f9fac..592d3d015ca7298b3bc35871387dbb3e7f819827 100644
--- a/arch/arm/include/asm/vdso/gettimeofday.h
+++ b/arch/arm/include/asm/vdso/gettimeofday.h
@@ -15,8 +15,6 @@
 
 #define VDSO_HAS_CLOCK_GETRES		1
 
-extern struct vdso_data *__get_datapage(void);
-
 static __always_inline int gettimeofday_fallback(
 				struct __kernel_old_timeval *_tv,
 				struct timezone *_tz)
@@ -139,7 +137,7 @@ static __always_inline u64 __arch_get_hw_counter(int clock_mode,
 
 static __always_inline const struct vdso_data *__arch_get_vdso_data(void)
 {
-	return __get_datapage();
+	return _vdso_data;
 }
 
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index 01067a2bc43b74cc3a4c071b4a0fbeb0933e9ff7..8a306bbec4a0c4d4b6580fe88187faf9f5422eed 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -5,7 +5,7 @@ include $(srctree)/lib/vdso/Makefile
 
 hostprogs := vdsomunge
 
-obj-vdso := vgettimeofday.o datapage.o note.o
+obj-vdso := vgettimeofday.o note.o
 
 # Build rules
 targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.so.raw vdso.lds
diff --git a/arch/arm/vdso/datapage.S b/arch/arm/vdso/datapage.S
deleted file mode 100644
index 9cd73b725d9fb89c2b9bb1d1178cce705baff38b..0000000000000000000000000000000000000000
--- a/arch/arm/vdso/datapage.S
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <linux/linkage.h>
-#include <asm/asm-offsets.h>
-
-	.align 2
-.L_vdso_data_ptr:
-	.long	_start - . - VDSO_DATA_SIZE
-
-ENTRY(__get_datapage)
-	.fnstart
-	adr	r0, .L_vdso_data_ptr
-	ldr	r1, [r0]
-	add	r0, r0, r1
-	bx	lr
-	.fnend
-ENDPROC(__get_datapage)
diff --git a/arch/arm/vdso/vdso.lds.S b/arch/arm/vdso/vdso.lds.S
index 165d1d2eb76b3cea9b054ffa8906afdffa0eae57..9bfa0f52923c851b6b9e96d4dbb51eb3d5d0960a 100644
--- a/arch/arm/vdso/vdso.lds.S
+++ b/arch/arm/vdso/vdso.lds.S
@@ -11,6 +11,7 @@
  */
 
 #include <linux/const.h>
+#include <asm/asm-offsets.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
 
@@ -19,7 +20,7 @@ OUTPUT_ARCH(arm)
 
 SECTIONS
 {
-	PROVIDE(_start = .);
+	PROVIDE(_vdso_data = . - VDSO_DATA_SIZE);
 
 	. = SIZEOF_HEADERS;
 

-- 
2.47.0


