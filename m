Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41EBE85C3B
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2019 09:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731769AbfHHH7H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Aug 2019 03:59:07 -0400
Received: from forward102j.mail.yandex.net ([5.45.198.243]:46475 "EHLO
        forward102j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731588AbfHHH7H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Aug 2019 03:59:07 -0400
X-Greylist: delayed 371 seconds by postgrey-1.27 at vger.kernel.org; Thu, 08 Aug 2019 03:59:07 EDT
Received: from mxback20o.mail.yandex.net (mxback20o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::71])
        by forward102j.mail.yandex.net (Yandex) with ESMTP id 45942F21025;
        Thu,  8 Aug 2019 10:52:55 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback20o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id z6NQOGERnZ-qtsWJtuC;
        Thu, 08 Aug 2019 10:52:55 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1565250775;
        bh=bwb/OloJZcYlEwa9+wdSwNLHR1N0Mah7yhMM+MbOqbk=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=TfxYPYJ2WJG7VosJc0cQAhpGOTk/9HlyX4MDKvUwhgtgeN6vOSU16XiAdicxSmWL+
         UEtbEx5LZ6In2NCaqRM/H6F/vLnuqeYr7CH5dGxfCxzRlL0dELYRL4xu0rZmbQcNGk
         ziWZNyZ9MVv1xZhSaPjkBncpfTyUKufv+eQ86tNg=
Authentication-Results: mxback20o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id 03dF3Y2ufp-q5guLI2Z;
        Thu, 08 Aug 2019 10:52:51 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paul.burton@mips.com, yasha.che3@gmail.com, aurelien@aurel32.net,
        sfr@canb.auug.org.au, fancer.lancer@gmail.com,
        matt.redfearn@mips.com, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 7/7] MIPS: xlp: Drop boot_mem_map
Date:   Thu,  8 Aug 2019 15:50:13 +0800
Message-Id: <20190808075013.4852-8-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
References: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
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

