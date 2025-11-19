Return-Path: <linux-mips+bounces-12284-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E214EC6DDFC
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 11:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id DBFC92C839
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 10:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3533A342C8E;
	Wed, 19 Nov 2025 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="q3ul+T+8"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E60336ED1;
	Wed, 19 Nov 2025 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763546679; cv=none; b=ClKF8Q586T7MBCeaWAo8aD8wpraxH52eWxR4jvQoJkeOndxonb1NNH1eVVNAlvh+r7M+ngz+wc+ezgJE2CWFY/c1ePgCapkLZWVCtPA7r9a+iT6kYR0Sm663RDlyHqGVAe6s8FTIaN/0Rr10QTSoM8QBBgn2QmP4B2ct0zPiIe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763546679; c=relaxed/simple;
	bh=R1W+D2JRPWwarJ7l+JsNREKcQeUaSc9NN24K0kJrUOs=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=VYh3lsYuT8KlNkIhz6wpYkoRzaz5FQNvfKMrWS1Mq6wFQvw5Jq5ETn+v2Pra13xTwPsEkylO1plP4BarzqwJsD7YSb9SkBePbh38eWMcXfRCNNbhc4S3hA2P9EuPfg26oNGHp50dBqLLnwCna6zukDHx5tmTCbq3VN68lubi0+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=q3ul+T+8; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KPfsu59Yt0PWFOvEro80t5AXlzEkyAnGNmZkqzrwQ08=; b=q3ul+T+81Zi9zcWuHHvUgADgER
	BzFveuxWasUnltUsKMhFpZ3ESyIvg1/o3u9GqFegfprpHjcL6COj2PiuZuyrVRfgv8UfqOtTyqiRp
	1SLApR2bWJpjEEtniaNAAzGc8ectQSfqS6eczI0+DFQtK2XEU/m2rlWCoN+4fNUM+DQ8eD86f4OfR
	NJ/rl0935lL0UzWKz90hTr96PekeMW01mU1zdKi9Um/sh2CwkBOAgbQe3m9H9PANphlT0Tp4WlUI1
	NjYsJX994DlxriT3keDjr5mkBJU6q6i6MQ/al/IMEbN6jlstqMO42C9cFeuOMNwNpITbB/kUWNCWi
	nN8VjxdQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35848 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vLf2a-000000004RB-1cM3;
	Wed, 19 Nov 2025 10:03:56 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vLf2Z-0000000FMNH-0xPV;
	Wed, 19 Nov 2025 10:03:55 +0000
In-Reply-To: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
References: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <fustini@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	s32@nxp.com,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH net-next 2/3] net: stmmac: move probe/remove calling of
 init/exit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vLf2Z-0000000FMNH-0xPV@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 19 Nov 2025 10:03:55 +0000

Move the probe/remove time calling of the init()/exit() methods in
the platform data to the main driver probe/remove functions. This
allows them to be used by non-platform_device based drivers.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 47 ++++++++++++++-----
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 23 +--------
 2 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 644dccb29f75..aac8188248ff 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7593,19 +7593,9 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(stmmac_plat_dat_alloc);
 
-/**
- * stmmac_dvr_probe
- * @device: device pointer
- * @plat_dat: platform data pointer
- * @res: stmmac resource pointer
- * Description: this is the main probe function used to
- * call the alloc_etherdev, allocate the priv structure.
- * Return:
- * returns 0 on success, otherwise errno.
- */
-int stmmac_dvr_probe(struct device *device,
-		     struct plat_stmmacenet_data *plat_dat,
-		     struct stmmac_resources *res)
+static int __stmmac_dvr_probe(struct device *device,
+			      struct plat_stmmacenet_data *plat_dat,
+			      struct stmmac_resources *res)
 {
 	struct net_device *ndev = NULL;
 	struct stmmac_priv *priv;
@@ -7912,6 +7902,34 @@ int stmmac_dvr_probe(struct device *device,
 
 	return ret;
 }
+
+/**
+ * stmmac_dvr_probe
+ * @dev: device pointer
+ * @plat_dat: platform data pointer
+ * @res: stmmac resource pointer
+ * Description: this is the main probe function used to
+ * call the alloc_etherdev, allocate the priv structure.
+ * Return:
+ * returns 0 on success, otherwise errno.
+ */
+int stmmac_dvr_probe(struct device *dev, struct plat_stmmacenet_data *plat_dat,
+		     struct stmmac_resources *res)
+{
+	int ret;
+
+	if (plat_dat->init) {
+		ret = plat_dat->init(dev, plat_dat->bsp_priv);
+		if (ret)
+			return ret;
+	}
+
+	ret = __stmmac_dvr_probe(dev, plat_dat, res);
+	if (ret && plat_dat->exit)
+		plat_dat->exit(dev, plat_dat->bsp_priv);
+
+	return ret;
+}
 EXPORT_SYMBOL_GPL(stmmac_dvr_probe);
 
 /**
@@ -7950,6 +7968,9 @@ void stmmac_dvr_remove(struct device *dev)
 
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
+
+	if (priv->plat->exit)
+		priv->plat->exit(dev, priv->plat->bsp_priv);
 }
 EXPORT_SYMBOL_GPL(stmmac_dvr_remove);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index feccb8a3e7e8..9015b7f80d1b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -804,25 +804,12 @@ int stmmac_pltfr_probe(struct platform_device *pdev,
 		       struct plat_stmmacenet_data *plat,
 		       struct stmmac_resources *res)
 {
-	struct device *dev = &pdev->dev;
-	int ret;
-
 	if (!plat->suspend && plat->exit)
 		plat->suspend = stmmac_plat_suspend;
 	if (!plat->resume && plat->init)
 		plat->resume = stmmac_plat_resume;
 
-	ret = stmmac_pltfr_init(dev, plat);
-	if (ret)
-		return ret;
-
-	ret = stmmac_dvr_probe(dev, plat, res);
-	if (ret) {
-		stmmac_pltfr_exit(dev, plat);
-		return ret;
-	}
-
-	return ret;
+	return stmmac_dvr_probe(&pdev->dev, plat, res);
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_probe);
 
@@ -864,13 +851,7 @@ EXPORT_SYMBOL_GPL(devm_stmmac_pltfr_probe);
  */
 void stmmac_pltfr_remove(struct platform_device *pdev)
 {
-	struct net_device *ndev = platform_get_drvdata(pdev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-	struct plat_stmmacenet_data *plat = priv->plat;
-	struct device *dev = &pdev->dev;
-
-	stmmac_dvr_remove(dev);
-	stmmac_pltfr_exit(dev, plat);
+	stmmac_dvr_remove(&pdev->dev);
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_remove);
 
-- 
2.47.3


