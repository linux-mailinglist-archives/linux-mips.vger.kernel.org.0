Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD6A212E7A1
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2020 15:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728600AbgABO6W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Jan 2020 09:58:22 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:48225 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728544AbgABO6W (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Jan 2020 09:58:22 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MKsSj-1j1g5N1e73-00LJ2E; Thu, 02 Jan 2020 15:57:20 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Robert Richter <rric@kernel.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        oprofile-list@lists.sf.net, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org
Subject: [PATCH v3 02/22] compat: provide compat_ptr() on all architectures
Date:   Thu,  2 Jan 2020 15:55:20 +0100
Message-Id: <20200102145552.1853992-3-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20200102145552.1853992-1-arnd@arndb.de>
References: <20200102145552.1853992-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2hX7IDTUYkAbF/HhQ6TYtzbjyBbqDNNLh+1GSIq8v43IxijC5jg
 IxCrNJ39AdLrHWtRvImmwZpTQaolJl/S2HV0sH4qgRii84CosdPsPdLkqE4AQdF19U2rwxu
 o8mx4dmOF2UdkOCL4EKQj2riMOwmeudimbJ3FbghXzFACFG4Z/gsnhMgeNu9FJi+ezUWH/e
 Ki2D1edrm4O22iSq+mRaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iRaRDLaZqiQ=:dCjjrqiMCTZI4CY8mY6J1F
 LgGw/52xqyKMiJ9kTcQPJE3ph6PNa39y3I6j3qJPMBAXCr+IcDtkTv65553CD7J6PBfRzmYHV
 pLDOMi+XLuxeUC3wmJktG3NY6ciGPgt+qxRgBLCsivTUyOATXh1EC6z76yfaZ2LgQe23uA2QX
 k+L2WYQIXQAP8S6+D7ApHQ7B8Eb0bIUGgSyEYbinXWi27nC3IUIsTcwFKiZSLo9nkoGEs4qPQ
 RjaLT5n2/14goOXuM7GS/7D3hvVGlrYgekwlnSp2SoRijVHFr83H9/bp8U43jJvYdDd+S+FTv
 Et4xcSspYq8kBwI1sEeBlzb095qWlf1EkfEE4o6tvTPciO3bSXcdian2fgZadSWOqspCa7GZQ
 d9Mq3fl/7Oog20lD8sZxAQqAWz7O3fnUo7yH7Byw8qq4cVtfjz5Sz3zZCa4Gp4fnMxUMGlrxC
 rK1ywoDvpwW5SoLvWIm+GZTOHar+l6tBeUAAQjLUMrkWmAvatTkk3Al6xxq05y1YW92TwncK6
 omMszIrgjfzzBKEfGmb8XrMG+S1osXmEjmNShtFsUGZrQG205nnYdRnDB4Gs9ELZQMCjdJDjn
 0dv0qr1bah3HryE6/8BJ5jnY/5hwvDLuBqKKPQtSycu/Fn+WdGyaqJWz2NC0NOq4XS7gvpyl7
 qFe6Pt4n3600Dtg9xczdjrrkiPTV5nkLT5YHPUjHSZdhSFO8W1YcEGwA0D3BszE//0rbCGn09
 8PghH7gQLStJ0W9m3HJcBVVmJBC1b2NlkhwpuaxQqlmUnN81kxkmydZrJ4rernRj+fOffEM0v
 UrCnkUZ3QtFSy6ENM6cvspMOaOnYhbmdFKIQe5QhwFCRjBHIVCg6kDufznqOOIixUOma06k69
 ioLVB4SVJi6cniBG9uTw==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to avoid needless #ifdef CONFIG_COMPAT checks,
move the compat_ptr() definition to linux/compat.h
where it can be seen by any file regardless of the
architecture.

Only s390 needs a special definition, this can use the
self-#define trick we have elsewhere.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/include/asm/compat.h   | 17 -----------------
 arch/mips/include/asm/compat.h    | 18 ------------------
 arch/parisc/include/asm/compat.h  | 17 -----------------
 arch/powerpc/include/asm/compat.h | 17 -----------------
 arch/powerpc/oprofile/backtrace.c |  2 +-
 arch/s390/include/asm/compat.h    |  6 +-----
 arch/sparc/include/asm/compat.h   | 17 -----------------
 arch/x86/include/asm/compat.h     | 17 -----------------
 include/linux/compat.h            | 18 ++++++++++++++++++
 9 files changed, 20 insertions(+), 109 deletions(-)

diff --git a/arch/arm64/include/asm/compat.h b/arch/arm64/include/asm/compat.h
index 7b4172ce497c..935d2aa231bf 100644
--- a/arch/arm64/include/asm/compat.h
+++ b/arch/arm64/include/asm/compat.h
@@ -114,23 +114,6 @@ typedef u32		compat_sigset_word;
 
 #define COMPAT_OFF_T_MAX	0x7fffffff
 
-/*
- * A pointer passed in from user mode. This should not
- * be used for syscall parameters, just declare them
- * as pointers because the syscall entry code will have
- * appropriately converted them already.
- */
-
-static inline void __user *compat_ptr(compat_uptr_t uptr)
-{
-	return (void __user *)(unsigned long)uptr;
-}
-
-static inline compat_uptr_t ptr_to_compat(void __user *uptr)
-{
-	return (u32)(unsigned long)uptr;
-}
-
 #define compat_user_stack_pointer() (user_stack_pointer(task_pt_regs(current)))
 #define COMPAT_MINSIGSTKSZ	2048
 
diff --git a/arch/mips/include/asm/compat.h b/arch/mips/include/asm/compat.h
index c99166eadbde..255afcdd79c9 100644
--- a/arch/mips/include/asm/compat.h
+++ b/arch/mips/include/asm/compat.h
@@ -100,24 +100,6 @@ typedef u32		compat_sigset_word;
 
 #define COMPAT_OFF_T_MAX	0x7fffffff
 
-/*
- * A pointer passed in from user mode. This should not
- * be used for syscall parameters, just declare them
- * as pointers because the syscall entry code will have
- * appropriately converted them already.
- */
-
-static inline void __user *compat_ptr(compat_uptr_t uptr)
-{
-	/* cast to a __user pointer via "unsigned long" makes sparse happy */
-	return (void __user *)(unsigned long)(long)uptr;
-}
-
-static inline compat_uptr_t ptr_to_compat(void __user *uptr)
-{
-	return (u32)(unsigned long)uptr;
-}
-
 static inline void __user *arch_compat_alloc_user_space(long len)
 {
 	struct pt_regs *regs = (struct pt_regs *)
diff --git a/arch/parisc/include/asm/compat.h b/arch/parisc/include/asm/compat.h
index e03e3c849f40..2f4f66a3bac0 100644
--- a/arch/parisc/include/asm/compat.h
+++ b/arch/parisc/include/asm/compat.h
@@ -173,23 +173,6 @@ struct compat_shmid64_ds {
 #define COMPAT_ELF_NGREG 80
 typedef compat_ulong_t compat_elf_gregset_t[COMPAT_ELF_NGREG];
 
-/*
- * A pointer passed in from user mode. This should not
- * be used for syscall parameters, just declare them
- * as pointers because the syscall entry code will have
- * appropriately converted them already.
- */
-
-static inline void __user *compat_ptr(compat_uptr_t uptr)
-{
-	return (void __user *)(unsigned long)uptr;
-}
-
-static inline compat_uptr_t ptr_to_compat(void __user *uptr)
-{
-	return (u32)(unsigned long)uptr;
-}
-
 static __inline__ void __user *arch_compat_alloc_user_space(long len)
 {
 	struct pt_regs *regs = &current->thread.regs;
diff --git a/arch/powerpc/include/asm/compat.h b/arch/powerpc/include/asm/compat.h
index 74d0db511099..3e3cdfaa76c6 100644
--- a/arch/powerpc/include/asm/compat.h
+++ b/arch/powerpc/include/asm/compat.h
@@ -96,23 +96,6 @@ typedef u32		compat_sigset_word;
 
 #define COMPAT_OFF_T_MAX	0x7fffffff
 
-/*
- * A pointer passed in from user mode. This should not
- * be used for syscall parameters, just declare them
- * as pointers because the syscall entry code will have
- * appropriately converted them already.
- */
-
-static inline void __user *compat_ptr(compat_uptr_t uptr)
-{
-	return (void __user *)(unsigned long)uptr;
-}
-
-static inline compat_uptr_t ptr_to_compat(void __user *uptr)
-{
-	return (u32)(unsigned long)uptr;
-}
-
 static inline void __user *arch_compat_alloc_user_space(long len)
 {
 	struct pt_regs *regs = current->thread.regs;
diff --git a/arch/powerpc/oprofile/backtrace.c b/arch/powerpc/oprofile/backtrace.c
index 43245f4a9bcb..6ffcb80cf844 100644
--- a/arch/powerpc/oprofile/backtrace.c
+++ b/arch/powerpc/oprofile/backtrace.c
@@ -9,7 +9,7 @@
 #include <linux/sched.h>
 #include <asm/processor.h>
 #include <linux/uaccess.h>
-#include <asm/compat.h>
+#include <linux/compat.h>
 #include <asm/oprofile_impl.h>
 
 #define STACK_SP(STACK)		*(STACK)
diff --git a/arch/s390/include/asm/compat.h b/arch/s390/include/asm/compat.h
index 63b46e30b2c3..9547cd5d6cdc 100644
--- a/arch/s390/include/asm/compat.h
+++ b/arch/s390/include/asm/compat.h
@@ -177,11 +177,7 @@ static inline void __user *compat_ptr(compat_uptr_t uptr)
 {
 	return (void __user *)(unsigned long)(uptr & 0x7fffffffUL);
 }
-
-static inline compat_uptr_t ptr_to_compat(void __user *uptr)
-{
-	return (u32)(unsigned long)uptr;
-}
+#define compat_ptr(uptr) compat_ptr(uptr)
 
 #ifdef CONFIG_COMPAT
 
diff --git a/arch/sparc/include/asm/compat.h b/arch/sparc/include/asm/compat.h
index 30b1763580b1..40a267b3bd52 100644
--- a/arch/sparc/include/asm/compat.h
+++ b/arch/sparc/include/asm/compat.h
@@ -125,23 +125,6 @@ typedef u32		compat_sigset_word;
 
 #define COMPAT_OFF_T_MAX	0x7fffffff
 
-/*
- * A pointer passed in from user mode. This should not
- * be used for syscall parameters, just declare them
- * as pointers because the syscall entry code will have
- * appropriately converted them already.
- */
-
-static inline void __user *compat_ptr(compat_uptr_t uptr)
-{
-	return (void __user *)(unsigned long)uptr;
-}
-
-static inline compat_uptr_t ptr_to_compat(void __user *uptr)
-{
-	return (u32)(unsigned long)uptr;
-}
-
 #ifdef CONFIG_COMPAT
 static inline void __user *arch_compat_alloc_user_space(long len)
 {
diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.h
index 22c4dfe65992..52e9f3480f69 100644
--- a/arch/x86/include/asm/compat.h
+++ b/arch/x86/include/asm/compat.h
@@ -177,23 +177,6 @@ typedef struct user_regs_struct compat_elf_gregset_t;
 	(!!(task_pt_regs(current)->orig_ax & __X32_SYSCALL_BIT))
 #endif
 
-/*
- * A pointer passed in from user mode. This should not
- * be used for syscall parameters, just declare them
- * as pointers because the syscall entry code will have
- * appropriately converted them already.
- */
-
-static inline void __user *compat_ptr(compat_uptr_t uptr)
-{
-	return (void __user *)(unsigned long)uptr;
-}
-
-static inline compat_uptr_t ptr_to_compat(void __user *uptr)
-{
-	return (u32)(unsigned long)uptr;
-}
-
 static inline void __user *arch_compat_alloc_user_space(long len)
 {
 	compat_uptr_t sp;
diff --git a/include/linux/compat.h b/include/linux/compat.h
index 68f79d855c3d..11083d84eb23 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -958,4 +958,22 @@ static inline bool in_compat_syscall(void) { return false; }
 
 #endif /* CONFIG_COMPAT */
 
+/*
+ * A pointer passed in from user mode. This should not
+ * be used for syscall parameters, just declare them
+ * as pointers because the syscall entry code will have
+ * appropriately converted them already.
+ */
+#ifndef compat_ptr
+static inline void __user *compat_ptr(compat_uptr_t uptr)
+{
+	return (void __user *)(unsigned long)uptr;
+}
+#endif
+
+static inline compat_uptr_t ptr_to_compat(void __user *uptr)
+{
+	return (u32)(unsigned long)uptr;
+}
+
 #endif /* _LINUX_COMPAT_H */
-- 
2.20.0

