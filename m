Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB8092696
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2019 16:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfHSOYB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Aug 2019 10:24:01 -0400
Received: from forward101j.mail.yandex.net ([5.45.198.241]:33069 "EHLO
        forward101j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726670AbfHSOYB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Aug 2019 10:24:01 -0400
Received: from mxback21o.mail.yandex.net (mxback21o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::72])
        by forward101j.mail.yandex.net (Yandex) with ESMTP id 39E421BE013F;
        Mon, 19 Aug 2019 17:23:59 +0300 (MSK)
Received: from smtp1o.mail.yandex.net (smtp1o.mail.yandex.net [2a02:6b8:0:1a2d::25])
        by mxback21o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id Cp2PJWoty1-NwGekv1s;
        Mon, 19 Aug 2019 17:23:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566224638;
        bh=bwb/OloJZcYlEwa9+wdSwNLHR1N0Mah7yhMM+MbOqbk=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=s67m28AVzMi+V8kI0Z5X0jcpKEmmNzNCEma1elRml+FDnybAYnUm5euNNQenXy1dB
         BxEhDXvcTE5bcEAeMt2V/l5ijzbjpOaP7HdORAk6grraMkNrL9CYKeVwKVF4BhoP3V
         pIiTWolPeaHFStGZ8If0G54dU3ZFQ2fvPmZ6GRdI=
Authentication-Results: mxback21o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id StE3L42zOl-NsUmYnvB;
        Mon, 19 Aug 2019 17:23:57 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paul.burton@mips.com, yasha.che3@gmail.com, aurelien@aurel32.net,
        sfr@canb.auug.org.au, fancer.lancer@gmail.com,
        matt.redfearn@mips.com, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 6/8] MIPS: xlp: Drop boot_mem_map
Date:   Mon, 19 Aug 2019 22:23:11 +0800
Message-Id: <20190819142313.3535-7-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
References: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Simply replace with memblock functions.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/netlogic/xlp/setup.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/netlogic/xlp/setup.c b/arch/mips/netlogic/xlp/setup.c
index f743fd9da323..1a0fc5b62ba4 100644
--- a/arch/mips/netlogic/xlp/setup.c
+++ b/arch/mips/netlogic/xlp/setup.c
@@ -34,6 +34,7 @@
 
 #include <linux/kernel.h>
 #include <linux/of_fdt.h>
+#include <linux/memblock.h>
 
 #include <asm/idle.h>
 #include <asm/reboot.h>
@@ -67,12 +68,11 @@ static void nlm_linux_exit(void)
 static void nlm_fixup_mem(void)
 {
 	const int pref_backup = 512;
-	int i;
+	struct memblock_region *mem;
 
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
-		if (boot_mem_map.map[i].type != BOOT_MEM_RAM)
-			continue;
-		boot_mem_map.map[i].size -= pref_backup;
+	for_each_memblock(memory, mem) {
+		memblock_remove(mem->base + mem->size - pref_backup,
+			pref_backup);
 	}
 }
 
@@ -110,7 +110,7 @@ void __init plat_mem_setup(void)
 	/* memory and bootargs from DT */
 	xlp_early_init_devtree();
 
-	if (boot_mem_map.nr_map == 0) {
+	if (memblock_end_of_DRAM() == 0) {
 		pr_info("Using DRAM BARs for memory map.\n");
 		xlp_init_mem_from_bars();
 	}
-- 
2.22.0

