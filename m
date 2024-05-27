Return-Path: <linux-mips+bounces-3345-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF088D0F89
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 23:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 904A01F22C26
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 21:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13AA169AED;
	Mon, 27 May 2024 21:28:02 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08E416937E
	for <linux-mips@vger.kernel.org>; Mon, 27 May 2024 21:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716845282; cv=none; b=u/5Bqy7MBXvMafpw6ir35u/sW5gRQvrcBxVgFXPuld4G92dhq/MSi5RetHc0SQQtzNgyBuqJ/gCA2IHBzwwzOyUMQ5qpoqzt4sEfAPnhtEmXaFmWnOhbnmNoDMTVT5O5a08+t7mIYlFyQbdC2WhpfthnBhua6l6eHMp5xjnV7oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716845282; c=relaxed/simple;
	bh=TdIMYqHRZiMhqimAL3dwrKgZ880JC0XfF5R80wqNJbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DGD047iL23aOwIePpKHDpmubO/9S36MplD0cKSbcrIK+yeb3KyMUPmSg2SBlEH6Dg79U6tImtD9dnhyOlbU3YslrQUoRic5bBNUhtEvBaahncKeqKmC0XrmlQ1RNCuwwWS3HJqR6Sl0hHSifhDkU68Qtc24AmDvikUdFcxJh86o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id fa1daa3f-1c6f-11ef-aaf3-005056bdd08f;
	Tue, 28 May 2024 00:27:53 +0300 (EEST)
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
Subject: [PATCH v1 05/11] pinctrl: pinmux: Add a convenient define PINCTRL_FUNCTION_DESC()
Date: Tue, 28 May 2024 00:24:40 +0300
Message-ID: <20240527212742.1432960-6-andy.shevchenko@gmail.com>
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

Add PINCTRL_FUNCTION_DESC() macro for inline use.

While at it, fix adjective form in the comment of PINCTRL_GROUP_DESC().

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/core.h   |  2 +-
 drivers/pinctrl/pinmux.c |  7 ++-----
 drivers/pinctrl/pinmux.h | 11 ++++++++++-
 3 files changed, 13 insertions(+), 7 deletions(-)

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
index addba55334d9..89b42e05f368 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -858,7 +858,7 @@ EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
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
+	function = PINCTRL_FUNCTION_DESC(name, groups, ngroups, data);
 
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


