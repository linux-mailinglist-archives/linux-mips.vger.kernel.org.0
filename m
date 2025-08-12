Return-Path: <linux-mips+bounces-10205-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00858B21D7F
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 07:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AE4A502D5A
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 05:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7F72E9757;
	Tue, 12 Aug 2025 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W4p1ENmO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QpnJaONt"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0942E92B0;
	Tue, 12 Aug 2025 05:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754977495; cv=none; b=medZ7zEM7gYKPLSk4jV7GV9q3DGlHZgHR+/QII+Szt3BvbswEX/tdXYbLOehdQNQ9jS1+yY5OLWc4xAJ/XVEaAIqXMAU/yE4LIUdw5d4UN/aiDbcVisaqIiNo2xifB3rq8vv71NuJ2QtnFqSxaktF2XhBRtHQz2alh/GcvvTG/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754977495; c=relaxed/simple;
	bh=J1qM3HCNoG+4ABOAGIaTnVMGxz4Bh3uAYRLzvmLM14o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DDpSvPwMgEheWsUesOE/9thHYGZUkFf1tcjI5WeM1r/2SuTRIMmRiVYPezt8WuQlOB//6PBgb423OkoyvJANRHgcJfu+JSPr8RjP2Tm7vfkcHGfRBe/kGTFOI70i6ec5kslJuC2US/LKAQ3VggTt2x7X7EniuZcv+9q0W9uOLro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W4p1ENmO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QpnJaONt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7OxEAzTtqHlqZSqHBtrTk0yqq9zTf8Alol22rb21E+I=;
	b=W4p1ENmOvzhLntuYnmqtfute0yp4ze1Q3QiTPF7vb/qMHZT5SVeS3RyfuZ6SosfWMYDc0u
	JMs2EcuwR9ToS+OHSfJMxVN95EcXvMbyX+YnwaBPnk20szUrj7SZvB0qQ8Cx5Ud5jPAbu2
	bSAJPE5T0rS2fD0/jpIO5X9vO5nsQl5irPEsTaTy8WcaVOVElHdD3sISZQVcrKhBVlExNd
	qTlZX8uubN2zgJ0d7g5ExfmZvs1NHebFGWrZVOZILEEoNjXxH0F5ugP5eD9/q2m/JNoopP
	0ooTzzrCPKkGvpwsCRPbNEQKYYZENwH0BDcIHI3be78GBTu1L+fTyldKzt7yjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7OxEAzTtqHlqZSqHBtrTk0yqq9zTf8Alol22rb21E+I=;
	b=QpnJaONtWulvcUFE59iWrSqLfGPXVLdmPDToQjRzK9BRDs9j+IGPmHbJrdEtNraqkyxN0t
	5141JOl9oriQWEAA==
Date: Tue, 12 Aug 2025 07:44:32 +0200
Subject: [PATCH v4 19/24] riscv: vdso: Enable the vdsocheck tool
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-vdso-absolute-reloc-v4-19-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=3732;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=J1qM3HCNoG+4ABOAGIaTnVMGxz4Bh3uAYRLzvmLM14o=;
 b=SMRN/ewBWi/CqhkM5mbxFTaVrjrIEecZQJUkuNqZN8Bo84iaFqx4d2EMZvQHzBbVdI97dTqOc
 sZpouIgjOvkAwh1E9FDdFMfyd5/kLUV2gBS+vHirscTGDXTVSaTLPv6
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The vdsocheck tool validates the object files and final .so library.
It can detect if the compiler created relocations which are incompatible
with the vDSO which need to be worked around.

Wire it up for the architecture.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/riscv/kernel/vdso/Makefile |  4 ++--
 lib/vdso/Kconfig                |  1 +
 lib/vdso/check/vdsocheck.rs     | 25 +++++++++++++++++++++++++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 9f1bf5bae9bd473e43d9fd3022e9e1a185128b73..05725a72eaca70a867f59c352a6381402e91c317 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -58,7 +58,7 @@ CFLAGS_REMOVE_hwprobe.o = $(CFLAGS_REMOVE_VDSO)
 $(obj)/vdso.o: $(obj)/vdso.so
 
 # link rule for the .so file, .lds has to be first
-$(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
+$(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) $(vdsocheck) FORCE
 	$(call if_changed,vdsold_and_check)
 LDFLAGS_vdso.so.dbg = -shared -soname=linux-vdso.so.1 \
 	--build-id=sha1 --eh-frame-hdr
@@ -80,7 +80,7 @@ include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
 # The DSO images are built using a special linker script
 # Make sure only to export the intended __vdso_xxx symbol offsets.
 quiet_cmd_vdsold_and_check = VDSOLD  $@
-      cmd_vdsold_and_check = $(LD) $(ld_flags) -T $(filter-out FORCE,$^) -o $@.tmp && \
+      cmd_vdsold_and_check = $(LD) $(ld_flags) -T $(filter-out FORCE $(vdsocheck),$^) -o $@.tmp && \
                    $(OBJCOPY) $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
                    rm $@.tmp && \
                    $(cmd_vdso_check)
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 8994419d90e7b5c66ac77449b6c3bd96c968983d..441ff03e1028f7bde5104bd01941c6a9b006e21f 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -55,6 +55,7 @@ config HAVE_VDSOCHECK
 	default y if ARM
 	default y if ARM64
 	default y if PPC
+	default y if RISCV
 	help
 	  Selected for architectures that are supported by the 'vdsocheck' progam.
 	  Only transitional.
diff --git a/lib/vdso/check/vdsocheck.rs b/lib/vdso/check/vdsocheck.rs
index 54372a547b1cde05c1a4454b9a21de357b22b0df..d48c9da6f18270afe883d167955f73f061b9c472 100644
--- a/lib/vdso/check/vdsocheck.rs
+++ b/lib/vdso/check/vdsocheck.rs
@@ -90,6 +90,31 @@ fn allowed_relocations_for_machine(machine: u16) -> Option<AllowedRelocations<'s
                 bindings::R_PPC64_REL16_HA,
             ],
         }),
+        bindings::EM_RISCV => Some(AllowedRelocations {
+            ignored_object_file_sections: None,
+            in_object_file: &[
+                bindings::R_RISCV_BRANCH,
+                bindings::R_RISCV_JAL,
+                bindings::R_RISCV_CALL,
+                bindings::R_RISCV_CALL_PLT,
+                bindings::R_RISCV_PCREL_HI20,
+                bindings::R_RISCV_PCREL_LO12_I,
+                bindings::R_RISCV_PCREL_LO12_S,
+                bindings::R_RISCV_ADD8,
+                bindings::R_RISCV_ADD16,
+                bindings::R_RISCV_ADD32,
+                bindings::R_RISCV_ADD64,
+                bindings::R_RISCV_SUB8,
+                bindings::R_RISCV_SUB16,
+                bindings::R_RISCV_SUB32,
+                bindings::R_RISCV_SUB64,
+                bindings::R_RISCV_ALIGN,
+                bindings::R_RISCV_RVC_BRANCH,
+                bindings::R_RISCV_RVC_JUMP,
+                bindings::R_RISCV_RELAX,
+                bindings::R_RISCV_32_PCREL,
+            ],
+        }),
         _ => None,
     }
 }

-- 
2.50.1


