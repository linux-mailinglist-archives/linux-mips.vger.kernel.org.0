Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2C4C6487C7
	for <lists+linux-mips@lfdr.de>; Fri,  9 Dec 2022 18:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbiLIRba (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Dec 2022 12:31:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbiLIRb3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Dec 2022 12:31:29 -0500
X-Greylist: delayed 386 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 09 Dec 2022 09:31:28 PST
Received: from out-62.mta0.migadu.com (out-62.mta0.migadu.com [91.218.175.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E70861B98
        for <linux-mips@vger.kernel.org>; Fri,  9 Dec 2022 09:31:28 -0800 (PST)
Date:   Fri, 9 Dec 2022 17:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1670606700;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sbHd3TvFPLETZHNVBUCcer9R9cb69+aHOJviFvExi4Y=;
        b=myof8e9+vePyEh1XAVMIRcDm8q1jyelUp0oMG47QgTKeMP8Ad9MLe/+7riFT55TVEnMYX8
        7B84ih0UqSmmSzalw4eYcdn7TGzMbR//yFaIlKDe2lSOL8s23+xUh0Njytzg/zI8dV/8zF
        cfDPbjEUYbw41qF2SIUp1mnpdTfjg4Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Oliver Upton <oliver.upton@linux.dev>
To:     "Yang, Weijiang" <weijiang.yang@intel.com>
Cc:     David Matlack <dmatlack@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Christopherson,, Sean" <seanjc@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        "Amit, Nadav" <namit@vmware.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
        Colin Cross <ccross@google.com>,
        Hugh Dickins <hughd@google.com>,
        Ben Gardon <bgardon@google.com>,
        Mingwei Zhang <mizhang@google.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>,
        Ricardo Koller <ricarkol@google.com>,
        Jing Zhang <jingzhangos@google.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
        "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
Message-ID: <Y5NvYmxpy6BPkmpW@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22fe2332-497e-fe30-0155-e026b0eded97@intel.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Dec 09, 2022 at 10:37:47AM +0800, Yang, Weijiang wrote:
> 
> On 12/9/2022 3:38 AM, David Matlack wrote:
> > Rename kvm_mmu_page_role.smm with kvm_mmu_page_role.as_id and use it
> > directly as the address space ID throughout the KVM MMU code. This
> > eliminates a needless level of indirection, kvm_mmu_role_as_id(), and
> > prepares for making kvm_mmu_page_role architecture-neutral.
> > 
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >   arch/x86/include/asm/kvm_host.h |  4 ++--
> >   arch/x86/kvm/mmu/mmu.c          |  6 +++---
> >   arch/x86/kvm/mmu/mmu_internal.h | 10 ----------
> >   arch/x86/kvm/mmu/tdp_iter.c     |  2 +-
> >   arch/x86/kvm/mmu/tdp_mmu.c      | 12 ++++++------
> >   5 files changed, 12 insertions(+), 22 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index aa4eb8cfcd7e..0a819d40131a 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -348,7 +348,7 @@ union kvm_mmu_page_role {
> >   		 * simple shift.  While there is room, give it a whole
> >   		 * byte so it is also faster to load it from memory.
> >   		 */
> > -		unsigned smm:8;
> > +		unsigned as_id:8;
> >   	};
> >   };
> > @@ -2056,7 +2056,7 @@ enum {
> >   # define __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
> >   # define KVM_ADDRESS_SPACE_NUM 2
> >   # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
> > -# define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
> > +# define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).as_id)
> >   #else
> >   # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, 0)
> >   #endif
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 4d188f056933..f375b719f565 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -5056,7 +5056,7 @@ kvm_calc_cpu_role(struct kvm_vcpu *vcpu, const struct kvm_mmu_role_regs *regs)
> >   	union kvm_cpu_role role = {0};
> >   	role.base.access = ACC_ALL;
> > -	role.base.smm = is_smm(vcpu);
> > +	role.base.as_id = is_smm(vcpu);
> 
> I'm not familiar with other architectures, is there similar conception as
> x86 smm mode?

For KVM/arm64:

No, we don't do anything like SMM emulation on x86. Architecturally
speaking, though, we do have a higher level of privilege typically
used by firmware on arm64, called EL3.

I'll need to read David's series a bit more closely, but I'm inclined to
think that the page role is going to be rather arch-specific.

--
Thanks,
Oliver
