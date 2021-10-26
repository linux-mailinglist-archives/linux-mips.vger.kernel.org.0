Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6508143B5D9
	for <lists+linux-mips@lfdr.de>; Tue, 26 Oct 2021 17:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237073AbhJZPnk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Oct 2021 11:43:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:47404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237087AbhJZPnc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 Oct 2021 11:43:32 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9634460EFF;
        Tue, 26 Oct 2021 15:41:08 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mfOZW-001iWu-7f; Tue, 26 Oct 2021 16:41:06 +0100
Date:   Tue, 26 Oct 2021 16:41:05 +0100
Message-ID: <875ytjbxpq.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Sean Christopherson <seanjc@google.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Atish Patra <atish.patra@wdc.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
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
Subject: Re: [PATCH v2 10/43] KVM: arm64: Move vGIC v4 handling for WFI out arch callback hook
In-Reply-To: <9236e715-c471-e1c8-6117-6f37b908a6bd@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
        <20211009021236.4122790-11-seanjc@google.com>
        <9236e715-c471-e1c8-6117-6f37b908a6bd@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, seanjc@google.com, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, paulus@ozlabs.org, anup.patel@wdc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, borntraeger@de.ibm.com, frankja@linux.ibm.com, james.morse@arm.com, alexandru.elisei@arm.com, suzuki.poulose@arm.com, atish.patra@wdc.com, david@redhat.com, cohuck@redhat.com, imbrenda@linux.ibm.com, vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, dmatlack@google.com, oupton@google.com, jingzhangos@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 25 Oct 2021 14:31:48 +0100,
Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> On 09/10/21 04:12, Sean Christopherson wrote:
> > Move the put and reload of the vGIC out of the block/unblock callbacks
> > and into a dedicated WFI helper.  Functionally, this is nearly a nop as
> > the block hook is called at the very beginning of kvm_vcpu_block(), and
> > the only code in kvm_vcpu_block() after the unblock hook is to update the
> > halt-polling controls, i.e. can only affect the next WFI.
> > 
> > Back when the arch (un)blocking hooks were added by commits 3217f7c25bca
> > ("KVM: Add kvm_arch_vcpu_{un}blocking callbacks) and d35268da6687
> > ("arm/arm64: KVM: arch_timer: Only schedule soft timer on vcpu_block"),
> > the hooks were invoked only when KVM was about to "block", i.e. schedule
> > out the vCPU.  The use case at the time was to schedule a timer in the
> > host based on the earliest timer in the guest in order to wake the
> > blocking vCPU when the emulated guest timer fired.  Commit accb99bcd0ca
> > ("KVM: arm/arm64: Simplify bg_timer programming") reworked the timer
> > logic to be even more precise, by waiting until the vCPU was actually
> > scheduled out, and so move the timer logic from the (un)blocking hooks to
> > vcpu_load/put.
> > 
> > In the meantime, the hooks gained usage for enabling vGIC v4 doorbells in
> > commit df9ba95993b9 ("KVM: arm/arm64: GICv4: Use the doorbell interrupt
> > as an unblocking source"), and added related logic for the VMCR in commit
> > 5eeaf10eec39 ("KVM: arm/arm64: Sync ICH_VMCR_EL2 back when about to block").
> > 
> > Finally, commit 07ab0f8d9a12 ("KVM: Call kvm_arch_vcpu_blocking early
> > into the blocking sequence") hoisted the (un)blocking hooks so that they
> > wrapped KVM's halt-polling logic in addition to the core "block" logic.
> > 
> > In other words, the original need for arch hooks to take action _only_
> > in the block path is long since gone.
> > 
> > Cc: Oliver Upton <oupton@google.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> This needs a word on why kvm_psci_vcpu_suspend does not need the
> hooks.  Or it needs to be changed to also use kvm_vcpu_wfi in the PSCI
> code, I don't know.
> 
> Marc, can you review and/or advise?

I was looking at that over the weekend, and that's a pre-existing
bug. I would have addressed it independently, but it looks like you
already have queued the patch.

I guess I'll have to revisit this once the whole thing lands
somewhere.

	M.

-- 
Without deviation from the norm, progress is not possible.
