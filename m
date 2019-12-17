Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B975E123807
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2019 21:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfLQUsY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Dec 2019 15:48:24 -0500
Received: from mga18.intel.com ([134.134.136.126]:17016 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726608AbfLQUsY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 17 Dec 2019 15:48:24 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Dec 2019 12:48:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; 
   d="scan'208";a="247621238"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com) ([10.54.74.202])
  by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2019 12:48:22 -0800
Date:   Tue, 17 Dec 2019 12:48:22 -0800
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     James Hogan <jhogan@kernel.org>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org,
        Christoffer Dall <christoffer.dall@arm.com>,
        Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 01/19] KVM: x86: Allocate new rmap and large page
 tracking when moving memslot
Message-ID: <20191217204822.GC8052@linux.intel.com>
References: <20191217204041.10815-1-sean.j.christopherson@intel.com>
 <20191217204041.10815-2-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217204041.10815-2-sean.j.christopherson@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Dropping non-x86 folks...

This should be included in 5.5 if possible even though the bug has existed
for over a decade.  It's trivially easy for a malicious userspace to
crash KVM and hang the host.  Depending how userspace VMM behavior, it may
even be possible to trigger from a guest.

On Tue, Dec 17, 2019 at 12:40:23PM -0800, Sean Christopherson wrote:
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
> 
> Fixes: 05da45583de9b ("KVM: MMU: large page support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> ---
>  arch/x86/kvm/x86.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 8bb2fb1705ff..04d1bf89da0e 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9703,6 +9703,13 @@ int kvm_arch_create_memslot(struct kvm *kvm, struct kvm_memory_slot *slot,
>  {
>  	int i;
>  
> +	/*
> +	 * Clear out the previous array pointers for the KVM_MR_MOVE case.  The
> +	 * old arrays will be freed by __kvm_set_memory_region() if installing
> +	 * the new memslot is successful.
> +	 */
> +	memset(&slot->arch, 0, sizeof(slot->arch));
> +
>  	for (i = 0; i < KVM_NR_PAGE_SIZES; ++i) {
>  		struct kvm_lpage_info *linfo;
>  		unsigned long ugfn;
> @@ -9777,6 +9784,10 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>  				const struct kvm_userspace_memory_region *mem,
>  				enum kvm_mr_change change)
>  {
> +	if (change == KVM_MR_MOVE)
> +		return kvm_arch_create_memslot(kvm, memslot,
> +					       mem->memory_size >> PAGE_SHIFT);
> +
>  	return 0;
>  }
>  
> -- 
> 2.24.1
> 
