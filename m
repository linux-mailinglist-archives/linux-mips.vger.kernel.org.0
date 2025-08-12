Return-Path: <linux-mips+bounces-10198-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06657B21D60
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 07:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D91C016B5C0
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 05:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E572E7195;
	Tue, 12 Aug 2025 05:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zocDmbkM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="d4tRasLS"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F172E5B34;
	Tue, 12 Aug 2025 05:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754977487; cv=none; b=qobYjblsr05fAzOjWqWjQVxsSezFZgXdY68yWayZNiMQXfwxTxc/Sub0O2kS4f6OPfy9n7gMDB/m52ApIpdYnhAadpz1sDop8DWuZGBCPv3Njg81tp7TvWkaUAmHmSIq3pWvzHRUkNvlUUz3b2j5RWocuOFBXNVdMTc/CKMRUL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754977487; c=relaxed/simple;
	bh=y8zJkYgbdBbZEV0tFUnY1VVHpY6kpQMx7JNEIl5bx6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSRr5q+EOtQBpKf3VzgGFtr7J/CJOmFumHt9ij3h30Jtg421YH3u8RzwNUrSvV3R4Z3PC0lrma1Hd1diPUd8JNEUJDq+3Qr044h+AYe/Hri+KWClW14kEWiWA4/tWGiLevhZJuiSPTDvtOVC5a1xYLfXuHkVkDoJ7ZdW1Hy7pwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zocDmbkM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=d4tRasLS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfCt5JZT5TLY1vTOkO3zmfWoCgmYOOlaa/RcOHdKaps=;
	b=zocDmbkM7SrtEfoMUMLk7syduA2FoS07iTJjRQxpoxVtJk6FCTcA63FHi4HDZhjOydKkAT
	DrrV0zBYz8rfc084esfgs4uuXAkhxzoVwcqdSmF7BEFWQKKsdlPKcE3LkSmnxFYonNODFZ
	2sN1ZNTgiR2KEOVXZQEVEMIVuHADKnDkoOaaebcfpKh5m4MlO1i3mxd6K0dfDn4f2gzo2k
	hM+ll5vK+/7O/uRdgK7BcmGop+bMKCmttdkUi9IyiFrD6fxo3aGU/1dH+Y4ccEvyjf/xRm
	ukysMSWz8XN0tHKKSQ2jKT60/8Q/5ewwHZkK0m/GvkKLUmwKhqnNwsd4lL/hmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfCt5JZT5TLY1vTOkO3zmfWoCgmYOOlaa/RcOHdKaps=;
	b=d4tRasLSDVTIK2B95jsGzJ+ah9uconnEpGunOzkAkX0RhJ6u8QF5Rm6WA7PtZmvXd7GJ+4
	tmhczEYwE7G4MtAQ==
Date: Tue, 12 Aug 2025 07:44:25 +0200
Subject: [PATCH v4 12/24] x86/vdso: Enable the vdsocheck tool
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-vdso-absolute-reloc-v4-12-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=3221;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=y8zJkYgbdBbZEV0tFUnY1VVHpY6kpQMx7JNEIl5bx6U=;
 b=fENeUAc8ExvUZD2cHV52CW4BlgBth0NPCMcPLk1EKHf1hnG4lTQ/vRhPMnJvsZZXuIYsNnulZ
 VQ7lpvqs+SzB4XtQHOZ7OgLms0zrQWlEQppNKDCg82HN7J6F262h/0M
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The vdsocheck tool validates the object files and final .so library.
It can detect if the compiler created relocations which are incompatible
with the vDSO which need to be worked around.

Wire it up for the architecture.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/Makefile |  6 +++---
 lib/vdso/Kconfig             |  1 +
 lib/vdso/check/vdsocheck.rs  | 12 ++++++++++++
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index f247f5f5cb44dad706701dd5344c9a8031deffc1..9da9cdf8c976ccebac1429afd244d4c9ea6ef5fa 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -35,7 +35,7 @@ CPPFLAGS_vdso.lds += -P -C
 VDSO_LDFLAGS_vdso.lds = -m elf_x86_64 -soname linux-vdso.so.1 \
 			-z max-page-size=4096
 
-$(obj)/vdso64.so.dbg: $(obj)/vdso.lds $(vobjs) FORCE
+$(obj)/vdso64.so.dbg: $(obj)/vdso.lds $(vobjs) $(vdsocheck) FORCE
 	$(call if_changed,vdso_and_check)
 
 HOST_EXTRACFLAGS += -I$(srctree)/tools/include -I$(srctree)/include/uapi -I$(srctree)/arch/$(SUBARCH)/include/uapi
@@ -108,7 +108,7 @@ $(obj)/%.so: OBJCOPYFLAGS := -S --remove-section __ex_table
 $(obj)/%.so: $(obj)/%.so.dbg FORCE
 	$(call if_changed,objcopy)
 
-$(obj)/vdsox32.so.dbg: $(obj)/vdsox32.lds $(vobjx32s) FORCE
+$(obj)/vdsox32.so.dbg: $(obj)/vdsox32.lds $(vobjx32s) $(vdsocheck) FORCE
 	$(call if_changed,vdso_and_check)
 
 CPPFLAGS_vdso32/vdso32.lds = $(CPPFLAGS_vdso.lds)
@@ -144,7 +144,7 @@ endif
 
 $(obj)/vdso32.so.dbg: KBUILD_CFLAGS = $(KBUILD_CFLAGS_32)
 
-$(obj)/vdso32.so.dbg: $(obj)/vdso32/vdso32.lds $(vobjs32) FORCE
+$(obj)/vdso32.so.dbg: $(obj)/vdso32/vdso32.lds $(vobjs32) $(vdsocheck) FORCE
 	$(call if_changed,vdso_and_check)
 
 #
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index b461e2be6db80eae957c8e0a1ab573a85d78fd15..e9215084462dfb33a5cd55a57171d2ec4295a270 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -51,6 +51,7 @@ config GENERIC_VDSO_DATA_STORE
 
 config HAVE_VDSOCHECK
 	bool
+	default y if X86
 	help
 	  Selected for architectures that are supported by the 'vdsocheck' progam.
 	  Only transitional.
diff --git a/lib/vdso/check/vdsocheck.rs b/lib/vdso/check/vdsocheck.rs
index 3c421100a91740ce3735edfbc9837ef49f55d8f8..c4feb75f93ec0a6a153a758ee7a51cc6f2f58bf1 100644
--- a/lib/vdso/check/vdsocheck.rs
+++ b/lib/vdso/check/vdsocheck.rs
@@ -34,6 +34,18 @@ fn is_ignored_section(&self, section: &elf::Section<'_>) -> bool {
 
 fn allowed_relocations_for_machine(machine: u16) -> Option<AllowedRelocations<'static>> {
     match machine as u32 {
+        bindings::EM_386 => Some(AllowedRelocations {
+            ignored_object_file_sections: None,
+            in_object_file: &[
+                bindings::R_386_PC32,
+                bindings::R_386_GOTOFF,
+                bindings::R_386_GOTPC,
+            ],
+        }),
+        bindings::EM_X86_64 => Some(AllowedRelocations {
+            ignored_object_file_sections: None,
+            in_object_file: &[bindings::R_X86_64_PC32, bindings::R_X86_64_PLT32],
+        }),
         _ => None,
     }
 }

-- 
2.50.1


