Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A63D153A78
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 22:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgBEVt7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Feb 2020 16:49:59 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54857 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727033AbgBEVt7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Feb 2020 16:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580939398;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hzR+kWwgje3yUYdtQN4kRBB1wzrOCH+ul+GIZRQLQpQ=;
        b=GAZX1AO6vxWI1kJq2ZWQp+XO2TEPz5zKJdOREy9RvqMpBLW5fEE0NgMtrZPc0YiEY5xs5w
        SuGAyiN0QyJ9l5mekU2sEafMSNZmdfY5jz7uVJ6ExyhgbdCUnnhDGpvTzMz1+kQFPVPLBU
        Vu2osxOCctN+MBE87UtZkrz+xLWBxj0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-S1wkYDKwMIac5N6nx4Ftxg-1; Wed, 05 Feb 2020 16:49:56 -0500
X-MC-Unique: S1wkYDKwMIac5N6nx4Ftxg-1
Received: by mail-qt1-f197.google.com with SMTP id o18so2348580qtt.19
        for <linux-mips@vger.kernel.org>; Wed, 05 Feb 2020 13:49:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hzR+kWwgje3yUYdtQN4kRBB1wzrOCH+ul+GIZRQLQpQ=;
        b=GY+qWCS5nr4+3lFQ2hXeT86TS35Mj5CP2zNiOT3V+6kwCvlA8zuVZaw0gaeerLZaia
         o6DrLuRw2jkBNkJvgZjZNWzaTnAng/I3DcMGQqLIIjb8jn+ipCXRjMrhEZFYDSr+k6aT
         3tRC1e45+HJkJ8EjXxW78k7lefnh5zKjgeLOs7SVFyBHH8v+RtYZ1M+ky0qWdrNalOmq
         toBsFeyRFsMKibLMWgqIOUKTm6k48zqFNzzm2qF1//NFBalnewtFM6PTH3KzCFzEiK84
         UQm/bouEG1l0qYhm7V6ivQetRX/MLQOcwz/5mTdlnILB9+6ESValmMQaRUhDkdsYTkX8
         Nd7w==
X-Gm-Message-State: APjAAAXzne9QzGMV/83QO5OPNHdfhoqG2fgJMkWsqg72HuFi47kye5KN
        c1fQ4Yxa4HzTNF1hATCvvkW62hsesTleldxvX/YrnU5eehD8bd0Q996mejNOAm7ljxCH9EoK965
        NVg+jSIkw/tEIYMdbDSnrXg==
X-Received: by 2002:ac8:3886:: with SMTP id f6mr34654870qtc.160.1580939396215;
        Wed, 05 Feb 2020 13:49:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqy5rpTfXYiWMOZY+w99nw37RTfo9i89EWpQ1VoSvOcWQbgR5Y78NjhhnEKvcMCS6bstDLPhlA==
X-Received: by 2002:ac8:3886:: with SMTP id f6mr34654854qtc.160.1580939395875;
        Wed, 05 Feb 2020 13:49:55 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
        by smtp.gmail.com with ESMTPSA id x11sm472147qkf.50.2020.02.05.13.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 13:49:55 -0800 (PST)
Date:   Wed, 5 Feb 2020 16:49:52 -0500
From:   Peter Xu <peterx@redhat.com>
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
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
Subject: Re: [PATCH v5 01/19] KVM: x86: Allocate new rmap and large page
 tracking when moving memslot
Message-ID: <20200205214952.GD387680@xz-x1>
References: <20200121223157.15263-1-sean.j.christopherson@intel.com>
 <20200121223157.15263-2-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200121223157.15263-2-sean.j.christopherson@intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 21, 2020 at 02:31:39PM -0800, Sean Christopherson wrote:
> Reallocate a rmap array and recalcuate large page compatibility when
> moving an existing memslot to correctly handle the alignment properties
> of the new memslot.  The number of rmap entries required at each level
> is dependent on the alignment of the memslot's base gfn with respect to
> that level, e.g. moving a large-page aligned memslot so that it becomes
> unaligned will increase the number of rmap entries needed at the now
> unaligned level.
> 
> Not updating the rmap array is the most obvious bug, as KVM accesses
> garbage data beyond the end of the rmap.  KVM interprets the bad data as
> pointers, leading to non-canonical #GPs, unexpected #PFs, etc...
> 
>   general protection fault: 0000 [#1] SMP
>   CPU: 0 PID: 1909 Comm: move_memory_reg Not tainted 5.4.0-rc7+ #139
>   Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
>   RIP: 0010:rmap_get_first+0x37/0x50 [kvm]
>   Code: <48> 8b 3b 48 85 ff 74 ec e8 6c f4 ff ff 85 c0 74 e3 48 89 d8 5b c3
>   RSP: 0018:ffffc9000021bbc8 EFLAGS: 00010246
>   RAX: ffff00617461642e RBX: ffff00617461642e RCX: 0000000000000012
>   RDX: ffff88827400f568 RSI: ffffc9000021bbe0 RDI: ffff88827400f570
>   RBP: 0010000000000000 R08: ffffc9000021bd00 R09: ffffc9000021bda8
>   R10: ffffc9000021bc48 R11: 0000000000000000 R12: 0030000000000000
>   R13: 0000000000000000 R14: ffff88827427d700 R15: ffffc9000021bce8
>   FS:  00007f7eda014700(0000) GS:ffff888277a00000(0000) knlGS:0000000000000000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: 00007f7ed9216ff8 CR3: 0000000274391003 CR4: 0000000000162eb0
>   Call Trace:
>    kvm_mmu_slot_set_dirty+0xa1/0x150 [kvm]
>    __kvm_set_memory_region.part.64+0x559/0x960 [kvm]
>    kvm_set_memory_region+0x45/0x60 [kvm]
>    kvm_vm_ioctl+0x30f/0x920 [kvm]
>    do_vfs_ioctl+0xa1/0x620
>    ksys_ioctl+0x66/0x70
>    __x64_sys_ioctl+0x16/0x20
>    do_syscall_64+0x4c/0x170
>    entry_SYSCALL_64_after_hwframe+0x44/0xa9
>   RIP: 0033:0x7f7ed9911f47
>   Code: <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 21 6f 2c 00 f7 d8 64 89 01 48
>   RSP: 002b:00007ffc00937498 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>   RAX: ffffffffffffffda RBX: 0000000001ab0010 RCX: 00007f7ed9911f47
>   RDX: 0000000001ab1350 RSI: 000000004020ae46 RDI: 0000000000000004
>   RBP: 000000000000000a R08: 0000000000000000 R09: 00007f7ed9214700
>   R10: 00007f7ed92149d0 R11: 0000000000000246 R12: 00000000bffff000
>   R13: 0000000000000003 R14: 00007f7ed9215000 R15: 0000000000000000
>   Modules linked in: kvm_intel kvm irqbypass
>   ---[ end trace 0c5f570b3358ca89 ]---
> 
> The disallow_lpage tracking is more subtle.  Failure to update results
> in KVM creating large pages when it shouldn't, either due to stale data
> or again due to indexing beyond the end of the metadata arrays, which
> can lead to memory corruption and/or leaking data to guest/userspace.
> 
> Note, the arrays for the old memslot are freed by the unconditional call
> to kvm_free_memslot() in __kvm_set_memory_region().

If __kvm_set_memory_region() failed, I think the old memslot will be
kept and the new memslot will be freed instead?

> 
> Fixes: 05da45583de9b ("KVM: MMU: large page support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> ---
>  arch/x86/kvm/x86.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 4c30ebe74e5d..1953c71c52f2 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9793,6 +9793,13 @@ int kvm_arch_create_memslot(struct kvm *kvm, struct kvm_memory_slot *slot,
>  {
>  	int i;
>  
> +	/*
> +	 * Clear out the previous array pointers for the KVM_MR_MOVE case.  The
> +	 * old arrays will be freed by __kvm_set_memory_region() if installing
> +	 * the new memslot is successful.
> +	 */
> +	memset(&slot->arch, 0, sizeof(slot->arch));

I actually gave r-b on this patch but it was lost... And then when I
read it again I start to confuse on why we need to set these to zeros.
Even if they're not zeros, iiuc kvm_free_memslot() will compare each
of the array pointer and it will only free the changed pointers, then
it looks fine even without zeroing?

> +
>  	for (i = 0; i < KVM_NR_PAGE_SIZES; ++i) {
>  		struct kvm_lpage_info *linfo;
>  		unsigned long ugfn;
> @@ -9867,6 +9874,10 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>  				const struct kvm_userspace_memory_region *mem,
>  				enum kvm_mr_change change)
>  {
> +	if (change == KVM_MR_MOVE)
> +		return kvm_arch_create_memslot(kvm, memslot,
> +					       mem->memory_size >> PAGE_SHIFT);
> +

Instead of calling kvm_arch_create_memslot() explicitly again here,
can it be replaced by below?

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 72b45f491692..85a7b02fd752 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1144,7 +1144,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
                new.dirty_bitmap = NULL;
 
        r = -ENOMEM;
-       if (change == KVM_MR_CREATE) {
+       if (change == KVM_MR_CREATE || change == KVM_MR_MOVE) {
                new.userspace_addr = mem->userspace_addr;
 
                if (kvm_arch_create_memslot(kvm, &new, npages))

>  	return 0;
>  }
>  
> -- 
> 2.24.1
> 

-- 
Peter Xu

