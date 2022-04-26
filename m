Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A71EB50F038
	for <lists+linux-mips@lfdr.de>; Tue, 26 Apr 2022 07:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244324AbiDZFmZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Apr 2022 01:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242999AbiDZFmZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Apr 2022 01:42:25 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EFAF326F1
        for <linux-mips@vger.kernel.org>; Mon, 25 Apr 2022 22:39:18 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id t12-20020a170902a5cc00b001590717a080so10702666plq.10
        for <linux-mips@vger.kernel.org>; Mon, 25 Apr 2022 22:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=wiy4ZFErG6M19mqQHUKpS1yTWJiAAlT4dR/xLvJk6Hw=;
        b=FnVqBEYT/x+/otkeQ3+MGU8nRgioALOZEJyWRms+DoU60vLvG4knvZ85+k1mr3tVc0
         vqArKWu7LcXihZYZOL7dZijR1qW/fUI1ogYdryU7KR30je7tEjpL7SWeqEnnd/Z0l+6p
         oQzkcbfWngpMAliZPhAsfXTSWCnwz8fWFa74DRSIzlIoZx+NC9CPJeMNUZ3R63A72PJf
         QZcKxPUm3H1SOIAqby7P9meP48e3oR4Bh8C/ma3u+fJEHhbZdFo9brPFPEbwbLiTho1C
         Qvh2BmXNRXBqnJccxzxqqdYZqemamQonwCzTKOX5d0cQHIkgbJ7rHfmHl0679wZSmYIx
         AFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=wiy4ZFErG6M19mqQHUKpS1yTWJiAAlT4dR/xLvJk6Hw=;
        b=LJq8kFhsHrkjRdpThCaUCdVrx3+1gvfW+864uKKZmEtmZjQ89wdAKG4kKeqSn+C5jd
         D84OjL6djXrho0RpoYJ6EPIG8gzEzHu3vVugRbJWTp5nI50wOCF2lIzuPiGlH/VYca9o
         csOp9K8p32dgNQoRP+KAk4Danf33kfFAVdeRETHb4o9N5EzoLWWB1g/hpQjak1SzOXNU
         ENno8kdNpC2ZUN7oIBTQHnFyRwvN9Q3fkqyLTQ1oUqYNlA2cnXuxs+Etm9bvEtSULs5u
         aayP4Iphobmx1aX3Z1HR1PLcu7TviwQ4uhe2DTVlhn9ZHspiNCH68XpV97mPhzqTVmxU
         E0Lg==
X-Gm-Message-State: AOAM533FDuV9upIG0alKw7y8EQ7Oyy20nytGo1xc0KW2yCAZvvKtRkcX
        qgyV20IFjq2EtKiXZqZkR0pX8lX5ZzamiFO/
X-Google-Smtp-Source: ABdhPJxvg8pZpaAGbW2v0JTDOhNhWaI7b9G2UFmwsQAHLCDtYBjVtAQ+AyjheoLnE1s4SzV5HxUjB6H2aYquwIV1
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:2327])
 (user=yosryahmed job=sendgmr) by 2002:a05:6a00:8c8:b0:4fe:ecb:9b8f with SMTP
 id s8-20020a056a0008c800b004fe0ecb9b8fmr22623121pfu.55.1650951557634; Mon, 25
 Apr 2022 22:39:17 -0700 (PDT)
Date:   Tue, 26 Apr 2022 05:38:58 +0000
Message-Id: <20220426053904.3684293-1-yosryahmed@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
Subject: [PATCH v3 0/6] KVM: mm: count KVM page table pages in memory stats
From:   Yosry Ahmed <yosryahmed@google.com>
To:     Sean Christopherson <seanjc@google.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeelb@google.com>,
        James Morse <james.morse@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
        Marc Zyngier <maz@kernel.org>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We keep track of several kernel memory stats (total kernel memory, page
tables, stack, vmalloc, etc) on multiple levels (global, per-node,
per-memcg, etc). These stats give insights to users to how much memory
is used by the kernel and for what purposes.

Currently, memory used by kvm for its page tables is not accounted in
any of those kernel memory stats. This patch series accounts the memory
pages used by KVM for page tables in those stats in a new
NR_SECONDARY_PAGETABLE stat.

The riscv and mips patches are not tested due to lack of
resources. Feel free to test or drop them.

Changes in V3:
- Added NR_SECONDARY_PAGETABLE instead of piggybacking on NR_PAGETABLE
  stats.

Changes in V2:
- Added accounting stats for other archs than x86.
- Changed locations in the code where x86 KVM page table stats were
  accounted based on suggestions from Sean Christopherson.


Yosry Ahmed (6):
  mm: add NR_SECONDARY_PAGETABLE stat
  KVM: mmu: add a helper to account page table pages used by KVM.
  KVM: x86/mmu: count KVM page table pages in pagetable stats
  KVM: arm64/mmu: count KVM page table pages in pagetable stats
  KVM: riscv/mmu: count KVM page table pages in pagetable stats
  KVM: mips/mmu: count KVM page table pages in pagetable stats

 arch/arm64/kernel/image-vars.h |  3 ++
 arch/arm64/kvm/hyp/pgtable.c   | 50 +++++++++++++++++++++-------------
 arch/mips/kvm/mips.c           |  1 +
 arch/mips/kvm/mmu.c            |  9 +++++-
 arch/riscv/kvm/mmu.c           | 26 +++++++++++++-----
 arch/x86/kvm/mmu/mmu.c         | 16 +++++++++--
 arch/x86/kvm/mmu/tdp_mmu.c     | 16 +++++++++--
 drivers/base/node.c            |  2 ++
 fs/proc/meminfo.c              |  2 ++
 include/linux/kvm_host.h       |  9 ++++++
 include/linux/mmzone.h         |  1 +
 mm/memcontrol.c                |  1 +
 mm/page_alloc.c                |  6 +++-
 mm/vmstat.c                    |  1 +
 14 files changed, 111 insertions(+), 32 deletions(-)

-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

