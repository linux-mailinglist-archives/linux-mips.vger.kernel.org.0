Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395E92CE11F
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 22:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502113AbgLCVrj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 16:47:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502109AbgLCVrj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Dec 2020 16:47:39 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E85C08E860;
        Thu,  3 Dec 2020 13:46:46 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkwQz-00GJSA-RC; Thu, 03 Dec 2020 21:46:41 +0000
From:   Al Viro <viro@ZenIV.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 03/10] [elfcore-compat][amd64] clean PRSTATUS_SIZE/SET_PR_FPVALID up properly
Date:   Thu,  3 Dec 2020 21:46:34 +0000
Message-Id: <20201203214641.3887979-3-viro@ZenIV.linux.org.uk>
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

To get rid of hardcoded size/offset in those macros we need to have
a definition of i386 variant of struct elf_prstatus.  However, we can't
do that in asm/compat.h - the types needed for that are not there and
adding an include of asm/user32.h into asm/compat.h would cause a lot
of mess.

That could be conveniently done in elfcore-compat.h, but currently there
is nowhere to put arch-dependent parts of it - no asm/elfcore-compat.h.
So we introduce a new file (asm/elfcore-compat.h, present on architectures
that have CONFIG_ARCH_HAS_ELFCORE_COMPAT set, currently only on x86),
have it pulled by linux/elfcore-compat.h and move the definitions there.

As a side benefit, we don't need to worry about accidental inclusion of
that file into binfmt_elf.c itself, so we don't need the dance with
COMPAT_PRSTATUS_SIZE, etc. - only fs/compat_binfmt_elf.c will see
that header.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/Kconfig                          |  3 +++
 arch/x86/Kconfig                      |  1 +
 arch/x86/include/asm/compat.h         | 14 --------------
 arch/x86/include/asm/elfcore-compat.h | 31 +++++++++++++++++++++++++++++++
 fs/compat_binfmt_elf.c                |  8 --------
 include/linux/elfcore-compat.h        | 18 +++++++++++-------
 6 files changed, 46 insertions(+), 29 deletions(-)
 create mode 100644 arch/x86/include/asm/elfcore-compat.h

diff --git a/arch/Kconfig b/arch/Kconfig
index 56b6ccc0e32d..b4d7eb7ef833 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1028,6 +1028,9 @@ config HAVE_STATIC_CALL_INLINE
 	bool
 	depends on HAVE_STATIC_CALL
 
+config ARCH_HAS_ELFCORE_COMPAT
+	bool
+
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f6946b81f74a..8eea77cf53a7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -30,6 +30,7 @@ config X86_64
 	select MODULES_USE_ELF_RELA
 	select NEED_DMA_MAP_STATE
 	select SWIOTLB
+	select ARCH_HAS_ELFCORE_COMPAT
 
 config FORCE_DYNAMIC_FTRACE
 	def_bool y
diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.h
index 1897e1dcbdd2..423bafe8b797 100644
--- a/arch/x86/include/asm/compat.h
+++ b/arch/x86/include/asm/compat.h
@@ -159,20 +159,6 @@ struct compat_shmid64_ds {
 	compat_ulong_t __unused5;
 };
 
-/*
- * The type of struct elf_prstatus.pr_reg in compatible core dumps.
- */
-typedef struct user_regs_struct compat_elf_gregset_t;
-
-/* Full regset -- prstatus on x32, otherwise on ia32 */
-#define COMPAT_PRSTATUS_SIZE (test_thread_flag(TIF_X32) \
-	? sizeof(struct compat_elf_prstatus) \
-	: 144)
-#define COMPAT_SET_PR_FPVALID(S) \
-	(*(test_thread_flag(TIF_X32)	\
-	       ? &(S)->pr_fpvalid	\
-               : (int *)((void *)(S) + 140)) = 1)
-
 #ifdef CONFIG_X86_X32_ABI
 #define COMPAT_USE_64BIT_TIME \
 	(!!(task_pt_regs(current)->orig_ax & __X32_SYSCALL_BIT))
diff --git a/arch/x86/include/asm/elfcore-compat.h b/arch/x86/include/asm/elfcore-compat.h
new file mode 100644
index 000000000000..614308ba3b95
--- /dev/null
+++ b/arch/x86/include/asm/elfcore-compat.h
@@ -0,0 +1,31 @@
+#ifndef _ASM_X86_ELFCORE_COMPAT_H
+#define _ASM_X86_ELFCORE_COMPAT_H
+
+#include <asm/user32.h>
+
+/*
+ * On amd64 we have two 32bit ABIs - i386 and x32.  The latter
+ * has bigger registers, so we use it for compat_elf_regset_t.
+ * The former uses i386_elf_prstatus and PRSTATUS_SIZE/SET_PR_FPVALID
+ * are used to choose the size and location of ->pr_fpvalid of
+ * the layout actually used.
+ */
+typedef struct user_regs_struct compat_elf_gregset_t;
+
+struct i386_elf_prstatus
+{
+	struct compat_elf_prstatus_common	common;
+	struct user_regs_struct32		pr_reg;
+	compat_int_t			pr_fpvalid;
+};
+
+#define PRSTATUS_SIZE \
+	(test_thread_flag(TIF_X32) \
+		? sizeof(struct compat_elf_prstatus) \
+		: sizeof(struct i386_elf_prstatus))
+#define SET_PR_FPVALID(S) \
+	(*(test_thread_flag(TIF_X32) \
+		? &(S)->pr_fpvalid 	\
+		: &((struct i386_elf_prstatus *)(S))->pr_fpvalid) = 1)
+
+#endif
diff --git a/fs/compat_binfmt_elf.c b/fs/compat_binfmt_elf.c
index a40df32acff5..41b51b99f492 100644
--- a/fs/compat_binfmt_elf.c
+++ b/fs/compat_binfmt_elf.c
@@ -96,14 +96,6 @@
 #define	ELF_EXEC_PAGESIZE	COMPAT_ELF_EXEC_PAGESIZE
 #endif
 
-#ifdef	COMPAT_PRSTATUS_SIZE
-#define	PRSTATUS_SIZE COMPAT_PRSTATUS_SIZE
-#endif
-
-#ifdef	COMPAT_SET_PR_FPVALID
-#define	SET_PR_FPVALID(S) COMPAT_SET_PR_FPVALID(S)
-#endif
-
 #ifdef	COMPAT_ELF_PLAT_INIT
 #undef	ELF_PLAT_INIT
 #define	ELF_PLAT_INIT		COMPAT_ELF_PLAT_INIT
diff --git a/include/linux/elfcore-compat.h b/include/linux/elfcore-compat.h
index 4aeda5f1f038..e272c3d452ce 100644
--- a/include/linux/elfcore-compat.h
+++ b/include/linux/elfcore-compat.h
@@ -33,13 +33,6 @@ struct compat_elf_prstatus_common
 	struct old_timeval32		pr_cstime;
 };
 
-struct compat_elf_prstatus
-{
-	struct compat_elf_prstatus_common	common;
-	compat_elf_gregset_t		pr_reg;
-	compat_int_t			pr_fpvalid;
-};
-
 struct compat_elf_prpsinfo
 {
 	char				pr_state;
@@ -54,4 +47,15 @@ struct compat_elf_prpsinfo
 	char				pr_psargs[ELF_PRARGSZ];
 };
 
+#ifdef CONFIG_ARCH_HAS_ELFCORE_COMPAT
+#include <asm/elfcore-compat.h>
+#endif
+
+struct compat_elf_prstatus
+{
+	struct compat_elf_prstatus_common	common;
+	compat_elf_gregset_t		pr_reg;
+	compat_int_t			pr_fpvalid;
+};
+
 #endif /* _LINUX_ELFCORE_COMPAT_H */
-- 
2.11.0

