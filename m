Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBC7F4275D9
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244367AbhJICPI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244323AbhJICPD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:15:03 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F155C061764
        for <linux-mips@vger.kernel.org>; Fri,  8 Oct 2021 19:13:07 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id j193-20020a2523ca000000b005b789d71d9aso14934439ybj.21
        for <linux-mips@vger.kernel.org>; Fri, 08 Oct 2021 19:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=7UfiFA3j2+6I2+nAWNhD8/i07R8fVsAS1/w0N/aa090=;
        b=aR3og+oc7PMwu8Forg7HYvRnh8xW7rVTXkNeNN4GEdGb9eMQr0BxriYw1WCEWH/rps
         CzI5rGwFNvewdmiYYfcjmrHJ37omSwRaaK67pX54nsvHJAX1QmuyS8m7A3T8srDuMpEq
         INyVvjKgNRHRhfke+WD+WgtgVp7aMSP1M/d2iLvOmKfjBg4cec31at7qrXlRe57r1WT/
         UsDhrANY7t02k9VZy8hnTd7ysR/TwUt+OFlZh1HvACIu+5QAPMNvmCZ5hIypKdufBScF
         7Y9CJreS/iw7TnDZqwI7dewLqo50Fs3ke9ye+sR1ax5lX0kayCH6nt5LFfkuoh7frLyk
         0n3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=7UfiFA3j2+6I2+nAWNhD8/i07R8fVsAS1/w0N/aa090=;
        b=p81fbT6bekkZVN09xOV/G07c9l9JmYqVxdmaXhIP2sAhC/tDTQnpFlpX4Vf0COq1Pj
         PzhWqAAHn8TZOqFwd1gwRieKmkvF9qQPKSXFOh2RqoO6x0GgfzqaMsUca7EwnNjRtbXF
         bU/Ai0olEg2NQurx20Xod2zoTg2TPa3Ee8fwW3Fyy7aFpKtHT8JI5vKIVSzY7AMNkqM5
         rlHllj4LJ/HmVyKO2SV00mKP7E2YqmPC0cA0K5HWHeoRcr6tAckW2Wypa2wDeooR5N4J
         GwTK0rd1EJ3BjH9GX5/TNMtnekJF9kIcBFM3idXrYZMNQ6LKBpvU98uFSGUOpeZYuD1v
         dFuA==
X-Gm-Message-State: AOAM533r7HEkr1JCX98+4Cp8U6hBy/+VF32POPFg5xbU5VDLrRQ05IBu
        nsihzv2V8edOXe9MuJTJpux3a5mqFx8=
X-Google-Smtp-Source: ABdhPJx5tQAxYIWw/UxfnO+GS3ZmVIvpanbA+F5BzOK+h+G2iaAxrnXRERnnpv1JgyJw5hk8wtX6cvBcEV4=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a5b:110:: with SMTP id 16mr7306011ybx.392.1633745586492;
 Fri, 08 Oct 2021 19:13:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri,  8 Oct 2021 19:12:03 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-11-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 10/43] KVM: arm64: Move vGIC v4 handling for WFI out arch
 callback hook
From:   Sean Christopherson <seanjc@google.com>
To:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Atish Patra <atish.patra@wdc.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        David Matlack <dmatlack@google.com>,
        Oliver Upton <oupton@google.com>,
        Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move the put and reload of the vGIC out of the block/unblock callbacks
and into a dedicated WFI helper.  Functionally, this is nearly a nop as
the block hook is called at the very beginning of kvm_vcpu_block(), and
the only code in kvm_vcpu_block() after the unblock hook is to update the
halt-polling controls, i.e. can only affect the next WFI.

Back when the arch (un)blocking hooks were added by commits 3217f7c25bca
("KVM: Add kvm_arch_vcpu_{un}blocking callbacks) and d35268da6687
("arm/arm64: KVM: arch_timer: Only schedule soft timer on vcpu_block"),
the hooks were invoked only when KVM was about to "block", i.e. schedule
out the vCPU.  The use case at the time was to schedule a timer in the
host based on the earliest timer in the guest in order to wake the
blocking vCPU when the emulated guest timer fired.  Commit accb99bcd0ca
("KVM: arm/arm64: Simplify bg_timer programming") reworked the timer
logic to be even more precise, by waiting until the vCPU was actually
scheduled out, and so move the timer logic from the (un)blocking hooks to
vcpu_load/put.

In the meantime, the hooks gained usage for enabling vGIC v4 doorbells in
commit df9ba95993b9 ("KVM: arm/arm64: GICv4: Use the doorbell interrupt
as an unblocking source"), and added related logic for the VMCR in commit
5eeaf10eec39 ("KVM: arm/arm64: Sync ICH_VMCR_EL2 back when about to block").

Finally, commit 07ab0f8d9a12 ("KVM: Call kvm_arch_vcpu_blocking early
into the blocking sequence") hoisted the (un)blocking hooks so that they
wrapped KVM's halt-polling logic in addition to the core "block" logic.

In other words, the original need for arch hooks to take action _only_
in the block path is long since gone.

Cc: Oliver Upton <oupton@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h |  2 ++
 arch/arm64/kvm/arm.c                 | 52 +++++++++++++++++++---------
 arch/arm64/kvm/handle_exit.c         |  3 +-
 3 files changed, 38 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index fd418955e31e..de8b4f5922b7 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -41,6 +41,8 @@ void kvm_inject_vabt(struct kvm_vcpu *vcpu);
 void kvm_inject_dabt(struct kvm_vcpu *vcpu, unsigned long addr);
 void kvm_inject_pabt(struct kvm_vcpu *vcpu, unsigned long addr);
 
+void kvm_vcpu_wfi(struct kvm_vcpu *vcpu);
+
 static __always_inline bool vcpu_el1_is_32bit(struct kvm_vcpu *vcpu)
 {
 	return !(vcpu->arch.hcr_el2 & HCR_RW);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 7838e9fb693e..1346f81b34df 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -359,27 +359,12 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
 {
-	/*
-	 * If we're about to block (most likely because we've just hit a
-	 * WFI), we need to sync back the state of the GIC CPU interface
-	 * so that we have the latest PMR and group enables. This ensures
-	 * that kvm_arch_vcpu_runnable has up-to-date data to decide
-	 * whether we have pending interrupts.
-	 *
-	 * For the same reason, we want to tell GICv4 that we need
-	 * doorbells to be signalled, should an interrupt become pending.
-	 */
-	preempt_disable();
-	kvm_vgic_vmcr_sync(vcpu);
-	vgic_v4_put(vcpu, true);
-	preempt_enable();
+
 }
 
 void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
 {
-	preempt_disable();
-	vgic_v4_load(vcpu);
-	preempt_enable();
+
 }
 
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
@@ -662,6 +647,39 @@ static void vcpu_req_sleep(struct kvm_vcpu *vcpu)
 	smp_rmb();
 }
 
+/**
+ * kvm_vcpu_wfi - emulate Wait-For-Interrupt behavior
+ * @vcpu:	The VCPU pointer
+ *
+ * Suspend execution of a vCPU until a valid wake event is detected, i.e. until
+ * the vCPU is runnable.  The vCPU may or may not be scheduled out, depending
+ * on when a wake event arrives, e.g. there may already be a pending wake event.
+ */
+void kvm_vcpu_wfi(struct kvm_vcpu *vcpu)
+{
+	/*
+	 * Sync back the state of the GIC CPU interface so that we have
+	 * the latest PMR and group enables. This ensures that
+	 * kvm_arch_vcpu_runnable has up-to-date data to decide whether
+	 * we have pending interrupts, e.g. when determining if the
+	 * vCPU should block.
+	 *
+	 * For the same reason, we want to tell GICv4 that we need
+	 * doorbells to be signalled, should an interrupt become pending.
+	 */
+	preempt_disable();
+	kvm_vgic_vmcr_sync(vcpu);
+	vgic_v4_put(vcpu, true);
+	preempt_enable();
+
+	kvm_vcpu_block(vcpu);
+	kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+
+	preempt_disable();
+	vgic_v4_load(vcpu);
+	preempt_enable();
+}
+
 static int kvm_vcpu_initialized(struct kvm_vcpu *vcpu)
 {
 	return vcpu->arch.target >= 0;
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 275a27368a04..4794563a506b 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -95,8 +95,7 @@ static int kvm_handle_wfx(struct kvm_vcpu *vcpu)
 	} else {
 		trace_kvm_wfx_arm64(*vcpu_pc(vcpu), false);
 		vcpu->stat.wfi_exit_stat++;
-		kvm_vcpu_block(vcpu);
-		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+		kvm_vcpu_wfi(vcpu);
 	}
 
 	kvm_incr_pc(vcpu);
-- 
2.33.0.882.g93a45727a2-goog

