Return-Path: <linux-mips+bounces-12106-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1F1C3F85A
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 11:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 72CFD4F3440
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 10:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844A731B836;
	Fri,  7 Nov 2025 10:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QJ0e8sGB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34C030597C
	for <linux-mips@vger.kernel.org>; Fri,  7 Nov 2025 10:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511422; cv=none; b=YuAeKdDVDB2LixNKd9LYjHVwTua++1bP3Ez+2y6/Qjbg+243UVslizuWedk9HILMCfd/chOBrPDIJbbbTl6sYrUcwvoxbH9POMaElORMmun2q4Ul4DM86cmqovGyd6w3HzKxrnX/ruHp+36B8+8WYuNyUdyJkzFiPpAzKBMisOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511422; c=relaxed/simple;
	bh=bf3B5kwYVwr169/W9UlPMIlu2CzILnodl9pD3IyD0h4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RLpHPv9/RnQRHPz1oH+x5Pa0By7bMaZ6yYr2YUCOL7EseeOzMbPNevOKZeeEjMSlPWOPlplEMdZkbkpBJzmW7sqV6K6SbDu1N89kgzSgR82ur5yx/7CNK+FoasDkeCM0v/YBXP585+UnrK2Zu6m8A72scH+7B34dnQvZvxFfpns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QJ0e8sGB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429b7ba208eso339964f8f.1
        for <linux-mips@vger.kernel.org>; Fri, 07 Nov 2025 02:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511416; x=1763116216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6g7dsZ8u0SOZn4ZdglRbxzgGZbve11SxESJzoyiLLfA=;
        b=QJ0e8sGBpzCq8/7PYa5hWnasq1OpUSQq8q3h+GQVR8HBsVNFKTkcXbp1u9N0rrY1nz
         GfJc6DaVXFasnVij5U1nFFh2YOCx7f315wnEVGX9QjIig/VM6ZDhjkh5SLjnkT2DAd3p
         W0uxA7tp39jOEIpRjGmV/0cu7ocNV8OSuAfb+QijaD2c7h9pMnHRaORW/T3RNk/k8JgN
         PWwvXKtJLuhqgyrvXXZAzeiHseLJM90IXhwXUs3oFueNzlK7O5A1eh06hnRNYvGhLGUa
         onkdzjIYaFwq7MHtant+zyCNUgpMS3vXEY+mrcwV0FQ5xPy9HgqRFvbWkdfJIXj+Y5f/
         YDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511416; x=1763116216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6g7dsZ8u0SOZn4ZdglRbxzgGZbve11SxESJzoyiLLfA=;
        b=lgFcNLms7PLm98uFxkglKghSZe3p1qmWR3QFMjXOEyRslF1o74yXfsBd5SqOmWhA8v
         sCGtOjp/ZlH/E0iftEeLBbZjumob7v6CnbcQycWrxTvBs3qNx3pMPij8RSX79YoE4F5a
         5oMXH+H8rxRY7W71dWtDolJTto0senHcpCHJp9+folB5kOnotcvZox/zqfYMVco/lm+J
         6SSPsqq7W/EVP2YU1iYKhPRrM2rt70tC6JNFn+e0B4zvs/mdviQ/jeR8/dPR8Bepl+r+
         XB83DIUcrqlkc4S+8kjqqT9RXIujZwjBdCMMxByCA6sW5DQRVoArxBMzKDQUbDqjybGp
         5eXw==
X-Forwarded-Encrypted: i=1; AJvYcCViQDneeWD2v5887IB0yqLdWHJ67+NgrIV6iQx+sElCrLY77DdpDFQ21NeWQGAbOcSTdjit7Unn7JTC@vger.kernel.org
X-Gm-Message-State: AOJu0YyvqWVWXypYBJmkFY2WC/XiV+YlrFfQXqqJqoICNursvtH+1LYR
	OWtIsuyBEWJI7eDRLfIcjGHUHJ1El0MwGPwEfM4eeBAIMzZ5B0j1yzN+/493L/c28FY=
X-Gm-Gg: ASbGnctSwhG+fp29ZfBxOf/LphFTupm/kBLhlSeSDJQTw+32kmpBaJrh89fArW+Y6UA
	mhKZEL6yTMzXgSk4dDb4pfi/v3I5ebE6+SysA1NAxrffIq3yztC2jJMK9un6NX5Qr/+aLRPvG8f
	EciKjxgdY90c7iVGTN8k6RA68H/dT6j7omRYJGW1Ao2bQU8d+C20fUTs0dHkk9KuEnv8DIKiCIn
	aH+8kUQS40RDv2M+h6VxFNdO7aj0tt7fNsR9v7211MAjcLSr9vclRdDqKbphCzbdCrZPAvajK9V
	jErIxcfD5rogJBaBjXczkpajS/Y6449Altr7uw9yj8Mz1/rxZKhs24fgSBYputIr15dwvS6Lvio
	cwya8V1lJrFASGePEhCTD6Q+SW2/8ZbfqFaFgbcijxeNFF/N3lNbNnekSdYbdYm9yL7cb
X-Google-Smtp-Source: AGHT+IGjWqT926NXSYOyJLRW80qfFEBsN3CZLG323CE3ZOxMO0Sltaq1d1IcpoU8pb1e3RtYjr7rzw==
X-Received: by 2002:a5d:5d06:0:b0:429:b751:7916 with SMTP id ffacd0b85a97d-42ae5ae025dmr2131435f8f.45.1762511415568;
        Fri, 07 Nov 2025 02:30:15 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm4414864f8f.39.2025.11.07.02.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:30:14 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 07 Nov 2025 11:29:54 +0100
Subject: [PATCH v5 4/8] net: stmmac: qcom-ethqos: wrap emac driver data in
 additional structure
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcom-sa8255p-emac-v5-4-01d3e3aaf388@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Shuang Liang <liangshuang@eswincomputing.com>, 
 Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
 Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5646;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FNtfWUOF4aoHZQXzUDVa1raYDkAAFgkdXVleG8nnhtM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDcool2zGWAFikwgtdjrvFAFi5YomqW8xImQ2T
 QXlmf8S3+2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQ3KKAAKCRARpy6gFHHX
 cl2VEACqTpc4dL47ZWZ/SzyIHTYakk3glXirLn2ZL9SFZunoJCJoi6zwm+f+1+5VDZ6j9durf5v
 A9qeHYJm1gph+hLEmyn9e9tuPDqPfh1e4v/9Wu8jIY5XD/5yoVt9kwaQ0v91D3MYV9a0ErY6oU2
 PYM1W8NkW5+lUs41TB6biM2HMQoa0VsHOa7lOdYt5nNUNhFiu0Qnu2/Z8t3GbLgSqqOCN3rFUel
 vC8iF8zUaiO8HgGEeuM+gRE7ZkLXWSg98xo+efB0A0VCEHCk3U3m6CGG/ayGpVlZtISZXa+l808
 4C1h94xXu9ajAxFFRIKRsr2DemVtJMmpG8bQyTZKrxGy/otQ0jczkYY7fusKe/uMpiVvoJvLrAu
 opLOftH0kLcleHpiNL1mp5HU1qqcishRcrZrW/T+Ud8GqJ69lgED2cGP9QX9XSGNvsOx5HUOn/j
 2q8/RwltyqNE4WAMZdZKV3FMANcxoA6GO01vGwR3O/RqRVwU90IX3/n6R45KrkLJA3TIKQwGDiF
 8tVdjAAcgDPQf5MRhK5J8LxUi7VxtbFyXgp5XRdjkFcRUJRQELIFpAKefK55JACbcH48/pZNVUx
 tm5TTJUd/CyMRnyYEufOrm94X6z0/gh1HI+vszkSpwEWnZywOTfpkOFzWwtZSK0fz7f6qE5QTz7
 OQIeaRCQnSdIlag==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in enabling power domain support in the driver, we'll
split the device match data and runtime data structures into their
general and power-management-specific parts. To allow that: first wrap
the emac driver data in another layer which will later be expanded.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 51 ++++++++++++++++------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8493131ca32f5c6ca7e1654da0bbf4ffa1eefa4e..9cafe101049d5412d649b3beaca350c497ffc981 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -97,6 +97,10 @@ struct ethqos_emac_driver_data {
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_match_data {
+	const struct ethqos_emac_driver_data *drv_data;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -214,6 +218,10 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_qcs404_data = {
+	.drv_data = &emac_v2_3_0_data,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -230,6 +238,10 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_sm8150_data = {
+	.drv_data = &emac_v2_1_0_data,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -262,6 +274,10 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sc8280xp_data = {
+	.drv_data = &emac_v3_0_0_data,
+};
+
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -297,6 +313,10 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sa8775p_data = {
+	.drv_data = &emac_v4_0_0_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -750,7 +770,8 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	const struct ethqos_emac_driver_data *data;
+	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -801,13 +822,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->mac_base = stmmac_res.addr;
 
 	data = device_get_match_data(dev);
-	ethqos->por = data->por;
-	ethqos->num_por = data->num_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	drv_data = data->drv_data;
 
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
+	ethqos->por = drv_data->por;
+	ethqos->num_por = drv_data->num_por;
+	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
+	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
+	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
+
+	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");
@@ -835,14 +858,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
 	plat_dat->pmt = 1;
 	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
-	if (data->dma_addr_width)
-		plat_dat->host_dma_width = data->dma_addr_width;
+	if (drv_data->dma_addr_width)
+		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
@@ -857,10 +880,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
-	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
-	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
-	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
-	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
+	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
+	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
+	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);

-- 
2.51.0


