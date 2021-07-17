Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B9C3CC50A
	for <lists+linux-mips@lfdr.de>; Sat, 17 Jul 2021 19:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234308AbhGQRvw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Jul 2021 13:51:52 -0400
Received: from aposti.net ([89.234.176.197]:56910 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234214AbhGQRvw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 17 Jul 2021 13:51:52 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/3] pinctrl: ingenic: Add .max_register in regmap_config
Date:   Sat, 17 Jul 2021 18:48:36 +0100
Message-Id: <20210717174836.14776-3-paul@crapouillou.net>
In-Reply-To: <20210717174836.14776-1-paul@crapouillou.net>
References: <20210717174836.14776-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Compute the max register from the GPIO chip offset and number of GPIO
chips.

This permits to read all registers from debugfs.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 263498be8e31..2bbcb8063a16 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3759,6 +3759,7 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	void __iomem *base;
 	const struct ingenic_chip_info *chip_info;
 	struct device_node *node;
+	struct regmap_config regmap_config;
 	unsigned int i;
 	int err;
 
@@ -3776,8 +3777,10 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	jzpc->map = devm_regmap_init_mmio(dev, base,
-			&ingenic_pinctrl_regmap_config);
+	regmap_config = ingenic_pinctrl_regmap_config;
+	regmap_config.max_register = chip_info->num_chips * chip_info->reg_offset;
+
+	jzpc->map = devm_regmap_init_mmio(dev, base, &regmap_config);
 	if (IS_ERR(jzpc->map)) {
 		dev_err(dev, "Failed to create regmap\n");
 		return PTR_ERR(jzpc->map);
-- 
2.30.2

