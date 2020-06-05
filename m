Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E564A1F028D
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jun 2020 23:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbgFEVoS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Jun 2020 17:44:18 -0400
Received: from mga17.intel.com ([192.55.52.151]:49307 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728252AbgFEVjJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Jun 2020 17:39:09 -0400
IronPort-SDR: 2Or+nb5QSrbNGG7DCqPdG+mjxgBds6PccMYmRydoM6QdEq5r5A7AZAe5Xii6uPgDU2uKU0h4OU
 cCuZTAzRZPEQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2020 14:39:07 -0700
IronPort-SDR: 3kU6BlJ3ZElEdj1AHWXLHsdk52pJvqNGjfnKdDIaTU1hErrl7iwvq5Lps986iLm32Az8kC2WKh
 ius/kdGV8mzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,477,1583222400"; 
   d="scan'208";a="287860865"
Received: from sjchrist-coffee.jf.intel.com ([10.54.74.152])
  by orsmga002.jf.intel.com with ESMTP; 05 Jun 2020 14:39:07 -0700
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     Marc Zyngier <maz@kernel.org>, Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Feiner <pfeiner@google.com>,
        Peter Shier <pshier@google.com>,
        Junaid Shahid <junaids@google.com>,
        Ben Gardon <bgardon@google.com>,
        Christoffer Dall <christoffer.dall@arm.com>
Subject: [PATCH 00/21] KVM: Cleanup and unify kvm_mmu_memory_cache usage
Date:   Fri,  5 Jun 2020 14:38:32 -0700
Message-Id: <20200605213853.14959-1-sean.j.christopherson@intel.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This series resurrects Christoffer Dall's series[1] to provide a common
MMU memory cache implementation that can be shared by x86, arm64 and MIPS.

It also picks up a suggested change from Ben Gardon[2] to clear shadow
page tables during initial allocation so as to avoid clearing entire
pages while holding mmu_lock.

The front half of the patches do house cleaning on x86's memory cache
implementation in preparation for moving it to common code, along with a
fair bit of cleanup on the usage.  The middle chunk moves the patches to
common KVM, and the last two chunks convert arm64 and MIPS to the common
implementation.

Cleanup aside, the notable difference from Christoffer and Ben's proposed
patches is to make __GFP_ZERO optional, e.g. to allow x86 to skip zeroing
for its gfns array and to provide line of sight for my
cannot-yet-be-discussed-in-detail use case for non-zero initialized shadow
page tables[3].

Tested on x86 only, no testing whatsoever on arm64 or MIPS.

[1] https://lkml.kernel.org/r/20191105110357.8607-1-christoffer.dall@arm.com
[2] https://lkml.kernel.org/r/20190926231824.149014-4-bgardon@google.com
[3] https://lkml.kernel.org/r/20191127180731.GC16845@linux.intel.com

Sean Christopherson (21):
  KVM: x86/mmu: Track the associated kmem_cache in the MMU caches
  KVM: x86/mmu: Consolidate "page" variant of memory cache helpers
  KVM: x86/mmu: Use consistent "mc" name for kvm_mmu_memory_cache locals
  KVM: x86/mmu: Remove superfluous gotos from mmu_topup_memory_caches()
  KVM: x86/mmu: Try to avoid crashing KVM if a MMU memory cache is empty
  KVM: x86/mmu: Move fast_page_fault() call above
    mmu_topup_memory_caches()
  KVM: x86/mmu: Topup memory caches after walking GVA->GPA
  KVM: x86/mmu: Clean up the gorilla math in mmu_topup_memory_caches()
  KVM: x86/mmu: Separate the memory caches for shadow pages and gfn
    arrays
  KVM: x86/mmu: Make __GFP_ZERO a property of the memory cache
  KVM: x86/mmu: Zero allocate shadow pages (outside of mmu_lock)
  KVM: x86/mmu: Skip filling the gfn cache for guaranteed direct MMU
    topups
  KVM: x86/mmu: Prepend "kvm_" to memory cache helpers that will be
    global
  KVM: Move x86's version of struct kvm_mmu_memory_cache to common code
  KVM: Move x86's MMU memory cache helpers to common KVM code
  KVM: arm64: Drop @max param from mmu_topup_memory_cache()
  KVM: arm64: Use common code's approach for __GFP_ZERO with memory
    caches
  KVM: arm64: Use common KVM implementation of MMU memory caches
  KVM: MIPS: Drop @max param from mmu_topup_memory_cache()
  KVM: MIPS: Account pages used for GPA page tables
  KVM: MIPS: Use common KVM implementation of MMU memory caches

 arch/arm64/include/asm/kvm_host.h    |  11 ---
 arch/arm64/include/asm/kvm_types.h   |   8 ++
 arch/arm64/kvm/arm.c                 |   2 +
 arch/arm64/kvm/mmu.c                 |  54 +++--------
 arch/mips/include/asm/kvm_host.h     |  11 ---
 arch/mips/include/asm/kvm_types.h    |   7 ++
 arch/mips/kvm/mmu.c                  |  44 ++-------
 arch/powerpc/include/asm/kvm_types.h |   5 ++
 arch/s390/include/asm/kvm_types.h    |   5 ++
 arch/x86/include/asm/kvm_host.h      |  14 +--
 arch/x86/include/asm/kvm_types.h     |   7 ++
 arch/x86/kvm/mmu/mmu.c               | 129 +++++++++------------------
 arch/x86/kvm/mmu/paging_tmpl.h       |  10 +--
 include/linux/kvm_host.h             |   7 ++
 include/linux/kvm_types.h            |  19 ++++
 virt/kvm/kvm_main.c                  |  55 ++++++++++++
 16 files changed, 178 insertions(+), 210 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_types.h
 create mode 100644 arch/mips/include/asm/kvm_types.h
 create mode 100644 arch/powerpc/include/asm/kvm_types.h
 create mode 100644 arch/s390/include/asm/kvm_types.h
 create mode 100644 arch/x86/include/asm/kvm_types.h

-- 
2.26.0

