Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1392E2FA13D
	for <lists+linux-mips@lfdr.de>; Mon, 18 Jan 2021 14:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404344AbhARNVE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 Jan 2021 08:21:04 -0500
Received: from mail.loongson.cn ([114.242.206.163]:35658 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730443AbhARNU6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 Jan 2021 08:20:58 -0500
Received: from localhost.localdomain (unknown [112.3.198.184])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxe+T2igVgYswGAA--.10336S2;
        Mon, 18 Jan 2021 21:19:51 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-mips@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] MIPS: IRQ: Add prototype for function init_IRQ
Date:   Mon, 18 Jan 2021 21:20:09 +0800
Message-Id: <20210118132009.2642893-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxe+T2igVgYswGAA--.10336S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr1rAw43XF4fCFW8KFWUCFg_yoWxZFXEk3
        42ya18Wr1rWr4avr9xXa95JFyF934rWa9xKrn5ZFnxAr95Ar45tay8JryrXrsYkr1qyr4v
        9FZ5G3s0k3ZrKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbwkFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
        1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
        cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
        ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l
        4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
        AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
        cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
        8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
        wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbrMaUUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This commit adds a prototype to fix error at W=1:

arch/mips/kernel/irq.c:52:13: error: no previous prototype for
'init_IRQ' [-Werror=missing-prototypes]

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 arch/mips/include/asm/irq.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
index c5d351786416..f021de661c3a 100644
--- a/arch/mips/include/asm/irq.h
+++ b/arch/mips/include/asm/irq.h
@@ -20,6 +20,7 @@
 #define IRQ_STACK_SIZE			THREAD_SIZE
 #define IRQ_STACK_START			(IRQ_STACK_SIZE - 16)
 
+extern void __init init_IRQ(void);
 extern void *irq_stack[NR_CPUS];
 
 /*
-- 
2.27.0

