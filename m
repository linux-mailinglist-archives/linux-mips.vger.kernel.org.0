Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABA9276416
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 00:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgIWWpd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 18:45:33 -0400
Received: from mga02.intel.com ([134.134.136.20]:41185 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbgIWWpc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 23 Sep 2020 18:45:32 -0400
IronPort-SDR: 2IVVcutblxPLIHmNyjGNuwUpFak5783EmNgbLQ6zbP/8vey/jMevbsny7xwceSVzby2C4pwroa
 /kAR4zYWcJAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="148698553"
X-IronPort-AV: E=Sophos;i="5.77,295,1596524400"; 
   d="scan'208";a="148698553"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2020 15:45:32 -0700
IronPort-SDR: J1/Cph9zE2IoIv9FqaGC+ceWMFJHwxEkjhilb2ZOjNuk9oeKV7hF68XZI2S5RsFxBN95q0EqeM
 KiQhOpKHilBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,295,1596524400"; 
   d="scan'208";a="335660058"
Received: from sjchrist-coffee.jf.intel.com ([10.54.74.160])
  by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2020 15:45:31 -0700
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Huacai Chen <chenhc@lemote.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        linux-mips@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
        kvm-ppc@vger.kernel.org,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: [RFC PATCH 0/3] KVM: Introduce "VM bugged" concept
Date:   Wed, 23 Sep 2020 15:45:27 -0700
Message-Id: <20200923224530.17735-1-sean.j.christopherson@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This series introduces a concept we've discussed a few times in x86 land.
The crux of the problem is that x86 has a few cases where KVM could
theoretically encounter a software or hardware bug deep in a call stack
without any sane way to propagate the error out to userspace.

Another use case would be for scenarios where letting the VM live will
do more harm than good, e.g. we've been using KVM_BUG_ON for early TDX
enabling as botching anything related to secure paging all but guarantees
there will be a flood of WARNs and error messages because lower level PTE
operations will fail if an upper level operation failed.

The basic idea is to WARN_ONCE if a bug is encountered, kick all vCPUs out
to userspace, and mark the VM as bugged so that no ioctls() can be issued
on the VM or its devices/vCPUs.

RFC as I've done nowhere near enough testing to verify that rejecting the
ioctls(), evicting running vCPUs, etc... works as intended.

Sean Christopherson (3):
  KVM: Export kvm_make_all_cpus_request() for use in marking VMs as
    bugged
  KVM: Add infrastructure and macro to mark VM as bugged
  KVM: x86: Use KVM_BUG/KVM_BUG_ON to handle bugs that are fatal to the
    VM

 arch/x86/kvm/svm/svm.c   |  2 +-
 arch/x86/kvm/vmx/vmx.c   | 23 ++++++++++++--------
 arch/x86/kvm/x86.c       |  4 ++++
 include/linux/kvm_host.h | 45 ++++++++++++++++++++++++++++++++--------
 virt/kvm/kvm_main.c      | 11 +++++-----
 5 files changed, 61 insertions(+), 24 deletions(-)

-- 
2.28.0

