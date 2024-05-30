Return-Path: <linux-mips+bounces-3401-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A27C48D47CD
	for <lists+linux-mips@lfdr.de>; Thu, 30 May 2024 11:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41C771F21146
	for <lists+linux-mips@lfdr.de>; Thu, 30 May 2024 09:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC64176ADD;
	Thu, 30 May 2024 08:58:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54507176AC5
	for <linux-mips@vger.kernel.org>; Thu, 30 May 2024 08:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717059489; cv=none; b=dw0tkH/unUzkyiCGepw2t/HBtSpoLDimio0R0V1qIbCxlKlZzGzVEHwt4uaWzCUFuWbscdOyBwfGR8zI/gT8n5icwSN3EfqWch97IDhrUqkQIkqgx32IHd6rfmLbpc6mwbOuFdiSg7eRxtQ/clRXiKgLhR82GEBzMYfboSKsFCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717059489; c=relaxed/simple;
	bh=1XtJWJ5PeRCirDjIxVIenINEe49dxjFUvbLv8ITaSpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FGCTN3TJXZLLvl3HhupjIv+WksTHk2tKhokrfbvhfNhso94+FBZOdlXOQOn9pesbB73IqMQifN43TTpCCdN+XQnLhSbXkaQVzTrzEacHV1lzidJkx1kI5DKFzU30WHSwt+WHnwBFqOLHNRymx++AmB9wRdN1eJ4hxJvUMUJeShc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id b2e2e8ab-1e62-11ef-aaf9-005056bdd08f;
	Thu, 30 May 2024 11:57:53 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
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
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 01/11] pinctrl: berlin: Make use of struct pinfunction
Date: Thu, 30 May 2024 11:55:10 +0300
Message-ID: <20240530085745.1539925-2-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
References: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
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
 drivers/pinctrl/berlin/berlin.c | 21 +++++++++------------
 drivers/pinctrl/berlin/berlin.h |  6 ------
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index 9550cc8095c2..c372a2a24be4 100644
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
 
@@ -264,16 +262,15 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 				function->groups =
 					devm_kcalloc(&pdev->dev,
 						     function->ngroups,
-						     sizeof(char *),
+						     sizeof(*function->groups),
 						     GFP_KERNEL);
-
 				if (!function->groups) {
 					kfree(pctrl->functions);
 					return -ENOMEM;
 				}
 			}
 
-			groups = function->groups;
+			groups = (const char **)function->groups;
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


