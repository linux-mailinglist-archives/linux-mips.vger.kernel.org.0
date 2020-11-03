Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 814DD2A3AE5
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 04:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgKCDPN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Nov 2020 22:15:13 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47018 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725958AbgKCDPM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 2 Nov 2020 22:15:12 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx7387y6BfU3sEAA--.3657S4;
        Tue, 03 Nov 2020 11:15:08 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 2/6] MIPS: Loongson64: Set the field ELPA of CP0_PAGEGRAIN only once
Date:   Tue,  3 Nov 2020 11:15:02 +0800
Message-Id: <1604373306-3599-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1604373306-3599-1-git-send-email-yangtiezhu@loongson.cn>
References: <1604373306-3599-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx7387y6BfU3sEAA--.3657S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KryxCw4fCr17tF18WF17Jrb_yoW8XrW3p3
        yfCrZIkw4jq34UuF1rta4UZr18GFZYgan7Z39rK3s5Xas8C3s2qr1xuFy8Za45JrW8ta13
        Xr4FqFWjga18Aa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8GwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
        MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
        1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
        IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRijjkUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The field ELPA of CP0_PAGEGRAIN register is set at the beginning
of the kernel entry point in kernel-entry-init.h, no need to set
it again in numa.c, we can remove enable_lpa() and only print the
related information.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2: No changes

 arch/mips/loongson64/numa.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index c7e3cced..509b360 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -35,20 +35,6 @@ EXPORT_SYMBOL(__node_data);
 cpumask_t __node_cpumask[MAX_NUMNODES];
 EXPORT_SYMBOL(__node_cpumask);
 
-static void enable_lpa(void)
-{
-	unsigned long value;
-
-	value = __read_32bit_c0_register($16, 3);
-	pr_info("CP0_Config3: CP0 16.3 (0x%lx)\n", value);
-
-	value = __read_32bit_c0_register($5, 1);
-	value |= 0x20000000;
-	__write_32bit_c0_register($5, 1, value);
-	value = __read_32bit_c0_register($5, 1);
-	pr_info("CP0_PageGrain: CP0 5.1 (0x%lx)\n", value);
-}
-
 static void cpu_node_probe(void)
 {
 	int i;
@@ -240,7 +226,8 @@ EXPORT_SYMBOL(pcibus_to_node);
 
 void __init prom_init_numa_memory(void)
 {
-	enable_lpa();
+	pr_info("CP0_Config3: CP0 16.3 (0x%x)\n", read_c0_config3());
+	pr_info("CP0_PageGrain: CP0 5.1 (0x%x)\n", read_c0_pagegrain());
 	prom_meminit();
 }
 EXPORT_SYMBOL(prom_init_numa_memory);
-- 
2.1.0

