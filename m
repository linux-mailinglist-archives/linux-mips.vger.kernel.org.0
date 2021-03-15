Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A1733AC9F
	for <lists+linux-mips@lfdr.de>; Mon, 15 Mar 2021 08:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbhCOHuk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Mar 2021 03:50:40 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41270 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230269AbhCOHuT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Mar 2021 03:50:19 -0400
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxydSsEU9gcqMZAA--.1167S6;
        Mon, 15 Mar 2021 15:50:13 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Ming Wang <wangming01@loongson.cn>
Subject: [PATCH v5 4/7] MIPS: Loongson64: Add Loongson-2K1000 early_printk_port
Date:   Mon, 15 Mar 2021 15:50:01 +0800
Message-Id: <20210315075004.15465-5-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315075004.15465-1-zhangqing@loongson.cn>
References: <20210315075004.15465-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxydSsEU9gcqMZAA--.1167S6
X-Coremail-Antispam: 1UD129KBjvdXoWrZw1rWry8KryxWr1xGw4xCrg_yoWDtwcEgF
        WSyw1kCrWrCr1xCayrZrs3GFW5ua4jgF45uF1DAr1Fva4Yy3Z5WFWDAanxGFn3ArnYvF13
        uws7JryfCrnFvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbhkFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
        IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
        F7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr
        1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8CwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
        MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
        1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
        IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU-zVnUUUUU=
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Distinguish between Loongson-3A series CPU and Loongson-2K1000 CPU UART0.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
Tested-by: Ming Wang <wangming01@loongson.cn>
---

v4-v5:
- No change

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

