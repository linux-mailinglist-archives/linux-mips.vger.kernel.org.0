Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3863122E6
	for <lists+linux-mips@lfdr.de>; Sun,  7 Feb 2021 09:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbhBGIxu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Feb 2021 03:53:50 -0500
Received: from mail.loongson.cn ([114.242.206.163]:36060 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229522AbhBGIxt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Feb 2021 03:53:49 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx__JVqh9gVbQHAA--.9789S2;
        Sun, 07 Feb 2021 16:52:37 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: process: Fix no previous prototype warning
Date:   Sun,  7 Feb 2021 16:52:36 +0800
Message-Id: <1612687956-28075-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx__JVqh9gVbQHAA--.9789S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xr1xZFWrCFy3Ar48AFyrZwb_yoWDuwc_Cw
        17Cw18W3s2yr4qvFy7Jan3Jwn0k34UGFyDuwn3Zr1YyasxAry5W393Aw1DJwn09r9aqF1r
        W3W5J3yUGwnI9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb7AYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_GFyl42xK82IY
        c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
        vE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
        aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5RrW7UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

unwind_stack_by_address and unwind_stack need <asm/stacktrace.h>.
arch_align_stack needs <asm/exec.h>

link: https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/thread/ZPL2RRA6RZKRQZI5IGOVLFXN2GVZBN3L/
Fixes: ("MIPS: process: Remove unnecessary headers inclusion")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/kernel/process.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 0c5bc06..2e591df 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -26,6 +26,7 @@
 #include <asm/asm.h>
 #include <asm/dsemul.h>
 #include <asm/dsp.h>
+#include <asm/exec.h>
 #include <asm/fpu.h>
 #include <asm/inst.h>
 #include <asm/irq.h>
@@ -36,6 +37,7 @@
 #include <asm/mipsregs.h>
 #include <asm/processor.h>
 #include <asm/reg.h>
+#include <asm/stacktrace.h>
 
 #ifdef CONFIG_HOTPLUG_CPU
 void arch_cpu_idle_dead(void)
-- 
2.1.0

