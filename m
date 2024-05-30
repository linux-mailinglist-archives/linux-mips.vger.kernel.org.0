Return-Path: <linux-mips+bounces-3406-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D178D47DC
	for <lists+linux-mips@lfdr.de>; Thu, 30 May 2024 11:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59873B22416
	for <lists+linux-mips@lfdr.de>; Thu, 30 May 2024 09:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5CF183A62;
	Thu, 30 May 2024 08:58:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CC2181D1B
	for <linux-mips@vger.kernel.org>; Thu, 30 May 2024 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717059496; cv=none; b=ON6hT/ftRQcEna/t5UHOVpmM4BdQVgzXsa0OAzBo6T5F0BEBJDvVLXewIRk1f2iBbOzQP0RJmAkKJYRHXlw0aDkRi9LvUIJhAyoIEJG2QbFqjpagpaisNJSmqNSmyRhun1JCwE9Ow6Q42hDV7JGqPb5xXj4KzBTgiWFBIdiNzR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717059496; c=relaxed/simple;
	bh=fcakMpeN0kh1ivrPRRMUOj3J303wd5sdAUxeGg+CQOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJjTO6NrCRHodDw6ZpkyK7UroUrQ+tAxxw7wiSC4pQX41tPplEuLAx4394GiHw3aRDriYJRaRBs99OmPAIcP0mTXIWl69DijIouNjUciqRIQuPfJNNhwyVx8tljEShVnhGrXQfU7eHBDUS3QOEpMKRSUZiepooQsn5pzUru7wv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id bdc774e0-1e62-11ef-8e2e-005056bdf889;
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
Subject: [PATCH v3 07/11] pinctrl: imx: Convert to use func member
Date: Thu, 30 May 2024 11:55:16 +0300
Message-ID: <20240530085745.1539925-8-andy.shevchenko@gmail.com>
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
 drivers/pinctrl/freescale/pinctrl-imx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 2d3d80921c0d..1ccdeb86d8a7 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -266,7 +266,7 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	npins = grp->grp.npins;
 
 	dev_dbg(ipctl->dev, "enable function %s group %s\n",
-		func->name, grp->grp.name);
+		func->func.name, grp->grp.name);
 
 	for (i = 0; i < npins; i++) {
 		/*
@@ -593,21 +593,21 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 		return -EINVAL;
 
 	/* Initialise function */
-	func->name = np->name;
-	func->num_group_names = of_get_child_count(np);
-	if (func->num_group_names == 0) {
+	func->func.name = np->name;
+	func->func.ngroups = of_get_child_count(np);
+	if (func->func.ngroups == 0) {
 		dev_info(ipctl->dev, "no groups defined in %pOF\n", np);
 		return -EINVAL;
 	}
 
-	group_names = devm_kcalloc(ipctl->dev, func->num_group_names,
-				   sizeof(char *), GFP_KERNEL);
+	group_names = devm_kcalloc(ipctl->dev, func->func.ngroups,
+				   sizeof(*func->func.groups), GFP_KERNEL);
 	if (!group_names)
 		return -ENOMEM;
 	i = 0;
 	for_each_child_of_node(np, child)
 		group_names[i++] = child->name;
-	func->group_names = group_names;
+	func->func.groups = group_names;
 
 	i = 0;
 	for_each_child_of_node(np, child) {
-- 
2.45.1


