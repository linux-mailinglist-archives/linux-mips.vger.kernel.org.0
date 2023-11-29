Return-Path: <linux-mips+bounces-376-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7547FDC87
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 17:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77E03282A6F
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 16:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9B63B781;
	Wed, 29 Nov 2023 16:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Su7DFqOq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE21010D9;
	Wed, 29 Nov 2023 08:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701274527; x=1732810527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3nCf9Nawx9DZLMwtP7gm5hKJWHmWiIVjJbmiWUav9q4=;
  b=Su7DFqOqtkI7w82/V7cHpPlodXPQiuHokueBkgOETHA8i4GxPumuVBPV
   p2kRFmVOhpI/d14WKZfyaaRFw20O6LOgFJgOCWhbX+j3TuUis3banaj8P
   BMy+loAKtD91qwZBNen1J7pU7a/i8BSkiXa9gLeuJCO/soSNkcYXCgj5x
   c3fb7ZuzrUHv74xvY3omkThK1PDi1CgadT6bu+slDYojzsImjriFA1apM
   fJkXqjplWvQknEdNLZW4xGi6nPo6qA1l+3OaTbFa4WRlVf+yQ18AP1EQD
   LI5c0e7evMmWENx365PYStLI5oQTOl2C5Xu6Z8c95xA3Fgw3F2B6+kIKJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373372764"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="373372764"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:15:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892498890"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="892498890"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 29 Nov 2023 08:15:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DC476B01; Wed, 29 Nov 2023 18:15:01 +0200 (EET)
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
Subject: [PATCH v4 12/23] pinctrl: mediatek: Make use of PINCTRL_GROUP_DESC()
Date: Wed, 29 Nov 2023 18:06:35 +0200
Message-ID: <20231129161459.1002323-13-andriy.shevchenko@linux.intel.com>
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

Make use of PINCTRL_GROUP_DESC() instead of open coding it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.h | 7 +------
 drivers/pinctrl/mediatek/pinctrl-paris.h | 7 +------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.h b/drivers/pinctrl/mediatek/pinctrl-moore.h
index e1b4b82b9d3d..22ef1ffbcdcb 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.h
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.h
@@ -38,12 +38,7 @@
 	}
 
 #define PINCTRL_PIN_GROUP(name, id)			\
-	{						\
-		name,					\
-		id##_pins,				\
-		ARRAY_SIZE(id##_pins),			\
-		id##_funcs,				\
-	}
+	PINCTRL_GROUP_DESC(name, id##_pins, ARRAY_SIZE(id##_pins), id##_funcs)
 
 int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc);
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h b/drivers/pinctrl/mediatek/pinctrl-paris.h
index 8762ac599329..f208a904c4a8 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.h
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
@@ -50,12 +50,7 @@
 	}
 
 #define PINCTRL_PIN_GROUP(name, id)			\
-	{						\
-		name,					\
-		id##_pins,				\
-		ARRAY_SIZE(id##_pins),			\
-		id##_funcs,				\
-	}
+	PINCTRL_GROUP_DESC(name, id##_pins, ARRAY_SIZE(id##_pins), id##_funcs)
 
 int mtk_paris_pinctrl_probe(struct platform_device *pdev);
 
-- 
2.43.0.rc1.1.gbec44491f096


