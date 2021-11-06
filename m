Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F311A446DB1
	for <lists+linux-mips@lfdr.de>; Sat,  6 Nov 2021 12:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbhKFLv2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Nov 2021 07:51:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:36922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229968AbhKFLv2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 6 Nov 2021 07:51:28 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 480FD60E05;
        Sat,  6 Nov 2021 11:48:47 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mjKBg-003oWA-Ui; Sat, 06 Nov 2021 11:48:45 +0000
Date:   Sat, 06 Nov 2021 11:48:39 +0000
Message-ID: <87mtmhec88.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Sean Christopherson <seanjc@google.com>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, linuxppc-dev@lists.ozlabs.org,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Juergen Gross <jgross@suse.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        kernel-team@android.com
Subject: Re: [PATCH 5/5] KVM: Convert the kvm->vcpus array to a xarray
In-Reply-To: <YYWSUJ1qzhfqjQow@google.com>
References: <20211105192101.3862492-1-maz@kernel.org>
        <20211105192101.3862492-6-maz@kernel.org>
        <YYWSUJ1qzhfqjQow@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: seanjc@google.com, kvm@vger.kernel.org, linux-mips@vger.kernel.org, kvmarm@lists.cs.columbia.edu, linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, anup.patel@wdc.com, atish.patra@wdc.com, borntraeger@de.ibm.com, frankja@linux.ibm.com, david@redhat.com, imbrenda@linux.ibm.com, pbonzini@redhat.com, jgross@suse.com, npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au, james.morse@arm.com, suzuki.poulose@arm.com, alexandru.elisei@arm.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 05 Nov 2021 20:21:36 +0000,
Sean Christopherson <seanjc@google.com> wrote:
> 
> On Fri, Nov 05, 2021, Marc Zyngier wrote:
> > At least on arm64 and x86, the vcpus array is pretty huge (512 entries),
> > and is mostly empty in most cases (running 512 vcpu VMs is not that
> > common). This mean that we end-up with a 4kB block of unused memory
> > in the middle of the kvm structure.
> 
> Heh, x86 is now up to 1024 entries.

Humph. I don't want to know whether people are actually using that in
practice. The only time I create VMs with 512 vcpus is to check
whether it still works...

>  
> > Instead of wasting away this memory, let's use an xarray instead,
> > which gives us almost the same flexibility as a normal array, but
> > with a reduced memory usage with smaller VMs.
> > 
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> > @@ -693,7 +694,7 @@ static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
> >  
> >  	/* Pairs with smp_wmb() in kvm_vm_ioctl_create_vcpu.  */
> >  	smp_rmb();
> > -	return kvm->vcpus[i];
> > +	return xa_load(&kvm->vcpu_array, i);
> >  }
> 
> It'd be nice for this series to convert kvm_for_each_vcpu() to use
> xa_for_each() as well.  Maybe as a patch on top so that potential
> explosions from that are isolated from the initiali conversion?
> 
> Or maybe even use xa_for_each_range() to cap at online_vcpus?
> That's technically a functional change, but IMO it's easier to
> reason about iterating over a snapshot of vCPUs as opposed to being
> able to iterate over vCPUs as their being added.  In practice I
> doubt it matters.
> 
> #define kvm_for_each_vcpu(idx, vcpup, kvm) \
> 	xa_for_each_range(&kvm->vcpu_array, idx, vcpup, 0, atomic_read(&kvm->online_vcpus))
>

I think that's already the behaviour of this iterator (we stop at the
first empty slot capped to online_vcpus. The only change in behaviour
is that vcpup currently holds a pointer to the last vcpu in no empty
slot has been encountered. xa_for_each{,_range}() would set the
pointer to NULL at all times.

I doubt anyone relies on that, but it is probably worth eyeballing
some of the use cases...

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
