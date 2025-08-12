Return-Path: <linux-mips+bounces-10197-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B87D6B21D59
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 07:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B10D1AA049A
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 05:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E312E718F;
	Tue, 12 Aug 2025 05:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mLjsKlYQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dt2jUDtK"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFB929BDA4;
	Tue, 12 Aug 2025 05:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754977487; cv=none; b=Z0eM/4BXsybLL1HaO3/Yngx2IvHruIHKcIfvsn1PgmeKlGqmlW9Rb0Ybhasg4zckJhSBbynGsUvfNKZ3o6hK3LLNzKXf3QPaPpg3zwE20c3QUzPQqiLACjmXesGapuJNgRl5tJ24YP26Mrua0wZFNvbff94l5MMD+Z8DO20n6gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754977487; c=relaxed/simple;
	bh=ny+/mk92QdWvHIPM7pRuV3n2ghhYt3d8gWmZQ0OBRe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HHZ42cNJh1uAbjJSo19YaCtDNLAmT+VkqJ4YquMTytxiW94MHI1QyFTftdel2XGvnYgygM3DffIk/1xv9HHNDTCYh2/JtFHoBbcbIoMQ4lJsQu/UI88362bFXjfseiWQLeYd42AqNTUbQgMyW6DMsPZfkD4SiIfeX8AzPRG7OiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mLjsKlYQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dt2jUDtK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RN97XE6hq4h6w5B+XqqRkUL6Oa3s/oZNOsBBeDOPqXk=;
	b=mLjsKlYQewBg1qvOIfA7m9lY8m6wQ0I2osKbix3ki74IDpLfpzNserKG5oCub6NYuXURne
	qs1TBw7xX632hfRCj6cziv4OFZV6Tpts3AQCOfe9mYai/R/2LIH8n5MLAvKQfXjd7+jFVl
	M8e8TWWJq+5Vfn+oLXstahf5dz3Ejblp55Ho1VRqVwPoVX8inlAw+aVv2kyc/KVCchlDzr
	h9k+Ams00b4uzzsDgpFU01xLdxXFz4wMGVnkUcv2R0Sts3QQZkNEjZKID7vGCmpsOXJIxQ
	FuvpWU044Xe3xaAWtcLhr5hagM8RZ/gLjvC0lh8DhxSE+2hWp4w2K7HAKexzzQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RN97XE6hq4h6w5B+XqqRkUL6Oa3s/oZNOsBBeDOPqXk=;
	b=dt2jUDtKfQwK8Kol+FEYKBxQdjjYtFl4hwNGokoib37bY2IkgdTZ8RbP/Oq8n6eG8TUY4O
	b7Xcni87IN2XoQCQ==
Date: Tue, 12 Aug 2025 07:44:24 +0200
Subject: [PATCH v4 11/24] vdso: Add the vdsocheck tool
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-vdso-absolute-reloc-v4-11-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=26811;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ny+/mk92QdWvHIPM7pRuV3n2ghhYt3d8gWmZQ0OBRe4=;
 b=LEH7+qv4ZL2gVqA/q2OcFKWniIM9KvHufZwuL5Ev0iRm0/AuwCBW95e7p2iNhi1wkvc8kD+7N
 HIjIGytoXVRBRL8mkHvYbnxeljJZ9FcczxWn4bVR0NlJiXk77Z3VLSc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

All vDSO code needs to be completely position independent. Symbol
references are marked as hidden so the compiler emits PC-relative
relocations. However there are cases where the compiler may still
emit absolute relocations, as they are valid in regular PIC DSO code.
These would be resolved by the linker and will break at runtime.
This has been observed on arm64, see commit 0c314cda9325 ("arm64: vdso:
Work around invalid absolute relocations from GCC")

Introduce a tool to check for absolute relocations during the build,
as the current inline-shell logic is not expressive enough.
The check is done on the object files as the relocations will not exist
anymore in the final DSO. As there is no extension point for the
compilation of each object file, perform the validation in vdso_check.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/Kconfig            |   6 +
 lib/vdso/Makefile           |   2 +
 lib/vdso/Makefile.include   |  17 ++
 lib/vdso/check/.gitignore   |   3 +
 lib/vdso/check/Makefile     |  28 +++
 lib/vdso/check/elf.rs       | 488 ++++++++++++++++++++++++++++++++++++++++++++
 lib/vdso/check/vdsocheck.rs | 154 ++++++++++++++
 7 files changed, 698 insertions(+)

diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 45df764b49ad62479e6456e00c053e46131936a3..b461e2be6db80eae957c8e0a1ab573a85d78fd15 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -48,3 +48,9 @@ config GENERIC_VDSO_DATA_STORE
 	bool
 	help
 	  Selected by architectures that use the generic vDSO data store.
+
+config HAVE_VDSOCHECK
+	bool
+	help
+	  Selected for architectures that are supported by the 'vdsocheck' progam.
+	  Only transitional.
diff --git a/lib/vdso/Makefile b/lib/vdso/Makefile
index aedd40aaa950c86f1454d095d9d46992b0cc0abd..861ca416f9b3343645542f9fd1bd020c5da057b5 100644
--- a/lib/vdso/Makefile
+++ b/lib/vdso/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+obj-y += check/
+
 obj-$(CONFIG_GENERIC_VDSO_DATA_STORE) += datastore.o
diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
index cedbf15f80874d4bb27c097244bc5b11272f261c..759fe41b48f658c399f54aa7d54a3dfeb07e5c9c 100644
--- a/lib/vdso/Makefile.include
+++ b/lib/vdso/Makefile.include
@@ -6,6 +6,15 @@ GENERIC_VDSO_DIR := $(dir $(GENERIC_VDSO_MK_PATH))
 c-gettimeofday-$(CONFIG_GENERIC_GETTIMEOFDAY) := $(addprefix $(GENERIC_VDSO_DIR), gettimeofday.c)
 c-getrandom-$(CONFIG_VDSO_GETRANDOM) := $(addprefix $(GENERIC_VDSO_DIR), getrandom.c)
 
+ifeq ($(CONFIG_RUST_IS_AVAILABLE)$(CONFIG_HAVE_VDSOCHECK),yy)
+vdsocheck := lib/vdso/check/vdsocheck
+
+$(vdsocheck): FORCE
+	$(Q)$(MAKE) $(build)=lib/vdso/check vdsocheck
+else
+vdsocheck :=
+endif
+
 # This cmd checks that the vdso library does not contain dynamic relocations.
 # It has to be called after the linking of the vdso library and requires it
 # as a parameter.
@@ -13,6 +22,14 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) := $(addprefix $(GENERIC_VDSO_DIR), getrand
 # As a workaround for some GNU ld ports which produce unneeded R_*_NONE
 # dynamic relocations, ignore R_*_NONE.
 quiet_cmd_vdso_check = VDSOCHK $@
+ifneq ($(vdsocheck),)
+      cmd_vdso_check = $(vdsocheck) $(filter %.o, $(real-prereqs)) $@
+else
       cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
 		       then (echo >&2 "$@: dynamic relocations are not supported"; \
 			     rm -f $@; /bin/false); fi
+endif
+
+# Variant of cmd_ld which does not try to link the vdsocheck tool.
+quiet_cmd_ld_vdso = VDSOLD $@
+      cmd_ld_vdso = $(LD) $(ld_flags) $(filter-out $(vdsocheck), $(real-prereqs)) -o $@
diff --git a/lib/vdso/check/.gitignore b/lib/vdso/check/.gitignore
new file mode 100644
index 0000000000000000000000000000000000000000..751be38f11f2147b3fd369539a8913d16546b07c
--- /dev/null
+++ b/lib/vdso/check/.gitignore
@@ -0,0 +1,3 @@
+/bindings.rs
+/libbindings.rlib
+/vdsocheck
diff --git a/lib/vdso/check/Makefile b/lib/vdso/check/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..052997e9ece5c09c6caa15e637455ced1405676f
--- /dev/null
+++ b/lib/vdso/check/Makefile
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+quiet_cmd_host_bindgen = HOSTBINDGEN $@
+      cmd_host_bindgen = $(BINDGEN) $< -o $@ --depfile $(depfile) -- $(HOSTBINDGEN_FLAGS)
+
+quiet_cmd_host_rustlib = HOSTRUSTLIB $@
+      cmd_host_rustlib = \
+	$(HOSTRUSTC) $(hostrust_flags) \
+		--emit=dep-info=$(depfile) --emit=link=$@ \
+		--crate-type rlib \
+		--crate-name $(patsubst %.rlib,%,$(notdir $@)) $<
+
+$(obj)/bindings.rs: HOSTBINDGEN_FLAGS := -I$(srctree)/tools/include/uapi
+$(obj)/bindings.rs: $(srctree)/tools/include/uapi/linux/elf.h FORCE
+	$(call if_changed_dep,host_bindgen)
+
+HOSTRUSTFLAGS_libbindings := -Awarnings
+$(obj)/libbindings.rlib: $(obj)/bindings.rs FORCE
+	$(call if_changed_dep,host_rustlib)
+
+targets += bindings.rs libbindings.rlib
+
+hostprogs += vdsocheck
+vdsocheck-rust := y
+HOSTRUSTFLAGS_vdsocheck := --extern bindings=$(obj)/libbindings.rlib
+$(obj)/vdsocheck: $(obj)/libbindings.rlib
+
+vdsocheck: $(obj)/vdsocheck
diff --git a/lib/vdso/check/elf.rs b/lib/vdso/check/elf.rs
new file mode 100644
index 0000000000000000000000000000000000000000..66e8ab3497aaa9b17a99182a3179273df8845a79
--- /dev/null
+++ b/lib/vdso/check/elf.rs
@@ -0,0 +1,488 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use std::fmt;
+use std::iter::Iterator;
+use std::result::Result;
+use std::str;
+
+use ::bindings;
+
+#[derive(Debug, Copy, Clone)]
+enum ByteOrder {
+    LittleEndian,
+    BigEndian,
+}
+
+trait ToCpu {
+    fn to_cpu(self, byteorder: ByteOrder) -> Self;
+}
+
+macro_rules! declare_to_cpu {
+    ($t:ty) => {
+        impl ToCpu for $t {
+            fn to_cpu(self, byteorder: ByteOrder) -> Self {
+                match byteorder {
+                    ByteOrder::LittleEndian => Self::from_le(self),
+                    ByteOrder::BigEndian => Self::from_be(self),
+                }
+            }
+        }
+    };
+}
+
+declare_to_cpu!(u16);
+declare_to_cpu!(u32);
+declare_to_cpu!(u64);
+
+#[derive(Debug, Copy, Clone)]
+enum Class {
+    Elf32,
+    Elf64,
+}
+
+enum ClassAlternative<T32, T64> {
+    Elf32(T32),
+    Elf64(T64),
+}
+
+#[derive(Debug)]
+pub(crate) enum ParseError {
+    InvalidFileMagic([u8; 4]),
+    InvalidFileClass(u32),
+    InvalidFileByteOrder(u32),
+    InvalidSectionSize,
+    MissingStringTable,
+    StrtabIndexOutOfRange,
+    IndexOutOfRange,
+    StrtabInvalidData(str::Utf8Error),
+}
+
+pub(crate) type ParseResult<T> = Result<T, ParseError>;
+
+impl fmt::Display for ParseError {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match self {
+            ParseError::InvalidFileMagic(m) => write!(f, "Invalid ELF magic {:?}", m),
+            ParseError::InvalidFileClass(c) => write!(f, "Invalid ELF class {}", c),
+            ParseError::InvalidFileByteOrder(b) => write!(f, "Invalid ELF byteorder {}", b),
+            ParseError::InvalidSectionSize => write!(f, "Invalid ELF section size"),
+            ParseError::MissingStringTable => write!(f, "Missing string table"),
+            ParseError::IndexOutOfRange => write!(f, "Index out of range"),
+            ParseError::StrtabIndexOutOfRange => write!(f, "String table index out of range"),
+            ParseError::StrtabInvalidData(e) => write!(f, "Invalid data in string table: {}", e),
+        }
+    }
+}
+
+fn read_from_bytes<T>(data: &[u8]) -> ParseResult<T> {
+    if data.len() < std::mem::size_of::<T>() {
+        Err(ParseError::IndexOutOfRange)?
+    }
+    let ptr = data.as_ptr() as *const T;
+    let t: T = unsafe { std::ptr::read_unaligned(ptr) };
+    Ok(t)
+}
+
+fn get_data_subslice(data: &[u8], offset: u64, size: u64) -> ParseResult<&[u8]> {
+    let start: usize = offset.try_into().map_err(|_| ParseError::IndexOutOfRange)?;
+    let size: usize = size.try_into().map_err(|_| ParseError::IndexOutOfRange)?;
+    let end = start.checked_add(size).ok_or(ParseError::IndexOutOfRange)?;
+
+    Ok(&data[start..end])
+}
+
+/// Representation of a complete ELF file.
+#[derive(Debug)]
+pub(crate) struct File<'a> {
+    byteorder: ByteOrder,
+    class: Class,
+    pub type_: u16,
+    pub machine: u16,
+    pub data: &'a [u8],
+    section_headers: SectionInfo<'a>,
+    section_names: StrtabSection<'a>,
+}
+
+impl<'a> File<'a> {
+    pub(crate) fn new_from_bytes(data: &'a [u8]) -> Result<Self, ParseError> {
+        const ELF_MAGIC: [u8; 4] = [
+            bindings::ELFMAG0 as u8,
+            bindings::ELFMAG1 as u8,
+            bindings::ELFMAG2 as u8,
+            bindings::ELFMAG3 as u8,
+        ];
+        let ehdr: bindings::elf32_hdr = read_from_bytes(data)?;
+
+        let magic = [
+            ehdr.e_ident[bindings::EI_MAG0 as usize],
+            ehdr.e_ident[bindings::EI_MAG1 as usize],
+            ehdr.e_ident[bindings::EI_MAG2 as usize],
+            ehdr.e_ident[bindings::EI_MAG3 as usize],
+        ];
+
+        if magic != ELF_MAGIC {
+            return Err(ParseError::InvalidFileMagic(magic));
+        }
+
+        let class = match ehdr.e_ident[bindings::EI_CLASS as usize] as u32 {
+            bindings::ELFCLASS32 => Class::Elf32,
+            bindings::ELFCLASS64 => Class::Elf64,
+            c => return Err(ParseError::InvalidFileClass(c)),
+        };
+
+        let byteorder = match ehdr.e_ident[bindings::EI_DATA as usize] as u32 {
+            bindings::ELFDATA2LSB => ByteOrder::LittleEndian,
+            bindings::ELFDATA2MSB => ByteOrder::BigEndian,
+            b => return Err(ParseError::InvalidFileByteOrder(b)),
+        };
+
+        let (type_, machine, shnum, shoff, shentsize, shstrndx) = match class {
+            Class::Elf32 => {
+                let ehdr: bindings::elf32_hdr = read_from_bytes(data)?;
+                (
+                    ehdr.e_type.to_cpu(byteorder),
+                    ehdr.e_machine.to_cpu(byteorder),
+                    ehdr.e_shnum.to_cpu(byteorder),
+                    ehdr.e_shoff.to_cpu(byteorder).into(),
+                    ehdr.e_shentsize.to_cpu(byteorder),
+                    ehdr.e_shstrndx.to_cpu(byteorder),
+                )
+            }
+            Class::Elf64 => {
+                let ehdr: bindings::elf64_hdr = read_from_bytes(data)?;
+                (
+                    ehdr.e_type.to_cpu(byteorder),
+                    ehdr.e_machine.to_cpu(byteorder),
+                    ehdr.e_shnum.to_cpu(byteorder),
+                    ehdr.e_shoff.to_cpu(byteorder),
+                    ehdr.e_shentsize.to_cpu(byteorder),
+                    ehdr.e_shstrndx.to_cpu(byteorder),
+                )
+            }
+        };
+
+        let section_headers = SectionInfo {
+            byteorder,
+            class,
+            entsize: shentsize.into(),
+            data: get_data_subslice(data, shoff, u64::from(shnum) * u64::from(shentsize))?,
+            name: "<section headers>",
+        };
+
+        let string_table = SectionHeaderIterator::new(&section_headers, data)?
+            .nth(shstrndx.into())
+            .ok_or(ParseError::MissingStringTable)??;
+
+        let section_names = StrtabSection(SectionInfo {
+            name: "<section header names>",
+            byteorder,
+            class,
+            data: string_table.data,
+            entsize: string_table.entsize,
+        });
+
+        Ok(File {
+            byteorder,
+            class,
+            type_,
+            machine,
+            section_headers,
+            section_names,
+            data,
+        })
+    }
+
+    pub(crate) fn sections(&self) -> ParseResult<SectionIterator<'_>> {
+        Ok(SectionIterator {
+            file: self,
+            section_headers: SectionHeaderIterator::new(&self.section_headers, self.data)?,
+        })
+    }
+}
+
+/// High-level representation of an ELF section.
+#[derive(Clone, Debug)]
+pub(crate) struct SectionInfo<'a> {
+    byteorder: ByteOrder,
+    class: Class,
+    pub name: &'a str,
+    entsize: u64,
+    pub data: &'a [u8],
+}
+
+/// Typed high-level iterator over all sections in a `File`.
+#[derive(Debug)]
+pub(crate) enum Section<'a> {
+    Null(SectionInfo<'a>),
+    Rel(RelSection<'a>),
+    Rela(RelaSection<'a>),
+    Strtab(StrtabSection<'a>),
+    Unknown(SectionInfo<'a>),
+}
+
+impl<'a> Section<'a> {
+    pub(crate) fn info(&'a self) -> &'a SectionInfo<'a> {
+        match self {
+            Section::Null(info) | Section::Unknown(info) => info,
+            Section::Rel(rel) => &rel.0,
+            Section::Rela(rela) => &rela.0,
+            Section::Strtab(strtab) => &strtab.0,
+        }
+    }
+}
+
+pub(crate) struct SectionIterator<'a> {
+    file: &'a File<'a>,
+    section_headers: SectionHeaderIterator<'a, 'a>,
+}
+
+impl<'a> Iterator for SectionIterator<'a> {
+    type Item = ParseResult<Section<'a>>;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        self.section_headers.next().map(|header| {
+            let header = header?;
+            let info = SectionInfo {
+                byteorder: self.file.byteorder,
+                class: self.file.class,
+                name: self.file.section_names.entry(header.name)?,
+                entsize: header.entsize,
+                data: header.data,
+            };
+
+            Ok(match header.type_ {
+                bindings::SHT_NULL => Section::Null(info),
+                bindings::SHT_RELA => Section::Rela(RelaSection(info)),
+                bindings::SHT_REL => Section::Rel(RelSection(info)),
+                bindings::SHT_STRTAB => Section::Strtab(StrtabSection(info)),
+                _ => Section::Unknown(info),
+            })
+        })
+    }
+}
+
+/// Iterator over a section of data containing instances of type `T`.
+struct SectionEntityIterator<'a, T> {
+    data: &'a [u8],
+    byteorder: ByteOrder,
+    _phantom: std::marker::PhantomData<T>,
+}
+
+impl<'a, T> SectionEntityIterator<'a, T> {
+    const ENTITY_SIZE: usize = std::mem::size_of::<T>();
+
+    fn new(section: &'a SectionInfo<'a>) -> ParseResult<Self> {
+        let data = section.data;
+
+        if section.entsize != Self::ENTITY_SIZE as u64 {
+            Err(ParseError::InvalidSectionSize)
+        } else if data.len().is_multiple_of(Self::ENTITY_SIZE) {
+            Ok(Self {
+                data,
+                byteorder: section.byteorder,
+                _phantom: std::marker::PhantomData,
+            })
+        } else {
+            Err(ParseError::InvalidSectionSize)
+        }
+    }
+}
+
+impl<'a, T> Iterator for SectionEntityIterator<'a, T> {
+    type Item = T;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        if self.data.len() != 0 {
+            let ptr = self.data.as_ptr() as *const T;
+            let entity: T = unsafe { std::ptr::read_unaligned(ptr) };
+            self.data = &self.data[Self::ENTITY_SIZE..];
+            Some(entity)
+        } else {
+            None
+        }
+    }
+}
+
+/// Class-independent representation of an entry in a section header table.
+#[derive(Debug)]
+struct SectionHeader<'a> {
+    name: u32,
+    type_: u32,
+    entsize: u64,
+    data: &'a [u8],
+}
+
+/// Iterator over the section header table.
+struct SectionHeaderIterator<'f: 'a, 'a>(
+    ClassAlternative<
+        SectionEntityIterator<'a, bindings::elf32_shdr>,
+        SectionEntityIterator<'a, bindings::elf64_shdr>,
+    >,
+    &'f [u8],
+);
+
+impl<'f: 'a, 'a> SectionHeaderIterator<'f, 'a> {
+    fn new(section: &'a SectionInfo<'a>, file_data: &'f [u8]) -> ParseResult<Self> {
+        Ok(Self(
+            match section.class {
+                Class::Elf32 => ClassAlternative::Elf32(SectionEntityIterator::new(section)?),
+                Class::Elf64 => ClassAlternative::Elf64(SectionEntityIterator::new(section)?),
+            },
+            file_data,
+        ))
+    }
+}
+
+impl<'f: 'a, 'a> Iterator for SectionHeaderIterator<'f, 'a> {
+    type Item = ParseResult<SectionHeader<'f>>;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        let file_data = self.1;
+
+        match &mut self.0 {
+            ClassAlternative::Elf32(iter) => iter.next().map(|n| {
+                Ok(SectionHeader {
+                    name: n.sh_name.to_cpu(iter.byteorder).into(),
+                    type_: n.sh_type.to_cpu(iter.byteorder).into(),
+                    entsize: n.sh_entsize.to_cpu(iter.byteorder).into(),
+                    data: get_data_subslice(
+                        file_data,
+                        n.sh_offset.to_cpu(iter.byteorder).into(),
+                        n.sh_size.to_cpu(iter.byteorder).into(),
+                    )?,
+                })
+            }),
+            ClassAlternative::Elf64(iter) => iter.next().map(|n| {
+                Ok(SectionHeader {
+                    name: n.sh_name.to_cpu(iter.byteorder).into(),
+                    type_: n.sh_type.to_cpu(iter.byteorder).into(),
+                    entsize: n.sh_entsize.to_cpu(iter.byteorder).into(),
+                    data: get_data_subslice(
+                        file_data,
+                        n.sh_offset.to_cpu(iter.byteorder).into(),
+                        n.sh_size.to_cpu(iter.byteorder).into(),
+                    )?,
+                })
+            }),
+        }
+    }
+}
+
+/// High-level interface to a SHT_STRTAB string table.
+#[derive(Debug)]
+pub(crate) struct StrtabSection<'a>(SectionInfo<'a>);
+
+impl<'a> StrtabSection<'a> {
+    pub(crate) fn entry(&'a self, index: u32) -> ParseResult<&'a str> {
+        let data = self.0.data;
+        let index = index as usize;
+
+        if index >= data.len() {
+            Err(ParseError::StrtabIndexOutOfRange)
+        } else {
+            let len = data[index..]
+                .iter()
+                .position(|b| *b == 0x00)
+                .ok_or(ParseError::StrtabIndexOutOfRange)?;
+            let s = std::str::from_utf8(&data[index..index + len])
+                .map_err(|e| ParseError::StrtabInvalidData(e))?;
+            Ok(s)
+        }
+    }
+}
+
+/// High-level interface to a SHT_REL relocation table.
+#[derive(Debug)]
+pub(crate) struct RelSection<'a>(SectionInfo<'a>);
+
+impl<'a> RelSection<'a> {
+    pub(crate) fn entries(&'a self) -> ParseResult<RelSectionIterator<'a>> {
+        RelSectionIterator::new(&self.0)
+    }
+}
+
+#[derive(Debug)]
+pub(crate) struct Rel {
+    pub type_: u32,
+}
+
+pub(crate) struct RelSectionIterator<'a>(
+    ClassAlternative<
+        SectionEntityIterator<'a, bindings::elf32_rel>,
+        SectionEntityIterator<'a, bindings::elf64_rel>,
+    >,
+);
+
+impl<'a> RelSectionIterator<'a> {
+    fn new(section: &'a SectionInfo<'a>) -> ParseResult<Self> {
+        Ok(Self(match section.class {
+            Class::Elf32 => ClassAlternative::Elf32(SectionEntityIterator::new(section)?),
+            Class::Elf64 => ClassAlternative::Elf64(SectionEntityIterator::new(section)?),
+        }))
+    }
+}
+
+impl<'a> Iterator for RelSectionIterator<'a> {
+    type Item = Rel;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        match &mut self.0 {
+            ClassAlternative::Elf32(iter) => iter.next().map(|n| {
+                let type_ = n.r_info.to_cpu(iter.byteorder) & 0xff;
+                Self::Item { type_ }
+            }),
+            ClassAlternative::Elf64(iter) => iter.next().map(|n| {
+                let type_ = n.r_info.to_cpu(iter.byteorder) as u32;
+                Self::Item { type_ }
+            }),
+        }
+    }
+}
+
+/// High-level interface to a SHT_RELA relocation table.
+#[derive(Debug)]
+pub(crate) struct RelaSection<'a>(SectionInfo<'a>);
+
+impl<'a> RelaSection<'a> {
+    pub(crate) fn entries(&'a self) -> ParseResult<RelaSectionIterator<'a>> {
+        RelaSectionIterator::new(&self.0)
+    }
+}
+
+#[derive(Debug)]
+pub(crate) struct Rela {
+    pub type_: u32,
+}
+
+pub(crate) struct RelaSectionIterator<'a>(
+    ClassAlternative<
+        SectionEntityIterator<'a, bindings::elf32_rela>,
+        SectionEntityIterator<'a, bindings::elf64_rela>,
+    >,
+);
+
+impl<'a> RelaSectionIterator<'a> {
+    fn new(section: &'a SectionInfo<'a>) -> ParseResult<Self> {
+        Ok(Self(match section.class {
+            Class::Elf32 => ClassAlternative::Elf32(SectionEntityIterator::new(section)?),
+            Class::Elf64 => ClassAlternative::Elf64(SectionEntityIterator::new(section)?),
+        }))
+    }
+}
+
+impl<'a> Iterator for RelaSectionIterator<'a> {
+    type Item = Rela;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        match &mut self.0 {
+            ClassAlternative::Elf32(iter) => iter.next().map(|n| {
+                let type_ = n.r_info.to_cpu(iter.byteorder) & 0xff;
+                Self::Item { type_ }
+            }),
+            ClassAlternative::Elf64(iter) => iter.next().map(|n| {
+                let type_ = n.r_info.to_cpu(iter.byteorder) as u32;
+                Self::Item { type_ }
+            }),
+        }
+    }
+}
diff --git a/lib/vdso/check/vdsocheck.rs b/lib/vdso/check/vdsocheck.rs
new file mode 100644
index 0000000000000000000000000000000000000000..3c421100a91740ce3735edfbc9837ef49f55d8f8
--- /dev/null
+++ b/lib/vdso/check/vdsocheck.rs
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! vDSO build-time validation
+//!
+//! Check that the vDSO library does not contain dynamic relocations.
+
+use std::fmt;
+use std::fs;
+use std::option::Option;
+use std::process;
+
+use ::bindings;
+
+mod elf;
+
+struct AllowedRelocations<'a> {
+    ignored_object_file_sections: Option<&'a [&'a str]>,
+    in_object_file: &'a [u32],
+}
+
+impl<'a> AllowedRelocations<'a> {
+    fn is_ignored_section(&self, section: &elf::Section<'_>) -> bool {
+        let name = section.info().name;
+
+        if name.starts_with(".rel.debug_") || name.starts_with(".rela.debug_") {
+            true
+        } else if let Some(ignored_object_file_sections) = self.ignored_object_file_sections {
+            ignored_object_file_sections.contains(&name)
+        } else {
+            false
+        }
+    }
+}
+
+fn allowed_relocations_for_machine(machine: u16) -> Option<AllowedRelocations<'static>> {
+    match machine as u32 {
+        _ => None,
+    }
+}
+
+#[derive(Debug)]
+enum ValidationError<'a> {
+    ParseError(elf::ParseError),
+    UnsupportedArchitecture(u16),
+    UnrecognizedElfFileType(u32),
+    UnexpectedSection(elf::Section<'a>),
+    InvalidRelocation(elf::Section<'a>, u32),
+}
+
+impl<'a> From<elf::ParseError> for ValidationError<'a> {
+    fn from(parse_error: elf::ParseError) -> Self {
+        Self::ParseError(parse_error)
+    }
+}
+
+impl fmt::Display for ValidationError<'_> {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match self {
+            ValidationError::ParseError(e) => write!(f, "Parsing error: {}", e),
+            ValidationError::UnsupportedArchitecture(n) => {
+                write!(f, "Unsupported ELF architecture {}", n)
+            }
+            ValidationError::UnrecognizedElfFileType(t) => {
+                write!(f, "Unrecognized ELF file type {}", t)
+            }
+            ValidationError::UnexpectedSection(ref s) => {
+                write!(f, "Unexpected section '{}'", s.info().name)
+            }
+            ValidationError::InvalidRelocation(ref s, t) => {
+                write!(f, "Invalid relocation {} in section '{}'", t, s.info().name)
+            }
+        }
+    }
+}
+
+type ValidationResult<'a> = Result<(), ValidationError<'a>>;
+
+fn validate_linked_dso<'a>(file: &'a elf::File<'a>) -> ValidationResult<'a> {
+    for section in file.sections()? {
+        let section = section?;
+
+        /* No relocations are allowed */
+        match section {
+            elf::Section::Rel(_) | elf::Section::Rela(_) => {
+                return Err(ValidationError::UnexpectedSection(section))
+            }
+            _ => {}
+        }
+    }
+
+    Ok(())
+}
+
+fn validate_object_file<'a>(file: &'a elf::File<'a>) -> ValidationResult<'a> {
+    let allowed_relocs = allowed_relocations_for_machine(file.machine)
+        .ok_or(ValidationError::UnsupportedArchitecture(file.machine))?;
+
+    for section in file.sections()? {
+        let section = section?;
+
+        if allowed_relocs.is_ignored_section(&section) {
+            continue;
+        }
+
+        match section {
+            elf::Section::Rel(ref rel) => {
+                for entry in rel.entries()? {
+                    if !allowed_relocs.in_object_file.contains(&entry.type_) {
+                        return Err(ValidationError::InvalidRelocation(section, entry.type_));
+                    }
+                }
+            }
+            elf::Section::Rela(ref rela) => {
+                for entry in rela.entries()? {
+                    if !allowed_relocs.in_object_file.contains(&entry.type_) {
+                        return Err(ValidationError::InvalidRelocation(section, entry.type_));
+                    }
+                }
+            }
+            _ => {}
+        };
+    }
+
+    Ok(())
+}
+
+fn main() {
+    let mut args = std::env::args_os();
+
+    let program_name = args.next().unwrap_or("vdsocheck".into());
+
+    for path in args {
+        let data = fs::read(&path).unwrap_or_else(|err| {
+            println!("{}: {}: {}", program_name.display(), path.display(), err);
+            process::exit(1);
+        });
+
+        let file = elf::File::new_from_bytes(&data).unwrap_or_else(|err| {
+            println!("{}: {}: {}", program_name.display(), path.display(), err);
+            process::exit(2);
+        });
+
+        let result = match file.type_ as u32 {
+            bindings::ET_DYN => validate_linked_dso(&file),
+            bindings::ET_REL => validate_object_file(&file),
+            t => Err(ValidationError::UnrecognizedElfFileType(t)),
+        };
+
+        result.unwrap_or_else(|err| {
+            println!("{}: {}: {}", program_name.display(), path.display(), err);
+            process::exit(3);
+        });
+    }
+}

-- 
2.50.1


