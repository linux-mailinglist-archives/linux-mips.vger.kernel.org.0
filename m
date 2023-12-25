Return-Path: <linux-mips+bounces-826-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E4981DF7E
	for <lists+linux-mips@lfdr.de>; Mon, 25 Dec 2023 10:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 665B8B208F6
	for <lists+linux-mips@lfdr.de>; Mon, 25 Dec 2023 09:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04640179BE;
	Mon, 25 Dec 2023 09:31:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C699E1798A
	for <linux-mips@vger.kernel.org>; Mon, 25 Dec 2023 09:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8Ax2ujSS4llSWsEAA--.22100S3;
	Mon, 25 Dec 2023 17:30:58 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxK+S2S4llgpUJAA--.1101S2;
	Mon, 25 Dec 2023 17:30:56 +0800 (CST)
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
Subject: [PATCH] MIPS: loongson64: fix boot failure
Date: Mon, 25 Dec 2023 17:30:25 +0800
Message-Id: <20231225093025.23215-1-huangpei@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxK+S2S4llgpUJAA--.1101S2
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJFWxtrW5Cr1DGF47uF1fKrX_yoWrGF4fpr
	13trnrCr48Jr1UJFWUJr15Zr18Za1F93ZrJrZrJr18XF4DuF17Xr18JryFqFyUJrWUJF12
	qFyDXr4jqw1DJwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

Since commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()),
loongson64 booting failed with CONFIG_DEFERRED_STRUCT_PAGE_INIT like
this:
----------------------------------------------------------------------
 Call Trace:
 [<ffffffff8235d088>] reserve_bootmem_region+0xa8/0x184
 [<ffffffff82333940>] memblock_free_all+0x104/0x2a8
 [<ffffffff8231d8e4>] mem_init+0x84/0x94
 [<ffffffff82330958>] mm_core_init+0xf8/0x308
 [<ffffffff82318c38>] start_kernel+0x43c/0x86c

 Code: 10400028  2402fff0  de420000 <dc432880> 0203182b 14600022
 64420070  00003025  24040003

 ---[ end trace 0000000000000000 ]---
 Kernel panic - not syncing: Attempted to kill the idle task!
 ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
----------------------------------------------------------------------

The root cause is no memory region "0x0-0x1fffff" paired with
memory-reserved region "0x0-0x1fffff" and "0x0-0xfff", with "memblock
=debug":

----------------------------------------------------------------------
  memory[0x0]     [0x0000000000200000-0x000000000effffff],
  0x000000000ee00000 bytes on node 0 flags: 0x0 !!!!here
  memory[0x1]     [0x0000000090000000-0x00000000fdffffff],
  0x000000006e000000 bytes on node 0 flags: 0x0
  memory[0x2]     [0x0000000100000000-0x000000027fffffff],
  0x0000000180000000 bytes on node 0 flags: 0x0
  memory[0x3]     [0x0000100000000000-0x000010000fffffff],
  0x0000000010000000 bytes on node 1 flags: 0x0
  memory[0x4]     [0x0000100090000000-0x000010027fffffff],
  0x00000001f0000000 bytes on node 1 flags: 0x0
  reserved.cnt  = 0x1f
  reserved[0x0]   [0x0000000000000000-0x000000000190c80a],
  0x000000000190c80b bytes flags: 0x0 !!!!oops 0x0-0x1fffff not in memory[0]
  reserved[0x1]   [0x000000000190c810-0x000000000190eea3],
  0x0000000000002694 bytes flags: 0x0
----------------------------------------------------------------------

It caused memory-reserved region "0x0-0x1fffff" without valid node id
in "memblock_get_region_node" from "memmap_init_reserved_pages", lead to
"reserve_bootmem_region-> init_reserved_page -> early_pfn_to_nid()"
accessing "node_data" out of bound.

To fix this bug, we should remove unnecessary memory block reservation.

+. no need to reserve 0x0-0x1fffff below kernel loading address, since
it is not registered by "memblock_add_node"

+. no need to reserve 0x0-0xfff for exception handling if it is not
registered by "memblock_add" either.

Fixes: commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region())
Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/kernel/traps.c    | 3 ++-
 arch/mips/loongson64/numa.c | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 246c6a6b0261..9b632b4c10c3 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2007,7 +2007,8 @@ unsigned long vi_handlers[64];
 
 void reserve_exception_space(phys_addr_t addr, unsigned long size)
 {
-	memblock_reserve(addr, size);
+	if(memblock_is_region_memory(addr, size))
+		memblock_reserve(addr, size);
 }
 
 void __init *set_except_vector(int n, void *addr)
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index 8f61e93c0c5b..0f516dde81da 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -130,8 +130,6 @@ static void __init node_mem_init(unsigned int node)
 			memblock_reserve((node_addrspace_offset | 0xfe000000),
 					 32 << 20);
 
-		/* Reserve pfn range 0~node[0]->node_start_pfn */
-		memblock_reserve(0, PAGE_SIZE * start_pfn);
 	}
 }
 
-- 
2.20.1


