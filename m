Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 706E8B0431
	for <lists+linux-mips@lfdr.de>; Wed, 11 Sep 2019 20:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730242AbfIKSun (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Sep 2019 14:50:43 -0400
Received: from mga06.intel.com ([134.134.136.31]:39421 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729016AbfIKSum (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Sep 2019 14:50:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Sep 2019 11:50:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; 
   d="scan'208";a="196980862"
Received: from sjchrist-coffee.jf.intel.com ([10.54.74.41])
  by orsmga002.jf.intel.com with ESMTP; 11 Sep 2019 11:50:40 -0700
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     James Hogan <jhogan@kernel.org>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry@arm.com>,
        Suzuki K Pouloze <suzuki.poulose@arm.com>,
        linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org
Subject: [PATCH 00/13] KVM: Dynamically size memslot arrays
Date:   Wed, 11 Sep 2019 11:50:25 -0700
Message-Id: <20190911185038.24341-1-sean.j.christopherson@intel.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The end goal of this series is to dynamically size the memslot array so
that KVM allocates memory based on the number of memslots in use, as
opposed to unconditionally allocating memory for the maximum number of
memslots.  On x86, each memslot consumes 88 bytes, and so with 2 address
spaces of 512 memslots, each VM consumes ~90k bytes for the memslots.
E.g. given a VM that uses a total of 30 memslots, dynamic sizing reduces
the memory footprint from 90k to ~2.6k bytes.

The changes required to support dynamic sizing are relatively small,
e.g. are essentially contained in patches 12/13 and 13/13.  Patches 1-11
clean up the memslot code, which has gotten quite crusy, especially
__kvm_set_memory_region().  The clean up is likely not strictly necessary
to switch to dynamic sizing, but I didn't have a remotely reasonable
level of confidence in the correctness of the dynamic sizing without first
doing the clean up.

Testing, especially non-x86 platforms, would be greatly appreciated.  I'd
really like to get at least one Tested-by from all architectures.  The
non-x86 changes are for all intents and purposes untested, e.g. I compile
tested pieces of the code by copying them into x86, but that's it.  In
theory, the vast majority of the functional changes are arch agnostic, in
theory... 

Sean Christopherson (13):
  KVM: Reinstall old memslots if arch preparation fails
  KVM: PPC: Move memslot memory allocation into prepare_memory_region()
  KVM: x86: Allocate memslot resources during prepare_memory_region()
  KVM: Drop kvm_arch_create_memslot()
  KVM: Refactor error handling for setting memory region
  KVM: Move setting of memslot into helper routine
  KVM: Move memslot deletion to helper function
  KVM: Simplify kvm_free_memslot() and all its descendents
  KVM: Clean up local variable usage in __kvm_set_memory_region()
  KVM: Provide common implementation for generic dirty log functions
  KVM: Ensure validity of memslot with respect to kvm_get_dirty_log()
  KVM: Terminate memslot walks via used_slots
  KVM: Dynamically size memslot array based on number of used slots

 arch/mips/include/asm/kvm_host.h      |   2 +-
 arch/mips/kvm/mips.c                  |  68 +---
 arch/powerpc/include/asm/kvm_ppc.h    |  14 +-
 arch/powerpc/kvm/book3s.c             |  22 +-
 arch/powerpc/kvm/book3s_hv.c          |  36 +-
 arch/powerpc/kvm/book3s_pr.c          |  20 +-
 arch/powerpc/kvm/booke.c              |  17 +-
 arch/powerpc/kvm/powerpc.c            |  13 +-
 arch/s390/include/asm/kvm_host.h      |   2 +-
 arch/s390/kvm/kvm-s390.c              |  21 +-
 arch/x86/include/asm/kvm_page_track.h |   3 +-
 arch/x86/kvm/page_track.c             |  15 +-
 arch/x86/kvm/x86.c                    | 100 ++---
 include/linux/kvm_host.h              |  48 +--
 virt/kvm/arm/arm.c                    |  47 +--
 virt/kvm/arm/mmu.c                    |  18 +-
 virt/kvm/kvm_main.c                   | 546 ++++++++++++++++----------
 17 files changed, 467 insertions(+), 525 deletions(-)

-- 
2.22.0

