Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4952C6C37CD
	for <lists+linux-mips@lfdr.de>; Tue, 21 Mar 2023 18:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjCURHe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Mar 2023 13:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjCURHF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Mar 2023 13:07:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D3453DB3;
        Tue, 21 Mar 2023 10:06:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8629461D40;
        Tue, 21 Mar 2023 17:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D0FC433EF;
        Tue, 21 Mar 2023 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679418367;
        bh=oPygRvX6RQAe+5eleW7V1m91ykfqAM2HaXq3tUgRD/w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S6Igbn+hx9kvz+8nl0l0isAVjYko/QzPOG59FO2v+dyXOHfJ5CiXlxbTS8jr9Ekks
         Sf7vWxebifU9v9ZP2pGM8iWmX4AhTu0A+XnBUsvNJzH9MSHIh6mMOyH38kSTEidmQz
         qCxspDb7L34nmybV3wlEo9UdlhZxgAUiLn1f5S0xDoVvza+3nb4bSQ6sGM22c3S7En
         Z1XEDv6X7cynI3+638uL6VeJ2obx0l/9uZ2YtOS0sSvWrs4hPv8Sd5C42hDfm4OC5c
         zmNsYvjnP61UXUd+uaJKEjMbzrAMN31WrmpAUn33F4EAZgqJDhePMJeKNHwYUQz3dz
         i40ILUcN2Ne5Q==
From:   Mike Rapoport <rppt@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     David Hildenbrand <david@redhat.com>,
        Doug Berger <opendmb@gmail.com>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 10/14] init,mm: fold late call to page_ext_init() to page_alloc_init_late()
Date:   Tue, 21 Mar 2023 19:05:09 +0200
Message-Id: <20230321170513.2401534-11-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230321170513.2401534-1-rppt@kernel.org>
References: <20230321170513.2401534-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

When deferred initialization of struct pages is enabled, page_ext_init()
must be called after all the deferred initialization is done, but there
is no point to keep it a separate call from kernel_init_freeable() right
after page_alloc_init_late().

Fold the call to page_ext_init() into page_alloc_init_late() and
localize deferred_struct_pages variable.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page_ext.h | 2 --
 init/main.c              | 4 ----
 mm/mm_init.c             | 6 +++++-
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index bc2e39090a1f..67314f648aeb 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -29,8 +29,6 @@ struct page_ext_operations {
 	bool need_shared_flags;
 };
 
-extern bool deferred_struct_pages;
-
 #ifdef CONFIG_PAGE_EXTENSION
 
 /*
diff --git a/init/main.c b/init/main.c
index 8a20b4c25f24..04113514e56a 100644
--- a/init/main.c
+++ b/init/main.c
@@ -62,7 +62,6 @@
 #include <linux/rmap.h>
 #include <linux/mempolicy.h>
 #include <linux/key.h>
-#include <linux/page_ext.h>
 #include <linux/debug_locks.h>
 #include <linux/debugobjects.h>
 #include <linux/lockdep.h>
@@ -1561,9 +1560,6 @@ static noinline void __init kernel_init_freeable(void)
 
 	padata_init();
 	page_alloc_init_late();
-	/* Initialize page ext after all struct pages are initialized. */
-	if (deferred_struct_pages)
-		page_ext_init();
 
 	do_basic_setup();
 
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 43f6d3ed24ef..ff70da11e797 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -225,7 +225,7 @@ static unsigned long nr_kernel_pages __initdata;
 static unsigned long nr_all_pages __initdata;
 static unsigned long dma_reserve __initdata;
 
-bool deferred_struct_pages __meminitdata;
+static bool deferred_struct_pages __meminitdata;
 
 static DEFINE_PER_CPU(struct per_cpu_nodestat, boot_nodestats);
 
@@ -2358,6 +2358,10 @@ void __init page_alloc_init_late(void)
 
 	for_each_populated_zone(zone)
 		set_zone_contiguous(zone);
+
+	/* Initialize page ext after all struct pages are initialized. */
+	if (deferred_struct_pages)
+		page_ext_init();
 }
 
 #ifndef __HAVE_ARCH_RESERVED_KERNEL_PAGES
-- 
2.35.1

