Return-Path: <linux-mips+bounces-3366-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 887328D252C
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 21:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B732A1C26DDF
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 19:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488AC17B41E;
	Tue, 28 May 2024 19:50:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4166917B41A
	for <linux-mips@vger.kernel.org>; Tue, 28 May 2024 19:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716925809; cv=none; b=m+cCqxq/vYXslVgA9gkAhquFsuG5fl+2Tc9BJIesfpCc6OKEi3fUFcSnqJGpk0HuKP9DW5uWkddg+4vu8qrRHYZ0c4OgKYI1YdP9qblkoLsoWvGhlH5hGdEWsP4rKebbUSKeXDBZa9gZetx2qAhvpihvLNOpx/go0ZZFaYsjSMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716925809; c=relaxed/simple;
	bh=A072AS2lgROf98Pwf8Fyliy4tqTS+ybyUetYZctK3UE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z4osDq9Q9Ejxzhzr7mxXnBz1gyxHWdFiJlubioxejSLyA+R5YnFE9K1f4lb8zEpw3cT14bHEhVPfOZNRF3lEbSE4vNUMSoaxRlEW32Z+tk0BhDDheVdHu48mV2XiQdM1zH4YeA8G7yjr10thJXKBBPZW+kwORDuDOfVIo4AD9Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 7893f7c5-1d2b-11ef-8e2b-005056bdf889;
	Tue, 28 May 2024 22:50:01 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 05/11] pinctrl: pinmux: Add a convenient define PINCTRL_FUNCTION_DESC()
Date: Tue, 28 May 2024 22:44:56 +0300
Message-ID: <20240528194951.1489887-6-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
References: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Add PINCTRL_FUNCTION_DESC() macro for inline use.

While at it, fix adjective form in the comment of PINCTRL_GROUP_DESC().

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/core.h   |  2 +-
 drivers/pinctrl/pinmux.c |  9 +++------
 drivers/pinctrl/pinmux.h | 11 ++++++++++-
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 837fd5bd903d..4e07707d2435 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -206,7 +206,7 @@ struct group_desc {
 	void *data;
 };
 
-/* Convenience macro to define a generic pin group descriptor */
+/* Convenient macro to define a generic pin group descriptor */
 #define PINCTRL_GROUP_DESC(_name, _pins, _num_pins, _data)	\
 (struct group_desc) {						\
 	.grp = PINCTRL_PINGROUP(_name, _pins, _num_pins),	\
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index addba55334d9..8d69fa1b0bff 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -852,13 +852,13 @@ EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
  * @pctldev: pin controller device
  * @name: name of the function
  * @groups: array of pin groups
- * @num_groups: number of pin groups
+ * @ngroups: number of pin groups
  * @data: pin controller driver specific data
  */
 int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				const char *name,
 				const char * const *groups,
-				const unsigned int num_groups,
+				const unsigned int ngroups,
 				void *data)
 {
 	struct function_desc *function;
@@ -877,10 +877,7 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 	if (!function)
 		return -ENOMEM;
 
-	function->name = name;
-	function->group_names = groups;
-	function->num_group_names = num_groups;
-	function->data = data;
+	*function = PINCTRL_FUNCTION_DESC(name, groups, ngroups, data);
 
 	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
 	if (error)
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 7c8aa25ccc80..52e6e4db88b4 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -145,6 +145,15 @@ struct function_desc {
 	void *data;
 };
 
+/* Convenient macro to define a generic pin function descriptor */
+#define PINCTRL_FUNCTION_DESC(_name, _grps, _num_grps, _data)	\
+(struct function_desc) {					\
+	.name = _name,						\
+	.group_names = _grps,					\
+	.num_group_names = _num_grps,				\
+	.data = _data,						\
+}
+
 int pinmux_generic_get_function_count(struct pinctrl_dev *pctldev);
 
 const char *
@@ -162,7 +171,7 @@ struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
 int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				const char *name,
 				const char * const *groups,
-				unsigned int const num_groups,
+				unsigned int const ngroups,
 				void *data);
 
 int pinmux_generic_remove_function(struct pinctrl_dev *pctldev,
-- 
2.45.1


