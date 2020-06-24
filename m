Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4F2206E36
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 09:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388276AbgFXHvQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 03:51:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:37474 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387849AbgFXHvQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 03:51:16 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD2qIBPNevCZJAA--.660S6;
        Wed, 24 Jun 2020 15:45:14 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 04/14 RESEND] irqchip/davinci-aintc: Fix potential resource leaks
Date:   Wed, 24 Jun 2020 15:45:01 +0800
Message-Id: <1592984711-3130-5-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxD2qIBPNevCZJAA--.660S6
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar4DuryfXr1ftF45GF47twb_yoW8tFy3pF
        W5Aw4a9r48tF15XwsxCFyYgF13Cw1vkFW7C34UGas7ZrsYy34v9r15GFZxZFyUGw48X3Wj
        yFs3Ja48WF1UZaUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Fixes: 0145beed9d26 ("irqchip: davinci-aintc: move the driver to drivers/irqchip")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/irqchip/irq-davinci-aintc.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-davinci-aintc.c b/drivers/irqchip/irq-davinci-aintc.c
index 810ccc4..12db502 100644
--- a/drivers/irqchip/irq-davinci-aintc.c
+++ b/drivers/irqchip/irq-davinci-aintc.c
@@ -96,7 +96,7 @@ void __init davinci_aintc_init(const struct davinci_aintc_config *config)
 				     resource_size(&config->reg));
 	if (!davinci_aintc_base) {
 		pr_err("%s: unable to ioremap register range\n", __func__);
-		return;
+		goto err_release;
 	}
 
 	/* Clear all interrupt requests */
@@ -133,7 +133,7 @@ void __init davinci_aintc_init(const struct davinci_aintc_config *config)
 	if (irq_base < 0) {
 		pr_err("%s: unable to allocate interrupt descriptors: %d\n",
 		       __func__, irq_base);
-		return;
+		goto err_iounmap;
 	}
 
 	davinci_aintc_irq_domain = irq_domain_add_legacy(NULL,
@@ -141,7 +141,7 @@ void __init davinci_aintc_init(const struct davinci_aintc_config *config)
 						&irq_domain_simple_ops, NULL);
 	if (!davinci_aintc_irq_domain) {
 		pr_err("%s: unable to create interrupt domain\n", __func__);
-		return;
+		goto err_free_descs;
 	}
 
 	ret = irq_alloc_domain_generic_chips(davinci_aintc_irq_domain, 32, 1,
@@ -150,7 +150,7 @@ void __init davinci_aintc_init(const struct davinci_aintc_config *config)
 	if (ret) {
 		pr_err("%s: unable to allocate generic irq chips for domain\n",
 		       __func__);
-		return;
+		goto err_domain_remove;
 	}
 
 	for (irq_off = 0, reg_off = 0;
@@ -160,4 +160,13 @@ void __init davinci_aintc_init(const struct davinci_aintc_config *config)
 				       irq_base + irq_off, 32);
 
 	set_handle_irq(davinci_aintc_handle_irq);
+
+err_domain_remove:
+	irq_domain_remove(davinci_aintc_irq_domain);
+err_free_descs:
+	irq_free_descs(irq_base, config->num_irqs);
+err_iounmap:
+	iounmap(davinci_aintc_base);
+err_release:
+	release_mem_region(config->reg.start, resource_size(&config->reg));
 }
-- 
2.1.0

