Return-Path: <linux-mips+bounces-8220-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B45CA6880E
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 10:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CD621782F6
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 09:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB05253B61;
	Wed, 19 Mar 2025 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XoDubxg9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2013C253B56;
	Wed, 19 Mar 2025 09:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376662; cv=none; b=YkiJjRFh6QvGqZ+62W9bnGLaXT5gxJuCepMxh6xoRbknXy9sQjIeZa6mbFWTMQvBbmIO7jFzfqdeTSX1k8ciGq7f7iVBD5Dpd2cP+zmdOU/cNmZIy8T44uuoy5VisnziNBj6AfbskLWEV8qNiOjZfOtZNGYPgkkBl+l1FC16Wyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376662; c=relaxed/simple;
	bh=nXAYpC2swsn1QDFpjOFNZQf9gXeszA6Q+yFh+Zwcw1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rrt8gaI7n68uuJ8T7r0ibBUBWFh69EooxR7nUvaVIiMOU1Mm3XJzsF4qp64Rf3HvN2sF9QV53puBXtbdYYmiYAWzV55Rr0oXvzkpH5J6lPXoF5rD5APfekB7LtiiMRHNYeKVkKm4hXLw4vVJZoVfF8DMa0TOjloADYZJ2fU1o5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XoDubxg9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF41C4CEEA;
	Wed, 19 Mar 2025 09:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376661;
	bh=nXAYpC2swsn1QDFpjOFNZQf9gXeszA6Q+yFh+Zwcw1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XoDubxg92DFVlrdEmnpI3FQNYON2UgXmQTy/TYSFx5gLOXZVwU6o5jhRFvz5YSOKf
	 MrEzLk4cdWxNM/Y9hviJAOFeJDgZ7iVCd/nXSWrRA06p9MHcNORzIVV+i2dLJUu1df
	 gOCw3n0UYghBk3/t5B5GhFEQxMbzVQxrsQtaWwPaxPmnM1jOds0pmBMDjQz+Hfjbcs
	 9uzCIzEedNjCelPf1IDczHXismnwfJwPLIIT78G/lIYzK9PHY0r3EVk9EovMdRWV8H
	 Jo4LEs/lhSiQWhnnJj2FYn2kgw26uEeRagozTQff9EC2QRJ8pVfX0FDSIJXZkb00Dk
	 Sx6/TIdSy/pJg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Sven Peter <sven@svenpeter.dev>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 06/57] irqdomain: irqchip: Switch to of_fwnode_handle()
Date: Wed, 19 Mar 2025 10:28:59 +0100
Message-ID: <20250319092951.37667-7-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_node_to_fwnode() is irqdomain's reimplementation of the "officially"
defined of_fwnode_handle(). The former is in the process of being
removed, so use the latter instead.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Antoine Tenart <atenart@kernel.org>
Cc: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Herve Codina <herve.codina@bootlin.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: asahi@lists.linux.dev
Cc: loongarch@lists.linux.dev
Cc: linux-mips@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/irqchip/irq-alpine-msi.c            | 2 +-
 drivers/irqchip/irq-apple-aic.c             | 4 ++--
 drivers/irqchip/irq-armada-370-xp.c         | 4 ++--
 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c | 2 +-
 drivers/irqchip/irq-gic-v3.c                | 4 ++--
 drivers/irqchip/irq-ixp4xx.c                | 2 +-
 drivers/irqchip/irq-lan966x-oic.c           | 2 +-
 drivers/irqchip/irq-loongarch-cpu.c         | 2 +-
 drivers/irqchip/irq-loongson-eiointc.c      | 2 +-
 drivers/irqchip/irq-loongson-htvec.c        | 2 +-
 drivers/irqchip/irq-loongson-liointc.c      | 2 +-
 drivers/irqchip/irq-loongson-pch-msi.c      | 2 +-
 drivers/irqchip/irq-loongson-pch-pic.c      | 2 +-
 drivers/irqchip/irq-ls-scfg-msi.c           | 2 +-
 drivers/irqchip/irq-meson-gpio.c            | 2 +-
 drivers/irqchip/irq-mvebu-gicp.c            | 2 +-
 drivers/irqchip/irq-mvebu-odmi.c            | 2 +-
 drivers/irqchip/irq-mvebu-sei.c             | 6 +++---
 drivers/irqchip/irq-qcom-mpm.c              | 2 +-
 drivers/irqchip/irq-riscv-intc.c            | 2 +-
 drivers/irqchip/irq-sni-exiu.c              | 2 +-
 drivers/irqchip/irq-stm32mp-exti.c          | 2 +-
 drivers/irqchip/irq-ti-sci-inta.c           | 4 ++--
 drivers/irqchip/irq-ti-sci-intr.c           | 2 +-
 drivers/irqchip/irq-uniphier-aidet.c        | 2 +-
 25 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index a1430ab60a8a..0207d35135da 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -213,7 +213,7 @@ static int alpine_msix_init_domains(struct alpine_msix_data *priv,
 		return -ENOMEM;
 	}
 
-	msi_domain = pci_msi_create_irq_domain(of_node_to_fwnode(node),
+	msi_domain = pci_msi_create_irq_domain(of_fwnode_handle(node),
 					       &alpine_msix_domain_info,
 					       middle_domain);
 	if (!msi_domain) {
diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index 974dc088c853..032d66dceb8e 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -1014,7 +1014,7 @@ static int __init aic_of_ic_init(struct device_node *node, struct device_node *p
 
 	irqc->info.die_stride = off - start_off;
 
-	irqc->hw_domain = irq_domain_create_tree(of_node_to_fwnode(node),
+	irqc->hw_domain = irq_domain_create_tree(of_fwnode_handle(node),
 						 &aic_irq_domain_ops, irqc);
 	if (WARN_ON(!irqc->hw_domain))
 		goto err_unmap;
@@ -1067,7 +1067,7 @@ static int __init aic_of_ic_init(struct device_node *node, struct device_node *p
 
 	if (is_kernel_in_hyp_mode()) {
 		struct irq_fwspec mi = {
-			.fwnode		= of_node_to_fwnode(node),
+			.fwnode		= of_fwnode_handle(node),
 			.param_count	= 3,
 			.param		= {
 				[0]	= AIC_FIQ, /* This is a lie */
diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
index 2aa6a51e05d0..de98d16c1718 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -353,7 +353,7 @@ static int __init mpic_msi_init(struct mpic *mpic, struct device_node *node,
 	if (!mpic->msi_inner_domain)
 		return -ENOMEM;
 
-	mpic->msi_domain = pci_msi_create_irq_domain(of_node_to_fwnode(node), &mpic_msi_domain_info,
+	mpic->msi_domain = pci_msi_create_irq_domain(of_fwnode_handle(node), &mpic_msi_domain_info,
 						     mpic->msi_inner_domain);
 	if (!mpic->msi_domain) {
 		irq_domain_remove(mpic->msi_inner_domain);
@@ -492,7 +492,7 @@ static int __init mpic_ipi_init(struct mpic *mpic, struct device_node *node)
 {
 	int base_ipi;
 
-	mpic->ipi_domain = irq_domain_create_linear(of_node_to_fwnode(node), IPI_DOORBELL_NR,
+	mpic->ipi_domain = irq_domain_create_linear(of_fwnode_handle(node), IPI_DOORBELL_NR,
 						    &mpic_ipi_domain_ops, mpic);
 	if (WARN_ON(!mpic->ipi_domain))
 		return -ENOMEM;
diff --git a/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c b/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
index 8e87fc35f8aa..11549d85f23b 100644
--- a/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
+++ b/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
@@ -152,7 +152,7 @@ static void __init its_fsl_mc_of_msi_init(void)
 		if (!of_property_read_bool(np, "msi-controller"))
 			continue;
 
-		its_fsl_mc_msi_init_one(of_node_to_fwnode(np),
+		its_fsl_mc_msi_init_one(of_fwnode_handle(np),
 					np->full_name);
 	}
 }
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 270d7a4d85a6..efc791c43d44 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1826,7 +1826,7 @@ static int partition_domain_translate(struct irq_domain *d,
 
 	ppi_idx = __gic_get_ppi_index(ppi_intid);
 	ret = partition_translate_id(gic_data.ppi_descs[ppi_idx],
-				     of_node_to_fwnode(np));
+				     of_fwnode_handle(np));
 	if (ret < 0)
 		return ret;
 
@@ -2192,7 +2192,7 @@ static void __init gic_populate_ppi_partitions(struct device_node *gic_node)
 
 		part = &parts[part_idx];
 
-		part->partition_id = of_node_to_fwnode(child_part);
+		part->partition_id = of_fwnode_handle(child_part);
 
 		pr_info("GIC: PPI partition %pOFn[%d] { ",
 			child_part, part_idx);
diff --git a/drivers/irqchip/irq-ixp4xx.c b/drivers/irqchip/irq-ixp4xx.c
index f23b02f62a5c..a9a5a52b818a 100644
--- a/drivers/irqchip/irq-ixp4xx.c
+++ b/drivers/irqchip/irq-ixp4xx.c
@@ -261,7 +261,7 @@ static int __init ixp4xx_of_init_irq(struct device_node *np,
 		pr_crit("IXP4XX: could not ioremap interrupt controller\n");
 		return -ENODEV;
 	}
-	fwnode = of_node_to_fwnode(np);
+	fwnode = of_fwnode_handle(np);
 
 	/* These chip variants have 64 interrupts */
 	is_356 = of_device_is_compatible(np, "intel,ixp43x-interrupt") ||
diff --git a/drivers/irqchip/irq-lan966x-oic.c b/drivers/irqchip/irq-lan966x-oic.c
index 41ac880e3b87..9445c3a6b1b0 100644
--- a/drivers/irqchip/irq-lan966x-oic.c
+++ b/drivers/irqchip/irq-lan966x-oic.c
@@ -224,7 +224,7 @@ static int lan966x_oic_probe(struct platform_device *pdev)
 		.exit		= lan966x_oic_chip_exit,
 	};
 	struct irq_domain_info d_info = {
-		.fwnode		= of_node_to_fwnode(pdev->dev.of_node),
+		.fwnode		= of_fwnode_handle(pdev->dev.of_node),
 		.domain_flags	= IRQ_DOMAIN_FLAG_DESTROY_GC,
 		.size		= LAN966X_OIC_NR_IRQ,
 		.hwirq_max	= LAN966X_OIC_NR_IRQ,
diff --git a/drivers/irqchip/irq-loongarch-cpu.c b/drivers/irqchip/irq-loongarch-cpu.c
index e62dab4c97fc..950bc087e388 100644
--- a/drivers/irqchip/irq-loongarch-cpu.c
+++ b/drivers/irqchip/irq-loongarch-cpu.c
@@ -100,7 +100,7 @@ static const struct irq_domain_ops loongarch_cpu_intc_irq_domain_ops = {
 static int __init cpuintc_of_init(struct device_node *of_node,
 				struct device_node *parent)
 {
-	cpuintc_handle = of_node_to_fwnode(of_node);
+	cpuintc_handle = of_fwnode_handle(of_node);
 
 	irq_domain = irq_domain_create_linear(cpuintc_handle, EXCCODE_INT_NUM,
 				&loongarch_cpu_intc_irq_domain_ops, NULL);
diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index bb79e19dfb59..b2860eb2d32c 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -554,7 +554,7 @@ static int __init eiointc_of_init(struct device_node *of_node,
 		priv->vec_count = VEC_COUNT;
 
 	priv->node = 0;
-	priv->domain_handle = of_node_to_fwnode(of_node);
+	priv->domain_handle = of_fwnode_handle(of_node);
 
 	ret = eiointc_init(priv, parent_irq, 0);
 	if (ret < 0)
diff --git a/drivers/irqchip/irq-loongson-htvec.c b/drivers/irqchip/irq-loongson-htvec.c
index 5da02c7ad0b3..d8558eb35044 100644
--- a/drivers/irqchip/irq-loongson-htvec.c
+++ b/drivers/irqchip/irq-loongson-htvec.c
@@ -248,7 +248,7 @@ static int htvec_of_init(struct device_node *node,
 	}
 
 	err = htvec_init(res.start, resource_size(&res),
-			num_parents, parent_irq, of_node_to_fwnode(node));
+			num_parents, parent_irq, of_fwnode_handle(node));
 	if (err < 0)
 		return err;
 
diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
index 2b1bd4a96665..95cade56e0be 100644
--- a/drivers/irqchip/irq-loongson-liointc.c
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -363,7 +363,7 @@ static int __init liointc_of_init(struct device_node *node,
 	}
 
 	err = liointc_init(res.start, resource_size(&res),
-			revision, of_node_to_fwnode(node), node);
+			revision, of_fwnode_handle(node), node);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/irqchip/irq-loongson-pch-msi.c b/drivers/irqchip/irq-loongson-pch-msi.c
index 9c62108b3ad5..c07876ae7b49 100644
--- a/drivers/irqchip/irq-loongson-pch-msi.c
+++ b/drivers/irqchip/irq-loongson-pch-msi.c
@@ -243,7 +243,7 @@ static int pch_msi_of_init(struct device_node *node, struct device_node *parent)
 		return -EINVAL;
 	}
 
-	err = pch_msi_init(res.start, irq_base, irq_count, parent_domain, of_node_to_fwnode(node));
+	err = pch_msi_init(res.start, irq_base, irq_count, parent_domain, of_fwnode_handle(node));
 	if (err < 0)
 		return err;
 
diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loongson-pch-pic.c
index 69efda35a8e7..62e6bf3a0611 100644
--- a/drivers/irqchip/irq-loongson-pch-pic.c
+++ b/drivers/irqchip/irq-loongson-pch-pic.c
@@ -392,7 +392,7 @@ static int pch_pic_of_init(struct device_node *node,
 	}
 
 	err = pch_pic_init(res.start, resource_size(&res), vec_base,
-				parent_domain, of_node_to_fwnode(node), 0);
+				parent_domain, of_fwnode_handle(node), 0);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/irqchip/irq-ls-scfg-msi.c b/drivers/irqchip/irq-ls-scfg-msi.c
index 3cb80796cc7c..cbe11a8afe4f 100644
--- a/drivers/irqchip/irq-ls-scfg-msi.c
+++ b/drivers/irqchip/irq-ls-scfg-msi.c
@@ -225,7 +225,7 @@ static int ls_scfg_msi_domains_init(struct ls_scfg_msi *msi_data)
 	}
 
 	msi_data->msi_domain = pci_msi_create_irq_domain(
-				of_node_to_fwnode(msi_data->pdev->dev.of_node),
+				of_fwnode_handle(msi_data->pdev->dev.of_node),
 				&ls_scfg_msi_domain_info,
 				msi_data->parent);
 	if (!msi_data->msi_domain) {
diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index 0a25536a5d07..7d177626d64b 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -607,7 +607,7 @@ static int meson_gpio_irq_of_init(struct device_node *node, struct device_node *
 
 	domain = irq_domain_create_hierarchy(parent_domain, 0,
 					     ctl->params->nr_hwirq,
-					     of_node_to_fwnode(node),
+					     of_fwnode_handle(node),
 					     &meson_gpio_irq_domain_ops,
 					     ctl);
 	if (!domain) {
diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-gicp.c
index d67f93f6d750..521cc265c05e 100644
--- a/drivers/irqchip/irq-mvebu-gicp.c
+++ b/drivers/irqchip/irq-mvebu-gicp.c
@@ -232,7 +232,7 @@ static int mvebu_gicp_probe(struct platform_device *pdev)
 
 	inner_domain = irq_domain_create_hierarchy(parent_domain, 0,
 						   gicp->spi_cnt,
-						   of_node_to_fwnode(node),
+						   of_fwnode_handle(node),
 						   &gicp_domain_ops, gicp);
 	if (!inner_domain)
 		return -ENOMEM;
diff --git a/drivers/irqchip/irq-mvebu-odmi.c b/drivers/irqchip/irq-mvebu-odmi.c
index 28f7e81df94f..c1fcd4525e3b 100644
--- a/drivers/irqchip/irq-mvebu-odmi.c
+++ b/drivers/irqchip/irq-mvebu-odmi.c
@@ -207,7 +207,7 @@ static int __init mvebu_odmi_init(struct device_node *node,
 
 	inner_domain = irq_domain_create_hierarchy(parent_domain, 0,
 						   odmis_count * NODMIS_PER_FRAME,
-						   of_node_to_fwnode(node),
+						   of_fwnode_handle(node),
 						   &odmi_domain_ops, NULL);
 	if (!inner_domain) {
 		ret = -ENOMEM;
diff --git a/drivers/irqchip/irq-mvebu-sei.c b/drivers/irqchip/irq-mvebu-sei.c
index ebd4a9014e8d..5030fcecdcc3 100644
--- a/drivers/irqchip/irq-mvebu-sei.c
+++ b/drivers/irqchip/irq-mvebu-sei.c
@@ -402,7 +402,7 @@ static int mvebu_sei_probe(struct platform_device *pdev)
 	}
 
 	/* Create the root SEI domain */
-	sei->sei_domain = irq_domain_create_linear(of_node_to_fwnode(node),
+	sei->sei_domain = irq_domain_create_linear(of_fwnode_handle(node),
 						   (sei->caps->ap_range.size +
 						    sei->caps->cp_range.size),
 						   &mvebu_sei_domain_ops,
@@ -418,7 +418,7 @@ static int mvebu_sei_probe(struct platform_device *pdev)
 	/* Create the 'wired' domain */
 	sei->ap_domain = irq_domain_create_hierarchy(sei->sei_domain, 0,
 						     sei->caps->ap_range.size,
-						     of_node_to_fwnode(node),
+						     of_fwnode_handle(node),
 						     &mvebu_sei_ap_domain_ops,
 						     sei);
 	if (!sei->ap_domain) {
@@ -432,7 +432,7 @@ static int mvebu_sei_probe(struct platform_device *pdev)
 	/* Create the 'MSI' domain */
 	sei->cp_domain = irq_domain_create_hierarchy(sei->sei_domain, 0,
 						     sei->caps->cp_range.size,
-						     of_node_to_fwnode(node),
+						     of_fwnode_handle(node),
 						     &mvebu_sei_cp_domain_ops,
 						     sei);
 	if (!sei->cp_domain) {
diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 7942d8eb3d00..00c770e367d0 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -447,7 +447,7 @@ static int qcom_mpm_init(struct device_node *np, struct device_node *parent)
 
 	priv->domain = irq_domain_create_hierarchy(parent_domain,
 				IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP, pin_cnt,
-				of_node_to_fwnode(np), &qcom_mpm_ops, priv);
+				of_fwnode_handle(np), &qcom_mpm_ops, priv);
 	if (!priv->domain) {
 		dev_err(dev, "failed to create MPM domain\n");
 		ret = -ENOMEM;
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index f653c13de62b..e5805885394e 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -242,7 +242,7 @@ static int __init riscv_intc_init(struct device_node *node,
 		chip = &andes_intc_chip;
 	}
 
-	return riscv_intc_init_common(of_node_to_fwnode(node), chip);
+	return riscv_intc_init_common(of_fwnode_handle(node), chip);
 }
 
 IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
diff --git a/drivers/irqchip/irq-sni-exiu.c b/drivers/irqchip/irq-sni-exiu.c
index c7db617e1a2f..7d10bf6e5824 100644
--- a/drivers/irqchip/irq-sni-exiu.c
+++ b/drivers/irqchip/irq-sni-exiu.c
@@ -249,7 +249,7 @@ static int __init exiu_dt_init(struct device_node *node,
 		return -ENXIO;
 	}
 
-	data = exiu_init(of_node_to_fwnode(node), &res);
+	data = exiu_init(of_fwnode_handle(node), &res);
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-stm32mp-exti.c
index cb83d6cc6113..649b84f12efc 100644
--- a/drivers/irqchip/irq-stm32mp-exti.c
+++ b/drivers/irqchip/irq-stm32mp-exti.c
@@ -531,7 +531,7 @@ static int stm32mp_exti_domain_alloc(struct irq_domain *dm,
 		if (ret)
 			return ret;
 		/* we only support one parent, so far */
-		if (of_node_to_fwnode(out_irq.np) != dm->parent->fwnode)
+		if (of_fwnode_handle(out_irq.np) != dm->parent->fwnode)
 			return -EINVAL;
 
 		of_phandle_args_to_fwspec(out_irq.np, out_irq.args,
diff --git a/drivers/irqchip/irq-ti-sci-inta.c b/drivers/irqchip/irq-ti-sci-inta.c
index a887efba262c..38dfc1f9a56b 100644
--- a/drivers/irqchip/irq-ti-sci-inta.c
+++ b/drivers/irqchip/irq-ti-sci-inta.c
@@ -233,7 +233,7 @@ static struct ti_sci_inta_vint_desc *ti_sci_inta_alloc_parent_irq(struct irq_dom
 	INIT_LIST_HEAD(&vint_desc->list);
 
 	parent_node = of_irq_find_parent(dev_of_node(&inta->pdev->dev));
-	parent_fwspec.fwnode = of_node_to_fwnode(parent_node);
+	parent_fwspec.fwnode = of_fwnode_handle(parent_node);
 
 	if (of_device_is_compatible(parent_node, "arm,gic-v3")) {
 		/* Parent is GIC */
@@ -709,7 +709,7 @@ static int ti_sci_inta_irq_domain_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	msi_domain = ti_sci_inta_msi_create_irq_domain(of_node_to_fwnode(node),
+	msi_domain = ti_sci_inta_msi_create_irq_domain(of_fwnode_handle(node),
 						&ti_sci_inta_msi_domain_info,
 						domain);
 	if (!msi_domain) {
diff --git a/drivers/irqchip/irq-ti-sci-intr.c b/drivers/irqchip/irq-ti-sci-intr.c
index b49a73106c69..686a8f69fd9c 100644
--- a/drivers/irqchip/irq-ti-sci-intr.c
+++ b/drivers/irqchip/irq-ti-sci-intr.c
@@ -149,7 +149,7 @@ static int ti_sci_intr_alloc_parent_irq(struct irq_domain *domain,
 		goto err_irqs;
 
 	parent_node = of_irq_find_parent(dev_of_node(intr->dev));
-	fwspec.fwnode = of_node_to_fwnode(parent_node);
+	fwspec.fwnode = of_fwnode_handle(parent_node);
 
 	if (of_device_is_compatible(parent_node, "arm,gic-v3")) {
 		/* Parent is GIC */
diff --git a/drivers/irqchip/irq-uniphier-aidet.c b/drivers/irqchip/irq-uniphier-aidet.c
index 601f9343d5b3..6005c2d28dd9 100644
--- a/drivers/irqchip/irq-uniphier-aidet.c
+++ b/drivers/irqchip/irq-uniphier-aidet.c
@@ -188,7 +188,7 @@ static int uniphier_aidet_probe(struct platform_device *pdev)
 	priv->domain = irq_domain_create_hierarchy(
 					parent_domain, 0,
 					UNIPHIER_AIDET_NR_IRQS,
-					of_node_to_fwnode(dev->of_node),
+					of_fwnode_handle(dev->of_node),
 					&uniphier_aidet_domain_ops, priv);
 	if (!priv->domain)
 		return -ENOMEM;
-- 
2.49.0


