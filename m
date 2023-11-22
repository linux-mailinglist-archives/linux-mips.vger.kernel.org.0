Return-Path: <linux-mips+bounces-167-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EF87F4D53
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 17:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B792281452
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 16:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14ECB51026;
	Wed, 22 Nov 2023 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QkMJVAU1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FDED40;
	Wed, 22 Nov 2023 08:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700671916; x=1732207916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d7RiC36q0FYTd81POcZES8vkSbp1GvRz+YFDhzV1grg=;
  b=QkMJVAU1GXt43bNVeFNBoWhjaSdVIy3l/C5431XVNDl51yJOx+Xy6+Hb
   RAj3lKxUYP2Gt70wiTI4MvMpv/A8hjlFAkwNnLirA2r5jxkJyFZcGo0+J
   GbZ5nWmRM90/AwxTMvHCUB+EMp3MR+YePseu1JRGlUeQZPFrOkFwWcCCj
   F7wKQCiKlkguux46+QGJfZGzQ0Bqz9BtMtRZ7MNNaKKfhxGrFz4uJ3k3K
   a2P5A4blETTfrms0Fs6uZgQ2IdXHouMQpmVtOMe+6T2AxCXz2h2cF/1FJ
   R6X/iT3TD8MK5BgBdHUf5I1503Hu6a2o5aJO9UBRydhaMEdR1ByFHbYYQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5233367"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="5233367"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 08:51:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="910887970"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="910887970"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2023 08:51:16 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5B248592; Wed, 22 Nov 2023 18:40:45 +0200 (EET)
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
Subject: [PATCH v1 08/17] pinctrl: core: Embed struct pingroup into struct group_desc
Date: Wed, 22 Nov 2023 18:35:40 +0200
Message-ID: <20231122164040.2262742-9-andriy.shevchenko@linux.intel.com>
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

struct group_desc is a particular version of the struct pingroup
with associated opaque data. Start switching pin control core and
drivers to use it explicitly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 15 ++++++++++++---
 drivers/pinctrl/core.h |  5 +++++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index c0354ea0597a..981e2e375a39 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -559,7 +559,10 @@ const char *pinctrl_generic_get_group_name(struct pinctrl_dev *pctldev,
 	if (!group)
 		return NULL;
 
-	return group->name;
+	if (group->name)
+		return group->name;
+
+	return group->grp.name;
 }
 EXPORT_SYMBOL_GPL(pinctrl_generic_get_group_name);
 
@@ -585,8 +588,14 @@ int pinctrl_generic_get_group_pins(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 
-	*pins = group->pins;
-	*num_pins = group->num_pins;
+	if (group->pins) {
+		*pins = group->pins;
+		*num_pins = group->num_pins;
+		return 0;
+	}
+
+	*pins = group->grp.pins;
+	*num_pins = group->grp.npins;
 
 	return 0;
 }
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 179948e44016..7a21af2b437e 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -194,14 +194,18 @@ struct pinctrl_maps {
 
 #ifdef CONFIG_GENERIC_PINCTRL_GROUPS
 
+#include <linux/pinctrl/pinctrl.h>
+
 /**
  * struct group_desc - generic pin group descriptor
+ * @grp: generic data of the pin group (name and pins)
  * @name: name of the pin group
  * @pins: array of pins that belong to the group
  * @num_pins: number of pins in the group
  * @data: pin controller driver specific data
  */
 struct group_desc {
+	struct pingroup grp;
 	const char *name;
 	int *pins;
 	int num_pins;
@@ -211,6 +215,7 @@ struct group_desc {
 /* Convenience macro to define a generic pin group descriptor */
 #define PINCTRL_GROUP_DESC(_name, _pins, _num_pins, _data)	\
 (struct group_desc) {						\
+	.grp = PINCTRL_PINGROUP(_name, _pins, _num_pins),	\
 	.name = _name,						\
 	.pins = _pins,						\
 	.num_pins = _num_pins,					\
-- 
2.43.0.rc1.1.gbec44491f096


