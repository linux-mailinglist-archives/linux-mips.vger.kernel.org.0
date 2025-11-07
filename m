Return-Path: <linux-mips+bounces-12107-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41556C3F845
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 11:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9CF374F20E3
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 10:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CEDC31D748;
	Fri,  7 Nov 2025 10:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="r8IX/zLU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20A031B108
	for <linux-mips@vger.kernel.org>; Fri,  7 Nov 2025 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511425; cv=none; b=GnBvUGhF2cT/KLCRhNof320+eLgTlJhuZ0GwEIw/gL7Qd+GHWZHsQZDMP1fWCmYIruASpnv77ImPR1CWytXG60DpoOr495HitsnsKCHdDpxEKrxBx/MidqPR6dolha1floZ7B8zFHidcHRKDCQxzKglc78GoeOtnfM79tLVkxB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511425; c=relaxed/simple;
	bh=C6E2nfuOJyT6zEzejZLhVEYSKPR67hQomXuzQ9//N0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BM5AZ25vX8ZGF4+Yvau21FL+1dgefKWo0OiHZbJz2n3BqHA3NacVA2uXp9PgQTNosiDDscsOz4+X6DUgYdTfpW9yu5WdKLTQaHx+ZmDFssVP76CBqLwuWi7UUK8tKPNvvsbyL0FFFY3XlIoVF7+dE02AeS/Mg1NMNYHCbV/ojyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=r8IX/zLU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4775895d69cso2734015e9.0
        for <linux-mips@vger.kernel.org>; Fri, 07 Nov 2025 02:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511420; x=1763116220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohz6eJ3JY6PCTOt6pOm4PJLek87cyeexjL7soGZmZnQ=;
        b=r8IX/zLU0rA5/PEaWR9R9f8AEBbtH0YE0CscYpqxYnvX6wqn/B8PCY1YwWgV4IedYV
         dgMJEX+OvWL6YNylKU/YB02iTsh/8Ncx8CiWZKY/2DXasHtDIq5n1U5EhO4GY3fcg7yi
         R/i+aPUAe8eJVHp+i0bwLjkU4vxhAGL3QkigXlsCyl3bzog2hJtCLmDZIwnnwaLaxCyD
         YL1TMKZlpm/vZhixZiaGGkrXp/i0NuUq7kOglWKUugGJ2XCALx39m0k6qM2g8cF/T3xc
         WOtwhyQ26V8NhS6CUYeSA3axdaWX/VBxTYS9TJDzHeggWnKYZc9pSiIe+3TyxzIprMmj
         uREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511420; x=1763116220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ohz6eJ3JY6PCTOt6pOm4PJLek87cyeexjL7soGZmZnQ=;
        b=sTTZ0N9jeSxmMwd3Yft+OO1azc+Vksj2yG4gURu8u5TF+S/i8ewuq/KNYvl65+gwfu
         yG3gwTTLrzBHsaGItjdDOj6QoeqzNADyjBnc/bWJSjzdsyIoy1W3R96Lk3N1FH/yXTqo
         sDrlTusvFpiFjjQSJiMDmAfQtwAOSG00S3cXAEa9QooS9XL7rQ9FCRSLyRSHNt8EpQsq
         1yGUfy1H5J8kGSfxSWi8OcU5AvuHhAyLdY827qGSfEapGgCOX5SNutpIC5M51hxiwozg
         XhyGCQ1IOCmocu0G0XBqSajR+BVEhKUaeoRvjzNWJKqN1XdiUU86iwyMFhXbHUNa8p8E
         SIng==
X-Forwarded-Encrypted: i=1; AJvYcCXQOQ7B6JA6eaMgWzwTPlJfvKq6c8aG60ZVS7xAJGfL7Upm+V5J4HOOEHSFhy9nhncvFigF+sAwdBsK@vger.kernel.org
X-Gm-Message-State: AOJu0YwAnysaMBEWWHPq/6lRlsJcghucASAL+F7X8Zb5KaO5fB9MoOF1
	fdwCaH3ivVD0e7fhZcjV3cWw5DiveLn8ky6mEvwCn6znWuKIxpjov7TVLN+FDxKKLMU=
X-Gm-Gg: ASbGncvF9wR44aIy1gQw9l/t3URR25NpnPhrTNddMFlaj+WLSQgp5IMKwm2WLyiC1j+
	qul/ofIMcsJESK7tvArVeWc+urQO61eeYjKcx4SHMYYQyLYHg5a2+YN2/LAk3AzgBdeklVHOCZQ
	p+KOSWJyt+XaZiEAdmXVlR7Db2MNvCy7zoNimxCJ1zCxBmnEXpyWasH1Yt3X00KP1ZQmpXUi/jP
	RMgTsgWenoTfU3iP2trYKhlxge37pjH5nHjmtxmsxO9GLQh5E3KLP+vZ1XMjSy5sKysr/ivQ05A
	RNVraCEKnvW/5hlR/XZLWe6rurlqMHMPEF1PhiAZyN/3W2zf8oW251rbCFYRiIHbPpaMB+Vsa0a
	1SSMOJvF/PlIyFDX68ZL2HLBavLmnhLi6Y1oF1eAgFMUV0Ry0watPHxWddVxIuXekonke
X-Google-Smtp-Source: AGHT+IFKea4oH8KFgwyHaSc2l6blpKP8GuUwPAJgJx/KeJrPkBTKpHrnLvxgE6v/f0QnXtYHee9P1g==
X-Received: by 2002:a05:600c:4fd0:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-4776bc8654cmr24454425e9.4.1762511419489;
        Fri, 07 Nov 2025 02:30:19 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm4414864f8f.39.2025.11.07.02.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:30:17 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 07 Nov 2025 11:29:55 +0100
Subject: [PATCH v5 5/8] net: stmmac: qcom-ethqos: split power management
 fields into a separate structure
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcom-sa8255p-emac-v5-5-01d3e3aaf388@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3440;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GhJny0rrOhbWO9GcfNfulcQ1HGUq/SGEEOh5ESB4E5E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDcooKW8Y7IR9mSClISDLeDYYhK8iNiIaH/TPy
 fxuwujaev6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQ3KKAAKCRARpy6gFHHX
 coQrD/4qTn+RVPw7hjcmgGU3/snDkcs3NDhDHvv/5Gw30fWDbq4JYVy7783sYOwPB85RJqY4S7e
 orJaF0tbCcwFjqBa5r8puEfO+0tE9C798uYzqB4byWlr6wBm4ZV6MDxHdHiFUueijk1GVKKDf6p
 g0vBL/7/QSHIP3uvzWFS0McUu8nUHMLyHlC4mDTBLNRh/CvqCrRhcCskFXvUwnq+mVRXz1wUxWz
 eDuRl3e2s3lfYQsM69iL9yBi0tU6BCfztIGXqBZZwjMcofQem0B48N8RmtBPROWrheeySK+WqZk
 OBM8gt2jphPBxF7VBTtiIk6NShAwzwpC4LOeJNfR7Iz4oMzbMZ1+sr+95ubeQz3fiF83h920czl
 MJwT3u6C5W6fr5f4J/BTXhnb2QIiyRdoOk2UI8S3GwfBO2JW8PjAMexz4jvF1bo1Y08k6rUB30B
 WQe+j+4ipBuswROPqGlXNHuAuYh0Ctt53cyQNyXmx2rv1Wz5rFkVXEI2ponYkRGvYXmUGdjCRCo
 EvX51dwNUgROqZCbihmyIjeymPgPQWSJnm27ZMUAE/b9wYySNcBPLTPheqUICJIZ4O+Gr8QFVWK
 TVRxJAFi0n4SyszGjUpLKWarMWT+htsRLk6A8LGgEbPjOumLm7HeK2SO6eVB8sCZ8rWG4snO4ZZ
 6c8vSYyDBZkk7jg==
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


