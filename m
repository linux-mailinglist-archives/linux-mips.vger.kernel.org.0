Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF8307E2554
	for <lists+linux-mips@lfdr.de>; Mon,  6 Nov 2023 14:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbjKFNa6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Nov 2023 08:30:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232718AbjKFNa4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Nov 2023 08:30:56 -0500
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838D210A;
        Mon,  6 Nov 2023 05:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699277453; x=1730813453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GcPOwqKIRcSDpD/XkGdZ5KVAeJljJ23LDoDjt600Qfg=;
  b=Tkp5vxJUJyXrBZ2wV/laQ+hredbTr6MbNtHiMB6j8I6jylMIhHh9BmJt
   DjKHAN/ZeHXFLI1RWWe5kdPeXU7C4fwsv5dhDJ+a1q2WxKn4XhaakZVP/
   X8GtrTjBbryVH1/1/Bjz6R7wkgXsiR8X05WcKkRYbWZhrcfyC7u+xnPXM
   zx/TbCqECwCSaRbytAnB5sfKcbHqgnRoLynCR9cyc0YcxoxhrSgMxfwdA
   TZIxf9+V0zQioMRzOtTF3CFWnFBTzfsccD90L1D8RDilDvxABse8Ug6Di
   ZTXdPEITWBSk4tp4mkEokSc7s0sBmq0J5nfLAc2ksFK7fL002AUA3szAy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2263458"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="2263458"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 05:30:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="755855766"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="755855766"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orsmga007.jf.intel.com with ESMTP; 06 Nov 2023 05:30:42 -0800
Date:   Mon, 6 Nov 2023 21:29:10 +0800
From:   Xu Yilun <yilun.xu@linux.intel.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Sean Christopherson <seanjc@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>,
        Xu Yilun <yilun.xu@intel.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Anish Moorthy <amoorthy@google.com>,
        David Matlack <dmatlack@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v13 20/35] KVM: x86/mmu: Handle page fault for private
 memory
Message-ID: <ZUjqJjz0Epf7ii8F@yilunxu-OptiPlex-7050>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-21-seanjc@google.com>
 <ZUeSaAKRemlSRQpO@yilunxu-OptiPlex-7050>
 <CABgObfb1Wf2ptitGhJPM6VcmkCG9haMoQj2BsttjeoV=9F0O9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfb1Wf2ptitGhJPM6VcmkCG9haMoQj2BsttjeoV=9F0O9Q@mail.gmail.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Nov 05, 2023 at 05:19:36PM +0100, Paolo Bonzini wrote:
> On Sun, Nov 5, 2023 at 2:04 PM Xu Yilun <yilun.xu@linux.intel.com> wrote:
> >
> > > +static void kvm_mmu_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> > > +                                           struct kvm_page_fault *fault)
> > > +{
> > > +     kvm_prepare_memory_fault_exit(vcpu, fault->gfn << PAGE_SHIFT,
> > > +                                   PAGE_SIZE, fault->write, fault->exec,
> > > +                                   fault->is_private);
> > > +}
> > > +
> > > +static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> > > +                                struct kvm_page_fault *fault)
> > > +{
> > > +     int max_order, r;
> > > +
> > > +     if (!kvm_slot_can_be_private(fault->slot)) {
> > > +             kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> > > +             return -EFAULT;
> > > +     }
> > > +
> > > +     r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
> > > +                          &max_order);
> > > +     if (r) {
> > > +             kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> > > +             return r;
> >
> > Why report KVM_EXIT_MEMORY_FAULT here? even with a ret != -EFAULT?
> 
> The cases are EFAULT, EHWPOISON (which can report
> KVM_EXIT_MEMORY_FAULT) and ENOMEM. I think it's fine
> that even -ENOMEM can return KVM_EXIT_MEMORY_FAULT,
> and it doesn't violate the documentation.  The docs tell you "what
> can you do if error if EFAULT or EHWPOISON?"; they don't
> exclude that other errnos result in KVM_EXIT_MEMORY_FAULT,
> it's just that you're not supposed to look at it

Thanks, it's OK for ENOMEM + KVM_EXIT_MEMORY_FAULT.

Another concern is, now 3 places to report EFAULT + KVM_EXIT_MEMORY_FAULT:

  if (!kvm_slot_can_be_private(fault->slot)) {
	kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
	return -EFAULT;
  }

  file = kvm_gmem_get_file(slot);
  if (!file)
	return -EFAULT;

  if (fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
	kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
	return -EFAULT;
  }

They are different cases, and seems userspace should handle them
differently, but not enough information to distinguish them.

Thanks,
Yilun

> 
> Paolo
> 
> 
