Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D64C92697
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2019 16:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbfHSOYI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Aug 2019 10:24:08 -0400
Received: from forward102j.mail.yandex.net ([5.45.198.243]:39764 "EHLO
        forward102j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726186AbfHSOYH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Aug 2019 10:24:07 -0400
Received: from mxback20j.mail.yandex.net (mxback20j.mail.yandex.net [IPv6:2a02:6b8:0:1619::114])
        by forward102j.mail.yandex.net (Yandex) with ESMTP id 67FBCF20C34;
        Mon, 19 Aug 2019 17:24:04 +0300 (MSK)
Received: from smtp1o.mail.yandex.net (smtp1o.mail.yandex.net [2a02:6b8:0:1a2d::25])
        by mxback20j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id N8Fm1CuLmz-O3T8iYJZ;
        Mon, 19 Aug 2019 17:24:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566224644;
        bh=UwDjjdkZaZQF1hWxek9J7Gz6nqagAelPcGjD7ZJf9AU=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=nKGO+FCeSFETuBFt3X48/FgSHSix1zyWlr1Ujpjq12jgcvIDEYqkC0Dj5vDkr4zaQ
         Aid56bMmd/suNqyFp64hoICOxIuFwtO0pYP5IwZObZr3LVP0BBGlUPhJUAsmq7+bDO
         EYi0YE7W6mwllIi+8HCerxfi8OsaWaPKV85UQnk4=
Authentication-Results: mxback20j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id StE3L42zOl-NxUmCrre;
        Mon, 19 Aug 2019 17:24:02 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paul.burton@mips.com, yasha.che3@gmail.com, aurelien@aurel32.net,
        sfr@canb.auug.org.au, fancer.lancer@gmail.com,
        matt.redfearn@mips.com, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 7/8] MIPS: mm: Drop boot_mem_map
Date:   Mon, 19 Aug 2019 22:23:12 +0800
Message-Id: <20190819142313.3535-8-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
References: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Initialize maar by resource map and replace page_is_ram
by memblock_is_memory.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/maar.h |  8 +++-
 arch/mips/mm/init.c          | 82 ++++++++++++++----------------------
 2 files changed, 38 insertions(+), 52 deletions(-)

diff --git a/arch/mips/include/asm/maar.h b/arch/mips/include/asm/maar.h
index 6908b93c4ff9..8caa2512d504 100644
--- a/arch/mips/include/asm/maar.h
+++ b/arch/mips/include/asm/maar.h
@@ -78,6 +78,7 @@ extern void maar_init(void);
  *		aligned to one byte before a 2^16 byte boundary.
  * @attrs:	The accessibility attributes to program, eg. MIPS_MAAR_S. The
  *		MIPS_MAAR_VL attribute will automatically be set.
+ * @used:  Determine if the config entry is used.
  *
  * Describes the configuration of a pair of Memory Accessibility Attribute
  * Registers - applying attributes from attrs to the range of physical
@@ -87,7 +88,9 @@ struct maar_config {
 	phys_addr_t lower;
 	phys_addr_t upper;
 	unsigned attrs;
+	bool used;
 };
+#define MAX_MAAR_CONFIGS 32
 
 /**
  * maar_config() - configure MAARs according to provided data
@@ -105,8 +108,11 @@ static inline unsigned maar_config(const struct maar_config *cfg,
 {
 	unsigned i;
 
-	for (i = 0; i < min(num_cfg, num_pairs); i++)
+	for (i = 0; i < num_cfg; i++) {
+		if (!cfg[i].used)
+			continue;
 		write_maar_pair(i, cfg[i].lower, cfg[i].upper, cfg[i].attrs);
+	}
 
 	return i;
 }
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 8a038b30d3c4..5b89bdebb3ab 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -269,31 +269,39 @@ void __init fixrange_init(unsigned long start, unsigned long end,
 #endif
 }
 
-unsigned __weak platform_maar_init(unsigned num_pairs)
+static int maar_res_walk(unsigned long start, unsigned long nr_pages,
+			void *data)
 {
-	struct maar_config cfg[BOOT_MEM_MAP_MAX];
-	unsigned i, num_configured, num_cfg = 0;
-
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
-		switch (boot_mem_map.map[i].type) {
-		case BOOT_MEM_RAM:
-		case BOOT_MEM_INIT_RAM:
-			break;
-		default:
+	struct maar_config *cfg = (struct maar_config *)data;
+	int i;
+
+	/* Find next free config entry and fill from res */
+	for (i = 0; i < MAX_MAAR_CONFIGS; i++) {
+		if (cfg->used)
 			continue;
-		}
+		cfg->used = true;
+		cfg->lower = PFN_DOWN(start);
+		cfg->lower = (cfg->lower + 0xffff) & ~0xffff;
+		cfg->upper = PFN_UP(start + nr_pages);
+		cfg->upper = (cfg->upper & ~0xffff) - 1;
+		cfg->attrs = MIPS_MAAR_S;
+		cfg++;
+	}
 
-		/* Round lower up */
-		cfg[num_cfg].lower = boot_mem_map.map[i].addr;
-		cfg[num_cfg].lower = (cfg[num_cfg].lower + 0xffff) & ~0xffff;
+	return 0;
+}
 
-		/* Round upper down */
-		cfg[num_cfg].upper = boot_mem_map.map[i].addr +
-					boot_mem_map.map[i].size;
-		cfg[num_cfg].upper = (cfg[num_cfg].upper & ~0xffff) - 1;
 
-		cfg[num_cfg].attrs = MIPS_MAAR_S;
-		num_cfg++;
+unsigned __weak platform_maar_init(unsigned num_pairs)
+{
+	struct maar_config cfg[MAX_MAAR_CONFIGS];
+	unsigned int num_configured, i, num_cfg = 0;
+
+	walk_system_ram_range(0, max_pfn, &cfg, maar_res_walk);
+
+	for (i = 0; i < MAX_MAAR_CONFIGS; i++) {
+		if (cfg[i].used)
+			num_cfg++;
 	}
 
 	num_configured = maar_config(cfg, num_cfg, num_pairs);
@@ -376,39 +384,13 @@ void maar_init(void)
 			recorded.cfgs[recorded.used].lower = lower;
 			recorded.cfgs[recorded.used].upper = upper;
 			recorded.cfgs[recorded.used].attrs = attr;
+			recorded.cfgs[recorded.used].used = true;
 			recorded.used++;
 		}
 	}
 }
 
 #ifndef CONFIG_NEED_MULTIPLE_NODES
-int page_is_ram(unsigned long pagenr)
-{
-	int i;
-
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
-		unsigned long addr, end;
-
-		switch (boot_mem_map.map[i].type) {
-		case BOOT_MEM_RAM:
-		case BOOT_MEM_INIT_RAM:
-			break;
-		default:
-			/* not usable memory */
-			continue;
-		}
-
-		addr = PFN_UP(boot_mem_map.map[i].addr);
-		end = PFN_DOWN(boot_mem_map.map[i].addr +
-			       boot_mem_map.map[i].size);
-
-		if (pagenr >= addr && pagenr < end)
-			return 1;
-	}
-
-	return 0;
-}
-
 void __init paging_init(void)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES];
@@ -443,7 +425,7 @@ void __init paging_init(void)
 static struct kcore_list kcore_kseg0;
 #endif
 
-static inline void mem_init_free_highmem(void)
+static inline void __init mem_init_free_highmem(void)
 {
 #ifdef CONFIG_HIGHMEM
 	unsigned long tmp;
@@ -452,9 +434,7 @@ static inline void mem_init_free_highmem(void)
 		return;
 
 	for (tmp = highstart_pfn; tmp < highend_pfn; tmp++) {
-		struct page *page = pfn_to_page(tmp);
-
-		if (!page_is_ram(tmp))
+		if (!memblock_is_memory(PFN_PHYS(tmp)))
 			SetPageReserved(page);
 		else
 			free_highmem_page(page);
-- 
2.22.0

