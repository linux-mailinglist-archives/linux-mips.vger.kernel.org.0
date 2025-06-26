Return-Path: <linux-mips+bounces-9503-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 581C9AEA1D3
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 17:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18EE81C45A69
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 14:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42A12F5309;
	Thu, 26 Jun 2025 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k6cTJKEH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kU8nVJGp"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291F22F4339;
	Thu, 26 Jun 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949375; cv=none; b=q6nVDzj/prcmN5U5/5cjcXkiUmx2xv66CqcadUv4VxwsbpTR2y0GcgtIbXb3yOiCEmgSmdgKcXM07D6w65flMXZw1tX8b50AUqp1SI60LykRLmkD1AQqgFUpWJ2kj/Wbu72wcjFNABxBuHosVjMliKa4w6n8X9d1WAeVao1EpL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949375; c=relaxed/simple;
	bh=A044Rnz3lpWcem70RAC14SAiokFrVW/lHMS3VbedEvg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ij5M/c39pihN944hNR9tkpxduFTWc4acQUNbcpVymRCRZ3GN0PV2JTUHR1bILGX82Zlc7UDE2YzdeQsgpA/ofMnF4QAtATEOZOMjFlaNA1NsY0qmm9RBP+GnAVmfHi0ItA5Rw1gfDkpcFReihkOBlqSq/ik6M3DzypnQYupgneg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=k6cTJKEH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kU8nVJGp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CCV6bFUUfFxB0dupoRA2S4Wd06kQQS9OF6OfS/2EiHI=;
	b=k6cTJKEHb4brrQG+gymKJzNH1BBvN4SJI81xlJS1r/FFDjmgyleaNSMFtZqIGoBm26e8z7
	VjQzuu9WHfbyu6cXIJlSq66QsLl7l4U9l46T113HkmjWShQ1EwAjDXDpVr11NwCpvqwJ7q
	R8a2d8tkccRtd5ZG2bmIr6dfC86Hijrndx1CsbROK/bC7qMgXrmMxv6eD5xkxfIhAGi1mk
	xVz7dTRBmNzFnbvt0ER1s05EQKtfZXAFpd7ZiTa8WbfNHptOMJ8/dpwUeHyGu+OZ7bnKb3
	9M9xkbRWqXxDD2htW826eHnbiN6+69z7Gvz2VlbAuZY6QB5ka2eD/6SWu9lMbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CCV6bFUUfFxB0dupoRA2S4Wd06kQQS9OF6OfS/2EiHI=;
	b=kU8nVJGpjIPyZGszjEtsn7WcpYNC9r9///57gdt2gHQ6773b68/ZNF0LCSlkKermKJAZfZ
	1Sr2D3sI0N58NBAA==
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
Subject: [PATCH 03/12] irqchip/riscv-imsic: Convert to msi_create_parent_irq_domain() helper
Date: Thu, 26 Jun 2025 16:49:00 +0200
Message-Id: <b906a38d443577de45923b335d80fc54c5638da0.1750860131.git.namcao@linutronix.de>
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
switch the RISC-V letter soup over to that.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nam Cao <tglx@linutronix.de>
Link: https://lore.kernel.org/all/20241204124549.607054-6-maz@kernel.org
---
Cc: Anup Patel <anup@brainfault.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/i=
rq-riscv-imsic-platform.c
index 1b9fbfce95816..74a2a28f94030 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -307,6 +307,11 @@ static const struct msi_parent_ops imsic_msi_parent_op=
s =3D {
=20
 int imsic_irqdomain_init(void)
 {
+	struct irq_domain_info info =3D {
+		.fwnode		=3D imsic->fwnode,
+		.ops		=3D &imsic_base_domain_ops,
+		.host_data	=3D imsic,
+	};
 	struct imsic_global_config *global;
=20
 	if (!imsic || !imsic->fwnode) {
@@ -320,16 +325,11 @@ int imsic_irqdomain_init(void)
 	}
=20
 	/* Create Base IRQ domain */
-	imsic->base_domain =3D irq_domain_create_tree(imsic->fwnode,
-						    &imsic_base_domain_ops, imsic);
+	imsic->base_domain =3D msi_create_parent_irq_domain(&info, &imsic_msi_par=
ent_ops);
 	if (!imsic->base_domain) {
 		pr_err("%pfwP: failed to create IMSIC base domain\n", imsic->fwnode);
 		return -ENOMEM;
 	}
-	imsic->base_domain->flags |=3D IRQ_DOMAIN_FLAG_MSI_PARENT;
-	imsic->base_domain->msi_parent_ops =3D &imsic_msi_parent_ops;
-
-	irq_domain_update_bus_token(imsic->base_domain, DOMAIN_BUS_NEXUS);
=20
 	global =3D &imsic->global;
 	pr_info("%pfwP:  hart-index-bits: %d,  guest-index-bits: %d\n",
--=20
2.39.5


