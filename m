Return-Path: <linux-mips+bounces-9505-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81444AEA1BF
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 17:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EDA05A78CB
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 14:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F222F533D;
	Thu, 26 Jun 2025 14:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nSaQCQ+I";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="F9dx+Urf"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACF228934F;
	Thu, 26 Jun 2025 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949377; cv=none; b=SEj4m1v8dpowaq8kvt+Tw/LnBU0aqO6SGZtia0LKuhwVgZFf1lxB8zlqiXOf0ggSkvP0sNKDTxjn00DSsMpyhQVVls+OiL9XYjH+KG388kHwNxA1qqoKJsS3gFyQEuEgherTyanJOjYdrxYFOm3s6lKNIApsIWV9ot78BHFPaS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949377; c=relaxed/simple;
	bh=pv/4BBYnostM9chYE73eMVzgU77CZiNCj9OwEuIsQM0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NzBeyZJ1RNI5AiH6recJWsEfZPQLf5oMR4yZEfcdrrTfxinv7A/zZUhZV6FhmoAbNuUL+KPwIjq6MdC6vgBGka10z0YgrrGi8WvEU3WHQWCQHMy6m1al+uyophHSLvn78ILbGyzsqbITIuRccm0GeIhYLYQeeVYs2JEdJR4Kn3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nSaQCQ+I; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=F9dx+Urf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nkXJXJkvLwHuTpAwjvS0vUf4fEyF+xPIPCi5NiqwgZg=;
	b=nSaQCQ+IHhLsvffHxI3+qDKzxsBniO963XIYMSa4/MbUUJpX9o3IIyBndFYw+n5M6fqFUh
	3q+2Bc7BB2MVeC+voczKHzEkh/o3xC/gGaS2zbgaVyw/hsP5Fa5qWVHUPTYmVZwmC2DZZV
	KbEahyUeLdN7tOaJW72bbNwsCm6c6jg4wGtwFXMowZEchV1mt3cp7Cxyx8im6LpMMJyp3D
	0cFqLcXGdZfh/YBzlIWhXoIIBRGd7uUb7Qx+UudeF4a2tqe/kBwwgi2EuB39GqOKkh24rZ
	i29wjE42TIH6U4S8Ac4x/Qp/fJL0TrN8ME+hFIFFtqTKAoZJtZabqMaLSgs+Wg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nkXJXJkvLwHuTpAwjvS0vUf4fEyF+xPIPCi5NiqwgZg=;
	b=F9dx+UrfW5xu7dgNLVw0va+kP/3CyD/ZP0gDAyjIwhjycwqtJWLNkZnRpOSgHoReXhxaDD
	LOvuAc7P2JErQxAA==
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
Subject: [PATCH 05/12] irqchip/loongson-pch-msi.c: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:49:02 +0200
Message-Id: <7ae78d7b7e33ad8ca1ec2ba28957546c81ba86f7.1750860131.git.namcao@linutronix.de>
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
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org
---
 drivers/irqchip/irq-loongson-pch-msi.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-pch-msi.c b/drivers/irqchip/irq-l=
oongson-pch-msi.c
index a0257c7bef108..4aedc9b90ff77 100644
--- a/drivers/irqchip/irq-loongson-pch-msi.c
+++ b/drivers/irqchip/irq-loongson-pch-msi.c
@@ -153,26 +153,21 @@ static struct msi_parent_ops pch_msi_parent_ops =3D {
 	.init_dev_msi_info	=3D msi_lib_init_dev_msi_info,
 };
=20
-static int pch_msi_init_domains(struct pch_msi_data *priv,
-				struct irq_domain *parent,
+static int pch_msi_init_domains(struct pch_msi_data *priv, struct irq_doma=
in *parent,
 				struct fwnode_handle *domain_handle)
 {
-	struct irq_domain *middle_domain;
-
-	middle_domain =3D irq_domain_create_hierarchy(parent, 0, priv->num_irqs,
-						    domain_handle,
-						    &pch_msi_middle_domain_ops,
-						    priv);
-	if (!middle_domain) {
+	struct irq_domain_info info =3D {
+		.ops		=3D &pch_msi_middle_domain_ops,
+		.size		=3D priv->num_irqs,
+		.parent		=3D parent,
+		.host_data	=3D priv,
+		.fwnode		=3D domain_handle,
+	};
+
+	if (!msi_create_parent_irq_domain(&info, &pch_msi_parent_ops)) {
 		pr_err("Failed to create the MSI middle domain\n");
 		return -ENOMEM;
 	}
-
-	irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
-
-	middle_domain->flags |=3D IRQ_DOMAIN_FLAG_MSI_PARENT;
-	middle_domain->msi_parent_ops =3D &pch_msi_parent_ops;
-
 	return 0;
 }
=20
--=20
2.39.5


