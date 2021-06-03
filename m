Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6A5F39AC8B
	for <lists+linux-mips@lfdr.de>; Thu,  3 Jun 2021 23:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhFCVR3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Jun 2021 17:17:29 -0400
Received: from mail-pj1-f74.google.com ([209.85.216.74]:54078 "EHLO
        mail-pj1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhFCVR3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Jun 2021 17:17:29 -0400
Received: by mail-pj1-f74.google.com with SMTP id j1-20020a17090a7381b02901605417540bso3895136pjg.3
        for <linux-mips@vger.kernel.org>; Thu, 03 Jun 2021 14:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=I8SaxGWcB7tE5LgATQxqpPQ7x4H4jY+lCpBauP/mtmE=;
        b=v4NgbfeqtYok0nadkyQOQYhH0/cc3YuV8LeF1teBzQov02jDdA9IwtNsTjiXssKy9k
         lVffn3D6dt82OhY5gs0hFB5oIwHL8xvT9H3v1bma72ihTKCZi1Zk2t2aa014cQNa5UzD
         DbKEb//m0+o8xQowxXbRc/Ve/I2AG4LU2nQFiO1Ie2PSqxDUR3eYJihknZL3UVCMeE+w
         YWzsehJueSvNSScWsQp724tbAJe7jBiUVpwMQkL9RIzefMXHJCgYpTAoenYocG6UZYpL
         iN7fsnWE2kf++Rf5Nvrap7/nItDWAA00w2X2A9Emcq6xa8gVmhOHOT89tbfA/M9ij5Tz
         eQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=I8SaxGWcB7tE5LgATQxqpPQ7x4H4jY+lCpBauP/mtmE=;
        b=r2WWXjSWp6K+nzIQX8rzW2vcUgR4mBmdxHe3ivwp/WfD7xlEgHFdIwmRmYvzNgrzYW
         /MkLO6BJiJ3iOX/y5fb4CU5DYGwRgfBZAUxtOs4FC/rt2Tf1F3/EUVfKPUmpZO1dOVYv
         Qn79zMfsGgwK0EU+HcsG3vC8uYTJ5GaByKJzExyYgy0I+Jva9ExjlMWdchHFwLBdRxKa
         dhhO7N4obgNQJ46AK5G3BtLQeZbEX7SiCTi0StpjHu7AiPbFY0H4P5wtJe/GMpMream8
         VnrvYmQhe89j4SdyK5vhp1E5+r6R6/lvmbdvQM484iJWgdgomLN3IysH1DKZBL/ATkUk
         19hw==
X-Gm-Message-State: AOAM530Ad1PNvn0BvZTiLP3WmI6mBnyvM6BkwJH1ESt3av5Y78a3hSrO
        Tc2sCFe+NikdbZRN6FhK5r+lklpUI5wehq/d3A==
X-Google-Smtp-Source: ABdhPJzU0E7qL3ArY231F/yeQk8juDRb1mHPctFM8DztGr6M0q3AK+ihMrnxdraTAHhl5MR5gudSicYWtrl8rO80Sg==
X-Received: from jgzg.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:1acf])
 (user=jingzhangos job=sendgmr) by 2002:a17:902:6bc7:b029:ee:f84f:1093 with
 SMTP id m7-20020a1709026bc7b02900eef84f1093mr936835plt.37.1622754870972; Thu,
 03 Jun 2021 14:14:30 -0700 (PDT)
Date:   Thu,  3 Jun 2021 21:14:22 +0000
Message-Id: <20210603211426.790093-1-jingzhangos@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
Subject: [PATCH v7 0/4] KVM statistics data fd-based binary interface
From:   Jing Zhang <jingzhangos@google.com>
To:     KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.cs.columbia.edu>,
        LinuxMIPS <linux-mips@vger.kernel.org>,
        KVMPPC <kvm-ppc@vger.kernel.org>,
        LinuxS390 <linux-s390@vger.kernel.org>,
        Linuxkselftest <linux-kselftest@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Peter Shier <pshier@google.com>,
        Oliver Upton <oupton@google.com>,
        David Rientjes <rientjes@google.com>,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        David Matlack <dmatlack@google.com>,
        Ricardo Koller <ricarkol@google.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>
Cc:     Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patchset provides a file descriptor for every VM and VCPU to read
KVM statistics data in binary format.
It is meant to provide a lightweight, flexible, scalable and efficient
lock-free solution for user space telemetry applications to pull the
statistics data periodically for large scale systems. The pulling
frequency could be as high as a few times per second.
In this patchset, every statistics data are treated to have some
attributes as below:
  * architecture dependent or generic
  * VM statistics data or VCPU statistics data
  * type: cumulative, instantaneous,
  * unit: none for simple counter, nanosecond, microsecond,
    millisecond, second, Byte, KiByte, MiByte, GiByte. Clock Cycles
Since no lock/synchronization is used, the consistency between all
the statistics data is not guaranteed. That means not all statistics
data are read out at the exact same time, since the statistics date
are still being updated by KVM subsystems while they are read out.

---

* v6 -> v7
  - Improve file descriptor allocation function by Krish suggestion
  - Use "generic stats" instead of "common stats" as Krish suggested
  - Addressed some other nits from Krish and David Matlack

* v5 -> v6
  - Use designated initializers for STATS_DESC
  - Change KVM_STATS_SCALE... to KVM_STATS_BASE...
  - Use a common function for kvm_[vm|vcpu]_stats_read
  - Fix some documentation errors/missings
  - Use TEST_ASSERT in selftest
  - Use a common function for [vm|vcpu]_stats_test in selftest

* v4 -> v5
  - Rebase to kvm/queue, commit a4345a7cecfb ("Merge tag
    'kvmarm-fixes-5.13-1'")
  - Change maximum stats name length to 48
  - Replace VM_STATS_COMMON/VCPU_STATS_COMMON macros with stats
    descriptor definition macros.
  - Fixed some errors/warnings reported by checkpatch.pl

* v3 -> v4
  - Rebase to kvm/queue, commit 9f242010c3b4 ("KVM: avoid "deadlock"
    between install_new_memslots and MMU notifier")
  - Use C-stype comments in the whole patch
  - Fix wrong count for x86 VCPU stats descriptors
  - Fix KVM stats data size counting and validity check in selftest

* v2 -> v3
  - Rebase to kvm/queue, commit edf408f5257b ("KVM: avoid "deadlock"
    between install_new_memslots and MMU notifier")
  - Resolve some nitpicks about format

* v1 -> v2
  - Use ARRAY_SIZE to count the number of stats descriptors
  - Fix missing `size` field initialization in macro STATS_DESC

[1] https://lore.kernel.org/kvm/20210402224359.2297157-1-jingzhangos@google.com
[2] https://lore.kernel.org/kvm/20210415151741.1607806-1-jingzhangos@google.com
[3] https://lore.kernel.org/kvm/20210423181727.596466-1-jingzhangos@google.com
[4] https://lore.kernel.org/kvm/20210429203740.1935629-1-jingzhangos@google.com
[5] https://lore.kernel.org/kvm/20210517145314.157626-1-jingzhangos@google.com
[6] https://lore.kernel.org/kvm/20210524151828.4113777-1-jingzhangos@google.com

---

Jing Zhang (4):
  KVM: stats: Separate generic stats from architecture specific ones
  KVM: stats: Add fd-based API to read binary stats data
  KVM: stats: Add documentation for statistics data binary interface
  KVM: selftests: Add selftest for KVM statistics data binary interface

 Documentation/virt/kvm/api.rst                | 180 +++++++++++++++
 arch/arm64/include/asm/kvm_host.h             |   9 +-
 arch/arm64/kvm/guest.c                        |  38 +++-
 arch/mips/include/asm/kvm_host.h              |   9 +-
 arch/mips/kvm/mips.c                          |  64 +++++-
 arch/powerpc/include/asm/kvm_host.h           |   9 +-
 arch/powerpc/kvm/book3s.c                     |  64 +++++-
 arch/powerpc/kvm/book3s_hv.c                  |  12 +-
 arch/powerpc/kvm/book3s_pr.c                  |   2 +-
 arch/powerpc/kvm/book3s_pr_papr.c             |   2 +-
 arch/powerpc/kvm/booke.c                      |  59 ++++-
 arch/s390/include/asm/kvm_host.h              |   9 +-
 arch/s390/kvm/kvm-s390.c                      | 129 ++++++++++-
 arch/x86/include/asm/kvm_host.h               |   9 +-
 arch/x86/kvm/x86.c                            |  67 +++++-
 include/linux/kvm_host.h                      | 141 +++++++++++-
 include/linux/kvm_types.h                     |  12 +
 include/uapi/linux/kvm.h                      |  50 ++++
 tools/testing/selftests/kvm/.gitignore        |   1 +
 tools/testing/selftests/kvm/Makefile          |   3 +
 .../testing/selftests/kvm/include/kvm_util.h  |   3 +
 .../selftests/kvm/kvm_binary_stats_test.c     | 215 ++++++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |  12 +
 virt/kvm/kvm_main.c                           | 169 +++++++++++++-
 24 files changed, 1178 insertions(+), 90 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/kvm_binary_stats_test.c


base-commit: a4345a7cecfb91ae78cd43d26b0c6a956420761a
-- 
2.32.0.rc1.229.g3e70b5a671-goog

