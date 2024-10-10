Return-Path: <linux-mips+bounces-5857-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E73D997E7B
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 09:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFEC71F24BAB
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 07:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F63E1C3F0E;
	Thu, 10 Oct 2024 07:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fHO6dB5+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nVceqz6a"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639191C2DAB;
	Thu, 10 Oct 2024 07:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543735; cv=none; b=N/gAvwmI2sS5fBKP8K/Ru2gOYv87V4jURmpgwHBUfIIViYRG1tLEzFxn9Byscg2pH3lmjuzFyXYK1DN9yEozGN5+nuX0Eye00qM4P6b7gKCWX9MbR4PRTf5Ip7YaKM7ey03HK5gl9wdc5yuUAH0K2kwjVcn20xorrRkhSVAcbg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543735; c=relaxed/simple;
	bh=Np140vGUYm0GdbZeMo/M6YRpqMe7CZ/gv0PibQOMjpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F/9tlmT8grcfta77OMf7YH8CqebrBLRlr2terJBweaVB5po12eXMZZWSMzPHEZqeu6aLrPUagXA1AgWZk1GdjZ25rTX2Nv1TNkb6Q//2+7xlsElgbzUm1K650+uhLJnZqh7YTcTiMWrjZrLUgq6jrLx2rqPhiVkqFVacEUdQjMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fHO6dB5+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nVceqz6a; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bpx3H6OAW30r2M4gvHlf4N1YsIPw8mw3FdRSSKpTbMo=;
	b=fHO6dB5+tJ5AREGbwdyrnC2qHTYIrMf/mNnwcKcW1LGxv8M1u6qQnVRKVnH5V+qcoYbaQ2
	3iiPafwMCXtkU0L392d1SnJNd/mGnPRV/RJrO3tzoGn/XAbrr4Tzv3pKW8+oj2h9tvgdy5
	CxdFvbJh4+4zIeHcC+yfj3qMVcDM7gQVu/7xbTW8aDNo0w7z0OssIyjNtWqt0AiQ1+PHOh
	Ywnn52yHb4Liib84kgA/AFgG7w6LvN3YrVYf7h9Alq2jcCQMgDVM+p00BSb7gRQvNC4Mmh
	uGWkAlX9s/3WkavRgVvqIGC7m+1Cp/19u8iF4aI9dhxJLBYjNkAw2kJeS6S+mg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bpx3H6OAW30r2M4gvHlf4N1YsIPw8mw3FdRSSKpTbMo=;
	b=nVceqz6aoyJ/HPcQx81U9eTkPYPq3uxROiMVUFhWBsYE9y2x+6JUxjov/AHRlCNW3C1bdh
	ousQJBYc6nl11kDQ==
Date: Thu, 10 Oct 2024 09:01:19 +0200
Subject: [PATCH 17/28] x86: vdso: Move the rng offset to vsyscall.h
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-17-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1867;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Np140vGUYm0GdbZeMo/M6YRpqMe7CZ/gv0PibQOMjpk=;
 b=0upqYpRkuYFgrPBW3kR6OrNCpDY5Ss/cEAnk/yBBoRvvML2YQfAHXOqqTYZKYHuk1pq8g9LV8
 8YXoRNL497eB8wR/8v3imo4szSlPYBMVDCYzRvobgH+wYrzKXmyU5S7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

vvar.h will go away, so move the last useful bit into vsyscall.h.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/vdso-layout.lds.S | 1 +
 arch/x86/include/asm/vdso/vsyscall.h  | 3 ++-
 arch/x86/include/asm/vvar.h           | 2 --
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso-layout.lds.S b/arch/x86/entry/vdso/vdso-layout.lds.S
index acce60732e541f49dfc21d75e1b525c8a74f2341..c7e194b6e47def3bfa681b3ec5d45cfffbe839d2 100644
--- a/arch/x86/entry/vdso/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/vdso-layout.lds.S
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <asm/vdso.h>
+#include <asm/vdso/vsyscall.h>
 
 /*
  * Linker script for vDSO.  This is an ELF shared object prelinked to
diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso/vsyscall.h
index 5d6760746d15b0e12c7bf0eb727241e7576ca9c7..6e210e05f9f323e3e9ceca8a04d5f21fb6d04781 100644
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ b/arch/x86/include/asm/vdso/vsyscall.h
@@ -2,12 +2,13 @@
 #ifndef __ASM_VDSO_VSYSCALL_H
 #define __ASM_VDSO_VSYSCALL_H
 
+#define __VDSO_RND_DATA_OFFSET  640
+
 #ifndef __ASSEMBLY__
 
 #include <linux/timekeeper_internal.h>
 #include <vdso/datapage.h>
 #include <asm/vgtod.h>
-#include <asm/vvar.h>
 
 extern struct vdso_data *vdso_data;
 
diff --git a/arch/x86/include/asm/vvar.h b/arch/x86/include/asm/vvar.h
index b605914f4d4347c16344e5b5e063697538d4895e..d95cf92296ef6acf66089a734465eda4cba9154c 100644
--- a/arch/x86/include/asm/vvar.h
+++ b/arch/x86/include/asm/vvar.h
@@ -19,8 +19,6 @@
 #ifndef _ASM_X86_VVAR_H
 #define _ASM_X86_VVAR_H
 
-#define __VDSO_RND_DATA_OFFSET  640
-
 #ifdef EMIT_VVAR
 /*
  * EMIT_VVAR() is used by the kernel linker script to put vvars in the

-- 
2.47.0


