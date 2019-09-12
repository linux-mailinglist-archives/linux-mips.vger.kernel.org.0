Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C61D0B0CA7
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2019 12:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731014AbfILKSe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Sep 2019 06:18:34 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:32822 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730933AbfILKSC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Sep 2019 06:18:02 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id E0D3EE4F4C909DB8B2FA;
        Thu, 12 Sep 2019 18:17:56 +0800 (CST)
Received: from localhost.localdomain (10.67.212.75) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Thu, 12 Sep 2019 18:17:54 +0800
From:   Yunsheng Lin <linyunsheng@huawei.com>
To:     <catalin.marinas@arm.com>, <will@kernel.org>, <mingo@redhat.com>,
        <bp@alien8.de>, <rth@twiddle.net>, <ink@jurassic.park.msu.ru>,
        <mattst88@gmail.com>, <benh@kernel.crashing.org>,
        <paulus@samba.org>, <mpe@ellerman.id.au>,
        <heiko.carstens@de.ibm.com>, <gor@linux.ibm.com>,
        <borntraeger@de.ibm.com>, <ysato@users.sourceforge.jp>,
        <dalias@libc.org>, <davem@davemloft.net>, <ralf@linux-mips.org>,
        <paul.burton@mips.com>, <jhogan@kernel.org>,
        <jiaxun.yang@flygoat.com>, <chenhc@lemote.com>
CC:     <akpm@linux-foundation.org>, <rppt@linux.ibm.com>,
        <anshuman.khandual@arm.com>, <tglx@linutronix.de>, <cai@lca.pw>,
        <robin.murphy@arm.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <hpa@zytor.com>, <x86@kernel.org>,
        <dave.hansen@linux.intel.com>, <luto@kernel.org>,
        <peterz@infradead.org>, <len.brown@intel.com>, <axboe@kernel.dk>,
        <dledford@redhat.com>, <jeffrey.t.kirsher@intel.com>,
        <linux-alpha@vger.kernel.org>, <naveen.n.rao@linux.vnet.ibm.com>,
        <mwb@linux.vnet.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
        <sparclinux@vger.kernel.org>, <tbogendoerfer@suse.de>,
        <linux-mips@vger.kernel.org>, <rafael@kernel.org>,
        <mhocko@kernel.org>, <gregkh@linuxfoundation.org>
Subject: [PATCH v3 0/8] make node_to_cpumask_map() NUMA_NO_NODE aware
Date:   Thu, 12 Sep 2019 18:15:26 +0800
Message-ID: <1568283334-178380-1-git-send-email-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.212.75]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When passing the return value of dev_to_node() to cpumask_of_node()
without checking the node id if the node id is NUMA_NO_NODE, there is
global-out-of-bounds detected by KASAN:

[   42.970381] ==================================================================
[   42.977595] BUG: KASAN: global-out-of-bounds in __bitmap_weight+0x48/0xb0
[   42.984370] Read of size 8 at addr ffff20008cdf8790 by task kworker/0:1/13
[   42.991230]
[   42.992712] CPU: 0 PID: 13 Comm: kworker/0:1 Tainted: G           O      5.2.0-rc4-g8bde06a-dirty #3
[   43.001830] Hardware name: Huawei TaiShan 2280 V2/BC82AMDA, BIOS TA BIOS 2280-A CS V2.B050.01 08/08/2019
[   43.011298] Workqueue: events work_for_cpu_fn
[   43.015643] Call trace:
[   43.018078]  dump_backtrace+0x0/0x1e8
[   43.021727]  show_stack+0x14/0x20
[   43.025031]  dump_stack+0xc4/0xfc
[   43.028335]  print_address_description+0x178/0x270
[   43.033113]  __kasan_report+0x164/0x1b8
[   43.036936]  kasan_report+0xc/0x18
[   43.040325]  __asan_load8+0x84/0xa8
[   43.043801]  __bitmap_weight+0x48/0xb0
[   43.047552]  hclge_init_ae_dev+0x988/0x1e78 [hclge]
[   43.052418]  hnae3_register_ae_dev+0xcc/0x278 [hnae3]
[   43.057467]  hns3_probe+0xe0/0x120 [hns3]
[   43.061464]  local_pci_probe+0x74/0xf0
[   43.065200]  work_for_cpu_fn+0x2c/0x48
[   43.068937]  process_one_work+0x3c0/0x878
[   43.072934]  worker_thread+0x400/0x670
[   43.076670]  kthread+0x1b0/0x1b8
[   43.079885]  ret_from_fork+0x10/0x18
[   43.083446]
[   43.084925] The buggy address belongs to the variable:
[   43.090052]  numa_distance+0x30/0x40
[   43.093613]
[   43.095091] Memory state around the buggy address:
[   43.099870]  ffff20008cdf8680: fa fa fa fa 04 fa fa fa fa fa fa fa 00 00 fa fa
[   43.107078]  ffff20008cdf8700: fa fa fa fa 04 fa fa fa fa fa fa fa 00 fa fa fa
[   43.114286] >ffff20008cdf8780: fa fa fa fa 00 00 00 00 00 00 00 00 fa fa fa fa
[   43.121494]                          ^
[   43.125230]  ffff20008cdf8800: 01 fa fa fa fa fa fa fa 04 fa fa fa fa fa fa fa
[   43.132439]  ffff20008cdf8880: fa fa fa fa fa fa fa fa 00 00 fa fa fa fa fa fa
[   43.139646] ==================================================================

From the discussion [1], NUMA_NO_NODE really means no node affinity,
which also means all cpus should be usable. So the cpumask_of_node()
should always return all cpus online when user passes the node id
as NUMA_NO_NODE, just like similar semantic that page allocator handles
NUMA_NO_NODE.

But we cannot really copy the page allocator logic. Simply because the
page allocator doesn't enforce the near node affinity. It just picks it
up as a preferred node but then it is free to fallback to any other numa
node. This is not the case here and node_to_cpumask_map will only restrict
to the particular node's cpus which would have really non deterministic
behavior depending on where the code is executed. So in fact we really
want to return cpu_online_mask for NUMA_NO_NODE.

Note:
1. Only arm64 has been compile tested and tested on real board.
2. x86 has been compile tested with defconfig.
3. Other arch has not been compile tested or tested on real board.

Change log:
V3: Change to only handle NUMA_NO_NODE, and return cpu_online_mask
    for NUMA_NO_NODE case, and change the commit log to better justify
    the change, drop sh arch change since it always return cpu_online_mask.

Yunsheng Lin (8):
  arm64: numa: make node_to_cpumask_map() NUMA_NO_NODE aware for arm64
  x86: numa: make node_to_cpumask_map() NUMA_NO_NODE aware for x86
  alpha: numa: make node_to_cpumask_map() NUMA_NO_NODE aware for alpha
  powerpc: numa: make node_to_cpumask_map() NUMA_NO_NODE aware for
    powerpc
  s390: numa: make node_to_cpumask_map() NUMA_NO_NODE aware for s390
  sparc64: numa: make node_to_cpumask_map() NUMA_NO_NODE aware for
    sparc64
  mips: numa: make node_to_cpumask_map() NUMA_NO_NODE aware for mips
  mips: numa: make node_to_cpumask_map() NUMA_NO_NODE aware for
    loongson64

 arch/alpha/include/asm/topology.h                | 2 +-
 arch/arm64/include/asm/numa.h                    | 3 +++
 arch/arm64/mm/numa.c                             | 5 ++++-
 arch/mips/include/asm/mach-ip27/topology.h       | 4 ++--
 arch/mips/include/asm/mach-loongson64/topology.h | 4 +++-
 arch/powerpc/include/asm/topology.h              | 4 ++--
 arch/s390/include/asm/topology.h                 | 3 +++
 arch/sparc/include/asm/topology_64.h             | 4 ++--
 arch/x86/include/asm/topology.h                  | 3 +++
 arch/x86/mm/numa.c                               | 7 +++++--
 10 files changed, 28 insertions(+), 11 deletions(-)

-- 
2.8.1

