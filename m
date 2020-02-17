Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8C7161653
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2020 16:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgBQPjt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Feb 2020 10:39:49 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:47132 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728000AbgBQPjt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 17 Feb 2020 10:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581953988;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jKEw/9LD4IB/V5V6URoGZRoG+mly6ja1ybw5s5Rs0Gw=;
        b=ISFR4S7u1dCY66RN3q24NIT9PXAaw4AeSlWo/iAOkN3KpW6hChHG0Mz03NxkQLfJNyAU83
        sYOG3LwRFJojqRHMq5JOekRgQXAqYKNHd10mucuPV11qgwNWLB966EcrEQ2zfdGw1AFgek
        eZOJQhCaNhaduGCoKZ9UcW10mDsV2Lw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-A0ah6xWoNGG6g8WKuNqnig-1; Mon, 17 Feb 2020 10:39:43 -0500
X-MC-Unique: A0ah6xWoNGG6g8WKuNqnig-1
Received: by mail-wr1-f70.google.com with SMTP id o6so9096841wrp.8
        for <linux-mips@vger.kernel.org>; Mon, 17 Feb 2020 07:39:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=jKEw/9LD4IB/V5V6URoGZRoG+mly6ja1ybw5s5Rs0Gw=;
        b=p7DyIJStBJxNnXz9W7U7fqqTZgH85vtzGMYs5K9npUzkfB9PvhYjWLs+Ugc2d2SSKx
         /cU/34a9w28fv8V7n8zZP8nluc3L3MUrzQrPXsDx0BBNSKRTXBQiaJABVShOuAmIslr5
         rtr6X/IZnuLgiA++6pHXC7iGJM1uS3iM76h3DGTQTQb2CZs0fWHgDG6cljsTo40fVTqq
         i2gFYAW2vFspid7I0qv+51Kr+M2GEwTGIEoE/9AieGZXaZTkm7s8H2JP9AQeajtSQAJb
         +U1pnYZzBR0qbkQbKWR1PRCn66d74rXEygqQLB1ZWPRwb8KRbKIKdofyZjsupFK7BKoT
         d1cQ==
X-Gm-Message-State: APjAAAW4tYqGrdQkzKt0BpJ/iEwmp6uND+UQJVkvlndY+D5PwF8fRdXV
        8/nMdeA6V8k5RXn1S8eG8cu7qyvWh7adu8MvANciwHpCj5YwnuBMr7UNFfeUHnmUa/TprrSBnw6
        dTYo7+ceOJ7+esP3vWqof9Q==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr22758263wmb.73.1581953981722;
        Mon, 17 Feb 2020 07:39:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqw3F+p2TnTlGe9QutjrXQ9bs2FRZYLz6SXUgX3NY1Zh+sHedC61NY/0mD2N7zoHzN71kac2NA==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr22758229wmb.73.1581953981434;
        Mon, 17 Feb 2020 07:39:41 -0800 (PST)
Received: from vitty.brq.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id x10sm1402119wrv.60.2020.02.17.07.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 07:39:40 -0800 (PST)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     Sean Christopherson <sean.j.christopherson@intel.com>,
        Peter Xu <peterx@redhat.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org,
        Christoffer Dall <christoffer.dall@arm.com>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 15/19] KVM: Provide common implementation for generic dirty log functions
In-Reply-To: <20200208012938.GC15581@linux.intel.com>
References: <20200121223157.15263-1-sean.j.christopherson@intel.com> <20200121223157.15263-16-sean.j.christopherson@intel.com> <20200206200200.GC700495@xz-x1> <20200206212120.GF13067@linux.intel.com> <20200206214106.GG700495@xz-x1> <20200207194532.GK2401@linux.intel.com> <20200208001832.GA823968@xz-x1> <20200208004233.GA15581@linux.intel.com> <20200208005334.GB823968@xz-x1> <20200208012938.GC15581@linux.intel.com>
Date:   Mon, 17 Feb 2020 16:39:39 +0100
Message-ID: <87sgj99q9w.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Sean Christopherson <sean.j.christopherson@intel.com> writes:

> On Fri, Feb 07, 2020 at 07:53:34PM -0500, Peter Xu wrote:
>> On Fri, Feb 07, 2020 at 04:42:33PM -0800, Sean Christopherson wrote:
>> > On Fri, Feb 07, 2020 at 07:18:32PM -0500, Peter Xu wrote:
>> > > On Fri, Feb 07, 2020 at 11:45:32AM -0800, Sean Christopherson wrote:
>> > > > +Vitaly for HyperV
>> > > > 
>> > > > On Thu, Feb 06, 2020 at 04:41:06PM -0500, Peter Xu wrote:
>> > > > > On Thu, Feb 06, 2020 at 01:21:20PM -0800, Sean Christopherson wrote:
>> > > > > > On Thu, Feb 06, 2020 at 03:02:00PM -0500, Peter Xu wrote:
>> > > > > > > But that matters to this patch because if MIPS can use
>> > > > > > > kvm_flush_remote_tlbs(), then we probably don't need this
>> > > > > > > arch-specific hook any more and we can directly call
>> > > > > > > kvm_flush_remote_tlbs() after sync dirty log when flush==true.
>> > > > > > 
>> > > > > > Ya, the asid_flush_mask in kvm_vz_flush_shadow_all() is the only thing
>> > > > > > that prevents calling kvm_flush_remote_tlbs() directly, but I have no
>> > > > > > clue as to the important of that code.
>> > > > > 
>> > > > > As said above I think the x86 lockdep is really not necessary, then
>> > > > > considering MIPS could be the only one that will use the new hook
>> > > > > introduced in this patch...  Shall we figure that out first?
>> > > > 
>> > > > So I prepped a follow-up patch to make kvm_arch_dirty_log_tlb_flush() a
>> > > > MIPS-only hook and use kvm_flush_remote_tlbs() directly for arm and x86,
>> > > > but then I realized x86 *has* a hook to do a precise remote TLB flush.
>> > > > There's even an existing kvm_flush_remote_tlbs_with_address() call on a
>> > > > memslot, i.e. this exact scenario.  So arguably, x86 should be using the
>> > > > more precise flush and should keep kvm_arch_dirty_log_tlb_flush().
>> > > > 
>> > > > But, the hook is only used when KVM is running as an L1 on top of HyperV,
>> > > > and I assume dirty logging isn't used much, if at all, for L1 KVM on
>> > > > HyperV?
>> > > > 
>> > > > I see three options:
>> > > > 
>> > > >   1. Make kvm_arch_dirty_log_tlb_flush() MIPS-only and call
>> > > >      kvm_flush_remote_tlbs() directly for arm and x86.  Add comments to
>> > > >      explain when an arch should implement kvm_arch_dirty_log_tlb_flush().
>> > > > 
>> > > >   2. Change x86 to use kvm_flush_remote_tlbs_with_address() when flushing
>> > > >      a memslot after the dirty log is grabbed by userspace.
>> > > > 
>> > > >   3. Keep the resulting code as is, but add a comment in x86's
>> > > >      kvm_arch_dirty_log_tlb_flush() to explain why it uses
>> > > >      kvm_flush_remote_tlbs() instead of the with_address() variant.
>> > > > 
>> > > > I strongly prefer to (2) or (3), but I'll defer to Vitaly as to which of
>> > > > those is preferable.
>> > > > 
>> > > > I don't like (1) because (a) it requires more lines code (well comments),
>> > > > to explain why kvm_flush_remote_tlbs() is the default, and (b) it would
>> > > > require even more comments, which would be x86-specific in generic KVM,
>> > > > to explain why x86 doesn't use its with_address() flush, or we'd lost that
>> > > > info altogether.
>> > > > 
>> > > 
>> > > I proposed the 4th solution here:
>> > > 
>> > > https://lore.kernel.org/kvm/20200207223520.735523-1-peterx@redhat.com/
>> > > 
>> > > I'm not sure whether that's acceptable, but if it can, then we can
>> > > drop the kvm_arch_dirty_log_tlb_flush() hook, or even move on to
>> > > per-slot tlb flushing.
>> > 
>> > This effectively is per-slot TLB flushing, it just has a different name.
>> > I.e. s/kvm_arch_dirty_log_tlb_flush/kvm_arch_flush_remote_tlbs_memslot.
>> > I'm not opposed to that name change.  And on second and third glance, I
>> > probably prefer it.  That would more or less follow the naming of
>> > kvm_arch_flush_shadow_all() and kvm_arch_flush_shadow_memslot().
>> 
>> Note that the major point of the above patchset is not about doing tlb
>> flush per-memslot or globally.  It's more about whether we can provide
>> a common entrance for TLB flushing.  Say, after that series, we should
>> be able to flush TLB on all archs (majorly, including MIPS) as:
>> 
>>   kvm_flush_remote_tlbs(kvm);
>> 
>> And with the same idea we can also introduce the ranged version.
>> 
>> > 
>> > I don't want to go straight to kvm_arch_flush_remote_tlb_with_address()
>> > because that loses the important distinction (on x86) that slots_lock is
>> > expected to be held.
>> 
>> Sorry I'm still puzzled on why that lockdep is so important and
>> special for x86...  For example, what if we move that lockdep to the
>> callers of the kvm_arch_dirty_log_tlb_flush() calls so it protects
>> even more arch (where we do get/clear dirty log)?  IMHO the callers
>> must be with the slots_lock held anyways no matter for x86 or not.
>
>
> Following the breadcrumbs leads to the comment in
> kvm_mmu_slot_remove_write_access(), which says:
>
>         /*
>          * kvm_mmu_slot_remove_write_access() and kvm_vm_ioctl_get_dirty_log()
>          * which do tlb flush out of mmu-lock should be serialized by
>          * kvm->slots_lock otherwise tlb flush would be missed.
>          */
>
> I.e. write-protecting a memslot and grabbing the dirty log for the memslot
> need to be serialized.  It's quite obvious *now* that get_dirty_log() holds
> slots_lock, but the purpose of lockdep assertions isn't just to verify the
> current functionality, it's to help ensure the correctness for future code
> and to document assumptions in the code.
>
> Digging deeper, there are four functions, all related to dirty logging, in
> the x86 mmu that basically open code what x86's
> kvm_arch_flush_remote_tlbs_memslot() would look like if it uses the range
> based flushing.
>
> Unless it's functionally incorrect (Vitaly?), going with option (2) and
> naming the hook kvm_arch_flush_remote_tlbs_memslot() seems like the obvious
> choice, e.g. the final cleanup gives this diff stat:

(I apologize again for not replying in time)

I think this is a valid approach and your option (2) would also be my
choice. I also don't think there's going to be a problem when (if)
Hyper-V adds support for PML (eVMCSv2?).

>
>  arch/x86/kvm/mmu/mmu.c | 34 +++++++++-------------------------
>  1 file changed, 9 insertions(+), 25 deletions(-)
>

Looks nice :-)

-- 
Vitaly

