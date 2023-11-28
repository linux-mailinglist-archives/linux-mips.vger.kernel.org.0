Return-Path: <linux-mips+bounces-318-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8957FC4C7
	for <lists+linux-mips@lfdr.de>; Tue, 28 Nov 2023 21:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47590282C26
	for <lists+linux-mips@lfdr.de>; Tue, 28 Nov 2023 20:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D4B40BF3;
	Tue, 28 Nov 2023 20:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVPOYKfE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022391BCE;
	Tue, 28 Nov 2023 12:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701201908; x=1732737908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AdFjMuClohqBUYL/nDsewEobDAXp1hIEsDTJLpD8JyY=;
  b=iVPOYKfE527c+MclXuHNLO+hUlodwmRGRwnlS5NVLJ1I97q4aRYcEVX9
   k6ZaQQf8gjVM8X7JsQj4aXwe1FnFu32a/KLHCHBo+hFclkwygUPpHnUXP
   4r1Sr/N/kDj8XCp1C28r7p13RFlc8aEsxgcNckX6CXhfp6aXvNqoCHRDG
   vDtgkS+WpbRBJwYlnbQ7eoIheNfyAwBGw1qer//KR6oeMpVwb3W8ld8R+
   E6pClUTpybbVE+/nAw1qvs5wOUEU0cujlSX/HDTb+e7TzeOuopdFMVTGF
   R+8k4GIpCGbLZj4Fw/Me1/GZXN6pdVNqGrWabBrdkCEvACUu1d+Jh+39k
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6218031"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6218031"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 12:02:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="797687956"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="797687956"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 28 Nov 2023 12:02:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5E208A9A; Tue, 28 Nov 2023 22:01:58 +0200 (EET)
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
Subject: [PATCH v3 10/22] pinctrl: core: Add a convenient define PINCTRL_GROUP_DESC()
Date: Tue, 28 Nov 2023 21:56:59 +0200
Message-ID: <20231128200155.438722-11-andriy.shevchenko@linux.intel.com>
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

Add PINCTRL_GROUP_DESC() macro for inline use.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 5 +----
 drivers/pinctrl/core.h | 9 +++++++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index d20e3aad923e..3f1fd50fbb10 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -660,10 +660,7 @@ int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
 	if (!group)
 		return -ENOMEM;
 
-	group->name = name;
-	group->pins = pins;
-	group->num_pins = num_pins;
-	group->data = data;
+	*group = PINCTRL_GROUP_DESC(name, pins, num_pins, data);
 
 	error = radix_tree_insert(&pctldev->pin_group_tree, selector, group);
 	if (error)
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 01ea1ce99fe8..276a631fd49c 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -208,6 +208,15 @@ struct group_desc {
 	void *data;
 };
 
+/* Convenience macro to define a generic pin group descriptor */
+#define PINCTRL_GROUP_DESC(_name, _pins, _num_pins, _data)	\
+(struct group_desc) {						\
+	.name = _name,						\
+	.pins = _pins,						\
+	.num_pins = _num_pins,					\
+	.data = _data,						\
+}
+
 int pinctrl_generic_get_group_count(struct pinctrl_dev *pctldev);
 
 const char *pinctrl_generic_get_group_name(struct pinctrl_dev *pctldev,
-- 
2.43.0.rc1.1.gbec44491f096


