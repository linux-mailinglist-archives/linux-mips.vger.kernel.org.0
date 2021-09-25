Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9579D417ED4
	for <lists+linux-mips@lfdr.de>; Sat, 25 Sep 2021 02:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346381AbhIYA5U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Sep 2021 20:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346391AbhIYA5Q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Sep 2021 20:57:16 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F14BC0614ED
        for <linux-mips@vger.kernel.org>; Fri, 24 Sep 2021 17:55:42 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id o9-20020ac80249000000b002a0c9fd54d5so42647974qtg.4
        for <linux-mips@vger.kernel.org>; Fri, 24 Sep 2021 17:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=uLdmTcdOYtZZFn/MuvyFluHWXgJOTY2/q4ao2KO0G1s=;
        b=gPL1+MSjD+xrjkXRcOmwNqC67Mmvr7RuwzpFUcjOcMddzQt5ApvpYmHx9XRbluCLBL
         Yg1nvCEit3T0YJNXit7IRIoK7VGM0aOPR2LyM5Quj71xnW24SDpghbthAKdIVpkpkzRd
         X6gkLqVFB0i84k54sjonsicOkdWeYV2sQavG8Mv3aAQIe9i53EotyhPSycXboSC/o/x4
         nIX64OghkAl/Sc0vGnSXFuQP7lt0994oRwNLKAlZQBXOCXCEC6YhE0vIEN6r/f82ulAH
         xcNqf+D9f3lARXxv2SfegpANARLuOHGy1ceCMn8cGGb9ki40BxZxld2KVYTLW7PXUDEk
         tT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=uLdmTcdOYtZZFn/MuvyFluHWXgJOTY2/q4ao2KO0G1s=;
        b=LpoYAUEprF3uocdMgLE7Z+5ZS+Fx1FnbjJYGAFSvUqrl6NQhiJZ7+znks0fX3R87vd
         vc9uyYgiuWUZ+1r2jMLCWnEa4IC8d2VfQ06VsRhd8a9WJEEs/m9iKhppPG+Gt6Oah0nN
         piPNDtGQZoToxlH0sM5vF1xn0oOcuS28ROXjxSCvXfuMZEXd2dyZPxuroZfzZ/+j7oOU
         K988c33m5WWtGf7C3ZQAdW+Z6Nelc3YrHkkEiKJ1TuExsK52gGyJrpT8gN+O+9OIeJaJ
         3/OnG50XTixgXMBe+R75XQ3GTvzjsOzW2HA2NjjHGmsVKTZPdByYBySgaakkPrswKz6c
         EeGQ==
X-Gm-Message-State: AOAM530OMW++tl3kNAO9gc8lrIg7DaHHrEjeZrqnsaeOu74jMN6KsRjN
        GvhaIYQ3A9ClyPOZ9swW6y7qPyCW8Mw=
X-Google-Smtp-Source: ABdhPJyVJB4HLPJhBHC7Pbe0078HVzq+2LEwo+Z0/uFPixWTHq0eCSAqgxL/c3TZhIqWciWqG/9d+DXnsIA=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:4c72:89be:dba3:2bcb])
 (user=seanjc job=sendgmr) by 2002:a05:6214:54f:: with SMTP id
 ci15mr12992188qvb.29.1632531341625; Fri, 24 Sep 2021 17:55:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri, 24 Sep 2021 17:55:19 -0700
In-Reply-To: <20210925005528.1145584-1-seanjc@google.com>
Message-Id: <20210925005528.1145584-6-seanjc@google.com>
Mime-Version: 1.0
References: <20210925005528.1145584-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH 05/14] KVM: s390: Clear valid_wakeup in kvm_s390_handle_wait(),
 not in arch hook
From:   Sean Christopherson <seanjc@google.com>
To:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
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
        kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Matlack <dmatlack@google.com>,
        Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move the clearing of valid_wakeup out of kvm_arch_vcpu_block_finish() so
that a future patch can drop said arch hook.  Unlike the other blocking-
related arch hooks (vcpu_blocking/unblocking()), vcpu_block_finish() needs
to be called even if the KVM doesn't actually block the vCPU.  This will
allow future patches to differentiate between truly blocking the vCPU and
emulating a halt condition without introducing a contradiction.

Alternatively, the hook could be renamed to kvm_arch_vcpu_halt_finish(),
but there's literally one call site in s390, and future cleanup can also
be done to handle valid_wakeup fully within kvm_s390_handle_wait() and
allow generic KVM to drop vcpu_valid_wakeup().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/interrupt.c | 1 +
 arch/s390/kvm/kvm-s390.c  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/s390/kvm/interrupt.c b/arch/s390/kvm/interrupt.c
index 10722455fd02..520450a7956f 100644
--- a/arch/s390/kvm/interrupt.c
+++ b/arch/s390/kvm/interrupt.c
@@ -1336,6 +1336,7 @@ int kvm_s390_handle_wait(struct kvm_vcpu *vcpu)
 no_timer:
 	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 	kvm_vcpu_block(vcpu);
+	vcpu->valid_wakeup = false;
 	__unset_cpu_idle(vcpu);
 	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 7cabe6778b1b..08ed68639a21 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -5082,7 +5082,7 @@ static inline unsigned long nonhyp_mask(int i)
 
 void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu)
 {
-	vcpu->valid_wakeup = false;
+
 }
 
 static int __init kvm_s390_init(void)
-- 
2.33.0.685.g46640cef36-goog

