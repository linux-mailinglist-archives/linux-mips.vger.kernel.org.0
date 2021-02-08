Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C21231330F
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 14:17:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBHNQC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 08:16:02 -0500
Received: from mail.loongson.cn ([114.242.206.163]:50680 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229766AbhBHNPr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Feb 2021 08:15:47 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxZO1HOSFg4z0IAA--.11298S2;
        Mon, 08 Feb 2021 21:14:47 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: Make check condition for SDBBP consistent with EJTAG spec
Date:   Mon,  8 Feb 2021 21:14:45 +0800
Message-Id: <1612790085-14436-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9CxZO1HOSFg4z0IAA--.11298S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw1xZFWDXw48Gw4xKw1rWFg_yoWfZFg_Kr
        1Ivws7uw15Jr1avr1293yfGryagw1Fg3Za9w4qqrWYvrn5C3s8A392q3Zaqrn5Wws2vrs0
        vas8J3ZrJFs7XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbc8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
        1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
        cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
        ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6ry8MxAI
        w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
        CI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUb73vUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

According to MIPS EJTAG Specification [1], a Debug Breakpoint
exception occurs when an SDBBP instruction is executed, the
CP0_DEBUG bit DBp indicates that a Debug Breakpoint exception
occurred, just check bit DBp for SDBBP is more accurate.

[1] http://www.t-es-t.hu/download/mips/md00047f.pdf

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/kernel/genex.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index bcce32a..6336826 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -349,8 +349,8 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
 	MTC0	k0, CP0_DESAVE
 	mfc0	k0, CP0_DEBUG
 
-	sll	k0, k0, 30	# Check for SDBBP.
-	bgez	k0, ejtag_return
+	andi	k0, k0, 0x2	# Check for SDBBP.
+	beqz	k0, ejtag_return
 
 #ifdef CONFIG_SMP
 1:	PTR_LA	k0, ejtag_debug_buffer_spinlock
-- 
2.1.0

