Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35EED16B6E
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2019 21:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbfEGTep (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 May 2019 15:34:45 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:56076 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfEGTen (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 May 2019 15:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1557257676; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nqbVF6bcnuVnIFfQehqUxQRz3G0mMYAEEWbqHB+qlfY=;
        b=WLkDTGX2JzjCg4TwzBZvx9wQeh/VjmLU8oBo0C1D7gpljas841hweJAzjLM6EVNB7EAX1k
        Fz45wAM90CGmoHrJbg1+UiJCFwzMzT/zEeGN2rY0hNA+D1lWFIsXdq+rcM5rMCgfA0ypef
        +m2GqKH4HY1/DOoSMgB/gdWN+PDRlaU=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/5] clk: ingenic: Handle setting the Low-Power Mode bit
Date:   Tue,  7 May 2019 21:34:18 +0200
Message-Id: <20190507193421.12260-2-paul@crapouillou.net>
In-Reply-To: <20190507193421.12260-1-paul@crapouillou.net>
References: <20190507193421.12260-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Low-Power Mode, when enabled, will make the "wait" MIPS instruction
suspend the system.

This is not really clock-related, but this bit happens to be in the
register set of the CGU.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/clk/ingenic/Makefile      |  2 +-
 drivers/clk/ingenic/jz4725b-cgu.c |  3 +++
 drivers/clk/ingenic/jz4740-cgu.c  |  3 +++
 drivers/clk/ingenic/jz4770-cgu.c  | 33 ++---------------------
 drivers/clk/ingenic/jz4780-cgu.c  |  3 +++
 drivers/clk/ingenic/pm.c          | 45 +++++++++++++++++++++++++++++++
 drivers/clk/ingenic/pm.h          | 12 +++++++++
 7 files changed, 69 insertions(+), 32 deletions(-)
 create mode 100644 drivers/clk/ingenic/pm.c
 create mode 100644 drivers/clk/ingenic/pm.h

diff --git a/drivers/clk/ingenic/Makefile b/drivers/clk/ingenic/Makefile
index 00a79b2fba10..589a2b772b0d 100644
--- a/drivers/clk/ingenic/Makefile
+++ b/drivers/clk/ingenic/Makefile
@@ -1,4 +1,4 @@
-obj-$(CONFIG_INGENIC_CGU_COMMON)	+= cgu.o
+obj-$(CONFIG_INGENIC_CGU_COMMON)	+= cgu.o pm.o
 obj-$(CONFIG_INGENIC_CGU_JZ4740)	+= jz4740-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4725B)	+= jz4725b-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4770)	+= jz4770-cgu.o
diff --git a/drivers/clk/ingenic/jz4725b-cgu.c b/drivers/clk/ingenic/jz4725b-cgu.c
index 044bbd271bb6..b160c4ed4be6 100644
--- a/drivers/clk/ingenic/jz4725b-cgu.c
+++ b/drivers/clk/ingenic/jz4725b-cgu.c
@@ -10,6 +10,7 @@
 #include <linux/of.h>
 #include <dt-bindings/clock/jz4725b-cgu.h>
 #include "cgu.h"
+#include "pm.h"
 
 /* CGU register offsets */
 #define CGU_REG_CPCCR		0x00
@@ -220,5 +221,7 @@ static void __init jz4725b_cgu_init(struct device_node *np)
 	retval = ingenic_cgu_register_clocks(cgu);
 	if (retval)
 		pr_err("%s: failed to register CGU Clocks\n", __func__);
+
+	ingenic_cgu_register_syscore_ops(cgu);
 }
 CLK_OF_DECLARE(jz4725b_cgu, "ingenic,jz4725b-cgu", jz4725b_cgu_init);
diff --git a/drivers/clk/ingenic/jz4740-cgu.c b/drivers/clk/ingenic/jz4740-cgu.c
index 09629c0613c1..c036b2e8d9a8 100644
--- a/drivers/clk/ingenic/jz4740-cgu.c
+++ b/drivers/clk/ingenic/jz4740-cgu.c
@@ -20,6 +20,7 @@
 #include <dt-bindings/clock/jz4740-cgu.h>
 #include <asm/mach-jz4740/clock.h>
 #include "cgu.h"
+#include "pm.h"
 
 /* CGU register offsets */
 #define CGU_REG_CPCCR		0x00
@@ -226,6 +227,8 @@ static void __init jz4740_cgu_init(struct device_node *np)
 	retval = ingenic_cgu_register_clocks(cgu);
 	if (retval)
 		pr_err("%s: failed to register CGU Clocks\n", __func__);
+
+	ingenic_cgu_register_syscore_ops(cgu);
 }
 CLK_OF_DECLARE(jz4740_cgu, "ingenic,jz4740-cgu", jz4740_cgu_init);
 
diff --git a/drivers/clk/ingenic/jz4770-cgu.c b/drivers/clk/ingenic/jz4770-cgu.c
index 2e6fd8b1c248..7d48d3869b8e 100644
--- a/drivers/clk/ingenic/jz4770-cgu.c
+++ b/drivers/clk/ingenic/jz4770-cgu.c
@@ -7,9 +7,9 @@
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/of.h>
-#include <linux/syscore_ops.h>
 #include <dt-bindings/clock/jz4770-cgu.h>
 #include "cgu.h"
+#include "pm.h"
 
 /*
  * CPM registers offset address definition
@@ -36,9 +36,6 @@
 #define CGU_REG_MSC2CDR		0xA8
 #define CGU_REG_BCHCDR		0xAC
 
-/* bits within the LCR register */
-#define LCR_LPM			BIT(0)		/* Low Power Mode */
-
 /* bits within the OPCR register */
 #define OPCR_SPENDH		BIT(5)		/* UHC PHY suspend */
 
@@ -405,30 +402,6 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 	},
 };
 
-#if IS_ENABLED(CONFIG_PM_SLEEP)
-static int jz4770_cgu_pm_suspend(void)
-{
-	u32 val;
-
-	val = readl(cgu->base + CGU_REG_LCR);
-	writel(val | LCR_LPM, cgu->base + CGU_REG_LCR);
-	return 0;
-}
-
-static void jz4770_cgu_pm_resume(void)
-{
-	u32 val;
-
-	val = readl(cgu->base + CGU_REG_LCR);
-	writel(val & ~LCR_LPM, cgu->base + CGU_REG_LCR);
-}
-
-static struct syscore_ops jz4770_cgu_pm_ops = {
-	.suspend = jz4770_cgu_pm_suspend,
-	.resume = jz4770_cgu_pm_resume,
-};
-#endif /* CONFIG_PM_SLEEP */
-
 static void __init jz4770_cgu_init(struct device_node *np)
 {
 	int retval;
@@ -442,9 +415,7 @@ static void __init jz4770_cgu_init(struct device_node *np)
 	if (retval)
 		pr_err("%s: failed to register CGU Clocks\n", __func__);
 
-#if IS_ENABLED(CONFIG_PM_SLEEP)
-	register_syscore_ops(&jz4770_cgu_pm_ops);
-#endif
+	ingenic_cgu_register_syscore_ops(cgu);
 }
 
 /* We only probe via devicetree, no need for a platform driver */
diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index ad64afb438a5..fc2f060817f5 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <dt-bindings/clock/jz4780-cgu.h>
 #include "cgu.h"
+#include "pm.h"
 
 /* CGU register offsets */
 #define CGU_REG_CLOCKCONTROL	0x00
@@ -728,5 +729,7 @@ static void __init jz4780_cgu_init(struct device_node *np)
 		pr_err("%s: failed to register CGU Clocks\n", __func__);
 		return;
 	}
+
+	ingenic_cgu_register_syscore_ops(cgu);
 }
 CLK_OF_DECLARE(jz4780_cgu, "ingenic,jz4780-cgu", jz4780_cgu_init);
diff --git a/drivers/clk/ingenic/pm.c b/drivers/clk/ingenic/pm.c
new file mode 100644
index 000000000000..ca51c7e05d81
--- /dev/null
+++ b/drivers/clk/ingenic/pm.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Paul Cercueil <paul@crapouillou.net>
+ */
+
+#include "cgu.h"
+#include "pm.h"
+
+#include <linux/io.h>
+#include <linux/syscore_ops.h>
+
+#define CGU_REG_LCR		0x04
+
+#define LCR_LOW_POWER_MODE	BIT(0)
+
+static void __iomem * __maybe_unused ingenic_cgu_base;
+
+static int __maybe_unused ingenic_cgu_pm_suspend(void)
+{
+	u32 val = readl(ingenic_cgu_base + CGU_REG_LCR);
+
+	writel(val | LCR_LOW_POWER_MODE, ingenic_cgu_base + CGU_REG_LCR);
+
+	return 0;
+}
+
+static void __maybe_unused ingenic_cgu_pm_resume(void)
+{
+	u32 val = readl(ingenic_cgu_base + CGU_REG_LCR);
+
+	writel(val & ~LCR_LOW_POWER_MODE, ingenic_cgu_base + CGU_REG_LCR);
+}
+
+static struct syscore_ops __maybe_unused ingenic_cgu_pm_ops = {
+	.suspend = ingenic_cgu_pm_suspend,
+	.resume = ingenic_cgu_pm_resume,
+};
+
+void ingenic_cgu_register_syscore_ops(struct ingenic_cgu *cgu)
+{
+	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
+		ingenic_cgu_base = cgu->base;
+		register_syscore_ops(&ingenic_cgu_pm_ops);
+	}
+}
diff --git a/drivers/clk/ingenic/pm.h b/drivers/clk/ingenic/pm.h
new file mode 100644
index 000000000000..70496ef71da8
--- /dev/null
+++ b/drivers/clk/ingenic/pm.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Paul Cercueil <paul@crapouillou.net>
+ */
+#ifndef DRIVERS_CLK_INGENIC_PM_H
+#define DRIVERS_CLK_INGENIC_PM_H
+
+struct ingenic_cgu;
+
+void ingenic_cgu_register_syscore_ops(struct ingenic_cgu *cgu);
+
+#endif /* DRIVERS_CLK_INGENIC_PM_H */
-- 
2.21.0.593.g511ec345e18

