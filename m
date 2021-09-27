Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8553E419741
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 17:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235053AbhI0PHk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 11:07:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33828 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235069AbhI0PHf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Sep 2021 11:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632755157;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IXtVRZZ4VG4VKdaLmU64Y/xSRw+uB9sGtv3RuAELTns=;
        b=BBNfnFqXH60CHipnjkkBZdKqhiu5FgJ6n/YqpLiVz1OBMqCwbCMrmsVkOb6dhaTzEeheYS
        DkBJxNeYP7m2CZOkY1EXEqLeI9VLoVpKTT/oaEEhSffnnnJknFbWsU5DfUt6IjRyU+Ao7D
        4mFkBwjzICWDHtV8exm1EIX+imLIcTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-3Qz6qLwMMqC7uaL1kAt7pg-1; Mon, 27 Sep 2021 11:05:53 -0400
X-MC-Unique: 3Qz6qLwMMqC7uaL1kAt7pg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE18A1926DB4;
        Mon, 27 Sep 2021 15:05:50 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9015060C17;
        Mon, 27 Sep 2021 15:05:46 +0000 (UTC)
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
Subject: [PATCH v1 3/4] memblock: add MEMBLOCK_DRIVER_MANAGED to mimic IORESOURCE_SYSRAM_DRIVER_MANAGED
Date:   Mon, 27 Sep 2021 17:05:17 +0200
Message-Id: <20210927150518.8607-4-david@redhat.com>
In-Reply-To: <20210927150518.8607-1-david@redhat.com>
References: <20210927150518.8607-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Let's add a flag that corresponds to IORESOURCE_SYSRAM_DRIVER_MANAGED.
Similar to MEMBLOCK_HOTPLUG, most infrastructure has to treat such memory
like ordinary MEMBLOCK_NONE memory -- for example, when selecting memory
regions to add to the vmcore for dumping in the crashkernel via
for_each_mem_range().

However, especially kexec_file is not supposed to select such memblocks via
for_each_free_mem_range() / for_each_free_mem_range_reverse() to place
kexec images, similar to how we handle IORESOURCE_SYSRAM_DRIVER_MANAGED
without CONFIG_ARCH_KEEP_MEMBLOCK.

Let's document why kexec_walk_memblock() won't try placing images on
areas marked MEMBLOCK_DRIVER_MANAGED -- similar to
IORESOURCE_SYSRAM_DRIVER_MANAGED handling in locate_mem_hole_callback()
via kexec_walk_resources().

We'll make sure that memory hotplug code sets the flag where applicable
(IORESOURCE_SYSRAM_DRIVER_MANAGED) next. This prepares architectures
that need CONFIG_ARCH_KEEP_MEMBLOCK, such as arm64, for virtio-mem
support.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/memblock.h | 16 ++++++++++++++--
 kernel/kexec_file.c      |  5 +++++
 mm/memblock.c            |  4 ++++
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index b49a58f621bc..7d8d656d5082 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -33,12 +33,17 @@ extern unsigned long long max_possible_pfn;
  * @MEMBLOCK_NOMAP: don't add to kernel direct mapping and treat as
  * reserved in the memory map; refer to memblock_mark_nomap() description
  * for further details
+ * @MEMBLOCK_DRIVER_MANAGED: memory region that is always detected via a driver,
+ * corresponding to IORESOURCE_SYSRAM_DRIVER_MANAGED in the kernel resource
+ * tree. Especially kexec should never use this memory for placing images and
+ * shouldn't expose this memory to the second kernel.
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
 	MEMBLOCK_HOTPLUG	= 0x1,	/* hotpluggable region */
 	MEMBLOCK_MIRROR		= 0x2,	/* mirrored region */
 	MEMBLOCK_NOMAP		= 0x4,	/* don't add to kernel direct mapping */
+	MEMBLOCK_DRIVER_MANAGED = 0x8,	/* always detected via a driver */
 };
 
 /**
@@ -209,7 +214,8 @@ static inline void __next_physmem_range(u64 *idx, struct memblock_type *type,
  */
 #define for_each_mem_range(i, p_start, p_end) \
 	__for_each_mem_range(i, &memblock.memory, NULL, NUMA_NO_NODE,	\
-			     MEMBLOCK_HOTPLUG, p_start, p_end, NULL)
+			     MEMBLOCK_HOTPLUG | MEMBLOCK_DRIVER_MANAGED, \
+			     p_start, p_end, NULL)
 
 /**
  * for_each_mem_range_rev - reverse iterate through memblock areas from
@@ -220,7 +226,8 @@ static inline void __next_physmem_range(u64 *idx, struct memblock_type *type,
  */
 #define for_each_mem_range_rev(i, p_start, p_end)			\
 	__for_each_mem_range_rev(i, &memblock.memory, NULL, NUMA_NO_NODE, \
-				 MEMBLOCK_HOTPLUG, p_start, p_end, NULL)
+				 MEMBLOCK_HOTPLUG | MEMBLOCK_DRIVER_MANAGED,\
+				 p_start, p_end, NULL)
 
 /**
  * for_each_reserved_mem_range - iterate over all reserved memblock areas
@@ -250,6 +257,11 @@ static inline bool memblock_is_nomap(struct memblock_region *m)
 	return m->flags & MEMBLOCK_NOMAP;
 }
 
+static inline bool memblock_is_driver_managed(struct memblock_region *m)
+{
+	return m->flags & MEMBLOCK_DRIVER_MANAGED;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 33400ff051a8..8347fc158d2b 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -556,6 +556,11 @@ static int kexec_walk_memblock(struct kexec_buf *kbuf,
 	if (kbuf->image->type == KEXEC_TYPE_CRASH)
 		return func(&crashk_res, kbuf);
 
+	/*
+	 * Using MEMBLOCK_NONE will properly skip MEMBLOCK_DRIVER_MANAGED. See
+	 * IORESOURCE_SYSRAM_DRIVER_MANAGED handling in
+	 * locate_mem_hole_callback().
+	 */
 	if (kbuf->top_down) {
 		for_each_free_mem_range_reverse(i, NUMA_NO_NODE, MEMBLOCK_NONE,
 						&mstart, &mend, NULL) {
diff --git a/mm/memblock.c b/mm/memblock.c
index 47a56b223141..540a35317fb0 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -979,6 +979,10 @@ static bool should_skip_region(struct memblock_type *type,
 	if (!(flags & MEMBLOCK_NOMAP) && memblock_is_nomap(m))
 		return true;
 
+	/* skip driver-managed memory unless we were asked for it explicitly */
+	if (!(flags & MEMBLOCK_DRIVER_MANAGED) && memblock_is_driver_managed(m))
+		return true;
+
 	return false;
 }
 
-- 
2.31.1

