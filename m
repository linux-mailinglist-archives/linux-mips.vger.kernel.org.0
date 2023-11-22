Return-Path: <linux-mips+bounces-172-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD75F7F4D88
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 17:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BE48B20E55
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 16:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A474E612;
	Wed, 22 Nov 2023 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nn3B6ZqC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA28A11F;
	Wed, 22 Nov 2023 08:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700672212; x=1732208212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+w70dijnIhYAk0vVK1fe5YJSScdtigXGehzr6Lwxbvg=;
  b=nn3B6ZqCB4UG2LwrxYm48bgHXm2vJJqjTn8Npi8cgHucLkkEb+xXjNQl
   dBOW+zcKYt4r16/T8FsODItD3hoc6pJhqtDHXSA+N1KahEnAvV4uyf98z
   XP/sU1y17Q8VicBN6ppcigHxSK6SWZfC/Oqf1PeZlZFsLkX7XUyVGlMBx
   SaN6JkEXSPPFJ57BQoFHLfRqBxJTIvkC64crQeb8Bt8kKwpScf26uSgq7
   M4AmwLNV7zNTW63DhvltHQj7q1OWVcg5sqSxWATSO+DLylfGAsQMAC7B6
   2yekQXZuSf5SKGRw6DiapHiqm8rZMsFEjwyeVnfFfm0xPeJWl8plo03H8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5235476"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="5235476"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 08:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="857815517"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="857815517"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2023 08:56:16 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E3FE6FD; Wed, 22 Nov 2023 18:40:44 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
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
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v1 01/17] pinctrl: equilibrium: Convert to use struct pingroup
Date: Wed, 22 Nov 2023 18:35:33 +0200
Message-ID: <20231122164040.2262742-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
References: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pin control header provides struct pingroup.
Utilize it instead of open coded variants in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 32 +++++++++++++--------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 5b5ddf7e5d0e..9202a60b4ec7 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -705,7 +705,7 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 	struct device *dev = drvdata->dev;
 	struct device_node *node = dev->of_node;
 	unsigned int *pinmux, pin_id, pinmux_id;
-	struct group_desc group;
+	struct pingroup group, *grp = &group;
 	struct device_node *np;
 	struct property *prop;
 	int j, err;
@@ -715,55 +715,53 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 		if (!prop)
 			continue;
 
-		group.num_pins = of_property_count_u32_elems(np, "pins");
-		if (group.num_pins < 0) {
+		grp->npins = of_property_count_u32_elems(np, "pins");
+		if (grp->npins < 0) {
 			dev_err(dev, "No pins in the group: %s\n", prop->name);
 			of_node_put(np);
 			return -EINVAL;
 		}
-		group.name = prop->value;
-		group.pins = devm_kcalloc(dev, group.num_pins,
-					  sizeof(*(group.pins)), GFP_KERNEL);
-		if (!group.pins) {
+		grp->name = prop->value;
+		grp->pins = devm_kcalloc(dev, grp->npins, sizeof(*grp->pins), GFP_KERNEL);
+		if (!grp->pins) {
 			of_node_put(np);
 			return -ENOMEM;
 		}
 
-		pinmux = devm_kcalloc(dev, group.num_pins, sizeof(*pinmux),
-				      GFP_KERNEL);
+		pinmux = devm_kcalloc(dev, grp->npins, sizeof(*pinmux), GFP_KERNEL);
 		if (!pinmux) {
 			of_node_put(np);
 			return -ENOMEM;
 		}
 
-		for (j = 0; j < group.num_pins; j++) {
+		for (j = 0; j < grp->npins; j++) {
 			if (of_property_read_u32_index(np, "pins", j, &pin_id)) {
 				dev_err(dev, "Group %s: Read intel pins id failed\n",
-					group.name);
+					grp->name);
 				of_node_put(np);
 				return -EINVAL;
 			}
 			if (pin_id >= drvdata->pctl_desc.npins) {
 				dev_err(dev, "Group %s: Invalid pin ID, idx: %d, pin %u\n",
-					group.name, j, pin_id);
+					grp->name, j, pin_id);
 				of_node_put(np);
 				return -EINVAL;
 			}
-			group.pins[j] = pin_id;
+			grp->pins[j] = pin_id;
 			if (of_property_read_u32_index(np, "pinmux", j, &pinmux_id)) {
 				dev_err(dev, "Group %s: Read intel pinmux id failed\n",
-					group.name);
+					grp->name);
 				of_node_put(np);
 				return -EINVAL;
 			}
 			pinmux[j] = pinmux_id;
 		}
 
-		err = pinctrl_generic_add_group(drvdata->pctl_dev, group.name,
-						group.pins, group.num_pins,
+		err = pinctrl_generic_add_group(drvdata->pctl_dev, grp->name,
+						grp->pins, grp->num_pins,
 						pinmux);
 		if (err < 0) {
-			dev_err(dev, "Failed to register group %s\n", group.name);
+			dev_err(dev, "Failed to register group %s\n", grp->name);
 			of_node_put(np);
 			return err;
 		}
-- 
2.43.0.rc1.1.gbec44491f096


