Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB319205334
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 15:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732682AbgFWNOf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 09:14:35 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:49053 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732629AbgFWNOd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 23 Jun 2020 09:14:33 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=38;SR=0;TI=SMTPD_---0U0VwtSQ_1592918060;
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0U0VwtSQ_1592918060)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 23 Jun 2020 21:14:21 +0800
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To:     pbonzini@redhat.com, tsbogend@alpha.franken.de, paulus@ozlabs.org,
        mpe@ellerman.id.au, benh@kernel.crashing.org,
        borntraeger@de.ibm.com, frankja@linux.ibm.com, david@redhat.com,
        cohuck@redhat.com, heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        sean.j.christopherson@intel.com, vkuznets@redhat.com,
        wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, maz@kernel.org, james.morse@arm.com,
        julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
        christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com,
        chenhuacai@gmail.com
Cc:     kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
        tianjia.zhang@linux.alibaba.com
Subject: [PATCH v6 3/5] KVM: PPC: clean up redundant kvm_run parameters in assembly
Date:   Tue, 23 Jun 2020 21:14:16 +0800
Message-Id: <20200623131418.31473-4-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623131418.31473-1-tianjia.zhang@linux.alibaba.com>
References: <20200623131418.31473-1-tianjia.zhang@linux.alibaba.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
structure. For historical reasons, many kvm-related function parameters
retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time. This
patch does a unified cleanup of these remaining redundant parameters.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 arch/powerpc/include/asm/kvm_ppc.h    |  2 +-
 arch/powerpc/kvm/book3s_interrupts.S  | 22 ++++++++++------------
 arch/powerpc/kvm/book3s_pr.c          |  9 ++++-----
 arch/powerpc/kvm/booke.c              |  9 ++++-----
 arch/powerpc/kvm/booke_interrupts.S   |  9 ++++-----
 arch/powerpc/kvm/bookehv_interrupts.S | 10 +++++-----
 6 files changed, 28 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index ccf66b3a4c1d..0a056c64c317 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -59,7 +59,7 @@ enum xlate_readwrite {
 };
 
 extern int kvmppc_vcpu_run(struct kvm_vcpu *vcpu);
-extern int __kvmppc_vcpu_run(struct kvm_run *run, struct kvm_vcpu *vcpu);
+extern int __kvmppc_vcpu_run(struct kvm_vcpu *vcpu);
 extern void kvmppc_handler_highmem(void);
 
 extern void kvmppc_dump_vcpu(struct kvm_vcpu *vcpu);
diff --git a/arch/powerpc/kvm/book3s_interrupts.S b/arch/powerpc/kvm/book3s_interrupts.S
index f7ad99d972ce..a3674f6b8d3d 100644
--- a/arch/powerpc/kvm/book3s_interrupts.S
+++ b/arch/powerpc/kvm/book3s_interrupts.S
@@ -55,8 +55,7 @@
  ****************************************************************************/
 
 /* Registers:
- *  r3: kvm_run pointer
- *  r4: vcpu pointer
+ *  r3: vcpu pointer
  */
 _GLOBAL(__kvmppc_vcpu_run)
 
@@ -68,8 +67,8 @@ kvm_start_entry:
 	/* Save host state to the stack */
 	PPC_STLU r1, -SWITCH_FRAME_SIZE(r1)
 
-	/* Save r3 (kvm_run) and r4 (vcpu) */
-	SAVE_2GPRS(3, r1)
+	/* Save r3 (vcpu) */
+	SAVE_GPR(3, r1)
 
 	/* Save non-volatile registers (r14 - r31) */
 	SAVE_NVGPRS(r1)
@@ -82,14 +81,13 @@ kvm_start_entry:
 	PPC_STL	r0, _LINK(r1)
 
 	/* Load non-volatile guest state from the vcpu */
-	VCPU_LOAD_NVGPRS(r4)
+	VCPU_LOAD_NVGPRS(r3)
 
 kvm_start_lightweight:
 	/* Copy registers into shadow vcpu so we can access them in real mode */
-	mr	r3, r4
 	bl	FUNC(kvmppc_copy_to_svcpu)
 	nop
-	REST_GPR(4, r1)
+	REST_GPR(3, r1)
 
 #ifdef CONFIG_PPC_BOOK3S_64
 	/* Get the dcbz32 flag */
@@ -146,7 +144,7 @@ after_sprg3_load:
 	 *
 	 */
 
-	PPC_LL	r3, GPR4(r1)		/* vcpu pointer */
+	PPC_LL	r3, GPR3(r1)		/* vcpu pointer */
 
 	/*
 	 * kvmppc_copy_from_svcpu can clobber volatile registers, save
@@ -190,11 +188,11 @@ after_sprg3_load:
 	PPC_STL	r30, VCPU_GPR(R30)(r7)
 	PPC_STL	r31, VCPU_GPR(R31)(r7)
 
-	/* Pass the exit number as 3rd argument to kvmppc_handle_exit */
-	lwz	r5, VCPU_TRAP(r7)
+	/* Pass the exit number as 2nd argument to kvmppc_handle_exit */
+	lwz	r4, VCPU_TRAP(r7)
 
-	/* Restore r3 (kvm_run) and r4 (vcpu) */
-	REST_2GPRS(3, r1)
+	/* Restore r3 (vcpu) */
+	REST_GPR(3, r1)
 	bl	FUNC(kvmppc_handle_exit_pr)
 
 	/* If RESUME_GUEST, get back in the loop */
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index ef54f917bdaf..01c8fe5abe0d 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -1151,9 +1151,9 @@ static int kvmppc_exit_pr_progint(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 	return r;
 }
 
-int kvmppc_handle_exit_pr(struct kvm_run *run, struct kvm_vcpu *vcpu,
-			  unsigned int exit_nr)
+int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 {
+	struct kvm_run *run = vcpu->run;
 	int r = RESUME_HOST;
 	int s;
 
@@ -1826,7 +1826,6 @@ static void kvmppc_core_vcpu_free_pr(struct kvm_vcpu *vcpu)
 
 static int kvmppc_vcpu_run_pr(struct kvm_vcpu *vcpu)
 {
-	struct kvm_run *run = vcpu->run;
 	int ret;
 #ifdef CONFIG_ALTIVEC
 	unsigned long uninitialized_var(vrsave);
@@ -1834,7 +1833,7 @@ static int kvmppc_vcpu_run_pr(struct kvm_vcpu *vcpu)
 
 	/* Check if we can run the vcpu at all */
 	if (!vcpu->arch.sane) {
-		run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
+		vcpu->run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
 		ret = -EINVAL;
 		goto out;
 	}
@@ -1861,7 +1860,7 @@ static int kvmppc_vcpu_run_pr(struct kvm_vcpu *vcpu)
 
 	kvmppc_fix_ee_before_entry();
 
-	ret = __kvmppc_vcpu_run(run, vcpu);
+	ret = __kvmppc_vcpu_run(vcpu);
 
 	kvmppc_clear_debug(vcpu);
 
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index c0d62a917e20..3e1c9f08e302 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -731,12 +731,11 @@ int kvmppc_core_check_requests(struct kvm_vcpu *vcpu)
 
 int kvmppc_vcpu_run(struct kvm_vcpu *vcpu)
 {
-	struct kvm_run *run = vcpu->run;
 	int ret, s;
 	struct debug_reg debug;
 
 	if (!vcpu->arch.sane) {
-		run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
+		vcpu->run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
 		return -EINVAL;
 	}
 
@@ -778,7 +777,7 @@ int kvmppc_vcpu_run(struct kvm_vcpu *vcpu)
 	vcpu->arch.pgdir = vcpu->kvm->mm->pgd;
 	kvmppc_fix_ee_before_entry();
 
-	ret = __kvmppc_vcpu_run(run, vcpu);
+	ret = __kvmppc_vcpu_run(vcpu);
 
 	/* No need for guest_exit. It's done in handle_exit.
 	   We also get here with interrupts enabled. */
@@ -982,9 +981,9 @@ static int kvmppc_resume_inst_load(struct kvm_vcpu *vcpu,
  *
  * Return value is in the form (errcode<<2 | RESUME_FLAG_HOST | RESUME_FLAG_NV)
  */
-int kvmppc_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu,
-                       unsigned int exit_nr)
+int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 {
+	struct kvm_run *run = vcpu->run;
 	int r = RESUME_HOST;
 	int s;
 	int idx;
diff --git a/arch/powerpc/kvm/booke_interrupts.S b/arch/powerpc/kvm/booke_interrupts.S
index 2e56ab5a5f55..6fa82efe833b 100644
--- a/arch/powerpc/kvm/booke_interrupts.S
+++ b/arch/powerpc/kvm/booke_interrupts.S
@@ -237,7 +237,7 @@ _GLOBAL(kvmppc_resume_host)
 	/* Switch to kernel stack and jump to handler. */
 	LOAD_REG_ADDR(r3, kvmppc_handle_exit)
 	mtctr	r3
-	lwz	r3, HOST_RUN(r1)
+	mr	r3, r4
 	lwz	r2, HOST_R2(r1)
 	mr	r14, r4 /* Save vcpu pointer. */
 
@@ -337,15 +337,14 @@ heavyweight_exit:
 
 
 /* Registers:
- *  r3: kvm_run pointer
- *  r4: vcpu pointer
+ *  r3: vcpu pointer
  */
 _GLOBAL(__kvmppc_vcpu_run)
 	stwu	r1, -HOST_STACK_SIZE(r1)
-	stw	r1, VCPU_HOST_STACK(r4)	/* Save stack pointer to vcpu. */
+	stw	r1, VCPU_HOST_STACK(r3)	/* Save stack pointer to vcpu. */
 
 	/* Save host state to stack. */
-	stw	r3, HOST_RUN(r1)
+	mr	r4, r3
 	mflr	r3
 	stw	r3, HOST_STACK_LR(r1)
 	mfcr	r5
diff --git a/arch/powerpc/kvm/bookehv_interrupts.S b/arch/powerpc/kvm/bookehv_interrupts.S
index c577ba4b3169..8262c14fc9e6 100644
--- a/arch/powerpc/kvm/bookehv_interrupts.S
+++ b/arch/powerpc/kvm/bookehv_interrupts.S
@@ -434,9 +434,10 @@ _GLOBAL(kvmppc_resume_host)
 #endif
 
 	/* Switch to kernel stack and jump to handler. */
-	PPC_LL	r3, HOST_RUN(r1)
+	mr	r3, r4
 	mr	r5, r14 /* intno */
 	mr	r14, r4 /* Save vcpu pointer. */
+	mr	r4, r5
 	bl	kvmppc_handle_exit
 
 	/* Restore vcpu pointer and the nonvolatiles we used. */
@@ -525,15 +526,14 @@ heavyweight_exit:
 	blr
 
 /* Registers:
- *  r3: kvm_run pointer
- *  r4: vcpu pointer
+ *  r3: vcpu pointer
  */
 _GLOBAL(__kvmppc_vcpu_run)
 	stwu	r1, -HOST_STACK_SIZE(r1)
-	PPC_STL	r1, VCPU_HOST_STACK(r4)	/* Save stack pointer to vcpu. */
+	PPC_STL	r1, VCPU_HOST_STACK(r3)	/* Save stack pointer to vcpu. */
 
 	/* Save host state to stack. */
-	PPC_STL	r3, HOST_RUN(r1)
+	mr	r4, r3
 	mflr	r3
 	mfcr	r5
 	PPC_STL	r3, HOST_STACK_LR(r1)
-- 
2.17.1

