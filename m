Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF4344536CA
	for <lists+linux-mips@lfdr.de>; Tue, 16 Nov 2021 17:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238752AbhKPQHk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Nov 2021 11:07:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:33854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238658AbhKPQHJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 16 Nov 2021 11:07:09 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82F2761504;
        Tue, 16 Nov 2021 16:04:11 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mn0wL-005sTB-FV; Tue, 16 Nov 2021 16:04:09 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, linuxppc-dev@lists.ozlabs.org,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Juergen Gross <jgross@suse.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Sean Christopherson <seanjc@google.com>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        kernel-team@android.com
Subject: [PATCH v2 0/7] KVM: Turn the vcpu array into an xarray
Date:   Tue, 16 Nov 2021 16:03:56 +0000
Message-Id: <20211116160403.4074052-1-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvm@vger.kernel.org, linux-mips@vger.kernel.org, kvmarm@lists.cs.columbia.edu, linuxppc-dev@lists.ozlabs.org, pbonzini@redhat.com, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, anup.patel@wdc.com, borntraeger@de.ibm.com, frankja@linux.ibm.com, david@redhat.com, imbrenda@linux.ibm.com, jgross@suse.com, npiggin@gmail.com, seanjc@google.com, paulus@samba.org, mpe@ellerman.id.au, f4bug@amsat.org, james.morse@arm.com, suzuki.poulose@arm.com, alexandru.elisei@arm.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The kvm structure is pretty large. A large portion of it is the vcpu
array, which is 4kB on arm64 with 512 vcpu, double that on x86-64.  Of
course, hardly anyone runs VMs this big, so this is often a net waste
of memory and cache locality.

A possible approach is to turn the fixed-size array into an xarray,
which results in a net code deletion after a bit of cleanup.

* From v1:
  - Rebased on v5.16-rc1
  - Dropped the dubious locking on teardown
  - Converted kvm_for_each_vcpu() to xa_for_each_range(), together with
    an invasive change converting the index to an unsigned long

Marc Zyngier (7):
  KVM: Move wiping of the kvm->vcpus array to common code
  KVM: mips: Use kvm_get_vcpu() instead of open-coded access
  KVM: s390: Use kvm_get_vcpu() instead of open-coded access
  KVM: x86: Use kvm_get_vcpu() instead of open-coded access
  KVM: Convert the kvm->vcpus array to a xarray
  KVM: Use 'unsigned long' as kvm_for_each_vcpu()'s index
  KVM: Convert kvm_for_each_vcpu() to using xa_for_each_range()

 arch/arm64/kvm/arch_timer.c           |  8 ++---
 arch/arm64/kvm/arm.c                  | 16 +++------
 arch/arm64/kvm/pmu-emul.c             |  2 +-
 arch/arm64/kvm/psci.c                 |  6 ++--
 arch/arm64/kvm/reset.c                |  2 +-
 arch/arm64/kvm/vgic/vgic-init.c       | 10 +++---
 arch/arm64/kvm/vgic/vgic-kvm-device.c |  2 +-
 arch/arm64/kvm/vgic/vgic-mmio-v2.c    |  3 +-
 arch/arm64/kvm/vgic/vgic-mmio-v3.c    |  7 ++--
 arch/arm64/kvm/vgic/vgic-v3.c         |  4 +--
 arch/arm64/kvm/vgic/vgic-v4.c         |  5 +--
 arch/arm64/kvm/vgic/vgic.c            |  2 +-
 arch/mips/kvm/loongson_ipi.c          |  4 +--
 arch/mips/kvm/mips.c                  | 23 ++-----------
 arch/powerpc/kvm/book3s_32_mmu.c      |  2 +-
 arch/powerpc/kvm/book3s_64_mmu.c      |  2 +-
 arch/powerpc/kvm/book3s_hv.c          |  8 ++---
 arch/powerpc/kvm/book3s_pr.c          |  2 +-
 arch/powerpc/kvm/book3s_xics.c        |  6 ++--
 arch/powerpc/kvm/book3s_xics.h        |  2 +-
 arch/powerpc/kvm/book3s_xive.c        | 15 +++++----
 arch/powerpc/kvm/book3s_xive.h        |  4 +--
 arch/powerpc/kvm/book3s_xive_native.c |  8 ++---
 arch/powerpc/kvm/e500_emulate.c       |  2 +-
 arch/powerpc/kvm/powerpc.c            | 10 +-----
 arch/riscv/kvm/vcpu_sbi.c             |  2 +-
 arch/riscv/kvm/vm.c                   | 10 +-----
 arch/riscv/kvm/vmid.c                 |  2 +-
 arch/s390/kvm/interrupt.c             |  2 +-
 arch/s390/kvm/kvm-s390.c              | 47 ++++++++++-----------------
 arch/s390/kvm/kvm-s390.h              |  4 +--
 arch/x86/kvm/hyperv.c                 |  7 ++--
 arch/x86/kvm/i8254.c                  |  2 +-
 arch/x86/kvm/i8259.c                  |  5 +--
 arch/x86/kvm/ioapic.c                 |  4 +--
 arch/x86/kvm/irq_comm.c               |  7 ++--
 arch/x86/kvm/kvm_onhyperv.c           |  3 +-
 arch/x86/kvm/lapic.c                  |  6 ++--
 arch/x86/kvm/svm/avic.c               |  2 +-
 arch/x86/kvm/svm/sev.c                |  3 +-
 arch/x86/kvm/vmx/posted_intr.c        |  2 +-
 arch/x86/kvm/x86.c                    | 30 +++++++----------
 include/linux/kvm_host.h              | 17 +++++-----
 virt/kvm/kvm_main.c                   | 41 ++++++++++++++++-------
 44 files changed, 158 insertions(+), 193 deletions(-)

-- 
2.30.2

