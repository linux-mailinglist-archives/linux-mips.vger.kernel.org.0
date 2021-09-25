Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C036D417EFE
	for <lists+linux-mips@lfdr.de>; Sat, 25 Sep 2021 02:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346695AbhIYA7L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Sep 2021 20:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346378AbhIYA6d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Sep 2021 20:58:33 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C91C0613A7
        for <linux-mips@vger.kernel.org>; Fri, 24 Sep 2021 17:56:01 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id p12-20020ad4496c000000b0037a535cb8b2so43084576qvy.15
        for <linux-mips@vger.kernel.org>; Fri, 24 Sep 2021 17:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=tGZGtRLoZzNRBWuDX4atzZ2k0Ip4ycJYdNIYDqARGnc=;
        b=q8E3mpn27/Pass6ib5GcuNokaZJD0e7qJsR4kNTZjxo9jjWSI+mPtm05xarcRKasl1
         eiFJZIt6Waa+VtYIE206wV5Amydeo2kxEZobGt+H4Q7ebAG/VEzonmVr8CFk6YXe+jXN
         W06JSJIyK8g02iwbmqnvaWK7HXlJE0p7Kr92YW24blQoLluhFcvm1UzWcfdHx6Mdh9E3
         XOOQzUfJHlMrFgWO0gIitekddWDl9aJ5BQBVyiZFtwCnwmzu20R18ovjRC2G+D/w+g99
         M1FfmCuusJk2YNOkp6OkdVHAMCjUZdoms1MR0veWZuhlJz5kL9fGMpAA8u0K0cmeYPze
         HHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=tGZGtRLoZzNRBWuDX4atzZ2k0Ip4ycJYdNIYDqARGnc=;
        b=w0K9aACxbhxy7rYhoQn1Vl9jlz2xaix0Em1UoYsdGrH6kn9lzw1Ngh0zTZaltIknOV
         jNT15Rpof0lpgLIYJ3YAL93fhOLYTseIGLYTdB8LWw9E7BVcBhVrcl2UQ3SFUTuMNA3d
         wiZDrdDVlFjSqJEAWK532gGJEiKMx5c3xv230rjm0DaefOkDor2CaFyf1E/Ho54a6tOE
         +BABE5PKcRg8sSLOuPoOm2L7sbZf8pV1I6nPbyt8lNRuloW/jAnpJG3y/4Vzfaavnx6b
         p9CYLnI/n2lw7b2isksbnoFffW9DtVkYsGAT4bxQSwyrCGH0lR+yX1sx4EBjuzxZ2+Dn
         51bQ==
X-Gm-Message-State: AOAM532YbwGBg4Fc86JrxJJHE3g1+RWFw0VZovYTzqs05xOSrrdTo5gv
        n4a85KQYdkrNSaT/hoEcYVuDv55/te4=
X-Google-Smtp-Source: ABdhPJyQYJ0x7OvSRpcYmAQ5BRWQd9bkmRh9jP0168EXXRbBHlQe+/VA1c8Ui0BDQ2o8LiZTwir9hfGFAMI=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:4c72:89be:dba3:2bcb])
 (user=seanjc job=sendgmr) by 2002:a05:6214:2ec:: with SMTP id
 h12mr13351238qvu.1.1632531361061; Fri, 24 Sep 2021 17:56:01 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri, 24 Sep 2021 17:55:28 -0700
In-Reply-To: <20210925005528.1145584-1-seanjc@google.com>
Message-Id: <20210925005528.1145584-15-seanjc@google.com>
Mime-Version: 1.0
References: <20210925005528.1145584-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH 14/14] KVM: x86: Invoke kvm_vcpu_block() directly for
 non-HALTED wait states
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

Call kvm_vcpu_block() directly for all wait states except HALTED so that
kvm_vcpu_halt() is no longer a misnomer on x86.

Functionally, this means KVM will never attempt halt-polling or adjust
vcpu->halt_poll_ns for INIT_RECEIVED (a.k.a. Wait-For-SIPI (WFS)) or
AP_RESET_HOLD; UNINITIALIZED is handled in kvm_arch_vcpu_ioctl_run(),
and x86 doesn't use any other "wait" states.

As mentioned above, the motivation of this is purely so that "halt" isn't
overloaded on x86, e.g. in KVM's stats.  Skipping halt-polling for WFS
(and RESET_HOLD) has no meaningful effect on guest performance as there
are typically single-digit numbers of INIT-SIPI sequences per AP vCPU,
per boot, versus thousands of HLTs just to boot to console.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b444f9315766..a0f313c4bc49 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9893,7 +9893,10 @@ static inline int vcpu_block(struct kvm *kvm, struct kvm_vcpu *vcpu)
 	if (!kvm_arch_vcpu_runnable(vcpu) &&
 	    (!kvm_x86_ops.pre_block || static_call(kvm_x86_pre_block)(vcpu) == 0)) {
 		srcu_read_unlock(&kvm->srcu, vcpu->srcu_idx);
-		kvm_vcpu_halt(vcpu);
+		if (vcpu->arch.mp_state == KVM_MP_STATE_HALTED)
+			kvm_vcpu_halt(vcpu);
+		else
+			kvm_vcpu_block(vcpu);
 		vcpu->srcu_idx = srcu_read_lock(&kvm->srcu);
 
 		if (kvm_x86_ops.post_block)
-- 
2.33.0.685.g46640cef36-goog

