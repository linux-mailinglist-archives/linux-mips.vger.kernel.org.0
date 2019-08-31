Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63BE9A42AB
	for <lists+linux-mips@lfdr.de>; Sat, 31 Aug 2019 08:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbfHaGBQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 31 Aug 2019 02:01:16 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:49510 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726579AbfHaGA5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 31 Aug 2019 02:00:57 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 2006AC3D66F954624D19;
        Sat, 31 Aug 2019 14:00:42 +0800 (CST)
Received: from localhost.localdomain (10.67.212.75) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Sat, 31 Aug 2019 14:00:34 +0800
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
        <linux-alpha@vger.kernel.org>, <nfont@linux.vnet.ibm.com>,
        <naveen.n.rao@linux.vnet.ibm.com>, <mwb@linux.vnet.ibm.com>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-s390@vger.kernel.org>,
        <linux-sh@vger.kernel.org>, <sparclinux@vger.kernel.org>,
        <tbogendoerfer@suse.de>, <linux-mips@vger.kernel.org>,
        <linuxarm@huawei.com>
Subject: [PATCH v2 3/9] alpha: numa: check the node id consistently for alpha
Date:   Sat, 31 Aug 2019 13:58:17 +0800
Message-ID: <1567231103-13237-4-git-send-email-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.212.75]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

According to Section 6.2.14 from ACPI spec 6.3 [1], the setting
of proximity domain is optional, as below:

This optional object is used to describe proximity domain
associations within a machine. _PXM evaluates to an integer
that identifies a device as belonging to a Proximity Domain
defined in the System Resource Affinity Table (SRAT).

This patch checks node id with the below case before returning
node_to_cpumask_map[node]:
1. if node_id >= nr_node_ids, return cpu_none_mask
2. if node_id < 0, return cpu_online_mask
3. if node_to_cpumask_map[node_id] is NULL, return cpu_online_mask

[1] https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf

Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
---
note node_to_cpumask_map[node] is already a pointer, so the
cpumask_clear should be called with node_to_cpumask_map[node]
instead of &node_to_cpumask_map[node]? And cpumask_of_node()
function need to be inlined when defined in a header file?
If the above are problems, maybe another patch to fix or clean
it up.
---
 arch/alpha/include/asm/topology.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/topology.h b/arch/alpha/include/asm/topology.h
index 5a77a40..9e0b1cd1 100644
--- a/arch/alpha/include/asm/topology.h
+++ b/arch/alpha/include/asm/topology.h
@@ -30,8 +30,11 @@ static const struct cpumask *cpumask_of_node(int node)
 {
 	int cpu;
 
-	if (node == NUMA_NO_NODE)
-		return cpu_all_mask;
+	if (node >= nr_node_ids)
+		return cpu_none_mask;
+
+	if (node < 0 || !node_to_cpumask_map[node])
+		return cpu_online_mask;
 
 	cpumask_clear(&node_to_cpumask_map[node]);
 
-- 
2.8.1

