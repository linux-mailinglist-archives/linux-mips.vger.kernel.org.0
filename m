Return-Path: <linux-mips+bounces-247-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7BA7F6732
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 20:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 232EDB2129A
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 19:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416E14C3B5;
	Thu, 23 Nov 2023 19:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZRP0aaTs"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F70D46;
	Thu, 23 Nov 2023 11:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700768048; x=1732304048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HR6AD3oucSuNKOYxIpiD/4nGiB6I6Xel00vv5noMc+E=;
  b=ZRP0aaTsIrD++izsKIi0cbi1Df59X/nqVlH2dnKgMEhHOgaL+cyPLREX
   me73emgGUT5cIY4yZlKh5JMHyOAl83OfeLO2+PKQofBNama6St5m35A+t
   nNYOMjrN9B498OQIeJLdMzlainYsUM73HrTCQClDAOp3iWLAtHmz2YJJi
   TyOfA7V9g7/bHm/9Z8cvLJ1EYUynkik0Sw5vMa2HJKPaJv1wvZtbXgJty
   6N2QvyiFuZGTS/3GiHWUMuq68T/90o65UJ0+0Xx3PC6jUPd2wujfmMHHc
   j+/3g/vJ3sZPnjWL05fkxIR2NdmVk94VuSkkRQCOXSHZZbtGe6TxqGj4s
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372482060"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="372482060"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 11:34:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833506145"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="833506145"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 23 Nov 2023 11:33:59 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A864F387; Thu, 23 Nov 2023 21:33:58 +0200 (EET)
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
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v2 03/21] pinctrl: equilibrium: Use temporary variable to hold pins
Date: Thu, 23 Nov 2023 21:31:31 +0200
Message-ID: <20231123193355.3400852-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
References: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pins are allocated from the heap, but in order to pass
them as constant object, we need to use non-constant pointer.
Achieve this by using a temporary variable.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 5b5ddf7e5d0e..91157a2b949c 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -704,7 +704,7 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 {
 	struct device *dev = drvdata->dev;
 	struct device_node *node = dev->of_node;
-	unsigned int *pinmux, pin_id, pinmux_id;
+	unsigned int *pins, *pinmux, pin_id, pinmux_id;
 	struct group_desc group;
 	struct device_node *np;
 	struct property *prop;
@@ -722,15 +722,14 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 			return -EINVAL;
 		}
 		group.name = prop->value;
-		group.pins = devm_kcalloc(dev, group.num_pins,
-					  sizeof(*(group.pins)), GFP_KERNEL);
-		if (!group.pins) {
+		pins = devm_kcalloc(dev, group.num_pins, sizeof(*pins), GFP_KERNEL);
+		if (!pins) {
 			of_node_put(np);
 			return -ENOMEM;
 		}
+		group.pins = pins;
 
-		pinmux = devm_kcalloc(dev, group.num_pins, sizeof(*pinmux),
-				      GFP_KERNEL);
+		pinmux = devm_kcalloc(dev, group.num_pins, sizeof(*pinmux), GFP_KERNEL);
 		if (!pinmux) {
 			of_node_put(np);
 			return -ENOMEM;
@@ -749,7 +748,7 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 				of_node_put(np);
 				return -EINVAL;
 			}
-			group.pins[j] = pin_id;
+			pins[j] = pin_id;
 			if (of_property_read_u32_index(np, "pinmux", j, &pinmux_id)) {
 				dev_err(dev, "Group %s: Read intel pinmux id failed\n",
 					group.name);
-- 
2.43.0.rc1.1.gbec44491f096


