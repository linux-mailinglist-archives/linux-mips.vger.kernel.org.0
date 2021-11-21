Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7326B4582AE
	for <lists+linux-mips@lfdr.de>; Sun, 21 Nov 2021 10:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237312AbhKUJ2M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Nov 2021 04:28:12 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:15845 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235298AbhKUJ2M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 21 Nov 2021 04:28:12 -0500
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HxlNS4C08z90xJ;
        Sun, 21 Nov 2021 17:24:40 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 17:25:04 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 17:25:03 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     <dennis@kernel.org>, <akpm@linux-foundation.org>,
        <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC:     <tj@kernel.org>, <gregkh@linuxfoundation.org>, <cl@linux.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <tsbogend@alpha.franken.de>, <mpe@ellerman.id.au>,
        <benh@kernel.crashing.org>, <paulus@samba.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <davem@davemloft.net>,
        <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
        <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-ia64@vger.kernel.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
        <sparclinux@vger.kernel.org>, <x86@kernel.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH RFC 0/4] mm: percpu: Cleanup percpu first chunk funciton
Date:   Sun, 21 Nov 2021 17:35:53 +0800
Message-ID: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When support page mapping percpu first chunk allocator on arm64, we
found there are lots of duplicated codes in percpu embed/page first
chunk allocator. This patchset is aimed to cleanup them and should
no funciton change, only test on arm64.

Kefeng Wang (4):
  mm: percpu: Generalize percpu related config
  mm: percpu: Add pcpu_fc_cpu_to_node_fn_t typedef
  mm: percpu: Add generic pcpu_fc_alloc/free funciton
  mm: percpu: Add generic pcpu_populate_pte() function

 arch/arm64/Kconfig             |  20 +----
 arch/ia64/Kconfig              |   9 +--
 arch/mips/Kconfig              |  10 +--
 arch/mips/mm/init.c            |  14 +---
 arch/powerpc/Kconfig           |  17 +---
 arch/powerpc/kernel/setup_64.c |  92 +--------------------
 arch/riscv/Kconfig             |  10 +--
 arch/sparc/Kconfig             |  12 +--
 arch/sparc/kernel/smp_64.c     | 105 +-----------------------
 arch/x86/Kconfig               |  17 +---
 arch/x86/kernel/setup_percpu.c |  66 ++-------------
 drivers/base/arch_numa.c       |  68 +---------------
 include/linux/percpu.h         |  13 +--
 mm/Kconfig                     |  12 +++
 mm/percpu.c                    | 143 +++++++++++++++++++++++++--------
 15 files changed, 165 insertions(+), 443 deletions(-)

-- 
2.26.2

