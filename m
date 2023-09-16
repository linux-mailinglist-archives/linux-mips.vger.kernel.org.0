Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 484DA7A2C14
	for <lists+linux-mips@lfdr.de>; Sat, 16 Sep 2023 02:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238551AbjIPAcW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Sep 2023 20:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238567AbjIPAcI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Sep 2023 20:32:08 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86721724
        for <linux-mips@vger.kernel.org>; Fri, 15 Sep 2023 17:31:21 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d81d85aae7cso2235756276.0
        for <linux-mips@vger.kernel.org>; Fri, 15 Sep 2023 17:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824281; x=1695429081; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+v3gsOh/890lJDyi2atnrT8KioShqwRzfV2UUthNgY=;
        b=b40n4bscN2MNWMcVcR/3PuDbA1U6Kpge+yAN/Dzju6yhwIco9ZvODpk+ARmz85cfUJ
         JuEgdjsbhS5bLNRuBMdAOyCvUTZuTUSCvH1xoaZgHczP8t9PDQ21HYu/j2fq13oaHni3
         nMCyv6qRO++OPtcVndCPH10l3M749Ml6MKZ8dzr6YGMG08xNns8CttiC/BRXTaqnCYK1
         2+6LHvawxBADd2N9e8rda5Jg3Jl4kX5hqXNZtBKfgQ7TpmeNjCNnWahfGJrtAPPcLoX6
         F6vlfbV/CAt/Gbb5CWVmDB/I3pUcLjDnLaoFG3mdymfsOxSMQgHOlTCXmq7a+NMrNDjY
         4u4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824281; x=1695429081;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d+v3gsOh/890lJDyi2atnrT8KioShqwRzfV2UUthNgY=;
        b=kKVA55HdjcSoSyCUTeFrdbyp2JCvOjp/iP2m5HDoImph8xU3mmL6YgxdZMz56Vluuf
         22PIM9BKLSvl0yqKx1rMPO2OQJGdAQNE+lpKjvwxyQ6yhOrTbjv1Kx+Avw+Q6d47+Mz7
         kL4LlJ6lhKZ7OFqU4loJZPgvwkvJ88tQPZzgDoEbP9lpXlxgcCkbOggoaTSFdTlrK7CH
         n3AZ201UycUZxtdIWWXvW9UCq8SvQ5GQI2djkGI49DV5Eahe8wIMJ++YxqdCJV6WWeGO
         Djd6p4B6rJrgLPRA0m9vvkG4QbgrcNYUaiCc7Sel66tq3OSts8OBEbdvSKqn71yGiiJl
         k8uQ==
X-Gm-Message-State: AOJu0YwcEDz4pyQfYh494bf0Ju53z8exblf8HSZ7yFVnHouUyywvM1lg
        Oo5FvP0TzbhsTgQRObED2SaAE+EQGnQ=
X-Google-Smtp-Source: AGHT+IHwIfgzmidHRVnFwyjq5xxKkTsUmzHH5rOWwrOCjAKfiyYkOEMh1VsVt19qwGFmjKKFISeZq6Tx90c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:554:0:b0:d47:3d35:1604 with SMTP id
 81-20020a250554000000b00d473d351604mr95244ybf.2.1694824280932; Fri, 15 Sep
 2023 17:31:20 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri, 15 Sep 2023 17:30:52 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-1-seanjc@google.com>
Subject: [PATCH 00/26] KVM: vfio: Hide KVM internals from others
From:   Sean Christopherson <seanjc@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Jason Herne <jjherne@linux.ibm.com>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Andy Lutomirski <luto@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        Anish Ghulati <aghulati@google.com>,
        Venkatesh Srinivas <venkateshs@chromium.org>,
        Andrew Thornton <andrewth@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
        USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is a borderline RFC series to hide KVM's internals from the rest of
the kernel, where "internals" means data structures, enums, #defines,
APIs, etc. that are intended to be KVM-only, but are exposed everywhere
due to kvm_host.h (and other headers) living in the global include paths.

The motiviation for hiding KVM's internals is to allow *safely* loading a
"new" KVM module without having to reboot the host.  Where "new" doesn't
have to be strictly newer, just a different incarnation of KVM.  Hiding
KVM's internals means those assets can change across KVM instances without
breaking things, e.g. would allow modifying the layout of struct kvm_vcpu
to introduce new fields related to a new feature or mitigation for hardware
bugs.

The end goal for all of this is to allow loading and running multiple
instances of KVM (the module) simultaneously on a single host, e.g. to
deploy fixes, mitigations, and/or new features without having to drain
all VMs from the host.

For now, the immediate goal is to get KVM to a state where KVM x86 doesn't
expose anything to the broader world that isn't intended for external
consumption, e.g. the page write-tracking APIs used by KVM-GT.

I say this is borderline RFC because I don't think I've "formally" proposed
the idea of hiding KVM internals before now.  I decided not to tag this RFC
because the changes ended up being not _that_ invasive, and everything
before the last six patches is worthwhile even if hiding internals is
ultimately rejected (IMO).

This would ideally be ~5 separate series, and I certainly have no objection
if that's how we want to get this stuff merged.  E.g. (1) VFIO cleanups,
(2) drop HAVE_KVM, (3) clean up makefiles, (4) x86 perf cleanup, and
(5) final push for hiding state.  The HAVE_KVM and virt/kvm include stuff
isn't strictly necessary, but I included them here because they're
relatively minor (in the grand scheme).

We've explore several alternatives to the #ifdef __KVM__ approach, and
they all sucked, hard.  What I really wanted (and still want) to do, is to
bury the bulk of kvm_host.h (and other KVM headers) in virt/kvm, but every
attempt to do that ended in flames.  Even with the __KVM__ guards in place,
each architecture's kvm_host.h is too intertwined with the common kvm_host.h,
and trying to extract small-ish pieces just doesn't work (each patch
inevitably snowballed into a gigantic beast).

The other idea we considered (which I thought of, and feel dirty for even
proposing it internally), is to move all headers under virt/kvm, add
virt/kvm/include to the global header path, and then have KVM x86 omit
virt/kvm/include when configured to hide KVM internals.  I hate this idea
because it sets a bad precedent, and requires a lot of file movement
without providing any benefit to other architectures.  E.g. I hope that
guarding KVM internals with #ifdef __KVM__ will allow us to slowly clean
things up so that some day KVM only exposes a handful of APIs to the rest
of the kernel (probably a pipe dream).

Anish Ghulati (1):
  KVM: arm64: Move arm_{psci,hypercalls}.h to an internal KVM path

Sean Christopherson (25):
  vfio: Wrap KVM helpers with CONFIG_KVM instead of CONFIG_HAVE_KVM
  vfio: Move KVM get/put helpers to colocate it with other KVM related
    code
  virt: Declare and define vfio_file_set_kvm() iff CONFIG_KVM is enabled
  vfio: Add struct to hold KVM assets and dedup group vs. iommufd code
  vfio: KVM: Pass get/put helpers from KVM to VFIO, don't do circular
    lookup
  KVM: Drop CONFIG_KVM_VFIO and just look at KVM+VFIO
  x86/idt: Wrap KVM logic with CONFIG_KVM instead of CONFIG_HAVE_KVM
  KVM: x86: Stop selecting and depending on HAVE_KVM
  KVM: arm64: Stop selecting and depending on HAVE_KVM
  KVM: s390: Stop selecting and depending on HAVE_KVM
  KVM: MIPS: Make HAVE_KVM a MIPS-only Kconfig
  KVM: arm64: Include KVM headers to get forward declarations
  KVM: arm64: Move ARM specific headers in include/kvm to arch directory
  KVM: Move include/kvm/iodev.h to include/linux as kvm_iodev.h
  KVM: MIPS: Stop adding virt/kvm to the arch include path
  KVM: PPC: Stop adding virt/kvm to the arch include path
  KVM: s390: Stop adding virt/kvm to the arch include path
  KVM: Standardize include paths across all architectures
  perf/x86: KVM: Have perf define a dedicated struct for getting guest
    PEBS data
  entry/kvm: Drop @vcpu param from arch_xfer_to_guest_mode_handle_work()
  entry/kvm: KVM: Move KVM details related to signal/-EINTR into KVM
    proper
  KVM: arm64: Move and consolidate "public" functions in asm/kvm_host.h
  powerpc/xics: Move declaration of xics_wake_cpu() out of kvm_ppc.h
  KVM: PPC: Rearrange code in kvm_ppc.h to isolate "public" information
  KVM: Hide KVM internal data structures and values from kernel at-large

 MAINTAINERS                                   |   1 -
 arch/arm64/Kconfig                            |   1 -
 .../arm64/include/asm/kvm_arch_timer.h        |   2 +
 arch/arm64/include/asm/kvm_emulate.h          |   3 +
 arch/arm64/include/asm/kvm_host.h             |  57 ++--
 arch/arm64/include/asm/kvm_mmu.h              |   4 +
 .../arm64/include/asm/kvm_pmu.h               |   2 +
 .../arm64/include/asm/kvm_vgic.h              |   2 +-
 arch/arm64/kernel/asm-offsets.c               |   2 +
 arch/arm64/kvm/Kconfig                        |   2 -
 arch/arm64/kvm/Makefile                       |   2 -
 arch/arm64/kvm/arch_timer.c                   |   5 +-
 arch/arm64/kvm/arm.c                          |   9 +-
 {include => arch/arm64}/kvm/arm_hypercalls.h  |   0
 {include => arch/arm64}/kvm/arm_psci.h        |   0
 arch/arm64/kvm/guest.c                        |   2 +-
 arch/arm64/kvm/handle_exit.c                  |   2 +-
 arch/arm64/kvm/hyp/Makefile                   |   4 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h       |   4 +-
 arch/arm64/kvm/hyp/nvhe/Makefile              |   3 +-
 arch/arm64/kvm/hyp/nvhe/switch.c              |   4 +-
 arch/arm64/kvm/hyp/vhe/Makefile               |   2 +-
 arch/arm64/kvm/hyp/vhe/switch.c               |   4 +-
 arch/arm64/kvm/hypercalls.c                   |   4 +-
 arch/arm64/kvm/pmu-emul.c                     |   6 +-
 arch/arm64/kvm/psci.c                         |   4 +-
 arch/arm64/kvm/pvtime.c                       |   2 +-
 arch/arm64/kvm/reset.c                        |   3 +-
 arch/arm64/kvm/trace_arm.h                    |   2 +-
 arch/arm64/kvm/trng.c                         |   2 +-
 arch/arm64/kvm/vgic/vgic-debug.c              |   2 +-
 arch/arm64/kvm/vgic/vgic-init.c               |   2 +-
 arch/arm64/kvm/vgic/vgic-irqfd.c              |   2 +-
 arch/arm64/kvm/vgic/vgic-kvm-device.c         |   2 +-
 arch/arm64/kvm/vgic/vgic-mmio-v2.c            |   4 +-
 arch/arm64/kvm/vgic/vgic-mmio-v3.c            |   4 +-
 arch/arm64/kvm/vgic/vgic-mmio.c               |   6 +-
 arch/arm64/kvm/vgic/vgic-v2.c                 |   2 +-
 arch/arm64/kvm/vgic/vgic-v3.c                 |   2 +-
 arch/mips/include/asm/kvm_host.h              |   5 +-
 arch/mips/kernel/asm-offsets.c                |   2 +
 arch/mips/kvm/Kconfig                         |   3 +
 arch/mips/kvm/Makefile                        |   2 -
 arch/powerpc/include/asm/kvm_book3s.h         |   3 +
 arch/powerpc/include/asm/kvm_book3s_64.h      |   2 +
 arch/powerpc/include/asm/kvm_booke.h          |   4 +
 arch/powerpc/include/asm/kvm_host.h           |   7 +-
 arch/powerpc/include/asm/kvm_ppc.h            | 306 +++++++++---------
 arch/powerpc/include/asm/xics.h               |   3 +
 arch/powerpc/kernel/asm-offsets.c             |   1 +
 arch/powerpc/kvm/Kconfig                      |   1 -
 arch/powerpc/kvm/Makefile                     |   2 -
 arch/powerpc/kvm/mpic.c                       |   2 +-
 arch/riscv/include/asm/kvm_host.h             |   3 +
 arch/riscv/kernel/asm-offsets.c               |   1 +
 arch/riscv/kvm/Makefile                       |   2 -
 arch/riscv/kvm/aia_aplic.c                    |   2 +-
 arch/riscv/kvm/aia_imsic.c                    |   2 +-
 arch/riscv/kvm/vcpu.c                         |   2 +-
 arch/s390/Kconfig                             |   1 -
 arch/s390/include/asm/kvm_host.h              |   7 +-
 arch/s390/kernel/asm-offsets.c                |   1 +
 arch/s390/kvm/Kconfig                         |   2 -
 arch/s390/kvm/Makefile                        |   2 -
 arch/x86/Kconfig                              |   1 -
 arch/x86/events/core.c                        |   5 +-
 arch/x86/events/intel/core.c                  |  18 +-
 arch/x86/events/perf_event.h                  |   3 +-
 arch/x86/include/asm/hardirq.h                |   2 +-
 arch/x86/include/asm/idtentry.h               |   2 +-
 arch/x86/include/asm/irq.h                    |   2 +-
 arch/x86/include/asm/irq_vectors.h            |   2 +-
 arch/x86/include/asm/kvm_host.h               |  12 +-
 arch/x86/include/asm/perf_event.h             |  12 +-
 arch/x86/kernel/idt.c                         |   2 +-
 arch/x86/kernel/irq.c                         |   4 +-
 arch/x86/kvm/Kconfig                          |   3 -
 arch/x86/kvm/Makefile                         |   1 -
 arch/x86/kvm/i8254.h                          |   2 +-
 arch/x86/kvm/ioapic.h                         |   2 +-
 arch/x86/kvm/irq.h                            |   2 +-
 arch/x86/kvm/lapic.h                          |   2 +-
 arch/x86/kvm/vmx/pmu_intel.c                  |  16 +-
 arch/x86/kvm/vmx/vmx.c                        |  11 +-
 arch/x86/kvm/vmx/vmx.h                        |   2 +-
 arch/x86/kvm/x86.c                            |   3 +-
 drivers/s390/crypto/vfio_ap_drv.c             |   1 +
 drivers/s390/crypto/vfio_ap_ops.c             |   2 +
 drivers/vfio/device_cdev.c                    |   9 +-
 drivers/vfio/group.c                          |  18 +-
 drivers/vfio/vfio.h                           |  26 +-
 drivers/vfio/vfio_main.c                      | 139 ++++----
 include/linux/entry-kvm.h                     |  10 +-
 include/linux/kvm_host.h                      |  17 +-
 include/{kvm/iodev.h => linux/kvm_iodev.h}    |   0
 include/linux/kvm_types.h                     |   3 +
 include/linux/vfio.h                          |   6 +-
 include/trace/events/kvm.h                    |   5 +
 kernel/entry/kvm.c                            |  13 +-
 scripts/gdb/linux/constants.py.in             |   2 +-
 scripts/gdb/linux/interrupts.py               |   2 +-
 tools/arch/x86/include/asm/irq_vectors.h      |   2 +-
 virt/kvm/Kconfig                              |   6 -
 virt/kvm/Makefile.kvm                         |   6 +-
 virt/kvm/coalesced_mmio.c                     |   3 +-
 virt/kvm/eventfd.c                            |   2 +-
 virt/kvm/kvm_main.c                           |   3 +-
 virt/kvm/vfio.c                               |   9 +-
 virt/kvm/vfio.h                               |   2 +-
 109 files changed, 489 insertions(+), 440 deletions(-)
 rename include/kvm/arm_arch_timer.h => arch/arm64/include/asm/kvm_arch_timer.h (98%)
 rename include/kvm/arm_pmu.h => arch/arm64/include/asm/kvm_pmu.h (99%)
 rename include/kvm/arm_vgic.h => arch/arm64/include/asm/kvm_vgic.h (99%)
 rename {include => arch/arm64}/kvm/arm_hypercalls.h (100%)
 rename {include => arch/arm64}/kvm/arm_psci.h (100%)
 rename include/{kvm/iodev.h => linux/kvm_iodev.h} (100%)


base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.42.0.459.ge4e396fd5e-goog

