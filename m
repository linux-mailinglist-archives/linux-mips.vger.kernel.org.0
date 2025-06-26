Return-Path: <linux-mips+bounces-9502-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96815AEA199
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 16:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EB8617716F
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 14:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75642F432B;
	Thu, 26 Jun 2025 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Le0CtdFB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Mzr5HnfB"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A922EB5B9;
	Thu, 26 Jun 2025 14:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949373; cv=none; b=KOaWwpmD9GVtxzLmuvB3M8eXDeHtdFNZ1xwmS4/Je0dl+wJz2EqA9j/MPE0uiO/Zi5tyV4rsy47+f6Hnxmnqn8jaqPGjbDFSs8ifNYuRZoG9r7wVTRz4GifHCPbh/pASe3TcZyqzXu8T5npY7AURpDaNqTLoinIdWnqjT2P6Euo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949373; c=relaxed/simple;
	bh=Tdajg+4kEdVbvLNhYKhYfqYw5bemqLDjktbDhTTjFyc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ucfNN4ioD5xvXSmLuSBz8gVDc4XRT0CwmRGRZn1twqHcmMQOWUCfW3eAhQB5hy7+B8cnF8vGluX3ltP523o97wD6rx/JojgTb4N3KP6UpZsVnJhY/GG/B4UjUdIoPf2B4ZAqrTAiqrPjUg8kfPD5MYuOWNWX/AFzbhIfaUIRrOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Le0CtdFB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Mzr5HnfB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fupjHTV5DnOmVcgCuGo7Gn43pEA+0f/cXil9unSCcGQ=;
	b=Le0CtdFBiqX2btBCd9aUHwSpvNJJiERCenIY0xuoHYXzpcWz2J+t6YAvYp0KU/Ah9dP9Fj
	aqOGCEsXMWdkZdfNy2manEE695M6vy8P3+cS8qpYiZYHsKvkdmAWebgkaazG398a+Y5Bsp
	U3TtFq3Re6osMhOL5sP/6tgiASvW1/GDVOgJJhX3P/oBJ3tLGToiEHKNwBRJbnLAOqABKN
	XSZROilhPoyjGfqXrJBqR/9D7VFdFzhs88J4n0uEM1hF6Se8qjzY5WWJiXMG3KcMOQ/eF4
	bVtOKD+LeaQ3bP4pak/PmNjfsHaJYPkG715aZJ4vJqjFVWocYyBh1pGn1D5teA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fupjHTV5DnOmVcgCuGo7Gn43pEA+0f/cXil9unSCcGQ=;
	b=Mzr5HnfB60mMPL7NGoooAyg1xNzdkmbmHxXDYU5fjXyt0j9iN7EVzDaRqZ7rQSd7VG1RaK
	/trtgHhcMHyE3rDQ==
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
Subject: [PATCH 02/12] irqchip/bcm2712-mip: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:48:59 +0200
Message-Id: <92a6d68db014e945337c10649a41605da05783da.1750860131.git.namcao@linutronix.de>
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

Switch to use the concise helper to create an MSI parent domain.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nam Cao <tglx@linutronix.de>
---
 drivers/irqchip/irq-bcm2712-mip.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-bcm2712-mip.c b/drivers/irqchip/irq-bcm271=
2-mip.c
index 63de5ef6cf2db..9bd7bc0bf6d59 100644
--- a/drivers/irqchip/irq-bcm2712-mip.c
+++ b/drivers/irqchip/irq-bcm2712-mip.c
@@ -172,18 +172,18 @@ static const struct msi_parent_ops mip_msi_parent_ops=
 =3D {
=20
 static int mip_init_domains(struct mip_priv *mip, struct device_node *np)
 {
-	struct irq_domain *middle;
-
-	middle =3D irq_domain_create_hierarchy(mip->parent, 0, mip->num_msis, of_=
fwnode_handle(np),
-					     &mip_middle_domain_ops, mip);
-	if (!middle)
+	struct irq_domain_info info =3D {
+		.fwnode		=3D of_fwnode_handle(np),
+		.ops		=3D &mip_middle_domain_ops,
+		.host_data	=3D mip,
+		.size		=3D mip->num_msis,
+		.parent		=3D mip->parent,
+		.dev		=3D mip->dev,
+	};
+
+	if (!msi_create_parent_irq_domain(&info, &mip_msi_parent_ops))
 		return -ENOMEM;
=20
-	irq_domain_update_bus_token(middle, DOMAIN_BUS_GENERIC_MSI);
-	middle->dev =3D mip->dev;
-	middle->flags |=3D IRQ_DOMAIN_FLAG_MSI_PARENT;
-	middle->msi_parent_ops =3D &mip_msi_parent_ops;
-
 	/*
 	 * All MSI-X unmasked for the host, masked for the VPU, and edge-triggere=
d.
 	 */
--=20
2.39.5


