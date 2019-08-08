Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89E7485C31
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2019 09:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731640AbfHHH5y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Aug 2019 03:57:54 -0400
Received: from forward105p.mail.yandex.net ([77.88.28.108]:34995 "EHLO
        forward105p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731627AbfHHH5y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Aug 2019 03:57:54 -0400
X-Greylist: delayed 424 seconds by postgrey-1.27 at vger.kernel.org; Thu, 08 Aug 2019 03:57:53 EDT
Received: from mxback2g.mail.yandex.net (mxback2g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:163])
        by forward105p.mail.yandex.net (Yandex) with ESMTP id 1CCBF4D4101F;
        Thu,  8 Aug 2019 10:51:17 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback2g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id J3NQ8EH9gB-pGoCNUX2;
        Thu, 08 Aug 2019 10:51:17 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1565250677;
        bh=+AXpXjCX0caLLhkpPjImy6Vp/q2NyWAxqIUV2X1NAQk=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=a0pnt1cNHK/x1xLP89nU6WcwKavoueSMvDeoCA+tnWQ7uV+MLr3c5OCnP4QjAej03
         /PtwGQ6kcDw9pQV/WG0VXgfS21we/pZqg3dqFDj7HR+lTK8UcW13VVKDVRrO74VRQP
         M4TArOKkos4x0JHUqjTvkwFcRL9pSrVNS4PCjOgg=
Authentication-Results: mxback2g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id 03dF3Y2ufp-pAgugrga;
        Thu, 08 Aug 2019 10:51:15 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paul.burton@mips.com, yasha.che3@gmail.com, aurelien@aurel32.net,
        sfr@canb.auug.org.au, fancer.lancer@gmail.com,
        matt.redfearn@mips.com, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/7] MIPS: OCTEON: Drop boot_mem_map
Date:   Thu,  8 Aug 2019 15:50:08 +0800
Message-Id: <20190808075013.4852-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
References: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Replace walk through boot_mem_map with for_each_memblock.
And remove the check of total boot_mem_map.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/cavium-octeon/dma-octeon.c | 17 +++++++----------
 arch/mips/cavium-octeon/setup.c      |  3 +--
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
index 11d5a4e90736..72f24a4db099 100644
--- a/arch/mips/cavium-octeon/dma-octeon.c
+++ b/arch/mips/cavium-octeon/dma-octeon.c
@@ -16,6 +16,7 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/mm.h>
+#include <linux/memblock.h>
 
 #include <asm/bootinfo.h>
 
@@ -190,7 +191,7 @@ char *octeon_swiotlb;
 
 void __init plat_swiotlb_setup(void)
 {
-	int i;
+	struct memblock_region *mem;
 	phys_addr_t max_addr;
 	phys_addr_t addr_size;
 	size_t swiotlbsize;
@@ -199,19 +200,15 @@ void __init plat_swiotlb_setup(void)
 	max_addr = 0;
 	addr_size = 0;
 
-	for (i = 0 ; i < boot_mem_map.nr_map; i++) {
-		struct boot_mem_map_entry *e = &boot_mem_map.map[i];
-		if (e->type != BOOT_MEM_RAM && e->type != BOOT_MEM_INIT_RAM)
-			continue;
-
+	for_each_memblock(memory, mem) {
 		/* These addresses map low for PCI. */
-		if (e->addr > 0x410000000ull && !OCTEON_IS_OCTEON2())
+		if (mem->base > 0x410000000ull && !OCTEON_IS_OCTEON2())
 			continue;
 
-		addr_size += e->size;
+		addr_size += mem->size;
 
-		if (max_addr < e->addr + e->size)
-			max_addr = e->addr + e->size;
+		if (max_addr < mem->base + mem->size)
+			max_addr = mem->base + mem->size;
 
 	}
 
diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 8bf43c5a7bc7..95034bf5ca83 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1007,8 +1007,7 @@ void __init plat_mem_setup(void)
 	 * regions next to each other.
 	 */
 	cvmx_bootmem_lock();
-	while ((boot_mem_map.nr_map < BOOT_MEM_MAP_MAX)
-		&& (total < max_memory)) {
+	while (total < max_memory) {
 		memory = cvmx_bootmem_phy_alloc(mem_alloc_size,
 						__pa_symbol(&_end), -1,
 						0x100000,
-- 
2.22.0

