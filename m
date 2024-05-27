Return-Path: <linux-mips+bounces-3336-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B505C8D0F73
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 23:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F4B21F2215C
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 21:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8072153389;
	Mon, 27 May 2024 21:27:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA3E16191E
	for <linux-mips@vger.kernel.org>; Mon, 27 May 2024 21:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716845273; cv=none; b=gtSTiAHKoOgF27yKqsLd2Y6bZwIW1dBbyGYlcrcTG+jjW65s6MFCPJVieV5vh8RwFRPgmObL3EW/1TCfuT/N+ItnDe4uxM4bs62cWw9CRz2FB29QrvFntzK/+5D5WlKK5V3HGnGPGAUh3/8dzprwZ2KUZaSSxTLQhYrdLyswU6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716845273; c=relaxed/simple;
	bh=k+YxT8gejObtUbXPnSVYjoPdK+L/kbu3vRxAezGtLBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evXmjQqFoz/TKmgTfwKJpet7+cbZy38TEet4m1VctuTBiSxun7fynY0jDuCfJhwkIbkw1r4r3wPsK4V3GKHeMB2a8rdAI8GjglL4njTY8yAhQB9A2D27Q6xXdhboqHBqoJL5anx7Ij9mgl9kKI3XfwEkqNrt1E9PKFejLvr3tM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id f7303f91-1c6f-11ef-80bc-005056bdfda7;
	Tue, 28 May 2024 00:27:49 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 01/11] pinctrl: berlin: Make use of struct pinfunction
Date: Tue, 28 May 2024 00:24:36 +0300
Message-ID: <20240527212742.1432960-2-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527212742.1432960-1-andy.shevchenko@gmail.com>
References: <20240527212742.1432960-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Since pin control provides a generic data type for the pin function,
use it in the driver.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/berlin/berlin.c | 33 +++++++++++++--------------------
 drivers/pinctrl/berlin/berlin.h |  6 ------
 2 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index 9550cc8095c2..3c0873a00fd3 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -27,7 +27,7 @@ struct berlin_pinctrl {
 	struct regmap *regmap;
 	struct device *dev;
 	const struct berlin_pinctrl_desc *desc;
-	struct berlin_pinctrl_function *functions;
+	struct pinfunction *functions;
 	unsigned nfunctions;
 	struct pinctrl_dev *pctrl_dev;
 };
@@ -120,12 +120,12 @@ static const char *berlin_pinmux_get_function_name(struct pinctrl_dev *pctrl_dev
 static int berlin_pinmux_get_function_groups(struct pinctrl_dev *pctrl_dev,
 					     unsigned function,
 					     const char * const **groups,
-					     unsigned * const num_groups)
+					     unsigned * const ngroups)
 {
 	struct berlin_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
 
 	*groups = pctrl->functions[function].groups;
-	*num_groups = pctrl->functions[function].ngroups;
+	*ngroups = pctrl->functions[function].ngroups;
 
 	return 0;
 }
@@ -153,7 +153,7 @@ static int berlin_pinmux_set(struct pinctrl_dev *pctrl_dev,
 {
 	struct berlin_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
 	const struct berlin_desc_group *group_desc = pctrl->desc->groups + group;
-	struct berlin_pinctrl_function *func = pctrl->functions + function;
+	struct pinfunction *func = pctrl->functions + function;
 	struct berlin_desc_function *function_desc =
 		berlin_pinctrl_find_function_by_name(pctrl, group_desc,
 						     func->name);
@@ -180,7 +180,7 @@ static const struct pinmux_ops berlin_pinmux_ops = {
 static int berlin_pinctrl_add_function(struct berlin_pinctrl *pctrl,
 				       const char *name)
 {
-	struct berlin_pinctrl_function *function = pctrl->functions;
+	struct pinfunction *function = pctrl->functions;
 
 	while (function->name) {
 		if (!strcmp(function->name, name)) {
@@ -214,8 +214,7 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 	}
 
 	/* we will reallocate later */
-	pctrl->functions = kcalloc(max_functions,
-				   sizeof(*pctrl->functions), GFP_KERNEL);
+	pctrl->functions = kcalloc(max_functions, sizeof(*pctrl->functions), GFP_KERNEL);
 	if (!pctrl->functions)
 		return -ENOMEM;
 
@@ -242,8 +241,7 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 		desc_function = desc_group->functions;
 
 		while (desc_function->name) {
-			struct berlin_pinctrl_function
-				*function = pctrl->functions;
+			struct pinfunction *function = pctrl->functions;
 			const char **groups;
 			bool found = false;
 
@@ -260,20 +258,15 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 				return -EINVAL;
 			}
 
-			if (!function->groups) {
-				function->groups =
-					devm_kcalloc(&pdev->dev,
+			groups = devm_krealloc_array(&pdev->dev, function->groups,
 						     function->ngroups,
-						     sizeof(char *),
+						     sizeof(*function->groups),
 						     GFP_KERNEL);
-
-				if (!function->groups) {
-					kfree(pctrl->functions);
-					return -ENOMEM;
-				}
+			if (!groups) {
+				kfree(pctrl->functions);
+				return -ENOMEM;
 			}
-
-			groups = function->groups;
+			function->groups = groups;
 			while (*groups)
 				groups++;
 
diff --git a/drivers/pinctrl/berlin/berlin.h b/drivers/pinctrl/berlin/berlin.h
index d7787754d1ed..231aab61d415 100644
--- a/drivers/pinctrl/berlin/berlin.h
+++ b/drivers/pinctrl/berlin/berlin.h
@@ -28,12 +28,6 @@ struct berlin_pinctrl_desc {
 	unsigned			ngroups;
 };
 
-struct berlin_pinctrl_function {
-	const char	*name;
-	const char	**groups;
-	unsigned	ngroups;
-};
-
 #define BERLIN_PINCTRL_GROUP(_name, _offset, _width, _lsb, ...)		\
 	{								\
 		.name = _name,						\
-- 
2.45.1


