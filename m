Return-Path: <linux-mips+bounces-9510-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEA4AEA1CD
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 17:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA2283B055F
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 14:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7412B2FBFE2;
	Thu, 26 Jun 2025 14:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CMq1Gxr5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VrtZi3tD"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA522FA621;
	Thu, 26 Jun 2025 14:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949381; cv=none; b=ZeTmHYNRABpvWEr9wlQ4I/n3An6Lw0caK+M7gjKvoxqWzyoHL3APohl5ptCeqB8lfVtItGSQzzSIK6YV4CsJqgz+/QiPm+5ZDQazawgmX/EcqOc2jnSLM4pzLTqb66d3IBi+tDQS6lD32jj+1GzVOlcKvHcfCW7NEZ1nB2FW4ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949381; c=relaxed/simple;
	bh=SZ2njfr0p2LP4U6s4/kpLpooqtZmqtk4nmYeoXC6kgc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s2UQAIGUSpFyFG+of/nJqO8c94ZCFkn/A74wEDlQQnBnU6+suNAdJr7Zf1YvIP38eEDZlaAJ3nlQ7cDDrjGWF673fg0grPWA/3rZTLRQz/WABpZSp6Ua7+wtbFU1HClJHI1oM70r0U9t7iLPKpUUN4CvLmnwpRFFr7xyJ19XdrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CMq1Gxr5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VrtZi3tD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=efayX2kB19e/5fOKxvWIg5Uzbqjfs8VRJ75B0fwk9Gc=;
	b=CMq1Gxr5Pm9ZIdl+tCHNTj5Y8eDMa6aOMVaWCiah6HMWHVkoqypyaI4kBj2TVhLyHSJZJ8
	rKbbdzqWUe7rZAp/7qUj+Jv/rLXVqIlsbVD6O6fHnDVWdnkzaHTSXkHx0HptmbhvX+UrSY
	Eo4QmPYp0rwnRTMNenqkwXydEI2sAZIX6Jpn9BPXlgrQ9I/dY55qI/JI20zV9LYbDM/GPS
	tYhU5DmSC0blfhgyHAnJ5ZqIHdkkSsRtVxOTf1tilTSj5RD9uvTWZJqTJifnR8tB/uyNPw
	oSljTW5mHY1cR5EhI2gPmp5rSyGOMKpnSnlAfCuN2CxIN02tVhPHMsfhEXv0qg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=efayX2kB19e/5fOKxvWIg5Uzbqjfs8VRJ75B0fwk9Gc=;
	b=VrtZi3tDzFyI/vKrmM8P7d4h4FoLDKNKc8U1MNdg/bMGAjgPWvWTnKevlK7Ag39wgLEQGj
	lCAnFdnQjLWGZNBA==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Antoine Tenart <atenart@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 10/12] irqchip/alpine-msi: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:49:07 +0200
Message-Id: <ec08fea004e7c3aa18c3f5657a8cafeb1adfcc1d.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Thomas Gleixner <tglx@linutronix.de>

Move away from the legacy MSI domain setup, switch to use
msi_create_parent_irq_domain().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/irqchip/Kconfig          |  1 +
 drivers/irqchip/irq-alpine-msi.c | 69 +++++++++++++-------------------
 2 files changed, 28 insertions(+), 42 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 0d196e4471426..dbdb988e4f7e0 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -85,6 +85,7 @@ config ALPINE_MSI
 	bool
 	depends on PCI
 	select PCI_MSI
+	select IRQ_MSI_LIB
 	select GENERIC_IRQ_CHIP
=20
 config AL_FIC
diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-=
msi.c
index 43d6db290138a..159d9ec7c0ddc 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -14,6 +14,7 @@
=20
 #include <linux/irqchip.h>
 #include <linux/irqchip/arm-gic.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/msi.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -36,26 +37,6 @@ struct alpine_msix_data {
 	unsigned long	*msi_map;
 };
=20
-static void alpine_msix_mask_msi_irq(struct irq_data *d)
-{
-	pci_msi_mask_irq(d);
-	irq_chip_mask_parent(d);
-}
-
-static void alpine_msix_unmask_msi_irq(struct irq_data *d)
-{
-	pci_msi_unmask_irq(d);
-	irq_chip_unmask_parent(d);
-}
-
-static struct irq_chip alpine_msix_irq_chip =3D {
-	.name			=3D "MSIx",
-	.irq_mask		=3D alpine_msix_mask_msi_irq,
-	.irq_unmask		=3D alpine_msix_unmask_msi_irq,
-	.irq_eoi		=3D irq_chip_eoi_parent,
-	.irq_set_affinity	=3D irq_chip_set_affinity_parent,
-};
-
 static int alpine_msix_allocate_sgi(struct alpine_msix_data *priv, int num=
_req)
 {
 	int first;
@@ -88,12 +69,6 @@ static void alpine_msix_compose_msi_msg(struct irq_data =
*data, struct msi_msg *m
 	msg->data =3D 0;
 }
=20
-static struct msi_domain_info alpine_msix_domain_info =3D {
-	.flags	=3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_PCI_MSIX,
-	.chip	=3D &alpine_msix_irq_chip,
-};
-
 static struct irq_chip middle_irq_chip =3D {
 	.name			=3D "alpine_msix_middle",
 	.irq_mask		=3D irq_chip_mask_parent,
@@ -164,13 +139,35 @@ static void alpine_msix_middle_domain_free(struct irq=
_domain *domain, unsigned i
 }
=20
 static const struct irq_domain_ops alpine_msix_middle_domain_ops =3D {
+	.select	=3D msi_lib_irq_domain_select,
 	.alloc	=3D alpine_msix_middle_domain_alloc,
 	.free	=3D alpine_msix_middle_domain_free,
 };
=20
+#define ALPINE_MSI_FLAGS_REQUIRED  (MSI_FLAG_USE_DEF_DOM_OPS |		\
+				    MSI_FLAG_USE_DEF_CHIP_OPS |		\
+				    MSI_FLAG_PCI_MSI_MASK_PARENT)
+
+#define ALPINE_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK |		\
+				    MSI_FLAG_PCI_MSIX)
+
+static struct msi_parent_ops alpine_msi_parent_ops =3D {
+	.supported_flags	=3D ALPINE_MSI_FLAGS_SUPPORTED,
+	.required_flags		=3D ALPINE_MSI_FLAGS_REQUIRED,
+	.chip_flags		=3D MSI_CHIP_FLAG_SET_EOI,
+	.bus_select_token	=3D DOMAIN_BUS_NEXUS,
+	.bus_select_mask	=3D MATCH_PCI_MSI,
+	.prefix			=3D "ALPINE-",
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
+};
+
 static int alpine_msix_init_domains(struct alpine_msix_data *priv, struct =
device_node *node)
 {
-	struct irq_domain *middle_domain, *msi_domain, *gic_domain;
+	struct irq_domain_info info =3D {
+		.fwnode		=3D of_fwnode_handle(node),
+		.ops		=3D &alpine_msix_middle_domain_ops,
+		.host_data	=3D priv,
+	};
 	struct device_node *gic_node;
=20
 	gic_node =3D of_irq_find_parent(node);
@@ -179,29 +176,17 @@ static int alpine_msix_init_domains(struct alpine_msi=
x_data *priv, struct device
 		return -ENODEV;
 	}
=20
-	gic_domain =3D irq_find_host(gic_node);
+	info.parent =3D irq_find_host(gic_node);
 	of_node_put(gic_node);
-	if (!gic_domain) {
+	if (!info.parent) {
 		pr_err("Failed to find the GIC domain\n");
 		return -ENXIO;
 	}
=20
-	middle_domain =3D irq_domain_create_hierarchy(gic_domain, 0, 0, NULL,
-						    &alpine_msix_middle_domain_ops, priv);
-	if (!middle_domain) {
-		pr_err("Failed to create the MSIX middle domain\n");
-		return -ENOMEM;
-	}
-
-	msi_domain =3D pci_msi_create_irq_domain(of_fwnode_handle(node),
-					       &alpine_msix_domain_info,
-					       middle_domain);
-	if (!msi_domain) {
+	if (!msi_create_parent_irq_domain(&info, &alpine_msi_parent_ops)) {
 		pr_err("Failed to create MSI domain\n");
-		irq_domain_remove(middle_domain);
 		return -ENOMEM;
 	}
-
 	return 0;
 }
=20
--=20
2.39.5


