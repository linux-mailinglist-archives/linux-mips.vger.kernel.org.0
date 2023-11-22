Return-Path: <linux-mips+bounces-161-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E04C7F4CFA
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 17:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C9F9B20C1E
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 16:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F6959B7A;
	Wed, 22 Nov 2023 16:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mEweqi9s"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D15810C7;
	Wed, 22 Nov 2023 08:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700671275; x=1732207275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2IJ5RkmvKb06y4Pls/nYVezIgr9GrpPlE4qXI9p0tOg=;
  b=mEweqi9sFj9kJx1OhGjlXbj2L+Z2b287QDX23g8ECuUAYiq+ogPd9IEU
   NiuEE0N2J8lto8tk+AEuDpU5kZRpmZqxh6Ppzw+sDxQtF55rULI/3YfVr
   fMHPtkAYW9BM6GeaLJwp2yCNd0BkvC7ArPWtKe0H3f1ghdLBiz4YzoeMw
   g1mVSZLr7kIzBp9ONdhQtxz0n0nSkOKjm9X9Kxjuanj16e5XaPwryC7SF
   uVkNowjx4bTC5c8ELKm3hKGmHvE1fg4F7p7lqmlRG7l5NG5oedDaDR6mA
   B1/BkDCvRgU1Ht+tH3OA2HhOIsbgABtjuTwc2WcMUB5GEeIwSGaP1Pzjd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="456414350"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="456414350"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 08:41:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="884681649"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="884681649"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2023 08:41:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B90287E4; Wed, 22 Nov 2023 18:40:45 +0200 (EET)
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
Subject: [PATCH v1 13/17] pinctrl: keembay: Convert to use grp member
Date: Wed, 22 Nov 2023 18:35:45 +0200
Message-ID: <20231122164040.2262742-14-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/pinctrl-keembay.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 152c35bce8ec..ace61f8e8936 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -945,7 +945,7 @@ static int keembay_set_mux(struct pinctrl_dev *pctldev, unsigned int fun_sel,
 		return -EINVAL;
 
 	/* Change modes for pins in the selected group */
-	pin = *grp->pins;
+	pin = *grp->grp.pins;
 	pin_mode = *(u8 *)(func->data);
 
 	val = keembay_read_reg(kpc->base1 + KEEMBAY_GPIO_MODE, pin);
@@ -1528,12 +1528,11 @@ static int keembay_build_groups(struct keembay_pinctrl *kpc)
 	/* Each pin is categorised as one group */
 	for (i = 0; i < kpc->ngroups; i++) {
 		const struct pinctrl_pin_desc *pdesc = keembay_pins + i;
-		struct group_desc *kmb_grp = grp + i;
+		struct pingroup *pgrp = &grp[i].grp;
 
-		kmb_grp->name = pdesc->name;
-		kmb_grp->pins = (int *)&pdesc->number;
-		pinctrl_generic_add_group(kpc->pctrl, kmb_grp->name,
-					  kmb_grp->pins, 1, NULL);
+		pgrp->name = pdesc->name;
+		pgrp->pins = (int *)&pdesc->number;
+		pinctrl_generic_add_group(kpc->pctrl, pgrp->name, pgrp->pins, 1, NULL);
 	}
 
 	return 0;
-- 
2.43.0.rc1.1.gbec44491f096


