Return-Path: <linux-mips+bounces-1188-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B5C83EC40
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jan 2024 10:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F003B22288
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jan 2024 09:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897911DFE8;
	Sat, 27 Jan 2024 09:12:42 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037861DFCD
	for <linux-mips@vger.kernel.org>; Sat, 27 Jan 2024 09:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706346762; cv=none; b=aWc/Yv+tDlQ4ehy+WQaU63In9NKOdkqhqVWpskmH9ocyconwS0HAzETliLyDBWvKV43Cao4rRh+Scdi4TptID7n+GEfq5MoEwh8aWOylTTKc1WAubuxb4f7p0HtjJS+ZbiGj0NkxllhkfBZi1SVPiEWSmV6sEfB445ZlPzfVWOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706346762; c=relaxed/simple;
	bh=Zo3wkVC3E3B7p4CqFeZMkXGnXner7zxUGshBjQEaLHE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hrE2LKh2PuHX8vMF3vDUJXTqarUML0mL1Cg67EQ8/cJ75RuDcXrYMkn71jESAzIQwGvKD9fEuMuZpOFQf7BonYqk2TlKJSXHa/XpMRYXnYvGQXudkKZaQDVbxuN96ZWDyIMY6AYQBcMckQCDqY8ZPqCHJwmKke6nVKZzTRs6xaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8CxWOgGybRl6+gGAA--.3475S3;
	Sat, 27 Jan 2024 17:12:38 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxI8z3yLRl_cweAA--.401S3;
	Sat, 27 Jan 2024 17:12:38 +0800 (CST)
From: Huang Pei <huangpei@loongson.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Bibo Mao <maobibo@loongson.cn>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Li Xuefeng <lixuefeng@loongson.cn>,
	Yang Tiezhu <yangtiezhu@loongson.cn>,
	Gao Juxin <gaojuxin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] MIPS: loongson64: set nid for reserved memblock region
Date: Sat, 27 Jan 2024 17:12:21 +0800
Message-Id: <20240127091221.2884-2-huangpei@loongson.cn>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240127091221.2884-1-huangpei@loongson.cn>
References: <ZbPq0yF20Qyo1rKb@alpha.franken.de>
 <20240127091221.2884-1-huangpei@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxI8z3yLRl_cweAA--.401S3
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF4xAFWxXr48XFyDCFyUArc_yoW8WryDp3
	yxA3WDuFW8Wr4xua95A345uryxZasxtrs7ZF47Zr1UWa9xW34avr4fJF1jqFyjvr48W3W0
	gr9Ygr1UZF1xC3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9jb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	AVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kfnx
	nUUI43ZEXa7IU8q2NtUUUUU==

Commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()") reveals
that reserved memblock regions have no valid node id set, just set it
right since loongson64 firmware makes it clear in memory layout info.

This works around booting failure on 3A1000+ since commit 61167ad5fecd
("mm: pass nid to reserve_bootmem_region()") under
CONFIG_DEFERRED_STRUCT_PAGE_INIT.

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/loongson64/init.c | 3 +++
 arch/mips/loongson64/numa.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index f25caa6aa9d3..553142c1f14f 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -103,6 +103,9 @@ void __init szmem(unsigned int node)
 	if (loongson_sysconf.vgabios_addr)
 		memblock_reserve(virt_to_phys((void *)loongson_sysconf.vgabios_addr),
 				SZ_256K);
+	/* set nid for reserved memory */
+	memblock_set_node((u64)node << 44, (u64)(node + 1) << 44,
+			&memblock.reserved, node);
 }
 
 #ifndef CONFIG_NUMA
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index 8f61e93c0c5b..68dafd6d3e25 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -132,6 +132,8 @@ static void __init node_mem_init(unsigned int node)
 
 		/* Reserve pfn range 0~node[0]->node_start_pfn */
 		memblock_reserve(0, PAGE_SIZE * start_pfn);
+		/* set nid for reserved memory on node 0 */
+		memblock_set_node(0, 1ULL << 44, &memblock.reserved, 0);
 	}
 }
 
-- 
2.30.2


