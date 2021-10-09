Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8366D427672
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244662AbhJICT3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244364AbhJICTG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:19:06 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F53C0612EF
        for <linux-mips@vger.kernel.org>; Fri,  8 Oct 2021 19:14:25 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id b5-20020a251b05000000b005b575f23711so15171621ybb.4
        for <linux-mips@vger.kernel.org>; Fri, 08 Oct 2021 19:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=AlVgPkgkFYp3mdA0c8FeIFPE9R3iQYYLs6SQdF7DS7Y=;
        b=iyDWCxyALAJzTmrUWpKD0hm+MQGe0JbvQFQ+gPVY/mUdPcOBuJRTdijBOEaFZ+LAAb
         SDTgJ4oxCKVVc0nNYZIMuAMtCs0uQECNKotNLEWLcodTtHGOERifCGz75XQaYTAh1vxX
         neHo9EJwZRaNOXzY5g4EMe8hM39Md1Iy0bRnoPVZCfJilexl2bbxOCi5VnE5sdolV6eU
         NSIZQhgHuO3ZxoxUovFoBRAFe5hP7ZvZYuCsNm5sISOiG6xvPYGa1WB0B6RyfZX8HQo6
         K97euHgjPX8JD6ljBA2834wXcBVVic3DkNPl89wT3euIRZ1CjF3KG79BaaaEoSx95D/a
         coZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=AlVgPkgkFYp3mdA0c8FeIFPE9R3iQYYLs6SQdF7DS7Y=;
        b=62cMvO0XmuHQJRCRUeIFCuc8rCh06jnyylYhC9SaNW518foLJZ8Fr+rT6UYC529ZBU
         f6QlD1XH3P06I3OZoWGVCUXkDu8+F7XOHZQrig6g1If3TeJJ4YCREeFZgQNLyu9QpppO
         XT05TOq3a87OvJHD3XIIzYtQeNCDwBXRZ8ad4KVN6RftR6JVoLjrlpcTcT8gWYR6nAuI
         0XLtcWbWrVvHiSSYnkm/5a/UZy1ECn8lOlDrGBHlfpodi5Q9LM/LcncU8kwvJcObE5VN
         NA2WDxK3otzyrvkzkUjeaJyvKuT5dljbR2VF+odgq3BFsiRbnFf1jHVRdgitHh9EV84H
         n9RA==
X-Gm-Message-State: AOAM533VbGzLDJ/EheiUQPlYyYAu9yPPal4gKm0vdLdgL/O+z5Q3FcHy
        +U8x6tvsC2aHgRz2g6SJzgGgZgY2GLY=
X-Google-Smtp-Source: ABdhPJwCGOH/vSNpBFtQULwIni84FKIaJWE8Z3rFyAmS2+NcdTac9rCKWh3u0VdnxrDvnUeBFYVQOv64tnI=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:6908:: with SMTP id e8mr6568722ybc.337.1633745664741;
 Fri, 08 Oct 2021 19:14:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri,  8 Oct 2021 19:12:35 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-43-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 42/43] KVM: VMX: Fold fallback path into triggering posted
 IRQ helper
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

Move the fallback "wake_up" path into the helper to trigger posted
interrupt helper now that the nested and non-nested paths are identical.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index f505fee3cf5c..b0d97cf18c34 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -3927,7 +3927,7 @@ static void vmx_msr_filter_changed(struct kvm_vcpu *vcpu)
 	pt_update_intercept_for_msr(vcpu);
 }
 
-static inline bool kvm_vcpu_trigger_posted_interrupt(struct kvm_vcpu *vcpu,
+static inline void kvm_vcpu_trigger_posted_interrupt(struct kvm_vcpu *vcpu,
 						     int pi_vec)
 {
 #ifdef CONFIG_SMP
@@ -3958,10 +3958,15 @@ static inline bool kvm_vcpu_trigger_posted_interrupt(struct kvm_vcpu *vcpu,
 		 */
 
 		apic->send_IPI_mask(get_cpu_mask(vcpu->cpu), pi_vec);
-		return true;
+		return;
 	}
 #endif
-	return false;
+	/*
+	 * The vCPU isn't in the guest; wake the vCPU in case it is blocking,
+	 * otherwise do nothing as KVM will grab the highest priority pending
+	 * IRQ via ->sync_pir_to_irr() in vcpu_enter_guest().
+	 */
+	kvm_vcpu_wake_up(vcpu);
 }
 
 static int vmx_deliver_nested_posted_interrupt(struct kvm_vcpu *vcpu,
@@ -3984,8 +3989,7 @@ static int vmx_deliver_nested_posted_interrupt(struct kvm_vcpu *vcpu,
 		 */
 		kvm_make_request(KVM_REQ_EVENT, vcpu);
 		/* the PIR and ON have been set by L1. */
-		if (!kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_NESTED_VECTOR))
-			kvm_vcpu_wake_up(vcpu);
+		kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_NESTED_VECTOR);
 		return 0;
 	}
 	return -1;
@@ -4022,9 +4026,7 @@ static int vmx_deliver_posted_interrupt(struct kvm_vcpu *vcpu, int vector)
 	 * guaranteed to see PID.ON=1 and sync the PIR to IRR if triggering a
 	 * posted interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
 	 */
-	if (!kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_VECTOR))
-		kvm_vcpu_wake_up(vcpu);
-
+	kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_VECTOR);
 	return 0;
 }
 
-- 
2.33.0.882.g93a45727a2-goog

