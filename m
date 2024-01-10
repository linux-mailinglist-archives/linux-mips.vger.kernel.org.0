Return-Path: <linux-mips+bounces-851-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FF2821BBC
	for <lists+linux-mips@lfdr.de>; Tue,  2 Jan 2024 13:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2261FB21E8E
	for <lists+linux-mips@lfdr.de>; Tue,  2 Jan 2024 12:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5350EF9E0;
	Tue,  2 Jan 2024 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="BTgilUQ6"
X-Original-To: linux-mips@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4671FBF8;
	Tue,  2 Jan 2024 12:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1704199077;
	bh=ei3L/hMRlfNY7Sz9SmZ4DfXD98IpAmHi1yZnfBh/zq8=;
	h=From:To:Cc:Subject:Date:From;
	b=BTgilUQ6d6Nhlffji4EuRffpQbwj5zKUAVdh1QrfJBokQNNr263l+XmZ3oloR5grM
	 szxThG4GcKMu1GQxiYesEcu0yZhL4SlgbrAnlckyk6byN3iVvXlst4LYk9BnGp7Rbf
	 OAl17T5daR/pwWCkvEGxbuX28lsp318dr11H3CdE=
Received: from stargazer.. (unknown [113.200.174.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id C76556707D;
	Tue,  2 Jan 2024 07:37:52 -0500 (EST)
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Jinyang He <hejinyang@loongson.cn>,
	loongarch@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>,
	stable@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v3] LoongArch: Fix and simplify fcsr initialization on execve
Date: Tue,  2 Jan 2024 20:37:07 +0800
Message-ID: <20240102123706.6099-2-xry111@xry111.site>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There has been a lingering bug in LoongArch Linux systems causing some
GCC tests to intermittently fail (see Closes link).  I've made a minimal
reproducer:

    zsh% cat measure.s
    .align 4
    .globl _start
    _start:
        movfcsr2gr  $a0, $fcsr0
        bstrpick.w  $a0, $a0, 16, 16
        beqz        $a0, .ok
        break       0
    .ok:
        li.w        $a7, 93
        syscall     0
    zsh% cc mesaure.s -o measure -nostdlib
    zsh% echo $((1.0/3))
    0.33333333333333331
    zsh% while ./measure; do ; done

This while loop should not stop as POSIX is clear that execve must set
fenv to the default, where FCSR should be zero.  But in fact it will
just stop after running for a while (normally less than 30 seconds).
Note that "$((1.0/3))" is needed to reproduce the issue because it
raises FE_INVALID and makes fcsr0 non-zero.

The problem is we are relying on SET_PERSONALITY2 to reset
current->thread.fpu.fcsr.  But SET_PERSONALITY2 is executed before
start_thread which calls lose_fpu(0).  We can see if kernel preempt is
enabled, we may switch to another thread after SET_PERSONALITY2 but
before lose_fpu(0).  Then bad thing happens: during the thread switch
the value of the fcsr0 register is stored into current->thread.fpu.fcsr,
making it dirty again.

The issue can be fixed by setting current->thread.fpu.fcsr after
lose_fpu(0) because lose_fpu clears TIF_USEDFPU, then the thread
switch won't touch current->thread.fpu.fcsr.

The only other architecture setting FCSR in SET_PERSONALITY2 is MIPS.
I've ran a similar test on MIPS with mainline kernel and it turns out
MIPS is buggy too.  Anyway MIPS do this for supporting different FP
flavors (NaN encodings etc.) which do not exist on LoongArch.  So for
LoongArch, we can simply remove the current->thread.fpu.fcsr setting
from SET_PERSONALITY2 and do it in start_thread, after lose_fpu(0).
I'll leave the job to fix MIPS for MIPS maintainers.

The while loop failing with the mainline kernel has survived one hour
after this change on LoongArch.

Closes: https://github.com/loongson-community/discussions/issues/7
Fixes: 803b0fc5c3f2 ("LoongArch: Add process management")
Link: https://lore.kernel.org/linux-mips/7a6aa1bbdbbe2e63ae96ff163fab0349f58f1b9e.camel@xry111.site/
Cc: stable@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---

v2 -> v3:
- Update the commit message to mention MIPS is buggy too.
- Replace tabs in the commit message with whitespaces.
- No code change.

v1 -> v2:
- Still set current->thread.fpu.fcsr to boot_cpu_data.fpu_csr0 instead
  of constant 0.

 arch/loongarch/include/asm/elf.h | 5 -----
 arch/loongarch/kernel/elf.c      | 5 -----
 arch/loongarch/kernel/process.c  | 1 +
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/loongarch/include/asm/elf.h b/arch/loongarch/include/asm/elf.h
index 9b16a3b8e706..f16bd42456e4 100644
--- a/arch/loongarch/include/asm/elf.h
+++ b/arch/loongarch/include/asm/elf.h
@@ -241,8 +241,6 @@ void loongarch_dump_regs64(u64 *uregs, const struct pt_regs *regs);
 do {									\
 	current->thread.vdso = &vdso_info;				\
 									\
-	loongarch_set_personality_fcsr(state);				\
-									\
 	if (personality(current->personality) != PER_LINUX)		\
 		set_personality(PER_LINUX);				\
 } while (0)
@@ -259,7 +257,6 @@ do {									\
 	clear_thread_flag(TIF_32BIT_ADDR);				\
 									\
 	current->thread.vdso = &vdso_info;				\
-	loongarch_set_personality_fcsr(state);				\
 									\
 	p = personality(current->personality);				\
 	if (p != PER_LINUX32 && p != PER_LINUX)				\
@@ -340,6 +337,4 @@ extern int arch_elf_pt_proc(void *ehdr, void *phdr, struct file *elf,
 extern int arch_check_elf(void *ehdr, bool has_interpreter, void *interp_ehdr,
 			  struct arch_elf_state *state);
 
-extern void loongarch_set_personality_fcsr(struct arch_elf_state *state);
-
 #endif /* _ASM_ELF_H */
diff --git a/arch/loongarch/kernel/elf.c b/arch/loongarch/kernel/elf.c
index 183e94fc9c69..0fa81ced28dc 100644
--- a/arch/loongarch/kernel/elf.c
+++ b/arch/loongarch/kernel/elf.c
@@ -23,8 +23,3 @@ int arch_check_elf(void *_ehdr, bool has_interpreter, void *_interp_ehdr,
 {
 	return 0;
 }
-
-void loongarch_set_personality_fcsr(struct arch_elf_state *state)
-{
-	current->thread.fpu.fcsr = boot_cpu_data.fpu_csr0;
-}
diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 767d94cce0de..3f9cae615f52 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -92,6 +92,7 @@ void start_thread(struct pt_regs *regs, unsigned long pc, unsigned long sp)
 	clear_used_math();
 	regs->csr_era = pc;
 	regs->regs[3] = sp;
+	current->thread.fpu.fcsr = boot_cpu_data.fpu_csr0;
 }
 
 void flush_thread(void)
-- 
2.43.0


