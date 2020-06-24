Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6DE206C77
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 08:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389161AbgFXGdV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 02:33:21 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45206 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389061AbgFXGdU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 02:33:20 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj9+j8_Je2R5JAA--.564S9;
        Wed, 24 Jun 2020 14:33:12 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 07/14] irqchip/dw-apb-ictl: Fix potential resource leaks
Date:   Wed, 24 Jun 2020 14:32:40 +0800
Message-Id: <1592980367-1816-8-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592980367-1816-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592980367-1816-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dxj9+j8_Je2R5JAA--.564S9
X-Coremail-Antispam: 1UD129KBjvJXoW7KrWxZr43Ww48KFWDtFy7ZFb_yoW8WF43pF
        4fW39YkryfJF17XFn3ArWUX3s3t3W8tay7C3yIkan3Xr9xC34DCryFyFyjvF15AFWxG3WS
        kF4vyFyDCa1DJa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9E14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr4
        1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
        67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
        8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
        wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267
        AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VUj_HUJUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There exists potential resource leaks in the error path, fix them.

Fixes: 350d71b94fc9 ("irqchip: add DesignWare APB ICTL interrupt controller")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/irqchip/irq-dw-apb-ictl.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-dw-apb-ictl.c b/drivers/irqchip/irq-dw-apb-ictl.c
index e4550e9..bc9b750 100644
--- a/drivers/irqchip/irq-dw-apb-ictl.c
+++ b/drivers/irqchip/irq-dw-apb-ictl.c
@@ -86,12 +86,13 @@ static int __init dw_apb_ictl_init(struct device_node *np,
 	ret = of_address_to_resource(np, 0, &r);
 	if (ret) {
 		pr_err("%pOF: unable to get resource\n", np);
-		return ret;
+		goto err_irq_dispose;
 	}
 
 	if (!request_mem_region(r.start, resource_size(&r), np->full_name)) {
 		pr_err("%pOF: unable to request mem region\n", np);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_irq_dispose;
 	}
 
 	iobase = ioremap(r.start, resource_size(&r));
@@ -133,7 +134,7 @@ static int __init dw_apb_ictl_init(struct device_node *np,
 					     IRQ_GC_INIT_MASK_CACHE);
 	if (ret) {
 		pr_err("%pOF: unable to alloc irq domain gc\n", np);
-		goto err_unmap;
+		goto err_domain_remove;
 	}
 
 	for (i = 0; i < DIV_ROUND_UP(nrirqs, 32); i++) {
@@ -150,10 +151,14 @@ static int __init dw_apb_ictl_init(struct device_node *np,
 
 	return 0;
 
+err_domain_remove:
+	irq_domain_remove(domain);
 err_unmap:
 	iounmap(iobase);
 err_release:
 	release_mem_region(r.start, resource_size(&r));
+err_irq_dispose:
+	irq_dispose_mapping(irq);
 	return ret;
 }
 IRQCHIP_DECLARE(dw_apb_ictl,
-- 
2.1.0

