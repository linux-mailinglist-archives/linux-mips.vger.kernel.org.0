Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0647F1B2242
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 11:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbgDUJEv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 05:04:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34794 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726052AbgDUJEv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Apr 2020 05:04:51 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT2knt55emXsqAA--.36S5;
        Tue, 21 Apr 2020 17:04:44 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>
Subject: [PATCH 3/3] MIPS: Reduce possibility of kernel panic under CONFIG_SWIOTLB
Date:   Tue, 21 Apr 2020 17:04:29 +0800
Message-Id: <1587459869-12183-4-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1587459869-12183-1-git-send-email-yangtiezhu@loongson.cn>
References: <1587459869-12183-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxT2knt55emXsqAA--.36S5
X-Coremail-Antispam: 1UD129KBjvJXoWxXw43uFW3Cr13Aw18Ar4UCFg_yoW5GF1kpr
        y7C3WYqr4vqrn7A3yfC348ZF1akwn5Cry7W3yavr4ruw1DXrs8Ar4vgF43XF1xtrW0qF4a
        qa4FvFW09Fs7AaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBS14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFWl42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUUHq2DUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the current code, if CONFIG_SWIOTLB is set, when failed to get IO TLB
memory from the low pages by plat_swiotlb_setup(), it may lead to the boot
process failed with kernel panic.

(1) On the Loongson and SiByte platform
arch/mips/loongson64/dma.c
arch/mips/sibyte/common/dma.c
void __init plat_swiotlb_setup(void)
{
	swiotlb_init(1);
}

kernel/dma/swiotlb.c
void  __init
swiotlb_init(int verbose)
{
...
	vstart = memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, verbose))
		return;
...
	pr_warn("Cannot allocate buffer");
	no_iotlb_memory = true;
}

phys_addr_t swiotlb_tbl_map_single()
{
...
	if (no_iotlb_memory)
		panic("Can not allocate SWIOTLB buffer earlier ...");
...
}

(2) On the Cavium OCTEON platform
arch/mips/cavium-octeon/dma-octeon.c
void __init plat_swiotlb_setup(void)
{
...
	octeon_swiotlb = memblock_alloc_low(swiotlbsize, PAGE_SIZE);
	if (!octeon_swiotlb)
		panic("%s: Failed to allocate %zu bytes align=%lx\n",
		      __func__, swiotlbsize, PAGE_SIZE);
...
}

Because IO_TLB_DEFAULT_SIZE is 64M, if the rest size of low memory is less
than 64M when call plat_swiotlb_setup(), we can easily reproduce the panic
case.

In order to reduce the possibility of kernel panic when failed to get IO
TLB memory under CONFIG_SWIOTLB, it is better to allocate low memory as
small as possible before plat_swiotlb_setup(), so make sparse_init() using
top-down allocation.

Reported-by: Juxin Gao <gaojuxin@loongson.cn>
Co-developed-by: Juxin Gao <gaojuxin@loongson.cn>
Signed-off-by: Juxin Gao <gaojuxin@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/kernel/setup.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 5481a0c..8db533c 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -700,7 +700,17 @@ static void __init arch_mem_init(char **cmdline_p)
 		memblock_reserve(crashk_res.start, resource_size(&crashk_res));
 #endif
 	device_tree_init();
+
+	/*
+	 * In order to reduce the possibility of kernel panic when failed to
+	 * get IO TLB memory under CONFIG_SWIOTLB, it is better to allocate
+	 * low memory as small as possible before plat_swiotlb_setup(), so
+	 * make sparse_init() using top-down allocation.
+	 */
+	memblock_set_bottom_up(false);
 	sparse_init();
+	memblock_set_bottom_up(true);
+
 	plat_swiotlb_setup();
 
 	dma_contiguous_reserve(PFN_PHYS(max_low_pfn));
-- 
2.1.0

