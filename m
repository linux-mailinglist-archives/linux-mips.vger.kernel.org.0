Return-Path: <linux-mips+bounces-926-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B65582CB21
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jan 2024 10:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13D452849A4
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jan 2024 09:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7A212E52;
	Sat, 13 Jan 2024 09:55:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1D3C8DD
	for <linux-mips@vger.kernel.org>; Sat, 13 Jan 2024 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8DxvOgnXqJlH8cEAA--.5370S3;
	Sat, 13 Jan 2024 17:55:51 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx+4YOXqJlpoQYAA--.930S4;
	Sat, 13 Jan 2024 17:55:50 +0800 (CST)
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
Subject: [PATCH 2/3] MIPS: loongson64: fix booting failure
Date: Sat, 13 Jan 2024 17:55:08 +0800
Message-Id: <20240113095509.178697-3-huangpei@loongson.cn>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240113095509.178697-1-huangpei@loongson.cn>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240113095509.178697-1-huangpei@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx+4YOXqJlpoQYAA--.930S4
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJFWxtrW5Cr1DGF47uF1fKrX_yoW5Wr4rpr
	1fJr17Cr48Jr1UJr4UJr15Xr18Aa1jy3ZrJrW7Jr18Xr1DCF1UJr1UJr1FgryDJrWUJr17
	tF1DJr4jqw1DJwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9jb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7IU8EeHDUUUUU==

Inappropriate memblock_reserve cause loongson64 booting failed with
CONFIG_DEFERRED_STRUCT_PAGE_INIT like this:
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

To fix this bug, we should remove unnecessary memory block reservation.

Fixes: commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region())
Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/loongson64/numa.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index 8f61e93c0c5b..9b4ce40c1d40 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -129,9 +129,6 @@ static void __init node_mem_init(unsigned int node)
 		if (node_end_pfn(0) >= (0xffffffff >> PAGE_SHIFT))
 			memblock_reserve((node_addrspace_offset | 0xfe000000),
 					 32 << 20);
-
-		/* Reserve pfn range 0~node[0]->node_start_pfn */
-		memblock_reserve(0, PAGE_SIZE * start_pfn);
 	}
 }
 
-- 
2.30.2


