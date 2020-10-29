Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 850EA29E5AD
	for <lists+linux-mips@lfdr.de>; Thu, 29 Oct 2020 09:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727612AbgJ2IEx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Oct 2020 04:04:53 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58392 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727009AbgJ2ID2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 29 Oct 2020 04:03:28 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_9JJd5pfmHcCAA--.10240S4;
        Thu, 29 Oct 2020 16:03:23 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 2/6] MIPS: Loongson64: Set the field ELPA of CP0_PAGEGRAIN only once
Date:   Thu, 29 Oct 2020 16:02:57 +0800
Message-Id: <1603958581-4723-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1603958581-4723-1-git-send-email-yangtiezhu@loongson.cn>
References: <1603958581-4723-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx_9JJd5pfmHcCAA--.10240S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KryxCw4fCr17tF18WF17Jrb_yoW8Xry7p3
        y3CrZIkw4jq34UZF1rta4UZr18GFZ0gan7Z39rK3s5Xas8C3s2qr1xWF18Za45JrW8ta13
        Xr4FqF4jga18Aa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBS14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFyl42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUUVyIDUUUU
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

