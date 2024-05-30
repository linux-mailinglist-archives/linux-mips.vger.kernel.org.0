Return-Path: <linux-mips+bounces-3408-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 585D88D47E4
	for <lists+linux-mips@lfdr.de>; Thu, 30 May 2024 11:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A21E1C23A83
	for <lists+linux-mips@lfdr.de>; Thu, 30 May 2024 09:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6915218509F;
	Thu, 30 May 2024 08:58:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF36118508B
	for <linux-mips@vger.kernel.org>; Thu, 30 May 2024 08:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717059519; cv=none; b=VeqpFmJRwUpM/5Z96lSVxvWzEldFg32/5cG8sxWWbLiUFRJHzrCTCXNccAKkDGf2v6CktpfNHT5mLv8tkcNGP2ZRE0MPspMh026ib9cpyvR3WRCfGmAyaVoxt4laf6Tn9UNsZBuvQRu6qsvLmMMmFCl1J469CnedKlj94/rZjUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717059519; c=relaxed/simple;
	bh=KYoxAAK6S+GIuN2E48DvdIJyuBlhCt1h5mEc1k8V3xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xm+Vivv8n3rc48gLIcwX+feaAUk5KhWbDpb0Kf6E7Bn2tcm5Z7qZqw1NuryT8eXRCICYlEAmAL/qcM+36lmcusyl55P3E3xAQ2+zvlUZ5llNGWJFQPA8DFxuI7HBw7mgoU/eJS8WPAnvqxYBH2yQeo/jfWLH5ibGtSyal9TRgxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id be284b31-1e62-11ef-8d3e-005056bd6ce9;
	Thu, 30 May 2024 11:58:11 +0300 (EEST)
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
Subject: [PATCH v3 08/11] pinctrl: ingenic: Convert to use func member
Date: Thu, 30 May 2024 11:55:17 +0300
Message-ID: <20240530085745.1539925-9-andy.shevchenko@gmail.com>
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

Convert drivers to use func member embedded in struct function_desc,
because other members will be removed to avoid duplication and
desynchronisation of the generic pin function description.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 959b9ea83a66..31703737731b 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -96,9 +96,7 @@
 
 #define INGENIC_PIN_FUNCTION(_name_, id)							\
 	{											\
-		.name = _name_,									\
-		.group_names = id##_groups,							\
-		.num_group_names = ARRAY_SIZE(id##_groups),					\
+		.func = PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups)),	\
 		.data = NULL,									\
 	}
 
@@ -3769,7 +3767,7 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->name, grp->grp.name);
+		func->func.name, grp->grp.name);
 
 	mode = (uintptr_t)grp->data;
 	if (mode <= 3) {
@@ -4317,14 +4315,14 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < chip_info->num_functions; i++) {
-		const struct function_desc *func = &chip_info->functions[i];
+		const struct function_desc *function = &chip_info->functions[i];
+		const struct pinfunction *func = &function->func;
 
 		err = pinmux_generic_add_function(jzpc->pctl, func->name,
-				func->group_names, func->num_group_names,
-				func->data);
+						  func->groups, func->ngroups,
+						  function->data);
 		if (err < 0) {
-			dev_err(dev, "Failed to register function %s\n",
-					func->name);
+			dev_err(dev, "Failed to register function %s\n", func->name);
 			return err;
 		}
 	}
-- 
2.45.1


