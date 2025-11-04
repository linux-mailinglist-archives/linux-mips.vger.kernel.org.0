Return-Path: <linux-mips+bounces-12031-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5561C31283
	for <lists+linux-mips@lfdr.de>; Tue, 04 Nov 2025 14:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C89B6427C42
	for <lists+linux-mips@lfdr.de>; Tue,  4 Nov 2025 13:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252C130171A;
	Tue,  4 Nov 2025 13:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eIQ4aQU4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93E9302167
	for <linux-mips@vger.kernel.org>; Tue,  4 Nov 2025 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762261788; cv=none; b=GTo4R10v2I6dL9kqzNBeJa75p21/gt+Dl/vNP/4rWG1Mxm7gf9wdQVsRW+3XcM+vOqJxF5UquxpcM0Tt7nPZbjj0t5/56KWxG3mieQTSA7JQnSgwa5FgbGNbG8Arwrtzzu/LI1IWJWjgEORk3lFS4vU/am3kb1H0sJcxNnORRL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762261788; c=relaxed/simple;
	bh=BTzIyLnQ2pVcjPzl4+AQTmQgi4C/R6FPWEbJ7GZ3dIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ppoB/12e/jGN9Yf85sGkzslK2O08sxbaUYVa3BUZDz2sw02bBBXzDOvi+SnwPwuWxk59ND9dZyXMbHwE13koSAAOqu0jy67OGyUxy5wgyYxDU3pxPQV8arGhrpqNqc/3GrzbJXEx7y8oBWHf0hfCFyvXLF22pzfxM0zWaLRyBtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eIQ4aQU4; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so3542533f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 04 Nov 2025 05:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762261783; x=1762866583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7G2ramQk2hxdGs1tmlSj6o/OfknwFPaFfxdjJIosVo=;
        b=eIQ4aQU4lrDt7RuL1IxOlCZkG2kQ47xUb2Qx2IvOxMr1gZlPTRY11Hos5FwOEJHlU5
         y30WLzAT+r+4uLcs2+Njng0KcBdoH3ZfjvriegoQHbEtV/Xwb9HvoubS3p9YRs50LP0I
         X7LAthXbZbzEwfUEEvUSPKoEULbgGIEQe+yFYCEAY+pY2m7eDLdhhunM+yZ3yMx/6PEe
         87h6Fm2eHQ72KIFvsCZu14nra2ku2z7975B2Hc7EpaFdNCg9vIlYFw9snkXNA8OokkYB
         mnn8xocdNonkrKcihsN/eeQ/qARef1MNVFuNYXQmsUrZtiyAYsGWMuFKIhdI6vghnO1H
         0Xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261783; x=1762866583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7G2ramQk2hxdGs1tmlSj6o/OfknwFPaFfxdjJIosVo=;
        b=FK9yc16RevoLEEpdIamUbBo/9wQEsjhUlMb65qZTSOK6OZ7sXbuPF+9lQ9WNMyW8/p
         3Rt30BZB38s3mFpxBsyXZtDG91hMyZc1Qn6oSty84DnmAwi+U9ZHFybI/G4IY4Cu543T
         JBywpaTszIxjk/icQ20fVZcpGLtD0Ku2oSUzgbrR7EUL4r87+tPr9q3dW2/1b5Bj1o6G
         vmITAACDhD5RUtmPd4EfGMtB4+q/a8vkiYopRXQFzMudAEpxfvaGT/qwbBUacZ+gXDfm
         LQYlIhr7lJh6KTAviIGtjtk2ugA9pX/lTQsF0GFcZHisFD6fh8fXfFkvgx+jEBC5hcL2
         NGIg==
X-Forwarded-Encrypted: i=1; AJvYcCXocuR+o/EEHVm5p1aOOFqk6xV6GkVlo4C/gJWxY3q0WHL6vuPD1VEBXtw0XQ3TYIkM/+BzPJNqGrqw@vger.kernel.org
X-Gm-Message-State: AOJu0YxBy802tynU0oCZSb+4Rko804QBszp74me4UhKPzNFPEJgTXmKl
	fBQbGVIU37wrQz3LmEVeYmJfCaFnQDO2WG3AtbyHV6wIxZLl4AiPWYk7S2HVty5Bdk8=
X-Gm-Gg: ASbGncvkwCwc7R6nPxDCxWkNNWh4sQCCLD0h+7VwgKtR1W99oV+/eTxXivaKtmKBUBh
	zsVQtEIY9l459LDlsrHGXpfC+PTQNL7e33EoPjFqK+0qjfjMaiMXZ3aNT6phBjSTkIEwAPHKNyN
	3MgH60tR6ADa4ORsusCjCJicWmA4T7BeRl8v/+0D1n8jCyydPJ3nb0yiXPP2UksG80DzgudNU2m
	XeG0J7kPx+NBEG8RO+h2+36o1YA5vpERK4JXoR/sSmi2bfeaj8wxLcvPq2zo17BYK8aihB7WogD
	mtDkI/r5rtoMigycck50O6lwN48NPRE+2KC29LyPSNnYQ2dXm89vZWCxjsd7mWAqK4RBGo4SUp9
	mMhUNwe3YKXMhf1wQmRy8A3rdljSinT07a9IN+On3EKc8FlWik/Bvs6QPnalpLb9bZv0Klg==
X-Google-Smtp-Source: AGHT+IGt39/RFIYRQsWApaQS4QlJBSyR/bfENK9HcdGp1Eg6T4YSk8jvmlZ1WO8dgmB5bkvcm4+SQA==
X-Received: by 2002:a05:6000:26cf:b0:429:c6a7:4cdc with SMTP id ffacd0b85a97d-429c6a74ff1mr11008945f8f.50.1762261782582;
        Tue, 04 Nov 2025 05:09:42 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9ea1:7ab7:4748:cae3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc18efd3sm4554431f8f.5.2025.11.04.05.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:09:39 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 04 Nov 2025 14:08:58 +0100
Subject: [PATCH v4 7/8] net: stmmac: qcom-ethqos: define a callback for
 setting the serdes speed
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-qcom-sa8255p-emac-v4-7-f76660087cea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Yczz6nmRkpIoGqMAKNVvyF3zmCEkrzboH4PyVFVc9jM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCfrucVA2CeMFxPGfABXbkXXyqSC5jmN8LI8mD
 yCNOJ0bLhOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQn67gAKCRARpy6gFHHX
 ciBqD/0XNJFi5uHJB6d9F1X9w/Akoe2fxdrPp29/FzIfuLlu4+eNY+P8ZHWXvGT21CWTBHzyLRu
 e0CXNLnV1f4a1wGZEvwBVVfisgS/M5avHcSEdAfYOIYk0DcbJfKIrYhpJprz/82G+ujPgLdl/kn
 TaYBe32VUyJHFGX0s+6ZMEQZDKgAQ2R73og7Zw/AckjDePp2xiiEb11GU8ckU6wwQtG0GEURGh5
 TFXn2h7JLMGoElSLJlJFYz/1ZBC9CQqcX8WPjpHcIOHDClY5dmoMJ0E/A/nsdOVC+1eS4HwkZtf
 hy9I8tBtPs/FIb4xoVM5zQbLtNu5pfkWYl0IL/lcMyRYfV51YrMG+As1VTo0lemfPcVLtf75muB
 sthcpgvGIFJ8q3uxmA6DmoCAA9zeUYYSOpR8Uv182IqbYfaAnhLGu/XIuLcivlPoi3eFqMWCSq9
 nTgIrvu5OVCSrQ7GXx6POR0ysJ1GJa7axDRNaThJUimC07hyobjKOtejPjjH6MC5zAeIOgAZXA6
 WdPsoVGTqwtOeotmc2KOOZQnWeEPyo//Hd33noVu8pQBWmSLyXgsa3uIpmDbkeJP/bRuUA5BfNp
 0D78mPjyDVvKS3gSyXyjG1KXrnjeuov9V3NvOVzkiMghcYQTB9IMUjf//vqgCNmlotmEnX2mptx
 QZ5kuabKK8e7LFQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of adding support for firmware driven power management, let's
allow different ways of setting the PHY speed. To that end create a
callback with a single implementation for now, that will be extended
later.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 09f122062dec87aa11804af2769ddff4964e6596..446f06b591a0b70992c7a431b56cf88c1b6718fd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -120,6 +120,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -640,11 +641,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
+{
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
+		ethqos->set_serdes_speed(ethqos);
 	}
 }
 
@@ -865,6 +871,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.51.0


