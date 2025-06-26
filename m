Return-Path: <linux-mips+bounces-9511-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E2EAEA1EB
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 17:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31FB41885D9F
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 14:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE1C2FC01B;
	Thu, 26 Jun 2025 14:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0L9sJ+J0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sbfSD0BW"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D929F2FA64C;
	Thu, 26 Jun 2025 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949382; cv=none; b=WWBgouxhPBDmJqshfoPoXpN9iUGFiP7YilylhSmyY9S+pS61bzsCa0QxKdiIeW4T8NciWdHp9/DMid7MWvZkvmF2+WAQ4vyEjzYZcdW33uzvrE5Ds98BsJ2VqzP39VnjxgDOLD1QYvGacAzBhcMX5gTO7tnuXLVsq9QtPINrahc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949382; c=relaxed/simple;
	bh=9xXqq0SCQaMFFktlcV5I8nGAVPisuSnGVPUtO60bpbk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hVHUC4ds79l00shn455PQbjYjT//MFjXILk5AdsjS8wuo+4drKw2SE8hxNFOdxN/tX5pVT/zEyu0jijIbKdG0xvm8bPDsvTluquJNijw+fl9TDGVI5isGPIj2E/DnpVp3h+C3luSj3qwZQxmT3GFwVoMNGc4jUyIQbySepuoDAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0L9sJ+J0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sbfSD0BW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/srjJS8SpdA7rae21v1b2OCu0wY7FvRZqCovg9jsm+4=;
	b=0L9sJ+J0lGMHXi9sXXwJ6qVdupzww1GZ/fr8SasVb+ZcNdO1UiV303eM9JPEyD5GF+PGwn
	BXMJT6cl+FxmcwI4VhiSONWCOz0v2Y7IzOYSGlwhKdw/GliGm3UzFlyKnwKe1OW+tMsHHw
	RfI2PWuxS0CIWu2x6OIpoTCqrZMmsi1XdcQ+TSfRCRx4GhZQleagG6TIDmb8sV6LAwBjuG
	sprTujt2C50JqstWLsakWZZh2ZUUdZVSeAf7b+KR//LnVfluLpfXjnZh/4v2bYWXSE+eH3
	hHMdfDRHdJj3nUPd5iRQ3X+ZGiUQczxjPZyprFi4YddPk5fNejsxrlo28b/kQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/srjJS8SpdA7rae21v1b2OCu0wY7FvRZqCovg9jsm+4=;
	b=sbfSD0BWvrAgRhBcegRlcQqgCXdpvvHxqZy65JoSiK8oLqw2C8NkyA+pbt0BNkqMlkxEAj
	mct9Qnkaw/gXlwBQ==
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
Subject: [PATCH 11/12] irqchip/armada-370-xp: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:49:08 +0200
Message-Id: <976892e3ce64fcf52387833abee08ddfa47d2a82.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Move away from the legacy MSI domain setup, switch to use
msi_create_parent_irq_domain().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/irqchip/Kconfig             |  1 +
 drivers/irqchip/irq-armada-370-xp.c | 48 +++++++++++++++--------------
 2 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index dbdb988e4f7e0..afd7bae30a788 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -79,6 +79,7 @@ config ARMADA_370_XP_IRQ
 	bool
 	select GENERIC_IRQ_CHIP
 	select PCI_MSI if PCI
+	select IRQ_MSI_LIB if PCI
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
=20
 config ALPINE_MSI
diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-arma=
da-370-xp.c
index 67b672a788626..a44c49e985b75 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -20,6 +20,7 @@
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/cpu.h>
 #include <linux/io.h>
 #include <linux/of_address.h>
@@ -156,7 +157,6 @@
  * @parent_irq:		parent IRQ if MPIC is not top-level interrupt controller
  * @domain:		MPIC main interrupt domain
  * @ipi_domain:		IPI domain
- * @msi_domain:		MSI domain
  * @msi_inner_domain:	MSI inner domain
  * @msi_used:		bitmap of used MSI numbers
  * @msi_lock:		mutex serializing access to @msi_used
@@ -176,7 +176,6 @@ struct mpic {
 	struct irq_domain *ipi_domain;
 #endif
 #ifdef CONFIG_PCI_MSI
-	struct irq_domain *msi_domain;
 	struct irq_domain *msi_inner_domain;
 	DECLARE_BITMAP(msi_used, PCI_MSI_FULL_DOORBELL_NR);
 	struct mutex msi_lock;
@@ -234,18 +233,6 @@ static void mpic_irq_unmask(struct irq_data *d)
=20
 #ifdef CONFIG_PCI_MSI
=20
-static struct irq_chip mpic_msi_irq_chip =3D {
-	.name		=3D "MPIC MSI",
-	.irq_mask	=3D pci_msi_mask_irq,
-	.irq_unmask	=3D pci_msi_unmask_irq,
-};
-
-static struct msi_domain_info mpic_msi_domain_info =3D {
-	.flags	=3D (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		   MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX),
-	.chip	=3D &mpic_msi_irq_chip,
-};
-
 static void mpic_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
 {
 	unsigned int cpu =3D cpumask_first(irq_data_get_effective_affinity_mask(d=
));
@@ -314,6 +301,7 @@ static void mpic_msi_free(struct irq_domain *domain, un=
signed int virq, unsigned
 }
=20
 static const struct irq_domain_ops mpic_msi_domain_ops =3D {
+	.select	=3D msi_lib_irq_domain_select,
 	.alloc	=3D mpic_msi_alloc,
 	.free	=3D mpic_msi_free,
 };
@@ -331,6 +319,21 @@ static void mpic_msi_reenable_percpu(struct mpic *mpic)
 	writel(1, mpic->per_cpu + MPIC_INT_CLEAR_MASK);
 }
=20
+#define MPIC_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS | \
+				 MSI_FLAG_USE_DEF_CHIP_OPS)
+#define MPIC_MSI_FLAGS_SUPPORTED (MSI_FLAG_MULTI_PCI_MSI  | \
+				  MSI_FLAG_PCI_MSIX       | \
+				  MSI_GENERIC_FLAGS_MASK)
+
+static const struct msi_parent_ops mpic_msi_parent_ops =3D {
+	.required_flags		=3D MPIC_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D MPIC_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	=3D DOMAIN_BUS_NEXUS,
+	.bus_select_mask	=3D MATCH_PCI_MSI,
+	.prefix			=3D "MPIC-",
+	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
+};
+
 static int __init mpic_msi_init(struct mpic *mpic, struct device_node *nod=
e,
 				phys_addr_t main_int_phys_base)
 {
@@ -348,17 +351,16 @@ static int __init mpic_msi_init(struct mpic *mpic, st=
ruct device_node *node,
 		mpic->msi_doorbell_mask =3D PCI_MSI_FULL_DOORBELL_MASK;
 	}
=20
-	mpic->msi_inner_domain =3D irq_domain_create_linear(NULL, mpic->msi_doorb=
ell_size,
-						       &mpic_msi_domain_ops, mpic);
-	if (!mpic->msi_inner_domain)
-		return -ENOMEM;
+	struct irq_domain_info info =3D {
+		.fwnode		=3D of_fwnode_handle(node),
+		.ops		=3D &mpic_msi_domain_ops,
+		.host_data	=3D mpic,
+		.size		=3D mpic->msi_doorbell_size,
+	};
=20
-	mpic->msi_domain =3D pci_msi_create_irq_domain(of_fwnode_handle(node), &m=
pic_msi_domain_info,
-						     mpic->msi_inner_domain);
-	if (!mpic->msi_domain) {
-		irq_domain_remove(mpic->msi_inner_domain);
+	mpic->msi_inner_domain =3D msi_create_parent_irq_domain(&info, &mpic_msi_=
parent_ops);
+	if (!mpic->msi_inner_domain)
 		return -ENOMEM;
-	}
=20
 	mpic_msi_reenable_percpu(mpic);
=20
--=20
2.39.5


