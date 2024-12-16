Return-Path: <linux-mips+bounces-7038-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 214149F3296
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 15:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 166B618806A2
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 14:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7842080DF;
	Mon, 16 Dec 2024 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U17/Z/1i";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Mk9p4hNC"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7122F207A16;
	Mon, 16 Dec 2024 14:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734358259; cv=none; b=aCQedBpUEcsA1hIl/dXFel/4SPpYhBR0P0a5cEenpkYTiio1IBqju8kQFlBFjd9wfBtuVWUkOgPZi9edX2ctCmd4XMDHLOFXeGQSepizo/ntrBVfC06CNFU0ysR8xrkKi67mUvlx44AjmSR+3F4Z6yqN9VrjzwfFhpwb3xiy0Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734358259; c=relaxed/simple;
	bh=v4FctAZNEfnnWA4sDuFiNUT/fL9G5rt3TAlXOaavBjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZxSVACUjL+04+u4yT44tyw1QRXaRkgr4ldVzIaOlAE/D2uXNo1S++VdYN6Fc56Rd10ZHY2S+bvTuio6vNTSeQAjHDE7JR02f6l1EUG1Vbb+RV3hSpwmKS5cOY54rMCvX+6piwUJUgkO5aQB6eEsksMgw3LfjvUQaAM/eo2E/b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U17/Z/1i; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Mk9p4hNC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734358254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJv7qaahFJspiEJs4AW1r7L7VUHR6VDXBvBthZWpWhk=;
	b=U17/Z/1icHVLqvgLkXTTlFnX1BDRhkEkEtPWMQtdrnK+dLz8GskpUjzD2C8KQDra/Sy4nH
	vYYF6ugAM53CRcbQULuhSWGozlucgM8Cg9axRH6RD/ll0BfXZGU5NNT0Z9ucLQptmQFNTP
	dtrjfG2TeiIx6cTojEvRAcJkeDTkKXwkr0C2r8KEyuZcnJ1Z0QYQT2CBZXPuAvay8ScHRy
	ahvPFcVKRn3E6QrECMg1VlCE4QbW5Ss31thuuDdGHxhI+YCj1CMkB+5Hr3Wqjlm9Cs6l9m
	vGZVW8Mud6oIcHxbWRBGdgwUwCm6j9y9qxONxRl4zA9bzNhtcbpMhTzjus35FQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734358254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJv7qaahFJspiEJs4AW1r7L7VUHR6VDXBvBthZWpWhk=;
	b=Mk9p4hNCY4qtkSKN9xI+c4Bae5N53Gx8M+HIEWtNddER4u1hkvABLiCnjC0kW3VrXwxiV3
	DsUOsNA4t9vxUNBg==
Date: Mon, 16 Dec 2024 15:10:02 +0100
Subject: [PATCH 06/17] arm64: vdso: Switch to generic storage
 implementation
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-vdso-store-rng-v1-6-f7aed1bdb3b2@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
In-Reply-To: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734358247; l=14097;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=v4FctAZNEfnnWA4sDuFiNUT/fL9G5rt3TAlXOaavBjo=;
 b=cEXPqWPiGBRGHo3aaM69MQk3/KgN/g5f8ehC2n9EZqRYzTYYtMHdxK9oeuLQO+mdsXzMiAD/n
 GaBw2138gq1Dy6kxKMLKFqP41jTx0E519D+/ZV7F0L2ZOVYABP/YFBo
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The generic storage implementation provides the same features as the
custom one. However it can be shared between architectures, making
maintenance easier.

This switch also moves the random state data out of the time data page.
The currently used hardcoded __VDSO_RND_DATA_OFFSET does not take into
account changes to the time data page layout.

Co-developed-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/Kconfig                                |  1 +
 arch/arm64/include/asm/vdso.h                     |  2 +-
 arch/arm64/include/asm/vdso/compat_gettimeofday.h | 32 ++++----
 arch/arm64/include/asm/vdso/getrandom.h           | 12 ---
 arch/arm64/include/asm/vdso/gettimeofday.h        | 16 +---
 arch/arm64/include/asm/vdso/vsyscall.h            | 25 +------
 arch/arm64/kernel/vdso.c                          | 90 ++---------------------
 arch/arm64/kernel/vdso/vdso.lds.S                 |  7 +-
 arch/arm64/kernel/vdso32/vdso.lds.S               |  7 +-
 9 files changed, 31 insertions(+), 161 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 100570a048c5e8892c0112704f9ca74c4fc55b27..1a4a78ec593328d6e6bceacc1abb0821eab988ca 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -159,6 +159,7 @@ config ARM64
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
 	select GENERIC_GETTIMEOFDAY
+	select GENERIC_VDSO_DATA_STORE
 	select GENERIC_VDSO_TIME_NS
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT
diff --git a/arch/arm64/include/asm/vdso.h b/arch/arm64/include/asm/vdso.h
index 3e3c3fdb184274abd20647335b19e81e709506db..61679070f595cd25fb2f516b5b077599a9570689 100644
--- a/arch/arm64/include/asm/vdso.h
+++ b/arch/arm64/include/asm/vdso.h
@@ -5,7 +5,7 @@
 #ifndef __ASM_VDSO_H
 #define __ASM_VDSO_H
 
-#define __VVAR_PAGES    2
+#define __VDSO_PAGES    4
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/arm64/include/asm/vdso/compat_gettimeofday.h b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
index 778c1202bbbf9f5db6bfced62a833d50e1675b08..a386bba3efa794e6f3f0018c85531dd7e708ff86 100644
--- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
@@ -104,7 +104,7 @@ int clock_getres32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
 }
 
 static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
-						 const struct vdso_data *vd)
+						 const struct vdso_time_data *vd)
 {
 	u64 res;
 
@@ -131,43 +131,45 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 	return res;
 }
 
-static __always_inline const struct vdso_data *__arch_get_vdso_data(void)
+static __always_inline const struct vdso_time_data *__aarch64_get_vdso_u_time_data(void)
 {
-	const struct vdso_data *ret;
+	const struct vdso_time_data *ret;
 
 	/*
-	 * This simply puts &_vdso_data into ret. The reason why we don't use
-	 * `ret = _vdso_data` is that the compiler tends to optimise this in a
-	 * very suboptimal way: instead of keeping &_vdso_data in a register,
-	 * it goes through a relocation almost every time _vdso_data must be
+	 * This simply puts &_vdso_time_data into ret. The reason why we don't use
+	 * `ret = _vdso_time_data` is that the compiler tends to optimise this in a
+	 * very suboptimal way: instead of keeping &_vdso_time_data in a register,
+	 * it goes through a relocation almost every time _vdso_time_data must be
 	 * accessed (even in subfunctions). This is both time and space
 	 * consuming: each relocation uses a word in the code section, and it
 	 * has to be loaded at runtime.
 	 *
 	 * This trick hides the assignment from the compiler. Since it cannot
 	 * track where the pointer comes from, it will only use one relocation
-	 * where __arch_get_vdso_data() is called, and then keep the result in
-	 * a register.
+	 * where __aarch64_get_vdso_u_time_data() is called, and then keep the
+	 * result in a register.
 	 */
-	asm volatile("mov %0, %1" : "=r"(ret) : "r"(_vdso_data));
+	asm volatile("mov %0, %1" : "=r"(ret) : "r"(vdso_u_time_data));
 
 	return ret;
 }
+#define __arch_get_vdso_u_time_data __aarch64_get_vdso_u_time_data
 
 #ifdef CONFIG_TIME_NS
 static __always_inline
-const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data *vd)
+const struct vdso_time_data *__aarch64_get_vdso_u_timens_data(void)
 {
-	const struct vdso_data *ret;
+	const struct vdso_time_data *ret;
 
-	/* See __arch_get_vdso_data(). */
-	asm volatile("mov %0, %1" : "=r"(ret) : "r"(_timens_data));
+	/* See __aarch64_get_vdso_u_time_data(). */
+	asm volatile("mov %0, %1" : "=r"(ret) : "r"(vdso_u_timens_data));
 
 	return ret;
 }
+#define __arch_get_vdso_u_timens_data __aarch64_get_vdso_u_timens_data
 #endif
 
-static inline bool vdso_clocksource_ok(const struct vdso_data *vd)
+static inline bool vdso_clocksource_ok(const struct vdso_time_data *vd)
 {
 	return vd->clock_mode == VDSO_CLOCKMODE_ARCHTIMER;
 }
diff --git a/arch/arm64/include/asm/vdso/getrandom.h b/arch/arm64/include/asm/vdso/getrandom.h
index 342f807e204442c95cb9e9a849da38effbe50334..a2197da1951b021baff4eb08b3f1c314df2f5f23 100644
--- a/arch/arm64/include/asm/vdso/getrandom.h
+++ b/arch/arm64/include/asm/vdso/getrandom.h
@@ -33,18 +33,6 @@ static __always_inline ssize_t getrandom_syscall(void *_buffer, size_t _len, uns
 	return ret;
 }
 
-static __always_inline const struct vdso_rng_data *__arch_get_vdso_rng_data(void)
-{
-	/*
-	 * The RNG data is in the real VVAR data page, but if a task belongs to a time namespace
-	 * then VVAR_DATA_PAGE_OFFSET points to the namespace-specific VVAR page and VVAR_TIMENS_
-	 * PAGE_OFFSET points to the real VVAR page.
-	 */
-	if (IS_ENABLED(CONFIG_TIME_NS) && _vdso_data->clock_mode == VDSO_CLOCKMODE_TIMENS)
-		return (void *)&_vdso_rng_data + VVAR_TIMENS_PAGE_OFFSET * (1UL << CONFIG_PAGE_SHIFT);
-	return &_vdso_rng_data;
-}
-
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_VDSO_GETRANDOM_H */
diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
index 764d13e2916c559bc8fd7efa032b6f468ac0d4a2..92a2b59a9f3df4d20feb483e6d8ebd1d813b7932 100644
--- a/arch/arm64/include/asm/vdso/gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/gettimeofday.h
@@ -67,7 +67,7 @@ int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
 }
 
 static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
-						 const struct vdso_data *vd)
+						 const struct vdso_time_data *vd)
 {
 	u64 res;
 
@@ -99,20 +99,6 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 	return res;
 }
 
-static __always_inline
-const struct vdso_data *__arch_get_vdso_data(void)
-{
-	return _vdso_data;
-}
-
-#ifdef CONFIG_TIME_NS
-static __always_inline
-const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data *vd)
-{
-	return _timens_data;
-}
-#endif
-
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_VDSO_GETTIMEOFDAY_H */
diff --git a/arch/arm64/include/asm/vdso/vsyscall.h b/arch/arm64/include/asm/vdso/vsyscall.h
index eea51946d45a2f8c7eebfff971d74878be53a798..3f65cbd00635aab50a4e0c6058d38b39fd6d43a9 100644
--- a/arch/arm64/include/asm/vdso/vsyscall.h
+++ b/arch/arm64/include/asm/vdso/vsyscall.h
@@ -2,41 +2,18 @@
 #ifndef __ASM_VDSO_VSYSCALL_H
 #define __ASM_VDSO_VSYSCALL_H
 
-#define __VDSO_RND_DATA_OFFSET  480
-
 #ifndef __ASSEMBLY__
 
 #include <vdso/datapage.h>
 
-enum vvar_pages {
-	VVAR_DATA_PAGE_OFFSET,
-	VVAR_TIMENS_PAGE_OFFSET,
-	VVAR_NR_PAGES,
-};
-
 #define VDSO_PRECISION_MASK	~(0xFF00ULL<<48)
 
-extern struct vdso_data *vdso_data;
 
 /*
  * Update the vDSO data page to keep in sync with kernel timekeeping.
  */
 static __always_inline
-struct vdso_data *__arm64_get_k_vdso_data(void)
-{
-	return vdso_data;
-}
-#define __arch_get_k_vdso_data __arm64_get_k_vdso_data
-
-static __always_inline
-struct vdso_rng_data *__arm64_get_k_vdso_rnd_data(void)
-{
-	return (void *)vdso_data + __VDSO_RND_DATA_OFFSET;
-}
-#define __arch_get_k_vdso_rng_data __arm64_get_k_vdso_rnd_data
-
-static __always_inline
-void __arm64_update_vsyscall(struct vdso_data *vdata)
+void __arm64_update_vsyscall(struct vdso_time_data *vdata)
 {
 	vdata[CS_HRES_COARSE].mask	= VDSO_PRECISION_MASK;
 	vdata[CS_RAW].mask		= VDSO_PRECISION_MASK;
diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index e8ed8e5b713b525abac828b1a17ab9e6d974a3e9..887ac0b05961eb83afe649a0afcaf7deda4b186b 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -18,7 +18,7 @@
 #include <linux/sched.h>
 #include <linux/signal.h>
 #include <linux/slab.h>
-#include <linux/time_namespace.h>
+#include <linux/vdso_datastore.h>
 #include <linux/vmalloc.h>
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
@@ -57,12 +57,6 @@ static struct vdso_abi_info vdso_info[] __ro_after_init = {
 #endif /* CONFIG_COMPAT_VDSO */
 };
 
-/*
- * The vDSO data page.
- */
-static union vdso_data_store vdso_data_store __page_aligned_data;
-struct vdso_data *vdso_data = vdso_data_store.data;
-
 static int vdso_mremap(const struct vm_special_mapping *sm,
 		struct vm_area_struct *new_vma)
 {
@@ -104,78 +98,6 @@ static int __init __vdso_init(enum vdso_abi abi)
 	return 0;
 }
 
-#ifdef CONFIG_TIME_NS
-struct vdso_data *arch_get_vdso_data(void *vvar_page)
-{
-	return (struct vdso_data *)(vvar_page);
-}
-
-static const struct vm_special_mapping vvar_map;
-
-/*
- * The vvar mapping contains data for a specific time namespace, so when a task
- * changes namespace we must unmap its vvar data for the old namespace.
- * Subsequent faults will map in data for the new namespace.
- *
- * For more details see timens_setup_vdso_data().
- */
-int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
-{
-	struct mm_struct *mm = task->mm;
-	struct vm_area_struct *vma;
-	VMA_ITERATOR(vmi, mm, 0);
-
-	mmap_read_lock(mm);
-
-	for_each_vma(vmi, vma) {
-		if (vma_is_special_mapping(vma, &vvar_map))
-			zap_vma_pages(vma);
-	}
-
-	mmap_read_unlock(mm);
-	return 0;
-}
-#endif
-
-static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
-			     struct vm_area_struct *vma, struct vm_fault *vmf)
-{
-	struct page *timens_page = find_timens_vvar_page(vma);
-	unsigned long pfn;
-
-	switch (vmf->pgoff) {
-	case VVAR_DATA_PAGE_OFFSET:
-		if (timens_page)
-			pfn = page_to_pfn(timens_page);
-		else
-			pfn = sym_to_pfn(vdso_data);
-		break;
-#ifdef CONFIG_TIME_NS
-	case VVAR_TIMENS_PAGE_OFFSET:
-		/*
-		 * If a task belongs to a time namespace then a namespace
-		 * specific VVAR is mapped with the VVAR_DATA_PAGE_OFFSET and
-		 * the real VVAR page is mapped with the VVAR_TIMENS_PAGE_OFFSET
-		 * offset.
-		 * See also the comment near timens_setup_vdso_data().
-		 */
-		if (!timens_page)
-			return VM_FAULT_SIGBUS;
-		pfn = sym_to_pfn(vdso_data);
-		break;
-#endif /* CONFIG_TIME_NS */
-	default:
-		return VM_FAULT_SIGBUS;
-	}
-
-	return vmf_insert_pfn(vma, vmf->address, pfn);
-}
-
-static const struct vm_special_mapping vvar_map = {
-	.name   = "[vvar]",
-	.fault = vvar_fault,
-};
-
 static int __setup_additional_pages(enum vdso_abi abi,
 				    struct mm_struct *mm,
 				    struct linux_binprm *bprm,
@@ -185,11 +107,11 @@ static int __setup_additional_pages(enum vdso_abi abi,
 	unsigned long gp_flags = 0;
 	void *ret;
 
-	BUILD_BUG_ON(VVAR_NR_PAGES != __VVAR_PAGES);
+	BUILD_BUG_ON(VDSO_NR_PAGES != __VDSO_PAGES);
 
 	vdso_text_len = vdso_info[abi].vdso_pages << PAGE_SHIFT;
 	/* Be sure to map the data page */
-	vdso_mapping_len = vdso_text_len + VVAR_NR_PAGES * PAGE_SIZE;
+	vdso_mapping_len = vdso_text_len + VDSO_NR_PAGES * PAGE_SIZE;
 
 	vdso_base = get_unmapped_area(NULL, 0, vdso_mapping_len, 0, 0);
 	if (IS_ERR_VALUE(vdso_base)) {
@@ -197,16 +119,14 @@ static int __setup_additional_pages(enum vdso_abi abi,
 		goto up_fail;
 	}
 
-	ret = _install_special_mapping(mm, vdso_base, VVAR_NR_PAGES * PAGE_SIZE,
-				       VM_READ|VM_MAYREAD|VM_PFNMAP,
-				       &vvar_map);
+	ret = vdso_install_vvar_mapping(mm, vdso_base);
 	if (IS_ERR(ret))
 		goto up_fail;
 
 	if (system_supports_bti_kernel())
 		gp_flags = VM_ARM64_BTI;
 
-	vdso_base += VVAR_NR_PAGES * PAGE_SIZE;
+	vdso_base += VDSO_NR_PAGES * PAGE_SIZE;
 	mm->context.vdso = (void *)vdso_base;
 	ret = _install_special_mapping(mm, vdso_base, vdso_text_len,
 				       VM_READ|VM_EXEC|gp_flags|
diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
index 4ec32e86a8da22d5e2315e55ae2e86ec8e7f5f9a..2e20d0593f182bfefcf39aebb1400f32af0866dc 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -20,11 +20,8 @@ OUTPUT_ARCH(aarch64)
 
 SECTIONS
 {
-	PROVIDE(_vdso_data = . - __VVAR_PAGES * PAGE_SIZE);
-	PROVIDE(_vdso_rng_data = _vdso_data + __VDSO_RND_DATA_OFFSET);
-#ifdef CONFIG_TIME_NS
-	PROVIDE(_timens_data = _vdso_data + PAGE_SIZE);
-#endif
+	VDSO_VVAR_SYMS
+
 	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
diff --git a/arch/arm64/kernel/vdso32/vdso.lds.S b/arch/arm64/kernel/vdso32/vdso.lds.S
index 732702a187e9e8b62972ee0aad75c23568e5e779..e02b27487ce80497663dd042357558fea201fcce 100644
--- a/arch/arm64/kernel/vdso32/vdso.lds.S
+++ b/arch/arm64/kernel/vdso32/vdso.lds.S
@@ -12,16 +12,15 @@
 #include <asm/page.h>
 #include <asm/vdso.h>
 #include <asm-generic/vmlinux.lds.h>
+#include <vdso/datapage.h>
 
 OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
 OUTPUT_ARCH(arm)
 
 SECTIONS
 {
-	PROVIDE_HIDDEN(_vdso_data = . - __VVAR_PAGES * PAGE_SIZE);
-#ifdef CONFIG_TIME_NS
-	PROVIDE_HIDDEN(_timens_data = _vdso_data + PAGE_SIZE);
-#endif
+	VDSO_VVAR_SYMS
+
 	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text

-- 
2.47.1


