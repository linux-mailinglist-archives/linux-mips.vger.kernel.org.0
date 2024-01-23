Return-Path: <linux-mips+bounces-1046-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D988382C9
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jan 2024 03:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3A9D284BB2
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jan 2024 02:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE592570;
	Tue, 23 Jan 2024 01:48:29 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AE45255
	for <linux-mips@vger.kernel.org>; Tue, 23 Jan 2024 01:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705974509; cv=none; b=gOPl9zgbUnIqxQctA8NodXrxbAvSeBrJzpFn+j7QJzOpu/1ai1485/abZCPOzoshTPL2qSd2UaKJUQZxr+8pUY8GfO8EySUwgiW0KTY7NUeY9XHB1lAziJXIg+Y1LcM2Bra1UpUtbMxxbtP4m8oCOn0uDBLbq820SJWjuv2a/YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705974509; c=relaxed/simple;
	bh=MtRJO3JqP79fs58iATqsa+28oRmiwdVZ+BaqGaOrNpM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SzKms72A7wf8950BkLaHmjVLmjIAUOoxNiKjFTrQvnPEcYdpOOS0QhFMlhZPPBuHedAt0HuX/R6a0dZEqDtVGfqkjegQq4Oyxya+99LpPTRK1ysKutZgOI5wHC1/JJNXIExYsbTqclaT7GCEBU+tQ8ZlpAgCnukjpx9f81YeAUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8DxbOnpGq9ljPgDAA--.5824S3;
	Tue, 23 Jan 2024 09:48:25 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxF83bGq9lVE8TAA--.6349S3;
	Tue, 23 Jan 2024 09:48:25 +0800 (CST)
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
Date: Tue, 23 Jan 2024 09:47:58 +0800
Message-Id: <20240123014758.12718-2-huangpei@loongson.cn>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240123014758.12718-1-huangpei@loongson.cn>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240123014758.12718-1-huangpei@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxF83bGq9lVE8TAA--.6349S3
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF4xAFWxXr48XFyDCFyUArc_yoW8WryDp3
	yxA3WDuFW5Wr4xua9Yy345Zry8Za9xtrs7ZFsrAr4UWa9xW34avr4fJF1jqF1jvrW8W3W0
	grnYgw1UZF17C3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
	UjIFyTuYvjxU2-txDUUUU

Commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()") reveals
that reserved memblock regions have no valid node id set, just set it
right since loongson64 firmware makes it clear in memory layout info.

This works around booting failure on 3A1000+ since commit 61167ad5fecd
("mm: pass nid to reserve_bootmem_region()") under
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


