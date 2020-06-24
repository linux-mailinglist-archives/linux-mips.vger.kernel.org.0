Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46AF206DFE
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 09:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389985AbgFXHpT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 03:45:19 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35736 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389583AbgFXHpT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 03:45:19 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD2qIBPNevCZJAA--.660S9;
        Wed, 24 Jun 2020 15:45:15 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 07/14 RESEND] irqchip/dw-apb-ictl: Fix potential resource leaks
Date:   Wed, 24 Jun 2020 15:45:04 +0800
Message-Id: <1592984711-3130-8-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxD2qIBPNevCZJAA--.660S9
X-Coremail-Antispam: 1UD129KBjvJXoW7KrWxZr43Ww48KFWDtFy7ZFb_yoW8WF43pF
        4fW39YkryfJF17XFn3ArWUX3s3t3W8tay7C3yIkan3Xr9xC34DCryFyFyjvF15AFWxG3WS
        kF4vyFyDCa1DJa7anT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUQK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
        02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE
        4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mx
        kF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
        s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMI
        IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_GcCE3sUvcSsGvfC2KfnxnUUI43ZEXa7sR_ksqPUUUUU==
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

