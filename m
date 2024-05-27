Return-Path: <linux-mips+bounces-3337-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5D48D0F76
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 23:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13B94282FD1
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 21:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8600167D83;
	Mon, 27 May 2024 21:27:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63B41667F2
	for <linux-mips@vger.kernel.org>; Mon, 27 May 2024 21:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716845274; cv=none; b=FGLfOeIBMAzDm/ZfgkiGB75PGNthL8qK1Le29YBpJ2noE0g4Yv60DHEuiZvksG/lDFNp+EZxzSnS434isyh0de+xVglJWNShWKv6q+qJJWplp0zH12yh9BNwgw3Uj2yaWkFD0MvsTMqNQhYUT6WRrEUcMws/x0dRxIwM86ReT4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716845274; c=relaxed/simple;
	bh=IG9NOQLA1NVT/Pr565vBNzMxxl6QNt3PXh2uJqn55B8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOnAphs20/S4l+vOwZF4LGDQNunZBNoy1XKzblsPwNI4pxs+L9AVDEK65KGvwF2Ivdg2ZGbdTLbc5xFdcMG1tdnfXcbvp1ZB9yaGgnDhJQnN0YuuFtwfITWGSeTJTslS/KFX5aeiCvZT89rZHlWDoMZX9iGoqQhw7gpagV7DofE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id f7ebd5e0-1c6f-11ef-aaf3-005056bdd08f;
	Tue, 28 May 2024 00:27:50 +0300 (EEST)
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
Subject: [PATCH v1 02/11] pinctrl: equilibrium: Make use of struct pinfunction
Date: Tue, 28 May 2024 00:24:37 +0300
Message-ID: <20240527212742.1432960-3-andy.shevchenko@gmail.com>
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
 drivers/pinctrl/pinctrl-equilibrium.c | 18 +++++++++---------
 drivers/pinctrl/pinctrl-equilibrium.h | 12 ------------
 2 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 6e1be38865c3..9eb1859add11 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -566,8 +566,8 @@ static const struct pinconf_ops eqbr_pinconf_ops = {
 	.pin_config_config_dbg_show	= pinconf_generic_dump_config,
 };
 
-static bool is_func_exist(struct eqbr_pmx_func *funcs, const char *name,
-			 unsigned int nr_funcs, unsigned int *idx)
+static bool is_func_exist(struct pinfunction *funcs, const char *name,
+			  unsigned int nr_funcs, unsigned int *idx)
 {
 	int i;
 
@@ -584,7 +584,7 @@ static bool is_func_exist(struct eqbr_pmx_func *funcs, const char *name,
 	return false;
 }
 
-static int funcs_utils(struct device *dev, struct eqbr_pmx_func *funcs,
+static int funcs_utils(struct device *dev, struct pinfunction *funcs,
 		       unsigned int *nr_funcs, funcs_util_ops op)
 {
 	struct device_node *node = dev->of_node;
@@ -620,12 +620,12 @@ static int funcs_utils(struct device *dev, struct eqbr_pmx_func *funcs,
 
 		case OP_COUNT_NR_FUNC_GRPS:
 			if (is_func_exist(funcs, fn_name, *nr_funcs, &fid))
-				funcs[fid].nr_groups++;
+				funcs[fid].ngroups++;
 			break;
 
 		case OP_ADD_FUNC_GRPS:
 			if (is_func_exist(funcs, fn_name, *nr_funcs, &fid)) {
-				for (j = 0; j < funcs[fid].nr_groups; j++)
+				for (j = 0; j < funcs[fid].ngroups; j++)
 					if (!funcs[fid].groups[j])
 						break;
 				funcs[fid].groups[j] = prop->value;
@@ -645,7 +645,7 @@ static int funcs_utils(struct device *dev, struct eqbr_pmx_func *funcs,
 static int eqbr_build_functions(struct eqbr_pinctrl_drv_data *drvdata)
 {
 	struct device *dev = drvdata->dev;
-	struct eqbr_pmx_func *funcs = NULL;
+	struct pinfunction *funcs = NULL;
 	unsigned int nr_funcs = 0;
 	int i, ret;
 
@@ -666,9 +666,9 @@ static int eqbr_build_functions(struct eqbr_pinctrl_drv_data *drvdata)
 		return ret;
 
 	for (i = 0; i < nr_funcs; i++) {
-		if (!funcs[i].nr_groups)
+		if (!funcs[i].ngroups)
 			continue;
-		funcs[i].groups = devm_kcalloc(dev, funcs[i].nr_groups,
+		funcs[i].groups = devm_kcalloc(dev, funcs[i].ngroups,
 					       sizeof(*(funcs[i].groups)),
 					       GFP_KERNEL);
 		if (!funcs[i].groups)
@@ -688,7 +688,7 @@ static int eqbr_build_functions(struct eqbr_pinctrl_drv_data *drvdata)
 		ret = pinmux_generic_add_function(drvdata->pctl_dev,
 						  funcs[i].name,
 						  funcs[i].groups,
-						  funcs[i].nr_groups,
+						  funcs[i].ngroups,
 						  drvdata);
 		if (ret < 0) {
 			dev_err(dev, "Failed to register function %s\n",
diff --git a/drivers/pinctrl/pinctrl-equilibrium.h b/drivers/pinctrl/pinctrl-equilibrium.h
index 83768cc8b3db..b4d149bde39d 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.h
+++ b/drivers/pinctrl/pinctrl-equilibrium.h
@@ -67,18 +67,6 @@ struct gpio_irq_type {
 	unsigned int logic_type;
 };
 
-/**
- * struct eqbr_pmx_func: represent a pin function.
- * @name: name of the pin function, used to lookup the function.
- * @groups: one or more names of pin groups that provide this function.
- * @nr_groups: number of groups included in @groups.
- */
-struct eqbr_pmx_func {
-	const char		*name;
-	const char		**groups;
-	unsigned int		nr_groups;
-};
-
 /**
  * struct eqbr_pin_bank: represent a pin bank.
  * @membase: base address of the pin bank register.
-- 
2.45.1


