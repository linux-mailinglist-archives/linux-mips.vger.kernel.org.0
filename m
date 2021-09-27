Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20D18419738
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 17:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235018AbhI0PH2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 11:07:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35881 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235030AbhI0PH0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Sep 2021 11:07:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632755148;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=76mZg+E3RG88YQfrtX8VX08A90LrtCPW8/rlR6y2h7s=;
        b=WNTg+/QTvQmKRl9XNwumBJVvqiv1d5WLjXrJufXxELUlb8unRntVPRP7TINbnocuNdbDBv
        YiVQjeZtwirAXtbdfOA3nDx4qAkEkRCKDYgBO/6eRiCn1iNJaIhw2ynWuDsz6zvTf13Kgh
        VQ2ajwH5FF2c1BE72NyTc920pCVp9xY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-UR-QvHE9NJ2R30KJjIlaVA-1; Mon, 27 Sep 2021 11:05:44 -0400
X-MC-Unique: UR-QvHE9NJ2R30KJjIlaVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87DA21015208;
        Mon, 27 Sep 2021 15:05:41 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E2FE160C7F;
        Mon, 27 Sep 2021 15:05:36 +0000 (UTC)
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
Subject: [PATCH v1 1/4] mm/memory_hotplug: handle memblock_add_node() failures in add_memory_resource()
Date:   Mon, 27 Sep 2021 17:05:15 +0200
Message-Id: <20210927150518.8607-2-david@redhat.com>
In-Reply-To: <20210927150518.8607-1-david@redhat.com>
References: <20210927150518.8607-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If memblock_add_node() fails, we're most probably running out of memory.
While this is unlikely to happen, it can happen and having memory added
without a memblock can be problematic for architectures that use
memblock to detect valid memory. Let's fail in a nice way instead of
silently ignoring the error.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory_hotplug.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 9fd0be32a281..917b3528636d 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1384,8 +1384,11 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 
 	mem_hotplug_begin();
 
-	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK))
-		memblock_add_node(start, size, nid);
+	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
+		ret = memblock_add_node(start, size, nid);
+		if (ret)
+			goto error_mem_hotplug_end;
+	}
 
 	ret = __try_online_node(nid, false);
 	if (ret < 0)
@@ -1458,6 +1461,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		rollback_node_hotadd(nid);
 	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK))
 		memblock_remove(start, size);
+error_mem_hotplug_end:
 	mem_hotplug_done();
 	return ret;
 }
-- 
2.31.1

