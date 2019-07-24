Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74BC1734F7
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jul 2019 19:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbfGXRRB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jul 2019 13:17:01 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:49362 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728175AbfGXRRA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Jul 2019 13:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1563988615; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/3Ah8FKXnjzRiOWf3wczuIH2HmTLx+HtvIJLBEWIgPQ=;
        b=nNv4CdDIpER41aTP6dFPkZcunw7px4KoQ+XqesgDrN83plO/tOBEU6zdJHiRVylgxwigXO
        DKMC4zaNj15reDjvGl6eRcUrIXDFXxpfnX32u+QTcrUbAPqAThq78hh2s8VyrmTTQYWfeh
        xYasc+CnAWA2uZ4gc3UsH3xbIq6uZe4=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, od@zcrc.me,
        Mathieu Malaterre <malat@debian.org>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v15 04/13] mfd/syscon: Add device_node_to_regmap()
Date:   Wed, 24 Jul 2019 13:16:06 -0400
Message-Id: <20190724171615.20774-5-paul@crapouillou.net>
In-Reply-To: <20190724171615.20774-1-paul@crapouillou.net>
References: <20190724171615.20774-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

device_node_to_regmap() is exactly like syscon_node_to_regmap(), but it
does not check that the node is compatible with "syscon", and won't
attach the first clock it finds to the regmap.

The rationale behind this, is that one device node with a standard
compatible string "foo,bar" can be covered by multiple drivers sharing a
regmap, or by a single driver doing all the job without a regmap, but
these are implementation details which shouldn't reflect on the
devicetree.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v15: New patch

 drivers/mfd/syscon.c       | 46 +++++++++++++++++++++++++-------------
 include/linux/mfd/syscon.h |  6 +++++
 2 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index b65e585fc8c6..660723276481 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -40,7 +40,7 @@ static const struct regmap_config syscon_regmap_config = {
 	.reg_stride = 4,
 };
 
-static struct syscon *of_syscon_register(struct device_node *np)
+static struct syscon *of_syscon_register(struct device_node *np, bool check_clk)
 {
 	struct clk *clk;
 	struct syscon *syscon;
@@ -51,9 +51,6 @@ static struct syscon *of_syscon_register(struct device_node *np)
 	struct regmap_config syscon_config = syscon_regmap_config;
 	struct resource res;
 
-	if (!of_device_is_compatible(np, "syscon"))
-		return ERR_PTR(-EINVAL);
-
 	syscon = kzalloc(sizeof(*syscon), GFP_KERNEL);
 	if (!syscon)
 		return ERR_PTR(-ENOMEM);
@@ -117,16 +114,18 @@ static struct syscon *of_syscon_register(struct device_node *np)
 		goto err_regmap;
 	}
 
-	clk = of_clk_get(np, 0);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		/* clock is optional */
-		if (ret != -ENOENT)
-			goto err_clk;
-	} else {
-		ret = regmap_mmio_attach_clk(regmap, clk);
-		if (ret)
-			goto err_attach;
+	if (check_clk) {
+		clk = of_clk_get(np, 0);
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+			/* clock is optional */
+			if (ret != -ENOENT)
+				goto err_clk;
+		} else {
+			ret = regmap_mmio_attach_clk(regmap, clk);
+			if (ret)
+				goto err_attach;
+		}
 	}
 
 	syscon->regmap = regmap;
@@ -150,7 +149,8 @@ static struct syscon *of_syscon_register(struct device_node *np)
 	return ERR_PTR(ret);
 }
 
-struct regmap *syscon_node_to_regmap(struct device_node *np)
+static struct regmap *device_node_get_regmap(struct device_node *np,
+					     bool check_clk)
 {
 	struct syscon *entry, *syscon = NULL;
 
@@ -165,13 +165,27 @@ struct regmap *syscon_node_to_regmap(struct device_node *np)
 	spin_unlock(&syscon_list_slock);
 
 	if (!syscon)
-		syscon = of_syscon_register(np);
+		syscon = of_syscon_register(np, check_clk);
 
 	if (IS_ERR(syscon))
 		return ERR_CAST(syscon);
 
 	return syscon->regmap;
 }
+
+struct regmap *device_node_to_regmap(struct device_node *np)
+{
+	return device_node_get_regmap(np, false);
+}
+EXPORT_SYMBOL_GPL(device_node_to_regmap);
+
+struct regmap *syscon_node_to_regmap(struct device_node *np)
+{
+	if (!of_device_is_compatible(np, "syscon"))
+		return ERR_PTR(-EINVAL);
+
+	return device_node_get_regmap(np, true);
+}
 EXPORT_SYMBOL_GPL(syscon_node_to_regmap);
 
 struct regmap *syscon_regmap_lookup_by_compatible(const char *s)
diff --git a/include/linux/mfd/syscon.h b/include/linux/mfd/syscon.h
index 8cfda0554381..112dc66262cc 100644
--- a/include/linux/mfd/syscon.h
+++ b/include/linux/mfd/syscon.h
@@ -17,12 +17,18 @@
 struct device_node;
 
 #ifdef CONFIG_MFD_SYSCON
+extern struct regmap *device_node_to_regmap(struct device_node *np);
 extern struct regmap *syscon_node_to_regmap(struct device_node *np);
 extern struct regmap *syscon_regmap_lookup_by_compatible(const char *s);
 extern struct regmap *syscon_regmap_lookup_by_phandle(
 					struct device_node *np,
 					const char *property);
 #else
+static inline struct regmap *device_node_to_regmap(struct device_node *np)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
 static inline struct regmap *syscon_node_to_regmap(struct device_node *np)
 {
 	return ERR_PTR(-ENOTSUPP);
-- 
2.21.0.593.g511ec345e18

