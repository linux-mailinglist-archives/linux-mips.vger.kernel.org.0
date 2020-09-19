Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7BAE2709D0
	for <lists+linux-mips@lfdr.de>; Sat, 19 Sep 2020 04:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgISCCo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Sep 2020 22:02:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44436 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726252AbgISCCo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 18 Sep 2020 22:02:44 -0400
X-Greylist: delayed 412 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 22:02:41 EDT
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx6MQiZWVfIF8WAA--.1308S2;
        Sat, 19 Sep 2020 09:55:46 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: kexec: Add crashkernel=YM handling
Date:   Sat, 19 Sep 2020 09:55:46 +0800
Message-Id: <1600480546-10448-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx6MQiZWVfIF8WAA--.1308S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGw4xJF1UGF4fZw15Zw1UWrg_yoW5WF13p3
        4UAw4rKr48JF9rG3yfArnxCr4rA3WFyayUWFZrtrWFkF9xWrn8tr4fW3W7ZF9rtr9Yg3W7
        ArsaqFsIka1rZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6w4l42xK82IY
        c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
        vE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
        87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bYlk3UUUUU=
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When the kernel crashkernel parameter is specified with just a size,
we are supposed to allocate a region from RAM to store the crashkernel.
However, MIPS merely reserves physical address zero with no checking
that there is even RAM there.

Fix this by lifting similar code from x86, importing it to MIPS with the
MIPS specific parameters added. In the absence of any platform specific
information, we allocate the crashkernel region from the first 512MB of
physical memory (limited to CKSEG0 or KSEG0 address range).

When X is not specified, crash_base defaults to 0 (crashkernel=YM@XM).

E.g. without this patch:

The environment as follows:
[    0.000000] MIPS: machine is loongson,loongson64c-4core-ls7a
...
[    0.000000] Kernel command line: root=/dev/sda2 crashkernel=96M ...

The warning as follows:
[    0.000000] Invalid memory region reserved for crash kernel

And the iomem as follows:
00200000-0effffff : System RAM
  00200000-00b47f87 : Kernel code
  00b47f88-00dfffff : Kernel data
  00e60000-01f73c7f : Kernel bss
1a000000-1bffffff : pci@1a000000
...

With this patch:

After increasing crash_base <= 0 handling.

And the iomem as follows:
00200000-0effffff : System RAM
  00200000-00b47f87 : Kernel code
  00b47f88-00dfffff : Kernel data
  00e60000-01f73c7f : Kernel bss
  04000000-09ffffff : Crash kernel
1a000000-1bffffff : pci@1a000000
...

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/mips/kernel/setup.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index bf5f5ac..59a88ea 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -477,6 +477,11 @@ early_param("elfcorehdr", early_parse_elfcorehdr);
 #endif
 
 #ifdef CONFIG_KEXEC
+
+/* 64M alignment for crash kernel regions */
+#define CRASH_ALIGN	SZ_64M
+#define CRASH_ADDR_MAX	SZ_512M
+
 static void __init mips_parse_crashkernel(void)
 {
 	unsigned long long total_mem;
@@ -489,9 +494,22 @@ static void __init mips_parse_crashkernel(void)
 	if (ret != 0 || crash_size <= 0)
 		return;
 
-	if (!memblock_find_in_range(crash_base, crash_base + crash_size, crash_size, 1)) {
-		pr_warn("Invalid memory region reserved for crash kernel\n");
-		return;
+	if (crash_base <= 0) {
+		crash_base = memblock_find_in_range(CRASH_ALIGN, CRASH_ADDR_MAX,
+							crash_size, CRASH_ALIGN);
+		if (!crash_base) {
+			pr_warn("crashkernel reservation failed - No suitable area found.\n");
+			return;
+		}
+	} else {
+		unsigned long long start;
+
+		start = memblock_find_in_range(crash_base, crash_base + crash_size,
+						crash_size, 1);
+		if (start != crash_base) {
+			pr_warn("Invalid memory region reserved for crash kernel\n");
+			return;
+		}
 	}
 
 	crashk_res.start = crash_base;
-- 
2.1.0

