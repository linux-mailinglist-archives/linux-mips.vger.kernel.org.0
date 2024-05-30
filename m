Return-Path: <linux-mips+bounces-3405-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 045598D47D3
	for <lists+linux-mips@lfdr.de>; Thu, 30 May 2024 11:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 429EB1F23C1B
	for <lists+linux-mips@lfdr.de>; Thu, 30 May 2024 09:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B430A1C230D;
	Thu, 30 May 2024 08:58:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32F617C7B6
	for <linux-mips@vger.kernel.org>; Thu, 30 May 2024 08:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717059494; cv=none; b=Q4jNmVgnad6xPSHem2+loJA26TQgH9dJbIHx/t8AaB9T32lnkXVT1vgIW8CwdOU/Nub1Sp44d4oLZ32SrwKNIGvCJHYAb7C922F6fwGGjV3y5GfsZymWISatSAFWe4oTkpk0zu0Xv4GhPRMyoGVk0fd82pR13X+9gKPivhbm2HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717059494; c=relaxed/simple;
	bh=WkOuYAMRW7krM/huf0kW2OFWTAkOyrJOGL1DFh65LwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tgK1jr1hz5l1ESX79b8FsKvUKe4+942flM3GxJjimTgW0sZvh953bGFt7r8Bp3HqJDnoheelDsr39zK0RCfpqYxriEdH+2InrG+aSMPrR4D07glO6ENAg1TeOImDZZLEoeGhuPnOgXKqGooASYEt4Y4fy3fOef4o9K8aXKx0uSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id bb5f2be2-1e62-11ef-8d3e-005056bd6ce9;
	Thu, 30 May 2024 11:58:07 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 03/11] pinctrl: ingenic: Provide a helper macro INGENIC_PIN_FUNCTION()
Date: Thu, 30 May 2024 11:55:12 +0300
Message-ID: <20240530085745.1539925-4-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
References: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a helper macro to assign the struct function_desc entries.
This helps further refactoring.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 697 +++++++++++++++---------------
 1 file changed, 352 insertions(+), 345 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index bc6358a686fc..959b9ea83a66 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -94,6 +94,14 @@
 		.data = (void *)func,							\
 	}
 
+#define INGENIC_PIN_FUNCTION(_name_, id)							\
+	{											\
+		.name = _name_,									\
+		.group_names = id##_groups,							\
+		.num_group_names = ARRAY_SIZE(id##_groups),					\
+		.data = NULL,									\
+	}
+
 enum jz_version {
 	ID_JZ4730,
 	ID_JZ4740,
@@ -238,15 +246,15 @@ static const char *jz4730_pwm0_groups[] = { "pwm0", };
 static const char *jz4730_pwm1_groups[] = { "pwm1", };
 
 static const struct function_desc jz4730_functions[] = {
-	{ "mmc", jz4730_mmc_groups, ARRAY_SIZE(jz4730_mmc_groups), },
-	{ "uart0", jz4730_uart0_groups, ARRAY_SIZE(jz4730_uart0_groups), },
-	{ "uart1", jz4730_uart1_groups, ARRAY_SIZE(jz4730_uart1_groups), },
-	{ "uart2", jz4730_uart2_groups, ARRAY_SIZE(jz4730_uart2_groups), },
-	{ "uart3", jz4730_uart3_groups, ARRAY_SIZE(jz4730_uart3_groups), },
-	{ "lcd", jz4730_lcd_groups, ARRAY_SIZE(jz4730_lcd_groups), },
-	{ "nand", jz4730_nand_groups, ARRAY_SIZE(jz4730_nand_groups), },
-	{ "pwm0", jz4730_pwm0_groups, ARRAY_SIZE(jz4730_pwm0_groups), },
-	{ "pwm1", jz4730_pwm1_groups, ARRAY_SIZE(jz4730_pwm1_groups), },
+	INGENIC_PIN_FUNCTION("mmc", jz4730_mmc),
+	INGENIC_PIN_FUNCTION("uart0", jz4730_uart0),
+	INGENIC_PIN_FUNCTION("uart1", jz4730_uart1),
+	INGENIC_PIN_FUNCTION("uart2", jz4730_uart2),
+	INGENIC_PIN_FUNCTION("uart3", jz4730_uart3),
+	INGENIC_PIN_FUNCTION("lcd", jz4730_lcd),
+	INGENIC_PIN_FUNCTION("nand", jz4730_nand),
+	INGENIC_PIN_FUNCTION("pwm0", jz4730_pwm0),
+	INGENIC_PIN_FUNCTION("pwm1", jz4730_pwm1),
 };
 
 static const struct ingenic_chip_info jz4730_chip_info = {
@@ -343,19 +351,19 @@ static const char *jz4740_pwm6_groups[] = { "pwm6", };
 static const char *jz4740_pwm7_groups[] = { "pwm7", };
 
 static const struct function_desc jz4740_functions[] = {
-	{ "mmc", jz4740_mmc_groups, ARRAY_SIZE(jz4740_mmc_groups), },
-	{ "uart0", jz4740_uart0_groups, ARRAY_SIZE(jz4740_uart0_groups), },
-	{ "uart1", jz4740_uart1_groups, ARRAY_SIZE(jz4740_uart1_groups), },
-	{ "lcd", jz4740_lcd_groups, ARRAY_SIZE(jz4740_lcd_groups), },
-	{ "nand", jz4740_nand_groups, ARRAY_SIZE(jz4740_nand_groups), },
-	{ "pwm0", jz4740_pwm0_groups, ARRAY_SIZE(jz4740_pwm0_groups), },
-	{ "pwm1", jz4740_pwm1_groups, ARRAY_SIZE(jz4740_pwm1_groups), },
-	{ "pwm2", jz4740_pwm2_groups, ARRAY_SIZE(jz4740_pwm2_groups), },
-	{ "pwm3", jz4740_pwm3_groups, ARRAY_SIZE(jz4740_pwm3_groups), },
-	{ "pwm4", jz4740_pwm4_groups, ARRAY_SIZE(jz4740_pwm4_groups), },
-	{ "pwm5", jz4740_pwm5_groups, ARRAY_SIZE(jz4740_pwm5_groups), },
-	{ "pwm6", jz4740_pwm6_groups, ARRAY_SIZE(jz4740_pwm6_groups), },
-	{ "pwm7", jz4740_pwm7_groups, ARRAY_SIZE(jz4740_pwm7_groups), },
+	INGENIC_PIN_FUNCTION("mmc", jz4740_mmc),
+	INGENIC_PIN_FUNCTION("uart0", jz4740_uart0),
+	INGENIC_PIN_FUNCTION("uart1", jz4740_uart1),
+	INGENIC_PIN_FUNCTION("lcd", jz4740_lcd),
+	INGENIC_PIN_FUNCTION("nand", jz4740_nand),
+	INGENIC_PIN_FUNCTION("pwm0", jz4740_pwm0),
+	INGENIC_PIN_FUNCTION("pwm1", jz4740_pwm1),
+	INGENIC_PIN_FUNCTION("pwm2", jz4740_pwm2),
+	INGENIC_PIN_FUNCTION("pwm3", jz4740_pwm3),
+	INGENIC_PIN_FUNCTION("pwm4", jz4740_pwm4),
+	INGENIC_PIN_FUNCTION("pwm5", jz4740_pwm5),
+	INGENIC_PIN_FUNCTION("pwm6", jz4740_pwm6),
+	INGENIC_PIN_FUNCTION("pwm7", jz4740_pwm7),
 };
 
 static const struct ingenic_chip_info jz4740_chip_info = {
@@ -447,17 +455,17 @@ static const char *jz4725b_pwm4_groups[] = { "pwm4", };
 static const char *jz4725b_pwm5_groups[] = { "pwm5", };
 
 static const struct function_desc jz4725b_functions[] = {
-	{ "mmc0", jz4725b_mmc0_groups, ARRAY_SIZE(jz4725b_mmc0_groups), },
-	{ "mmc1", jz4725b_mmc1_groups, ARRAY_SIZE(jz4725b_mmc1_groups), },
-	{ "uart", jz4725b_uart_groups, ARRAY_SIZE(jz4725b_uart_groups), },
-	{ "nand", jz4725b_nand_groups, ARRAY_SIZE(jz4725b_nand_groups), },
-	{ "pwm0", jz4725b_pwm0_groups, ARRAY_SIZE(jz4725b_pwm0_groups), },
-	{ "pwm1", jz4725b_pwm1_groups, ARRAY_SIZE(jz4725b_pwm1_groups), },
-	{ "pwm2", jz4725b_pwm2_groups, ARRAY_SIZE(jz4725b_pwm2_groups), },
-	{ "pwm3", jz4725b_pwm3_groups, ARRAY_SIZE(jz4725b_pwm3_groups), },
-	{ "pwm4", jz4725b_pwm4_groups, ARRAY_SIZE(jz4725b_pwm4_groups), },
-	{ "pwm5", jz4725b_pwm5_groups, ARRAY_SIZE(jz4725b_pwm5_groups), },
-	{ "lcd", jz4725b_lcd_groups, ARRAY_SIZE(jz4725b_lcd_groups), },
+	INGENIC_PIN_FUNCTION("mmc0", jz4725b_mmc0),
+	INGENIC_PIN_FUNCTION("mmc1", jz4725b_mmc1),
+	INGENIC_PIN_FUNCTION("uart", jz4725b_uart),
+	INGENIC_PIN_FUNCTION("nand", jz4725b_nand),
+	INGENIC_PIN_FUNCTION("pwm0", jz4725b_pwm0),
+	INGENIC_PIN_FUNCTION("pwm1", jz4725b_pwm1),
+	INGENIC_PIN_FUNCTION("pwm2", jz4725b_pwm2),
+	INGENIC_PIN_FUNCTION("pwm3", jz4725b_pwm3),
+	INGENIC_PIN_FUNCTION("pwm4", jz4725b_pwm4),
+	INGENIC_PIN_FUNCTION("pwm5", jz4725b_pwm5),
+	INGENIC_PIN_FUNCTION("lcd", jz4725b_lcd),
 };
 
 static const struct ingenic_chip_info jz4725b_chip_info = {
@@ -579,22 +587,22 @@ static const char *jz4750_pwm4_groups[] = { "pwm4", };
 static const char *jz4750_pwm5_groups[] = { "pwm5", };
 
 static const struct function_desc jz4750_functions[] = {
-	{ "uart0", jz4750_uart0_groups, ARRAY_SIZE(jz4750_uart0_groups), },
-	{ "uart1", jz4750_uart1_groups, ARRAY_SIZE(jz4750_uart1_groups), },
-	{ "uart2", jz4750_uart2_groups, ARRAY_SIZE(jz4750_uart2_groups), },
-	{ "uart3", jz4750_uart3_groups, ARRAY_SIZE(jz4750_uart3_groups), },
-	{ "mmc0", jz4750_mmc0_groups, ARRAY_SIZE(jz4750_mmc0_groups), },
-	{ "mmc1", jz4750_mmc1_groups, ARRAY_SIZE(jz4750_mmc1_groups), },
-	{ "i2c", jz4750_i2c_groups, ARRAY_SIZE(jz4750_i2c_groups), },
-	{ "cim", jz4750_cim_groups, ARRAY_SIZE(jz4750_cim_groups), },
-	{ "lcd", jz4750_lcd_groups, ARRAY_SIZE(jz4750_lcd_groups), },
-	{ "nand", jz4750_nand_groups, ARRAY_SIZE(jz4750_nand_groups), },
-	{ "pwm0", jz4750_pwm0_groups, ARRAY_SIZE(jz4750_pwm0_groups), },
-	{ "pwm1", jz4750_pwm1_groups, ARRAY_SIZE(jz4750_pwm1_groups), },
-	{ "pwm2", jz4750_pwm2_groups, ARRAY_SIZE(jz4750_pwm2_groups), },
-	{ "pwm3", jz4750_pwm3_groups, ARRAY_SIZE(jz4750_pwm3_groups), },
-	{ "pwm4", jz4750_pwm4_groups, ARRAY_SIZE(jz4750_pwm4_groups), },
-	{ "pwm5", jz4750_pwm5_groups, ARRAY_SIZE(jz4750_pwm5_groups), },
+	INGENIC_PIN_FUNCTION("uart0", jz4750_uart0),
+	INGENIC_PIN_FUNCTION("uart1", jz4750_uart1),
+	INGENIC_PIN_FUNCTION("uart2", jz4750_uart2),
+	INGENIC_PIN_FUNCTION("uart3", jz4750_uart3),
+	INGENIC_PIN_FUNCTION("mmc0", jz4750_mmc0),
+	INGENIC_PIN_FUNCTION("mmc1", jz4750_mmc1),
+	INGENIC_PIN_FUNCTION("i2c", jz4750_i2c),
+	INGENIC_PIN_FUNCTION("cim", jz4750_cim),
+	INGENIC_PIN_FUNCTION("lcd", jz4750_lcd),
+	INGENIC_PIN_FUNCTION("nand", jz4750_nand),
+	INGENIC_PIN_FUNCTION("pwm0", jz4750_pwm0),
+	INGENIC_PIN_FUNCTION("pwm1", jz4750_pwm1),
+	INGENIC_PIN_FUNCTION("pwm2", jz4750_pwm2),
+	INGENIC_PIN_FUNCTION("pwm3", jz4750_pwm3),
+	INGENIC_PIN_FUNCTION("pwm4", jz4750_pwm4),
+	INGENIC_PIN_FUNCTION("pwm5", jz4750_pwm5),
 };
 
 static const struct ingenic_chip_info jz4750_chip_info = {
@@ -744,22 +752,22 @@ static const char *jz4755_pwm4_groups[] = { "pwm4", };
 static const char *jz4755_pwm5_groups[] = { "pwm5", };
 
 static const struct function_desc jz4755_functions[] = {
-	{ "uart0", jz4755_uart0_groups, ARRAY_SIZE(jz4755_uart0_groups), },
-	{ "uart1", jz4755_uart1_groups, ARRAY_SIZE(jz4755_uart1_groups), },
-	{ "uart2", jz4755_uart2_groups, ARRAY_SIZE(jz4755_uart2_groups), },
-	{ "ssi", jz4755_ssi_groups, ARRAY_SIZE(jz4755_ssi_groups), },
-	{ "mmc0", jz4755_mmc0_groups, ARRAY_SIZE(jz4755_mmc0_groups), },
-	{ "mmc1", jz4755_mmc1_groups, ARRAY_SIZE(jz4755_mmc1_groups), },
-	{ "i2c", jz4755_i2c_groups, ARRAY_SIZE(jz4755_i2c_groups), },
-	{ "cim", jz4755_cim_groups, ARRAY_SIZE(jz4755_cim_groups), },
-	{ "lcd", jz4755_lcd_groups, ARRAY_SIZE(jz4755_lcd_groups), },
-	{ "nand", jz4755_nand_groups, ARRAY_SIZE(jz4755_nand_groups), },
-	{ "pwm0", jz4755_pwm0_groups, ARRAY_SIZE(jz4755_pwm0_groups), },
-	{ "pwm1", jz4755_pwm1_groups, ARRAY_SIZE(jz4755_pwm1_groups), },
-	{ "pwm2", jz4755_pwm2_groups, ARRAY_SIZE(jz4755_pwm2_groups), },
-	{ "pwm3", jz4755_pwm3_groups, ARRAY_SIZE(jz4755_pwm3_groups), },
-	{ "pwm4", jz4755_pwm4_groups, ARRAY_SIZE(jz4755_pwm4_groups), },
-	{ "pwm5", jz4755_pwm5_groups, ARRAY_SIZE(jz4755_pwm5_groups), },
+	INGENIC_PIN_FUNCTION("uart0", jz4755_uart0),
+	INGENIC_PIN_FUNCTION("uart1", jz4755_uart1),
+	INGENIC_PIN_FUNCTION("uart2", jz4755_uart2),
+	INGENIC_PIN_FUNCTION("ssi", jz4755_ssi),
+	INGENIC_PIN_FUNCTION("mmc0", jz4755_mmc0),
+	INGENIC_PIN_FUNCTION("mmc1", jz4755_mmc1),
+	INGENIC_PIN_FUNCTION("i2c", jz4755_i2c),
+	INGENIC_PIN_FUNCTION("cim", jz4755_cim),
+	INGENIC_PIN_FUNCTION("lcd", jz4755_lcd),
+	INGENIC_PIN_FUNCTION("nand", jz4755_nand),
+	INGENIC_PIN_FUNCTION("pwm0", jz4755_pwm0),
+	INGENIC_PIN_FUNCTION("pwm1", jz4755_pwm1),
+	INGENIC_PIN_FUNCTION("pwm2", jz4755_pwm2),
+	INGENIC_PIN_FUNCTION("pwm3", jz4755_pwm3),
+	INGENIC_PIN_FUNCTION("pwm4", jz4755_pwm4),
+	INGENIC_PIN_FUNCTION("pwm5", jz4755_pwm5),
 };
 
 static const struct ingenic_chip_info jz4755_chip_info = {
@@ -1079,35 +1087,35 @@ static const char *jz4760_pwm7_groups[] = { "pwm7", };
 static const char *jz4760_otg_groups[] = { "otg-vbus", };
 
 static const struct function_desc jz4760_functions[] = {
-	{ "uart0", jz4760_uart0_groups, ARRAY_SIZE(jz4760_uart0_groups), },
-	{ "uart1", jz4760_uart1_groups, ARRAY_SIZE(jz4760_uart1_groups), },
-	{ "uart2", jz4760_uart2_groups, ARRAY_SIZE(jz4760_uart2_groups), },
-	{ "uart3", jz4760_uart3_groups, ARRAY_SIZE(jz4760_uart3_groups), },
-	{ "ssi0", jz4760_ssi0_groups, ARRAY_SIZE(jz4760_ssi0_groups), },
-	{ "ssi1", jz4760_ssi1_groups, ARRAY_SIZE(jz4760_ssi1_groups), },
-	{ "mmc0", jz4760_mmc0_groups, ARRAY_SIZE(jz4760_mmc0_groups), },
-	{ "mmc1", jz4760_mmc1_groups, ARRAY_SIZE(jz4760_mmc1_groups), },
-	{ "mmc2", jz4760_mmc2_groups, ARRAY_SIZE(jz4760_mmc2_groups), },
-	{ "nemc", jz4760_nemc_groups, ARRAY_SIZE(jz4760_nemc_groups), },
-	{ "nemc-cs1", jz4760_cs1_groups, ARRAY_SIZE(jz4760_cs1_groups), },
-	{ "nemc-cs2", jz4760_cs2_groups, ARRAY_SIZE(jz4760_cs2_groups), },
-	{ "nemc-cs3", jz4760_cs3_groups, ARRAY_SIZE(jz4760_cs3_groups), },
-	{ "nemc-cs4", jz4760_cs4_groups, ARRAY_SIZE(jz4760_cs4_groups), },
-	{ "nemc-cs5", jz4760_cs5_groups, ARRAY_SIZE(jz4760_cs5_groups), },
-	{ "nemc-cs6", jz4760_cs6_groups, ARRAY_SIZE(jz4760_cs6_groups), },
-	{ "i2c0", jz4760_i2c0_groups, ARRAY_SIZE(jz4760_i2c0_groups), },
-	{ "i2c1", jz4760_i2c1_groups, ARRAY_SIZE(jz4760_i2c1_groups), },
-	{ "cim", jz4760_cim_groups, ARRAY_SIZE(jz4760_cim_groups), },
-	{ "lcd", jz4760_lcd_groups, ARRAY_SIZE(jz4760_lcd_groups), },
-	{ "pwm0", jz4760_pwm0_groups, ARRAY_SIZE(jz4760_pwm0_groups), },
-	{ "pwm1", jz4760_pwm1_groups, ARRAY_SIZE(jz4760_pwm1_groups), },
-	{ "pwm2", jz4760_pwm2_groups, ARRAY_SIZE(jz4760_pwm2_groups), },
-	{ "pwm3", jz4760_pwm3_groups, ARRAY_SIZE(jz4760_pwm3_groups), },
-	{ "pwm4", jz4760_pwm4_groups, ARRAY_SIZE(jz4760_pwm4_groups), },
-	{ "pwm5", jz4760_pwm5_groups, ARRAY_SIZE(jz4760_pwm5_groups), },
-	{ "pwm6", jz4760_pwm6_groups, ARRAY_SIZE(jz4760_pwm6_groups), },
-	{ "pwm7", jz4760_pwm7_groups, ARRAY_SIZE(jz4760_pwm7_groups), },
-	{ "otg", jz4760_otg_groups, ARRAY_SIZE(jz4760_otg_groups), },
+	INGENIC_PIN_FUNCTION("uart0", jz4760_uart0),
+	INGENIC_PIN_FUNCTION("uart1", jz4760_uart1),
+	INGENIC_PIN_FUNCTION("uart2", jz4760_uart2),
+	INGENIC_PIN_FUNCTION("uart3", jz4760_uart3),
+	INGENIC_PIN_FUNCTION("ssi0", jz4760_ssi0),
+	INGENIC_PIN_FUNCTION("ssi1", jz4760_ssi1),
+	INGENIC_PIN_FUNCTION("mmc0", jz4760_mmc0),
+	INGENIC_PIN_FUNCTION("mmc1", jz4760_mmc1),
+	INGENIC_PIN_FUNCTION("mmc2", jz4760_mmc2),
+	INGENIC_PIN_FUNCTION("nemc", jz4760_nemc),
+	INGENIC_PIN_FUNCTION("nemc-cs1", jz4760_cs1),
+	INGENIC_PIN_FUNCTION("nemc-cs2", jz4760_cs2),
+	INGENIC_PIN_FUNCTION("nemc-cs3", jz4760_cs3),
+	INGENIC_PIN_FUNCTION("nemc-cs4", jz4760_cs4),
+	INGENIC_PIN_FUNCTION("nemc-cs5", jz4760_cs5),
+	INGENIC_PIN_FUNCTION("nemc-cs6", jz4760_cs6),
+	INGENIC_PIN_FUNCTION("i2c0", jz4760_i2c0),
+	INGENIC_PIN_FUNCTION("i2c1", jz4760_i2c1),
+	INGENIC_PIN_FUNCTION("cim", jz4760_cim),
+	INGENIC_PIN_FUNCTION("lcd", jz4760_lcd),
+	INGENIC_PIN_FUNCTION("pwm0", jz4760_pwm0),
+	INGENIC_PIN_FUNCTION("pwm1", jz4760_pwm1),
+	INGENIC_PIN_FUNCTION("pwm2", jz4760_pwm2),
+	INGENIC_PIN_FUNCTION("pwm3", jz4760_pwm3),
+	INGENIC_PIN_FUNCTION("pwm4", jz4760_pwm4),
+	INGENIC_PIN_FUNCTION("pwm5", jz4760_pwm5),
+	INGENIC_PIN_FUNCTION("pwm6", jz4760_pwm6),
+	INGENIC_PIN_FUNCTION("pwm7", jz4760_pwm7),
+	INGENIC_PIN_FUNCTION("otg", jz4760_otg),
 };
 
 static const struct ingenic_chip_info jz4760_chip_info = {
@@ -1417,37 +1425,37 @@ static const char *jz4770_pwm7_groups[] = { "pwm7", };
 static const char *jz4770_mac_groups[] = { "mac-rmii", "mac-mii", };
 
 static const struct function_desc jz4770_functions[] = {
-	{ "uart0", jz4770_uart0_groups, ARRAY_SIZE(jz4770_uart0_groups), },
-	{ "uart1", jz4770_uart1_groups, ARRAY_SIZE(jz4770_uart1_groups), },
-	{ "uart2", jz4770_uart2_groups, ARRAY_SIZE(jz4770_uart2_groups), },
-	{ "uart3", jz4770_uart3_groups, ARRAY_SIZE(jz4770_uart3_groups), },
-	{ "ssi0", jz4770_ssi0_groups, ARRAY_SIZE(jz4770_ssi0_groups), },
-	{ "ssi1", jz4770_ssi1_groups, ARRAY_SIZE(jz4770_ssi1_groups), },
-	{ "mmc0", jz4770_mmc0_groups, ARRAY_SIZE(jz4770_mmc0_groups), },
-	{ "mmc1", jz4770_mmc1_groups, ARRAY_SIZE(jz4770_mmc1_groups), },
-	{ "mmc2", jz4770_mmc2_groups, ARRAY_SIZE(jz4770_mmc2_groups), },
-	{ "nemc", jz4770_nemc_groups, ARRAY_SIZE(jz4770_nemc_groups), },
-	{ "nemc-cs1", jz4770_cs1_groups, ARRAY_SIZE(jz4770_cs1_groups), },
-	{ "nemc-cs2", jz4770_cs2_groups, ARRAY_SIZE(jz4770_cs2_groups), },
-	{ "nemc-cs3", jz4770_cs3_groups, ARRAY_SIZE(jz4770_cs3_groups), },
-	{ "nemc-cs4", jz4770_cs4_groups, ARRAY_SIZE(jz4770_cs4_groups), },
-	{ "nemc-cs5", jz4770_cs5_groups, ARRAY_SIZE(jz4770_cs5_groups), },
-	{ "nemc-cs6", jz4770_cs6_groups, ARRAY_SIZE(jz4770_cs6_groups), },
-	{ "i2c0", jz4770_i2c0_groups, ARRAY_SIZE(jz4770_i2c0_groups), },
-	{ "i2c1", jz4770_i2c1_groups, ARRAY_SIZE(jz4770_i2c1_groups), },
-	{ "i2c2", jz4770_i2c2_groups, ARRAY_SIZE(jz4770_i2c2_groups), },
-	{ "cim", jz4770_cim_groups, ARRAY_SIZE(jz4770_cim_groups), },
-	{ "lcd", jz4770_lcd_groups, ARRAY_SIZE(jz4770_lcd_groups), },
-	{ "pwm0", jz4770_pwm0_groups, ARRAY_SIZE(jz4770_pwm0_groups), },
-	{ "pwm1", jz4770_pwm1_groups, ARRAY_SIZE(jz4770_pwm1_groups), },
-	{ "pwm2", jz4770_pwm2_groups, ARRAY_SIZE(jz4770_pwm2_groups), },
-	{ "pwm3", jz4770_pwm3_groups, ARRAY_SIZE(jz4770_pwm3_groups), },
-	{ "pwm4", jz4770_pwm4_groups, ARRAY_SIZE(jz4770_pwm4_groups), },
-	{ "pwm5", jz4770_pwm5_groups, ARRAY_SIZE(jz4770_pwm5_groups), },
-	{ "pwm6", jz4770_pwm6_groups, ARRAY_SIZE(jz4770_pwm6_groups), },
-	{ "pwm7", jz4770_pwm7_groups, ARRAY_SIZE(jz4770_pwm7_groups), },
-	{ "mac", jz4770_mac_groups, ARRAY_SIZE(jz4770_mac_groups), },
-	{ "otg", jz4760_otg_groups, ARRAY_SIZE(jz4760_otg_groups), },
+	INGENIC_PIN_FUNCTION("uart0", jz4770_uart0),
+	INGENIC_PIN_FUNCTION("uart1", jz4770_uart1),
+	INGENIC_PIN_FUNCTION("uart2", jz4770_uart2),
+	INGENIC_PIN_FUNCTION("uart3", jz4770_uart3),
+	INGENIC_PIN_FUNCTION("ssi0", jz4770_ssi0),
+	INGENIC_PIN_FUNCTION("ssi1", jz4770_ssi1),
+	INGENIC_PIN_FUNCTION("mmc0", jz4770_mmc0),
+	INGENIC_PIN_FUNCTION("mmc1", jz4770_mmc1),
+	INGENIC_PIN_FUNCTION("mmc2", jz4770_mmc2),
+	INGENIC_PIN_FUNCTION("nemc", jz4770_nemc),
+	INGENIC_PIN_FUNCTION("nemc-cs1", jz4770_cs1),
+	INGENIC_PIN_FUNCTION("nemc-cs2", jz4770_cs2),
+	INGENIC_PIN_FUNCTION("nemc-cs3", jz4770_cs3),
+	INGENIC_PIN_FUNCTION("nemc-cs4", jz4770_cs4),
+	INGENIC_PIN_FUNCTION("nemc-cs5", jz4770_cs5),
+	INGENIC_PIN_FUNCTION("nemc-cs6", jz4770_cs6),
+	INGENIC_PIN_FUNCTION("i2c0", jz4770_i2c0),
+	INGENIC_PIN_FUNCTION("i2c1", jz4770_i2c1),
+	INGENIC_PIN_FUNCTION("i2c2", jz4770_i2c2),
+	INGENIC_PIN_FUNCTION("cim", jz4770_cim),
+	INGENIC_PIN_FUNCTION("lcd", jz4770_lcd),
+	INGENIC_PIN_FUNCTION("pwm0", jz4770_pwm0),
+	INGENIC_PIN_FUNCTION("pwm1", jz4770_pwm1),
+	INGENIC_PIN_FUNCTION("pwm2", jz4770_pwm2),
+	INGENIC_PIN_FUNCTION("pwm3", jz4770_pwm3),
+	INGENIC_PIN_FUNCTION("pwm4", jz4770_pwm4),
+	INGENIC_PIN_FUNCTION("pwm5", jz4770_pwm5),
+	INGENIC_PIN_FUNCTION("pwm6", jz4770_pwm6),
+	INGENIC_PIN_FUNCTION("pwm7", jz4770_pwm7),
+	INGENIC_PIN_FUNCTION("mac", jz4770_mac),
+	INGENIC_PIN_FUNCTION("otg", jz4760_otg),
 };
 
 static const struct ingenic_chip_info jz4770_chip_info = {
@@ -1696,31 +1704,31 @@ static const char *jz4775_mac_groups[] = {
 static const char *jz4775_otg_groups[] = { "otg-vbus", };
 
 static const struct function_desc jz4775_functions[] = {
-	{ "uart0", jz4775_uart0_groups, ARRAY_SIZE(jz4775_uart0_groups), },
-	{ "uart1", jz4775_uart1_groups, ARRAY_SIZE(jz4775_uart1_groups), },
-	{ "uart2", jz4775_uart2_groups, ARRAY_SIZE(jz4775_uart2_groups), },
-	{ "uart3", jz4775_uart3_groups, ARRAY_SIZE(jz4775_uart3_groups), },
-	{ "ssi", jz4775_ssi_groups, ARRAY_SIZE(jz4775_ssi_groups), },
-	{ "mmc0", jz4775_mmc0_groups, ARRAY_SIZE(jz4775_mmc0_groups), },
-	{ "mmc1", jz4775_mmc1_groups, ARRAY_SIZE(jz4775_mmc1_groups), },
-	{ "mmc2", jz4775_mmc2_groups, ARRAY_SIZE(jz4775_mmc2_groups), },
-	{ "nemc", jz4775_nemc_groups, ARRAY_SIZE(jz4775_nemc_groups), },
-	{ "nemc-cs1", jz4775_cs1_groups, ARRAY_SIZE(jz4775_cs1_groups), },
-	{ "nemc-cs2", jz4775_cs2_groups, ARRAY_SIZE(jz4775_cs2_groups), },
-	{ "nemc-cs3", jz4775_cs3_groups, ARRAY_SIZE(jz4775_cs3_groups), },
-	{ "i2c0", jz4775_i2c0_groups, ARRAY_SIZE(jz4775_i2c0_groups), },
-	{ "i2c1", jz4775_i2c1_groups, ARRAY_SIZE(jz4775_i2c1_groups), },
-	{ "i2c2", jz4775_i2c2_groups, ARRAY_SIZE(jz4775_i2c2_groups), },
-	{ "i2s", jz4775_i2s_groups, ARRAY_SIZE(jz4775_i2s_groups), },
-	{ "dmic", jz4775_dmic_groups, ARRAY_SIZE(jz4775_dmic_groups), },
-	{ "cim", jz4775_cim_groups, ARRAY_SIZE(jz4775_cim_groups), },
-	{ "lcd", jz4775_lcd_groups, ARRAY_SIZE(jz4775_lcd_groups), },
-	{ "pwm0", jz4775_pwm0_groups, ARRAY_SIZE(jz4775_pwm0_groups), },
-	{ "pwm1", jz4775_pwm1_groups, ARRAY_SIZE(jz4775_pwm1_groups), },
-	{ "pwm2", jz4775_pwm2_groups, ARRAY_SIZE(jz4775_pwm2_groups), },
-	{ "pwm3", jz4775_pwm3_groups, ARRAY_SIZE(jz4775_pwm3_groups), },
-	{ "mac", jz4775_mac_groups, ARRAY_SIZE(jz4775_mac_groups), },
-	{ "otg", jz4775_otg_groups, ARRAY_SIZE(jz4775_otg_groups), },
+	INGENIC_PIN_FUNCTION("uart0", jz4775_uart0),
+	INGENIC_PIN_FUNCTION("uart1", jz4775_uart1),
+	INGENIC_PIN_FUNCTION("uart2", jz4775_uart2),
+	INGENIC_PIN_FUNCTION("uart3", jz4775_uart3),
+	INGENIC_PIN_FUNCTION("ssi", jz4775_ssi),
+	INGENIC_PIN_FUNCTION("mmc0", jz4775_mmc0),
+	INGENIC_PIN_FUNCTION("mmc1", jz4775_mmc1),
+	INGENIC_PIN_FUNCTION("mmc2", jz4775_mmc2),
+	INGENIC_PIN_FUNCTION("nemc", jz4775_nemc),
+	INGENIC_PIN_FUNCTION("nemc-cs1", jz4775_cs1),
+	INGENIC_PIN_FUNCTION("nemc-cs2", jz4775_cs2),
+	INGENIC_PIN_FUNCTION("nemc-cs3", jz4775_cs3),
+	INGENIC_PIN_FUNCTION("i2c0", jz4775_i2c0),
+	INGENIC_PIN_FUNCTION("i2c1", jz4775_i2c1),
+	INGENIC_PIN_FUNCTION("i2c2", jz4775_i2c2),
+	INGENIC_PIN_FUNCTION("i2s", jz4775_i2s),
+	INGENIC_PIN_FUNCTION("dmic", jz4775_dmic),
+	INGENIC_PIN_FUNCTION("cim", jz4775_cim),
+	INGENIC_PIN_FUNCTION("lcd", jz4775_lcd),
+	INGENIC_PIN_FUNCTION("pwm0", jz4775_pwm0),
+	INGENIC_PIN_FUNCTION("pwm1", jz4775_pwm1),
+	INGENIC_PIN_FUNCTION("pwm2", jz4775_pwm2),
+	INGENIC_PIN_FUNCTION("pwm3", jz4775_pwm3),
+	INGENIC_PIN_FUNCTION("mac", jz4775_mac),
+	INGENIC_PIN_FUNCTION("otg", jz4775_otg),
 };
 
 static const struct ingenic_chip_info jz4775_chip_info = {
@@ -1949,42 +1957,41 @@ static const char *jz4780_cim_groups[] = { "cim-data", };
 static const char *jz4780_hdmi_ddc_groups[] = { "hdmi-ddc", };
 
 static const struct function_desc jz4780_functions[] = {
-	{ "uart0", jz4770_uart0_groups, ARRAY_SIZE(jz4770_uart0_groups), },
-	{ "uart1", jz4770_uart1_groups, ARRAY_SIZE(jz4770_uart1_groups), },
-	{ "uart2", jz4780_uart2_groups, ARRAY_SIZE(jz4780_uart2_groups), },
-	{ "uart3", jz4770_uart3_groups, ARRAY_SIZE(jz4770_uart3_groups), },
-	{ "uart4", jz4780_uart4_groups, ARRAY_SIZE(jz4780_uart4_groups), },
-	{ "ssi0", jz4780_ssi0_groups, ARRAY_SIZE(jz4780_ssi0_groups), },
-	{ "ssi1", jz4780_ssi1_groups, ARRAY_SIZE(jz4780_ssi1_groups), },
-	{ "mmc0", jz4780_mmc0_groups, ARRAY_SIZE(jz4780_mmc0_groups), },
-	{ "mmc1", jz4780_mmc1_groups, ARRAY_SIZE(jz4780_mmc1_groups), },
-	{ "mmc2", jz4780_mmc2_groups, ARRAY_SIZE(jz4780_mmc2_groups), },
-	{ "nemc", jz4780_nemc_groups, ARRAY_SIZE(jz4780_nemc_groups), },
-	{ "nemc-cs1", jz4770_cs1_groups, ARRAY_SIZE(jz4770_cs1_groups), },
-	{ "nemc-cs2", jz4770_cs2_groups, ARRAY_SIZE(jz4770_cs2_groups), },
-	{ "nemc-cs3", jz4770_cs3_groups, ARRAY_SIZE(jz4770_cs3_groups), },
-	{ "nemc-cs4", jz4770_cs4_groups, ARRAY_SIZE(jz4770_cs4_groups), },
-	{ "nemc-cs5", jz4770_cs5_groups, ARRAY_SIZE(jz4770_cs5_groups), },
-	{ "nemc-cs6", jz4770_cs6_groups, ARRAY_SIZE(jz4770_cs6_groups), },
-	{ "i2c0", jz4770_i2c0_groups, ARRAY_SIZE(jz4770_i2c0_groups), },
-	{ "i2c1", jz4770_i2c1_groups, ARRAY_SIZE(jz4770_i2c1_groups), },
-	{ "i2c2", jz4770_i2c2_groups, ARRAY_SIZE(jz4770_i2c2_groups), },
-	{ "i2c3", jz4780_i2c3_groups, ARRAY_SIZE(jz4780_i2c3_groups), },
-	{ "i2c4", jz4780_i2c4_groups, ARRAY_SIZE(jz4780_i2c4_groups), },
-	{ "i2s", jz4780_i2s_groups, ARRAY_SIZE(jz4780_i2s_groups), },
-	{ "dmic", jz4780_dmic_groups, ARRAY_SIZE(jz4780_dmic_groups), },
-	{ "cim", jz4780_cim_groups, ARRAY_SIZE(jz4780_cim_groups), },
-	{ "lcd", jz4770_lcd_groups, ARRAY_SIZE(jz4770_lcd_groups), },
-	{ "pwm0", jz4770_pwm0_groups, ARRAY_SIZE(jz4770_pwm0_groups), },
-	{ "pwm1", jz4770_pwm1_groups, ARRAY_SIZE(jz4770_pwm1_groups), },
-	{ "pwm2", jz4770_pwm2_groups, ARRAY_SIZE(jz4770_pwm2_groups), },
-	{ "pwm3", jz4770_pwm3_groups, ARRAY_SIZE(jz4770_pwm3_groups), },
-	{ "pwm4", jz4770_pwm4_groups, ARRAY_SIZE(jz4770_pwm4_groups), },
-	{ "pwm5", jz4770_pwm5_groups, ARRAY_SIZE(jz4770_pwm5_groups), },
-	{ "pwm6", jz4770_pwm6_groups, ARRAY_SIZE(jz4770_pwm6_groups), },
-	{ "pwm7", jz4770_pwm7_groups, ARRAY_SIZE(jz4770_pwm7_groups), },
-	{ "hdmi-ddc", jz4780_hdmi_ddc_groups,
-		      ARRAY_SIZE(jz4780_hdmi_ddc_groups), },
+	INGENIC_PIN_FUNCTION("uart0", jz4770_uart0),
+	INGENIC_PIN_FUNCTION("uart1", jz4770_uart1),
+	INGENIC_PIN_FUNCTION("uart2", jz4780_uart2),
+	INGENIC_PIN_FUNCTION("uart3", jz4770_uart3),
+	INGENIC_PIN_FUNCTION("uart4", jz4780_uart4),
+	INGENIC_PIN_FUNCTION("ssi0", jz4780_ssi0),
+	INGENIC_PIN_FUNCTION("ssi1", jz4780_ssi1),
+	INGENIC_PIN_FUNCTION("mmc0", jz4780_mmc0),
+	INGENIC_PIN_FUNCTION("mmc1", jz4780_mmc1),
+	INGENIC_PIN_FUNCTION("mmc2", jz4780_mmc2),
+	INGENIC_PIN_FUNCTION("nemc", jz4780_nemc),
+	INGENIC_PIN_FUNCTION("nemc-cs1", jz4770_cs1),
+	INGENIC_PIN_FUNCTION("nemc-cs2", jz4770_cs2),
+	INGENIC_PIN_FUNCTION("nemc-cs3", jz4770_cs3),
+	INGENIC_PIN_FUNCTION("nemc-cs4", jz4770_cs4),
+	INGENIC_PIN_FUNCTION("nemc-cs5", jz4770_cs5),
+	INGENIC_PIN_FUNCTION("nemc-cs6", jz4770_cs6),
+	INGENIC_PIN_FUNCTION("i2c0", jz4770_i2c0),
+	INGENIC_PIN_FUNCTION("i2c1", jz4770_i2c1),
+	INGENIC_PIN_FUNCTION("i2c2", jz4770_i2c2),
+	INGENIC_PIN_FUNCTION("i2c3", jz4780_i2c3),
+	INGENIC_PIN_FUNCTION("i2c4", jz4780_i2c4),
+	INGENIC_PIN_FUNCTION("i2s", jz4780_i2s),
+	INGENIC_PIN_FUNCTION("dmic", jz4780_dmic),
+	INGENIC_PIN_FUNCTION("cim", jz4780_cim),
+	INGENIC_PIN_FUNCTION("lcd", jz4770_lcd),
+	INGENIC_PIN_FUNCTION("pwm0", jz4770_pwm0),
+	INGENIC_PIN_FUNCTION("pwm1", jz4770_pwm1),
+	INGENIC_PIN_FUNCTION("pwm2", jz4770_pwm2),
+	INGENIC_PIN_FUNCTION("pwm3", jz4770_pwm3),
+	INGENIC_PIN_FUNCTION("pwm4", jz4770_pwm4),
+	INGENIC_PIN_FUNCTION("pwm5", jz4770_pwm5),
+	INGENIC_PIN_FUNCTION("pwm6", jz4770_pwm6),
+	INGENIC_PIN_FUNCTION("pwm7", jz4770_pwm7),
+	INGENIC_PIN_FUNCTION("hdmi-ddc", jz4780_hdmi_ddc),
 };
 
 static const struct ingenic_chip_info jz4780_chip_info = {
@@ -2185,29 +2192,29 @@ static const char *x1000_pwm4_groups[] = { "pwm4", };
 static const char *x1000_mac_groups[] = { "mac", };
 
 static const struct function_desc x1000_functions[] = {
-	{ "uart0", x1000_uart0_groups, ARRAY_SIZE(x1000_uart0_groups), },
-	{ "uart1", x1000_uart1_groups, ARRAY_SIZE(x1000_uart1_groups), },
-	{ "uart2", x1000_uart2_groups, ARRAY_SIZE(x1000_uart2_groups), },
-	{ "sfc", x1000_sfc_groups, ARRAY_SIZE(x1000_sfc_groups), },
-	{ "ssi", x1000_ssi_groups, ARRAY_SIZE(x1000_ssi_groups), },
-	{ "mmc0", x1000_mmc0_groups, ARRAY_SIZE(x1000_mmc0_groups), },
-	{ "mmc1", x1000_mmc1_groups, ARRAY_SIZE(x1000_mmc1_groups), },
-	{ "emc", x1000_emc_groups, ARRAY_SIZE(x1000_emc_groups), },
-	{ "emc-cs1", x1000_cs1_groups, ARRAY_SIZE(x1000_cs1_groups), },
-	{ "emc-cs2", x1000_cs2_groups, ARRAY_SIZE(x1000_cs2_groups), },
-	{ "i2c0", x1000_i2c0_groups, ARRAY_SIZE(x1000_i2c0_groups), },
-	{ "i2c1", x1000_i2c1_groups, ARRAY_SIZE(x1000_i2c1_groups), },
-	{ "i2c2", x1000_i2c2_groups, ARRAY_SIZE(x1000_i2c2_groups), },
-	{ "i2s", x1000_i2s_groups, ARRAY_SIZE(x1000_i2s_groups), },
-	{ "dmic", x1000_dmic_groups, ARRAY_SIZE(x1000_dmic_groups), },
-	{ "cim", x1000_cim_groups, ARRAY_SIZE(x1000_cim_groups), },
-	{ "lcd", x1000_lcd_groups, ARRAY_SIZE(x1000_lcd_groups), },
-	{ "pwm0", x1000_pwm0_groups, ARRAY_SIZE(x1000_pwm0_groups), },
-	{ "pwm1", x1000_pwm1_groups, ARRAY_SIZE(x1000_pwm1_groups), },
-	{ "pwm2", x1000_pwm2_groups, ARRAY_SIZE(x1000_pwm2_groups), },
-	{ "pwm3", x1000_pwm3_groups, ARRAY_SIZE(x1000_pwm3_groups), },
-	{ "pwm4", x1000_pwm4_groups, ARRAY_SIZE(x1000_pwm4_groups), },
-	{ "mac", x1000_mac_groups, ARRAY_SIZE(x1000_mac_groups), },
+	INGENIC_PIN_FUNCTION("uart0", x1000_uart0),
+	INGENIC_PIN_FUNCTION("uart1", x1000_uart1),
+	INGENIC_PIN_FUNCTION("uart2", x1000_uart2),
+	INGENIC_PIN_FUNCTION("sfc", x1000_sfc),
+	INGENIC_PIN_FUNCTION("ssi", x1000_ssi),
+	INGENIC_PIN_FUNCTION("mmc0", x1000_mmc0),
+	INGENIC_PIN_FUNCTION("mmc1", x1000_mmc1),
+	INGENIC_PIN_FUNCTION("emc", x1000_emc),
+	INGENIC_PIN_FUNCTION("emc-cs1", x1000_cs1),
+	INGENIC_PIN_FUNCTION("emc-cs2", x1000_cs2),
+	INGENIC_PIN_FUNCTION("i2c0", x1000_i2c0),
+	INGENIC_PIN_FUNCTION("i2c1", x1000_i2c1),
+	INGENIC_PIN_FUNCTION("i2c2", x1000_i2c2),
+	INGENIC_PIN_FUNCTION("i2s", x1000_i2s),
+	INGENIC_PIN_FUNCTION("dmic", x1000_dmic),
+	INGENIC_PIN_FUNCTION("cim", x1000_cim),
+	INGENIC_PIN_FUNCTION("lcd", x1000_lcd),
+	INGENIC_PIN_FUNCTION("pwm0", x1000_pwm0),
+	INGENIC_PIN_FUNCTION("pwm1", x1000_pwm1),
+	INGENIC_PIN_FUNCTION("pwm2", x1000_pwm2),
+	INGENIC_PIN_FUNCTION("pwm3", x1000_pwm3),
+	INGENIC_PIN_FUNCTION("pwm4", x1000_pwm4),
+	INGENIC_PIN_FUNCTION("mac", x1000_mac),
 };
 
 static const struct regmap_range x1000_access_ranges[] = {
@@ -2315,22 +2322,22 @@ static const char *x1500_pwm3_groups[] = { "pwm3", };
 static const char *x1500_pwm4_groups[] = { "pwm4", };
 
 static const struct function_desc x1500_functions[] = {
-	{ "uart0", x1500_uart0_groups, ARRAY_SIZE(x1500_uart0_groups), },
-	{ "uart1", x1500_uart1_groups, ARRAY_SIZE(x1500_uart1_groups), },
-	{ "uart2", x1500_uart2_groups, ARRAY_SIZE(x1500_uart2_groups), },
-	{ "sfc", x1000_sfc_groups, ARRAY_SIZE(x1000_sfc_groups), },
-	{ "mmc", x1500_mmc_groups, ARRAY_SIZE(x1500_mmc_groups), },
-	{ "i2c0", x1500_i2c0_groups, ARRAY_SIZE(x1500_i2c0_groups), },
-	{ "i2c1", x1500_i2c1_groups, ARRAY_SIZE(x1500_i2c1_groups), },
-	{ "i2c2", x1500_i2c2_groups, ARRAY_SIZE(x1500_i2c2_groups), },
-	{ "i2s", x1500_i2s_groups, ARRAY_SIZE(x1500_i2s_groups), },
-	{ "dmic", x1500_dmic_groups, ARRAY_SIZE(x1500_dmic_groups), },
-	{ "cim", x1500_cim_groups, ARRAY_SIZE(x1500_cim_groups), },
-	{ "pwm0", x1500_pwm0_groups, ARRAY_SIZE(x1500_pwm0_groups), },
-	{ "pwm1", x1500_pwm1_groups, ARRAY_SIZE(x1500_pwm1_groups), },
-	{ "pwm2", x1500_pwm2_groups, ARRAY_SIZE(x1500_pwm2_groups), },
-	{ "pwm3", x1500_pwm3_groups, ARRAY_SIZE(x1500_pwm3_groups), },
-	{ "pwm4", x1500_pwm4_groups, ARRAY_SIZE(x1500_pwm4_groups), },
+	INGENIC_PIN_FUNCTION("uart0", x1500_uart0),
+	INGENIC_PIN_FUNCTION("uart1", x1500_uart1),
+	INGENIC_PIN_FUNCTION("uart2", x1500_uart2),
+	INGENIC_PIN_FUNCTION("sfc", x1000_sfc),
+	INGENIC_PIN_FUNCTION("mmc", x1500_mmc),
+	INGENIC_PIN_FUNCTION("i2c0", x1500_i2c0),
+	INGENIC_PIN_FUNCTION("i2c1", x1500_i2c1),
+	INGENIC_PIN_FUNCTION("i2c2", x1500_i2c2),
+	INGENIC_PIN_FUNCTION("i2s", x1500_i2s),
+	INGENIC_PIN_FUNCTION("dmic", x1500_dmic),
+	INGENIC_PIN_FUNCTION("cim", x1500_cim),
+	INGENIC_PIN_FUNCTION("pwm0", x1500_pwm0),
+	INGENIC_PIN_FUNCTION("pwm1", x1500_pwm1),
+	INGENIC_PIN_FUNCTION("pwm2", x1500_pwm2),
+	INGENIC_PIN_FUNCTION("pwm3", x1500_pwm3),
+	INGENIC_PIN_FUNCTION("pwm4", x1500_pwm4),
 };
 
 static const struct ingenic_chip_info x1500_chip_info = {
@@ -2526,28 +2533,28 @@ static const char *x1830_pwm7_groups[] = { "pwm7-c-18", "pwm7-c-28", };
 static const char *x1830_mac_groups[] = { "mac", };
 
 static const struct function_desc x1830_functions[] = {
-	{ "uart0", x1830_uart0_groups, ARRAY_SIZE(x1830_uart0_groups), },
-	{ "uart1", x1830_uart1_groups, ARRAY_SIZE(x1830_uart1_groups), },
-	{ "sfc", x1830_sfc_groups, ARRAY_SIZE(x1830_sfc_groups), },
-	{ "ssi0", x1830_ssi0_groups, ARRAY_SIZE(x1830_ssi0_groups), },
-	{ "ssi1", x1830_ssi1_groups, ARRAY_SIZE(x1830_ssi1_groups), },
-	{ "mmc0", x1830_mmc0_groups, ARRAY_SIZE(x1830_mmc0_groups), },
-	{ "mmc1", x1830_mmc1_groups, ARRAY_SIZE(x1830_mmc1_groups), },
-	{ "i2c0", x1830_i2c0_groups, ARRAY_SIZE(x1830_i2c0_groups), },
-	{ "i2c1", x1830_i2c1_groups, ARRAY_SIZE(x1830_i2c1_groups), },
-	{ "i2c2", x1830_i2c2_groups, ARRAY_SIZE(x1830_i2c2_groups), },
-	{ "i2s", x1830_i2s_groups, ARRAY_SIZE(x1830_i2s_groups), },
-	{ "dmic", x1830_dmic_groups, ARRAY_SIZE(x1830_dmic_groups), },
-	{ "lcd", x1830_lcd_groups, ARRAY_SIZE(x1830_lcd_groups), },
-	{ "pwm0", x1830_pwm0_groups, ARRAY_SIZE(x1830_pwm0_groups), },
-	{ "pwm1", x1830_pwm1_groups, ARRAY_SIZE(x1830_pwm1_groups), },
-	{ "pwm2", x1830_pwm2_groups, ARRAY_SIZE(x1830_pwm2_groups), },
-	{ "pwm3", x1830_pwm3_groups, ARRAY_SIZE(x1830_pwm3_groups), },
-	{ "pwm4", x1830_pwm4_groups, ARRAY_SIZE(x1830_pwm4_groups), },
-	{ "pwm5", x1830_pwm5_groups, ARRAY_SIZE(x1830_pwm4_groups), },
-	{ "pwm6", x1830_pwm6_groups, ARRAY_SIZE(x1830_pwm4_groups), },
-	{ "pwm7", x1830_pwm7_groups, ARRAY_SIZE(x1830_pwm4_groups), },
-	{ "mac", x1830_mac_groups, ARRAY_SIZE(x1830_mac_groups), },
+	INGENIC_PIN_FUNCTION("uart0", x1830_uart0),
+	INGENIC_PIN_FUNCTION("uart1", x1830_uart1),
+	INGENIC_PIN_FUNCTION("sfc", x1830_sfc),
+	INGENIC_PIN_FUNCTION("ssi0", x1830_ssi0),
+	INGENIC_PIN_FUNCTION("ssi1", x1830_ssi1),
+	INGENIC_PIN_FUNCTION("mmc0", x1830_mmc0),
+	INGENIC_PIN_FUNCTION("mmc1", x1830_mmc1),
+	INGENIC_PIN_FUNCTION("i2c0", x1830_i2c0),
+	INGENIC_PIN_FUNCTION("i2c1", x1830_i2c1),
+	INGENIC_PIN_FUNCTION("i2c2", x1830_i2c2),
+	INGENIC_PIN_FUNCTION("i2s", x1830_i2s),
+	INGENIC_PIN_FUNCTION("dmic", x1830_dmic),
+	INGENIC_PIN_FUNCTION("lcd", x1830_lcd),
+	INGENIC_PIN_FUNCTION("pwm0", x1830_pwm0),
+	INGENIC_PIN_FUNCTION("pwm1", x1830_pwm1),
+	INGENIC_PIN_FUNCTION("pwm2", x1830_pwm2),
+	INGENIC_PIN_FUNCTION("pwm3", x1830_pwm3),
+	INGENIC_PIN_FUNCTION("pwm4", x1830_pwm4),
+	INGENIC_PIN_FUNCTION("pwm5", x1830_pwm5),
+	INGENIC_PIN_FUNCTION("pwm6", x1830_pwm6),
+	INGENIC_PIN_FUNCTION("pwm7", x1830_pwm7),
+	INGENIC_PIN_FUNCTION("mac", x1830_mac),
 };
 
 static const struct regmap_range x1830_access_ranges[] = {
@@ -2972,56 +2979,56 @@ static const char *x2000_mac1_groups[] = { "mac1-rmii", "mac1-rgmii", };
 static const char *x2000_otg_groups[] = { "otg-vbus", };
 
 static const struct function_desc x2000_functions[] = {
-	{ "uart0", x2000_uart0_groups, ARRAY_SIZE(x2000_uart0_groups), },
-	{ "uart1", x2000_uart1_groups, ARRAY_SIZE(x2000_uart1_groups), },
-	{ "uart2", x2000_uart2_groups, ARRAY_SIZE(x2000_uart2_groups), },
-	{ "uart3", x2000_uart3_groups, ARRAY_SIZE(x2000_uart3_groups), },
-	{ "uart4", x2000_uart4_groups, ARRAY_SIZE(x2000_uart4_groups), },
-	{ "uart5", x2000_uart5_groups, ARRAY_SIZE(x2000_uart5_groups), },
-	{ "uart6", x2000_uart6_groups, ARRAY_SIZE(x2000_uart6_groups), },
-	{ "uart7", x2000_uart7_groups, ARRAY_SIZE(x2000_uart7_groups), },
-	{ "uart8", x2000_uart8_groups, ARRAY_SIZE(x2000_uart8_groups), },
-	{ "uart9", x2000_uart9_groups, ARRAY_SIZE(x2000_uart9_groups), },
-	{ "sfc", x2000_sfc_groups, ARRAY_SIZE(x2000_sfc_groups), },
-	{ "ssi0", x2000_ssi0_groups, ARRAY_SIZE(x2000_ssi0_groups), },
-	{ "ssi1", x2000_ssi1_groups, ARRAY_SIZE(x2000_ssi1_groups), },
-	{ "mmc0", x2000_mmc0_groups, ARRAY_SIZE(x2000_mmc0_groups), },
-	{ "mmc1", x2000_mmc1_groups, ARRAY_SIZE(x2000_mmc1_groups), },
-	{ "mmc2", x2000_mmc2_groups, ARRAY_SIZE(x2000_mmc2_groups), },
-	{ "emc", x2000_emc_groups, ARRAY_SIZE(x2000_emc_groups), },
-	{ "emc-cs1", x2000_cs1_groups, ARRAY_SIZE(x2000_cs1_groups), },
-	{ "emc-cs2", x2000_cs2_groups, ARRAY_SIZE(x2000_cs2_groups), },
-	{ "i2c0", x2000_i2c0_groups, ARRAY_SIZE(x2000_i2c0_groups), },
-	{ "i2c1", x2000_i2c1_groups, ARRAY_SIZE(x2000_i2c1_groups), },
-	{ "i2c2", x2000_i2c2_groups, ARRAY_SIZE(x2000_i2c2_groups), },
-	{ "i2c3", x2000_i2c3_groups, ARRAY_SIZE(x2000_i2c3_groups), },
-	{ "i2c4", x2000_i2c4_groups, ARRAY_SIZE(x2000_i2c4_groups), },
-	{ "i2c5", x2000_i2c5_groups, ARRAY_SIZE(x2000_i2c5_groups), },
-	{ "i2s1", x2000_i2s1_groups, ARRAY_SIZE(x2000_i2s1_groups), },
-	{ "i2s2", x2000_i2s2_groups, ARRAY_SIZE(x2000_i2s2_groups), },
-	{ "i2s3", x2000_i2s3_groups, ARRAY_SIZE(x2000_i2s3_groups), },
-	{ "dmic", x2000_dmic_groups, ARRAY_SIZE(x2000_dmic_groups), },
-	{ "cim", x2000_cim_groups, ARRAY_SIZE(x2000_cim_groups), },
-	{ "lcd", x2000_lcd_groups, ARRAY_SIZE(x2000_lcd_groups), },
-	{ "pwm0", x2000_pwm0_groups, ARRAY_SIZE(x2000_pwm0_groups), },
-	{ "pwm1", x2000_pwm1_groups, ARRAY_SIZE(x2000_pwm1_groups), },
-	{ "pwm2", x2000_pwm2_groups, ARRAY_SIZE(x2000_pwm2_groups), },
-	{ "pwm3", x2000_pwm3_groups, ARRAY_SIZE(x2000_pwm3_groups), },
-	{ "pwm4", x2000_pwm4_groups, ARRAY_SIZE(x2000_pwm4_groups), },
-	{ "pwm5", x2000_pwm5_groups, ARRAY_SIZE(x2000_pwm5_groups), },
-	{ "pwm6", x2000_pwm6_groups, ARRAY_SIZE(x2000_pwm6_groups), },
-	{ "pwm7", x2000_pwm7_groups, ARRAY_SIZE(x2000_pwm7_groups), },
-	{ "pwm8", x2000_pwm8_groups, ARRAY_SIZE(x2000_pwm8_groups), },
-	{ "pwm9", x2000_pwm9_groups, ARRAY_SIZE(x2000_pwm9_groups), },
-	{ "pwm10", x2000_pwm10_groups, ARRAY_SIZE(x2000_pwm10_groups), },
-	{ "pwm11", x2000_pwm11_groups, ARRAY_SIZE(x2000_pwm11_groups), },
-	{ "pwm12", x2000_pwm12_groups, ARRAY_SIZE(x2000_pwm12_groups), },
-	{ "pwm13", x2000_pwm13_groups, ARRAY_SIZE(x2000_pwm13_groups), },
-	{ "pwm14", x2000_pwm14_groups, ARRAY_SIZE(x2000_pwm14_groups), },
-	{ "pwm15", x2000_pwm15_groups, ARRAY_SIZE(x2000_pwm15_groups), },
-	{ "mac0", x2000_mac0_groups, ARRAY_SIZE(x2000_mac0_groups), },
-	{ "mac1", x2000_mac1_groups, ARRAY_SIZE(x2000_mac1_groups), },
-	{ "otg", x2000_otg_groups, ARRAY_SIZE(x2000_otg_groups), },
+	INGENIC_PIN_FUNCTION("uart0", x2000_uart0),
+	INGENIC_PIN_FUNCTION("uart1", x2000_uart1),
+	INGENIC_PIN_FUNCTION("uart2", x2000_uart2),
+	INGENIC_PIN_FUNCTION("uart3", x2000_uart3),
+	INGENIC_PIN_FUNCTION("uart4", x2000_uart4),
+	INGENIC_PIN_FUNCTION("uart5", x2000_uart5),
+	INGENIC_PIN_FUNCTION("uart6", x2000_uart6),
+	INGENIC_PIN_FUNCTION("uart7", x2000_uart7),
+	INGENIC_PIN_FUNCTION("uart8", x2000_uart8),
+	INGENIC_PIN_FUNCTION("uart9", x2000_uart9),
+	INGENIC_PIN_FUNCTION("sfc", x2000_sfc),
+	INGENIC_PIN_FUNCTION("ssi0", x2000_ssi0),
+	INGENIC_PIN_FUNCTION("ssi1", x2000_ssi1),
+	INGENIC_PIN_FUNCTION("mmc0", x2000_mmc0),
+	INGENIC_PIN_FUNCTION("mmc1", x2000_mmc1),
+	INGENIC_PIN_FUNCTION("mmc2", x2000_mmc2),
+	INGENIC_PIN_FUNCTION("emc", x2000_emc),
+	INGENIC_PIN_FUNCTION("emc-cs1", x2000_cs1),
+	INGENIC_PIN_FUNCTION("emc-cs2", x2000_cs2),
+	INGENIC_PIN_FUNCTION("i2c0", x2000_i2c0),
+	INGENIC_PIN_FUNCTION("i2c1", x2000_i2c1),
+	INGENIC_PIN_FUNCTION("i2c2", x2000_i2c2),
+	INGENIC_PIN_FUNCTION("i2c3", x2000_i2c3),
+	INGENIC_PIN_FUNCTION("i2c4", x2000_i2c4),
+	INGENIC_PIN_FUNCTION("i2c5", x2000_i2c5),
+	INGENIC_PIN_FUNCTION("i2s1", x2000_i2s1),
+	INGENIC_PIN_FUNCTION("i2s2", x2000_i2s2),
+	INGENIC_PIN_FUNCTION("i2s3", x2000_i2s3),
+	INGENIC_PIN_FUNCTION("dmic", x2000_dmic),
+	INGENIC_PIN_FUNCTION("cim", x2000_cim),
+	INGENIC_PIN_FUNCTION("lcd", x2000_lcd),
+	INGENIC_PIN_FUNCTION("pwm0", x2000_pwm0),
+	INGENIC_PIN_FUNCTION("pwm1", x2000_pwm1),
+	INGENIC_PIN_FUNCTION("pwm2", x2000_pwm2),
+	INGENIC_PIN_FUNCTION("pwm3", x2000_pwm3),
+	INGENIC_PIN_FUNCTION("pwm4", x2000_pwm4),
+	INGENIC_PIN_FUNCTION("pwm5", x2000_pwm5),
+	INGENIC_PIN_FUNCTION("pwm6", x2000_pwm6),
+	INGENIC_PIN_FUNCTION("pwm7", x2000_pwm7),
+	INGENIC_PIN_FUNCTION("pwm8", x2000_pwm8),
+	INGENIC_PIN_FUNCTION("pwm9", x2000_pwm9),
+	INGENIC_PIN_FUNCTION("pwm10", x2000_pwm10),
+	INGENIC_PIN_FUNCTION("pwm11", x2000_pwm11),
+	INGENIC_PIN_FUNCTION("pwm12", x2000_pwm12),
+	INGENIC_PIN_FUNCTION("pwm13", x2000_pwm13),
+	INGENIC_PIN_FUNCTION("pwm14", x2000_pwm14),
+	INGENIC_PIN_FUNCTION("pwm15", x2000_pwm15),
+	INGENIC_PIN_FUNCTION("mac0", x2000_mac0),
+	INGENIC_PIN_FUNCTION("mac1", x2000_mac1),
+	INGENIC_PIN_FUNCTION("otg", x2000_otg),
 };
 
 static const struct regmap_range x2000_access_ranges[] = {
@@ -3196,54 +3203,54 @@ static const struct group_desc x2100_groups[] = {
 static const char *x2100_mac_groups[] = { "mac", };
 
 static const struct function_desc x2100_functions[] = {
-	{ "uart0", x2000_uart0_groups, ARRAY_SIZE(x2000_uart0_groups), },
-	{ "uart1", x2000_uart1_groups, ARRAY_SIZE(x2000_uart1_groups), },
-	{ "uart2", x2000_uart2_groups, ARRAY_SIZE(x2000_uart2_groups), },
-	{ "uart3", x2000_uart3_groups, ARRAY_SIZE(x2000_uart3_groups), },
-	{ "uart4", x2000_uart4_groups, ARRAY_SIZE(x2000_uart4_groups), },
-	{ "uart5", x2000_uart5_groups, ARRAY_SIZE(x2000_uart5_groups), },
-	{ "uart6", x2000_uart6_groups, ARRAY_SIZE(x2000_uart6_groups), },
-	{ "uart7", x2000_uart7_groups, ARRAY_SIZE(x2000_uart7_groups), },
-	{ "uart8", x2000_uart8_groups, ARRAY_SIZE(x2000_uart8_groups), },
-	{ "uart9", x2000_uart9_groups, ARRAY_SIZE(x2000_uart9_groups), },
-	{ "sfc", x2000_sfc_groups, ARRAY_SIZE(x2000_sfc_groups), },
-	{ "ssi0", x2000_ssi0_groups, ARRAY_SIZE(x2000_ssi0_groups), },
-	{ "ssi1", x2000_ssi1_groups, ARRAY_SIZE(x2000_ssi1_groups), },
-	{ "mmc0", x2000_mmc0_groups, ARRAY_SIZE(x2000_mmc0_groups), },
-	{ "mmc1", x2000_mmc1_groups, ARRAY_SIZE(x2000_mmc1_groups), },
-	{ "mmc2", x2000_mmc2_groups, ARRAY_SIZE(x2000_mmc2_groups), },
-	{ "emc", x2000_emc_groups, ARRAY_SIZE(x2000_emc_groups), },
-	{ "emc-cs1", x2000_cs1_groups, ARRAY_SIZE(x2000_cs1_groups), },
-	{ "emc-cs2", x2000_cs2_groups, ARRAY_SIZE(x2000_cs2_groups), },
-	{ "i2c0", x2000_i2c0_groups, ARRAY_SIZE(x2000_i2c0_groups), },
-	{ "i2c1", x2000_i2c1_groups, ARRAY_SIZE(x2000_i2c1_groups), },
-	{ "i2c2", x2000_i2c2_groups, ARRAY_SIZE(x2000_i2c2_groups), },
-	{ "i2c3", x2000_i2c3_groups, ARRAY_SIZE(x2000_i2c3_groups), },
-	{ "i2c4", x2000_i2c4_groups, ARRAY_SIZE(x2000_i2c4_groups), },
-	{ "i2c5", x2000_i2c5_groups, ARRAY_SIZE(x2000_i2c5_groups), },
-	{ "i2s1", x2000_i2s1_groups, ARRAY_SIZE(x2000_i2s1_groups), },
-	{ "i2s2", x2000_i2s2_groups, ARRAY_SIZE(x2000_i2s2_groups), },
-	{ "i2s3", x2000_i2s3_groups, ARRAY_SIZE(x2000_i2s3_groups), },
-	{ "dmic", x2000_dmic_groups, ARRAY_SIZE(x2000_dmic_groups), },
-	{ "cim", x2000_cim_groups, ARRAY_SIZE(x2000_cim_groups), },
-	{ "lcd", x2000_lcd_groups, ARRAY_SIZE(x2000_lcd_groups), },
-	{ "pwm0", x2000_pwm0_groups, ARRAY_SIZE(x2000_pwm0_groups), },
-	{ "pwm1", x2000_pwm1_groups, ARRAY_SIZE(x2000_pwm1_groups), },
-	{ "pwm2", x2000_pwm2_groups, ARRAY_SIZE(x2000_pwm2_groups), },
-	{ "pwm3", x2000_pwm3_groups, ARRAY_SIZE(x2000_pwm3_groups), },
-	{ "pwm4", x2000_pwm4_groups, ARRAY_SIZE(x2000_pwm4_groups), },
-	{ "pwm5", x2000_pwm5_groups, ARRAY_SIZE(x2000_pwm5_groups), },
-	{ "pwm6", x2000_pwm6_groups, ARRAY_SIZE(x2000_pwm6_groups), },
-	{ "pwm7", x2000_pwm7_groups, ARRAY_SIZE(x2000_pwm7_groups), },
-	{ "pwm8", x2000_pwm8_groups, ARRAY_SIZE(x2000_pwm8_groups), },
-	{ "pwm9", x2000_pwm9_groups, ARRAY_SIZE(x2000_pwm9_groups), },
-	{ "pwm10", x2000_pwm10_groups, ARRAY_SIZE(x2000_pwm10_groups), },
-	{ "pwm11", x2000_pwm11_groups, ARRAY_SIZE(x2000_pwm11_groups), },
-	{ "pwm12", x2000_pwm12_groups, ARRAY_SIZE(x2000_pwm12_groups), },
-	{ "pwm13", x2000_pwm13_groups, ARRAY_SIZE(x2000_pwm13_groups), },
-	{ "pwm14", x2000_pwm14_groups, ARRAY_SIZE(x2000_pwm14_groups), },
-	{ "pwm15", x2000_pwm15_groups, ARRAY_SIZE(x2000_pwm15_groups), },
-	{ "mac", x2100_mac_groups, ARRAY_SIZE(x2100_mac_groups), },
+	INGENIC_PIN_FUNCTION("uart0", x2000_uart0),
+	INGENIC_PIN_FUNCTION("uart1", x2000_uart1),
+	INGENIC_PIN_FUNCTION("uart2", x2000_uart2),
+	INGENIC_PIN_FUNCTION("uart3", x2000_uart3),
+	INGENIC_PIN_FUNCTION("uart4", x2000_uart4),
+	INGENIC_PIN_FUNCTION("uart5", x2000_uart5),
+	INGENIC_PIN_FUNCTION("uart6", x2000_uart6),
+	INGENIC_PIN_FUNCTION("uart7", x2000_uart7),
+	INGENIC_PIN_FUNCTION("uart8", x2000_uart8),
+	INGENIC_PIN_FUNCTION("uart9", x2000_uart9),
+	INGENIC_PIN_FUNCTION("sfc", x2000_sfc),
+	INGENIC_PIN_FUNCTION("ssi0", x2000_ssi0),
+	INGENIC_PIN_FUNCTION("ssi1", x2000_ssi1),
+	INGENIC_PIN_FUNCTION("mmc0", x2000_mmc0),
+	INGENIC_PIN_FUNCTION("mmc1", x2000_mmc1),
+	INGENIC_PIN_FUNCTION("mmc2", x2000_mmc2),
+	INGENIC_PIN_FUNCTION("emc", x2000_emc),
+	INGENIC_PIN_FUNCTION("emc-cs1", x2000_cs1),
+	INGENIC_PIN_FUNCTION("emc-cs2", x2000_cs2),
+	INGENIC_PIN_FUNCTION("i2c0", x2000_i2c0),
+	INGENIC_PIN_FUNCTION("i2c1", x2000_i2c1),
+	INGENIC_PIN_FUNCTION("i2c2", x2000_i2c2),
+	INGENIC_PIN_FUNCTION("i2c3", x2000_i2c3),
+	INGENIC_PIN_FUNCTION("i2c4", x2000_i2c4),
+	INGENIC_PIN_FUNCTION("i2c5", x2000_i2c5),
+	INGENIC_PIN_FUNCTION("i2s1", x2000_i2s1),
+	INGENIC_PIN_FUNCTION("i2s2", x2000_i2s2),
+	INGENIC_PIN_FUNCTION("i2s3", x2000_i2s3),
+	INGENIC_PIN_FUNCTION("dmic", x2000_dmic),
+	INGENIC_PIN_FUNCTION("cim", x2000_cim),
+	INGENIC_PIN_FUNCTION("lcd", x2000_lcd),
+	INGENIC_PIN_FUNCTION("pwm0", x2000_pwm0),
+	INGENIC_PIN_FUNCTION("pwm1", x2000_pwm1),
+	INGENIC_PIN_FUNCTION("pwm2", x2000_pwm2),
+	INGENIC_PIN_FUNCTION("pwm3", x2000_pwm3),
+	INGENIC_PIN_FUNCTION("pwm4", x2000_pwm4),
+	INGENIC_PIN_FUNCTION("pwm5", x2000_pwm5),
+	INGENIC_PIN_FUNCTION("pwm6", x2000_pwm6),
+	INGENIC_PIN_FUNCTION("pwm7", x2000_pwm7),
+	INGENIC_PIN_FUNCTION("pwm8", x2000_pwm8),
+	INGENIC_PIN_FUNCTION("pwm9", x2000_pwm9),
+	INGENIC_PIN_FUNCTION("pwm10", x2000_pwm10),
+	INGENIC_PIN_FUNCTION("pwm11", x2000_pwm11),
+	INGENIC_PIN_FUNCTION("pwm12", x2000_pwm12),
+	INGENIC_PIN_FUNCTION("pwm13", x2000_pwm13),
+	INGENIC_PIN_FUNCTION("pwm14", x2000_pwm14),
+	INGENIC_PIN_FUNCTION("pwm15", x2000_pwm15),
+	INGENIC_PIN_FUNCTION("mac", x2100_mac),
 };
 
 static const struct ingenic_chip_info x2100_chip_info = {
-- 
2.45.1


