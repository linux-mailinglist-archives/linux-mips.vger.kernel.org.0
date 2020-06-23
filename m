Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C22D20531D
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 15:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732648AbgFWNO0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 09:14:26 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:42064 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732602AbgFWNO0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 23 Jun 2020 09:14:26 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04397;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=38;SR=0;TI=SMTPD_---0U0WFKzW_1592918058;
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0U0WFKzW_1592918058)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 23 Jun 2020 21:14:18 +0800
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To:     pbonzini@redhat.com, tsbogend@alpha.franken.de, paulus@ozlabs.org,
        mpe@ellerman.id.au, benh@kernel.crashing.org,
        borntraeger@de.ibm.com, frankja@linux.ibm.com, david@redhat.com,
        cohuck@redhat.com, heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        sean.j.christopherson@intel.com, vkuznets@redhat.com,
        wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, maz@kernel.org, james.morse@arm.com,
        julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
        christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com,
        chenhuacai@gmail.com
Cc:     kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
        tianjia.zhang@linux.alibaba.com
Subject: [PATCH v6 0/5] clean up redundant 'kvm_run' parameters
Date:   Tue, 23 Jun 2020 21:14:13 +0800
Message-Id: <20200623131418.31473-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
structure. For historical reasons, many kvm-related function parameters
retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time. This
patch does a unified cleanup of these remaining redundant parameters.

This series of patches has completely cleaned the architecture of
arm64, mips, ppc, and s390 (no such redundant code on x86). Due to
the large number of modified codes, a separate patch is made for each
platform. On the ppc platform, there is also a redundant structure
pointer of 'kvm_run' in 'vcpu_arch', which has also been cleaned
separately.

---
v6 changes:
  Rearrange patch sets, only keep the unmerged patch.
  rebase on mainline.

v5 change:
  ppc: fix for review.

v4 change:
  mips: fixes two errors in entry.c.

v3 change:
  Keep the existing `vcpu->run` in the function body unchanged.

v2 change:
  s390 retains the original variable name and minimizes modification.

Tianjia Zhang (5):
  KVM: s390: clean up redundant 'kvm_run' parameters
  KVM: arm64: clean up redundant 'kvm_run' parameters
  KVM: PPC: clean up redundant kvm_run parameters in assembly
  KVM: MIPS: clean up redundant 'kvm_run' parameters
  KVM: MIPS: clean up redundant kvm_run parameters in assembly

 arch/arm64/include/asm/kvm_coproc.h   |  12 +--
 arch/arm64/include/asm/kvm_host.h     |  11 +--
 arch/arm64/include/asm/kvm_mmu.h      |   2 +-
 arch/arm64/kvm/arm.c                  |   6 +-
 arch/arm64/kvm/handle_exit.c          |  36 ++++----
 arch/arm64/kvm/mmio.c                 |  11 +--
 arch/arm64/kvm/mmu.c                  |   5 +-
 arch/arm64/kvm/sys_regs.c             |  13 ++-
 arch/mips/include/asm/kvm_host.h      |  32 ++------
 arch/mips/kvm/emulate.c               |  59 +++++--------
 arch/mips/kvm/entry.c                 |  21 ++---
 arch/mips/kvm/mips.c                  |  14 ++--
 arch/mips/kvm/trap_emul.c             | 114 +++++++++++---------------
 arch/mips/kvm/vz.c                    |  26 +++---
 arch/powerpc/include/asm/kvm_ppc.h    |   2 +-
 arch/powerpc/kvm/book3s_interrupts.S  |  22 +++--
 arch/powerpc/kvm/book3s_pr.c          |   9 +-
 arch/powerpc/kvm/booke.c              |   9 +-
 arch/powerpc/kvm/booke_interrupts.S   |   9 +-
 arch/powerpc/kvm/bookehv_interrupts.S |  10 +--
 arch/s390/kvm/kvm-s390.c              |  23 ++++--
 21 files changed, 188 insertions(+), 258 deletions(-)

-- 
2.17.1

