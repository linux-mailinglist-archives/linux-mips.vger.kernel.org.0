Return-Path: <linux-mips+bounces-1033-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B8F835C52
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jan 2024 09:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30E711F21121
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jan 2024 08:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFF61A71B;
	Mon, 22 Jan 2024 08:08:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A843E555
	for <linux-mips@vger.kernel.org>; Mon, 22 Jan 2024 08:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705910939; cv=none; b=iC4YTPbeskBt6LLHzQEZcpqlQh++SESlLEgB4eBU38CBXagNjLE0a0ppduaG690LEWpAfgQfB+PMTkbmj96YJo4P3j8tWi553KOnJd5CLSfCTaiN1xkLoSqu5i4KJuyNcISva7LdwQcziYD9BpIO/1WQwTUFe0j9c8/WJOMJ3pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705910939; c=relaxed/simple;
	bh=4GNSy9KBBob2LVoAh9ZW4jXOMSZKkozaWLPLvRayP9c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kr2H//eISrMkErU0YZfwQa+8WWhlYBEhrtFj7LuGurULOkOJomVG/Xsg9xgl06lQitl/7CiKtd7V6xvi72Qqo0khZn51L2yucyCKQHpANZdp3EwsIfZvJuiIj3mA5kQbPUM5PUNwg3Jr93f1nGB7Y4fvfK89zQvXDXON0i6V5vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8CxifCXIq5lLXIDAA--.14451S3;
	Mon, 22 Jan 2024 16:08:55 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxEOWKIq5llCsRAA--.5616S4;
	Mon, 22 Jan 2024 16:08:54 +0800 (CST)
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
Subject: [PATCH 2/2] MIPS: loongson64: set nid for reserved memblock region
Date: Mon, 22 Jan 2024 16:08:34 +0800
Message-Id: <20240122080834.8251-3-huangpei@loongson.cn>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240122080834.8251-1-huangpei@loongson.cn>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240122080834.8251-1-huangpei@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxEOWKIq5llCsRAA--.5616S4
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF4xAw17KFyUtF17Wry5WrX_yoW8Wry3p3
	yxA3WDuFW5Wr4xua9Yy345ZryxZa9xtrs7ZrsrAr4UWa9xW34avr4fJF10qF1jvrW8W3W0
	gr9Ygr1UZF17C3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU92b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x07jz2NtUUUUU=

Commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()) reveals
that reserved memblock regions have no valid node id set, just set it
right since loongson64 firmware makes it clear in memory layout info.

This works around booting failure on 3A1000+ since commit 61167ad5fecd
("mm: pass nid to reserve_bootmem_region()) under
CONFIG_DEFERRED_STRUCT_PAGE_INIT.

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/loongson64/init.c | 2 ++
 arch/mips/loongson64/numa.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index f25caa6aa9d3..000ba91c0886 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -103,6 +103,8 @@ void __init szmem(unsigned int node)
 	if (loongson_sysconf.vgabios_addr)
 		memblock_reserve(virt_to_phys((void *)loongson_sysconf.vgabios_addr),
 				SZ_256K);
+	/* set nid for reserved memory */
+	memblock_set_node((u64)node << 44, (u64)(node+1) << 44, &memblock.reserved, node);
 }
 
 #ifndef CONFIG_NUMA
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index 8f61e93c0c5b..6345e096c532 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -132,6 +132,8 @@ static void __init node_mem_init(unsigned int node)
 
 		/* Reserve pfn range 0~node[0]->node_start_pfn */
 		memblock_reserve(0, PAGE_SIZE * start_pfn);
+		/* set nid for reserved memory on node 0 */
+		memblock_set_node(0, (u64)1 << 44, &memblock.reserved, 1);
 	}
 }
 
-- 
2.30.2


