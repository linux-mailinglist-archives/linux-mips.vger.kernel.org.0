Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA3D3F4E8A
	for <lists+linux-mips@lfdr.de>; Mon, 23 Aug 2021 18:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbhHWQjw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Aug 2021 12:39:52 -0400
Received: from [115.28.160.31] ([115.28.160.31]:50520 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S230124AbhHWQjt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Aug 2021 12:39:49 -0400
Received: from ld50.lan (unknown [101.88.30.186])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E9D6360112;
        Tue, 24 Aug 2021 00:31:48 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1629736309; bh=XDI8uDsFMGi3xC8Agpe2gLdI2VQHmoexS4jDfBEuE7A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W8ka+OyN8OKHn/FyR+/OZaEiReEIbq/1Mn4/gIKqvXzg8IS6QgLExe0nKgwzr/1jm
         eQnR+pv02e5WZfDjGgGkYe5keMc0WjEG/wKXfVPVm8yylL/7aOiRbzD5cxfSK/Yp/i
         IoOGRQul8iqgfe6XjUeFUKyfkUe6yvZQN1xiiKbI=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH RESEND v5 1/6] rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
Date:   Tue, 24 Aug 2021 00:31:37 +0800
Message-Id: <20210823163142.586529-2-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210823163142.586529-1-git@xen0n.name>
References: <20210823163142.586529-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This RTC module is integrated into the Loongson-2K SoC and the LS7A
bridge chip. This version is almost entirely rewritten to make use of
current kernel API.

Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: WANG Xuerui <git@xen0n.name>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com> # loongson2k
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org
Cc: linux-mips@vger.kernel.org
---
 drivers/rtc/Kconfig    |  11 +++
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/rtc-ls2x.c | 180 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 192 insertions(+)
 create mode 100644 drivers/rtc/rtc-ls2x.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index daff06707455..819f366b4d91 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1313,6 +1313,17 @@ config RTC_DRV_NTXEC
 	  embedded controller found in certain e-book readers designed by the
 	  original design manufacturer Netronix.
 
+config RTC_DRV_LS2X
+	tristate "Loongson LS2X RTC"
+	depends on OF && MACH_LOONGSON64 || COMPILE_TEST
+	select REGMAP_MMIO
+	help
+	  If you say yes here you get support for the RTC on the Loongson-2K
+	  SoC and LS7A bridge, which first appeared on the Loongson-2H.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-ls2x.
+
 comment "on-CPU RTC drivers"
 
 config RTC_DRV_ASM9260
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 5ceeafe4d5b2..98e68484f519 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -83,6 +83,7 @@ obj-$(CONFIG_RTC_DRV_LOONGSON1)	+= rtc-ls1x.o
 obj-$(CONFIG_RTC_DRV_LP8788)	+= rtc-lp8788.o
 obj-$(CONFIG_RTC_DRV_LPC24XX)	+= rtc-lpc24xx.o
 obj-$(CONFIG_RTC_DRV_LPC32XX)	+= rtc-lpc32xx.o
+obj-$(CONFIG_RTC_DRV_LS2X)	+= rtc-ls2x.o
 obj-$(CONFIG_RTC_DRV_M41T80)	+= rtc-m41t80.o
 obj-$(CONFIG_RTC_DRV_M41T93)	+= rtc-m41t93.o
 obj-$(CONFIG_RTC_DRV_M41T94)	+= rtc-m41t94.o
diff --git a/drivers/rtc/rtc-ls2x.c b/drivers/rtc/rtc-ls2x.c
new file mode 100644
index 000000000000..58901323b219
--- /dev/null
+++ b/drivers/rtc/rtc-ls2x.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Loongson-2K/7A RTC driver
+ *
+ * Based on the original out-of-tree Loongson-2H RTC driver for Linux 2.6.32,
+ * by Shaozong Liu <liushaozong@loongson.cn>.
+ *
+ * Maintained out-of-tree by Huacai Chen <chenhuacai@kernel.org>.
+ *
+ * Rewritten for mainline by WANG Xuerui <git@xen0n.name>.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+
+#define TOY_TRIM_REG   0x20
+#define TOY_WRITE0_REG 0x24
+#define TOY_WRITE1_REG 0x28
+#define TOY_READ0_REG  0x2c
+#define TOY_READ1_REG  0x30
+#define TOY_MATCH0_REG 0x34
+#define TOY_MATCH1_REG 0x38
+#define TOY_MATCH2_REG 0x3c
+#define RTC_CTRL_REG   0x40
+#define RTC_TRIM_REG   0x60
+#define RTC_WRITE0_REG 0x64
+#define RTC_READ0_REG  0x68
+#define RTC_MATCH0_REG 0x6c
+#define RTC_MATCH1_REG 0x70
+#define RTC_MATCH2_REG 0x74
+
+#define TOY_MON        GENMASK(31, 26)
+#define TOY_DAY        GENMASK(25, 21)
+#define TOY_HOUR       GENMASK(20, 16)
+#define TOY_MIN        GENMASK(15, 10)
+#define TOY_SEC        GENMASK(9, 4)
+#define TOY_MSEC       GENMASK(3, 0)
+
+struct ls2x_rtc_priv {
+	struct regmap *regmap;
+};
+
+static const struct regmap_config ls2x_rtc_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+struct ls2x_rtc_regs {
+	u32 reg0;
+	u32 reg1;
+};
+
+static inline void ls2x_rtc_regs_to_time(struct ls2x_rtc_regs *regs,
+					 struct rtc_time *tm)
+{
+	tm->tm_year = regs->reg1;
+	tm->tm_sec = FIELD_GET(TOY_SEC, regs->reg0);
+	tm->tm_min = FIELD_GET(TOY_MIN, regs->reg0);
+	tm->tm_hour = FIELD_GET(TOY_HOUR, regs->reg0);
+	tm->tm_mday = FIELD_GET(TOY_DAY, regs->reg0);
+	tm->tm_mon = FIELD_GET(TOY_MON, regs->reg0) - 1;
+}
+
+static inline void ls2x_rtc_time_to_regs(struct rtc_time *tm,
+					 struct ls2x_rtc_regs *regs)
+{
+	regs->reg0 = FIELD_PREP(TOY_SEC, tm->tm_sec);
+	regs->reg0 |= FIELD_PREP(TOY_MIN, tm->tm_min);
+	regs->reg0 |= FIELD_PREP(TOY_HOUR, tm->tm_hour);
+	regs->reg0 |= FIELD_PREP(TOY_DAY, tm->tm_mday);
+	regs->reg0 |= FIELD_PREP(TOY_MON, tm->tm_mon + 1);
+	regs->reg1 = tm->tm_year;
+}
+
+static int ls2x_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
+	struct ls2x_rtc_regs regs;
+	int ret;
+
+	ret = regmap_read(priv->regmap, TOY_READ1_REG, &regs.reg1);
+	if (unlikely(ret))
+		return ret;
+
+	ret = regmap_read(priv->regmap, TOY_READ0_REG, &regs.reg0);
+	if (unlikely(ret))
+		return ret;
+
+	ls2x_rtc_regs_to_time(&regs, tm);
+
+	return 0;
+}
+
+static int ls2x_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
+	struct ls2x_rtc_regs regs;
+	int ret;
+
+	ls2x_rtc_time_to_regs(tm, &regs);
+
+	ret = regmap_write(priv->regmap, TOY_WRITE0_REG, regs.reg0);
+	if (unlikely(ret))
+		return ret;
+
+	return regmap_write(priv->regmap, TOY_WRITE1_REG, regs.reg1);
+}
+
+static struct rtc_class_ops ls2x_rtc_ops = {
+	.read_time = ls2x_rtc_read_time,
+	.set_time = ls2x_rtc_set_time,
+};
+
+static int ls2x_rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtc_device *rtc;
+	struct ls2x_rtc_priv *priv;
+	void __iomem *regs;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (unlikely(!priv))
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	priv->regmap = devm_regmap_init_mmio(dev, regs,
+					     &ls2x_rtc_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
+
+	rtc->ops = &ls2x_rtc_ops;
+
+	/* Due to hardware erratum, all years multiple of 4 are considered
+	 * leap year, so only years 2000 through 2099 are usable.
+	 *
+	 * Previous out-of-tree versions of this driver wrote tm_year directly
+	 * into the year register, so epoch 2000 must be used to preserve
+	 * semantics on shipped systems.
+	 */
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
+
+	return devm_rtc_register_device(rtc);
+}
+
+static const struct of_device_id ls2x_rtc_of_match[] = {
+	{ .compatible = "loongson,ls2x-rtc" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, ls2x_rtc_of_match);
+
+static struct platform_driver ls2x_rtc_driver = {
+	.probe		= ls2x_rtc_probe,
+	.driver		= {
+		.name	= "ls2x-rtc",
+		.of_match_table = ls2x_rtc_of_match,
+	},
+};
+
+module_platform_driver(ls2x_rtc_driver);
+
+MODULE_DESCRIPTION("LS2X RTC driver");
+MODULE_AUTHOR("WANG Xuerui");
+MODULE_AUTHOR("Huacai Chen");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:ls2x-rtc");
-- 
2.33.0

