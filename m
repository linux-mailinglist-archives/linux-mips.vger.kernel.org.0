Return-Path: <linux-mips+bounces-5843-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23001997E24
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 09:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 915F42862D1
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 07:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EE61BBBFE;
	Thu, 10 Oct 2024 07:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lTa7tpZP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/CAqjPr6"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998DD433C9;
	Thu, 10 Oct 2024 07:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543725; cv=none; b=GzIBE/eDbP/K/5NELqnEaFGmlmzTStjpI9fgkERGa+DYGNKrl9ifxy8ZqVsK+/hallPWlEdAda2FbW2QjYhR5GLLi1DVGH+5NdkJyHK9kTiS/4zERqLCxgR+RKtNzBSH48W8ZNQkwlhzGl6e/bON5GDEFQ2zDP0/KWjAnhWaSZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543725; c=relaxed/simple;
	bh=M1UHCDZZZ5fXWxxT1qvNaxpIVftl+fGBVImNfA2mkLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jPIddcmrbFlgl09kSqun9ixFV+Ppd6PdjBqNtRWmlZkmHJ4zSb4BujHuDemLg/m/nXa4bTWSRVqeGCqXl6hjgqc1YCzycrE5WxPCN8anXIZQg3xwXlGaXLGrvspJbv4PxwsthexxqG/sbgNTFaeB8vpLzCIvH+3AgR5Sz08i9RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lTa7tpZP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/CAqjPr6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTaWPH0GsoC/f/xHFuh5G2lj04S9r5qi58p+jYQJPbk=;
	b=lTa7tpZPSMpYqBOTXcrRlaMExCnwkTH8H6hYeS3O+dLE/v1NII2D+NfhOrHIM/HjIOvpKb
	iEjMp5s35jvJ1C4i20pMv9eIftSeqdclfqgPGFKkr5ZBz18rM6WABeHbt9yiQ9AqlEnxB7
	cOL0uzuhW7R/2qz2vnSxj8qEdmiqiCSsllD8wq48lRHWoat4L3iQIcath9RHzcvDXo7mjh
	BcCUk8KDuyaeuMnv+LdLXC0kSp+eoC1/f1Ti3YZNb2ryOJ2A1BebUstcmNJVT/sFAx+eyA
	gjJVwe9Jfig5ovQyz3D9CMKNH5QprqbdDcOdMMVExYTTXiJSBoTqKNoxJVsWCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTaWPH0GsoC/f/xHFuh5G2lj04S9r5qi58p+jYQJPbk=;
	b=/CAqjPr6rxtw1rBkGjYlFRS7wVbrerb1tE7vy4nq86qESK/0YxyCNEBt22Mml7Xgziyxv2
	FQKOjqD3bM9qTdBg==
Date: Thu, 10 Oct 2024 09:01:05 +0200
Subject: [PATCH 03/28] s390/vdso: Drop LBASE_VDSO
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-3-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1973;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=M1UHCDZZZ5fXWxxT1qvNaxpIVftl+fGBVImNfA2mkLk=;
 b=hG1gakiEm8cjk7VRIpvdmQlN9QnPXDvcOtIcU7k1TMbtC8u2E2IXfzi6S1RfiCNX3R9MIKgXJ
 cPnWnTEKA5CC4LuIt9YAXlYWgz716XqXk1/Gb4r134/tWzKtZxY7Eb7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

This constant is always "0", providing no value and making the logic
harder to understand.
Also prepare for a consolidation of the vdso linkerscript logic by
aligning it with other architectures.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/s390/include/asm/vdso.h         | 3 ---
 arch/s390/kernel/vdso32/vdso32.lds.S | 2 +-
 arch/s390/kernel/vdso64/vdso64.lds.S | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/s390/include/asm/vdso.h b/arch/s390/include/asm/vdso.h
index 91061f0279be4521a2b5470bcf8de6780b7d6806..92c73e4d97a93a90cb640d44fca9856f93e0be14 100644
--- a/arch/s390/include/asm/vdso.h
+++ b/arch/s390/include/asm/vdso.h
@@ -12,9 +12,6 @@ int vdso_getcpu_init(void);
 
 #endif /* __ASSEMBLY__ */
 
-/* Default link address for the vDSO */
-#define VDSO_LBASE	0
-
 #define __VVAR_PAGES	2
 
 #define VDSO_VERSION_STRING	LINUX_2.6.29
diff --git a/arch/s390/kernel/vdso32/vdso32.lds.S b/arch/s390/kernel/vdso32/vdso32.lds.S
index 65b9513a5a0ee2a7e3508a1d919f826c4b4184ca..c916c4f73f766ebcc9328b189e46015e67393b0d 100644
--- a/arch/s390/kernel/vdso32/vdso32.lds.S
+++ b/arch/s390/kernel/vdso32/vdso32.lds.S
@@ -16,7 +16,7 @@ SECTIONS
 #ifdef CONFIG_TIME_NS
 	PROVIDE(_timens_data = _vdso_data + PAGE_SIZE);
 #endif
-	. = VDSO_LBASE + SIZEOF_HEADERS;
+	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
 	.gnu.hash	: { *(.gnu.hash) }
diff --git a/arch/s390/kernel/vdso64/vdso64.lds.S b/arch/s390/kernel/vdso64/vdso64.lds.S
index 753040a4b5ab271c432d4abcaa04d69a88d54b17..ec42b7d9cb53094b783c6b0492962af7e5027831 100644
--- a/arch/s390/kernel/vdso64/vdso64.lds.S
+++ b/arch/s390/kernel/vdso64/vdso64.lds.S
@@ -18,7 +18,7 @@ SECTIONS
 #ifdef CONFIG_TIME_NS
 	PROVIDE(_timens_data = _vdso_data + PAGE_SIZE);
 #endif
-	. = VDSO_LBASE + SIZEOF_HEADERS;
+	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
 	.gnu.hash	: { *(.gnu.hash) }

-- 
2.47.0


