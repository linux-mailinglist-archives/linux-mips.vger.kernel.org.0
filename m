Return-Path: <linux-mips+bounces-12029-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E468C31271
	for <lists+linux-mips@lfdr.de>; Tue, 04 Nov 2025 14:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0CDD54F7535
	for <lists+linux-mips@lfdr.de>; Tue,  4 Nov 2025 13:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341CB2FBE17;
	Tue,  4 Nov 2025 13:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JA0NsdHg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA8C2FB993
	for <linux-mips@vger.kernel.org>; Tue,  4 Nov 2025 13:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762261778; cv=none; b=eswuyJ/SVCXSYPkE4kVKi9qqvMLrTWV2eUN7RrFILic7/wx2OkAjR7h+qAuNgTo0e/ULtfqAUwER0i6A7dTNW8+O3nHKboKMGox+TXrPzKKi7jvYbfZNW0ufOMBlzCWI8TNJ5ceW1GJNaZf9DKIPN8C0Dxnn2paGbYCZHlSoCGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762261778; c=relaxed/simple;
	bh=C6E2nfuOJyT6zEzejZLhVEYSKPR67hQomXuzQ9//N0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E+ZC2cE/Ww1RjO3LOmtKOXyZpbqMS8yYijSF0Iws9H5GvO2WlpEoipDSMLk+an694anTHGzoaOzmwRz0HNQZyUUH52+WyXpJGBOIE8FPnH6pvIA8Dedn7Y7yvkfsM3zhkXgA0k9Revh8Vtbh4/akP4QAKfJANEeK6MygYVmfW80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JA0NsdHg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47756a07b34so2845865e9.2
        for <linux-mips@vger.kernel.org>; Tue, 04 Nov 2025 05:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762261773; x=1762866573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohz6eJ3JY6PCTOt6pOm4PJLek87cyeexjL7soGZmZnQ=;
        b=JA0NsdHgym0ynAqOaWRsupm5z6khZXEtU9LTAQlmNJC5mFiRiMQ4yn85KVpVsHlLAC
         51SKkZwX64Lbj1k6CJPckAuYlbOMH6f3gouaLa4Ep7b55fduDvbWIhEhJglKBaoNeoex
         f2Kkod1f5BnWttoIKOo/Ptr8tnbfVbn55CLzsExyCrjNVz4Q0cxlYypdm9gIXSW6c8R7
         JBOviS/SHlG9xSaKWm59zbg7YlIRXMnoH14KviaL9izgwVfwTWH4D/ZMdogxOgESfZ74
         MeoI9nt0ZooxPkaWTkaUn7L0ZhK8tDazbu60HJ5b/TkKAk6/0ozke/95ghBQP8XGNRkv
         8BgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261773; x=1762866573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohz6eJ3JY6PCTOt6pOm4PJLek87cyeexjL7soGZmZnQ=;
        b=lS5t6NZHtRaclbAT6KfRrhHoCXSwsEOV8h8L1YjS399kIrAjzYOgbCt1MnAtkKRoxJ
         eRAxw9qMrV/GU0yeqYkhRfkM4e7jzIcyP1RZuTxxHIx48v7gMmxhSAis9ejbpFsBRoE5
         NW8u4rs2nPq1967+4nsaRIJQTNu13A62FBCu4LqP1dJxn9Hfny6E+5jJD44bmc5H/ZSo
         9oX2PSOEgt1uQtJpmPAHpItw8m7oRtlgMdFTLkNm2H+cDjQZPvyzFDdb73VllqjhTa1C
         VY48tVw59WQ5X14xtH8ZZdYPbH/PjPwVr6OXGFxwiKF6c1iyYqvJIpQykGlp1fahTGm9
         gL8w==
X-Forwarded-Encrypted: i=1; AJvYcCXfybGXTOyN76lgpXTBTJY60Kx+62MigSJrddAJ+5Ci5AYvy7tCKDs26+ORb1ieQ8Azwzg3AIDFqK1f@vger.kernel.org
X-Gm-Message-State: AOJu0YwdTwAskl2YH/Aw7nJD2jJRelY3PrEjyV2r3+pefKep7rec9o7a
	R5UFz6/QGS5A1SgVkU2wyHhJaT2KIimce0nJTiWK7bn1sXL/J6JYw1o3JDAOnU/vues=
X-Gm-Gg: ASbGncu1EfrkQp9tQ/l3vjcN6PE9VIZuitB//o4XmjUIXHEcuj1/oyt6BoWbTP/gIVT
	JFF/TnwmvtP+cRGh0oAHkOQpvbUWScYMc2ishww0D8za0NJjUqF87Y1J6iimj7c4w+8RploWgu2
	GD9uWttFXlH5mlVVswYDatCFqLbfBjlnVz4aG95/em6lcXT1KKb1btFd5B0woUu6hL5b7QqD9d3
	LEHQ7GHJEeNthD7wGTLnhvy8PcmnydMTmnT5gd/b4D4vhtx6K+ZrWjT/Dfz+We90GpUnbcf6NPY
	eyDDKf2dauMNblQaaoBCkk8vOyw7xdps/UG/74Hn/9G1a1viwwxV2H7Q9rqb4VxM8s+PZwCBQKu
	3pNtImS8gZ2m/LuQjdlR2DERtcsFG4TY2hh2j9QkcTHaAA/FDbnGejlSRfzSNUmR8/q85pA==
X-Google-Smtp-Source: AGHT+IHLeJTkz3Z9JUhRNQIdfiIz3zju/KKqwii1AcstjAWBhNyTLGOcii2tELicylV8dY7OWKqeQQ==
X-Received: by 2002:a05:600c:3485:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4773bfb51f8mr122528535e9.30.1762261773214;
        Tue, 04 Nov 2025 05:09:33 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9ea1:7ab7:4748:cae3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc18efd3sm4554431f8f.5.2025.11.04.05.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:09:29 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 04 Nov 2025 14:08:56 +0100
Subject: [PATCH v4 5/8] net: stmmac: qcom-ethqos: split power management
 fields into a separate structure
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-qcom-sa8255p-emac-v4-5-f76660087cea@linaro.org>
References: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
In-Reply-To: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3440;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GhJny0rrOhbWO9GcfNfulcQ1HGUq/SGEEOh5ESB4E5E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCfrt1PXYHKJt2IulJ2CyvGw0mRwafmetNOR2Y
 5zJmQ+uGwGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQn67QAKCRARpy6gFHHX
 crVLEADE2sKmE+cnYe6vd8MrSPmBXpfZ48+xv9duA0AFvw0Jl0TIVags+e1ih+VNlrPKVQkDN1E
 4hvIVk5690c3a7nxPof8XwbSvHgwyqCuAu9+rR2qjl3J010XvLAjdjJQBWKUQXOhLWDomWEEHNG
 mgCVEHSsM8vWjKT7puhWaGverUX8oMQ1aMQt8wHHcbw0YpWz7QEI8oAduybvItGU0SS2C3tLaH7
 Jd3Eab4GHdc1anBVlXj9a71lYduzL4icKt6e2gR3cn7pTAfGEeDU8K3aXwXYyiUKaMHlDPO3AsK
 Fr+ivt8c63rfdqbPTHNjeQLAf64hx+XfXcg4DvlUImNOjGESEoJiE0fxuMaz2citgMG246tCSYU
 C5uLvQbjLqchzLfNPDaA2QihiKOQmHRRkGKcqFqk5Xhw46XlYCItAnlkMKm71+2tkb+xswW9NAN
 iwi2Tba4S6v9um/tsCcXu4R2gRT46lYwFGNHj3ndHgtdafKm3jGsLmiEDYuX6n5HPZkxm/1qQCr
 HjlYxUxuRoFDhUZ7MxewBMebBxObzXfWGg01dynSHvIzFBogam2kDjrtSCOYxEiXq7ZdTExPbzK
 z+l9sZSchK0d1c8tZffhQ/6KlCSXT79aF5UfiQJj6KCvGC5x8i7+YLETdMQ//TKcwS11rR7IXeL
 MYJ/8y8lkrz6tPA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 9cafe101049d5412d649b3beaca350c497ffc981..1f00556bbad997e2ec76b521cffe2eb14fabb79e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -292,7 +296,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -313,8 +316,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -771,11 +779,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -823,6 +833,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -830,7 +843,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.51.0


