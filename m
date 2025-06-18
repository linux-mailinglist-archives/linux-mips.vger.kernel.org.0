Return-Path: <linux-mips+bounces-9379-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E34DAADE947
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 12:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4042189EABD
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 10:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C32285061;
	Wed, 18 Jun 2025 10:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="KmCEIcKF"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E145115D1;
	Wed, 18 Jun 2025 10:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750243318; cv=none; b=H9pxwnZRElCFlgILNhW4K6b/D3YvYc+24KdX+9eh0Cigaa5CTRPHLNx8Fhz7tDqKVYsMrtwgdO/sYHIel1VZMw/xpJUfURr4NnuUnndkZA12OKkyqnlsuInPDt7eHkvLqaxj5i6aL4Fa1uToqIJ22uvq2kwhE0lE7If7NI8Sbao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750243318; c=relaxed/simple;
	bh=k0LXltQZW3ApzJfj+AHhZrtAxdbVdDUSqytiiy7bwD4=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=N2yb9TpqeGtTVhayjU1r48G+f87fFT8Nt7TDQvq2gUpNi6eaSER0qEbkzv/+H6ON00bOTNB9p503g7O1owpUR4iwEBbkUSogYKH/jAH7YqWrxzjZH5BKTEo8nr65ZPHgzw6gGam9SvkqHoE8S8RPZJr4XAxdnllxEe++uExB5k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=KmCEIcKF; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Cm/933WhUbzY2Ue6anpW6daO4H0jv7g+t//DGt737a8=; b=KmCEIcKFhTTTC5XlkVRRdi6Q6L
	gfoMjuP0cDyjUGyz6KEdDcJ4zuuhX1KMcLtXoxV8o8d3WaE170hQxYgs1LCHMXnbmT8GzEgoxu7eT
	JkAWuUVRWRg5kFGOnCZ3b6p2L8eK6I+9U2qGgn4b+RM07Ii0Zgys1xaiDlj+UCrV/9e+EVBDNvkgn
	+I0YA/ADwi77krhLJI5A0+xuqPOm+2SviJzaI/OosZh/q48Jb6AjhXYz0HvTTmm6drETWag1lHHQT
	Og5Sbx2F2kpBkYZ6E7CgL5yccMDomgqa7y8S55Rwy2vW0q7fyji2C+zrUJPhB30SPp2rWGGE3FeQG
	0AhIcjxw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60256 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uRqEn-0006Ia-2s;
	Wed, 18 Jun 2025 11:41:49 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uRqE9-004c7G-CB; Wed, 18 Jun 2025 11:41:09 +0100
In-Reply-To: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/2] net: stmmac: loongson1: provide match data
 struct
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 18 Jun 2025 11:41:09 +0100

Provide a structure for match data rather than using the function
pointer as match data. This allows stronger type-checking for the
function itself, and allows extensions to the match data.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson1.c | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
index 3e86810717d3..78d9540be10c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
@@ -46,6 +46,10 @@ struct ls1x_dwmac {
 	struct regmap *regmap;
 };
 
+struct ls1x_data {
+	int (*init)(struct platform_device *pdev, void *bsp_priv);
+};
+
 static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *priv)
 {
 	struct ls1x_dwmac *dwmac = priv;
@@ -143,9 +147,9 @@ static int ls1x_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
+	const struct ls1x_data *data;
 	struct regmap *regmap;
 	struct ls1x_dwmac *dwmac;
-	int (*init)(struct platform_device *pdev, void *priv);
 	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -159,8 +163,8 @@ static int ls1x_dwmac_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
 				     "Unable to find syscon\n");
 
-	init = of_device_get_match_data(&pdev->dev);
-	if (!init) {
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data) {
 		dev_err(&pdev->dev, "No of match data provided\n");
 		return -EINVAL;
 	}
@@ -175,21 +179,29 @@ static int ls1x_dwmac_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 
 	plat_dat->bsp_priv = dwmac;
-	plat_dat->init = init;
+	plat_dat->init = data->init;
 	dwmac->plat_dat = plat_dat;
 	dwmac->regmap = regmap;
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
+static const struct ls1x_data ls1b_dwmac_data = {
+	.init = ls1b_dwmac_syscon_init,
+};
+
+static const struct ls1x_data ls1c_dwmac_data = {
+	.init = ls1c_dwmac_syscon_init,
+};
+
 static const struct of_device_id ls1x_dwmac_match[] = {
 	{
 		.compatible = "loongson,ls1b-gmac",
-		.data = &ls1b_dwmac_syscon_init,
+		.data = &ls1b_dwmac_data,
 	},
 	{
 		.compatible = "loongson,ls1c-emac",
-		.data = &ls1c_dwmac_syscon_init,
+		.data = &ls1c_dwmac_data,
 	},
 	{ }
 };
-- 
2.30.2


