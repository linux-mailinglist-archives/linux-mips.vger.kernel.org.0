Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF48600A1
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2019 07:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbfGEFbR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Jul 2019 01:31:17 -0400
Received: from foss.arm.com ([217.140.110.172]:57920 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727159AbfGEFbR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Jul 2019 01:31:17 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D37028;
        Thu,  4 Jul 2019 22:31:15 -0700 (PDT)
Received: from p8cg001049571a15.blr.arm.com (p8cg001049571a15.blr.arm.com [10.162.41.127])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 978163F246;
        Thu,  4 Jul 2019 22:32:57 -0700 (PDT)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
To:     linux-mm@kvack.org
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Richard Fontana <rfontana@redhat.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>, x86@kernel.org,
        linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org
Subject: [PATCH] mm/kprobes: Add generic kprobe_fault_handler() fallback definition
Date:   Fri,  5 Jul 2019 11:00:29 +0530
Message-Id: <1562304629-29376-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Architectures like parisc enable CONFIG_KROBES without having a definition
for kprobe_fault_handler() which results in a build failure. Arch needs to
provide kprobe_fault_handler() as it is platform specific and cannot have
a generic working alternative. But in the event when platform lacks such a
definition there needs to be a fallback.

This adds a stub kprobe_fault_handler() definition which not only prevents
a build failure but also makes sure that kprobe_page_fault() if called will
always return negative in absence of a sane platform specific alternative.

While here wrap kprobe_page_fault() in CONFIG_KPROBES. This enables stud
definitions for generic kporbe_fault_handler() and kprobes_built_in() can
just be dropped. Only on x86 it needs to be added back locally as it gets
used in a !CONFIG_KPROBES function do_general_protection().

Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@mips.com>
Cc: James Hogan <jhogan@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Allison Randal <allison@lohutok.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Enrico Weigelt <info@metux.net>
Cc: Richard Fontana <rfontana@redhat.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: x86@kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org

Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arc/include/asm/kprobes.h     |  1 +
 arch/arm/include/asm/kprobes.h     |  1 +
 arch/arm64/include/asm/kprobes.h   |  1 +
 arch/ia64/include/asm/kprobes.h    |  1 +
 arch/mips/include/asm/kprobes.h    |  1 +
 arch/powerpc/include/asm/kprobes.h |  1 +
 arch/s390/include/asm/kprobes.h    |  1 +
 arch/sh/include/asm/kprobes.h      |  1 +
 arch/sparc/include/asm/kprobes.h   |  1 +
 arch/x86/include/asm/kprobes.h     |  6 ++++++
 include/linux/kprobes.h            | 32 ++++++++++++++++++------------
 11 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/arch/arc/include/asm/kprobes.h b/arch/arc/include/asm/kprobes.h
index 2134721dce44..ee8efe256675 100644
--- a/arch/arc/include/asm/kprobes.h
+++ b/arch/arc/include/asm/kprobes.h
@@ -45,6 +45,7 @@ struct kprobe_ctlblk {
 	struct prev_kprobe prev_kprobe;
 };
 
+#define kprobe_fault_handler kprobe_fault_handler
 int kprobe_fault_handler(struct pt_regs *regs, unsigned long cause);
 void kretprobe_trampoline(void);
 void trap_is_kprobe(unsigned long address, struct pt_regs *regs);
diff --git a/arch/arm/include/asm/kprobes.h b/arch/arm/include/asm/kprobes.h
index 213607a1f45c..660f877b989f 100644
--- a/arch/arm/include/asm/kprobes.h
+++ b/arch/arm/include/asm/kprobes.h
@@ -38,6 +38,7 @@ struct kprobe_ctlblk {
 	struct prev_kprobe prev_kprobe;
 };
 
+#define kprobe_fault_handler kprobe_fault_handler
 void arch_remove_kprobe(struct kprobe *);
 int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
 int kprobe_exceptions_notify(struct notifier_block *self,
diff --git a/arch/arm64/include/asm/kprobes.h b/arch/arm64/include/asm/kprobes.h
index 97e511d645a2..667773f75616 100644
--- a/arch/arm64/include/asm/kprobes.h
+++ b/arch/arm64/include/asm/kprobes.h
@@ -42,6 +42,7 @@ struct kprobe_ctlblk {
 	struct kprobe_step_ctx ss_ctx;
 };
 
+#define kprobe_fault_handler kprobe_fault_handler
 void arch_remove_kprobe(struct kprobe *);
 int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
 int kprobe_exceptions_notify(struct notifier_block *self,
diff --git a/arch/ia64/include/asm/kprobes.h b/arch/ia64/include/asm/kprobes.h
index c5cf5e4fb338..c321e8585089 100644
--- a/arch/ia64/include/asm/kprobes.h
+++ b/arch/ia64/include/asm/kprobes.h
@@ -106,6 +106,7 @@ struct arch_specific_insn {
 	unsigned short slot;
 };
 
+#define kprobe_fault_handler kprobe_fault_handler
 extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
 extern int kprobe_exceptions_notify(struct notifier_block *self,
 				    unsigned long val, void *data);
diff --git a/arch/mips/include/asm/kprobes.h b/arch/mips/include/asm/kprobes.h
index 68b1e5d458cf..d1efe991ea22 100644
--- a/arch/mips/include/asm/kprobes.h
+++ b/arch/mips/include/asm/kprobes.h
@@ -40,6 +40,7 @@ do {									\
 
 #define kretprobe_blacklist_size 0
 
+#define kprobe_fault_handler kprobe_fault_handler
 void arch_remove_kprobe(struct kprobe *p);
 int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
 
diff --git a/arch/powerpc/include/asm/kprobes.h b/arch/powerpc/include/asm/kprobes.h
index 66b3f2983b22..c94f375ec957 100644
--- a/arch/powerpc/include/asm/kprobes.h
+++ b/arch/powerpc/include/asm/kprobes.h
@@ -84,6 +84,7 @@ struct arch_optimized_insn {
 	kprobe_opcode_t *insn;
 };
 
+#define kprobe_fault_handler kprobe_fault_handler
 extern int kprobe_exceptions_notify(struct notifier_block *self,
 					unsigned long val, void *data);
 extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
diff --git a/arch/s390/include/asm/kprobes.h b/arch/s390/include/asm/kprobes.h
index b106aa29bf55..0ecaebb78092 100644
--- a/arch/s390/include/asm/kprobes.h
+++ b/arch/s390/include/asm/kprobes.h
@@ -73,6 +73,7 @@ struct kprobe_ctlblk {
 void arch_remove_kprobe(struct kprobe *p);
 void kretprobe_trampoline(void);
 
+#define kprobe_fault_handler kprobe_fault_handler
 int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
 int kprobe_exceptions_notify(struct notifier_block *self,
 	unsigned long val, void *data);
diff --git a/arch/sh/include/asm/kprobes.h b/arch/sh/include/asm/kprobes.h
index 6171682f7798..637a698393c0 100644
--- a/arch/sh/include/asm/kprobes.h
+++ b/arch/sh/include/asm/kprobes.h
@@ -45,6 +45,7 @@ struct kprobe_ctlblk {
 	struct prev_kprobe prev_kprobe;
 };
 
+#define kprobe_fault_handler kprobe_fault_handler
 extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
 extern int kprobe_exceptions_notify(struct notifier_block *self,
 				    unsigned long val, void *data);
diff --git a/arch/sparc/include/asm/kprobes.h b/arch/sparc/include/asm/kprobes.h
index bfcaa6326c20..9aa4d25a45a8 100644
--- a/arch/sparc/include/asm/kprobes.h
+++ b/arch/sparc/include/asm/kprobes.h
@@ -47,6 +47,7 @@ struct kprobe_ctlblk {
 	struct prev_kprobe prev_kprobe;
 };
 
+#define kprobe_fault_handler kprobe_fault_handler
 int kprobe_exceptions_notify(struct notifier_block *self,
 			     unsigned long val, void *data);
 int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
diff --git a/arch/x86/include/asm/kprobes.h b/arch/x86/include/asm/kprobes.h
index 5dc909d9ad81..1af2b6db13bd 100644
--- a/arch/x86/include/asm/kprobes.h
+++ b/arch/x86/include/asm/kprobes.h
@@ -101,11 +101,17 @@ struct kprobe_ctlblk {
 	struct prev_kprobe prev_kprobe;
 };
 
+#define kprobe_fault_handler kprobe_fault_handler
 extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
 extern int kprobe_exceptions_notify(struct notifier_block *self,
 				    unsigned long val, void *data);
 extern int kprobe_int3_handler(struct pt_regs *regs);
 extern int kprobe_debug_handler(struct pt_regs *regs);
+#else
+static inline int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
+{
+	return 0;
+}
 
 #endif /* CONFIG_KPROBES */
 #endif /* _ASM_X86_KPROBES_H */
diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
index 04bdaf01112c..e106f3018804 100644
--- a/include/linux/kprobes.h
+++ b/include/linux/kprobes.h
@@ -182,11 +182,19 @@ DECLARE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
 /*
  * For #ifdef avoidance:
  */
-static inline int kprobes_built_in(void)
+
+/*
+ * Architectures need to override this with their own implementation
+ * if they care to call kprobe_page_fault(). This will just ensure
+ * that kprobe_page_fault() returns false when called without having
+ * a proper platform specific definition for kprobe_fault_handler().
+ */
+#ifndef kprobe_fault_handler
+static inline int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
 {
-	return 1;
+	return 0;
 }
-
+#endif
 #ifdef CONFIG_KRETPROBES
 extern void arch_prepare_kretprobe(struct kretprobe_instance *ri,
 				   struct pt_regs *regs);
@@ -375,14 +383,6 @@ void free_insn_page(void *page);
 
 #else /* !CONFIG_KPROBES: */
 
-static inline int kprobes_built_in(void)
-{
-	return 0;
-}
-static inline int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
-{
-	return 0;
-}
 static inline struct kprobe *get_kprobe(void *addr)
 {
 	return NULL;
@@ -458,12 +458,11 @@ static inline bool is_kprobe_optinsn_slot(unsigned long addr)
 }
 #endif
 
+#ifdef CONFIG_KPROBES
 /* Returns true if kprobes handled the fault */
 static nokprobe_inline bool kprobe_page_fault(struct pt_regs *regs,
 					      unsigned int trap)
 {
-	if (!kprobes_built_in())
-		return false;
 	if (user_mode(regs))
 		return false;
 	/*
@@ -476,5 +475,12 @@ static nokprobe_inline bool kprobe_page_fault(struct pt_regs *regs,
 		return false;
 	return kprobe_fault_handler(regs, trap);
 }
+#else
+static nokprobe_inline bool kprobe_page_fault(struct pt_regs *regs,
+					      unsigned int trap)
+{
+	return false;
+}
+#endif
 
 #endif /* _LINUX_KPROBES_H */
-- 
2.20.1

