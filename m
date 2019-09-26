Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 483A5BF4A5
	for <lists+linux-mips@lfdr.de>; Thu, 26 Sep 2019 16:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbfIZOFW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Sep 2019 10:05:22 -0400
Received: from forward100j.mail.yandex.net ([5.45.198.240]:43026 "EHLO
        forward100j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726820AbfIZOFW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Sep 2019 10:05:22 -0400
Received: from mxback13o.mail.yandex.net (mxback13o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::64])
        by forward100j.mail.yandex.net (Yandex) with ESMTP id C7D9450E08EE;
        Thu, 26 Sep 2019 17:05:19 +0300 (MSK)
Received: from iva3-964d0bf3fb3c.qloud-c.yandex.net (iva3-964d0bf3fb3c.qloud-c.yandex.net [2a02:6b8:c0c:c0f:0:640:964d:bf3])
        by mxback13o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id BSnCtVjav9-5JBqJSFE;
        Thu, 26 Sep 2019 17:05:19 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1569506719;
        bh=SSf3hnXO7Ix2nfUZtw2Ini6rY+lLkGyatgNkWxfCVJc=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=Dd+TewZpAN8WctCPSXF9+7K5Fe4dk+n/pHaaNQ8xFamBFqZY54QY0P4l0FgW0aESd
         S5jAy56CB3Lhs12aqATVYhwJLSJSXqY0uuvYWcbWrvuShh1bxjKuJT2ff0JcjCtcCY
         3zFlujNwRKNqVqTEQkw9NwvuWIBHWAsUU/uycxcg=
Authentication-Results: mxback13o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by iva3-964d0bf3fb3c.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id X8xD27KYD5-5FImCVit;
        Thu, 26 Sep 2019 17:05:17 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] MIPS: Loongson64: Remove duplicated add_memory_region
Date:   Thu, 26 Sep 2019 22:04:58 +0800
Message-Id: <20190926140458.10367-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From a94e4f24ec83 ("MIPS: init: Drop boot_mem_map"), add_memory_region is
handled by memblock_add directly. So they're totally duplicated with following
memblock_add_node and leading to boot failure in some cases.

Reported-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/loongson-3/numa.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/mips/loongson64/loongson-3/numa.c b/arch/mips/loongson64/loongson-3/numa.c
index 414e97de5dc0..dae7d7704e66 100644
--- a/arch/mips/loongson64/loongson-3/numa.c
+++ b/arch/mips/loongson64/loongson-3/numa.c
@@ -142,8 +142,6 @@ static void __init szmem(unsigned int node)
 				(u32)node_id, mem_type, mem_start, mem_size);
 			pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
 				start_pfn, end_pfn, num_physpages);
-			add_memory_region((node_id << 44) + mem_start,
-				(u64)mem_size << 20, BOOT_MEM_RAM);
 			memblock_add_node(PFN_PHYS(start_pfn),
 				PFN_PHYS(end_pfn - start_pfn), node);
 			break;
@@ -156,16 +154,14 @@ static void __init szmem(unsigned int node)
 				(u32)node_id, mem_type, mem_start, mem_size);
 			pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
 				start_pfn, end_pfn, num_physpages);
-			add_memory_region((node_id << 44) + mem_start,
-				(u64)mem_size << 20, BOOT_MEM_RAM);
 			memblock_add_node(PFN_PHYS(start_pfn),
 				PFN_PHYS(end_pfn - start_pfn), node);
 			break;
 		case SYSTEM_RAM_RESERVED:
 			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
 				(u32)node_id, mem_type, mem_start, mem_size);
-			add_memory_region((node_id << 44) + mem_start,
-				(u64)mem_size << 20, BOOT_MEM_RESERVED);
+			memblock_add_node(PFN_PHYS(start_pfn),
+				PFN_PHYS(end_pfn - start_pfn), node);
 			memblock_reserve(((node_id << 44) + mem_start),
 				mem_size << 20);
 			break;
-- 
2.23.0

