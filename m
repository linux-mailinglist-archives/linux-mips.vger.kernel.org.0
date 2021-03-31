Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5BFE349F6F
	for <lists+linux-mips@lfdr.de>; Fri, 26 Mar 2021 03:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbhCZCUO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 22:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhCZCUL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Mar 2021 22:20:11 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E9FC06174A
        for <linux-mips@vger.kernel.org>; Thu, 25 Mar 2021 19:20:11 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id e129so8308244yba.3
        for <linux-mips@vger.kernel.org>; Thu, 25 Mar 2021 19:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:message-id:mime-version:subject:from:to:cc;
        bh=H54os4ygqofHn1WGMEZDcGVdM5o6qUhwH/wT9+rGWSk=;
        b=ecGB21RKe7x71J+6hRcQeYU5JJ7wFAYU9S5q0hjnh5cFdjsPshHHo+BbrBLobCCFKv
         NZKCDM+RhzB7lqPfAOQS3wauBG9Wt6dz84hgF6QN0gdxezNEhe2IHZ9vnbrRjrQZmatX
         aA6unphmRZB9N8MgD7gtQcsLImor+8acXPyEPXdyuDiz+MgeWawbq8OlTcav3Ozoecet
         jA89TWp1kJjZ1yiJ5iklCOGzc1mwEVvY5U1Bo/RoRvmKHnulFKlRQcuSDWeTploTW+Ib
         p9YcLsgB2yhWz6jRMLj6HbocX9JL7d0WI1vXfS58F6E5owlm0a29FNCvV5oX9+xsL/Wl
         SB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
         :from:to:cc;
        bh=H54os4ygqofHn1WGMEZDcGVdM5o6qUhwH/wT9+rGWSk=;
        b=FBDQ89WrecEONYyQpU/pRT0jN7geLyxn+dtiwEaDWOpIaWfpoakjsf+XCtpSSwsROf
         XVMQ46+qbFVZC3WdGtRMBUQzzBs3hyvo9XiNLKte5BuEnidWhqRF05kJWR9vu2U3OT15
         bNHFkrcCzP4yeUvU8nwGDlLM6dFsjlmXCQB8zliN8jD7L0XP5j6jeMamqCsBD+PAHK3G
         zYn3V8+NEq2WSc3EyK/gXxQHXjg7aD3eJMaIU94OlMyLAM9EgJKr4dw3VQXCRsduUFmC
         tTvUYOQ6M0EGFkFeYFdPbpj/dL8IgKK58CnF2HpFJLABQdhqmR/M/Hce2fPOi+NvcW/v
         w6jw==
X-Gm-Message-State: AOAM531sQnZtiekbstR/J1AJd6uvT8dgrmdIncqomBDqb52anCAc0t0j
        EcoAs7RL7lS/bAVJuey3IYHUV2kMAVU=
X-Google-Smtp-Source: ABdhPJyiUWYORNUHyA8HYU5z2Afa3KK2uvzs30OB8QjgL1a1U3zQY52m5lnijJTDVWnHZyILMRS2XSl6DRU=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:f:10:b1bb:fab2:7ef5:fc7d])
 (user=seanjc job=sendgmr) by 2002:a5b:18d:: with SMTP id r13mr17361673ybl.184.1616725210248;
 Thu, 25 Mar 2021 19:20:10 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Thu, 25 Mar 2021 19:19:39 -0700
Message-Id: <20210326021957.1424875-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH 00/18] KVM: Consolidate and optimize MMU notifiers
From:   Sean Christopherson <seanjc@google.com>
To:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ben Gardon <bgardon@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The end goal of this series is to optimize the MMU notifiers to take
mmu_lock if and only if the notification is relevant to KVM, i.e. the hva
range overlaps a memslot.   Large VMs (hundreds of vCPUs) are very
sensitive to mmu_lock being taken for write at inopportune times, and
such VMs also tend to be "static", e.g. backed by HugeTLB with minimal
page shenanigans.  The vast majority of notifications for these VMs will
be spurious (for KVM), and eliding mmu_lock for spurious notifications
avoids an otherwise unacceptable disruption to the guest.

To get there without potentially degrading performance, e.g. due to
multiple memslot lookups, especially on non-x86 where the use cases are
largely unknown (from my perspective), first consolidate the MMU notifier
logic by moving the hva->gfn lookups into common KVM.

Applies on my TDP MMU TLB flushing bug fixes[*], which conflict horribly
with the TDP MMU changes in this series.  That code applies on kvm/queue
(commit 4a98623d5d90, "KVM: x86/mmu: Mark the PAE roots as decrypted for
shadow paging").

Speaking of conflicts, Ben will soon be posting a series to convert a
bunch of TDP MMU flows to take mmu_lock only for read.  Presumably there
will be an absurd number of conflicts; Ben and I will sort out the
conflicts in whichever series loses the race.

Well tested on Intel and AMD.  Compile tested for arm64, MIPS, PPC,
PPC e500, and s390.  Absolutely needs to be tested for real on non-x86,
I give it even odds that I introduced an off-by-one bug somewhere.

[*] https://lkml.kernel.org/r/20210325200119.1359384-1-seanjc@google.com


Patches 1-7 are x86 specific prep patches to play nice with moving
the hva->gfn memslot lookups into common code.  There ended up being waaay
more of these than I expected/wanted, but I had a hell of a time getting
the flushing logic right when shuffling the memslot and address space
loops.  In the end, I was more confident I got things correct by batching
the flushes.

Patch 8 moves the existing API prototypes into common code.  It could
technically be dropped since the old APIs are gone in the end, but I
thought the switch to the new APIs would suck a bit less this way.

Patch 9 moves arm64's MMU notifier tracepoints into common code so that
they are not lost when arm64 is converted to the new APIs, and so that all
architectures can benefit.

Patch 10 moves x86's memslot walkers into common KVM.  I chose x86 purely
because I could actually test it.  All architectures use nearly identical
code, so I don't think it actually matters in the end.

Patches 11-13 move arm64, MIPS, and PPC to the new APIs.

Patch 14 yanks out the old APIs.

Patch 15 adds the mmu_lock elision, but only for unpaired notifications.

Patch 16 adds mmu_lock elision for paired .invalidate_range_{start,end}().
This is quite nasty and no small part of me thinks the patch should be
burned with fire (I won't spoil it any further), but it's also the most
problematic scenario for our particular use case.  :-/

Patches 17-18 are additional x86 cleanups.

Sean Christopherson (18):
  KVM: x86/mmu: Coalesce TDP MMU TLB flushes when zapping collapsible
    SPTEs
  KVM: x86/mmu: Move flushing for "slot" handlers to caller for legacy
    MMU
  KVM: x86/mmu: Coalesce TLB flushes when zapping collapsible SPTEs
  KVM: x86/mmu: Coalesce TLB flushes across address spaces for gfn range
    zap
  KVM: x86/mmu: Pass address space ID to __kvm_tdp_mmu_zap_gfn_range()
  KVM: x86/mmu: Pass address space ID to TDP MMU root walkers
  KVM: x86/mmu: Use leaf-only loop for walking TDP SPTEs when changing
    SPTE
  KVM: Move prototypes for MMU notifier callbacks to generic code
  KVM: Move arm64's MMU notifier trace events to generic code
  KVM: Move x86's MMU notifier memslot walkers to generic code
  KVM: arm64: Convert to the gfn-based MMU notifier callbacks
  KVM: MIPS/MMU: Convert to the gfn-based MMU notifier callbacks
  KVM: PPC: Convert to the gfn-based MMU notifier callbacks
  KVM: Kill off the old hva-based MMU notifier callbacks
  KVM: Take mmu_lock when handling MMU notifier iff the hva hits a
    memslot
  KVM: Don't take mmu_lock for range invalidation unless necessary
  KVM: x86/mmu: Allow yielding during MMU notifier unmap/zap, if
    possible
  KVM: x86/mmu: Drop trace_kvm_age_page() tracepoint

 arch/arm64/include/asm/kvm_host.h             |   5 -
 arch/arm64/kvm/mmu.c                          | 118 ++----
 arch/arm64/kvm/trace_arm.h                    |  66 ----
 arch/mips/include/asm/kvm_host.h              |   5 -
 arch/mips/kvm/mmu.c                           |  97 +----
 arch/powerpc/include/asm/kvm_book3s.h         |  12 +-
 arch/powerpc/include/asm/kvm_host.h           |   7 -
 arch/powerpc/include/asm/kvm_ppc.h            |   9 +-
 arch/powerpc/kvm/book3s.c                     |  18 +-
 arch/powerpc/kvm/book3s.h                     |  10 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c           |  98 ++---
 arch/powerpc/kvm/book3s_64_mmu_radix.c        |  25 +-
 arch/powerpc/kvm/book3s_hv.c                  |  12 +-
 arch/powerpc/kvm/book3s_pr.c                  |  56 +--
 arch/powerpc/kvm/e500_mmu_host.c              |  29 +-
 arch/powerpc/kvm/trace_booke.h                |  15 -
 arch/x86/include/asm/kvm_host.h               |   6 +-
 arch/x86/kvm/mmu/mmu.c                        | 180 ++++-----
 arch/x86/kvm/mmu/mmu_internal.h               |  10 +
 arch/x86/kvm/mmu/tdp_mmu.c                    | 344 +++++++-----------
 arch/x86/kvm/mmu/tdp_mmu.h                    |  31 +-
 include/linux/kvm_host.h                      |  22 +-
 include/trace/events/kvm.h                    |  90 +++--
 tools/testing/selftests/kvm/lib/kvm_util.c    |   4 -
 .../selftests/kvm/lib/x86_64/processor.c      |   2 +
 virt/kvm/kvm_main.c                           | 312 ++++++++++++----
 26 files changed, 697 insertions(+), 886 deletions(-)

-- 
2.31.0.291.g576ba9dcdaf-goog

