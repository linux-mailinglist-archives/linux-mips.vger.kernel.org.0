Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED512CE11A
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 22:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502069AbgLCVrc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 16:47:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502062AbgLCVrb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Dec 2020 16:47:31 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF299C08E85E;
        Thu,  3 Dec 2020 13:46:44 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkwR0-00GJSk-LG; Thu, 03 Dec 2020 21:46:42 +0000
From:   Al Viro <viro@ZenIV.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 09/10] mips compat: switch to compat_binfmt_elf.c
Date:   Thu,  3 Dec 2020 21:46:40 +0000
Message-Id: <20201203214641.3887979-9-viro@ZenIV.linux.org.uk>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201203214641.3887979-1-viro@ZenIV.linux.org.uk>
References: <20201203214529.GB3579531@ZenIV.linux.org.uk>
 <20201203214641.3887979-1-viro@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Al Viro <viro@zeniv.linux.org.uk>

Like amd64, mips has two 32bit ABIs - o32 and n32.  Unlike amd64,
it does not use compat_binfmt_elf.c for either of those; each
of those ABIs has a binfmt handler of its own, both very similar
to fs/compat_binfmt_elf.c.  And the same technics as we use on
amd64 can be used to make fs/compat_binfmt_elf.c handle both.
	* merge elfo32_check_arch() with elfn32_check_arch(),
make that serve as compat_elf_check_arch().  Note that
SET_PERSONALITY2() is already the same for all ABI variants -
it looks at the elf header to choose the flags to set.
	* add asm/elfcore-compat.h, using the bigger (n32) variant
of elf32_prstatus as compat_elf_prstatus there.
	* make PRSTATUS_SIZE() and SET_PR_FPVALID() choose the
right layout, same as done for amd64.  test_thread_flag(TIF_32BIT_REGS)
is used as the predicate.

Voila - we are rid of binfmt_elf{n,o}32.c; fs/compat_binfmt_elf.c is
used, same as for all other ELF-supporting 64bit architectures that
need 32bit compat.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/mips/Kconfig                      |  8 ++---
 arch/mips/include/asm/elf.h            | 54 +++++++++++--------------------
 arch/mips/include/asm/elfcore-compat.h | 29 +++++++++++++++++
 arch/mips/kernel/Makefile              |  4 +--
 arch/mips/kernel/binfmt_elfn32.c       | 58 ---------------------------------
 arch/mips/kernel/binfmt_elfo32.c       | 59 ----------------------------------
 arch/mips/kernel/scall64-n64.S         |  2 +-
 7 files changed, 54 insertions(+), 160 deletions(-)
 create mode 100644 arch/mips/include/asm/elfcore-compat.h
 delete mode 100644 arch/mips/kernel/binfmt_elfn32.c
 delete mode 100644 arch/mips/kernel/binfmt_elfo32.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 32ce052aa3b4..f14731aee182 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -91,6 +91,7 @@ config MIPS
 	select SET_FS
 	select SYSCTL_EXCEPTION_TRACE
 	select VIRT_TO_BUS
+	select ARCH_HAS_ELFCORE_COMPAT
 
 config MIPS_FIXUP_BIGPHYS_ADDR
 	bool
@@ -3270,6 +3271,7 @@ config MIPS32_O32
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT
 	select MIPS32_COMPAT
+	select COMPAT_BINFMT_ELF
 	select SYSVIPC_COMPAT if SYSVIPC
 	help
 	  Select this option if you want to run o32 binaries.  These are pure
@@ -3283,6 +3285,7 @@ config MIPS32_N32
 	depends on 64BIT
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION
 	select COMPAT
+	select COMPAT_BINFMT_ELF
 	select MIPS32_COMPAT
 	select SYSVIPC_COMPAT if SYSVIPC
 	help
@@ -3293,11 +3296,6 @@ config MIPS32_N32
 
 	  If unsure, say N.
 
-config BINFMT_ELF32
-	bool
-	default y if MIPS32_O32 || MIPS32_N32
-	select ELFCORE
-
 menu "Power management options"
 
 config ARCH_HIBERNATION_POSSIBLE
diff --git a/arch/mips/include/asm/elf.h b/arch/mips/include/asm/elf.h
index d29e43e4f9b1..dc8d2863752c 100644
--- a/arch/mips/include/asm/elf.h
+++ b/arch/mips/include/asm/elf.h
@@ -201,7 +201,6 @@ struct mips_elf_abiflags_v0 {
 	uint32_t flags2;
 };
 
-#ifndef ELF_ARCH
 /* ELF register definitions */
 #define ELF_NGREG	45
 #define ELF_NFPREG	33
@@ -219,7 +218,7 @@ void mips_dump_regs64(u64 *uregs, const struct pt_regs *regs);
 /*
  * This is used to ensure we don't load something for the wrong architecture.
  */
-#define elf_check_arch elfo32_check_arch
+#define elf_check_arch elf32_check_arch
 
 /*
  * These are used to set parameters in the core dumps.
@@ -235,7 +234,8 @@ void mips_dump_regs64(u64 *uregs, const struct pt_regs *regs);
 /*
  * This is used to ensure we don't load something for the wrong architecture.
  */
-#define elf_check_arch elfn64_check_arch
+#define elf_check_arch elf64_check_arch
+#define compat_elf_check_arch elf32_check_arch
 
 /*
  * These are used to set parameters in the core dumps.
@@ -257,8 +257,6 @@ void mips_dump_regs64(u64 *uregs, const struct pt_regs *regs);
 #endif
 #define ELF_ARCH	EM_MIPS
 
-#endif /* !defined(ELF_ARCH) */
-
 /*
  * In order to be sure that we don't attempt to execute an O32 binary which
  * requires 64 bit FP (FR=1) on a system which does not support it we refuse
@@ -277,9 +275,9 @@ void mips_dump_regs64(u64 *uregs, const struct pt_regs *regs);
 #define vmcore_elf64_check_arch mips_elf_check_machine
 
 /*
- * Return non-zero if HDR identifies an o32 ELF binary.
+ * Return non-zero if HDR identifies an o32 or n32 ELF binary.
  */
-#define elfo32_check_arch(hdr)						\
+#define elf32_check_arch(hdr)						\
 ({									\
 	int __res = 1;							\
 	struct elfhdr *__h = (hdr);					\
@@ -288,21 +286,26 @@ void mips_dump_regs64(u64 *uregs, const struct pt_regs *regs);
 		__res = 0;						\
 	if (__h->e_ident[EI_CLASS] != ELFCLASS32)			\
 		__res = 0;						\
-	if ((__h->e_flags & EF_MIPS_ABI2) != 0)				\
-		__res = 0;						\
-	if (((__h->e_flags & EF_MIPS_ABI) != 0) &&			\
-	    ((__h->e_flags & EF_MIPS_ABI) != EF_MIPS_ABI_O32))		\
-		__res = 0;						\
-	if (__h->e_flags & __MIPS_O32_FP64_MUST_BE_ZERO)		\
-		__res = 0;						\
-									\
+	if ((__h->e_flags & EF_MIPS_ABI2) != 0) {			\
+		if (!IS_ENABLED(CONFIG_MIPS32_N32) ||			\
+		     (__h->e_flags & EF_MIPS_ABI))			\
+			__res = 0;					\
+	} else {							\
+		if (IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_MIPS32_O32)) \
+			__res = 0;					\
+		if (((__h->e_flags & EF_MIPS_ABI) != 0) &&		\
+		    ((__h->e_flags & EF_MIPS_ABI) != EF_MIPS_ABI_O32))	\
+			__res = 0;					\
+		if (__h->e_flags & __MIPS_O32_FP64_MUST_BE_ZERO)	\
+			__res = 0;					\
+	}								\
 	__res;								\
 })
 
 /*
  * Return non-zero if HDR identifies an n64 ELF binary.
  */
-#define elfn64_check_arch(hdr)						\
+#define elf64_check_arch(hdr)						\
 ({									\
 	int __res = 1;							\
 	struct elfhdr *__h = (hdr);					\
@@ -315,25 +318,6 @@ void mips_dump_regs64(u64 *uregs, const struct pt_regs *regs);
 	__res;								\
 })
 
-/*
- * Return non-zero if HDR identifies an n32 ELF binary.
- */
-#define elfn32_check_arch(hdr)						\
-({									\
-	int __res = 1;							\
-	struct elfhdr *__h = (hdr);					\
-									\
-	if (!mips_elf_check_machine(__h))				\
-		__res = 0;						\
-	if (__h->e_ident[EI_CLASS] != ELFCLASS32)			\
-		__res = 0;						\
-	if (((__h->e_flags & EF_MIPS_ABI2) == 0) ||			\
-	    ((__h->e_flags & EF_MIPS_ABI) != 0))			\
-		__res = 0;						\
-									\
-	__res;								\
-})
-
 struct mips_abi;
 
 extern struct mips_abi mips_abi;
diff --git a/arch/mips/include/asm/elfcore-compat.h b/arch/mips/include/asm/elfcore-compat.h
new file mode 100644
index 000000000000..2f0f0103c75b
--- /dev/null
+++ b/arch/mips/include/asm/elfcore-compat.h
@@ -0,0 +1,29 @@
+#ifndef _ASM_MIPS_ELFCORE_COMPAT_H
+#define _ASM_MIPS_ELFCORE_COMPAT_H
+
+/*
+ * On mips we have two 32bit ABIs - o32 and n32.  The latter
+ * has bigger registers, so we use it for compat_elf_regset_t.
+ * The former uses o32_elf_prstatus and PRSTATUS_SIZE/SET_PR_FPVALID
+ * are used to choose the size and location of ->pr_fpvalid of
+ * the layout actually used.
+ */
+typedef elf_gregset_t compat_elf_gregset_t;
+
+struct o32_elf_prstatus
+{
+	struct compat_elf_prstatus_common	common;
+	unsigned int 			pr_reg[ELF_NGREG];
+	compat_int_t			pr_fpvalid;
+};
+
+#define PRSTATUS_SIZE \
+	(!test_thread_flag(TIF_32BIT_REGS) \
+		? sizeof(struct compat_elf_prstatus) \
+		: sizeof(struct o32_elf_prstatus))
+#define SET_PR_FPVALID(S) \
+	(*(!test_thread_flag(TIF_32BIT_REGS) \
+		? &(S)->pr_fpvalid 	\
+		: &((struct o32_elf_prstatus *)(S))->pr_fpvalid) = 1)
+
+#endif
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index 2a05b923f579..943eaeef73e9 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -80,8 +80,8 @@ obj-$(CONFIG_KPROBES)		+= kprobes.o
 obj-$(CONFIG_32BIT)		+= scall32-o32.o
 obj-$(CONFIG_64BIT)		+= scall64-n64.o
 obj-$(CONFIG_MIPS32_COMPAT)	+= linux32.o ptrace32.o signal32.o
-obj-$(CONFIG_MIPS32_N32)	+= binfmt_elfn32.o scall64-n32.o signal_n32.o
-obj-$(CONFIG_MIPS32_O32)	+= binfmt_elfo32.o scall64-o32.o signal_o32.o
+obj-$(CONFIG_MIPS32_N32)	+= scall64-n32.o signal_n32.o
+obj-$(CONFIG_MIPS32_O32)	+= scall64-o32.o signal_o32.o
 
 obj-$(CONFIG_KGDB)		+= kgdb.o
 obj-$(CONFIG_PROC_FS)		+= proc.o
diff --git a/arch/mips/kernel/binfmt_elfn32.c b/arch/mips/kernel/binfmt_elfn32.c
deleted file mode 100644
index 1aa32570fa9b..000000000000
--- a/arch/mips/kernel/binfmt_elfn32.c
+++ /dev/null
@@ -1,58 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for n32 Linux/MIPS ELF binaries.
- * Author: Ralf Baechle (ralf@linux-mips.org)
- *
- * Copyright (C) 1999, 2001 Ralf Baechle
- * Copyright (C) 1999, 2001 Silicon Graphics, Inc.
- *
- * Heavily inspired by the 32-bit Sparc compat code which is
- * Copyright (C) 1995, 1996, 1997, 1998 David S. Miller (davem@redhat.com)
- * Copyright (C) 1995, 1996, 1997, 1998 Jakub Jelinek	(jj@ultra.linux.cz)
- */
-
-#define ELF_ARCH		EM_MIPS
-#define ELF_CLASS		ELFCLASS32
-#ifdef __MIPSEB__
-#define ELF_DATA		ELFDATA2MSB;
-#else /* __MIPSEL__ */
-#define ELF_DATA		ELFDATA2LSB;
-#endif
-
-/* ELF register definitions */
-#define ELF_NGREG	45
-#define ELF_NFPREG	33
-
-typedef unsigned long elf_greg_t;
-typedef elf_greg_t elf_gregset_t[ELF_NGREG];
-
-typedef double elf_fpreg_t;
-typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
-
-/*
- * This is used to ensure we don't load something for the wrong architecture.
- */
-#define elf_check_arch elfn32_check_arch
-
-#include <asm/processor.h>
-#include <linux/elfcore.h>
-#include <linux/compat.h>
-#include <linux/math64.h>
-#include <linux/elfcore-compat.h>
-
-#define elf_prstatus elf_prstatus32
-#define elf_prstatus_common compat_elf_prstatus_common
-struct elf_prstatus32
-{
-	struct compat_elf_prstatus_common common;
-	elf_gregset_t pr_reg;	/* GP registers */
-	int pr_fpvalid;		/* True if math co-processor being used.  */
-};
-#define elf_prpsinfo compat_elf_prpsinfo
-
-#define init_elf_binfmt init_elfn32_binfmt
-
-#undef ns_to_kernel_old_timeval
-#define ns_to_kernel_old_timeval ns_to_old_timeval32
-
-#include "../../../fs/binfmt_elf.c"
diff --git a/arch/mips/kernel/binfmt_elfo32.c b/arch/mips/kernel/binfmt_elfo32.c
deleted file mode 100644
index 54fe6a4dac6d..000000000000
--- a/arch/mips/kernel/binfmt_elfo32.c
+++ /dev/null
@@ -1,59 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for o32 Linux/MIPS ELF binaries.
- * Author: Ralf Baechle (ralf@linux-mips.org)
- *
- * Copyright (C) 1999, 2001 Ralf Baechle
- * Copyright (C) 1999, 2001 Silicon Graphics, Inc.
- *
- * Heavily inspired by the 32-bit Sparc compat code which is
- * Copyright (C) 1995, 1996, 1997, 1998 David S. Miller (davem@redhat.com)
- * Copyright (C) 1995, 1996, 1997, 1998 Jakub Jelinek	(jj@ultra.linux.cz)
- */
-
-#define ELF_ARCH		EM_MIPS
-#define ELF_CLASS		ELFCLASS32
-#ifdef __MIPSEB__
-#define ELF_DATA		ELFDATA2MSB;
-#else /* __MIPSEL__ */
-#define ELF_DATA		ELFDATA2LSB;
-#endif
-
-/* ELF register definitions */
-#define ELF_NGREG	45
-#define ELF_NFPREG	33
-
-typedef unsigned int elf_greg_t;
-typedef elf_greg_t elf_gregset_t[ELF_NGREG];
-
-typedef double elf_fpreg_t;
-typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
-
-/*
- * This is used to ensure we don't load something for the wrong architecture.
- */
-#define elf_check_arch elfo32_check_arch
-
-#include <asm/processor.h>
-
-#include <linux/elfcore.h>
-#include <linux/compat.h>
-#include <linux/math64.h>
-#include <linux/elfcore-compat.h>
-
-#define elf_prstatus elf_prstatus32
-#define elf_prstatus_common compat_elf_prstatus_common
-struct elf_prstatus32
-{
-	struct compat_elf_prstatus_common common;
-	elf_gregset_t pr_reg;	/* GP registers */
-	int pr_fpvalid;		/* True if math co-processor being used.  */
-};
-#define elf_prpsinfo compat_elf_prpsinfo
-
-#define init_elf_binfmt init_elf32_binfmt
-
-#undef ns_to_kernel_old_timeval
-#define ns_to_kernel_old_timeval ns_to_old_timeval32
-
-#include "../../../fs/binfmt_elf.c"
diff --git a/arch/mips/kernel/scall64-n64.S b/arch/mips/kernel/scall64-n64.S
index 23b2e2b1609c..5e9c497ce099 100644
--- a/arch/mips/kernel/scall64-n64.S
+++ b/arch/mips/kernel/scall64-n64.S
@@ -20,7 +20,7 @@
 #include <asm/unistd.h>
 #include <asm/war.h>
 
-#ifndef CONFIG_BINFMT_ELF32
+#ifndef CONFIG_MIPS32_COMPAT
 /* Neither O32 nor N32, so define handle_sys here */
 #define handle_sys64 handle_sys
 #endif
-- 
2.11.0

