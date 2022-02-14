Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B88D44B56EF
	for <lists+linux-mips@lfdr.de>; Mon, 14 Feb 2022 17:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356652AbiBNQiP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Feb 2022 11:38:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343676AbiBNQiB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Feb 2022 11:38:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966DF60DAB;
        Mon, 14 Feb 2022 08:37:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1479A614F9;
        Mon, 14 Feb 2022 16:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36DDC340FA;
        Mon, 14 Feb 2022 16:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644856664;
        bh=qzcMb1Of30JXf/rqzR1r/df08I6ZO/2jC9ykeex8sLA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JCZI1EiNAHtP6Jl7m8crNbvmWkKDIPu8zX2cl9eWsgmUYwbkTsdZ4y0nwymRonV4e
         1SWEoBHCzYXY+nAayVfYtDtrC+giQHBttqLN8D+xAO5QxOiY1CXIluLY60oytlDLqQ
         F9Sozxj4k0Mu5lilY58GTG5bJFE41iEMphAq/A+bZaCwvWYD/zRgPfLflA180nBDCM
         ZDqfM4HfvLXXsd4neDaOjkmUlKrLA0F2NAuXEIJZ8r1diPxA49X7S7amhSeV0GtN3l
         KhoSzCNjwQEN5rdDbl0H1FbyZi43ML6uozMB2KWPJVDUCbBnWugwNxJ0FVu6Cvf+QU
         GhgFh/g7gcxwg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
        linux-kernel@vger.kernel.org
Cc:     linux@armlinux.org.uk, will@kernel.org, guoren@kernel.org,
        bcain@codeaurora.org, geert@linux-m68k.org, monstr@monstr.eu,
        tsbogend@alpha.franken.de, nickhu@andestech.com,
        green.hu@gmail.com, dinguyen@kernel.org, shorne@gmail.com,
        deller@gmx.de, mpe@ellerman.id.au, peterz@infradead.org,
        mingo@redhat.com, mark.rutland@arm.com, hca@linux.ibm.com,
        dalias@libc.org, davem@davemloft.net, richard@nod.at,
        x86@kernel.org, jcmvbkbc@gmail.com, ebiederm@xmission.com,
        akpm@linux-foundation.org, ardb@kernel.org,
        linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        linux-xtensa@linux-xtensa.org
Subject: [PATCH 11/14] sparc64: remove CONFIG_SET_FS support
Date:   Mon, 14 Feb 2022 17:34:49 +0100
Message-Id: <20220214163452.1568807-12-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220214163452.1568807-1-arnd@kernel.org>
References: <20220214163452.1568807-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

sparc64 uses address space identifiers to differentiate between kernel
and user space, using ASI_P for kernel threads but ASI_AIUS for normal
user space, with the option of changing between them.

As nothing really changes the ASI any more, just hardcode ASI_AIUS
everywhere. Kernel threads are not allowed to access __user pointers
anyway.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/sparc/Kconfig                      |  1 -
 arch/sparc/include/asm/processor_64.h   |  4 ----
 arch/sparc/include/asm/switch_to_64.h   |  4 +---
 arch/sparc/include/asm/thread_info_64.h |  4 +---
 arch/sparc/include/asm/uaccess_64.h     | 24 ------------------------
 arch/sparc/kernel/process_64.c          | 12 ------------
 arch/sparc/kernel/traps_64.c            |  2 --
 arch/sparc/lib/NGmemcpy.S               |  3 +--
 arch/sparc/mm/init_64.c                 |  3 ---
 9 files changed, 3 insertions(+), 54 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 875388835a58..5f08e4d16ad8 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -99,7 +99,6 @@ config SPARC64
 	select HAVE_SETUP_PER_CPU_AREA
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
-	select SET_FS
 
 config ARCH_PROC_KCORE_TEXT
 	def_bool y
diff --git a/arch/sparc/include/asm/processor_64.h b/arch/sparc/include/asm/processor_64.h
index ae851e8fce4c..89850dff6b03 100644
--- a/arch/sparc/include/asm/processor_64.h
+++ b/arch/sparc/include/asm/processor_64.h
@@ -47,10 +47,6 @@
 
 #ifndef __ASSEMBLY__
 
-typedef struct {
-	unsigned char seg;
-} mm_segment_t;
-
 /* The Sparc processor specific thread struct. */
 /* XXX This should die, everything can go into thread_info now. */
 struct thread_struct {
diff --git a/arch/sparc/include/asm/switch_to_64.h b/arch/sparc/include/asm/switch_to_64.h
index b1d4e2e3210f..14f3c49bfdbc 100644
--- a/arch/sparc/include/asm/switch_to_64.h
+++ b/arch/sparc/include/asm/switch_to_64.h
@@ -20,10 +20,8 @@ do {						\
 	 */
 #define switch_to(prev, next, last)					\
 do {	save_and_clear_fpu();						\
-	/* If you are tempted to conditionalize the following */	\
-	/* so that ASI is only written if it changes, think again. */	\
 	__asm__ __volatile__("wr %%g0, %0, %%asi"			\
-	: : "r" (task_thread_info(next)->current_ds));\
+	: : "r" (ASI_AIUS));						\
 	trap_block[current_thread_info()->cpu].thread =			\
 		task_thread_info(next);					\
 	__asm__ __volatile__(						\
diff --git a/arch/sparc/include/asm/thread_info_64.h b/arch/sparc/include/asm/thread_info_64.h
index 8047a9caab2f..1a44372e2bc0 100644
--- a/arch/sparc/include/asm/thread_info_64.h
+++ b/arch/sparc/include/asm/thread_info_64.h
@@ -46,7 +46,7 @@ struct thread_info {
 	struct pt_regs		*kregs;
 	int			preempt_count;	/* 0 => preemptable, <0 => BUG */
 	__u8			new_child;
-	__u8			current_ds;
+	__u8			__pad;
 	__u16			cpu;
 
 	unsigned long		*utraps;
@@ -81,7 +81,6 @@ struct thread_info {
 #define TI_KREGS	0x00000028
 #define TI_PRE_COUNT	0x00000030
 #define TI_NEW_CHILD	0x00000034
-#define TI_CURRENT_DS	0x00000035
 #define TI_CPU		0x00000036
 #define TI_UTRAPS	0x00000038
 #define TI_REG_WINDOW	0x00000040
@@ -116,7 +115,6 @@ struct thread_info {
 #define INIT_THREAD_INFO(tsk)				\
 {							\
 	.task		=	&tsk,			\
-	.current_ds	=	ASI_P,			\
 	.preempt_count	=	INIT_PREEMPT_COUNT,	\
 	.kregs		=	(struct pt_regs *)(init_stack+THREAD_SIZE)-1 \
 }
diff --git a/arch/sparc/include/asm/uaccess_64.h b/arch/sparc/include/asm/uaccess_64.h
index 000bac67cf31..617a462d1f56 100644
--- a/arch/sparc/include/asm/uaccess_64.h
+++ b/arch/sparc/include/asm/uaccess_64.h
@@ -13,24 +13,6 @@
 
 #include <asm/processor.h>
 
-/*
- * Sparc64 is segmented, though more like the M68K than the I386.
- * We use the secondary ASI to address user memory, which references a
- * completely different VM map, thus there is zero chance of the user
- * doing something queer and tricking us into poking kernel memory.
- *
- * What is left here is basically what is needed for the other parts of
- * the kernel that expect to be able to manipulate, erum, "segments".
- * Or perhaps more properly, permissions.
- *
- * "For historical reasons, these macros are grossly misnamed." -Linus
- */
-
-#define KERNEL_DS   ((mm_segment_t) { ASI_P })
-#define USER_DS     ((mm_segment_t) { ASI_AIUS })	/* har har har */
-
-#define get_fs() ((mm_segment_t){(current_thread_info()->current_ds)})
-
 static inline int __access_ok(const void __user *addr, unsigned long size)
 {
 	return 1;
@@ -38,12 +20,6 @@ static inline int __access_ok(const void __user *addr, unsigned long size)
 #define __access_ok __access_ok
 #include <asm-generic/access_ok.h>
 
-#define set_fs(val)								\
-do {										\
-	current_thread_info()->current_ds = (val).seg;				\
-	__asm__ __volatile__ ("wr %%g0, %0, %%asi" : : "r" ((val).seg));	\
-} while(0)
-
 /*
  * Test whether a block of memory is a valid user space address.
  * Returns 0 if the range is valid, nonzero otherwise.
diff --git a/arch/sparc/kernel/process_64.c b/arch/sparc/kernel/process_64.c
index f5b2cac8669f..9a2ceb080ac9 100644
--- a/arch/sparc/kernel/process_64.c
+++ b/arch/sparc/kernel/process_64.c
@@ -106,18 +106,13 @@ static void show_regwindow32(struct pt_regs *regs)
 {
 	struct reg_window32 __user *rw;
 	struct reg_window32 r_w;
-	mm_segment_t old_fs;
 	
 	__asm__ __volatile__ ("flushw");
 	rw = compat_ptr((unsigned int)regs->u_regs[14]);
-	old_fs = get_fs();
-	set_fs (USER_DS);
 	if (copy_from_user (&r_w, rw, sizeof(r_w))) {
-		set_fs (old_fs);
 		return;
 	}
 
-	set_fs (old_fs);			
 	printk("l0: %08x l1: %08x l2: %08x l3: %08x "
 	       "l4: %08x l5: %08x l6: %08x l7: %08x\n",
 	       r_w.locals[0], r_w.locals[1], r_w.locals[2], r_w.locals[3],
@@ -136,7 +131,6 @@ static void show_regwindow(struct pt_regs *regs)
 	struct reg_window __user *rw;
 	struct reg_window *rwk;
 	struct reg_window r_w;
-	mm_segment_t old_fs;
 
 	if ((regs->tstate & TSTATE_PRIV) || !(test_thread_flag(TIF_32BIT))) {
 		__asm__ __volatile__ ("flushw");
@@ -145,14 +139,10 @@ static void show_regwindow(struct pt_regs *regs)
 		rwk = (struct reg_window *)
 			(regs->u_regs[14] + STACK_BIAS);
 		if (!(regs->tstate & TSTATE_PRIV)) {
-			old_fs = get_fs();
-			set_fs (USER_DS);
 			if (copy_from_user (&r_w, rw, sizeof(r_w))) {
-				set_fs (old_fs);
 				return;
 			}
 			rwk = &r_w;
-			set_fs (old_fs);			
 		}
 	} else {
 		show_regwindow32(regs);
@@ -598,7 +588,6 @@ int copy_thread(unsigned long clone_flags, unsigned long sp, unsigned long arg,
 		memset(child_trap_frame, 0, child_stack_sz);
 		__thread_flag_byte_ptr(t)[TI_FLAG_BYTE_CWP] = 
 			(current_pt_regs()->tstate + 1) & TSTATE_CWP;
-		t->current_ds = ASI_P;
 		t->kregs->u_regs[UREG_G1] = sp; /* function */
 		t->kregs->u_regs[UREG_G2] = arg;
 		return 0;
@@ -613,7 +602,6 @@ int copy_thread(unsigned long clone_flags, unsigned long sp, unsigned long arg,
 	t->kregs->u_regs[UREG_FP] = sp;
 	__thread_flag_byte_ptr(t)[TI_FLAG_BYTE_CWP] = 
 		(regs->tstate + 1) & TSTATE_CWP;
-	t->current_ds = ASI_AIUS;
 	if (sp != regs->u_regs[UREG_FP]) {
 		unsigned long csp;
 
diff --git a/arch/sparc/kernel/traps_64.c b/arch/sparc/kernel/traps_64.c
index 21077821f427..5b4de4a89dec 100644
--- a/arch/sparc/kernel/traps_64.c
+++ b/arch/sparc/kernel/traps_64.c
@@ -2857,8 +2857,6 @@ void __init trap_init(void)
 		     TI_PRE_COUNT != offsetof(struct thread_info,
 					      preempt_count) ||
 		     TI_NEW_CHILD != offsetof(struct thread_info, new_child) ||
-		     TI_CURRENT_DS != offsetof(struct thread_info,
-						current_ds) ||
 		     TI_KUNA_REGS != offsetof(struct thread_info,
 					      kern_una_regs) ||
 		     TI_KUNA_INSN != offsetof(struct thread_info,
diff --git a/arch/sparc/lib/NGmemcpy.S b/arch/sparc/lib/NGmemcpy.S
index 8e4d22a6ba0b..ee51c1230689 100644
--- a/arch/sparc/lib/NGmemcpy.S
+++ b/arch/sparc/lib/NGmemcpy.S
@@ -10,8 +10,7 @@
 #include <asm/thread_info.h>
 #define GLOBAL_SPARE	%g7
 #define RESTORE_ASI(TMP)	\
-	ldub	[%g6 + TI_CURRENT_DS], TMP;  \
-	wr	TMP, 0x0, %asi;
+	wr	%g0, ASI_AIUS, %asi
 #else
 #define GLOBAL_SPARE	%g5
 #define RESTORE_ASI(TMP)	\
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 1b23639e2fcd..ee08c279d67c 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -709,9 +709,6 @@ static void __init inherit_prom_mappings(void)
 
 void prom_world(int enter)
 {
-	if (!enter)
-		set_fs(get_fs());
-
 	__asm__ __volatile__("flushw");
 }
 
-- 
2.29.2

