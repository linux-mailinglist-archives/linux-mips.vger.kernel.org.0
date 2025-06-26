Return-Path: <linux-mips+bounces-9506-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFCCAEA1C0
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 17:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 149303A558C
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 14:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0891F2F5487;
	Thu, 26 Jun 2025 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q89pqfCd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xxE65vbv"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571292F531D;
	Thu, 26 Jun 2025 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949377; cv=none; b=fON8YNsU7zNWcUAj+u7KQeodiLhHXfsZ82rxKYX6SN4iPlFnZBCW2zDpgXBazOQNbQZrnoiYpoH0jzS2kRx1txZwcKrHBOqJGeq4TGLlSQN50XFU5mqA93JLLDRkC2pBOVSJcD7eRaH15xN3ZMR/FVniAU4t8mxRmOuEjlwGhLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949377; c=relaxed/simple;
	bh=KJqGjiCZWU9fj4zotEjWwy5zPpJjIZO+4otyCmaUWAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LPYHttKeG5XVBbzbsahTY7W8XbfKTpzQ4WfGiYq091Wnr8O+W/JYqHsK0IxL9ILp6Fm6HQ9Kr7sOyaamouaizbU1ucOhkgn5kxuBrbNLyASSB78Qi+hQ997HR7TCs3mGED1aiCOBMHrLgVo5nMlUjls5h3UR1tP2/IAneEc9Ycc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q89pqfCd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xxE65vbv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQJvh+4qMJpBwXh0oz+ildmCIKYnFwkVpJiG0W9NSek=;
	b=Q89pqfCdat4vTT56i2MTX0cTaMwEjsqBm0u4pbQnqmzE0GD2jw+bQLBlo/pBmMGqNAA0Qi
	IKr2QvMqOX0DRNXW90uw9oHztaPjiVlvXBFiF/aOqOgvpaQ87+cJuATK29xIkL+q9W/e2M
	t0p5DWIbScJ+4w9ctgp1UJXODLgYog+boNeuXrfqMuQxenCHgmvPdcibhqLp7kk7OxcBpb
	KopyBUISrjxix+ONfrCI9WMMwfd7rxwufRt3hoF63Ls1srjswmZK2RcKQ6EeeYhQScDfV9
	ZBbW94kOKIvU3Kh57llhjE8i1PBVG4WT5t3mTGLHXX6JC3cTSmAQXEk9QRY1uQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQJvh+4qMJpBwXh0oz+ildmCIKYnFwkVpJiG0W9NSek=;
	b=xxE65vbvF2hQ7Y9sZ9cCcwBqJ1qtggiCp0YusxI6VwHfX7Psmg4sc3ccQUZF44/xzfh1Jh
	2lSa5cZxvKNYFKBg==
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
Subject: [PATCH 06/12] irqchip/sg2042-msi: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:49:03 +0200
Message-Id: <3e901db1a4c87678af053019774d95b73bfb9ef9.1750860131.git.namcao@linutronix.de>
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
 drivers/irqchip/irq-sg2042-msi.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-=
msi.c
index af16bc5a3c8b5..bcfddc51bc6a1 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -219,20 +219,18 @@ static const struct msi_parent_ops sg2044_msi_parent_=
ops =3D {
 static int sg204x_msi_init_domains(struct sg204x_msi_chipdata *data,
 				   struct irq_domain *plic_domain, struct device *dev)
 {
-	struct fwnode_handle *fwnode =3D dev_fwnode(dev);
-	struct irq_domain *middle_domain;
-
-	middle_domain =3D irq_domain_create_hierarchy(plic_domain, 0, data->num_i=
rqs, fwnode,
-						    &sg204x_msi_middle_domain_ops, data);
-	if (!middle_domain) {
+	struct irq_domain_info info =3D {
+		.ops		=3D &sg204x_msi_middle_domain_ops,
+		.parent		=3D plic_domain,
+		.size		=3D data->num_irqs,
+		.fwnode		=3D dev_fwnode(dev),
+		.host_data	=3D data,
+	};
+
+	if (!msi_create_parent_irq_domain(&info, data->chip_info->parent_ops)) {
 		pr_err("Failed to create the MSI middle domain\n");
 		return -ENOMEM;
 	}
-
-	irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
-
-	middle_domain->flags |=3D IRQ_DOMAIN_FLAG_MSI_PARENT;
-	middle_domain->msi_parent_ops =3D data->chip_info->parent_ops;
 	return 0;
 }
=20
--=20
2.39.5


