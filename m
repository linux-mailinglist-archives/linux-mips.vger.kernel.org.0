Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE21204D03
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 10:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731953AbgFWIw2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 04:52:28 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41240 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731806AbgFWIwX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 23 Jun 2020 04:52:23 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv2uFwvFecLBIAA--.12S3;
        Tue, 23 Jun 2020 16:51:21 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Guo Ren <guoren@kernel.org>, Baruch Siach <baruch@tkos.co.il>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 1/7] irqchip: Fix potential resource leaks
Date:   Tue, 23 Jun 2020 16:51:10 +0800
Message-Id: <1592902276-3969-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592902276-3969-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592902276-3969-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dxv2uFwvFecLBIAA--.12S3
X-Coremail-Antispam: 1UD129KBjvAXoW3KF1fAFW5KF1kGF45Wr15Jwb_yoW8XFy3uo
        WfJr95Zay8Crn7ArW09F43tFyavr1DWws5Aan5uanIkFyjqF4rtF47GF13JFy7ZF4kCFs7
        Ga1I9rn3GFsrJF17n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYR7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r18M28IrcIa0x
        kI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
        jcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJw
        CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5OJ5DUUU
        U
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There exists some potential resource leaks in the error path, fix them.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/irqchip/irq-ath79-misc.c      |  3 +++
 drivers/irqchip/irq-csky-apb-intc.c   |  3 +++
 drivers/irqchip/irq-csky-mpintc.c     | 26 ++++++++++++++++++++------
 drivers/irqchip/irq-davinci-aintc.c   | 17 +++++++++++++----
 drivers/irqchip/irq-davinci-cp-intc.c | 17 ++++++++++++++---
 drivers/irqchip/irq-digicolor.c       |  4 ++++
 drivers/irqchip/irq-dw-apb-ictl.c     | 11 ++++++++---
 drivers/irqchip/irq-loongson-htvec.c  |  5 ++++-
 drivers/irqchip/irq-ls1x.c            |  4 +++-
 drivers/irqchip/irq-mscc-ocelot.c     |  6 ++++--
 drivers/irqchip/irq-nvic.c            |  2 ++
 drivers/irqchip/irq-omap-intc.c       |  4 +++-
 drivers/irqchip/irq-riscv-intc.c      |  1 +
 drivers/irqchip/irq-s3c24xx.c         | 20 +++++++++++++++-----
 drivers/irqchip/irq-xilinx-intc.c     |  1 +
 15 files changed, 98 insertions(+), 26 deletions(-)

diff --git a/drivers/irqchip/irq-ath79-misc.c b/drivers/irqchip/irq-ath79-misc.c
index 3d641bb..4a86a9e 100644
--- a/drivers/irqchip/irq-ath79-misc.c
+++ b/drivers/irqchip/irq-ath79-misc.c
@@ -144,6 +144,7 @@ static int __init ath79_misc_intc_of_init(
 	base = of_iomap(node, 0);
 	if (!base) {
 		pr_err("Failed to get MISC IRQ registers\n");
+		irq_dispose_mapping(irq);
 		return -ENOMEM;
 	}
 
@@ -151,6 +152,8 @@ static int __init ath79_misc_intc_of_init(
 				&misc_irq_domain_ops, base);
 	if (!domain) {
 		pr_err("Failed to add MISC irqdomain\n");
+		iounmap(base);
+		irq_dispose_mapping(irq);
 		return -EINVAL;
 	}
 
diff --git a/drivers/irqchip/irq-csky-apb-intc.c b/drivers/irqchip/irq-csky-apb-intc.c
index 5a2ec43..aaa4ac7 100644
--- a/drivers/irqchip/irq-csky-apb-intc.c
+++ b/drivers/irqchip/irq-csky-apb-intc.c
@@ -118,6 +118,7 @@ ck_intc_init_comm(struct device_node *node, struct device_node *parent)
 					    &irq_generic_chip_ops, NULL);
 	if (!root_domain) {
 		pr_err("C-SKY Intc irq_domain_add failed.\n");
+		iounmap(reg_base);
 		return -ENOMEM;
 	}
 
@@ -126,6 +127,8 @@ ck_intc_init_comm(struct device_node *node, struct device_node *parent)
 			IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN, 0, 0);
 	if (ret) {
 		pr_err("C-SKY Intc irq_alloc_gc failed.\n");
+		irq_domain_remove(root_domain);
+		iounmap(reg_base);
 		return -ENOMEM;
 	}
 
diff --git a/drivers/irqchip/irq-csky-mpintc.c b/drivers/irqchip/irq-csky-mpintc.c
index a1534ed..c195e24 100644
--- a/drivers/irqchip/irq-csky-mpintc.c
+++ b/drivers/irqchip/irq-csky-mpintc.c
@@ -247,8 +247,10 @@ csky_mpintc_init(struct device_node *node, struct device_node *parent)
 	if (INTCG_base == NULL) {
 		INTCG_base = ioremap(mfcr("cr<31, 14>"),
 				     INTCL_SIZE*nr_cpu_ids + INTCG_SIZE);
-		if (INTCG_base == NULL)
-			return -EIO;
+		if (INTCG_base == NULL) {
+			ret = -EIO;
+			goto err_free;
+		}
 
 		INTCL_base = INTCG_base + INTCG_SIZE;
 
@@ -257,8 +259,10 @@ csky_mpintc_init(struct device_node *node, struct device_node *parent)
 
 	root_domain = irq_domain_add_linear(node, nr_irq, &csky_irqdomain_ops,
 					    NULL);
-	if (!root_domain)
-		return -ENXIO;
+	if (!root_domain) {
+		ret = -ENXIO;
+		goto err_iounmap;
+	}
 
 	/* for every cpu */
 	for_each_present_cpu(cpu) {
@@ -270,12 +274,22 @@ csky_mpintc_init(struct device_node *node, struct device_node *parent)
 
 #ifdef CONFIG_SMP
 	ipi_irq = irq_create_mapping(root_domain, IPI_IRQ);
-	if (!ipi_irq)
-		return -EIO;
+	if (!ipi_irq) {
+		ret = -EIO;
+		goto err_domain_remove;
+	}
 
 	set_send_ipi(&csky_mpintc_send_ipi, ipi_irq);
 #endif
 
 	return 0;
+
+err_domain_remove:
+	irq_domain_remove(root_domain);
+err_iounmap:
+	iounmap(INTCG_base);
+err_free:
+	kfree(__trigger);
+	return ret;
 }
 IRQCHIP_DECLARE(csky_mpintc, "csky,mpintc", csky_mpintc_init);
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
diff --git a/drivers/irqchip/irq-davinci-cp-intc.c b/drivers/irqchip/irq-davinci-cp-intc.c
index 276da277..991339f 100644
--- a/drivers/irqchip/irq-davinci-cp-intc.c
+++ b/drivers/irqchip/irq-davinci-cp-intc.c
@@ -175,7 +175,8 @@ davinci_cp_intc_do_init(const struct davinci_cp_intc_config *config,
 				       resource_size(&config->reg));
 	if (!davinci_cp_intc_base) {
 		pr_err("%s: unable to ioremap register range\n", __func__);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_release;
 	}
 
 	davinci_cp_intc_write(0, DAVINCI_CP_INTC_GLOBAL_ENABLE);
@@ -210,7 +211,8 @@ davinci_cp_intc_do_init(const struct davinci_cp_intc_config *config,
 	if (irq_base < 0) {
 		pr_err("%s: unable to allocate interrupt descriptors: %d\n",
 		       __func__, irq_base);
-		return irq_base;
+		ret = irq_base;
+		goto err_iounmap;
 	}
 
 	davinci_cp_intc_irq_domain = irq_domain_add_legacy(
@@ -219,7 +221,8 @@ davinci_cp_intc_do_init(const struct davinci_cp_intc_config *config,
 
 	if (!davinci_cp_intc_irq_domain) {
 		pr_err("%s: unable to create an interrupt domain\n", __func__);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_free_descs;
 	}
 
 	set_handle_irq(davinci_cp_intc_handle_irq);
@@ -228,6 +231,14 @@ davinci_cp_intc_do_init(const struct davinci_cp_intc_config *config,
 	davinci_cp_intc_write(1, DAVINCI_CP_INTC_GLOBAL_ENABLE);
 
 	return 0;
+
+err_free_descs:
+	irq_free_descs(irq_base, config->num_irqs);
+err_iounmap:
+	iounmap(davinci_cp_intc_base);
+err_release:
+	release_mem_region(config->reg.start, resource_size(&config->reg));
+	return ret;
 }
 
 int __init davinci_cp_intc_init(const struct davinci_cp_intc_config *config)
diff --git a/drivers/irqchip/irq-digicolor.c b/drivers/irqchip/irq-digicolor.c
index fc38d2d..a3c73c5 100644
--- a/drivers/irqchip/irq-digicolor.c
+++ b/drivers/irqchip/irq-digicolor.c
@@ -89,6 +89,7 @@ static int __init digicolor_of_init(struct device_node *node,
 	ucregs = syscon_regmap_lookup_by_phandle(node, "syscon");
 	if (IS_ERR(ucregs)) {
 		pr_err("%pOF: unable to map UC registers\n", node);
+		iounmap(reg_base);
 		return PTR_ERR(ucregs);
 	}
 	/* channel 1, regular IRQs */
@@ -98,6 +99,7 @@ static int __init digicolor_of_init(struct device_node *node,
 		irq_domain_add_linear(node, 64, &irq_generic_chip_ops, NULL);
 	if (!digicolor_irq_domain) {
 		pr_err("%pOF: unable to create IRQ domain\n", node);
+		iounmap(reg_base);
 		return -ENOMEM;
 	}
 
@@ -106,6 +108,8 @@ static int __init digicolor_of_init(struct device_node *node,
 					     clr, 0, 0);
 	if (ret) {
 		pr_err("%pOF: unable to allocate IRQ gc\n", node);
+		irq_domain_remove(digicolor_irq_domain);
+		iounmap(reg_base);
 		return ret;
 	}
 
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
diff --git a/drivers/irqchip/irq-loongson-htvec.c b/drivers/irqchip/irq-loongson-htvec.c
index 1ece933..b36d403 100644
--- a/drivers/irqchip/irq-loongson-htvec.c
+++ b/drivers/irqchip/irq-loongson-htvec.c
@@ -192,7 +192,7 @@ static int htvec_of_init(struct device_node *node,
 	if (!priv->htvec_domain) {
 		pr_err("Failed to create IRQ domain\n");
 		err = -ENOMEM;
-		goto iounmap_base;
+		goto irq_dispose;
 	}
 
 	htvec_reset(priv);
@@ -203,6 +203,9 @@ static int htvec_of_init(struct device_node *node,
 
 	return 0;
 
+irq_dispose:
+	for (; i > 0; i--)
+		irq_dispose_mapping(parent_irq[i - 1]);
 iounmap_base:
 	iounmap(priv->base);
 free_priv:
diff --git a/drivers/irqchip/irq-ls1x.c b/drivers/irqchip/irq-ls1x.c
index 353111a..409001b 100644
--- a/drivers/irqchip/irq-ls1x.c
+++ b/drivers/irqchip/irq-ls1x.c
@@ -131,7 +131,7 @@ static int __init ls1x_intc_of_init(struct device_node *node,
 	if (!priv->domain) {
 		pr_err("ls1x-irq: cannot add IRQ domain\n");
 		err = -ENOMEM;
-		goto out_iounmap;
+		goto out_dispose_irq;
 	}
 
 	err = irq_alloc_domain_generic_chips(priv->domain, 32, 2,
@@ -182,6 +182,8 @@ static int __init ls1x_intc_of_init(struct device_node *node,
 
 out_free_domain:
 	irq_domain_remove(priv->domain);
+out_dispose_irq:
+	irq_dispose_mapping(parent_irq);
 out_iounmap:
 	iounmap(priv->intc_base);
 out_free_priv:
diff --git a/drivers/irqchip/irq-mscc-ocelot.c b/drivers/irqchip/irq-mscc-ocelot.c
index 88143c0..e676ae2 100644
--- a/drivers/irqchip/irq-mscc-ocelot.c
+++ b/drivers/irqchip/irq-mscc-ocelot.c
@@ -73,7 +73,8 @@ static int __init ocelot_irq_init(struct device_node *node,
 				       &irq_generic_chip_ops, NULL);
 	if (!domain) {
 		pr_err("%pOFn: unable to add irq domain\n", node);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_irq_dispose;
 	}
 
 	ret = irq_alloc_domain_generic_chips(domain, OCELOT_NR_IRQ, 1,
@@ -109,9 +110,10 @@ static int __init ocelot_irq_init(struct device_node *node,
 
 err_gc_free:
 	irq_free_generic_chip(gc);
-
 err_domain_remove:
 	irq_domain_remove(domain);
+err_irq_dispose:
+	irq_dispose_mapping(parent_irq);
 
 	return ret;
 }
diff --git a/drivers/irqchip/irq-nvic.c b/drivers/irqchip/irq-nvic.c
index f747e22..2395e8e 100644
--- a/drivers/irqchip/irq-nvic.c
+++ b/drivers/irqchip/irq-nvic.c
@@ -94,6 +94,7 @@ static int __init nvic_of_init(struct device_node *node,
 
 	if (!nvic_irq_domain) {
 		pr_warn("Failed to allocate irq domain\n");
+		iounmap(nvic_base);
 		return -ENOMEM;
 	}
 
@@ -103,6 +104,7 @@ static int __init nvic_of_init(struct device_node *node,
 	if (ret) {
 		pr_warn("Failed to allocate irq chips\n");
 		irq_domain_remove(nvic_irq_domain);
+		iounmap(nvic_base);
 		return ret;
 	}
 
diff --git a/drivers/irqchip/irq-omap-intc.c b/drivers/irqchip/irq-omap-intc.c
index d360a6e..e711530 100644
--- a/drivers/irqchip/irq-omap-intc.c
+++ b/drivers/irqchip/irq-omap-intc.c
@@ -254,8 +254,10 @@ static int __init omap_init_irq_of(struct device_node *node)
 	omap_irq_soft_reset();
 
 	ret = omap_alloc_gc_of(domain, omap_irq_base);
-	if (ret < 0)
+	if (ret < 0) {
 		irq_domain_remove(domain);
+		iounmap(omap_irq_base);
+	}
 
 	return ret;
 }
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index a6f97fa..8d6286c 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -122,6 +122,7 @@ static int __init riscv_intc_init(struct device_node *node,
 	rc = set_handle_irq(&riscv_intc_irq);
 	if (rc) {
 		pr_err("failed to set irq handler\n");
+		irq_domain_remove(intc_domain);
 		return rc;
 	}
 
diff --git a/drivers/irqchip/irq-s3c24xx.c b/drivers/irqchip/irq-s3c24xx.c
index d2031fe..ef5d645 100644
--- a/drivers/irqchip/irq-s3c24xx.c
+++ b/drivers/irqchip/irq-s3c24xx.c
@@ -1239,7 +1239,8 @@ static int __init s3c_init_intc_of(struct device_node *np,
 						     &s3c24xx_irq_ops_of, NULL);
 	if (!domain) {
 		pr_err("irq: could not create irq-domain\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_iounmap;
 	}
 
 	for (i = 0; i < num_ctrl; i++) {
@@ -1248,15 +1249,17 @@ static int __init s3c_init_intc_of(struct device_node *np,
 		pr_debug("irq: found controller %s\n", ctrl->name);
 
 		intc = kzalloc(sizeof(struct s3c_irq_intc), GFP_KERNEL);
-		if (!intc)
-			return -ENOMEM;
+		if (!intc) {
+			ret = -ENOMEM;
+			goto out_domain_remove;
+		}
 
 		intc->domain = domain;
 		intc->irqs = kcalloc(32, sizeof(struct s3c_irq_data),
 				     GFP_KERNEL);
 		if (!intc->irqs) {
-			kfree(intc);
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto out_free;
 		}
 
 		if (ctrl->parent) {
@@ -1285,6 +1288,13 @@ static int __init s3c_init_intc_of(struct device_node *np,
 	set_handle_irq(s3c24xx_handle_irq);
 
 	return 0;
+
+out_free:
+	kfree(intc);
+out_domain_remove:
+	irq_domain_remove(domain);
+out_iounmap:
+	iounmap(reg_base);
 }
 
 static struct s3c24xx_irq_of_ctrl s3c2410_ctrl[] = {
diff --git a/drivers/irqchip/irq-xilinx-intc.c b/drivers/irqchip/irq-xilinx-intc.c
index 1d3d273..be8b9a6 100644
--- a/drivers/irqchip/irq-xilinx-intc.c
+++ b/drivers/irqchip/irq-xilinx-intc.c
@@ -241,6 +241,7 @@ static int __init xilinx_intc_of_init(struct device_node *intc,
 		} else {
 			pr_err("irq-xilinx: interrupts property not in DT\n");
 			ret = -EINVAL;
+			irq_domain_remove(irqc->root_domain);
 			goto error;
 		}
 	} else {
-- 
2.1.0

