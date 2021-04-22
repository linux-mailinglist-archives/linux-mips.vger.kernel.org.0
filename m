Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9959367768
	for <lists+linux-mips@lfdr.de>; Thu, 22 Apr 2021 04:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232796AbhDVCZh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 21 Apr 2021 22:25:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44226 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230319AbhDVCZh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 21 Apr 2021 22:25:37 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT+5n3oBgwxoMAA--.4114S3;
        Thu, 22 Apr 2021 10:24:43 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, Baoquan He <bhe@redhat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jinyang He <hejinyang@loongson.cn>, kexec@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] MIPS: Fix cmdline "mem=" parameter parsing
Date:   Thu, 22 Apr 2021 10:24:31 +0800
Message-Id: <1619058274-6996-2-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1619058274-6996-1-git-send-email-tangyouling@loongson.cn>
References: <1619058274-6996-1-git-send-email-tangyouling@loongson.cn>
X-CM-TRANSID: AQAAf9DxT+5n3oBgwxoMAA--.4114S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uFWkur1UXF4UXrWUAr1xGrg_yoW8XFWDpa
        1UC395trs8u3W7W3WrCrZY9w43Jas5JF47JFW7u3s5A3ZIqFyrJrsYqF1jgFy0qFWkt3Wj
        qFyjvr45Ga1qyr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBm14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
        owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gr1l42
        xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
        GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
        8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
        MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
        8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOHUqUUUUU
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This problem may only occur on NUMA platforms. When machine start with the
"mem=" parameter on Loongson64, it cannot boot. When parsing the "mem="
parameter, first remove all RAM, and then add memory through memblock_add(),
which causes the newly added memory to be located on MAX_NUMNODES.

The solution is to add the current "mem=" parameter range to the memory area
of the corresponding node, instead of adding all of it to the MAX_NUMNODES
node area. Get the node number corresponding to the "mem=" parameter range
through pa_to_nid(), and then add it to the corresponding node through
memblock_add_node().

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
v2:
 - Include the mmzone.h header file, to solve the "error: implicit
   declaration of function'pa_to_nid'" compilation error.

 arch/mips/kernel/setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 279be01..9338520 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -37,6 +37,7 @@
 #include <asm/cdmm.h>
 #include <asm/cpu.h>
 #include <asm/debug.h>
+#include <asm/mmzone.h>
 #include <asm/sections.h>
 #include <asm/setup.h>
 #include <asm/smp-ops.h>
@@ -359,7 +360,7 @@ static int __init early_parse_mem(char *p)
 	if (*p == '@')
 		start = memparse(p + 1, &p);
 
-	memblock_add(start, size);
+	memblock_add_node(start, size, pa_to_nid(start));
 
 	return 0;
 }
-- 
2.1.0

