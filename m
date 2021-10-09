Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD704275F5
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244434AbhJICPt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244439AbhJICPb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:15:31 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C158C0613EE
        for <linux-mips@vger.kernel.org>; Fri,  8 Oct 2021 19:13:17 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id s6-20020a254506000000b005b6b6434cd6so14970796yba.9
        for <linux-mips@vger.kernel.org>; Fri, 08 Oct 2021 19:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=A16ghZapKabIxKpJvSoekuSQb+2m0ovUg31JfH4Wpyk=;
        b=gXKY8WPbOOd7VUk2uZNjE2h38k02X7HYo+DeTvCyrUtBDVFLTYEsOV8HSoTA+FvX50
         6RKQel33Gtt9tZeSd/S1b5Fq4WSdHPmoxsRRolUsJs1RknoixjMGUTdHEj46Nu5OvT+D
         veVzIN6kL3lune6PqMLQN/YznPFV5x8H61PddtU3baQVQe6kcDq8AGdLFfWuVrLQ8EQf
         j+yjtMDopjwkS57GjAxolElfps1MfrQZh9wMiAPKNI3vZMMMUZ0Se8uxReg+fzG8sQAm
         DKcW2fuPnHMCOALfdqBDt6VllQOh4ktUmrRkK5ZhDt5ivim69QDNok10m3K5kTH0AXbg
         hPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=A16ghZapKabIxKpJvSoekuSQb+2m0ovUg31JfH4Wpyk=;
        b=22fG/qYac7a/mHIvhb6Y4z7Fbtzm1C5XbiC9yJUCVWo2HYpQ3QBz+fPVtmw3hPghOh
         8GzZsPAepKsx0FfLkd4RNJVUjXG1BSZ7cON8OGnQv+xYF1nrVnyxnse//LWo0Wo3Wb/e
         v/KUV8k/u97chOpEPkCFjyjJgA5VZxOepfOCuxlPSOu0u2dca6m+QeU8it/cMpWZ6TPu
         6udHdJw4+3QJZv/x8oQurSfqNyXEoVtaAQ0mxHFoLO8EAVpbfjBgohtxvxngHrKqPfIu
         mQYpRPqYhNQolkhfQFisWjIYz7JXBmSRMBJgxzL9dhpreZ+3RfNc2UCoBLMSoiSU3imm
         Wbrw==
X-Gm-Message-State: AOAM5305lFdAbfquRtU2sGCXswG0gb8Y88bm27X9aX1dTILa/KFdYHxD
        cAssxQLAq3MM4PmvzhSFCL5aFIk/DvA=
X-Google-Smtp-Source: ABdhPJyJ+GZrMSH71hr19sRLkQaSLa+OLA+oV25ZdCvzXSyS8FSLewbkBuw4xbZrikejj+zWUKwWlVBuMgU=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:1d57:: with SMTP id d84mr8116571ybd.410.1633745596490;
 Fri, 08 Oct 2021 19:13:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri,  8 Oct 2021 19:12:07 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-15-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 14/43] KVM: Split out a kvm_vcpu_block() helper from kvm_vcpu_halt()
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

Factor out the "block" part of kvm_vcpu_halt() so that x86 can emulate
non-halt wait/sleep/block conditions that should not be subjected to
halt-polling.

No functional change intended.

Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  1 +
 virt/kvm/kvm_main.c      | 52 +++++++++++++++++++++++++++-------------
 2 files changed, 37 insertions(+), 16 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c2ea4004553a..2d837e06eeec 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -968,6 +968,7 @@ void kvm_sigset_activate(struct kvm_vcpu *vcpu);
 void kvm_sigset_deactivate(struct kvm_vcpu *vcpu);
 
 void kvm_vcpu_halt(struct kvm_vcpu *vcpu);
+bool kvm_vcpu_block(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu);
 bool kvm_vcpu_wake_up(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index c13bf3367fda..42894ff7c474 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3201,6 +3201,35 @@ static int kvm_vcpu_check_block(struct kvm_vcpu *vcpu)
 	return ret;
 }
 
+/*
+ * Block the vCPU until the vCPU is runnable, an event arrives, or a signal is
+ * pending.  This is mostly used when halting a vCPU, but may also be used
+ * directly for other vCPU non-runnable states, e.g. x86's Wait-For-SIPI.
+ */
+bool kvm_vcpu_block(struct kvm_vcpu *vcpu)
+{
+	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
+	bool waited = false;
+
+	kvm_arch_vcpu_blocking(vcpu);
+
+	prepare_to_rcuwait(wait);
+	for (;;) {
+		set_current_state(TASK_INTERRUPTIBLE);
+
+		if (kvm_vcpu_check_block(vcpu) < 0)
+			break;
+
+		waited = true;
+		schedule();
+	}
+	finish_rcuwait(wait);
+
+	kvm_arch_vcpu_unblocking(vcpu);
+
+	return waited;
+}
+
 static inline void update_halt_poll_stats(struct kvm_vcpu *vcpu, ktime_t start,
 					  ktime_t end, bool success)
 {
@@ -3223,9 +3252,14 @@ static inline void update_halt_poll_stats(struct kvm_vcpu *vcpu, ktime_t start,
 	}
 }
 
+/*
+ * Emulate a vCPU halt condition, e.g. HLT on x86, WFI on arm, etc...  If halt
+ * polling is enabled, busy wait for a short time before blocking to avoid the
+ * expensive block+unblock sequence if a wake event arrives soon after the vCPU
+ * is halted.
+ */
 void kvm_vcpu_halt(struct kvm_vcpu *vcpu)
 {
-	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
 	bool halt_poll_allowed = !kvm_arch_no_poll(vcpu);
 	bool do_halt_poll = halt_poll_allowed && vcpu->halt_poll_ns;
 	ktime_t start, cur, poll_end;
@@ -3248,21 +3282,7 @@ void kvm_vcpu_halt(struct kvm_vcpu *vcpu)
 		} while (kvm_vcpu_can_poll(cur, stop));
 	}
 
-	kvm_arch_vcpu_blocking(vcpu);
-
-	prepare_to_rcuwait(wait);
-	for (;;) {
-		set_current_state(TASK_INTERRUPTIBLE);
-
-		if (kvm_vcpu_check_block(vcpu) < 0)
-			break;
-
-		waited = true;
-		schedule();
-	}
-	finish_rcuwait(wait);
-
-	kvm_arch_vcpu_unblocking(vcpu);
+	waited = kvm_vcpu_block(vcpu);
 
 	cur = ktime_get();
 	if (waited) {
-- 
2.33.0.882.g93a45727a2-goog

