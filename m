Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A678659BB6B
	for <lists+linux-mips@lfdr.de>; Mon, 22 Aug 2022 10:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233956AbiHVIXt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Aug 2022 04:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233354AbiHVIXp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Aug 2022 04:23:45 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7CB615A;
        Mon, 22 Aug 2022 01:23:32 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MB50n281BznTgN;
        Mon, 22 Aug 2022 16:21:13 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 22 Aug 2022 16:23:29 +0800
From:   Yicong Yang <yangyicong@huawei.com>
To:     <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
        <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <linux-doc@vger.kernel.org>
CC:     <corbet@lwn.net>, <peterz@infradead.org>, <arnd@arndb.de>,
        <linux-kernel@vger.kernel.org>, <darren@os.amperecomputing.com>,
        <yangyicong@hisilicon.com>, <huzhanyuan@oppo.com>,
        <lipeifeng@oppo.com>, <zhangshiming@oppo.com>, <guojian@oppo.com>,
        <realmz6@gmail.com>, <linux-mips@vger.kernel.org>,
        <openrisc@lists.librecores.org>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
        Barry Song <21cnbao@gmail.com>, <wangkefeng.wang@huawei.com>,
        <xhao@linux.alibaba.com>, <prime.zeng@hisilicon.com>,
        <anshuman.khandual@arm.com>
Subject: [PATCH v3 0/4] mm: arm64: bring up BATCHED_UNMAP_TLB_FLUSH
Date:   Mon, 22 Aug 2022 16:21:16 +0800
Message-ID: <20220822082120.8347-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Yicong Yang <yangyicong@hisilicon.com>

Though ARM64 has the hardware to do tlb shootdown, the hardware
broadcasting is not free.
A simplest micro benchmark shows even on snapdragon 888 with only
8 cores, the overhead for ptep_clear_flush is huge even for paging
out one page mapped by only one process:
5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush

While pages are mapped by multiple processes or HW has more CPUs,
the cost should become even higher due to the bad scalability of
tlb shootdown.

The same benchmark can result in 16.99% CPU consumption on ARM64
server with around 100 cores according to Yicong's test on patch
4/4.

This patchset leverages the existing BATCHED_UNMAP_TLB_FLUSH by
1. only send tlbi instructions in the first stage -
	arch_tlbbatch_add_mm()
2. wait for the completion of tlbi by dsb while doing tlbbatch
	sync in arch_tlbbatch_flush()
My testing on snapdragon shows the overhead of ptep_clear_flush
is removed by the patchset. The micro benchmark becomes 5% faster
even for one page mapped by single process on snapdragon 888.

-v3:
1. Declare arch's tlbbatch defer support by arch_tlbbatch_should_defer() instead
   of ARCH_HAS_MM_CPUMASK, per Barry and Kefeng
2. Add Tested-by from Xin Hao
Link: https://lore.kernel.org/linux-mm/20220711034615.482895-1-21cnbao@gmail.com/

-v2:
1. Collected Yicong's test result on kunpeng920 ARM64 server;
2. Removed the redundant vma parameter in arch_tlbbatch_add_mm()
   according to the comments of Peter Zijlstra and Dave Hansen
3. Added ARCH_HAS_MM_CPUMASK rather than checking if mm_cpumask
   is empty according to the comments of Nadav Amit

Thanks, Peter, Dave and Nadav for your testing or reviewing
, and comments.

-v1:
https://lore.kernel.org/lkml/20220707125242.425242-1-21cnbao@gmail.com/

Anshuman Khandual (1):
  mm/tlbbatch: Introduce arch_tlbbatch_should_defer()

Barry Song (3):
  Revert "Documentation/features: mark BATCHED_UNMAP_TLB_FLUSH doesn't
    apply to ARM64"
  mm: rmap: Extend tlbbatch APIs to fit new platforms
  arm64: support batched/deferred tlb shootdown during page reclamation

 Documentation/features/arch-support.txt       |  1 -
 .../features/vm/TLB/arch-support.txt          |  2 +-
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/include/asm/tlbbatch.h             | 12 ++++++++
 arch/arm64/include/asm/tlbflush.h             | 28 +++++++++++++++++--
 arch/x86/include/asm/tlbflush.h               | 15 +++++++++-
 mm/rmap.c                                     | 19 +++++--------
 7 files changed, 61 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm64/include/asm/tlbbatch.h

-- 
2.24.0

