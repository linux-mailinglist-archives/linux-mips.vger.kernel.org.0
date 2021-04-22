Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C49236776D
	for <lists+linux-mips@lfdr.de>; Thu, 22 Apr 2021 04:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234475AbhDVCZy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 21 Apr 2021 22:25:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44392 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234384AbhDVCZx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 21 Apr 2021 22:25:53 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT+5n3oBgwxoMAA--.4114S5;
        Thu, 22 Apr 2021 10:25:09 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, Baoquan He <bhe@redhat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jinyang He <hejinyang@loongson.cn>, kexec@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] mips: kdump: Reserve extra memory for crash dump
Date:   Thu, 22 Apr 2021 10:24:33 +0800
Message-Id: <1619058274-6996-4-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1619058274-6996-1-git-send-email-tangyouling@loongson.cn>
References: <1619058274-6996-1-git-send-email-tangyouling@loongson.cn>
X-CM-TRANSID: AQAAf9DxT+5n3oBgwxoMAA--.4114S5
X-Coremail-Antispam: 1UD129KBjvJXoWxCrykXr48Gr43tr18Aw4xJFb_yoW5WFyrpr
        W8Gw4rtr45AF97WayfAr95ZrWrZ3Z2vFy2qrZFywnYva17Jrs8JF4S9asxZryUKrW0qF17
        AF1Fqrn2ga18A3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
        owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gr1l42
        xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
        GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
        8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
        MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
        8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUFwZ2DUUUU
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Huacai Chen <chenhc@lemote.com>

Traditionally, MIPS's contiguous low memory can be as less as 256M, so
crashkernel=X@Y may be unable to large enough in some cases. Moreover,
for the "multi numa node + sparse memory model" case, it is attempt to
allocate section_mem_maps on every node. Thus, if the total memory of a
node is more than 1GB, we reserve the top 128MB for the capture kernel.

This 128M will be reserved only if the following conditions are met:
1. The configuration option CONFIG_KEXEC is y.
2. A valid "crashkernel=" parameter has been added to the command line.
3. The total memory of a node is greater than 1G.

Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
v2:
- New patch.

 arch/mips/kernel/setup.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 1bc8a9cc..af2c860 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -492,6 +492,25 @@ static void __init request_crashkernel(struct resource *res)
 			(unsigned long)(resource_size(&crashk_res) >> 20),
 			(unsigned long)(crashk_res.start  >> 20));
 }
+
+/*
+ * Traditionally, MIPS's contiguous low memory is 256M, so crashkernel=X@Y is
+ * unable to be large enough in some cases. Thus, if the total memory of a node
+ * is more than 1GB, we reserve the top 128MB for the capture kernel.
+ */
+static void reserve_crashm_region(int node, unsigned long s0, unsigned long e0)
+{
+	if (crashk_res.start == crashk_res.end)
+		return;
+
+	if ((e0 - s0) <= (SZ_1G >> PAGE_SHIFT))
+		return;
+
+	s0 = e0 - (SZ_128M >> PAGE_SHIFT);
+
+	memblock_reserve(PFN_PHYS(s0), (e0 - s0) << PAGE_SHIFT);
+}
+
 #else /* !defined(CONFIG_KEXEC)		*/
 static void __init mips_parse_crashkernel(void)
 {
@@ -500,6 +519,10 @@ static void __init mips_parse_crashkernel(void)
 static void __init request_crashkernel(struct resource *res)
 {
 }
+
+static void reserve_crashm_region(int node, unsigned long s0, unsigned long e0)
+{
+}
 #endif /* !defined(CONFIG_KEXEC)  */
 
 static void __init check_kernel_sections_mem(void)
@@ -627,6 +650,9 @@ static void __init bootcmdline_init(void)
  */
 static void __init arch_mem_init(char **cmdline_p)
 {
+	unsigned int node;
+	unsigned long start_pfn, end_pfn;
+
 	/* call board setup routine */
 	plat_mem_setup();
 	memblock_set_bottom_up(true);
@@ -666,6 +692,12 @@ static void __init arch_mem_init(char **cmdline_p)
 	if (crashk_res.start != crashk_res.end)
 		memblock_reserve(crashk_res.start, resource_size(&crashk_res));
 #endif
+
+	for_each_online_node(node) {
+		get_pfn_range_for_nid(node, &start_pfn, &end_pfn);
+		reserve_crashm_region(node, start_pfn, end_pfn);
+	}
+
 	device_tree_init();
 
 	/*
-- 
2.1.0

