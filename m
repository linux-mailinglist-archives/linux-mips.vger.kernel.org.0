Return-Path: <linux-mips+bounces-165-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CBA7F4D4B
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 17:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 666691C20A0F
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 16:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E9925565;
	Wed, 22 Nov 2023 16:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9ZmNybD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC09F9;
	Wed, 22 Nov 2023 08:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700671912; x=1732207912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NE+17+HWJqu1tvwDbF/Yy56Y9wnjeE8kjUUulypb5zo=;
  b=a9ZmNybDpGQrFblyQHghZ++eHsVWhruvjyfGoatsVTCL8kYJiVVfiUG1
   7hE69BwxWvSd+LHeyMFgMUnvbhvggCIXdltnHk6cCHGIDFD/9n8Gtf2ar
   B2o4FBE29mXjei7kDeMrm6lowD9nGzQpNd2HsiX7Iq/l8UV+JFxxcX1nk
   Nyc1kx8pRVRY/Ybm+vY8e1UnCFa/NFGgtx7C6bZdG1rmZqNTeHUwuO8p5
   I/oyCYUwftxapNOkPQNDKCP0nNxwrNfrWXsD6lkj5bsFsrsmMiyKotYNY
   Pixf0O0idNXCKGdHIzrWsOW1/SI/jDUsxvJhwh2UbK60xMesud6GCQTfS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5233303"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="5233303"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 08:51:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="910887955"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="910887955"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2023 08:51:16 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AC5237AF; Wed, 22 Nov 2023 18:40:45 +0200 (EET)
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
Subject: [PATCH v1 12/17] pinctrl: ingenic: Convert to use grp member
Date: Wed, 22 Nov 2023 18:35:44 +0200
Message-ID: <20231122164040.2262742-13-andriy.shevchenko@linux.intel.com>
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

Convert drivers to use grp member embedded in struct group_desc.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 393873de910a..6806fede5df4 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3756,17 +3756,17 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->name, grp->name);
+		func->name, grp->grp.name);
 
 	mode = (uintptr_t)grp->data;
 	if (mode <= 3) {
-		for (i = 0; i < grp->num_pins; i++)
-			ingenic_pinmux_set_pin_fn(jzpc, grp->pins[i], mode);
+		for (i = 0; i < grp->grp.npins; i++)
+			ingenic_pinmux_set_pin_fn(jzpc, grp->grp.pins[i], mode);
 	} else {
 		pin_modes = grp->data;
 
-		for (i = 0; i < grp->num_pins; i++)
-			ingenic_pinmux_set_pin_fn(jzpc, grp->pins[i], pin_modes[i]);
+		for (i = 0; i < grp->grp.npins; i++)
+			ingenic_pinmux_set_pin_fn(jzpc, grp->grp.pins[i], pin_modes[i]);
 	}
 
 	return 0;
@@ -4293,12 +4293,12 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 
 	for (i = 0; i < chip_info->num_groups; i++) {
 		const struct group_desc *group = &chip_info->groups[i];
+		const struct pingroup *grp = &group->grp;
 
-		err = pinctrl_generic_add_group(jzpc->pctl, group->name,
-				group->pins, group->num_pins, group->data);
+		err = pinctrl_generic_add_group(jzpc->pctl, grp->name, grp->pins, grp->npins,
+						group->data);
 		if (err < 0) {
-			dev_err(dev, "Failed to register group %s\n",
-					group->name);
+			dev_err(dev, "Failed to register group %s\n", grp->name);
 			return err;
 		}
 	}
-- 
2.43.0.rc1.1.gbec44491f096


