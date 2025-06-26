Return-Path: <linux-mips+bounces-9504-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C85AEA1A1
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 16:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E680B16AF82
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 14:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DAA2F532B;
	Thu, 26 Jun 2025 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hl/CvgJf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5gjOj5qE"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13BE2F49F9;
	Thu, 26 Jun 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949376; cv=none; b=mbeXoi9hWMCH0hEdcVgMWjpyvltJ/tun3j/4PO/LF2Dn9DbAnlZVY9K+ZeOUBeO07GswAueuFXemiv+1pENj2qZ51EYGFcbgdeVCFYNs+95ljViyhpgU9AvIXUJ+sZbQf7BJqiKISquq5YdT/od89gf1YbsG77uR6rUadpKetnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949376; c=relaxed/simple;
	bh=zC8Fx3exL5csc20jytlOr6DB9UfsssCTE87hiKOBIwo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ICeFcfEK2yaBzH/ezeX+Nx5gMlXnh28JKW1+sMfZNmOtUMv+NCaS7q/cCL0ChiEf9Liu/J9d5qkQND8XE7RLR0cWF+VVrIoALggwqzaBQUQmtdH4/4sUXyhi0NrMCx+11hZrfgX4B+qRnH3+HEhrMinNsMxg6jKzG6AN6PkHsiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hl/CvgJf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5gjOj5qE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KDPZSiRjIrBu3L0mAoo4Z14oMd2brpt/a9a8i/MwVwI=;
	b=hl/CvgJftBwQuXGwjera4DNcyc5KVFTYYYBRaCt85BBXlSr+NOFo4liMuDDuGuEDA08JRR
	9kECWWNebtVKtUi6O1IoEVtQfHvtcCqC+reamRDMcr++uzHi7FFtyTEpnTfWmY6gk30WC0
	Syr9/80XY+6W8o3ZmLzLHnXSUNpPA0/qoauBU5ySTQQmv3xy2jWhBAaeSP58EtNtLVh/86
	vcDNk4VSgK6x6g3qbIJx+dXFCZXTbjURylPipzpVGBiGYAZ+Lm+VG7ZG5VXeerfQ2RmCMq
	EkmPeLlGSYNN3Nzgb2CcsM3t/mDRooZ7h6g/gya1dYzqVjwo4xJ0dg1919KmhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KDPZSiRjIrBu3L0mAoo4Z14oMd2brpt/a9a8i/MwVwI=;
	b=5gjOj5qEa8MI8tht7YvPXgkn/vPlU41HeXiQrs+o8JZv31+Zigm+RjLGCTQDWDnW4G+BEP
	LHS+nX0A6GMC8rAg==
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
Subject: [PATCH 04/12] irqchip/imx-mu-msi: Convert to msi_create_parent_irq_domain() helper
Date: Thu, 26 Jun 2025 16:49:01 +0200
Message-Id: <4f05fff99b6cc5875d2f4dadd31707e2dedaafc8.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Marc Zyngier <maz@kernel.org>

Now that we have a concise helper to create an MSI parent domain,
switch the IMX letter soup over to that.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Link: https://lore.kernel.org/all/20241204124549.607054-7-maz@kernel.org
---
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/irqchip/irq-imx-mu-msi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-=
msi.c
index 137da1927d144..d2a4e8a61a42b 100644
--- a/drivers/irqchip/irq-imx-mu-msi.c
+++ b/drivers/irqchip/irq-imx-mu-msi.c
@@ -223,21 +223,21 @@ static const struct msi_parent_ops imx_mu_msi_parent_=
ops =3D {
=20
 static int imx_mu_msi_domains_init(struct imx_mu_msi *msi_data, struct dev=
ice *dev)
 {
-	struct fwnode_handle *fwnodes =3D dev_fwnode(dev);
+	struct irq_domain_info info =3D {
+		.ops		=3D &imx_mu_msi_domain_ops,
+		.fwnode		=3D dev_fwnode(dev),
+		.size		=3D IMX_MU_CHANS,
+		.host_data	=3D msi_data,
+	};
 	struct irq_domain *parent;
=20
 	/* Initialize MSI domain parent */
-	parent =3D irq_domain_create_linear(fwnodes, IMX_MU_CHANS,
-					  &imx_mu_msi_domain_ops, msi_data);
+	parent =3D msi_create_parent_irq_domain(&info, &imx_mu_msi_parent_ops);
 	if (!parent) {
 		dev_err(dev, "failed to create IRQ domain\n");
 		return -ENOMEM;
 	}
-
-	irq_domain_update_bus_token(parent, DOMAIN_BUS_NEXUS);
 	parent->dev =3D parent->pm_dev =3D dev;
-	parent->flags |=3D IRQ_DOMAIN_FLAG_MSI_PARENT;
-	parent->msi_parent_ops =3D &imx_mu_msi_parent_ops;
 	return 0;
 }
=20
--=20
2.39.5


