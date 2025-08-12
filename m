Return-Path: <linux-mips+bounces-10210-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B316B21DA0
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 07:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79B15687251
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 05:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827C32EAB6A;
	Tue, 12 Aug 2025 05:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gVUd2BKN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="E3zfUlZM"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805A82EA173;
	Tue, 12 Aug 2025 05:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754977501; cv=none; b=h5JI7Lfs4eVYtEm3u720YUfMvfbQokbvVQcgxyu18q1AGplhz5Tp9iS2yQ1/qi8VL98+T12BuWcgkIaml41AB2h7ya9x0I6SISA4Q9AYoA/EU5PnBm9R0w7Fxdi/iZKa7mSWGRGVpYKC9Fh3nZGqFgM1U2CBN8OXEWvBL6fUo1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754977501; c=relaxed/simple;
	bh=XgLT+HRfIExEaxGQakA0kG9YYMgwqfszT+N1NJLYmAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g+q/0HveeKCwqoHRg/MVC04BlskXanrt6kRU8uVYrGqwo9GnoNW+4wJloBWWFq8lYpcyz9z/6YxvyT/buBxdz26TnyQik0jmlKTMWlbyRu565lTNnIR8D6V67cibxSAFzeV2hWENQsERpSH2gKdVRE8B/i+5/ccdYApNGAowRRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gVUd2BKN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=E3zfUlZM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Ohsn0uRwU+hqw8smnbWosllb5/RpGYnB9VEAvO1A/o=;
	b=gVUd2BKNRu49lqg4NSeZ4pKy2oD1HLdzTFOjP5wa3OkUArCPejQi3q6nUUr2hwWVlPH2Kd
	CpxufrleSj5IZe8RVpKM1ltFMzRJO9obwhqsMGuapaXgAqGhXqHAW1SITBjzjuIFxYogme
	VHW9rhxA7fc8nsd57iZTz0NzWxS4qCvj0HR7XdalckB95CeAtDcPREEN4EOpD8wSUEK1Fj
	JpEDuofzGC0RATmSZcEZf8c/4R+6SxzYN4hGrvSuM267wDyFyN3n0HVqzoxPKY02BuyYgJ
	Z9VulQJw/Kd9S+FCzxMpZgWlnADluI2ZtXqh+SyfPfSKvhoitMn+YWd5L9OT6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Ohsn0uRwU+hqw8smnbWosllb5/RpGYnB9VEAvO1A/o=;
	b=E3zfUlZMz5EWlnuWD04WRwJZzaIYqsb9Hq174OOh7rbwH0by1UeqdRfVLVDKyXeX8pZQ9r
	AHYbNMgU+lq97wCQ==
Date: Tue, 12 Aug 2025 07:44:37 +0200
Subject: [PATCH v4 24/24] vdso/vdsocheck: Drop the transitional kconfig
 option
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-vdso-absolute-reloc-v4-24-61a8b615e5ec@linutronix.de>
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
In-Reply-To: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=1638;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XgLT+HRfIExEaxGQakA0kG9YYMgwqfszT+N1NJLYmAY=;
 b=1I1jQfDAIUdxhhr5poZTNsBtXG7kI9OeSFZyV1uG5GiskTP3f4x0XtJf5y22KDovg2SDqYoC/
 1/LS9SuRW0lC44pibDwoRDG1rIxAT00dk7cwwtQfK+pJ8Esyu7dhqf4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

All users of the generic vDSO are now using the vdsocheck tool.

Remove the now unnecessary kconfig option.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/Kconfig          | 14 --------------
 lib/vdso/Makefile.include |  2 +-
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 567ac937a9c3084fd5669e1b890b667af8a2f12d..45df764b49ad62479e6456e00c053e46131936a3 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -48,17 +48,3 @@ config GENERIC_VDSO_DATA_STORE
 	bool
 	help
 	  Selected by architectures that use the generic vDSO data store.
-
-config HAVE_VDSOCHECK
-	bool
-	default y if X86
-	default y if ARM
-	default y if ARM64
-	default y if PPC
-	default y if RISCV
-	default y if LOONGARCH
-	default y if S390
-	default y if MIPS
-	help
-	  Selected for architectures that are supported by the 'vdsocheck' progam.
-	  Only transitional.
diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
index 759fe41b48f658c399f54aa7d54a3dfeb07e5c9c..a5621b1d6ab51fde3fdab6e72309d51943939860 100644
--- a/lib/vdso/Makefile.include
+++ b/lib/vdso/Makefile.include
@@ -6,7 +6,7 @@ GENERIC_VDSO_DIR := $(dir $(GENERIC_VDSO_MK_PATH))
 c-gettimeofday-$(CONFIG_GENERIC_GETTIMEOFDAY) := $(addprefix $(GENERIC_VDSO_DIR), gettimeofday.c)
 c-getrandom-$(CONFIG_VDSO_GETRANDOM) := $(addprefix $(GENERIC_VDSO_DIR), getrandom.c)
 
-ifeq ($(CONFIG_RUST_IS_AVAILABLE)$(CONFIG_HAVE_VDSOCHECK),yy)
+ifdef CONFIG_RUST_IS_AVAILABLE
 vdsocheck := lib/vdso/check/vdsocheck
 
 $(vdsocheck): FORCE

-- 
2.50.1


