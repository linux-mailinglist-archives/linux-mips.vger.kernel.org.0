Return-Path: <linux-mips+bounces-4470-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A68F593DB35
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 01:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63EAF284164
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jul 2024 23:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F421514EF;
	Fri, 26 Jul 2024 23:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oh62CaBW"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA85F14A609
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037960; cv=none; b=OoURjbQIeGL6QNsokrrHei/ZBS7fibh3aaIj7ezDsbQYkQCElwBGZnffPQ4xsAxBakd7SqD0FcnzZzVG99CYYZVI3XU78ZLFhFhHgu/e3/JL/Kuy6Se0RF5sS9vcU+upHvGiAGWiUGtA1BOwlIOQAgt60blzvXDyBlPIiNqI6Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037960; c=relaxed/simple;
	bh=avyK+sgjip8mGDKx+P8MZVPI7apOzI37V6tcFp859Fg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=byjDoKiZxzzhdCPPs6qG+BK+eAT4VHMD2XNfhruVZ9NsRkx01besP9tdqKC7m5z6Gh0ch+mYd7y+an8ImoNFBVJpQA/J7Hb3uIOlI7H4g2Z/EZTkUHChuIHzUASrinaL5QGBNwTrHKgpCGrlvZMlvTryfZ4j91CZk8E7jP8ZWc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oh62CaBW; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e0b2ca961ebso497037276.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037958; x=1722642758; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlsoNmguYxHdPLcIEUjx1oIy+wRnU4Jxi7Q36OcxhEA=;
        b=oh62CaBWzR8LPMwmURBQor56FazwRpq5CGSoLr1AB2X3oO48eLboyC5/cyNmMgfaaq
         WzrXtp3a0miTs0anW96EtZEpgX2jMQ+OBuXcv1lOMdFxy64I4brSh2gTnhj4I4qdpsfK
         4I0gtLx/WWKcyvzfmJ9S5ibAqUVtbwPotgKpI397gH1vgdkTs0C6O9ObeRT1kJQ0pXvT
         wpxGe2U0IIOlSWBRMJ3/8z832wKOlCIkicMs01ia4CUJfYBarsLwIwybv+boptccAnNh
         nYL6xTEAFiGld/0irtn6IZe9s3TdHvkKZZPfi+WZZRx2S96TuhC3NY+kvL3MTTEMhdrc
         BKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037958; x=1722642758;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GlsoNmguYxHdPLcIEUjx1oIy+wRnU4Jxi7Q36OcxhEA=;
        b=RZIruwGY1d3ld8yiazAOw9p+3oOyGet5rlHpFU8jTV8v2Se8iCUpnC9iV8WkZlj/JT
         RDzh1/nLqDFHhmBfCLtp7vQdxvWzQtkL+P/KaTV5HHex6MwAohhgCBcpQ6j9vDQI/bZM
         YKElhhfycjapI4AfTPVFunrN7i0LnyOaDk04PFAWfxO65+JJQ4bFOeqL3XWHyu+U/3Ak
         A0STCXiKf46E1TS2WrGjb8sPwWTWk67d4AKOE6+x9GTZFy+gb/nd6DuYKjMFtAgiO/hj
         qz5xyoe1aCS138e5Tvfd5F6xzvmfqIWsgg0Thg1uo0woWOtubv4PA+xCuAjw4fxWmVS8
         gwmA==
X-Forwarded-Encrypted: i=1; AJvYcCXpy/rWiW0BVaFGichQ0OWUB4n6E1npsXH6T4+sjbfWVltw6boniV+f68imUpp5J2Mjk9qPFC8sezRo46UsYpKPf7xOI5kGDHMBDw==
X-Gm-Message-State: AOJu0YxSoY9tg2Po2lRswtb7KakWxTgVIExBvuvgsBbJeG1NW/jib3OQ
	h149ZDBMq3oaQswys9qXXFurBOxOPTSpkeHUNYMd+jQB/OVWALPXwWsTyHQkvMjddHAItjinKl2
	McQ==
X-Google-Smtp-Source: AGHT+IFCH1oh4Y8/oiPAKKZDfTSrq8OctuCbDjHGO9FWuVz/aIwZKKAQhyg1yG69wkiF5914XVtW9HUBfXk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1005:b0:e0b:f93:fe8c with SMTP id
 3f1490d57ef6-e0b5427fa67mr79730276.0.1722037957798; Fri, 26 Jul 2024 16:52:37
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:09 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-1-seanjc@google.com>
Subject: [PATCH v12 00/84] KVM: Stop grabbing references to PFNMAP'd pages
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="UTF-8"

arm64 folks, the first two patches are bug fixes, but I have very low
confidence that they are correct and/or desirable.  If they are more or
less correct, I can post them separately if that'd make life easier.  I
included them here to avoid conflicts, and because I'm pretty sure how
KVM deals with MTE tags vs. dirty logging will impact what APIs KVM needs
to provide to arch code.

On to the series...  The TL;DR is that I would like to get input on two
things:

 1. Marking folios dirty/accessed only on the intial stage-2 page fault
 2. The new APIs for faulting, prefetching, and doing "lookups" on pfns

This is (spiritually) v12 of David Steven's series to play nice with pfns
that are "valid", i.e. have a struct page, but are not refcounted.  Whereas
David's series only (mostly) fixed things for x86, this series goes for
broke and completely eliminates KVM's long-standing (and heinous) behavior
of essentially guessing which pfns are refcounted pages (see
kvm_pfn_to_refcounted_page()).

Getting there requires "fixing" arch code that isn't obviously broken.
Specifically, to get rid of kvm_pfn_to_refcounted_page(), KVM needs to
stop marking pages/folios dirty/accessed based solely on the pfn that's
stored in KVM's stage-2 page tables.  In v11, KVM x86 did this by tagging
SPTEs with a flag (using a software-available bit).

But that isn't a viable option for some flavors of x86 (we're out of
software-available bits), and more importantly I've convinced myself[*]
that marking folios _dirty_ after SPTEs have been installed is completely
unnecessary, and that marking folios accessed is likewise unnecessary for
real world workloads (and if this is a sticking point, I have ideas on
how to handle it more gracefully; more at the bottom).

So, instead of tracking which SPTEs correspond to refcounted pages, v12
simply removes all of the code that operates on "struct page" based on
the pfn in stage-2 PTEs.  This is the back ~40-50% of the series.  Most
of the patches are relevatively uninteresting from a code perspective,
it's the concept itself (of not marking folios dirty/accessed from SPTEs)
that needs discussion.

For x86 in particular, which sets accessed/dirty status when that info
would be "lost", e.g. when SPTEs are zapped or KVM clears the dirty flag
in a SPTE, foregoing the updates provides very measurable performance
improvements for related operations.  E.g. when clearing dirty bits as
part of dirty logging, and zapping SPTEs to reconstitue huge pages when
disabling dirty logging.

The other big change from v11 is that I opted to go with dedicated,
specific, and hopefully descriptive APIs to wrap kvm_follow_pfn() instead
of expose the "inner" helper to arch code.  In part because I still don't
love kvm_follow_pfn(), and fewer callers means its easier to change if/when
someone comes up with a better name.  But also because I think/hope that
having dedicated APIs will make it easier for arch developers to understand
what is the right/preferred way to do certain operations.  E.g. so that all
architectures use the same core flow for handling stage-2 page faults.
Long term, I would love to standardize that code even more, but this series
is already waaaay too big.

Along the way, I also discovered that several of the inputs to hva_to_pfn()
(and it's myriad wrappers) could be removed.  E.g. the rather weirdly named
@atomic flag can be removed by deduplicating x86's prefetching code.

As for capturing accessed information on zapped SPTEs, e.g. to prevent
losing accessed information because NUMA balancing mucks with things, my
thought is that arch code can preserve the accessed information in SPTEs
that are unmapped/zapped because protections were modified, e.g. so that
LRU-initiated aging can still collect information.  I'm not at all
convinced that this is necessary outside of tests that care about exact
counts, e.g. KVM selftests, but I'll post an RFC KVM x86 series to get
the conversation started.

Note, I'm purposefully not capturing the delta from v11=>v12, because
there is zero chance I will get everything, and while this is a spiritual
successor to David's v11, in practice it's like 98% new code.

[*] https://lore.kernel.org/all/20240320005024.3216282-1-seanjc@google.com

David Stevens (3):
  KVM: Replace "async" pointer in gfn=>pfn with "no_wait" and error code
  KVM: Introduce kvm_follow_pfn() to eventually replace "gfn_to_pfn"
    APIs
  KVM: Migrate kvm_vcpu_map() to kvm_follow_pfn()

Sean Christopherson (81):
  KVM: arm64: Release pfn, i.e. put page, if copying MTE tags hits
    ZONE_DEVICE
  KVM: arm64: Disallow copying MTE to guest memory while KVM is dirty
    logging
  KVM: Drop KVM_ERR_PTR_BAD_PAGE and instead return NULL to indicate an
    error
  KVM: Allow calling kvm_release_page_{clean,dirty}() on a NULL page
    pointer
  KVM: Add kvm_release_page_unused() API to put pages that KVM never
    consumes
  KVM: x86/mmu: Skip the "try unsync" path iff the old SPTE was a leaf
    SPTE
  KVM: x86/mmu: Mark folio dirty when creating SPTE, not when
    zapping/modifying
  KVM: x86/mmu: Mark page/folio accessed only when zapping leaf SPTEs
  KVM: x86/mmu: Don't force flush if SPTE update clears Accessed bit
  KVM: x86/mmu: Use gfn_to_page_many_atomic() when prefetching indirect
    PTEs
  KVM: Rename gfn_to_page_many_atomic() to kvm_prefetch_pages()
  KVM: Drop @atomic param from gfn=>pfn and hva=>pfn APIs
  KVM: Annotate that all paths in hva_to_pfn() might sleep
  KVM: x86/mmu: Drop kvm_page_fault.hva, i.e. don't track intermediate
    hva
  KVM: Drop unused "hva" pointer from __gfn_to_pfn_memslot()
  KVM: Remove pointless sanity check on @map param to kvm_vcpu_(un)map()
  KVM: Explicitly initialize all fields at the start of kvm_vcpu_map()
  KVM: Use NULL for struct page pointer to indicate mremapped memory
  KVM: nVMX: Rely on kvm_vcpu_unmap() to track validity of eVMCS mapping
  KVM: nVMX: Drop pointless msr_bitmap_map field from struct nested_vmx
  KVM: nVMX: Add helper to put (unmap) vmcs12 pages
  KVM: Use plain "struct page" pointer instead of single-entry array
  KVM: Provide refcounted page as output field in struct kvm_follow_pfn
  KVM: Move kvm_{set,release}_page_{clean,dirty}() helpers up in
    kvm_main.c
  KVM: pfncache: Precisely track refcounted pages
  KVM: Pin (as in FOLL_PIN) pages during kvm_vcpu_map()
  KVM: nVMX: Mark vmcs12's APIC access page dirty when unmapping
  KVM: Pass in write/dirty to kvm_vcpu_map(), not kvm_vcpu_unmap()
  KVM: Get writable mapping for __kvm_vcpu_map() only when necessary
  KVM: Disallow direct access (w/o mmu_notifier) to unpinned pfn by
    default
  KVM: Add a helper to lookup a pfn without grabbing a reference
  KVM: x86: Use kvm_lookup_pfn() to check if retrying #PF is useful
  KVM: x86: Use kvm_lookup_pfn() to check if APIC access page was
    installed
  KVM: x86/mmu: Add "mmu" prefix fault-in helpers to free up generic
    names
  KVM: x86/mmu: Put direct prefetched pages via kvm_release_page_clean()
  KVM: x86/mmu: Add common helper to handle prefetching SPTEs
  KVM: x86/mmu: Add helper to "finish" handling a guest page fault
  KVM: x86/mmu: Mark pages/folios dirty at the origin of make_spte()
  KVM: Move declarations of memslot accessors up in kvm_host.h
  KVM: Add kvm_faultin_pfn() to specifically service guest page faults
  KVM: x86/mmu: Convert page fault paths to kvm_faultin_pfn()
  KVM: guest_memfd: Provide "struct page" as output from
    kvm_gmem_get_pfn()
  KVM: x86/mmu: Put refcounted pages instead of blindly releasing pfns
  KVM: x86/mmu: Don't mark unused faultin pages as accessed
  KVM: Move x86's API to release a faultin page to common KVM
  KVM: VMX: Hold mmu_lock until page is released when updating APIC
    access page
  KVM: VMX: Use __kvm_faultin_page() to get APIC access page/pfn
  KVM: PPC: e500: Mark "struct page" dirty in kvmppc_e500_shadow_map()
  KVM: PPC: e500: Mark "struct page" pfn accessed before dropping
    mmu_lock
  KVM: PPC: e500: Use __kvm_faultin_pfn() to handle page faults
  KVM: arm64: Mark "struct page" pfns accessed/dirty before dropping
    mmu_lock
  KVM: arm64: Use __kvm_faultin_pfn() to handle memory aborts
  KVM: RISC-V: Mark "struct page" pfns dirty iff a stage-2 PTE is
    installed
  KVM: RISC-V: Mark "struct page" pfns accessed before dropping mmu_lock
  KVM: RISC-V: Use kvm_faultin_pfn() when mapping pfns into the guest
  KVM: PPC: Use __kvm_faultin_pfn() to handle page faults on Book3s HV
  KVM: PPC: Use __kvm_faultin_pfn() to handle page faults on Book3s
    Radix
  KVM: PPC: Drop unused @kvm_ro param from
    kvmppc_book3s_instantiate_page()
  KVM: PPC: Book3S: Mark "struct page" pfns dirty/accessed after
    installing PTE
  KVM: PPC: Use kvm_faultin_pfn() to handle page faults on Book3s PR
  KVM: LoongArch: Mark "struct page" pfns dirty only in "slow" page
    fault path
  KVM: LoongArch: Mark "struct page" pfns accessed only in "slow" page
    fault path
  KVM: LoongArch: Mark "struct page" pfn accessed before dropping
    mmu_lock
  KVM: LoongArch: Use kvm_faultin_pfn() to map pfns into the guest
  KVM: MIPS: Mark "struct page" pfns dirty only in "slow" page fault
    path
  KVM: MIPS: Mark "struct page" pfns accessed only in "slow" page fault
    path
  KVM: MIPS: Mark "struct page" pfns accessed prior to dropping mmu_lock
  KVM: MIPS: Use kvm_faultin_pfn() to map pfns into the guest
  KVM: PPC: Remove extra get_page() to fix page refcount leak
  KVM: PPC: Use kvm_vcpu_map() to map guest memory to patch dcbz
    instructions
  KVM: Convert gfn_to_page() to use kvm_follow_pfn()
  KVM: Add support for read-only usage of gfn_to_page()
  KVM: arm64: Use __gfn_to_page() when copying MTE tags to/from
    userspace
  KVM: PPC: Explicitly require struct page memory for Ultravisor sharing
  KVM: Drop gfn_to_pfn() APIs now that all users are gone
  KVM: s390: Use kvm_release_page_dirty() to unpin "struct page" memory
  KVM: Make kvm_follow_pfn.refcounted_page a required field
  KVM: x86/mmu: Don't mark "struct page" accessed when zapping SPTEs
  KVM: arm64: Don't mark "struct page" accessed when making SPTE young
  KVM: Drop APIs that manipulate "struct page" via pfns
  KVM: Don't grab reference on VM_MIXEDMAP pfns that have a "struct
    page"

 Documentation/virt/kvm/locking.rst     |  80 ++--
 arch/arm64/include/asm/kvm_pgtable.h   |   4 +-
 arch/arm64/kvm/guest.c                 |  25 +-
 arch/arm64/kvm/hyp/pgtable.c           |   7 +-
 arch/arm64/kvm/mmu.c                   |  21 +-
 arch/loongarch/kvm/mmu.c               |  40 +-
 arch/mips/kvm/mmu.c                    |  26 +-
 arch/powerpc/include/asm/kvm_book3s.h  |   4 +-
 arch/powerpc/kvm/book3s.c              |   7 +-
 arch/powerpc/kvm/book3s_32_mmu_host.c  |   7 +-
 arch/powerpc/kvm/book3s_64_mmu_host.c  |  12 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c    |  25 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  35 +-
 arch/powerpc/kvm/book3s_hv_nested.c    |   4 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c     |  25 +-
 arch/powerpc/kvm/book3s_pr.c           |  14 +-
 arch/powerpc/kvm/book3s_xive_native.c  |   2 +-
 arch/powerpc/kvm/e500_mmu_host.c       |  19 +-
 arch/riscv/kvm/mmu.c                   |   9 +-
 arch/s390/kvm/vsie.c                   |   4 +-
 arch/x86/kvm/lapic.c                   |  15 +-
 arch/x86/kvm/mmu/mmu.c                 | 191 ++++----
 arch/x86/kvm/mmu/mmu_internal.h        |   5 +-
 arch/x86/kvm/mmu/paging_tmpl.h         |  29 +-
 arch/x86/kvm/mmu/spte.c                |  23 +-
 arch/x86/kvm/mmu/tdp_mmu.c             |  16 -
 arch/x86/kvm/svm/nested.c              |   4 +-
 arch/x86/kvm/svm/sev.c                 |  12 +-
 arch/x86/kvm/svm/svm.c                 |   8 +-
 arch/x86/kvm/vmx/nested.c              |  42 +-
 arch/x86/kvm/vmx/vmx.c                 |  28 +-
 arch/x86/kvm/vmx/vmx.h                 |   2 -
 arch/x86/kvm/x86.c                     |  16 +-
 include/linux/kvm_host.h               | 124 +++--
 virt/kvm/guest_memfd.c                 |  19 +-
 virt/kvm/kvm_main.c                    | 603 ++++++++++---------------
 virt/kvm/kvm_mm.h                      |  36 +-
 virt/kvm/pfncache.c                    |  20 +-
 38 files changed, 698 insertions(+), 865 deletions(-)


base-commit: 332d2c1d713e232e163386c35a3ba0c1b90df83f
-- 
2.46.0.rc1.232.g9752f9e123-goog


