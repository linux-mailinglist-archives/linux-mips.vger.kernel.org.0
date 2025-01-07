Return-Path: <linux-mips+bounces-7289-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B60BA04D12
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jan 2025 00:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFF133A167F
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jan 2025 23:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FCB1E1A14;
	Tue,  7 Jan 2025 23:04:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA931E1A2B;
	Tue,  7 Jan 2025 23:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736291063; cv=none; b=AOy/+XHjYb3p/ezh9PDOCj2BbHLJ5wciecP6IUv14iSgEgD5ZL18Ckvba5GmI8HSlxJSxgTQWXB/CKAf5DrOthRS155yyzDT2enoH6o+cK46dpz2cyIyRF3RDqqM+pAo9N0KH0CAVzXeBgfj87/tcH8394FZJL/0EujZTgsNEGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736291063; c=relaxed/simple;
	bh=KgQKMSoLYgQrqOpHNSWMl9ct3UhB8JjvzQewc52LNWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=h1FxxfbQySq4mIN5vrd4e4LW8RY4lY9FS56pKkK3chHj4M/t8gIisj+HKG5B8mI3NPWyhj5z+Zk3f0T2nuZwssdGFPJ+1ibiKT+20XKQ+DX4OzIO5niEFVhhtD/9AV1eEVCXHVsR2JZamvTq/jyc9HlRCAr9ifsz4/BvA8m6NSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 2B68172C90B;
	Wed,  8 Jan 2025 02:04:19 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 037907CCB3A; Wed,  8 Jan 2025 01:04:18 +0200 (IST)
Date: Wed, 8 Jan 2025 01:04:18 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: [PATCH 2/6] syscall.h: add syscall_set_arguments() on remaining
 HAVE_ARCH_TRACEHOOK arches
Message-ID: <20250107230418.GB30633@strace.io>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107230153.GA30560@strace.io>

Add syscall_set_arguments() on those few HAVE_ARCH_TRACEHOOK
architectures that haven't provided it yet.

syscall_set_arguments() is going to be needed on all HAVE_ARCH_TRACEHOOK
architectures to implement PTRACE_SET_SYSCALL_INFO API.

Signed-off-by: Dmitry V. Levin <ldv@strace.io>
---
 arch/arc/include/asm/syscall.h       | 14 +++++++++
 arch/arm/include/asm/syscall.h       | 13 ++++++++
 arch/arm64/include/asm/syscall.h     | 13 ++++++++
 arch/csky/include/asm/syscall.h      | 13 ++++++++
 arch/hexagon/include/asm/syscall.h   |  7 +++++
 arch/loongarch/include/asm/syscall.h |  8 +++++
 arch/mips/include/asm/syscall.h      | 46 ++++++++++++++++++++++++++++
 arch/parisc/include/asm/syscall.h    | 12 ++++++++
 8 files changed, 126 insertions(+)

diff --git a/arch/arc/include/asm/syscall.h b/arch/arc/include/asm/syscall.h
index 9709256e31c8..89c1e1736356 100644
--- a/arch/arc/include/asm/syscall.h
+++ b/arch/arc/include/asm/syscall.h
@@ -67,6 +67,20 @@ syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
 	}
 }
 
+static inline void
+syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
+		      unsigned long *args)
+{
+	unsigned long *inside_ptregs = &regs->r0;
+	unsigned int n = 6;
+	unsigned int i = 0;
+
+	while (n--) {
+		*inside_ptregs = args[i++];
+		inside_ptregs--;
+	}
+}
+
 static inline int
 syscall_get_arch(struct task_struct *task)
 {
diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index fe4326d938c1..21927fa0ae2b 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -80,6 +80,19 @@ static inline void syscall_get_arguments(struct task_struct *task,
 	memcpy(args, &regs->ARM_r0 + 1, 5 * sizeof(args[0]));
 }
 
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 const unsigned long *args)
+{
+	memcpy(&regs->ARM_r0, args, 6 * sizeof(args[0]));
+	/*
+	 * Also copy the first argument into ARM_ORIG_r0
+	 * so that syscall_get_arguments() would return it
+	 * instead of the previous value.
+	 */
+	regs->ARM_ORIG_r0 = regs->ARM_r0;
+}
+
 static inline int syscall_get_arch(struct task_struct *task)
 {
 	/* ARM tasks don't change audit architectures on the fly. */
diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index ab8e14b96f68..76020b66286b 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -73,6 +73,19 @@ static inline void syscall_get_arguments(struct task_struct *task,
 	memcpy(args, &regs->regs[1], 5 * sizeof(args[0]));
 }
 
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 const unsigned long *args)
+{
+	memcpy(&regs->regs[0], args, 6 * sizeof(args[0]));
+	/*
+	 * Also copy the first argument into orig_x0
+	 * so that syscall_get_arguments() would return it
+	 * instead of the previous value.
+	 */
+	regs->orig_x0 = regs->regs[0];
+}
+
 /*
  * We don't care about endianness (__AUDIT_ARCH_LE bit) here because
  * AArch64 has the same system calls both on little- and big- endian.
diff --git a/arch/csky/include/asm/syscall.h b/arch/csky/include/asm/syscall.h
index 0de5734950bf..30403f7a0487 100644
--- a/arch/csky/include/asm/syscall.h
+++ b/arch/csky/include/asm/syscall.h
@@ -59,6 +59,19 @@ syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
 	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
 }
 
+static inline void
+syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
+		      const unsigned long *args)
+{
+	memcpy(&regs->a0, args, 6 * sizeof(regs->a0));
+	/*
+	 * Also copy the first argument into orig_x0
+	 * so that syscall_get_arguments() would return it
+	 * instead of the previous value.
+	 */
+	regs->orig_a0 = regs->a0;
+}
+
 static inline int
 syscall_get_arch(struct task_struct *task)
 {
diff --git a/arch/hexagon/include/asm/syscall.h b/arch/hexagon/include/asm/syscall.h
index f6e454f18038..12d2df6aaa03 100644
--- a/arch/hexagon/include/asm/syscall.h
+++ b/arch/hexagon/include/asm/syscall.h
@@ -33,6 +33,13 @@ static inline void syscall_get_arguments(struct task_struct *task,
 	memcpy(args, &(&regs->r00)[0], 6 * sizeof(args[0]));
 }
 
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 unsigned long *args)
+{
+	memcpy(&(&regs->r00)[0], args, 6 * sizeof(args[0]));
+}
+
 static inline long syscall_get_error(struct task_struct *task,
 				     struct pt_regs *regs)
 {
diff --git a/arch/loongarch/include/asm/syscall.h b/arch/loongarch/include/asm/syscall.h
index e286dc58476e..ff415b3c0a8e 100644
--- a/arch/loongarch/include/asm/syscall.h
+++ b/arch/loongarch/include/asm/syscall.h
@@ -61,6 +61,14 @@ static inline void syscall_get_arguments(struct task_struct *task,
 	memcpy(&args[1], &regs->regs[5], 5 * sizeof(long));
 }
 
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 unsigned long *args)
+{
+	regs->orig_a0 = args[0];
+	memcpy(&regs->regs[5], &args[1], 5 * sizeof(long));
+}
+
 static inline int syscall_get_arch(struct task_struct *task)
 {
 	return AUDIT_ARCH_LOONGARCH64;
diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
index ebdf4d910af2..b8a19e465bf4 100644
--- a/arch/mips/include/asm/syscall.h
+++ b/arch/mips/include/asm/syscall.h
@@ -90,6 +90,37 @@ static inline void mips_get_syscall_arg(unsigned long *arg,
 	unreachable();
 }
 
+static inline void mips_set_syscall_arg(unsigned long *arg,
+	struct task_struct *task, struct pt_regs *regs, unsigned int n)
+{
+	unsigned long usp __maybe_unused = regs->regs[29];
+
+	switch (n) {
+	case 0: case 1: case 2: case 3:
+		regs->regs[4 + n] = *arg;
+
+		return;
+
+#ifdef CONFIG_32BIT
+	case 4: case 5: case 6: case 7:
+		put_user(*arg, (int *)usp + n);
+		return;
+#endif
+
+#ifdef CONFIG_64BIT
+	case 4: case 5: case 6: case 7:
+#ifdef CONFIG_MIPS32_O32
+		if (test_tsk_thread_flag(task, TIF_32BIT_REGS))
+			put_user(*arg, (int *)usp + n);
+		else
+#endif
+			regs->regs[4 + n] = *arg;
+
+		return;
+#endif
+	}
+}
+
 static inline long syscall_get_error(struct task_struct *task,
 				     struct pt_regs *regs)
 {
@@ -136,6 +167,21 @@ static inline void syscall_get_arguments(struct task_struct *task,
 		mips_get_syscall_arg(args++, task, regs, i++);
 }
 
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 unsigned long *args)
+{
+	unsigned int i = 0;
+	unsigned int n = 6;
+
+	/* O32 ABI syscall() */
+	if (mips_syscall_is_indirect(task, regs))
+		i++;
+
+	while (n--)
+		mips_set_syscall_arg(args++, task, regs, i++);
+}
+
 extern const unsigned long sys_call_table[];
 extern const unsigned long sys32_call_table[];
 extern const unsigned long sysn32_call_table[];
diff --git a/arch/parisc/include/asm/syscall.h b/arch/parisc/include/asm/syscall.h
index 00b127a5e09b..b146d0ae4c77 100644
--- a/arch/parisc/include/asm/syscall.h
+++ b/arch/parisc/include/asm/syscall.h
@@ -29,6 +29,18 @@ static inline void syscall_get_arguments(struct task_struct *tsk,
 	args[0] = regs->gr[26];
 }
 
+static inline void syscall_set_arguments(struct task_struct *tsk,
+					 struct pt_regs *regs,
+					 unsigned long *args)
+{
+	regs->gr[21] = args[5];
+	regs->gr[22] = args[4];
+	regs->gr[23] = args[3];
+	regs->gr[24] = args[2];
+	regs->gr[25] = args[1];
+	regs->gr[26] = args[0];
+}
+
 static inline long syscall_get_error(struct task_struct *task,
 				     struct pt_regs *regs)
 {

-- 
ldv

