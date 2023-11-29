Return-Path: <linux-mips+bounces-364-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C347FDC57
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 17:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A252B20D7D
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 16:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890F13A26D;
	Wed, 29 Nov 2023 16:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="agx7eKqm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A94BF;
	Wed, 29 Nov 2023 08:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701274512; x=1732810512;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dkKQwOmPwkq7+I2jTCgB+WEwrRWIZFNvs71QGtDYw+o=;
  b=agx7eKqmQBwKsJvOA8+mFsFr+D3/U54LXU1ZnXrAV3Foj+xADqsu3ptr
   LRW3CVdlJ074KH4T/8ZcEmN2WrCdXn1gSFQzGTsa4JlhvE5/52dzfgRId
   WG3obAaNPCQGr7mA3yc9cMp347XbAIcU+Oa3RvUzS4+NJe7uEKlWfauMF
   /d+Vncox3ykG34aLSwkVPhw8vM63DO3/xcX3z0Sevm7UhYHyBQ9029zvi
   fex7uHeoFHnpqj3JGCG2m+aE72xIewLZ56U/a7zXbM+Qvdgru4HZ+nGQU
   p/rqlj0lBEphH4q/AS+BO5RJXjSRf3EZyYJF+LIx1y4xRPl+ulQ2jmsrT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373372477"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="373372477"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:15:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892498843"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="892498843"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 29 Nov 2023 08:15:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 41A0F79F; Wed, 29 Nov 2023 18:15:01 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v4 02/23] pinctrl: qcom: lpass-lpi: Remove unused member in struct lpi_pingroup
Date: Wed, 29 Nov 2023 18:06:25 +0200
Message-ID: <20231129161459.1002323-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The group is not used anywhere, remove it. And if needed, it should be
struct pingroup anyway.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h      |  4 ----
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   | 16 -------------
 .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 20 ----------------
 .../pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   | 20 ----------------
 .../pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 15 ------------
 .../pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c   | 16 -------------
 .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 24 -------------------
 .../pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 24 -------------------
 .../pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 24 -------------------
 9 files changed, 163 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
index 2017bc80314d..a9b2f65c1ebe 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
@@ -45,11 +45,8 @@ struct pinctrl_pin_desc;
 
 #define LPI_PINGROUP(id, soff, f1, f2, f3, f4)		\
 	{						\
-		.group.name = "gpio" #id,			\
-		.group.pins = gpio##id##_pins,		\
 		.pin = id,				\
 		.slew_offset = soff,			\
-		.group.num_pins = ARRAY_SIZE(gpio##id##_pins),	\
 		.funcs = (int[]){			\
 			LPI_MUX_gpio,			\
 			LPI_MUX_##f1,			\
@@ -67,7 +64,6 @@ struct pinctrl_pin_desc;
 #define LPI_FLAG_SLEW_RATE_SAME_REG			BIT(0)
 
 struct lpi_pingroup {
-	struct group_desc group;
 	unsigned int pin;
 	/* Bit offset in slew register for SoundWire pins only */
 	int slew_offset;
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index 99156217c6a5..6bb39812e1d8 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -36,22 +36,6 @@ enum lpass_lpi_functions {
 	LPI_MUX__,
 };
 
-static int gpio0_pins[] = { 0 };
-static int gpio1_pins[] = { 1 };
-static int gpio2_pins[] = { 2 };
-static int gpio3_pins[] = { 3 };
-static int gpio4_pins[] = { 4 };
-static int gpio5_pins[] = { 5 };
-static int gpio6_pins[] = { 6 };
-static int gpio7_pins[] = { 7 };
-static int gpio8_pins[] = { 8 };
-static int gpio9_pins[] = { 9 };
-static int gpio10_pins[] = { 10 };
-static int gpio11_pins[] = { 11 };
-static int gpio12_pins[] = { 12 };
-static int gpio13_pins[] = { 13 };
-static int gpio14_pins[] = { 14 };
-
 static const struct pinctrl_pin_desc sc7280_lpi_pins[] = {
 	PINCTRL_PIN(0, "gpio0"),
 	PINCTRL_PIN(1, "gpio1"),
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
index b33483056f42..c0369baf3398 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
@@ -45,26 +45,6 @@ enum lpass_lpi_functions {
 	LPI_MUX__,
 };
 
-static int gpio0_pins[] = { 0 };
-static int gpio1_pins[] = { 1 };
-static int gpio2_pins[] = { 2 };
-static int gpio3_pins[] = { 3 };
-static int gpio4_pins[] = { 4 };
-static int gpio5_pins[] = { 5 };
-static int gpio6_pins[] = { 6 };
-static int gpio7_pins[] = { 7 };
-static int gpio8_pins[] = { 8 };
-static int gpio9_pins[] = { 9 };
-static int gpio10_pins[] = { 10 };
-static int gpio11_pins[] = { 11 };
-static int gpio12_pins[] = { 12 };
-static int gpio13_pins[] = { 13 };
-static int gpio14_pins[] = { 14 };
-static int gpio15_pins[] = { 15 };
-static int gpio16_pins[] = { 16 };
-static int gpio17_pins[] = { 17 };
-static int gpio18_pins[] = { 18 };
-
 static const struct pinctrl_pin_desc sc8280xp_lpi_pins[] = {
 	PINCTRL_PIN(0, "gpio0"),
 	PINCTRL_PIN(1, "gpio1"),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
index e8a6f6f6af54..316d6fc69131 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
@@ -36,26 +36,6 @@ enum lpass_lpi_functions {
 	LPI_MUX__,
 };
 
-static int gpio0_pins[] = { 0 };
-static int gpio1_pins[] = { 1 };
-static int gpio2_pins[] = { 2 };
-static int gpio3_pins[] = { 3 };
-static int gpio4_pins[] = { 4 };
-static int gpio5_pins[] = { 5 };
-static int gpio6_pins[] = { 6 };
-static int gpio7_pins[] = { 7 };
-static int gpio8_pins[] = { 8 };
-static int gpio9_pins[] = { 9 };
-static int gpio10_pins[] = { 10 };
-static int gpio11_pins[] = { 11 };
-static int gpio12_pins[] = { 12 };
-static int gpio13_pins[] = { 13 };
-static int gpio14_pins[] = { 14 };
-static int gpio15_pins[] = { 15 };
-static int gpio16_pins[] = { 16 };
-static int gpio17_pins[] = { 17 };
-static int gpio18_pins[] = { 18 };
-
 static const struct pinctrl_pin_desc sm6115_lpi_pins[] = {
 	PINCTRL_PIN(0, "gpio0"),
 	PINCTRL_PIN(1, "gpio1"),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
index cb10ce8d5d28..9791d9ba5087 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
@@ -36,21 +36,6 @@ enum lpass_lpi_functions {
 	LPI_MUX__,
 };
 
-static int gpio0_pins[] = { 0 };
-static int gpio1_pins[] = { 1 };
-static int gpio2_pins[] = { 2 };
-static int gpio3_pins[] = { 3 };
-static int gpio4_pins[] = { 4 };
-static int gpio5_pins[] = { 5 };
-static int gpio6_pins[] = { 6 };
-static int gpio7_pins[] = { 7 };
-static int gpio8_pins[] = { 8 };
-static int gpio9_pins[] = { 9 };
-static int gpio10_pins[] = { 10 };
-static int gpio11_pins[] = { 11 };
-static int gpio12_pins[] = { 12 };
-static int gpio13_pins[] = { 13 };
-
 static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
 	PINCTRL_PIN(0, "gpio0"),
 	PINCTRL_PIN(1, "gpio1"),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c
index 297cc95ac3c0..5b9a2cb216bd 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c
@@ -36,22 +36,6 @@ enum lpass_lpi_functions {
 	LPI_MUX__,
 };
 
-static int gpio0_pins[] = { 0 };
-static int gpio1_pins[] = { 1 };
-static int gpio2_pins[] = { 2 };
-static int gpio3_pins[] = { 3 };
-static int gpio4_pins[] = { 4 };
-static int gpio5_pins[] = { 5 };
-static int gpio6_pins[] = { 6 };
-static int gpio7_pins[] = { 7 };
-static int gpio8_pins[] = { 8 };
-static int gpio9_pins[] = { 9 };
-static int gpio10_pins[] = { 10 };
-static int gpio11_pins[] = { 11 };
-static int gpio12_pins[] = { 12 };
-static int gpio13_pins[] = { 13 };
-static int gpio14_pins[] = { 14 };
-
 static const struct pinctrl_pin_desc sm8350_lpi_pins[] = {
 	PINCTRL_PIN(0, "gpio0"),
 	PINCTRL_PIN(1, "gpio1"),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
index 2e7896791fc0..a028cbb49947 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
@@ -52,30 +52,6 @@ enum lpass_lpi_functions {
 	LPI_MUX__,
 };
 
-static int gpio0_pins[] = { 0 };
-static int gpio1_pins[] = { 1 };
-static int gpio2_pins[] = { 2 };
-static int gpio3_pins[] = { 3 };
-static int gpio4_pins[] = { 4 };
-static int gpio5_pins[] = { 5 };
-static int gpio6_pins[] = { 6 };
-static int gpio7_pins[] = { 7 };
-static int gpio8_pins[] = { 8 };
-static int gpio9_pins[] = { 9 };
-static int gpio10_pins[] = { 10 };
-static int gpio11_pins[] = { 11 };
-static int gpio12_pins[] = { 12 };
-static int gpio13_pins[] = { 13 };
-static int gpio14_pins[] = { 14 };
-static int gpio15_pins[] = { 15 };
-static int gpio16_pins[] = { 16 };
-static int gpio17_pins[] = { 17 };
-static int gpio18_pins[] = { 18 };
-static int gpio19_pins[] = { 19 };
-static int gpio20_pins[] = { 20 };
-static int gpio21_pins[] = { 21 };
-static int gpio22_pins[] = { 22 };
-
 static const struct pinctrl_pin_desc sm8450_lpi_pins[] = {
 	PINCTRL_PIN(0, "gpio0"),
 	PINCTRL_PIN(1, "gpio1"),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
index 64458c3fbe5e..852192b044e1 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
@@ -52,30 +52,6 @@ enum lpass_lpi_functions {
 	LPI_MUX__,
 };
 
-static int gpio0_pins[] = { 0 };
-static int gpio1_pins[] = { 1 };
-static int gpio2_pins[] = { 2 };
-static int gpio3_pins[] = { 3 };
-static int gpio4_pins[] = { 4 };
-static int gpio5_pins[] = { 5 };
-static int gpio6_pins[] = { 6 };
-static int gpio7_pins[] = { 7 };
-static int gpio8_pins[] = { 8 };
-static int gpio9_pins[] = { 9 };
-static int gpio10_pins[] = { 10 };
-static int gpio11_pins[] = { 11 };
-static int gpio12_pins[] = { 12 };
-static int gpio13_pins[] = { 13 };
-static int gpio14_pins[] = { 14 };
-static int gpio15_pins[] = { 15 };
-static int gpio16_pins[] = { 16 };
-static int gpio17_pins[] = { 17 };
-static int gpio18_pins[] = { 18 };
-static int gpio19_pins[] = { 19 };
-static int gpio20_pins[] = { 20 };
-static int gpio21_pins[] = { 21 };
-static int gpio22_pins[] = { 22 };
-
 static const struct pinctrl_pin_desc sm8550_lpi_pins[] = {
 	PINCTRL_PIN(0, "gpio0"),
 	PINCTRL_PIN(1, "gpio1"),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
index 6e4be91ff085..04400c832327 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
@@ -54,30 +54,6 @@ enum lpass_lpi_functions {
 	LPI_MUX__,
 };
 
-static int gpio0_pins[] = { 0 };
-static int gpio1_pins[] = { 1 };
-static int gpio2_pins[] = { 2 };
-static int gpio3_pins[] = { 3 };
-static int gpio4_pins[] = { 4 };
-static int gpio5_pins[] = { 5 };
-static int gpio6_pins[] = { 6 };
-static int gpio7_pins[] = { 7 };
-static int gpio8_pins[] = { 8 };
-static int gpio9_pins[] = { 9 };
-static int gpio10_pins[] = { 10 };
-static int gpio11_pins[] = { 11 };
-static int gpio12_pins[] = { 12 };
-static int gpio13_pins[] = { 13 };
-static int gpio14_pins[] = { 14 };
-static int gpio15_pins[] = { 15 };
-static int gpio16_pins[] = { 16 };
-static int gpio17_pins[] = { 17 };
-static int gpio18_pins[] = { 18 };
-static int gpio19_pins[] = { 19 };
-static int gpio20_pins[] = { 20 };
-static int gpio21_pins[] = { 21 };
-static int gpio22_pins[] = { 22 };
-
 static const struct pinctrl_pin_desc sm8650_lpi_pins[] = {
 	PINCTRL_PIN(0, "gpio0"),
 	PINCTRL_PIN(1, "gpio1"),
-- 
2.43.0.rc1.1.gbec44491f096


