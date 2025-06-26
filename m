Return-Path: <linux-mips+bounces-9508-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BAEAEA1A6
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 17:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FD50160CC9
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 14:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DC22F94AB;
	Thu, 26 Jun 2025 14:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="d7RpVYHG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l9HDPg8d"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D2B2F547A;
	Thu, 26 Jun 2025 14:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949379; cv=none; b=S3VAP+8WRxoW0QYzCrC5kml6h0wFn1onYZEIzEQ0W5AplkKSiOYEuAn3u0Pqy/ArnKCUAl5mV+vvP3UiGb4UfM/cyx5PESuQ/T02kOK5qxr50fs6weELeuyAku1xbTAB15wFOJF36aZfHC2BHxzynksm5X2WQDtqZMnrXjROOq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949379; c=relaxed/simple;
	bh=L0XKbe8Qa702YJqL8CmRi5qnaGzCPPWZf27atfQlU0U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V9kualG1F4zL+2xwOgUT2+plRmA7/ybb6VbuMF5h+L3C8YVJWvLO5atq+1M6TgZLOIlCAbf5tM4Jw6lAqYpgqYIGlUzATY5kuDvEE6nT2/gmK+ApeX2hi2hDjPX107ZELwirxmX31sBqh5JkkqQX7qGrmlMn8IaGH+vNkOiw2Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=d7RpVYHG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l9HDPg8d; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pi9UqFBmG0ABPdW7goJnL2FLekqeOwHCLTz3aDeGlnw=;
	b=d7RpVYHGdlxfyf0WiFnopVOhvS5IgLshX910+umF5VObQhNZ1ujRTniufW5dMtsTPKSlhF
	urakTifQAqOHMw+5EqyQT2e6ndF2HKPA64Z/NNCLq82v1jodx0BWqZfzeh8nVbO6rc6Cf4
	76E4Z0oMVNZh5Pc6drneoWcbeYh6qlNZCFBHk7x9CzCFrQdY42qUN/Sj7F+chf+3hQ76qD
	dEeGlxLv/RnLcUbgoOt26UCaTr5Daxb3TZY9s6iSX0IYZm9LZm/hvhyrSCwggfMs6MIWQ1
	Px1LLCDY8obutNGKEwgmRKIc17WjuRdOg/LEDGZMwsGTdNuFFWMMSoYwq8FUkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pi9UqFBmG0ABPdW7goJnL2FLekqeOwHCLTz3aDeGlnw=;
	b=l9HDPg8d9E07sSs5ILVUEbh58kaGOI05w6928VyvfHfE8vIWVBWMGdIIjPat2eWzCBI9lX
	8pXUG5ZKCqOW6XCg==
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
Subject: [PATCH 08/12] irqchip/alpine-msi: Convert to lock guards
Date: Thu, 26 Jun 2025 16:49:05 +0200
Message-Id: <7886b9595aaf8e102f79364784f68dec9c49b023.1750860131.git.namcao@linutronix.de>
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

Convert lock/unlock pairs to guards and tidy up the code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/irqchip/irq-alpine-msi.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-=
msi.c
index 7e379a6985a6a..cf188e5feefc0 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -60,19 +60,12 @@ static int alpine_msix_allocate_sgi(struct alpine_msix_=
data *priv, int num_req)
 {
 	int first;
=20
-	spin_lock(&priv->msi_map_lock);
-
-	first =3D bitmap_find_next_zero_area(priv->msi_map, priv->num_spis, 0,
-					   num_req, 0);
-	if (first >=3D priv->num_spis) {
-		spin_unlock(&priv->msi_map_lock);
+	guard(spinlock)(&priv->msi_map_lock);
+	first =3D bitmap_find_next_zero_area(priv->msi_map, priv->num_spis, 0, nu=
m_req, 0);
+	if (first >=3D priv->num_spis)
 		return -ENOSPC;
-	}
=20
 	bitmap_set(priv->msi_map, first, num_req);
-
-	spin_unlock(&priv->msi_map_lock);
-
 	return priv->spi_first + first;
 }
=20
@@ -80,11 +73,8 @@ static void alpine_msix_free_sgi(struct alpine_msix_data=
 *priv, unsigned int sgi
 {
 	int first =3D sgi - priv->spi_first;
=20
-	spin_lock(&priv->msi_map_lock);
-
+	guard(spinlock)(&priv->msi_map_lock);
 	bitmap_clear(priv->msi_map, first, num_req);
-
-	spin_unlock(&priv->msi_map_lock);
 }
=20
 static void alpine_msix_compose_msi_msg(struct irq_data *data, struct msi_=
msg *msg)
--=20
2.39.5


