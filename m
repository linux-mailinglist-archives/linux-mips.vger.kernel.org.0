Return-Path: <linux-mips+bounces-9509-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 047ECAEA1C8
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 17:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72ED66A5B2A
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 14:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC41A2FA644;
	Thu, 26 Jun 2025 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Idsc8a/+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JBEOGIcD"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2342F9498;
	Thu, 26 Jun 2025 14:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949380; cv=none; b=FLM2hNL90+7G8uV6p1YvH0V3pe/7UwqGTfXjuT7MNTsWW0/nAAOXHZpHskJH+ig1DSBQbFXnF/QwRPkroyeP98To8P2azIWLJI2t/dwMNoNzxFo22acQ9QL/y5ukUAbuGaSIqrz6p/V69Te//XmAumURxjo20q2+4Gls06LmgKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949380; c=relaxed/simple;
	bh=ZFlAGtOpezGZLMwLXedEkRGUAwxZFBwzVvo1qs4Vuy4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yy8PNtYikAB2HClvUQlkQdijDz5H/Hi/UlqzHvv6JKCXHd9Gvw0G8OBQz4W7ZOTfhBPoOr61eVGe+JmOdrz9vkpVe3IGQEm+juTqdk+2KxKRQLY+DZKKYh/pudT4GLdgUrfzil0TEMQIwzZoS6T36NVzZbiBHnYT2qj0u0fxx4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Idsc8a/+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JBEOGIcD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2aznJGf1J+nG8uzCfZ1sNahDbmhHRYzTMg4koq1VzA=;
	b=Idsc8a/+lTtARTa2nNQrRNQvokiSlvPFnhxaytrQ1nkjwUGdApgKmyVsjOyhGmvOp4ruxo
	wHOArztVX7uJfBbPcb5uK+/ha9KjEzBrVLjNkwu4ToXBKnDeNVvgtVZ8Jffcp3WCHD51dl
	tyLoQN/tcNmUDMdoQU3HAuCbuIfqzUKHZmtWJodFHRT7kxMZyK/w2cMUg7W6AvnE+ddqoX
	5JplpIQjp7LKjWwfnjsu2LpTon/d3QZLEUXZUD1WroEV9z9Yy82LiFMJ1LklSdz+Pdc8vG
	ZHYAO9xbNSUowGTAn9O4rGFjA7rTnPg3VI26DrrCoifOHT9hriabbgAbyz0+TQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2aznJGf1J+nG8uzCfZ1sNahDbmhHRYzTMg4koq1VzA=;
	b=JBEOGIcDy1WIGOz1iEnahNhZLPLAPyxSPGYQw3pRNaIE4sX+XH1TNAh/rWBgqYtgSBL7GW
	zn74SJJMSYMKUdCA==
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
Subject: [PATCH 09/12] irqchip/alpine-msi: Convert to __free
Date: Thu, 26 Jun 2025 16:49:06 +0200
Message-Id: <ff2c9460d03e44cb2946521dbae5ce800d34523e.1750860131.git.namcao@linutronix.de>
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

Tidy up the code with __free. No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/irqchip/irq-alpine-msi.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-=
msi.c
index cf188e5feefc0..43d6db290138a 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -207,11 +207,10 @@ static int alpine_msix_init_domains(struct alpine_msi=
x_data *priv, struct device
=20
 static int alpine_msix_init(struct device_node *node, struct device_node *=
parent)
 {
-	struct alpine_msix_data *priv;
+	struct alpine_msix_data *priv __free(kfree) =3D kzalloc(sizeof(*priv), GF=
P_KERNEL);
 	struct resource res;
 	int ret;
=20
-	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
=20
@@ -220,7 +219,7 @@ static int alpine_msix_init(struct device_node *node, s=
truct device_node *parent
 	ret =3D of_address_to_resource(node, 0, &res);
 	if (ret) {
 		pr_err("Failed to allocate resource\n");
-		goto err_priv;
+		return ret;
 	}
=20
 	/*
@@ -235,34 +234,28 @@ static int alpine_msix_init(struct device_node *node,=
 struct device_node *parent
=20
 	if (of_property_read_u32(node, "al,msi-base-spi", &priv->spi_first)) {
 		pr_err("Unable to parse MSI base\n");
-		ret =3D -EINVAL;
-		goto err_priv;
+		return -EINVAL;
 	}
=20
 	if (of_property_read_u32(node, "al,msi-num-spis", &priv->num_spis)) {
 		pr_err("Unable to parse MSI numbers\n");
-		ret =3D -EINVAL;
-		goto err_priv;
+		return -EINVAL;
 	}
=20
-	priv->msi_map =3D bitmap_zalloc(priv->num_spis, GFP_KERNEL);
-	if (!priv->msi_map) {
-		ret =3D -ENOMEM;
-		goto err_priv;
-	}
+	unsigned long *msi_map __free(kfree) =3D bitmap_zalloc(priv->num_spis, GF=
P_KERNEL);
+
+	if (!msi_map)
+		return -ENOMEM;
+	priv->msi_map =3D msi_map;
=20
 	pr_debug("Registering %d msixs, starting at %d\n", priv->num_spis, priv->=
spi_first);
=20
 	ret =3D alpine_msix_init_domains(priv, node);
 	if (ret)
-		goto err_map;
+		return ret;
=20
+	retain_and_null_ptr(priv);
+	retain_and_null_ptr(msi_map);
 	return 0;
-
-err_map:
-	bitmap_free(priv->msi_map);
-err_priv:
-	kfree(priv);
-	return ret;
 }
 IRQCHIP_DECLARE(alpine_msix, "al,alpine-msix", alpine_msix_init);
--=20
2.39.5


