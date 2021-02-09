Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA293147E0
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 06:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbhBIFGy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Feb 2021 00:06:54 -0500
Received: from mail.loongson.cn ([114.242.206.163]:41832 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229975AbhBIFGp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Feb 2021 00:06:45 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx3_MVGCJghngIAA--.10677S2;
        Tue, 09 Feb 2021 13:05:26 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2] MIPS: Make check condition for SDBBP consistent with EJTAG spec
Date:   Tue,  9 Feb 2021 13:05:25 +0800
Message-Id: <1612847125-3141-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx3_MVGCJghngIAA--.10677S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trWxJry7tr17XrWfJw47Arb_yoW8Xw4fpw
        4DC3WkGrW8WryUZay5ArZ5ur45X3s8GrWY9ayDK3yFqa4jgFWrtF4fKrW3Kry8Wa1jka10
        ga9IgrnrXr1IyrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjNJ55UUUU
        U==
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

v2: add MIPS_DEBUG_DBP definition

 arch/mips/include/asm/mipsregs.h | 4 ++++
 arch/mips/kernel/genex.S         | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index a0e8ae5..9c8099a 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1085,6 +1085,10 @@
 #define CVMVMCONF_RMMUSIZEM1_S	0
 #define CVMVMCONF_RMMUSIZEM1	(_U64CAST_(0xff) << CVMVMCONF_RMMUSIZEM1_S)
 
+/* Debug register field definitions */
+#define MIPS_DEBUG_DBP_SHIFT	1
+#define MIPS_DEBUG_DBP		(_ULCAST_(1) << MIPS_DEBUG_DBP_SHIFT)
+
 /*
  * Coprocessor 1 (FPU) register names
  */
diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index bcce32a..743d759 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -349,8 +349,8 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
 	MTC0	k0, CP0_DESAVE
 	mfc0	k0, CP0_DEBUG
 
-	sll	k0, k0, 30	# Check for SDBBP.
-	bgez	k0, ejtag_return
+	andi	k0, k0, MIPS_DEBUG_DBP	# Check for SDBBP.
+	beqz	k0, ejtag_return
 
 #ifdef CONFIG_SMP
 1:	PTR_LA	k0, ejtag_debug_buffer_spinlock
-- 
2.1.0

