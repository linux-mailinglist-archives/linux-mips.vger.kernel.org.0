Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834C22CE115
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 22:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502030AbgLCVr2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 16:47:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2501986AbgLCVr0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Dec 2020 16:47:26 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8935C061A4F;
        Thu,  3 Dec 2020 13:46:43 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkwQz-00GJS1-Gt; Thu, 03 Dec 2020 21:46:41 +0000
From:   Al Viro <viro@ZenIV.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 01/10] binfmt_elf: partially sanitize PRSTATUS_SIZE and SET_PR_FPVALID
Date:   Thu,  3 Dec 2020 21:46:32 +0000
Message-Id: <20201203214641.3887979-1-viro@ZenIV.linux.org.uk>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201203214529.GB3579531@ZenIV.linux.org.uk>
References: <20201203214529.GB3579531@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Al Viro <viro@zeniv.linux.org.uk>

On 64bit architectures that support 32bit processes there are
two possible layouts for NT_PRSTATUS note in ELF coredumps.
For one thing, several fields are 64bit for native processes
and 32bit for compat ones (pr_sigpend, etc.).  For another,
the register dump is obviously different - the size and number
of registers are not going to be the same for 32bit and 64bit
variants of processor.

Usually that's handled by having two structures - elf_prstatus
for native layout and compat_elf_prstatus for 32bit one.
32bit processes are handled by fs/compat_binfmt_elf.c, which
defines a macro called 'elf_prstatus' that expands to compat_elf_prstatus.
Then it includes fs/binfmt_elf.c, which makes all references to
struct elf_prstatus to be textually replaced with struct
compat_elf_prstatus.  Ugly and somewhat brittle, but it works.

However, amd64 is worse - there are _three_ possible layouts.
One for native 64bit processes, another for i386 (32bit) processes
and yet another for x32 (32bit address space with full 64bit
registers).

Both i386 and x32 processes are handled by fs/compat_binfmt_elf.c,
with usual compat_binfmt_elf.c trickery.  However, the layouts
for i386 and x32 are not identical - they have the common beginning,
but the register dump part (pr_reg) is bigger on x32.  Worse, pr_reg
is not the last field - it's followed by int pr_fpvalid, so that
field ends up at different offsets for i386 and x32 layouts.

Fortunately, there's not much code that cares about any of that -
it's all encapsulated in fill_thread_core_info().  Since x32
variant is bigger, we define compat_elf_prstatus to match that
layout.  That way i386 processes have enough space to fit
their layout into.

Moreover, since these layouts are identical prior to pr_reg,
we don't need to distinguish x32 and i386 cases when we are
setting the fields prior to pr_reg.

Filling pr_reg itself is done by calling ->get() method of
appropriate regset, and that method knows what layout (and size)
to use.

We do need to distinguish x32 and i386 cases only for two
things: setting ->pr_fpvalid (offset differs for x32 and
i386) and choosing the right size for our note.

The way it's done is Not Nice, for the lack of more accurate
printable description.  There are two macros (PRSTATUS_SIZE and
SET_PR_FPVALID), that default essentially to sizeof(struct elf_prstatus)
and (S)->pr_fpvalid = 1.  On x86 asm/compat.h provides its own
variants.

Unfortunately, quite a few things go wrong there:
	* PRSTATUS_SIZE doesn't use the normal test for process
being an x32 one (TIF_X32); it compares the size reported by
regset with the size of pr_reg.
	* it hardcodes the sizes of x32 and i386 variants (296 and 144
resp.), so if some change in includes leads to asm/compat.h pulled
in by fs/binfmt_elf.c we are in trouble - it will end up using
the size of x32 variant for 64bit processes.
	* it's in the wrong place; asm/compat.h couldn't define
the structure for i386 layout, since it lacks quite a few types
needed for it.  Hardcoded sizes are largely due to that.

The proper fix would be to have an explicitly defined i386 variant
of structure and have PRSTATUS_SIZE/SET_PR_FPVALID check for
TIF_X32 to choose the variant that should be used.  Unfortunately,
that requires some manipulations of headers; we'll do that later
in the series, but for now let's go with the minimal variant -
rename PRSTATUS_SIZE in asm/compat.h to COMPAT_PRSTATUS_SIZE,
have fs/compat_binfmt_elf.c define PRSTATUS_SIZE to COMPAT_PRSTATUS_SIZE
and use the normal TIF_X32 check in that macro.  The size of i386 variant
is kept hardcoded for now.  Similar story for SET_PR_FPVALID.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/x86/include/asm/compat.h | 11 +++++++----
 fs/binfmt_elf.c               | 13 +++++--------
 fs/compat_binfmt_elf.c        |  8 ++++++++
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.h
index 0e327a01f50f..1897e1dcbdd2 100644
--- a/arch/x86/include/asm/compat.h
+++ b/arch/x86/include/asm/compat.h
@@ -165,10 +165,13 @@ struct compat_shmid64_ds {
 typedef struct user_regs_struct compat_elf_gregset_t;
 
 /* Full regset -- prstatus on x32, otherwise on ia32 */
-#define PRSTATUS_SIZE(S, R) (R != sizeof(S.pr_reg) ? 144 : 296)
-#define SET_PR_FPVALID(S, V, R) \
-  do { *(int *) (((void *) &((S)->pr_reg)) + R) = (V); } \
-  while (0)
+#define COMPAT_PRSTATUS_SIZE (test_thread_flag(TIF_X32) \
+	? sizeof(struct compat_elf_prstatus) \
+	: 144)
+#define COMPAT_SET_PR_FPVALID(S) \
+	(*(test_thread_flag(TIF_X32)	\
+	       ? &(S)->pr_fpvalid	\
+               : (int *)((void *)(S) + 140)) = 1)
 
 #ifdef CONFIG_X86_X32_ABI
 #define COMPAT_USE_64BIT_TIME \
diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index b6b3d052ca86..f066882bd270 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1717,11 +1717,11 @@ static void do_thread_regset_writeback(struct task_struct *task,
 }
 
 #ifndef PRSTATUS_SIZE
-#define PRSTATUS_SIZE(S, R) sizeof(S)
+#define PRSTATUS_SIZE sizeof(struct elf_prstatus)
 #endif
 
 #ifndef SET_PR_FPVALID
-#define SET_PR_FPVALID(S, V, R) ((S)->pr_fpvalid = (V))
+#define SET_PR_FPVALID(S) ((S)->pr_fpvalid = 1)
 #endif
 
 static int fill_thread_core_info(struct elf_thread_core_info *t,
@@ -1729,7 +1729,6 @@ static int fill_thread_core_info(struct elf_thread_core_info *t,
 				 long signr, size_t *total)
 {
 	unsigned int i;
-	int regset0_size;
 
 	/*
 	 * NT_PRSTATUS is the one special case, because the regset data
@@ -1738,13 +1737,11 @@ static int fill_thread_core_info(struct elf_thread_core_info *t,
 	 * We assume that regset 0 is NT_PRSTATUS.
 	 */
 	fill_prstatus(&t->prstatus, t->task, signr);
-	regset0_size = regset_get(t->task, &view->regsets[0],
+	regset_get(t->task, &view->regsets[0],
 		   sizeof(t->prstatus.pr_reg), &t->prstatus.pr_reg);
-	if (regset0_size < 0)
-		return 0;
 
 	fill_note(&t->notes[0], "CORE", NT_PRSTATUS,
-		  PRSTATUS_SIZE(t->prstatus, regset0_size), &t->prstatus);
+		  PRSTATUS_SIZE, &t->prstatus);
 	*total += notesize(&t->notes[0]);
 
 	do_thread_regset_writeback(t->task, &view->regsets[0]);
@@ -1772,7 +1769,7 @@ static int fill_thread_core_info(struct elf_thread_core_info *t,
 			continue;
 
 		if (is_fpreg)
-			SET_PR_FPVALID(&t->prstatus, 1, regset0_size);
+			SET_PR_FPVALID(&t->prstatus);
 
 		fill_note(&t->notes[i], is_fpreg ? "CORE" : "LINUX",
 			  note_type, ret, data);
diff --git a/fs/compat_binfmt_elf.c b/fs/compat_binfmt_elf.c
index 2d24c765cbd7..13cd78773700 100644
--- a/fs/compat_binfmt_elf.c
+++ b/fs/compat_binfmt_elf.c
@@ -95,6 +95,14 @@
 #define	ELF_EXEC_PAGESIZE	COMPAT_ELF_EXEC_PAGESIZE
 #endif
 
+#ifdef	COMPAT_PRSTATUS_SIZE
+#define	PRSTATUS_SIZE COMPAT_PRSTATUS_SIZE
+#endif
+
+#ifdef	COMPAT_SET_PR_FPVALID
+#define	SET_PR_FPVALID(S) COMPAT_SET_PR_FPVALID(S)
+#endif
+
 #ifdef	COMPAT_ELF_PLAT_INIT
 #undef	ELF_PLAT_INIT
 #define	ELF_PLAT_INIT		COMPAT_ELF_PLAT_INIT
-- 
2.11.0

