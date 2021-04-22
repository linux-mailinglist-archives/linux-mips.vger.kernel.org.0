Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E84A367770
	for <lists+linux-mips@lfdr.de>; Thu, 22 Apr 2021 04:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234601AbhDVCZ4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 21 Apr 2021 22:25:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44400 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234442AbhDVCZz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 21 Apr 2021 22:25:55 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT+5n3oBgwxoMAA--.4114S6;
        Thu, 22 Apr 2021 10:25:12 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, Baoquan He <bhe@redhat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jinyang He <hejinyang@loongson.cn>, kexec@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] mips: kdump: Reserve old memory to avoid the destruction of production kernel data
Date:   Thu, 22 Apr 2021 10:24:34 +0800
Message-Id: <1619058274-6996-5-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1619058274-6996-1-git-send-email-tangyouling@loongson.cn>
References: <1619058274-6996-1-git-send-email-tangyouling@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxT+5n3oBgwxoMAA--.4114S6
X-Coremail-Antispam: 1UD129KBjvJXoWxXFWUKw1DZFyDCF4xAw17GFg_yoWrXFy5pr
        4xG34SkF4DG3Z7W3yfA3s5uryrZa1S9FWjgrZrJr95Za18Arn3Zr10v3WSqry7KrWDCF1j
        vF40qF1093y7AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4U
        JVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
        C0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
        6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gr
        1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
        JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7V
        AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
        IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUrCztUUUUU
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Huacai Chen <chenhc@lemote.com>

Memory layout:

+---------+ end_pfn(e0+128M)
|         |
+---------+ e0
|         |
|         |
|         |
+---------+ e1(crashk_res.start)
|         |
|         |
|         |
+---------+ s1(crashk_res.start)
|         |
+---------+ s0(start_pfn)

[1] When producing the kernel:
Reserve the crashkernel space through crashkernel="YM@XM", so that
[s1, e1] is reserved for the capture kernel.

If the available memory range is greater than 1G, an additional 128M
range is reserved from top to bottom for the capture kernel (ie
[e0, end_pfn] range). The advantage of this is that it can make more
memory available to the capture kernel and avoid triggering insufficient
memory, resulting in panic.

[2] When capturing the kernel:
Finally, the "mem=" parameter is automatically added through kexec-tools
(the "mem=" parameter actually comes from the "crashkernel=" parameter,
and the scope is the same).

It is necessary to reserve the available memory area of the previous
production kernel to avoid the captured data of the production kernel
from being destroyed. If this area in the memory is not reserved, the
captured data will be destroyed, the generated vmcore file is invalid
and cannot be parsed by the crash-utility.

[3] Only consider the memory situation of kdump operation as follows:
1. Production kernel:
memblock.reserve: [s1, e1] and [e0, end_pfn] (Memory is reserved)
memblock.memory:  [s0, s1] and [e1, e0]      (Memory available)

2. Capture kernel:
memblock.reserve: [s0, s1] and [e1, e0]      (Memory is reserved)
memblock.memory:  [s1, e1] and [e0, end_pfn] (Memory available)

In conclusion，[s0, s1] and [e1, e0] memory areas should be reserved.

Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
v2:
 - New patch.

 arch/mips/kernel/setup.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index af2c860..aa89f28 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -55,6 +55,8 @@ EXPORT_SYMBOL(cpu_data);
 struct screen_info screen_info;
 #endif
 
+static phys_addr_t crashmem_start, crashmem_size;
+
 /*
  * Setup information
  *
@@ -367,6 +369,11 @@ static int __init early_parse_mem(char *p)
 
 	memblock_add_node(start, size, pa_to_nid(start));
 
+	if (strstr(boot_command_line, "elfcorehdr") && start && size) {
+		crashmem_start = start;
+		crashmem_size = size;
+	}
+
 	return 0;
 }
 early_param("mem", early_parse_mem);
@@ -525,6 +532,36 @@ static void reserve_crashm_region(int node, unsigned long s0, unsigned long e0)
 }
 #endif /* !defined(CONFIG_KEXEC)  */
 
+/*
+ * After the kdump operation is performed to enter the capture kernel, the
+ * memory area used by the previous production kernel should be reserved to
+ * avoid destroy to the captured data.
+ */
+static void reserve_oldmem_region(int node, unsigned long s0, unsigned long e0)
+{
+	unsigned long s1, e1;
+
+	if (!is_kdump_kernel())
+		return;
+
+	if ((e0 - s0) > (SZ_1G >> PAGE_SHIFT))
+		e0 = e0 - (SZ_128M >> PAGE_SHIFT);
+
+	/* crashmem_start is crashk_res reserved by primary production kernel */
+	s1 = PFN_UP(crashmem_start);
+	e1 = PFN_DOWN(crashmem_start + crashmem_size);
+
+	if (s1 == 0)
+		return;
+
+	if (node == 0) {
+		memblock_reserve(PFN_PHYS(s0), (s1 - s0) << PAGE_SHIFT);
+		memblock_reserve(PFN_PHYS(e1), (e0 - e1) << PAGE_SHIFT);
+	} else {
+		memblock_reserve(PFN_PHYS(s0), (e0 - s0) << PAGE_SHIFT);
+	}
+}
+
 static void __init check_kernel_sections_mem(void)
 {
 	phys_addr_t start = __pa_symbol(&_text);
@@ -696,6 +733,7 @@ static void __init arch_mem_init(char **cmdline_p)
 	for_each_online_node(node) {
 		get_pfn_range_for_nid(node, &start_pfn, &end_pfn);
 		reserve_crashm_region(node, start_pfn, end_pfn);
+		reserve_oldmem_region(node, start_pfn, end_pfn);
 	}
 
 	device_tree_init();
-- 
2.1.0

