Return-Path: <linux-mips+bounces-9507-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39380AEA1A4
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 17:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07F8C16A58A
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 14:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C382F949A;
	Thu, 26 Jun 2025 14:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mknJkKZ3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zh/sN6K5"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF12F546A;
	Thu, 26 Jun 2025 14:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949379; cv=none; b=Ae5x0oec/kUbzs+hFmkV5JVzifjRQFtGEeW+hzMZ6LDBmlEFky8sCnJ8Af0VPiMPRy7SqHvNQnGAX5uouHUBeRFMmuJ0Nur+zFZy5zE9xzipcK0nVlHH9S7iNQzVh2QssHvVVvcsCCINQxB5FrBgBMKm8Tnb+R7Lsu3mTPcwfuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949379; c=relaxed/simple;
	bh=IxxZJ2wFToK0kupYSlOdZAg0mHWGENSw1e3uN8ZAHmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i3LEAqkP9LnQBGFZ1QNdmlLLDYXwnLjTLpPJjBRToR3Fxqp/y5aMOez2Bo1ZEcEdBviZ1ZGwut70QUKJWyPVrGv/qVlm9edHCJaneOChtKNXNBUuwsjYViWAl6O3NaCbYN+BMmXPukZKS8jAI9/uBlFAKUM9j4Z6Rphn5SxJwqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mknJkKZ3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zh/sN6K5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pKzcREMF/JSs7xXlqj/sW2W9jbHL2lsx1h1l0bkVD/k=;
	b=mknJkKZ3dsxzRYSiFcfJAu8ZW0SvTtRoiLXI+AItcOAmWaNPgnHkjQSUezF9K1TXydwAiY
	SperwGoSIVLi++KTIn3bMYSZ2lOnCiBj0Ts3LIrZs2tKAiv+UFGDjfzbYQd1FyQ69rKg0N
	K0cxzDk8398RDbeMhu1rFKyUt3eBaXaI6sP6ghQjlbMq0OYu2KR5U9U86ZXStAKt068mjY
	W7MhZ3WIaBMp8pq7UWxlS/lcdV6R60bVqg4IQIl2WbC790qDBWAAO2F+thAsz8Ui88ZydK
	xALxRwiZe5MoA68JoVqyhBrwozvsxggJsWbA30nfBR4Gqo+9JkGxB3liXIediQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pKzcREMF/JSs7xXlqj/sW2W9jbHL2lsx1h1l0bkVD/k=;
	b=zh/sN6K5PYvw9e+ovearVI0kjX5nowPlZtz10Zu4nVjSVwP16igkDrKBXczXR3H3H4b0LD
	Yo36rnD4pBvjeiAA==
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
Subject: [PATCH 07/12] irqchip/alpine-msi: Clean up whitespace style
Date: Thu, 26 Jun 2025 16:49:04 +0200
Message-Id: <3bbf719fcd974b0f52a832552b986116bdc70203.1750860131.git.namcao@linutronix.de>
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

Tidy up the code style. Whitespace changes only.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/irqchip/irq-alpine-msi.c | 37 +++++++++++---------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-=
msi.c
index a5289dc26dca0..7e379a6985a6a 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -29,11 +29,11 @@
 #define ALPINE_MSIX_SPI_TARGET_CLUSTER0		BIT(16)
=20
 struct alpine_msix_data {
-	spinlock_t msi_map_lock;
-	phys_addr_t addr;
-	u32 spi_first;		/* The SGI number that MSIs start */
-	u32 num_spis;		/* The number of SGIs for MSIs */
-	unsigned long *msi_map;
+	spinlock_t	msi_map_lock;
+	phys_addr_t	addr;
+	u32		spi_first;	/* The SGI number that MSIs start */
+	u32		num_spis;	/* The number of SGIs for MSIs */
+	unsigned long	*msi_map;
 };
=20
 static void alpine_msix_mask_msi_irq(struct irq_data *d)
@@ -76,8 +76,7 @@ static int alpine_msix_allocate_sgi(struct alpine_msix_da=
ta *priv, int num_req)
 	return priv->spi_first + first;
 }
=20
-static void alpine_msix_free_sgi(struct alpine_msix_data *priv, unsigned s=
gi,
-				 int num_req)
+static void alpine_msix_free_sgi(struct alpine_msix_data *priv, unsigned i=
nt sgi, int num_req)
 {
 	int first =3D sgi - priv->spi_first;
=20
@@ -88,14 +87,12 @@ static void alpine_msix_free_sgi(struct alpine_msix_dat=
a *priv, unsigned sgi,
 	spin_unlock(&priv->msi_map_lock);
 }
=20
-static void alpine_msix_compose_msi_msg(struct irq_data *data,
-					struct msi_msg *msg)
+static void alpine_msix_compose_msi_msg(struct irq_data *data, struct msi_=
msg *msg)
 {
 	struct alpine_msix_data *priv =3D irq_data_get_irq_chip_data(data);
 	phys_addr_t msg_addr =3D priv->addr;
=20
 	msg_addr |=3D (data->hwirq << 3);
-
 	msg->address_hi =3D upper_32_bits(msg_addr);
 	msg->address_lo =3D lower_32_bits(msg_addr);
 	msg->data =3D 0;
@@ -116,8 +113,7 @@ static struct irq_chip middle_irq_chip =3D {
 	.irq_compose_msi_msg	=3D alpine_msix_compose_msi_msg,
 };
=20
-static int alpine_msix_gic_domain_alloc(struct irq_domain *domain,
-					unsigned int virq, int sgi)
+static int alpine_msix_gic_domain_alloc(struct irq_domain *domain, unsigne=
d int virq, int sgi)
 {
 	struct irq_fwspec fwspec;
 	struct irq_data *d;
@@ -138,12 +134,10 @@ static int alpine_msix_gic_domain_alloc(struct irq_do=
main *domain,
=20
 	d =3D irq_domain_get_irq_data(domain->parent, virq);
 	d->chip->irq_set_type(d, IRQ_TYPE_EDGE_RISING);
-
 	return 0;
 }
=20
-static int alpine_msix_middle_domain_alloc(struct irq_domain *domain,
-					   unsigned int virq,
+static int alpine_msix_middle_domain_alloc(struct irq_domain *domain, unsi=
gned int virq,
 					   unsigned int nr_irqs, void *args)
 {
 	struct alpine_msix_data *priv =3D domain->host_data;
@@ -161,7 +155,6 @@ static int alpine_msix_middle_domain_alloc(struct irq_d=
omain *domain,
 		irq_domain_set_hwirq_and_chip(domain, virq + i, sgi + i,
 					      &middle_irq_chip, priv);
 	}
-
 	return 0;
=20
 err_sgi:
@@ -170,8 +163,7 @@ static int alpine_msix_middle_domain_alloc(struct irq_d=
omain *domain,
 	return err;
 }
=20
-static void alpine_msix_middle_domain_free(struct irq_domain *domain,
-					   unsigned int virq,
+static void alpine_msix_middle_domain_free(struct irq_domain *domain, unsi=
gned int virq,
 					   unsigned int nr_irqs)
 {
 	struct irq_data *d =3D irq_domain_get_irq_data(domain, virq);
@@ -186,8 +178,7 @@ static const struct irq_domain_ops alpine_msix_middle_d=
omain_ops =3D {
 	.free	=3D alpine_msix_middle_domain_free,
 };
=20
-static int alpine_msix_init_domains(struct alpine_msix_data *priv,
-				    struct device_node *node)
+static int alpine_msix_init_domains(struct alpine_msix_data *priv, struct =
device_node *node)
 {
 	struct irq_domain *middle_domain, *msi_domain, *gic_domain;
 	struct device_node *gic_node;
@@ -224,8 +215,7 @@ static int alpine_msix_init_domains(struct alpine_msix_=
data *priv,
 	return 0;
 }
=20
-static int alpine_msix_init(struct device_node *node,
-			    struct device_node *parent)
+static int alpine_msix_init(struct device_node *node, struct device_node *=
parent)
 {
 	struct alpine_msix_data *priv;
 	struct resource res;
@@ -271,8 +261,7 @@ static int alpine_msix_init(struct device_node *node,
 		goto err_priv;
 	}
=20
-	pr_debug("Registering %d msixs, starting at %d\n",
-		 priv->num_spis, priv->spi_first);
+	pr_debug("Registering %d msixs, starting at %d\n", priv->num_spis, priv->=
spi_first);
=20
 	ret =3D alpine_msix_init_domains(priv, node);
 	if (ret)
--=20
2.39.5


