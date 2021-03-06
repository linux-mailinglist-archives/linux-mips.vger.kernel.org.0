Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1A732F7DC
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 03:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhCFChE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 21:37:04 -0500
Received: from mail.loongson.cn ([114.242.206.163]:52726 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229938AbhCFCgr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Mar 2021 21:36:47 -0500
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH_Gx6kJgzxwVAA--.9772S6;
        Sat, 06 Mar 2021 10:36:40 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        wangming01@loongson.cn
Subject: [PATCH v3 4/7] MIPS: Loongson64: Add 2K1000 early_printk_port
Date:   Sat,  6 Mar 2021 10:36:30 +0800
Message-Id: <20210306023633.9579-5-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210306023633.9579-1-zhangqing@loongson.cn>
References: <20210306023633.9579-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxH_Gx6kJgzxwVAA--.9772S6
X-Coremail-Antispam: 1UD129KBjvdXoWrurWUtF4rXr13GryfKr15urg_yoWDXwbE9F
        WSyw1kCrWrAr1xCayrZrs3GFWUua4jgF45uF4qyr1Fva4Yywn3KFWDJa9xJFn3JrnYvF43
        Cws7JFyfCrsF9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb6xFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
        IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
        F7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr
        1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
        Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
        IIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_
        Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8Jw
        CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
        6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
        vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0x
        vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUPb1nUUUUU=
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Distinguish between 3A series CPU and 2K1000 CPU UART0.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---

v2-v3: No change

 arch/mips/loongson64/init.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index ed280b73bf89..d5a1eddb8202 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -120,7 +120,10 @@ void __init prom_init(void)
 #endif
 
 	/* Hardcode to CPU UART 0 */
-	setup_8250_early_printk_port(TO_UNCAC(LOONGSON_REG_BASE + 0x1e0), 0, 1024);
+	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R)
+		setup_8250_early_printk_port(TO_UNCAC(LOONGSON_REG_BASE), 0, 1024);
+	else
+		setup_8250_early_printk_port(TO_UNCAC(LOONGSON_REG_BASE + 0x1e0), 0, 1024);
 
 	register_smp_ops(&loongson3_smp_ops);
 	board_nmi_handler_setup = mips_nmi_setup;
-- 
2.20.1

