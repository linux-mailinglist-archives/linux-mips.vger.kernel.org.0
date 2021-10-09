Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8DFB42762D
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244425AbhJICRO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244574AbhJICQk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:16:40 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E72C0617AF
        for <linux-mips@vger.kernel.org>; Fri,  8 Oct 2021 19:13:44 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id i21-20020a253b15000000b005b9c0fbba45so15082762yba.20
        for <linux-mips@vger.kernel.org>; Fri, 08 Oct 2021 19:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=sIQRe0bn32KEKwbOVvtx42Ei92aBPRnG0u1z9yXF7CE=;
        b=L08kypVluCyFKbpY0oUWWIYegtRsmlesq0wNJKsfeI8a+xUhccbxmouLf27lMOIMO9
         m9aDG4U98QItV5Ohy31bYubmFprE/QZuQESLgVJSjhpfU/yNgKP/78Q9UuOg6rzwLHC0
         I4lwz0lK7D60KgROmr99XXMz1SfThZEdbn4DKl+Bq52u94Dtdh0Eotn9sUFXLmNXNTbw
         6AcWYEC/LOtNjiY9B+NbBHy51wS3Qc+ABq6bMsBOBRird64iFAtM2ABnk7IiuRD0HQUk
         sjoVTJNAcXG0HP9OnEd8LwZlRBWZpFzxibDplRt3XRCh0O4+qvRQnekLDqaQSXwlvM/O
         WhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=sIQRe0bn32KEKwbOVvtx42Ei92aBPRnG0u1z9yXF7CE=;
        b=JAkhubbLfi9tfqdmkrDtyeKij/fLN8P9lX1Ar5MJXCFpRlW5YLK4NtR6wDWuxw4FVi
         /1eLuyXr7j1ftrhXh1pgdAUE41gTK7QWgGDQM/ae0Io4smWxReTTfrHk8N0sikZk130b
         ZvtA+Yq3EFQWgMTSpXeCIHMVKr5xJ4i/qSgXbVRLDWEViZfymfn6ZWgbKSlieQyZaRk0
         Jy+C09hrig8BwNBxdFSXfNtH429J2VwOvtm40Rr9R3RMokUEAZko9hwdmKDaC3gqmw8B
         o/CHkdX35iBHUBTsm3ADPizdMTVza+mX+DyJmWz2660l+fTOA5/cV5ZhWhtGcLR7Qb+K
         8e9w==
X-Gm-Message-State: AOAM530bbEtfEiEZxa25hkx002vdy8UMZGjjqd7IaMo10h9PmbLxwqDs
        wkXtjyb45FphVBrmsf5bZpanr8ZPPd0=
X-Google-Smtp-Source: ABdhPJwLBmcqJzHPV5bzQgN7SUGs2wP/5HXQxp4+zEmbtDKAgC6fngbLUg0PIYqYm/p4aFsJ/BNsgFl1S/s=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:393:: with SMTP id 141mr7017004ybd.534.1633745623429;
 Fri, 08 Oct 2021 19:13:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri,  8 Oct 2021 19:12:18 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-26-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 25/43] KVM: VMX: Save/restore IRQs (instead of CLI/STI)
 during PI pre/post block
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

Save/restore IRQs when disabling IRQs in posted interrupt pre/post block
in preparation for moving the code into vcpu_put/load(), and thus may be
called with IRQs already disabled.

No functional changed intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 239e0e72a0dd..414ea6972b5c 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -140,6 +140,7 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 {
 	struct pi_desc old, new;
 	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
+	unsigned long flags;
 
 	if (!kvm_arch_has_assigned_device(vcpu->kvm) ||
 	    !irq_remapping_cap(IRQ_POSTING_CAP) ||
@@ -147,8 +148,7 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 	    vmx_interrupt_blocked(vcpu))
 		return 0;
 
-	WARN_ON(irqs_disabled());
-	local_irq_disable();
+	local_irq_save(flags);
 
 	vcpu->pre_pcpu = vcpu->cpu;
 	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->cpu));
@@ -171,19 +171,20 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 	if (pi_test_on(pi_desc))
 		__pi_post_block(vcpu);
 
-	local_irq_enable();
+	local_irq_restore(flags);
 	return (vcpu->pre_pcpu == -1);
 }
 
 void pi_post_block(struct kvm_vcpu *vcpu)
 {
+	unsigned long flags;
+
 	if (vcpu->pre_pcpu == -1)
 		return;
 
-	WARN_ON(irqs_disabled());
-	local_irq_disable();
+	local_irq_save(flags);
 	__pi_post_block(vcpu);
-	local_irq_enable();
+	local_irq_restore(flags);
 }
 
 /*
-- 
2.33.0.882.g93a45727a2-goog

