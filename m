Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD0A2CE113
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 22:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501995AbgLCVr0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 16:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2501974AbgLCVrZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Dec 2020 16:47:25 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77BA8C08C5F2;
        Thu,  3 Dec 2020 13:46:44 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkwQz-00GJS4-OZ; Thu, 03 Dec 2020 21:46:41 +0000
From:   Al Viro <viro@ZenIV.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 02/10] elf_prstatus: collect the common part (everything before pr_reg) into a struct
Date:   Thu,  3 Dec 2020 21:46:33 +0000
Message-Id: <20201203214641.3887979-2-viro@ZenIV.linux.org.uk>
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

Preparations to doing i386 compat elf_prstatus sanely - rather than duplicating
the beginning of compat_elf_prstatus, take these fields into a separate
structure (compat_elf_prstatus_common), so that it could be reused.  Due to
the incestous relationship between binfmt_elf.c and compat_binfmt_elf.c we
need the same shape change done to native struct elf_prstatus, gathering the
fields prior to pr_reg into a new structure (struct elf_prstatus_common).

Fortunately, offset of pr_reg is always a multiple of 16 with no padding
right before it, so it's possible to turn all the stuff prior to it into
a single member without disturbing the layout.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/ia64/kernel/crash.c                   |  2 +-
 arch/mips/kernel/binfmt_elfn32.c           |  7 ++++++-
 arch/mips/kernel/binfmt_elfo32.c           |  6 +++++-
 arch/powerpc/platforms/powernv/opal-core.c |  6 +++---
 arch/s390/kernel/crash_dump.c              |  2 +-
 fs/binfmt_elf.c                            |  6 +++---
 fs/binfmt_elf_fdpic.c                      | 22 +++++-----------------
 fs/compat_binfmt_elf.c                     |  1 +
 include/linux/elfcore-compat.h             |  7 ++++++-
 include/linux/elfcore.h                    |  7 ++++++-
 kernel/kexec_core.c                        |  2 +-
 11 files changed, 38 insertions(+), 30 deletions(-)

diff --git a/arch/ia64/kernel/crash.c b/arch/ia64/kernel/crash.c
index fec70d662d0c..4f47741005d2 100644
--- a/arch/ia64/kernel/crash.c
+++ b/arch/ia64/kernel/crash.c
@@ -43,7 +43,7 @@ crash_save_this_cpu(void)
 
 	elf_greg_t *dst = (elf_greg_t *)&(prstatus->pr_reg);
 	memset(prstatus, 0, sizeof(*prstatus));
-	prstatus->pr_pid = current->pid;
+	prstatus->common.pr_pid = current->pid;
 
 	ia64_dump_cpu_regs(dst);
 	cfm = dst[43];
diff --git a/arch/mips/kernel/binfmt_elfn32.c b/arch/mips/kernel/binfmt_elfn32.c
index 6ee3f7218c67..136dc0c9300d 100644
--- a/arch/mips/kernel/binfmt_elfn32.c
+++ b/arch/mips/kernel/binfmt_elfn32.c
@@ -44,7 +44,8 @@ typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
 #include <linux/math64.h>
 
 #define elf_prstatus elf_prstatus32
-struct elf_prstatus32
+#define elf_prstatus_common elf_prstatus32_common
+struct elf_prstatus32_common
 {
 	struct elf_siginfo pr_info;	/* Info associated with signal */
 	short	pr_cursig;		/* Current signal */
@@ -58,6 +59,10 @@ struct elf_prstatus32
 	struct old_timeval32 pr_stime; /* System time */
 	struct old_timeval32 pr_cutime;/* Cumulative user time */
 	struct old_timeval32 pr_cstime;/* Cumulative system time */
+};
+struct elf_prstatus32
+{
+	struct elf_prstatus32_common common:
 	elf_gregset_t pr_reg;	/* GP registers */
 	int pr_fpvalid;		/* True if math co-processor being used.  */
 };
diff --git a/arch/mips/kernel/binfmt_elfo32.c b/arch/mips/kernel/binfmt_elfo32.c
index 6dd103d3cebb..b1f4b8f1dee7 100644
--- a/arch/mips/kernel/binfmt_elfo32.c
+++ b/arch/mips/kernel/binfmt_elfo32.c
@@ -49,7 +49,7 @@ typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
 #include <linux/math64.h>
 
 #define elf_prstatus elf_prstatus32
-struct elf_prstatus32
+struct elf_prstatus32_common
 {
 	struct elf_siginfo pr_info;	/* Info associated with signal */
 	short	pr_cursig;		/* Current signal */
@@ -63,6 +63,10 @@ struct elf_prstatus32
 	struct old_timeval32 pr_stime; /* System time */
 	struct old_timeval32 pr_cutime;/* Cumulative user time */
 	struct old_timeval32 pr_cstime;/* Cumulative system time */
+};
+struct elf_prstatus32
+{
+	struct elf_prstatus32_common common:
 	elf_gregset_t pr_reg;	/* GP registers */
 	int pr_fpvalid;		/* True if math co-processor being used.  */
 };
diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index 23571f0b555a..0d9ba70f7251 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -119,8 +119,8 @@ static void fill_prstatus(struct elf_prstatus *prstatus, int pir,
 	 * As a PIR value could also be '0', add an offset of '100'
 	 * to every PIR to avoid misinterpretations in GDB.
 	 */
-	prstatus->pr_pid  = cpu_to_be32(100 + pir);
-	prstatus->pr_ppid = cpu_to_be32(1);
+	prstatus->common.pr_pid  = cpu_to_be32(100 + pir);
+	prstatus->common.pr_ppid = cpu_to_be32(1);
 
 	/*
 	 * Indicate SIGUSR1 for crash initiated from kernel.
@@ -130,7 +130,7 @@ static void fill_prstatus(struct elf_prstatus *prstatus, int pir,
 		short sig;
 
 		sig = kernel_initiated ? SIGUSR1 : SIGTERM;
-		prstatus->pr_cursig = cpu_to_be16(sig);
+		prstatus->common.pr_cursig = cpu_to_be16(sig);
 	}
 }
 
diff --git a/arch/s390/kernel/crash_dump.c b/arch/s390/kernel/crash_dump.c
index 205b2e2648aa..0e36dfc9ccd6 100644
--- a/arch/s390/kernel/crash_dump.c
+++ b/arch/s390/kernel/crash_dump.c
@@ -365,7 +365,7 @@ static void *fill_cpu_elf_notes(void *ptr, int cpu, struct save_area *sa)
 	memcpy(&nt_prstatus.pr_reg.gprs, sa->gprs, sizeof(sa->gprs));
 	memcpy(&nt_prstatus.pr_reg.psw, sa->psw, sizeof(sa->psw));
 	memcpy(&nt_prstatus.pr_reg.acrs, sa->acrs, sizeof(sa->acrs));
-	nt_prstatus.pr_pid = cpu;
+	nt_prstatus.common.pr_pid = cpu;
 	/* Prepare fpregset (floating point) note */
 	memset(&nt_fpregset, 0, sizeof(nt_fpregset));
 	memcpy(&nt_fpregset.fpc, &sa->fpc, sizeof(sa->fpc));
diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index f066882bd270..c76324f647ae 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1495,7 +1495,7 @@ static void fill_note(struct memelfnote *note, const char *name, int type,
  * fill up all the fields in prstatus from the given task struct, except
  * registers which need to be filled up separately.
  */
-static void fill_prstatus(struct elf_prstatus *prstatus,
+static void fill_prstatus(struct elf_prstatus_common *prstatus,
 		struct task_struct *p, long signr)
 {
 	prstatus->pr_info.si_signo = prstatus->pr_cursig = signr;
@@ -1736,7 +1736,7 @@ static int fill_thread_core_info(struct elf_thread_core_info *t,
 	 * than being the whole note contents.  We fill the reset in here.
 	 * We assume that regset 0 is NT_PRSTATUS.
 	 */
-	fill_prstatus(&t->prstatus, t->task, signr);
+	fill_prstatus(&t->prstatus.common, t->task, signr);
 	regset_get(t->task, &view->regsets[0],
 		   sizeof(t->prstatus.pr_reg), &t->prstatus.pr_reg);
 
@@ -1958,7 +1958,7 @@ static int elf_dump_thread_status(long signr, struct elf_thread_status *t)
 	struct task_struct *p = t->thread;
 	t->num_notes = 0;
 
-	fill_prstatus(&t->prstatus, p, signr);
+	fill_prstatus(&t->prstatus.common, p, signr);
 	elf_core_copy_task_regs(p, &t->prstatus.pr_reg);	
 	
 	fill_note(&t->notes[0], "CORE", NT_PRSTATUS, sizeof(t->prstatus),
diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
index be4062b8ba75..03d81a14bcbf 100644
--- a/fs/binfmt_elf_fdpic.c
+++ b/fs/binfmt_elf_fdpic.c
@@ -1191,18 +1191,7 @@ static int elf_fdpic_map_file_by_direct_mmap(struct elf_fdpic_params *params,
 
 struct elf_prstatus_fdpic
 {
-	struct elf_siginfo pr_info;	/* Info associated with signal */
-	short	pr_cursig;		/* Current signal */
-	unsigned long pr_sigpend;	/* Set of pending signals */
-	unsigned long pr_sighold;	/* Set of held signals */
-	pid_t	pr_pid;
-	pid_t	pr_ppid;
-	pid_t	pr_pgrp;
-	pid_t	pr_sid;
-	struct __kernel_old_timeval pr_utime;	/* User time */
-	struct __kernel_old_timeval pr_stime;	/* System time */
-	struct __kernel_old_timeval pr_cutime;	/* Cumulative user time */
-	struct __kernel_old_timeval pr_cstime;	/* Cumulative system time */
+	struct elf_prstatus_common	common;
 	elf_gregset_t pr_reg;	/* GP registers */
 	/* When using FDPIC, the loadmap addresses need to be communicated
 	 * to GDB in order for GDB to do the necessary relocations.  The
@@ -1301,7 +1290,7 @@ static inline void fill_note(struct memelfnote *note, const char *name, int type
  * fill up all the fields in prstatus from the given task struct, except
  * registers which need to be filled up separately.
  */
-static void fill_prstatus(struct elf_prstatus_fdpic *prstatus,
+static void fill_prstatus(struct elf_prstatus_common *prstatus,
 			  struct task_struct *p, long signr)
 {
 	prstatus->pr_info.si_signo = prstatus->pr_cursig = signr;
@@ -1332,9 +1321,6 @@ static void fill_prstatus(struct elf_prstatus_fdpic *prstatus,
 	}
 	prstatus->pr_cutime = ns_to_kernel_old_timeval(p->signal->cutime);
 	prstatus->pr_cstime = ns_to_kernel_old_timeval(p->signal->cstime);
-
-	prstatus->pr_exec_fdpic_loadmap = p->mm->context.exec_fdpic_loadmap;
-	prstatus->pr_interp_fdpic_loadmap = p->mm->context.interp_fdpic_loadmap;
 }
 
 static int fill_psinfo(struct elf_prpsinfo *psinfo, struct task_struct *p,
@@ -1405,7 +1391,9 @@ static struct elf_thread_status *elf_dump_thread_status(long signr, struct task_
 	if (!t)
 		return t;
 
-	fill_prstatus(&t->prstatus, p, signr);
+	fill_prstatus(&t->prstatus.common, p, signr);
+	t->prstatus.pr_exec_fdpic_loadmap = p->mm->context.exec_fdpic_loadmap;
+	t->prstatus.pr_interp_fdpic_loadmap = p->mm->context.interp_fdpic_loadmap;
 	regset_get(p, &view->regsets[0],
 		   sizeof(t->prstatus.pr_reg), &t->prstatus.pr_reg);
 
diff --git a/fs/compat_binfmt_elf.c b/fs/compat_binfmt_elf.c
index 13cd78773700..a40df32acff5 100644
--- a/fs/compat_binfmt_elf.c
+++ b/fs/compat_binfmt_elf.c
@@ -50,6 +50,7 @@
  * which requires asm/elf.h to define compat_elf_gregset_t et al.
  */
 #define elf_prstatus	compat_elf_prstatus
+#define elf_prstatus_common	compat_elf_prstatus_common
 #define elf_prpsinfo	compat_elf_prpsinfo
 
 #undef ns_to_kernel_old_timeval
diff --git a/include/linux/elfcore-compat.h b/include/linux/elfcore-compat.h
index 10485f0c9740..4aeda5f1f038 100644
--- a/include/linux/elfcore-compat.h
+++ b/include/linux/elfcore-compat.h
@@ -17,7 +17,7 @@ struct compat_elf_siginfo
 	compat_int_t			si_errno;
 };
 
-struct compat_elf_prstatus
+struct compat_elf_prstatus_common
 {
 	struct compat_elf_siginfo	pr_info;
 	short				pr_cursig;
@@ -31,6 +31,11 @@ struct compat_elf_prstatus
 	struct old_timeval32		pr_stime;
 	struct old_timeval32		pr_cutime;
 	struct old_timeval32		pr_cstime;
+};
+
+struct compat_elf_prstatus
+{
+	struct compat_elf_prstatus_common	common;
 	compat_elf_gregset_t		pr_reg;
 	compat_int_t			pr_fpvalid;
 };
diff --git a/include/linux/elfcore.h b/include/linux/elfcore.h
index 46c3d691f677..641a9041182d 100644
--- a/include/linux/elfcore.h
+++ b/include/linux/elfcore.h
@@ -29,7 +29,7 @@ struct elf_siginfo
  * the SVR4 structure, but more Linuxy, with things that Linux does
  * not support and which gdb doesn't really use excluded.
  */
-struct elf_prstatus
+struct elf_prstatus_common
 {
 	struct elf_siginfo pr_info;	/* Info associated with signal */
 	short	pr_cursig;		/* Current signal */
@@ -43,6 +43,11 @@ struct elf_prstatus
 	struct __kernel_old_timeval pr_stime;	/* System time */
 	struct __kernel_old_timeval pr_cutime;	/* Cumulative user time */
 	struct __kernel_old_timeval pr_cstime;	/* Cumulative system time */
+};
+
+struct elf_prstatus
+{
+	struct elf_prstatus_common common;
 	elf_gregset_t pr_reg;	/* GP registers */
 	int pr_fpvalid;		/* True if math co-processor being used.  */
 };
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index 8798a8183974..e61ab826ab18 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -1077,7 +1077,7 @@ void crash_save_cpu(struct pt_regs *regs, int cpu)
 	if (!buf)
 		return;
 	memset(&prstatus, 0, sizeof(prstatus));
-	prstatus.pr_pid = current->pid;
+	prstatus.common.pr_pid = current->pid;
 	elf_core_copy_kernel_regs(&prstatus.pr_reg, regs);
 	buf = append_elf_note(buf, KEXEC_CORE_NOTE_NAME, NT_PRSTATUS,
 			      &prstatus, sizeof(prstatus));
-- 
2.11.0

