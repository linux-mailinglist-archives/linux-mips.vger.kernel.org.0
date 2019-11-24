Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 373D9108397
	for <lists+linux-mips@lfdr.de>; Sun, 24 Nov 2019 15:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbfKXOHt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Nov 2019 09:07:49 -0500
Received: from mga04.intel.com ([192.55.52.120]:52659 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726803AbfKXOHt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Nov 2019 09:07:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Nov 2019 06:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,238,1571727600"; 
   d="scan'208";a="408068358"
Received: from cvg-ubt08.iil.intel.com ([143.185.152.138])
  by fmsmga005.fm.intel.com with ESMTP; 24 Nov 2019 06:07:47 -0800
From:   Vladimir Kondratiev <vladimir.kondratiev@intel.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vladimir Kondratiev <vladimir.kondratiev@intel.com>
Subject: [PATCH] mips: cacheinfo: report shared CPU map
Date:   Sun, 24 Nov 2019 16:07:31 +0200
Message-Id: <20191124140731.24430-1-vladimir.kondratiev@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Report L1 caches as shared per core; L2 - per cluster.

This fixes "perf" that went crazy if shared_cpu_map attribute not
reported on sysfs, in form of

/sys/devices/system/cpu/cpu*/cache/index*/shared_cpu_list
/sys/devices/system/cpu/cpu*/cache/index*/shared_cpu_map

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
---
 arch/mips/kernel/cacheinfo.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/cacheinfo.c b/arch/mips/kernel/cacheinfo.c
index f777e44653d5..47312c529410 100644
--- a/arch/mips/kernel/cacheinfo.c
+++ b/arch/mips/kernel/cacheinfo.c
@@ -50,6 +50,25 @@ static int __init_cache_level(unsigned int cpu)
 	return 0;
 }
 
+static void fill_cpumask_siblings(int cpu, cpumask_t *cpu_map)
+{
+	int cpu1;
+
+	for_each_possible_cpu(cpu1)
+		if (cpus_are_siblings(cpu, cpu1))
+			cpumask_set_cpu(cpu1, cpu_map);
+}
+
+static void fill_cpumask_cluster(int cpu, cpumask_t *cpu_map)
+{
+	int cpu1;
+	int cluster = cpu_cluster(&cpu_data[cpu]);
+
+	for_each_possible_cpu(cpu1)
+		if (cpu_cluster(&cpu_data[cpu1]) == cluster)
+			cpumask_set_cpu(cpu1, cpu_map);
+}
+
 static int __populate_cache_leaves(unsigned int cpu)
 {
 	struct cpuinfo_mips *c = &current_cpu_data;
@@ -57,14 +76,20 @@ static int __populate_cache_leaves(unsigned int cpu)
 	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
 
 	if (c->icache.waysize) {
+		/* L1 caches are per core */
+		fill_cpumask_siblings(cpu, &this_leaf->shared_cpu_map);
 		populate_cache(dcache, this_leaf, 1, CACHE_TYPE_DATA);
+		fill_cpumask_siblings(cpu, &this_leaf->shared_cpu_map);
 		populate_cache(icache, this_leaf, 1, CACHE_TYPE_INST);
 	} else {
 		populate_cache(dcache, this_leaf, 1, CACHE_TYPE_UNIFIED);
 	}
 
-	if (c->scache.waysize)
+	if (c->scache.waysize) {
+		/* L2 cache is per cluster */
+		fill_cpumask_cluster(cpu, &this_leaf->shared_cpu_map);
 		populate_cache(scache, this_leaf, 2, CACHE_TYPE_UNIFIED);
+	}
 
 	if (c->tcache.waysize)
 		populate_cache(tcache, this_leaf, 3, CACHE_TYPE_UNIFIED);
-- 
2.20.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

