Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6D9420872
	for <lists+linux-mips@lfdr.de>; Mon,  4 Oct 2021 11:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbhJDJiv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Oct 2021 05:38:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41217 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232438AbhJDJih (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Oct 2021 05:38:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633340208;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dQ5qf/RGyPqHDe2Xfgi4FmwNjzvbpfi1e20kaeeKaFg=;
        b=AHDWQhZfSTdyoOtXZKby7SN8MxOQvuz28ZiTVzl+K6XolXvSexiE7QyYD4iiLmzMgBiPwh
        WErvmGz/TY5f72rfYNi94QT7v+nmvODMADZKKFfDeA4W8ofvQB9jNLNL9bHqUg1EaKg6BY
        PovxF0WmtfpBpwNAtq3EQTpkdDMHr2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-XHLzkwtLPdKX-AgWX9OSXw-1; Mon, 04 Oct 2021 05:36:45 -0400
X-MC-Unique: XHLzkwtLPdKX-AgWX9OSXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9186E1922960;
        Mon,  4 Oct 2021 09:36:42 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.159])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BD2CD100763D;
        Mon,  4 Oct 2021 09:36:34 +0000 (UTC)
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
Subject: [PATCH v2 4/5] memblock: add MEMBLOCK_DRIVER_MANAGED to mimic IORESOURCE_SYSRAM_DRIVER_MANAGED
Date:   Mon,  4 Oct 2021 11:36:04 +0200
Message-Id: <20211004093605.5830-5-david@redhat.com>
In-Reply-To: <20211004093605.5830-1-david@redhat.com>
References: <20211004093605.5830-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Let's add a flag that corresponds to IORESOURCE_SYSRAM_DRIVER_MANAGED,
indicating that we're dealing with a memory region that is never
indicated in the firmware-provided memory map, but always detected and
added by a driver.

Similar to MEMBLOCK_HOTPLUG, most infrastructure has to treat such memory
regions like ordinary MEMBLOCK_NONE memory regions -- for example, when
selecting memory regions to add to the vmcore for dumping in the
crashkernel via for_each_mem_range().

However, especially kexec_file is not supposed to select such memblocks via
for_each_free_mem_range() / for_each_free_mem_range_reverse() to place
kexec images, similar to how we handle IORESOURCE_SYSRAM_DRIVER_MANAGED
without CONFIG_ARCH_KEEP_MEMBLOCK.

We'll make sure that memory hotplug code sets the flag where applicable
(IORESOURCE_SYSRAM_DRIVER_MANAGED) next. This prepares architectures
that need CONFIG_ARCH_KEEP_MEMBLOCK, such as arm64, for virtio-mem
support.

Note that kexec *must not* indicate this memory to the second kernel
and *must not* place kexec-images on this memory. Let's add a comment to
kexec_walk_memblock(), documenting how we handle MEMBLOCK_DRIVER_MANAGED
now just like using IORESOURCE_SYSRAM_DRIVER_MANAGED in
locate_mem_hole_callback() for kexec_walk_resources().

Also note that MEMBLOCK_HOTPLUG cannot be reused due to different
semantics:
	MEMBLOCK_HOTPLUG: memory is indicated as "System RAM" in the
	firmware-provided memory map and added to the system early during
	boot; kexec *has to* indicate this memory to the second kernel and
	can place kexec-images on this memory. After memory hotunplug,
	kexec has to be re-armed. We mostly ignore this flag when
	"movable_node" is not set on the kernel command line, because
	then we're told to not care about hotunpluggability of such
	memory regions.

	MEMBLOCK_DRIVER_MANAGED: memory is not indicated as "System RAM" in
	the firmware-provided memory map; this memory is always detected
	and added to the system by a driver; memory might not actually be
	physically hotunpluggable. kexec *must not* indicate this memory to
	the second kernel and *must not* place kexec-images on this memory.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/memblock.h | 16 ++++++++++++++--
 kernel/kexec_file.c      |  5 +++++
 mm/memblock.c            |  4 ++++
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 2bc726e43a1b..b3b29ccf91f3 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -37,12 +37,17 @@ extern unsigned long long max_possible_pfn;
  * @MEMBLOCK_NOMAP: don't add to kernel direct mapping and treat as
  * reserved in the memory map; refer to memblock_mark_nomap() description
  * for further details
+ * @MEMBLOCK_DRIVER_MANAGED: memory region that is always detected and added
+ * via a driver, and never indicated in the firmware-provided memory map as
+ * system RAM. This corresponds to IORESOURCE_SYSRAM_DRIVER_MANAGED in the
+ * kernel resource tree.
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
 	MEMBLOCK_HOTPLUG	= 0x1,	/* hotpluggable region */
 	MEMBLOCK_MIRROR		= 0x2,	/* mirrored region */
 	MEMBLOCK_NOMAP		= 0x4,	/* don't add to kernel direct mapping */
+	MEMBLOCK_DRIVER_MANAGED = 0x8,	/* always detected via a driver */
 };
 
 /**
@@ -213,7 +218,8 @@ static inline void __next_physmem_range(u64 *idx, struct memblock_type *type,
  */
 #define for_each_mem_range(i, p_start, p_end) \
 	__for_each_mem_range(i, &memblock.memory, NULL, NUMA_NO_NODE,	\
-			     MEMBLOCK_HOTPLUG, p_start, p_end, NULL)
+			     MEMBLOCK_HOTPLUG | MEMBLOCK_DRIVER_MANAGED, \
+			     p_start, p_end, NULL)
 
 /**
  * for_each_mem_range_rev - reverse iterate through memblock areas from
@@ -224,7 +230,8 @@ static inline void __next_physmem_range(u64 *idx, struct memblock_type *type,
  */
 #define for_each_mem_range_rev(i, p_start, p_end)			\
 	__for_each_mem_range_rev(i, &memblock.memory, NULL, NUMA_NO_NODE, \
-				 MEMBLOCK_HOTPLUG, p_start, p_end, NULL)
+				 MEMBLOCK_HOTPLUG | MEMBLOCK_DRIVER_MANAGED,\
+				 p_start, p_end, NULL)
 
 /**
  * for_each_reserved_mem_range - iterate over all reserved memblock areas
@@ -254,6 +261,11 @@ static inline bool memblock_is_nomap(struct memblock_region *m)
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

