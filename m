Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECD3420876
	for <lists+linux-mips@lfdr.de>; Mon,  4 Oct 2021 11:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232461AbhJDJix (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Oct 2021 05:38:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57733 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232458AbhJDJip (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Oct 2021 05:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633340216;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=65rZyeBSOs3Q4+ni7NpmP4KZICyvZvVHfeOoz1UxwGM=;
        b=XruKF3h3C7KGD+bcHcsp2d1t7L3gHtlGYjNTLEC5p5I6cvnVM8l6H57qLcfSD1sN+63mcF
        mL5QDJ1J04yqEXVP+Ye07rc0Ev43GM8zGHqfJeFkrwp6iceB8sqHYimjdBpau1HJImf4sq
        ZYiUV3/jFmP12khfo5zW083OZVxQT/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-sIowyth_M46viQW4UzuBQg-1; Mon, 04 Oct 2021 05:36:55 -0400
X-MC-Unique: sIowyth_M46viQW4UzuBQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8321F10168C6;
        Mon,  4 Oct 2021 09:36:52 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.159])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F0EC210013C1;
        Mon,  4 Oct 2021 09:36:42 +0000 (UTC)
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
Subject: [PATCH v2 5/5] mm/memory_hotplug: indicate MEMBLOCK_DRIVER_MANAGED with IORESOURCE_SYSRAM_DRIVER_MANAGED
Date:   Mon,  4 Oct 2021 11:36:05 +0200
Message-Id: <20211004093605.5830-6-david@redhat.com>
In-Reply-To: <20211004093605.5830-1-david@redhat.com>
References: <20211004093605.5830-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Let's communicate driver-managed regions to memblock, to properly
teach kexec_file with CONFIG_ARCH_KEEP_MEMBLOCK to not place images on
these memory regions.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory_hotplug.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 5f873e7f5b29..6d90818d4ce8 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1357,6 +1357,7 @@ bool mhp_supports_memmap_on_memory(unsigned long size)
 int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 {
 	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
+	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
 	struct vmem_altmap mhp_altmap = {};
 	struct memory_group *group = NULL;
 	u64 start, size;
@@ -1385,7 +1386,9 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	mem_hotplug_begin();
 
 	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
-		ret = memblock_add_node(start, size, nid, MEMBLOCK_NONE);
+		if (res->flags & IORESOURCE_SYSRAM_DRIVER_MANAGED)
+			memblock_flags = MEMBLOCK_DRIVER_MANAGED;
+		ret = memblock_add_node(start, size, nid, memblock_flags);
 		if (ret)
 			goto error_mem_hotplug_end;
 	}
-- 
2.31.1

