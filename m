Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3572314BC4
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 10:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhBIJfr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Feb 2021 04:35:47 -0500
Received: from mail.loongson.cn ([114.242.206.163]:34836 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230204AbhBIJd3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Feb 2021 04:33:29 -0500
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxSdSoViJgw40IAA--.11028S5;
        Tue, 09 Feb 2021 17:32:33 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Xingxing Su <suxingxing@loongson.cn>
Subject: [PATCH 3/6] MIPS: Loongson64: Add support for the 2K1000 to get cpu_clock_freq
Date:   Tue,  9 Feb 2021 17:32:21 +0800
Message-Id: <20210209093224.7085-4-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209093224.7085-1-zhangqing@loongson.cn>
References: <20210209093224.7085-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxSdSoViJgw40IAA--.11028S5
X-Coremail-Antispam: 1UD129KBjvdXoW7Xr1UGr13CF1kJryrtw1kKrg_yoWDJFc_Ka
        4Iy3y8GryfJ3WIkFW7Xr45Xry293y8CF4xuFnIyr1Sqa4vv3sIga1kJw17GF43Cw4FkrWr
        WFZ5Ar48Cr47GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUby8FF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWwA2048vs2IY02
        0Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
        v7MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
        0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
        0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
        0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
        IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZF
        pf9x0JUfpnQUUUUU=
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Get the fixed-clock from the CPU0 node of the device tree.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
Signed-off-by: Xingxing Su <suxingxing@loongson.cn>
---
 arch/mips/loongson64/time.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/mips/loongson64/time.c b/arch/mips/loongson64/time.c
index 91e842b58365..45698b18f4ae 100644
--- a/arch/mips/loongson64/time.c
+++ b/arch/mips/loongson64/time.c
@@ -11,9 +11,23 @@
 #include <asm/hpet.h>
 
 #include <loongson.h>
+#include <linux/clk.h>
+#include <linux/of_clk.h>
 
 void __init plat_time_init(void)
 {
+	struct clk *clk = NULL;
+	struct device_node *np;
+
+	of_clk_init(NULL);
+
+	np = of_get_cpu_node(0, NULL);
+	clk = of_clk_get(np, 0);
+	if (clk) {
+		cpu_clock_freq = clk_get_rate(clk);
+		clk_put(clk);
+	}
+
 	/* setup mips r4k timer */
 	mips_hpt_frequency = cpu_clock_freq / 2;
 
-- 
2.20.1

