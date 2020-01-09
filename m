Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D26E313591C
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 13:23:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730885AbgAIMXt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 07:23:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:35270 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728653AbgAIMXt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 07:23:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 12D44B2181;
        Thu,  9 Jan 2020 12:23:45 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] MIPS: mm: Place per_cpu on different nodes, if NUMA is enabled
Date:   Thu,  9 Jan 2020 13:23:31 +0100
Message-Id: <20200109122331.4109-3-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109122331.4109-1-tbogendoerfer@suse.de>
References: <20200109122331.4109-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Implement placing of per_cpu into memory, which is local to the CPU.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/Kconfig   |  8 ++++++++
 arch/mips/mm/init.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ed8e28b0fb3e..cf56b3211a2b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2696,6 +2696,14 @@ config NUMA
 config SYS_SUPPORTS_NUMA
 	bool
 
+config HAVE_SETUP_PER_CPU_AREA
+	def_bool y
+	depends on NUMA
+
+config NEED_PER_CPU_EMBED_FIRST_CHUNK
+	def_bool y
+	depends on NUMA
+
 config RELOCATABLE
 	bool "Relocatable kernel"
 	depends on SYS_SUPPORTS_RELOCATABLE && (CPU_MIPS32_R2 || CPU_MIPS64_R2 || CPU_MIPS32_R6 || CPU_MIPS64_R6 || CAVIUM_OCTEON_SOC)
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 50f9ed8c6c1b..79684000de0e 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -508,6 +508,51 @@ void __ref free_initmem(void)
 		free_initmem_default(POISON_FREE_INITMEM);
 }
 
+#ifdef CONFIG_HAVE_SETUP_PER_CPU_AREA
+unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
+EXPORT_SYMBOL(__per_cpu_offset);
+
+static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
+{
+	return node_distance(cpu_to_node(from), cpu_to_node(to));
+}
+
+static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size,
+				       size_t align)
+{
+	return memblock_alloc_try_nid(size, align, __pa(MAX_DMA_ADDRESS),
+				      MEMBLOCK_ALLOC_ACCESSIBLE,
+				      cpu_to_node(cpu));
+}
+
+static void __init pcpu_fc_free(void *ptr, size_t size)
+{
+	memblock_free_early(__pa(ptr), size);
+}
+
+void __init setup_per_cpu_areas(void)
+{
+	unsigned long delta;
+	unsigned int cpu;
+	int rc;
+
+	/*
+	 * Always reserve area for module percpu variables.  That's
+	 * what the legacy allocator did.
+	 */
+	rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
+				    PERCPU_DYNAMIC_RESERVE, PAGE_SIZE,
+				    pcpu_cpu_distance,
+				    pcpu_fc_alloc, pcpu_fc_free);
+	if (rc < 0)
+		panic("Failed to initialize percpu areas.");
+
+	delta = (unsigned long)pcpu_base_addr - (unsigned long)__per_cpu_start;
+	for_each_possible_cpu(cpu)
+		__per_cpu_offset[cpu] = delta + pcpu_unit_offsets[cpu];
+}
+#endif
+
 #ifndef CONFIG_MIPS_PGD_C0_CONTEXT
 unsigned long pgd_current[NR_CPUS];
 #endif
-- 
2.24.1

