Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC1741973D
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 17:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235084AbhI0PHi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 11:07:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29492 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235047AbhI0PHa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Sep 2021 11:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632755152;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f/HHyeg0+GwuPLl2jWGnV38CZ5EQkuWlO7qvLwGoJwY=;
        b=YkiSGBGAWDmvtEuhjHnlcQhVEQzE0v7P6uJoAAMl5U4BY6wM/evC29zFNkA4r2OEtWXNw+
        mrKjFM180zjVWJzA7uwAzVC5bLErL2yNHfx418Pt2OuILFW9eN2GkVnjiJicW/TWCyQO+2
        78u8bCUgyV5G7zEzdP3xmkESKtYd+Jo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-LphJMSUKMNCkKMmVn-ZL5A-1; Mon, 27 Sep 2021 11:05:49 -0400
X-MC-Unique: LphJMSUKMNCkKMmVn-ZL5A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4481C801E72;
        Mon, 27 Sep 2021 15:05:46 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D1CC060C13;
        Mon, 27 Sep 2021 15:05:41 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Jianyong Wu <Jianyong.Wu@arm.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-snps-arc@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-mm@kvack.org,
        kexec@lists.infradead.org
Subject: [PATCH v1 2/4] memblock: allow to specify flags with memblock_add_node()
Date:   Mon, 27 Sep 2021 17:05:16 +0200
Message-Id: <20210927150518.8607-3-david@redhat.com>
In-Reply-To: <20210927150518.8607-1-david@redhat.com>
References: <20210927150518.8607-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We want to specify flags when hotplugging memory. Let's prepare to pass
flags to memblock_add_node() by adjusting all existing users.

Note that when hotplugging memory the system is already up and running
and we don't want to add the memory first and apply flags later: it
should happen within one memblock call.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/arc/mm/init.c               | 4 ++--
 arch/ia64/mm/contig.c            | 2 +-
 arch/ia64/mm/init.c              | 2 +-
 arch/m68k/mm/mcfmmu.c            | 3 ++-
 arch/m68k/mm/motorola.c          | 6 ++++--
 arch/mips/loongson64/init.c      | 4 +++-
 arch/mips/sgi-ip27/ip27-memory.c | 3 ++-
 arch/s390/kernel/setup.c         | 3 ++-
 include/linux/memblock.h         | 3 ++-
 include/linux/mm.h               | 2 +-
 mm/memblock.c                    | 9 +++++----
 mm/memory_hotplug.c              | 2 +-
 12 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index 699ecf119641..110eb69e9bee 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -59,13 +59,13 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 
 		low_mem_sz = size;
 		in_use = 1;
-		memblock_add_node(base, size, 0);
+		memblock_add_node(base, size, 0, MEMBLOCK_NONE);
 	} else {
 #ifdef CONFIG_HIGHMEM
 		high_mem_start = base;
 		high_mem_sz = size;
 		in_use = 1;
-		memblock_add_node(base, size, 1);
+		memblock_add_node(base, size, 1, MEMBLOCK_NONE);
 		memblock_reserve(base, size);
 #endif
 	}
diff --git a/arch/ia64/mm/contig.c b/arch/ia64/mm/contig.c
index 42e025cfbd08..24901d809301 100644
--- a/arch/ia64/mm/contig.c
+++ b/arch/ia64/mm/contig.c
@@ -153,7 +153,7 @@ find_memory (void)
 	efi_memmap_walk(find_max_min_low_pfn, NULL);
 	max_pfn = max_low_pfn;
 
-	memblock_add_node(0, PFN_PHYS(max_low_pfn), 0);
+	memblock_add_node(0, PFN_PHYS(max_low_pfn), 0, MEMBLOCK_NONE);
 
 	find_initrd();
 
diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
index 5c6da8d83c1a..5d165607bf35 100644
--- a/arch/ia64/mm/init.c
+++ b/arch/ia64/mm/init.c
@@ -378,7 +378,7 @@ int __init register_active_ranges(u64 start, u64 len, int nid)
 #endif
 
 	if (start < end)
-		memblock_add_node(__pa(start), end - start, nid);
+		memblock_add_node(__pa(start), end - start, nid, MEMBLOCK_NONE);
 	return 0;
 }
 
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index eac9dde65193..6f1f25125294 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -174,7 +174,8 @@ void __init cf_bootmem_alloc(void)
 	m68k_memory[0].addr = _rambase;
 	m68k_memory[0].size = _ramend - _rambase;
 
-	memblock_add_node(m68k_memory[0].addr, m68k_memory[0].size, 0);
+	memblock_add_node(m68k_memory[0].addr, m68k_memory[0].size, 0,
+			  MEMBLOCK_NONE);
 
 	/* compute total pages in system */
 	num_pages = PFN_DOWN(_ramend - _rambase);
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 3a653f0a4188..e80c5d7e6728 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -410,7 +410,8 @@ void __init paging_init(void)
 
 	min_addr = m68k_memory[0].addr;
 	max_addr = min_addr + m68k_memory[0].size;
-	memblock_add_node(m68k_memory[0].addr, m68k_memory[0].size, 0);
+	memblock_add_node(m68k_memory[0].addr, m68k_memory[0].size, 0,
+			  MEMBLOCK_NONE);
 	for (i = 1; i < m68k_num_memory;) {
 		if (m68k_memory[i].addr < min_addr) {
 			printk("Ignoring memory chunk at 0x%lx:0x%lx before the first chunk\n",
@@ -421,7 +422,8 @@ void __init paging_init(void)
 				(m68k_num_memory - i) * sizeof(struct m68k_mem_info));
 			continue;
 		}
-		memblock_add_node(m68k_memory[i].addr, m68k_memory[i].size, i);
+		memblock_add_node(m68k_memory[i].addr, m68k_memory[i].size, i,
+				  MEMBLOCK_NONE);
 		addr = m68k_memory[i].addr + m68k_memory[i].size;
 		if (addr > max_addr)
 			max_addr = addr;
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index 76e0a9636a0e..4ac5ba80bbf6 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -77,7 +77,9 @@ void __init szmem(unsigned int node)
 				(u32)node_id, mem_type, mem_start, mem_size);
 			pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
 				start_pfn, end_pfn, num_physpages);
-			memblock_add_node(PFN_PHYS(start_pfn), PFN_PHYS(node_psize), node);
+			memblock_add_node(PFN_PHYS(start_pfn),
+					  PFN_PHYS(node_psize), node,
+					  MEMBLOCK_NONE);
 			break;
 		case SYSTEM_RAM_RESERVED:
 			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index 6173684b5aaa..adc2faeecf7c 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -341,7 +341,8 @@ static void __init szmem(void)
 				continue;
 			}
 			memblock_add_node(PFN_PHYS(slot_getbasepfn(node, slot)),
-					  PFN_PHYS(slot_psize), node);
+					  PFN_PHYS(slot_psize), node,
+					  MEMBLOCK_NONE);
 		}
 	}
 }
diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
index 67e5fff96ee0..f3943f15af6e 100644
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@ -593,7 +593,8 @@ static void __init setup_resources(void)
 	 * part of the System RAM resource.
 	 */
 	if (crashk_res.end) {
-		memblock_add_node(crashk_res.start, resource_size(&crashk_res), 0);
+		memblock_add_node(crashk_res.start, resource_size(&crashk_res),
+				  0, MEMBLOCK_NONE);
 		memblock_reserve(crashk_res.start, resource_size(&crashk_res));
 		insert_resource(&iomem_resource, &crashk_res);
 	}
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 34de69b3b8ba..b49a58f621bc 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -100,7 +100,8 @@ static inline void memblock_discard(void) {}
 #endif
 
 void memblock_allow_resize(void);
-int memblock_add_node(phys_addr_t base, phys_addr_t size, int nid);
+int memblock_add_node(phys_addr_t base, phys_addr_t size, int nid,
+		      enum memblock_flags flags);
 int memblock_add(phys_addr_t base, phys_addr_t size);
 int memblock_remove(phys_addr_t base, phys_addr_t size);
 int memblock_free(phys_addr_t base, phys_addr_t size);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 73a52aba448f..0117cb35b212 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2447,7 +2447,7 @@ static inline unsigned long get_num_physpages(void)
  * unsigned long max_zone_pfns[MAX_NR_ZONES] = {max_dma, max_normal_pfn,
  * 							 max_highmem_pfn};
  * for_each_valid_physical_page_range()
- * 	memblock_add_node(base, size, nid)
+ *	memblock_add_node(base, size, nid, MEMBLOCK_NONE)
  * free_area_init(max_zone_pfns);
  */
 void free_area_init(unsigned long *max_zone_pfn);
diff --git a/mm/memblock.c b/mm/memblock.c
index 184dcd2e5d99..47a56b223141 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -655,6 +655,7 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
  * @base: base address of the new region
  * @size: size of the new region
  * @nid: nid of the new region
+ * @flags: flags of the new region
  *
  * Add new memblock region [@base, @base + @size) to the "memory"
  * type. See memblock_add_range() description for mode details
@@ -663,14 +664,14 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
  * 0 on success, -errno on failure.
  */
 int __init_memblock memblock_add_node(phys_addr_t base, phys_addr_t size,
-				       int nid)
+				      int nid, enum memblock_flags flags)
 {
 	phys_addr_t end = base + size - 1;
 
-	memblock_dbg("%s: [%pa-%pa] nid=%d %pS\n", __func__,
-		     &base, &end, nid, (void *)_RET_IP_);
+	memblock_dbg("%s: [%pa-%pa] nid=%d flags=%x %pS\n", __func__,
+		     &base, &end, nid, flags, (void *)_RET_IP_);
 
-	return memblock_add_range(&memblock.memory, base, size, nid, 0);
+	return memblock_add_range(&memblock.memory, base, size, nid, flags);
 }
 
 /**
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 917b3528636d..5f873e7f5b29 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1385,7 +1385,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	mem_hotplug_begin();
 
 	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
-		ret = memblock_add_node(start, size, nid);
+		ret = memblock_add_node(start, size, nid, MEMBLOCK_NONE);
 		if (ret)
 			goto error_mem_hotplug_end;
 	}
-- 
2.31.1

