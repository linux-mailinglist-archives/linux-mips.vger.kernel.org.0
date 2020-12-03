Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 501492CE11D
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 22:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501986AbgLCVrj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 16:47:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388512AbgLCVrY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Dec 2020 16:47:24 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 717BAC061A56;
        Thu,  3 Dec 2020 13:46:44 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkwQz-00GJSG-VG; Thu, 03 Dec 2020 21:46:42 +0000
From:   Al Viro <viro@ZenIV.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 04/10] mips binfmt_elf*32.c: use elfcore-compat.h
Date:   Thu,  3 Dec 2020 21:46:35 +0000
Message-Id: <20201203214641.3887979-4-viro@ZenIV.linux.org.uk>
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

... rather than duplicating declarations from it.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/mips/kernel/binfmt_elfn32.c | 37 ++++---------------------------------
 arch/mips/kernel/binfmt_elfo32.c | 36 ++++--------------------------------
 2 files changed, 8 insertions(+), 65 deletions(-)

diff --git a/arch/mips/kernel/binfmt_elfn32.c b/arch/mips/kernel/binfmt_elfn32.c
index 136dc0c9300d..b78821a2b216 100644
--- a/arch/mips/kernel/binfmt_elfn32.c
+++ b/arch/mips/kernel/binfmt_elfn32.c
@@ -42,46 +42,17 @@ typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
 #include <linux/elfcore.h>
 #include <linux/compat.h>
 #include <linux/math64.h>
+#include <linux/elfcore-compat.h>
 
 #define elf_prstatus elf_prstatus32
-#define elf_prstatus_common elf_prstatus32_common
-struct elf_prstatus32_common
-{
-	struct elf_siginfo pr_info;	/* Info associated with signal */
-	short	pr_cursig;		/* Current signal */
-	unsigned int pr_sigpend;	/* Set of pending signals */
-	unsigned int pr_sighold;	/* Set of held signals */
-	pid_t	pr_pid;
-	pid_t	pr_ppid;
-	pid_t	pr_pgrp;
-	pid_t	pr_sid;
-	struct old_timeval32 pr_utime; /* User time */
-	struct old_timeval32 pr_stime; /* System time */
-	struct old_timeval32 pr_cutime;/* Cumulative user time */
-	struct old_timeval32 pr_cstime;/* Cumulative system time */
-};
+#define elf_prstatus_common compat_elf_prstatus_common
 struct elf_prstatus32
 {
-	struct elf_prstatus32_common common:
+	struct compat_elf_prstatus_common common;
 	elf_gregset_t pr_reg;	/* GP registers */
 	int pr_fpvalid;		/* True if math co-processor being used.  */
 };
-
-#define elf_prpsinfo elf_prpsinfo32
-struct elf_prpsinfo32
-{
-	char	pr_state;	/* numeric process state */
-	char	pr_sname;	/* char for pr_state */
-	char	pr_zomb;	/* zombie */
-	char	pr_nice;	/* nice val */
-	unsigned int pr_flag;	/* flags */
-	__kernel_uid_t	pr_uid;
-	__kernel_gid_t	pr_gid;
-	pid_t	pr_pid, pr_ppid, pr_pgrp, pr_sid;
-	/* Lots missing */
-	char	pr_fname[16];	/* filename of executable */
-	char	pr_psargs[ELF_PRARGSZ]; /* initial part of arg list */
-};
+#define elf_prpsinfo compat_elf_prpsinfo
 
 #define elf_caddr_t	u32
 #define init_elf_binfmt init_elfn32_binfmt
diff --git a/arch/mips/kernel/binfmt_elfo32.c b/arch/mips/kernel/binfmt_elfo32.c
index b1f4b8f1dee7..e94afbd3adc5 100644
--- a/arch/mips/kernel/binfmt_elfo32.c
+++ b/arch/mips/kernel/binfmt_elfo32.c
@@ -47,45 +47,17 @@ typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
 #include <linux/elfcore.h>
 #include <linux/compat.h>
 #include <linux/math64.h>
+#include <linux/elfcore-compat.h>
 
 #define elf_prstatus elf_prstatus32
-struct elf_prstatus32_common
-{
-	struct elf_siginfo pr_info;	/* Info associated with signal */
-	short	pr_cursig;		/* Current signal */
-	unsigned int pr_sigpend;	/* Set of pending signals */
-	unsigned int pr_sighold;	/* Set of held signals */
-	pid_t	pr_pid;
-	pid_t	pr_ppid;
-	pid_t	pr_pgrp;
-	pid_t	pr_sid;
-	struct old_timeval32 pr_utime; /* User time */
-	struct old_timeval32 pr_stime; /* System time */
-	struct old_timeval32 pr_cutime;/* Cumulative user time */
-	struct old_timeval32 pr_cstime;/* Cumulative system time */
-};
+#define elf_prstatus_common compat_elf_prstatus_common
 struct elf_prstatus32
 {
-	struct elf_prstatus32_common common:
+	struct compat_elf_prstatus_common common;
 	elf_gregset_t pr_reg;	/* GP registers */
 	int pr_fpvalid;		/* True if math co-processor being used.  */
 };
-
-#define elf_prpsinfo elf_prpsinfo32
-struct elf_prpsinfo32
-{
-	char	pr_state;	/* numeric process state */
-	char	pr_sname;	/* char for pr_state */
-	char	pr_zomb;	/* zombie */
-	char	pr_nice;	/* nice val */
-	unsigned int pr_flag;	/* flags */
-	__kernel_uid_t	pr_uid;
-	__kernel_gid_t	pr_gid;
-	pid_t	pr_pid, pr_ppid, pr_pgrp, pr_sid;
-	/* Lots missing */
-	char	pr_fname[16];	/* filename of executable */
-	char	pr_psargs[ELF_PRARGSZ]; /* initial part of arg list */
-};
+#define elf_prpsinfo compat_elf_prpsinfo
 
 #define elf_caddr_t	u32
 #define init_elf_binfmt init_elf32_binfmt
-- 
2.11.0

