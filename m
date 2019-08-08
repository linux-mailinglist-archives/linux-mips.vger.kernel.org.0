Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F00E85C33
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2019 09:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731627AbfHHH6H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Aug 2019 03:58:07 -0400
Received: from forward103p.mail.yandex.net ([77.88.28.106]:47338 "EHLO
        forward103p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731588AbfHHH6H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Aug 2019 03:58:07 -0400
Received: from mxback20o.mail.yandex.net (mxback20o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::71])
        by forward103p.mail.yandex.net (Yandex) with ESMTP id 1E35718C0CA7;
        Thu,  8 Aug 2019 10:51:25 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback20o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id 58ZYeOOlcx-pOsqmql8;
        Thu, 08 Aug 2019 10:51:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1565250685;
        bh=41smTkP9ic4EdknZf59wTj3cybXw4bPaKaqI0KzaR3c=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=u3TAHOUInP2dOHWrHTw0SijsyKrd7SfXwfvWZeJ2JdJ+cP6EAVyBz/Q5svPmIoelU
         i8yX/8u8uJ2XKttmROwhIUAp5OI0E/UFyq1kDV0taoGgVCbB2df3zz7LCLdWPBRo7j
         xs4vmYDt8WYlfgyEI09nJbVguL2MeadXOuPxmsG0=
Authentication-Results: mxback20o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id 03dF3Y2ufp-pIguT42J;
        Thu, 08 Aug 2019 10:51:22 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paul.burton@mips.com, yasha.che3@gmail.com, aurelien@aurel32.net,
        sfr@canb.auug.org.au, fancer.lancer@gmail.com,
        matt.redfearn@mips.com, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 3/7] MIPS: fw: Record prom memory
Date:   Thu,  8 Aug 2019 15:50:09 +0800
Message-Id: <20190808075013.4852-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
References: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

boot_mem_map is nolonger exist so we need to maintain a list
of prom memory by ourselves.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/fw/arc/memory.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/mips/fw/arc/memory.c b/arch/mips/fw/arc/memory.c
index 429b7f8d2aeb..02e954b3700e 100644
--- a/arch/mips/fw/arc/memory.c
+++ b/arch/mips/fw/arc/memory.c
@@ -27,6 +27,11 @@
 
 #undef DEBUG
 
+#define MAX_PROM_MEM 5
+static phys_addr_t prom_mem_base[MAX_PROM_MEM] __initdata;
+static phys_addr_t prom_mem_size[MAX_PROM_MEM] __initdata;
+static unsigned int nr_prom_mem __initdata;
+
 /*
  * For ARC firmware memory functions the unit of meassuring memory is always
  * a 4k page of memory
@@ -129,6 +134,7 @@ void __init prom_meminit(void)
 	}
 #endif
 
+	nr_prom_mem = 0;
 	p = PROM_NULL_MDESC;
 	while ((p = ArcGetMemoryDescriptor(p))) {
 		unsigned long base, size;
@@ -139,6 +145,12 @@ void __init prom_meminit(void)
 		type = prom_memtype_classify(p->type);
 
 		add_memory_region(base, size, type);
+
+		if (type == BOOT_MEM_ROM_DATA) {
+			prom_mem_base[nr_prom_mem] = base;
+			prom_mem_size[nr_prom_mem] = size;
+			nr_prom_mem++;
+		}
 	}
 }
 
@@ -150,12 +162,8 @@ void __init prom_free_prom_memory(void)
 	if (prom_flags & PROM_FLAG_DONT_FREE_TEMP)
 		return;
 
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
-		if (boot_mem_map.map[i].type != BOOT_MEM_ROM_DATA)
-			continue;
-
-		addr = boot_mem_map.map[i].addr;
+	for (i = 0; i < nr_prom_mem; i++) {
 		free_init_pages("prom memory",
-				addr, addr + boot_mem_map.map[i].size);
+			prom_mem_base[i], prom_mem_base[i] + prom_mem_size[i]);
 	}
 }
-- 
2.22.0

