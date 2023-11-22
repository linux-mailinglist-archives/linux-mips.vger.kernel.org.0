Return-Path: <linux-mips+bounces-156-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 644FC7F4CE1
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 17:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 961701C20905
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 16:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB5F59B72;
	Wed, 22 Nov 2023 16:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TpjkR4yb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5543810F3;
	Wed, 22 Nov 2023 08:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700671256; x=1732207256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zb7vywnY5jyenAxj9sbtLt+bBMaQnCZHqRqsqRdZ/10=;
  b=TpjkR4ybmQv1oDl/aab/fwxQJ6A8kESeoQJRFaR8VDzC9cuFuvs8SObS
   +a29iQUZxwWQ1Aux/2g23AknGNbSiig/rXyviwSAY6kTCkYxEGfFpzdzt
   SH+8Z5CnFDUmOlD2KgYUndzDdlc4vRfpIGcvsiu6NZCysLh/I0ZV9JN84
   B+tc6c+oWwqNYNjqsIWn32j9B0y5tu+O25Irqp/gyoZ5uAOeaNgAP1uPw
   GugKUK/rjspw+6mcYSprin+IHL/x/33RdstqaziJmNI8ypJMzvupARABi
   PG7C7/s2q+NkYh+N0h49k95SYNjUTWnkBhd06lqyVIQXQVEkw9X3jPZkk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="456414207"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="456414207"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 08:40:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="884681493"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="884681493"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2023 08:40:45 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id F1D64387; Wed, 22 Nov 2023 18:40:44 +0200 (EET)
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
Subject: [PATCH v1 02/17] pinctrl: nuvoton: Convert to use struct pingroup and PINCTRL_PINGROUP()
Date: Wed, 22 Nov 2023 18:35:34 +0200
Message-ID: <20231122164040.2262742-3-andriy.shevchenko@linux.intel.com>
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

The pin control header provides struct pingroup and PINCTRL_PINGROUP() macro.
Utilize them instead of open coded variants in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 0cff44b07b29..4589900244c7 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -474,9 +474,8 @@ enum {
 #undef WPCM450_GRP
 };
 
-static struct group_desc wpcm450_groups[] = {
-#define WPCM450_GRP(x) { .name = #x, .pins = x ## _pins, \
-			.num_pins = ARRAY_SIZE(x ## _pins) }
+static struct pingroup wpcm450_groups[] = {
+#define WPCM450_GRP(x) PINCTRL_PINGROUP(#x, x ## _pins, ARRAY_SIZE(x ## _pins))
 	WPCM450_GRPS
 #undef WPCM450_GRP
 };
@@ -852,7 +851,7 @@ static int wpcm450_get_group_pins(struct pinctrl_dev *pctldev,
 				  const unsigned int **pins,
 				  unsigned int *npins)
 {
-	*npins = wpcm450_groups[selector].num_pins;
+	*npins = wpcm450_groups[selector].npins;
 	*pins  = wpcm450_groups[selector].pins;
 
 	return 0;
@@ -901,7 +900,7 @@ static int wpcm450_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	struct wpcm450_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	wpcm450_setfunc(pctrl->gcr_regmap, wpcm450_groups[group].pins,
-			wpcm450_groups[group].num_pins, function);
+			wpcm450_groups[group].npins, function);
 
 	return 0;
 }
-- 
2.43.0.rc1.1.gbec44491f096


