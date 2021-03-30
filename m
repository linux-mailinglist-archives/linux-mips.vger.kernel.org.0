Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15AAE34EF6B
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbhC3R1O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:27:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:38446 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232422AbhC3R1I (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Mar 2021 13:27:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id AD0F7B329;
        Tue, 30 Mar 2021 17:27:06 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     hch@lst.de
Subject: [PATCH 3/3] MIPS: Remove get_fs/set_fs
Date:   Tue, 30 Mar 2021 19:27:00 +0200
Message-Id: <20210330172702.146909-4-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330172702.146909-1-tsbogend@alpha.franken.de>
References: <20210330172702.146909-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

All get_fs/set_fs calls in MIPS code are gone, so remove implementation
of it.  With the clear separation of user/kernel space access we no
longer need the EVA special handling, so get rid of that, too.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/Kconfig                   |   1 -
 arch/mips/include/asm/processor.h   |   4 -
 arch/mips/include/asm/thread_info.h |   6 -
 arch/mips/include/asm/uaccess.h     | 197 +++++++---------------------
 arch/mips/kernel/asm-offsets.c      |   1 -
 arch/mips/kernel/process.c          |   2 -
 arch/mips/kernel/scall32-o32.S      |   4 +-
 arch/mips/lib/memset.S              |   3 -
 arch/mips/lib/strncpy_user.S        |  48 ++-----
 arch/mips/lib/strnlen_user.S        |  44 ++-----
 10 files changed, 75 insertions(+), 235 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index b72458215d20..70faa0686444 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -93,7 +93,6 @@ config MIPS
 	select PERF_USE_VMALLOC
 	select PCI_MSI_ARCH_FALLBACKS if PCI_MSI
 	select RTC_LIB
-	select SET_FS
 	select SYSCTL_EXCEPTION_TRACE
 	select VIRT_TO_BUS
 	select ARCH_HAS_ELFCORE_COMPAT
diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
index 8e69e0a35ee9..0c3550c82b72 100644
--- a/arch/mips/include/asm/processor.h
+++ b/arch/mips/include/asm/processor.h
@@ -221,10 +221,6 @@ struct nlm_cop2_state {
 #define COP2_INIT
 #endif
 
-typedef struct {
-	unsigned long seg;
-} mm_segment_t;
-
 #ifdef CONFIG_CPU_HAS_MSA
 # define ARCH_MIN_TASKALIGN	16
 # define FPU_ALIGN		__aligned(16)
diff --git a/arch/mips/include/asm/thread_info.h b/arch/mips/include/asm/thread_info.h
index e2c352da3877..0b17aaa9e012 100644
--- a/arch/mips/include/asm/thread_info.h
+++ b/arch/mips/include/asm/thread_info.h
@@ -28,11 +28,6 @@ struct thread_info {
 	unsigned long		tp_value;	/* thread pointer */
 	__u32			cpu;		/* current CPU */
 	int			preempt_count;	/* 0 => preemptable, <0 => BUG */
-	mm_segment_t		addr_limit;	/*
-						 * thread address space limit:
-						 * 0x7fffffff for user-thead
-						 * 0xffffffff for kernel-thread
-						 */
 	struct pt_regs		*regs;
 	long			syscall;	/* syscall number */
 };
@@ -46,7 +41,6 @@ struct thread_info {
 	.flags		= _TIF_FIXADE,		\
 	.cpu		= 0,			\
 	.preempt_count	= INIT_PREEMPT_COUNT,	\
-	.addr_limit	= KERNEL_DS,		\
 }
 
 /*
diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index 8b3a4b992ebc..5b1fd2e97f57 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -16,13 +16,6 @@
 #include <asm/asm-eva.h>
 #include <asm/extable.h>
 
-/*
- * The fs value determines whether argument validity checking should be
- * performed or not.  If get_fs() == USER_DS, checking is performed, with
- * get_fs() == KERNEL_DS, checking is bypassed.
- *
- * For historical reasons, these macros are grossly misnamed.
- */
 #ifdef CONFIG_32BIT
 
 #define __UA_LIMIT 0x80000000UL
@@ -49,38 +42,6 @@ extern u64 __ua_limit;
 
 #endif /* CONFIG_64BIT */
 
-/*
- * USER_DS is a bitmask that has the bits set that may not be set in a valid
- * userspace address.  Note that we limit 32-bit userspace to 0x7fff8000 but
- * the arithmetic we're doing only works if the limit is a power of two, so
- * we use 0x80000000 here on 32-bit kernels.  If a process passes an invalid
- * address in this range it's the process's problem, not ours :-)
- */
-
-#define KERNEL_DS	((mm_segment_t) { 0UL })
-#define USER_DS		((mm_segment_t) { __UA_LIMIT })
-
-#define get_fs()	(current_thread_info()->addr_limit)
-#define set_fs(x)	(current_thread_info()->addr_limit = (x))
-
-#define uaccess_kernel()	(get_fs().seg == KERNEL_DS.seg)
-
-/*
- * eva_kernel_access() - determine whether kernel memory access on an EVA system
- *
- * Determines whether memory accesses should be performed to kernel memory
- * on a system using Extended Virtual Addressing (EVA).
- *
- * Return: true if a kernel memory access on an EVA system, else false.
- */
-static inline bool eva_kernel_access(void)
-{
-	if (!IS_ENABLED(CONFIG_EVA))
-		return false;
-
-	return uaccess_kernel();
-}
-
 /*
  * Is a address valid? This does a straightforward calculation rather
  * than tests.
@@ -118,7 +79,7 @@ static inline bool eva_kernel_access(void)
 static inline int __access_ok(const void __user *p, unsigned long size)
 {
 	unsigned long addr = (unsigned long)p;
-	return (get_fs().seg & (addr | (addr + size) | __ua_size(size))) == 0;
+	return (__UA_LIMIT & (addr | (addr + size) | __ua_size(size))) == 0;
 }
 
 #define access_ok(addr, size)					\
@@ -276,12 +237,9 @@ do {									\
 ({									\
 	int __gu_err;							\
 									\
-	if (eva_kernel_access()) {					\
-		__get_kernel_common((x), size, ptr);			\
-	} else {							\
-		__chk_user_ptr(ptr);					\
-		__get_user_common((x), size, ptr);			\
-	}								\
+	__chk_user_ptr(ptr);						\
+	__get_user_common((x), size, ptr);				\
+									\
 	__gu_err;							\
 })
 
@@ -291,11 +249,8 @@ do {									\
 	const __typeof__(*(ptr)) __user * __gu_ptr = (ptr);		\
 									\
 	might_fault();							\
-	if (likely(access_ok( __gu_ptr, size))) {		\
-		if (eva_kernel_access())				\
-			__get_kernel_common((x), size, __gu_ptr);	\
-		else							\
-			__get_user_common((x), size, __gu_ptr);		\
+	if (likely(access_ok(__gu_ptr, size))) {			\
+		__get_user_common((x), size, __gu_ptr);			\
 	} else								\
 		(x) = 0;						\
 									\
@@ -452,12 +407,9 @@ do {									\
 	int __pu_err = 0;						\
 									\
 	__pu_val = (x);							\
-	if (eva_kernel_access()) {					\
-		__put_kernel_common(ptr, size);				\
-	} else {							\
-		__chk_user_ptr(ptr);					\
-		__put_user_common(ptr, size);				\
-	}								\
+	__chk_user_ptr(ptr);						\
+	__put_user_common(ptr, size);					\
+									\
 	__pu_err;							\
 })
 
@@ -468,11 +420,8 @@ do {									\
 	int __pu_err = -EFAULT;						\
 									\
 	might_fault();							\
-	if (likely(access_ok( __pu_addr, size))) {	\
-		if (eva_kernel_access())				\
-			__put_kernel_common(__pu_addr, size);		\
-		else							\
-			__put_user_common(__pu_addr, size);		\
+	if (likely(access_ok(__pu_addr, size))) {			\
+		__put_user_common(__pu_addr, size);			\
 	}								\
 									\
 	__pu_err;							\
@@ -595,15 +544,6 @@ extern size_t __copy_user(void *__to, const void *__from, size_t __n);
 	__cu_len_r;							\
 })
 
-#define __invoke_copy_from_kernel(to, from, n)				\
-	__invoke_copy_from(__copy_user, to, from, n)
-
-#define __invoke_copy_to_kernel(to, from, n)				\
-	__invoke_copy_to(__copy_user, to, from, n)
-
-#define ___invoke_copy_in_kernel(to, from, n)				\
-	__invoke_copy_from(__copy_user, to, from, n)
-
 #ifndef CONFIG_EVA
 #define __invoke_copy_from_user(to, from, n)				\
 	__invoke_copy_from(__copy_user, to, from, n)
@@ -642,19 +582,13 @@ extern size_t __copy_in_user_eva(void *__to, const void *__from, size_t __n);
 static inline unsigned long
 raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
-	if (eva_kernel_access())
-		return __invoke_copy_to_kernel(to, from, n);
-	else
-		return __invoke_copy_to_user(to, from, n);
+	return __invoke_copy_to_user(to, from, n);
 }
 
 static inline unsigned long
 raw_copy_from_user(void *to, const void __user *from, unsigned long n)
 {
-	if (eva_kernel_access())
-		return __invoke_copy_from_kernel(to, from, n);
-	else
-		return __invoke_copy_from_user(to, from, n);
+	return __invoke_copy_from_user(to, from, n);
 }
 
 #define INLINE_COPY_FROM_USER
@@ -663,13 +597,9 @@ raw_copy_from_user(void *to, const void __user *from, unsigned long n)
 static inline unsigned long
 raw_copy_in_user(void __user*to, const void __user *from, unsigned long n)
 {
-	if (eva_kernel_access())
-		return ___invoke_copy_in_kernel(to, from, n);
-	else
-		return ___invoke_copy_in_user(to, from,	n);
+	return ___invoke_copy_in_user(to, from,	n);
 }
 
-extern __kernel_size_t __bzero_kernel(void __user *addr, __kernel_size_t size);
 extern __kernel_size_t __bzero(void __user *addr, __kernel_size_t size);
 
 /*
@@ -695,28 +625,16 @@ __clear_user(void __user *addr, __kernel_size_t size)
 #define bzero_clobbers "$4", "$5", "$6", __UA_t0, __UA_t1, "$31"
 #endif /* CONFIG_CPU_MICROMIPS */
 
-	if (eva_kernel_access()) {
-		__asm__ __volatile__(
-			"move\t$4, %1\n\t"
-			"move\t$5, $0\n\t"
-			"move\t$6, %2\n\t"
-			__MODULE_JAL(__bzero_kernel)
-			"move\t%0, $6"
-			: "=r" (res)
-			: "r" (addr), "r" (size)
-			: bzero_clobbers);
-	} else {
-		might_fault();
-		__asm__ __volatile__(
-			"move\t$4, %1\n\t"
-			"move\t$5, $0\n\t"
-			"move\t$6, %2\n\t"
-			__MODULE_JAL(__bzero)
-			"move\t%0, $6"
-			: "=r" (res)
-			: "r" (addr), "r" (size)
-			: bzero_clobbers);
-	}
+	might_fault();
+	__asm__ __volatile__(
+		"move\t$4, %1\n\t"
+		"move\t$5, $0\n\t"
+		"move\t$6, %2\n\t"
+		__MODULE_JAL(__bzero)
+		"move\t%0, $6"
+		: "=r" (res)
+		: "r" (addr), "r" (size)
+		: bzero_clobbers);
 
 	return res;
 }
@@ -730,7 +648,6 @@ __clear_user(void __user *addr, __kernel_size_t size)
 	__cl_size;							\
 })
 
-extern long __strncpy_from_kernel_asm(char *__to, const char __user *__from, long __len);
 extern long __strncpy_from_user_asm(char *__to, const char __user *__from, long __len);
 
 /*
@@ -756,33 +673,23 @@ strncpy_from_user(char *__to, const char __user *__from, long __len)
 {
 	long res;
 
-	if (eva_kernel_access()) {
-		__asm__ __volatile__(
-			"move\t$4, %1\n\t"
-			"move\t$5, %2\n\t"
-			"move\t$6, %3\n\t"
-			__MODULE_JAL(__strncpy_from_kernel_asm)
-			"move\t%0, $2"
-			: "=r" (res)
-			: "r" (__to), "r" (__from), "r" (__len)
-			: "$2", "$3", "$4", "$5", "$6", __UA_t0, "$31", "memory");
-	} else {
-		might_fault();
-		__asm__ __volatile__(
-			"move\t$4, %1\n\t"
-			"move\t$5, %2\n\t"
-			"move\t$6, %3\n\t"
-			__MODULE_JAL(__strncpy_from_user_asm)
-			"move\t%0, $2"
-			: "=r" (res)
-			: "r" (__to), "r" (__from), "r" (__len)
-			: "$2", "$3", "$4", "$5", "$6", __UA_t0, "$31", "memory");
-	}
+	if (!access_ok(__from, __len))
+		return -EFAULT;
+
+	might_fault();
+	__asm__ __volatile__(
+		"move\t$4, %1\n\t"
+		"move\t$5, %2\n\t"
+		"move\t$6, %3\n\t"
+		__MODULE_JAL(__strncpy_from_user_asm)
+		"move\t%0, $2"
+		: "=r" (res)
+		: "r" (__to), "r" (__from), "r" (__len)
+		: "$2", "$3", "$4", "$5", "$6", __UA_t0, "$31", "memory");
 
 	return res;
 }
 
-extern long __strnlen_kernel_asm(const char __user *s, long n);
 extern long __strnlen_user_asm(const char __user *s, long n);
 
 /*
@@ -802,26 +709,18 @@ static inline long strnlen_user(const char __user *s, long n)
 {
 	long res;
 
+	if (!access_ok(s, n))
+		return -0;
+
 	might_fault();
-	if (eva_kernel_access()) {
-		__asm__ __volatile__(
-			"move\t$4, %1\n\t"
-			"move\t$5, %2\n\t"
-			__MODULE_JAL(__strnlen_kernel_asm)
-			"move\t%0, $2"
-			: "=r" (res)
-			: "r" (s), "r" (n)
-			: "$2", "$4", "$5", __UA_t0, "$31");
-	} else {
-		__asm__ __volatile__(
-			"move\t$4, %1\n\t"
-			"move\t$5, %2\n\t"
-			__MODULE_JAL(__strnlen_user_asm)
-			"move\t%0, $2"
-			: "=r" (res)
-			: "r" (s), "r" (n)
-			: "$2", "$4", "$5", __UA_t0, "$31");
-	}
+	__asm__ __volatile__(
+		"move\t$4, %1\n\t"
+		"move\t$5, %2\n\t"
+		__MODULE_JAL(__strnlen_user_asm)
+		"move\t%0, $2"
+		: "=r" (res)
+		: "r" (s), "r" (n)
+		: "$2", "$4", "$5", __UA_t0, "$31");
 
 	return res;
 }
diff --git a/arch/mips/kernel/asm-offsets.c b/arch/mips/kernel/asm-offsets.c
index aebfda81120a..5735b2cd6f2a 100644
--- a/arch/mips/kernel/asm-offsets.c
+++ b/arch/mips/kernel/asm-offsets.c
@@ -98,7 +98,6 @@ void output_thread_info_defines(void)
 	OFFSET(TI_TP_VALUE, thread_info, tp_value);
 	OFFSET(TI_CPU, thread_info, cpu);
 	OFFSET(TI_PRE_COUNT, thread_info, preempt_count);
-	OFFSET(TI_ADDR_LIMIT, thread_info, addr_limit);
 	OFFSET(TI_REGS, thread_info, regs);
 	DEFINE(_THREAD_SIZE, THREAD_SIZE);
 	DEFINE(_THREAD_MASK, THREAD_MASK);
diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 7efa0d1a4c2b..bff080db0294 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -124,7 +124,6 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 		/* kernel thread */
 		unsigned long status = p->thread.cp0_status;
 		memset(childregs, 0, sizeof(struct pt_regs));
-		ti->addr_limit = KERNEL_DS;
 		p->thread.reg16 = usp; /* fn */
 		p->thread.reg17 = kthread_arg;
 		p->thread.reg29 = childksp;
@@ -145,7 +144,6 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 	childregs->regs[2] = 0; /* Child gets zero as return value */
 	if (usp)
 		childregs->regs[29] = usp;
-	ti->addr_limit = USER_DS;
 
 	p->thread.reg29 = (unsigned long) childregs;
 	p->thread.reg31 = (unsigned long) ret_from_fork;
diff --git a/arch/mips/kernel/scall32-o32.S b/arch/mips/kernel/scall32-o32.S
index 84e8624e83a2..b1b2e106f711 100644
--- a/arch/mips/kernel/scall32-o32.S
+++ b/arch/mips/kernel/scall32-o32.S
@@ -48,10 +48,8 @@ NESTED(handle_sys, PT_SIZE, sp)
 	 * We intentionally keep the kernel stack a little below the top of
 	 * userspace so we don't have to do a slower byte accurate check here.
 	 */
-	lw	t5, TI_ADDR_LIMIT($28)
 	addu	t4, t0, 32
-	and	t5, t4
-	bltz	t5, bad_stack		# -> sp is bad
+	bltz	t4, bad_stack		# -> sp is bad
 
 	/*
 	 * Ok, copy the args from the luser stack to the kernel stack.
diff --git a/arch/mips/lib/memset.S b/arch/mips/lib/memset.S
index d5449e8a3dfc..b0baa3c79fad 100644
--- a/arch/mips/lib/memset.S
+++ b/arch/mips/lib/memset.S
@@ -314,9 +314,6 @@ EXPORT_SYMBOL(memset)
 #ifndef CONFIG_EVA
 FEXPORT(__bzero)
 EXPORT_SYMBOL(__bzero)
-#else
-FEXPORT(__bzero_kernel)
-EXPORT_SYMBOL(__bzero_kernel)
 #endif
 	__BUILD_BZERO LEGACY_MODE
 
diff --git a/arch/mips/lib/strncpy_user.S b/arch/mips/lib/strncpy_user.S
index acdff66bd5d2..556acf684d7b 100644
--- a/arch/mips/lib/strncpy_user.S
+++ b/arch/mips/lib/strncpy_user.S
@@ -29,19 +29,17 @@
  * it happens at most some bytes of the exceptions handlers will be copied.
  */
 
-	.macro __BUILD_STRNCPY_ASM func
-LEAF(__strncpy_from_\func\()_asm)
-	LONG_L		v0, TI_ADDR_LIMIT($28)	# pointer ok?
-	and		v0, a1
-	bnez		v0, .Lfault\@
-
+LEAF(__strncpy_from_user_asm)
 	move		t0, zero
 	move		v1, a1
-.ifeqs "\func","kernel"
-1:	EX(lbu, v0, (v1), .Lfault\@)
-.else
-1:	EX(lbue, v0, (v1), .Lfault\@)
-.endif
+#ifdef CONFIG_EVA
+	.set push
+	.set eva
+1:	EX(lbue, v0, (v1), .Lfault)
+	.set pop
+#else
+1:	EX(lbu, v0, (v1), .Lfault)
+#endif
 	PTR_ADDIU	v1, 1
 	R10KCBARRIER(0(ra))
 	sb		v0, (a0)
@@ -51,35 +49,17 @@ LEAF(__strncpy_from_\func\()_asm)
 	bne		t0, a2, 1b
 2:	PTR_ADDU	v0, a1, t0
 	xor		v0, a1
-	bltz		v0, .Lfault\@
+	bltz		v0, .Lfault
 	move		v0, t0
 	jr		ra			# return n
-	END(__strncpy_from_\func\()_asm)
+	END(__strncpy_from_user_asm)
 
-.Lfault\@:
+.Lfault:
 	li		v0, -EFAULT
 	jr		ra
 
 	.section	__ex_table,"a"
-	PTR		1b, .Lfault\@
+	PTR		1b, .Lfault
 	.previous
 
-	.endm
-
-#ifndef CONFIG_EVA
-	/* Set aliases */
-	.global __strncpy_from_user_asm
-	.set __strncpy_from_user_asm, __strncpy_from_kernel_asm
-EXPORT_SYMBOL(__strncpy_from_user_asm)
-#endif
-
-__BUILD_STRNCPY_ASM kernel
-EXPORT_SYMBOL(__strncpy_from_kernel_asm)
-
-#ifdef CONFIG_EVA
-	.set push
-	.set eva
-__BUILD_STRNCPY_ASM user
-	.set pop
-EXPORT_SYMBOL(__strncpy_from_user_asm)
-#endif
+	EXPORT_SYMBOL(__strncpy_from_user_asm)
diff --git a/arch/mips/lib/strnlen_user.S b/arch/mips/lib/strnlen_user.S
index e1bacf5a3abe..92b63f20ec05 100644
--- a/arch/mips/lib/strnlen_user.S
+++ b/arch/mips/lib/strnlen_user.S
@@ -26,12 +26,7 @@
  *	 bytes.	 There's nothing secret there.	On 64-bit accessing beyond
  *	 the maximum is a tad hairier ...
  */
-	.macro __BUILD_STRNLEN_ASM func
-LEAF(__strnlen_\func\()_asm)
-	LONG_L		v0, TI_ADDR_LIMIT($28)	# pointer ok?
-	and		v0, a0
-	bnez		v0, .Lfault\@
-
+LEAF(__strnlen_user_asm)
 	move		v0, a0
 	PTR_ADDU	a1, a0			# stop pointer
 1:
@@ -40,11 +35,14 @@ LEAF(__strnlen_\func\()_asm)
 	li		AT, 1
 #endif
 	beq		v0, a1, 1f		# limit reached?
-.ifeqs "\func", "kernel"
-	EX(lb, t0, (v0), .Lfault\@)
-.else
-	EX(lbe, t0, (v0), .Lfault\@)
-.endif
+#ifdef CONFIG_EVA
+	.set push
+	.set eva
+	EX(lbe, t0, (v0), .Lfault)
+	.set pop
+#else
+	EX(lb, t0, (v0), .Lfault)
+#endif
 	.set		noreorder
 	bnez		t0, 1b
 1:
@@ -57,28 +55,10 @@ LEAF(__strnlen_\func\()_asm)
 	.set		reorder
 	PTR_SUBU	v0, a0
 	jr		ra
-	END(__strnlen_\func\()_asm)
+	END(__strnlen_user_asm)
 
-.Lfault\@:
+.Lfault:
 	move		v0, zero
 	jr		ra
-	.endm
-
-#ifndef CONFIG_EVA
-	/* Set aliases */
-	.global __strnlen_user_asm
-	.set __strnlen_user_asm, __strnlen_kernel_asm
-EXPORT_SYMBOL(__strnlen_user_asm)
-#endif
-
-__BUILD_STRNLEN_ASM kernel
-EXPORT_SYMBOL(__strnlen_kernel_asm)
-
-#ifdef CONFIG_EVA
 
-	.set push
-	.set eva
-__BUILD_STRNLEN_ASM user
-	.set pop
-EXPORT_SYMBOL(__strnlen_user_asm)
-#endif
+	EXPORT_SYMBOL(__strnlen_user_asm)
-- 
2.29.2

