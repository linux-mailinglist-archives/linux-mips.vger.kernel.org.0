Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D15962A3D4E
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 08:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbgKCHMP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Nov 2020 02:12:15 -0500
Received: from mail.loongson.cn ([114.242.206.163]:37244 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727527AbgKCHMO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Nov 2020 02:12:14 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx79PGAqFfIKEEAA--.12977S4;
        Tue, 03 Nov 2020 15:12:07 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 2/6] MIPS: Loongson64: Set the field ELPA of CP0_PAGEGRAIN only once
Date:   Tue,  3 Nov 2020 15:12:01 +0800
Message-Id: <1604387525-23400-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
References: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx79PGAqFfIKEEAA--.12977S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KryxCw4fCr17tF18WF17Jrb_yoW8XF1Dp3
        yfCrZIkw4jq345uF1rta4UZr18GFZYgan7Z39rK3s5Xas8C3s2qF1xuFy8Za45JrW8ta13
        Xr4FqFWjga18Aa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPC14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUGVWUXwAv7VCY1x0262k0Y48FwI0_Jr0_Gr1lYx0Ex4A2jsIE14v26r4j6F4U
        McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I64
        8v4I1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7sRRRwZ7UUUUU==
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
v3: No changes

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

