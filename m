Return-Path: <linux-mips+bounces-983-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 712608323F7
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jan 2024 05:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 013F32835D0
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jan 2024 04:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7D81C30;
	Fri, 19 Jan 2024 04:03:06 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89251870
	for <linux-mips@vger.kernel.org>; Fri, 19 Jan 2024 04:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705636986; cv=none; b=pxFx8/4RAU0QlmFg0vtsbv5q14AbGNojXy72qkut/i+tc6ft9G+HrM5AcnPe8afGcrF0cQccBgNi9g8pizFvk8Ulww19fPde+IW6rjPrPVLLLeIsMZkbwn3Y9LGSsiUabT29Uxmei7LvJUIMqVwbi2nS5P5GqQQw9cF31EKK8gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705636986; c=relaxed/simple;
	bh=4GNSy9KBBob2LVoAh9ZW4jXOMSZKkozaWLPLvRayP9c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q6jlupxzI8wTW6aIyQL5t+6SOoYWBH6+Pa0mu0kmYTjQFnwnC36x+wE9KkDGirA0mjpy0qzW8FINUXTsO/WHOx9KJko5ov2mCnMR8fNxg7gh3fSdsYZFbreIJ8+mNi8rBPnYmqK68ImKGfz+pjA/5Ywo07Pzw72ABweVuhJP9T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8Dxvut29Kllq+8BAA--.9190S3;
	Fri, 19 Jan 2024 12:03:02 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxb89m9KllexQKAA--.2354S4;
	Fri, 19 Jan 2024 12:03:02 +0800 (CST)
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
Date: Fri, 19 Jan 2024 12:02:40 +0800
Message-Id: <20240119040240.392442-3-huangpei@loongson.cn>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240119040240.392442-1-huangpei@loongson.cn>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240119040240.392442-1-huangpei@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bxb89m9KllexQKAA--.2354S4
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF4xAw17KFyUtF17Wry5WrX_yoW8Wry3p3
	yxA3WDuFW5Wr4xua9Yy345ZryxZa9xtrs7ZrsrAr4UWa9xW34avr4fJF10qF1jvrW8W3W0
	gr9Ygr1UZF17C3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxU4OzVUUUUU

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


