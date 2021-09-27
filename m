Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57AB2419D37
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 19:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236808AbhI0Rqd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 13:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235942AbhI0Rq0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 13:46:26 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB606C01C1C7
        for <linux-mips@vger.kernel.org>; Mon, 27 Sep 2021 10:28:19 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id j15so10832555plh.7
        for <linux-mips@vger.kernel.org>; Mon, 27 Sep 2021 10:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ecZR8501JUA5HjJ4//gNp1dcXa6TfEaO5GlBtu6Su+A=;
        b=GOtOu1nR9l539q+qbEcVbGsMPn51n8QQ32PMYKIi6hIg46kqbYOo+hyGorxaHeXyiT
         V2tIDEC+I97Rg1zmhvPqeSzBeiBlCMUjmjZANJZzM9jX9QQBGLcV5QiWLXLdjVMX2MuS
         sScGZznLE19gExlLe/Ai7FS2B5zHwdMU7MKsUpu1yak92XJeVKQbMEKqZ/hzEY/0boo6
         sDlwFotvdcbYnahoS2c2Z8+mFOK1SJ2AB2kkvp6KT1bpJ8KctGOFh9LaiyRBGQUAyp5S
         j7e9humkRF8Tiv6iuLdNX3komtUTfGZHyDUAJJ18POrEa009r1yW8e9FcOZick20MEx6
         O+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ecZR8501JUA5HjJ4//gNp1dcXa6TfEaO5GlBtu6Su+A=;
        b=wMyOfZtq/FBhoTJ9MrK+vMBDjS/EtgpeqpHhWo8FF/Ayh/1pBaMvtE8KpS8MuzgPVQ
         HA+9lYqV2MDZNl4QqeQGhrScOjLBf8ZzLaY7C9aNe0eKErnHlA6SIsmLrh4E76+7b6kQ
         JwZp28d/tvK85E0CPMCtL342y42kZNkjVd6zF2+zPIQH3QKFqnAVOd5qU+alE8C3d6JW
         RFePud+MV4IXnkqnUjCH4AJGaJnWzy11KmnLWrlNGORrgm63aPoIqBLUJtlx2ohi6Ga0
         NXkafxLrqATQzV6wCPds043Wx+VkQbOU1RddH86XiSueE5LQMh3vd9DLGuMXBPLOPtZQ
         Bz5A==
X-Gm-Message-State: AOAM531luohDfABox/ZV29kIMLwjSOPr4dpzHT81CXVSSLjMD3w2FKAF
        d0mCtwb7n0t1w3K/HB7MBj2kYw==
X-Google-Smtp-Source: ABdhPJxsqRCUhYx/WDAlHwlUhNALt8ImrF7i3ClqjdGVCi9orteLX/2Ra1fBVLm7dJRGmXOdFcEtpg==
X-Received: by 2002:a17:902:9895:b0:13c:94f8:d74b with SMTP id s21-20020a170902989500b0013c94f8d74bmr678633plp.20.1632763698990;
        Mon, 27 Sep 2021 10:28:18 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id c8sm17798035pfj.204.2021.09.27.10.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 10:28:18 -0700 (PDT)
Date:   Mon, 27 Sep 2021 17:28:14 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Matlack <dmatlack@google.com>,
        Jing Zhang <jingzhangos@google.com>
Subject: Re: [PATCH 07/14] KVM: Don't block+unblock when halt-polling is
 successful
Message-ID: <YVH/LjCqk/9PfDHn@google.com>
References: <20210925005528.1145584-1-seanjc@google.com>
 <20210925005528.1145584-8-seanjc@google.com>
 <878rzlass2.wl-maz@kernel.org>
 <80d90ee6-0d43-3735-5c26-be8c3d72d493@redhat.com>
 <877df3btgb.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877df3btgb.wl-maz@kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 26, 2021, Marc Zyngier wrote:
> On Sun, 26 Sep 2021 07:27:28 +0100,
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> > 
> > On 25/09/21 11:50, Marc Zyngier wrote:
> > >> there is no need for arm64 to put/load
> > >> the vGIC as KVM hasn't relinquished control of the vCPU in any way.
> > > 
> > > This doesn't mean that there is no requirement for any state
> > > change. The put/load on GICv4 is crucial for performance, and the VMCR
> > > resync is a correctness requirement.

Ah crud, I didn't blame that code beforehand, I simply assumed
kvm_arch_vcpu_blocking() was purely for the blocking/schedule() sequence.  The
comment in arm64's kvm_arch_vcpu_blocking() about kvm_arch_vcpu_runnable() makes
more sense now too.

> > I wouldn't even say it's crucial for performance: halt polling cannot
> > work and is a waste of time without (the current implementation of)
> > put/load.
> 
> Not quite. A non-V{LPI,SGI} could still be used as the a wake-up from
> WFI (which is the only reason we end-up on this path). Only LPIs (and
> SGIs on GICv4.1) can be directly injected, meaning that SPIs and PPIs
> still follow the standard SW injection model.
> 
> However, there is still the ICH_VMCR_EL2 requirement (to get the
> up-to-date priority mask and group enable bits) for SW-injected
> interrupt wake-up to work correctly, and I really don't want to save
> that one eagerly on each shallow exit.

IIUC, VMCR is resident in hardware while the guest is running, and KVM needs to
retrieve the VMCR when processing interrupts to determine if a interrupt is above
the priority threshold.  If that's the case, then IMO handling the VMCR via an
arch hook is unnecessarily fragile, e.g. any generic call that leads to
kvm_arch_vcpu_runnable() needs to know that arm64 lazily retrieves a guest
register.  A better approach for VMCR would be to retrieve the value from
hardware on-demand, e.g. via a hook in vgic_get_vmcr(), so that it's all but
impossible to have bugs where KVM is working with a stale VMCR, e.g.

diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
index 48c6067fc5ec..0784de0c4080 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio.c
@@ -828,6 +828,13 @@ void vgic_set_vmcr(struct kvm_vcpu *vcpu, struct vgic_vmcr *vmcr)
 
 void vgic_get_vmcr(struct kvm_vcpu *vcpu, struct vgic_vmcr *vmcr)
 {
+       if (!vcpu->...->vmcr_available) {
+               preempt_disable();
+               kvm_vgic_vmcr_sync(vcpu);
+               preempt_enable();
+               vcpu->...->vmcr_available = true;
+       }
+
        if (kvm_vgic_global_state.type == VGIC_V2)
                vgic_v2_get_vmcr(vcpu, vmcr);
        else


Regarding vGIC v4, does KVM require it to be resident in hardware while the vCPU
is loaded?  If not, then we could do something like this, which would eliminate
the arch hooks entirely if the VMCR is handled as above.

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index fe102cd2e518..efc862c4d802 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -365,31 +365,6 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
        return kvm_timer_is_pending(vcpu);
 }

-void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
-{
-       /*
-        * If we're about to block (most likely because we've just hit a
-        * WFI), we need to sync back the state of the GIC CPU interface
-        * so that we have the latest PMR and group enables. This ensures
-        * that kvm_arch_vcpu_runnable has up-to-date data to decide
-        * whether we have pending interrupts.
-        *
-        * For the same reason, we want to tell GICv4 that we need
-        * doorbells to be signalled, should an interrupt become pending.
-        */
-       preempt_disable();
-       kvm_vgic_vmcr_sync(vcpu);
-       vgic_v4_put(vcpu, true);
-       preempt_enable();
-}
-
-void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
-{
-       preempt_disable();
-       vgic_v4_load(vcpu);
-       preempt_enable();
-}
-
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
        struct kvm_s2_mmu *mmu;
@@ -697,7 +672,6 @@ static void check_vcpu_requests(struct kvm_vcpu *vcpu)
                        /* The distributor enable bits were changed */
                        preempt_disable();
                        vgic_v4_put(vcpu, false);
-                       vgic_v4_load(vcpu);
                        preempt_enable();
                }

@@ -813,6 +787,13 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
                 */
                preempt_disable();

+               /*
+                * Reload vGIC v4 if necessary, as it may be put on-demand so
+                * that KVM can detect directly injected interrupts, e.g. when
+                * determining if the vCPU is runnable due to a pending event.
+                */
+               vgic_v4_load(vcpu);
+
                kvm_pmu_flush_hwstate(vcpu);

                local_irq_disable();
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 5dad4996cfb2..3ef360a20a22 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -969,6 +969,16 @@ int kvm_vgic_vcpu_pending_irq(struct kvm_vcpu *vcpu)

        vgic_get_vmcr(vcpu, &vmcr);

+       /*
+        * Tell GICv4 that we need doorbells to be signalled, should an
+        * interrupt become pending.
+        */
+       if (vcpu->arch.vgic_cpu.vgic_v3.its_vpe.vpe_resident) {
+               preempt_disable();
+               vgic_v4_put(vcpu, true);
+               preempt_enable();
+       }
+
        raw_spin_lock_irqsave(&vgic_cpu->ap_list_lock, flags);

        list_for_each_entry(irq, &vgic_cpu->ap_list_head, ap_list) {
