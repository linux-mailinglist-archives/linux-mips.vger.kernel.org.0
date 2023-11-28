Return-Path: <linux-mips+bounces-325-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 173DA7FC4EA
	for <lists+linux-mips@lfdr.de>; Tue, 28 Nov 2023 21:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7BC9282E59
	for <lists+linux-mips@lfdr.de>; Tue, 28 Nov 2023 20:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3971040C04;
	Tue, 28 Nov 2023 20:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sp+MVrjA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAAC519A9;
	Tue, 28 Nov 2023 12:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701202105; x=1732738105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=liPHDLuYbD94sAXW+HKE2PmyEtAsJEMqj1/hueiHOBE=;
  b=Sp+MVrjAF7v4amKtjEigTaQo+ecDlhzxk/RJWxUdXDudQFpB9Axhjy5V
   Ea1SO/i/kh4CCHV5SI76BVxPf1hQrJIunLZLUZmup/nNeiraQA0uhQmrb
   uhC/mv7uL7mmUv+KmNaXq883aFRBlw2+Pf7ALjkaGbsoPI0DL+WqY9SHB
   LePozd+oUJaex04b4GyTVmN7V1+4mm9v8WPECCQd2Zq9fp5FeNWl6zDy+
   6m7iwB9mJJNQHq8Y7cl8ApMKzkkNdoW9aubXoBfzscWBuZEgiRu518IJx
   FRIUEoL/R28JjyiI42LFe0MhgAMCfkOqYZ4SZ130W2mqxkr4IT0+sf72F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="457347162"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="457347162"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 12:07:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="1100254426"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="1100254426"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2023 12:02:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DED66BD5; Tue, 28 Nov 2023 22:01:58 +0200 (EET)
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
Subject: [PATCH v3 19/22] pinctrl: mediatek: Convert to use grp member
Date: Tue, 28 Nov 2023 21:57:08 +0200
Message-ID: <20231128200155.438722-20-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/mediatek/pinctrl-moore.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index c3d59eddd994..d972584c0519 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -56,12 +56,12 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->name, grp->name);
+		func->name, grp->grp.name);
 
-	for (i = 0; i < grp->num_pins; i++) {
+	for (i = 0; i < grp->grp.npins; i++) {
 		const struct mtk_pin_desc *desc;
 		int *pin_modes = grp->data;
-		int pin = grp->pins[i];
+		int pin = grp->grp.pins[i];
 
 		desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 		if (!desc->name)
@@ -602,13 +602,12 @@ static int mtk_build_groups(struct mtk_pinctrl *hw)
 
 	for (i = 0; i < hw->soc->ngrps; i++) {
 		const struct group_desc *group = hw->soc->grps + i;
+		const struct pingroup *grp = &group->grp;
 
-		err = pinctrl_generic_add_group(hw->pctrl, group->name,
-						group->pins, group->num_pins,
+		err = pinctrl_generic_add_group(hw->pctrl, grp->name, grp->pins, grp->npins,
 						group->data);
 		if (err < 0) {
-			dev_err(hw->dev, "Failed to register group %s\n",
-				group->name);
+			dev_err(hw->dev, "Failed to register group %s\n", grp->name);
 			return err;
 		}
 	}
-- 
2.43.0.rc1.1.gbec44491f096


