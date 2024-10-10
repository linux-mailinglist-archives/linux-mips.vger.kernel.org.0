Return-Path: <linux-mips+bounces-5865-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 113F1997F07
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 10:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41ED11C23E73
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 08:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630FC1C9B80;
	Thu, 10 Oct 2024 07:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lOtgRqrv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YPIBKS6f"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9609A1C7B78;
	Thu, 10 Oct 2024 07:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543742; cv=none; b=tdrUvoO2K3z61QQYIA0UgJT1jm4KS/d6HdwAcFXGo1l/a/iKq3v90zm5TDr7WOfH8l84OtH1uRlGXaJpPcVOMBLWqFQvsNwX1owYZTih9YsRlPXDogR5PPiaavwD6ehXOGZbIED4PNsg4HVasKA/RttfVG2Dv7h12a/L4/rYndQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543742; c=relaxed/simple;
	bh=ignJMWvkz6E09b32wojexZ5aYHvKHJxJ66AG8ULzy/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AyOEj78WtB6kIyh4U2r2d5fbcAZ8G3ohSVDvrUzcvTXjfZZpNEfNoYS7wZY6HS2pJsCfsNJQMQJZJTfewlSBVSm+bIbzVEr9CKn3n//868MvYCMvIoPCEHbct3MRYure+EQkqc/Ngs/q08mPXhAK+SWvPuvNnUzazohhSegAKc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lOtgRqrv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YPIBKS6f; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/qRGvuOAyfRD/y9Hw9vI8MnAlUye5M5TSGqQF5eFfA=;
	b=lOtgRqrvkWhHs5FDIZhLs96p61mNiVNt6t9AYoLa1thljfyyRleywPXqjeoScsCAYmTDWv
	0r24GjB2ulGnJkoTNTjKVsfA+qpBbIlUHVuwLRLvSg88aafASg37t3FvSAYJKTDkrEFMCF
	Q5L0Cf2OrOk89w2nbzDgMcSfACgIJSovpms7P8XAGOW3atwPhKJxWF47+FzFTW5N/EG7Yg
	2HRzhNr/4GYMtRtie63QKRml5xYibGYWTE6BlzE/8/BbDmr8Rpeyjiyozaei/60X/TdWdk
	tpOmuMYwEhnBlSzBYpZ2bYOmey08TelkMPNRC3g4oVQhOg4Po+4u5KTFktMPbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/qRGvuOAyfRD/y9Hw9vI8MnAlUye5M5TSGqQF5eFfA=;
	b=YPIBKS6fUErLq7tLoUgds5pLbK4UX7EnE/rx00rRDYWatFVJ7tNFzgNAHim8WYkolJMXyq
	eaBMgmb4NJ1+7MBA==
Date: Thu, 10 Oct 2024 09:01:27 +0200
Subject: [PATCH 25/28] powerpc: Add kconfig option for the systemcfg page
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-25-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1852;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ignJMWvkz6E09b32wojexZ5aYHvKHJxJ66AG8ULzy/s=;
 b=C1rNttCPnaP1zlaUjv7iMx0innkkyXvxyKgVYJIFWgJtuaN0zt8AzArXt/OrnrBtT3yS8PQGE
 o07lV8IsHQkADjaSA/YIbNTpmAdiIx+Hy0BA1bX+qUHzEj/ePQM5Dd2
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The systemcfg page through procfs is only a backwards-compatible
interface for very old applications.
Make it possible to be disabled.

This also creates a convenient config #define to guard any accesses to
the systemcfg page.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/Kconfig               | 8 ++++++++
 arch/powerpc/kernel/proc_powerpc.c | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8094a01974cca1d27002720e706f66bec2a2d035..5d348e1f09d730002eee9894a0b2847e1dac15d5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1298,6 +1298,14 @@ config MODULES_SIZE
 
 endmenu
 
+config PPC64_PROC_SYSTEMCFG
+	def_bool y
+	depends on PPC64 && PROC_FS
+	help
+	  This option enables the presence of /proc/ppc64/systemcfg through
+	  which the systemcfg page can be accessed.
+	  This interface only exists for backwards-compatibility.
+
 if PPC64
 # This value must have zeroes in the bottom 60 bits otherwise lots will break
 config PAGE_OFFSET
diff --git a/arch/powerpc/kernel/proc_powerpc.c b/arch/powerpc/kernel/proc_powerpc.c
index 910d2082e05fd86bd1146815d4b67633a6f2b459..3bda365843e44357538651c6c24c11a41de2eb06 100644
--- a/arch/powerpc/kernel/proc_powerpc.c
+++ b/arch/powerpc/kernel/proc_powerpc.c
@@ -14,7 +14,7 @@
 #include <asm/rtas.h>
 #include <linux/uaccess.h>
 
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC64_PROC_SYSTEMCFG
 
 static loff_t page_map_seek(struct file *file, loff_t off, int whence)
 {
@@ -59,7 +59,7 @@ static int __init proc_ppc64_init(void)
 }
 __initcall(proc_ppc64_init);
 
-#endif /* CONFIG_PPC64 */
+#endif /* CONFIG_PPC64_PROC_SYSTEMCFG */
 
 /*
  * Create the ppc64 and ppc64/rtas directories early. This allows us to

-- 
2.47.0


