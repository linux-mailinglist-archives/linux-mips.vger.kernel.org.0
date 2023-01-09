Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0767661BF3
	for <lists+linux-mips@lfdr.de>; Mon,  9 Jan 2023 02:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbjAIBfF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Jan 2023 20:35:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233841AbjAIBfE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Jan 2023 20:35:04 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CE13CB86F;
        Sun,  8 Jan 2023 17:35:01 -0800 (PST)
Received: from loongson.cn (unknown [112.20.112.33])
        by gateway (Coremail) with SMTP id _____8AxGupEb7tjwGkAAA--.1137S3;
        Mon, 09 Jan 2023 09:35:00 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.33])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxsOQ_b7tjZ3gWAA--.3588S4;
        Mon, 09 Jan 2023 09:34:59 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>
Cc:     linux-rtc@vger.kernel.org, linux-mips@vger.kernel.org,
        loongarch@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Qing Zhang <zhangqing@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <git@xen0n.name>
Subject: [PATCH V2 2/7] rtc: Add support for the Loongson-2K/LS7A RTC
Date:   Mon,  9 Jan 2023 09:35:12 +0800
Message-Id: <8cd5e1b763951d4ce69188cdff95d8adaf12755f.1673227292.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1673227292.git.zhoubinbin@loongson.cn>
References: <cover.1673227292.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxsOQ_b7tjZ3gWAA--.3588S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvAXoW3tw47uF45tFWfWFyrCr47twb_yoW8GFWUZo
        WxW3ZIqw18K3WjgFWYkr4UtF47Zr95WF1UGa4SqFWv9a4jv3WDKr13u3yrXw1jqw4FgF48
        Zr1kKwnxZF4xZFsxn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
        J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
        UUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s
        0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAa
        w2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2
        jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262
        kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
        07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
        1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5
        JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
        1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
        YxBIdaVFxhVjvjDU0xZFpf9x07jYE_NUUUUU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This RTC module is integrated into the Loongson-2K SoC and the LS7A
bridge chip. This version is almost entirely rewritten to make use of
current kernel API, and it supports both ACPI and DT.

This driver is shared by MIPS-based Loongson-3A4000 system (use FDT) and
LoongArch-based Loongson-3A5000 system (use ACPI).

Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: WANG Xuerui <git@xen0n.name>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/rtc/Kconfig    |  11 ++
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/rtc-ls2x.c | 379 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 391 insertions(+)
 create mode 100644 drivers/rtc/rtc-ls2x.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index bb63edb507da..f8586aa00fce 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1735,6 +1735,17 @@ config RTC_DRV_LPC32XX
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-lpc32xx.
 
+config RTC_DRV_LS2X
+	tristate "Loongson LS2X RTC"
+	depends on MACH_LOONGSON64 || COMPILE_TEST
+	select REGMAP_MMIO
+	help
+	  If you say yes here you get support for the RTC on the Loongson-2K
+	  SoC and LS7A bridge, which first appeared on the Loongson-2H.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-ls2x.
+
 config RTC_DRV_PM8XXX
 	tristate "Qualcomm PMIC8XXX RTC"
 	depends on MFD_PM8XXX || MFD_SPMI_PMIC || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index aab22bc63432..d5a467e9eec8 100644
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
index 000000000000..06ef249a9485
--- /dev/null
+++ b/drivers/rtc/rtc-ls2x.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Loongson-2K/LS7A RTC driver
+ *
+ * Based on the original out-of-tree Loongson-2H RTC driver for Linux 2.6.32,
+ * by Shaozong Liu <liushaozong@loongson.cn>.
+ *
+ * Maintained out-of-tree by Huacai Chen <chenhuacai@kernel.org>.
+ * Rewritten for mainline by WANG Xuerui <git@xen0n.name>.
+ *                           Binbin Zhou <zhoubinbin@loongson.cn>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+#include <linux/acpi.h>
+
+/* Time Of Year(TOY) counters registers */
+#define TOY_TRIM_REG		0x20 /* Must be initialized to 0 */
+#define TOY_WRITE0_REG		0x24 /* TOY low 32-bit value (write-only) */
+#define TOY_WRITE1_REG		0x28 /* TOY high 32-bit value (write-only) */
+#define TOY_READ0_REG		0x2c /* TOY low 32-bit value (read-only) */
+#define TOY_READ1_REG		0x30 /* TOY high 32-bit value (read-only) */
+#define TOY_MATCH0_REG		0x34 /* TOY timing interrupt 0 */
+#define TOY_MATCH1_REG		0x38 /* TOY timing interrupt 1 */
+#define TOY_MATCH2_REG		0x3c /* TOY timing interrupt 2 */
+
+/* RTC counters registers */
+#define RTC_CTRL_REG		0x40 /* TOY and RTC control register */
+#define RTC_TRIM_REG		0x60 /* Must be initialized to 0 */
+#define RTC_WRITE0_REG		0x64 /* RTC counters value (write-only) */
+#define RTC_READ0_REG		0x68 /* RTC counters value (read-only) */
+#define RTC_MATCH0_REG		0x6c /* RTC timing interrupt 0 */
+#define RTC_MATCH1_REG		0x70 /* RTC timing interrupt 1 */
+#define RTC_MATCH2_REG		0x74 /* RTC timing interrupt 2 */
+
+/* TOY_WRITE0_REG bitmask */
+#define TOY_MON			GENMASK(31, 26)
+#define TOY_DAY			GENMASK(25, 21)
+#define TOY_HOUR		GENMASK(20, 16)
+#define TOY_MIN			GENMASK(15, 10)
+#define TOY_SEC			GENMASK(9, 4)
+#define TOY_MSEC		GENMASK(3, 0)
+
+/* TOY_MATCH0/1/2_REG bitmask */
+#define TOY_MATCH_YEAR		GENMASK(31, 26)
+#define TOY_MATCH_MON		GENMASK(25, 22)
+#define TOY_MATCH_DAY		GENMASK(21, 17)
+#define TOY_MATCH_HOUR		GENMASK(16, 12)
+#define TOY_MATCH_MIN		GENMASK(11, 6)
+#define TOY_MATCH_SEC		GENMASK(5, 0)
+
+/* RTC_CTRL_REG bitmask */
+#define RTC_ENABLE		BIT(13) /* 1: RTC counters enable */
+#define TOY_ENABLE		BIT(11) /* 1: TOY counters enable */
+#define OSC_ENABLE		BIT(8) /* 1: 32.768k crystal enable */
+
+/* Offset of PM domain from RTC domain */
+#define PM_RTC_OFFSET		0x100
+
+/* PM domain registers */
+#define PM1_STS_REG		0x0c /* Power management 1 status register */
+#define RTC_STS			BIT(10) /* RTC status */
+#define PM1_EN_REG		0x10 /* Power management 1 enable register */
+#define RTC_EN			BIT(10) /* RTC event enable */
+
+struct ls2x_rtc_priv {
+	spinlock_t		rtc_reglock;
+	int			irq;
+	struct rtc_device	*rtcdev;
+	struct regmap		*regmap;
+	void __iomem		*acpi_base;
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
+/* IRQ Handlers */
+static irqreturn_t ls2x_rtc_isr(int irq, void *id)
+{
+	struct ls2x_rtc_priv *priv = (struct ls2x_rtc_priv *)id;
+
+	rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
+	return IRQ_HANDLED;
+}
+
+#ifdef CONFIG_ACPI
+static u32 ls2x_acpi_fix_handler(void *id)
+{
+	int ret;
+	struct ls2x_rtc_priv *priv = (struct ls2x_rtc_priv *)id;
+
+	spin_lock(&priv->rtc_reglock);
+
+	/* Disable acpi rtc enabled */
+	ret = readl(priv->acpi_base + PM1_EN_REG) & ~RTC_EN;
+	writel(ret, priv->acpi_base + PM1_EN_REG);
+
+	/* Clear acpi rtc interrupt Status */
+	writel(RTC_STS, priv->acpi_base + PM1_STS_REG);
+
+	spin_unlock(&priv->rtc_reglock);
+
+	/*
+	 * The TOY_MATCH0_REG should be cleared 0 here,
+	 * otherwise the interrupt cannot be cleared.
+	 * Because the match condition is still satisfied
+	 */
+	ret = regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
+	if (ret < 0)
+		return ret;
+
+	rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
+	return 0;
+}
+#endif
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
+static inline void ls2x_rtc_alarm_regs_to_time(struct ls2x_rtc_regs *regs,
+					 struct rtc_time *tm)
+{
+	tm->tm_sec = FIELD_GET(TOY_MATCH_SEC, regs->reg0);
+	tm->tm_min = FIELD_GET(TOY_MATCH_MIN, regs->reg0);
+	tm->tm_hour = FIELD_GET(TOY_MATCH_HOUR, regs->reg0);
+	tm->tm_mday = FIELD_GET(TOY_MATCH_DAY, regs->reg0);
+	tm->tm_mon = FIELD_GET(TOY_MATCH_MON, regs->reg0) - 1;
+	/*
+	 * The rtc SYS_TOYMATCH0/YEAR bit field is only 6 bits, so it means 63
+	 * years at most. Therefore, The RTC alarm years can be set from 1900
+	 * to 1963. This causes the initialization of alarm fail during call
+	 * __rtc_read_alarm.
+	 * We add 64 years offset to ls2x_rtc_read_alarm. After adding the
+	 * offset, the RTC alarm clock can be set from 1964 to 2027.
+	 */
+	tm->tm_year = FIELD_GET(TOY_MATCH_YEAR, regs->reg0) + 64;
+}
+
+static inline void ls2x_rtc_time_to_alarm_regs(struct rtc_time *tm,
+					 struct ls2x_rtc_regs *regs)
+{
+	regs->reg0 = FIELD_PREP(TOY_MATCH_SEC, tm->tm_sec);
+	regs->reg0 |= FIELD_PREP(TOY_MATCH_MIN, tm->tm_min);
+	regs->reg0 |= FIELD_PREP(TOY_MATCH_HOUR, tm->tm_hour);
+	regs->reg0 |= FIELD_PREP(TOY_MATCH_DAY, tm->tm_mday);
+	regs->reg0 |= FIELD_PREP(TOY_MATCH_MON, tm->tm_mon + 1);
+	regs->reg0 |= FIELD_PREP(TOY_MATCH_YEAR, tm->tm_year);
+}
+
+static int ls2x_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	int ret;
+	struct ls2x_rtc_regs regs;
+	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
+
+	ret = regmap_read(priv->regmap, TOY_READ1_REG, &regs.reg1);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_read(priv->regmap, TOY_READ0_REG, &regs.reg0);
+	if (ret < 0)
+		return ret;
+
+	ls2x_rtc_regs_to_time(&regs, tm);
+	return 0;
+}
+
+static int ls2x_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	int ret;
+	struct ls2x_rtc_regs regs;
+	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
+
+	ls2x_rtc_time_to_regs(tm, &regs);
+
+	ret = regmap_write(priv->regmap, TOY_WRITE0_REG, regs.reg0);
+	if (ret < 0)
+		return ret;
+
+	return regmap_write(priv->regmap, TOY_WRITE1_REG, regs.reg1);
+}
+
+static int ls2x_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	int ret;
+	struct ls2x_rtc_regs regs;
+	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
+
+	ret = regmap_read(priv->regmap, TOY_MATCH0_REG, &regs.reg0);
+	if (ret < 0)
+		return ret;
+
+	ls2x_rtc_alarm_regs_to_time(&regs, &alrm->time);
+	alrm->enabled = !!(readl(priv->acpi_base + PM1_EN_REG) & RTC_EN);
+
+	return 0;
+}
+
+static int ls2x_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	u32 val;
+	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
+
+	spin_lock(&priv->rtc_reglock);
+	val = readl(priv->acpi_base + PM1_EN_REG);
+
+	/* Enalbe RTC alarm */
+	writel((enabled ? val | RTC_EN : val & ~RTC_EN),
+	       priv->acpi_base + PM1_EN_REG);
+	spin_unlock(&priv->rtc_reglock);
+
+	return 0;
+}
+
+static int ls2x_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	int ret;
+	struct ls2x_rtc_regs regs;
+	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
+
+	ls2x_rtc_time_to_alarm_regs(&alrm->time, &regs);
+
+	ret = regmap_write(priv->regmap, TOY_MATCH0_REG, regs.reg0);
+	if (ret < 0)
+		return ret;
+
+	return ls2x_rtc_alarm_irq_enable(dev, alrm->enabled);
+}
+
+static const struct rtc_class_ops ls2x_rtc_ops = {
+	.read_time = ls2x_rtc_read_time,
+	.set_time = ls2x_rtc_set_time,
+	.read_alarm = ls2x_rtc_read_alarm,
+	.set_alarm = ls2x_rtc_set_alarm,
+	.alarm_irq_enable = ls2x_rtc_alarm_irq_enable,
+};
+
+static int ls2x_enable_rtc(struct ls2x_rtc_priv *priv)
+{
+	u32 val;
+	int ret;
+
+	ret = regmap_read(priv->regmap, RTC_CTRL_REG, &val);
+	if (ret < 0)
+		return ret;
+
+	return regmap_write(priv->regmap, RTC_CTRL_REG,
+			    val | TOY_ENABLE | OSC_ENABLE);
+}
+
+static int ls2x_rtc_probe(struct platform_device *pdev)
+{
+	int ret;
+	void __iomem *regs;
+	struct ls2x_rtc_priv *priv;
+	struct device *dev = &pdev->dev;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return dev_err_probe(dev, priv->irq, "platform_get_irq failed\n");
+
+	platform_set_drvdata(pdev, priv);
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return dev_err_probe(dev, PTR_ERR(regs),
+				     "devm_platform_ioremap_resource failed\n");
+
+	priv->regmap = devm_regmap_init_mmio(dev, regs,
+					     &ls2x_rtc_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "devm_regmap_init_mmio failed\n");
+
+	priv->rtcdev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(priv->rtcdev))
+		return dev_err_probe(dev, PTR_ERR(priv->rtcdev),
+				     "devm_rtc_allocate_device failed\n");
+
+	/* Due to hardware erratum, all years multiple of 4 are considered
+	 * leap year, so only years 2000 through 2099 are usable.
+	 *
+	 * Previous out-of-tree versions of this driver wrote tm_year directly
+	 * into the year register, so epoch 2000 must be used to preserve
+	 * semantics on shipped systems.
+	 */
+	priv->rtcdev->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	priv->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
+	priv->rtcdev->ops = &ls2x_rtc_ops;
+	priv->acpi_base = regs - PM_RTC_OFFSET;
+	spin_lock_init(&priv->rtc_reglock);
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, priv->rtcdev->features);
+
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled)
+		acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
+						 ls2x_acpi_fix_handler, priv);
+#endif
+
+	ret = ls2x_enable_rtc(priv);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "ls2x_enable_rtc failed\n");
+
+	ret = devm_request_threaded_irq(dev, priv->irq, NULL, ls2x_rtc_isr,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					"ls2x-alarm", priv);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Unable to request irq %d\n",
+				     priv->irq);
+
+	if (!device_can_wakeup(&pdev->dev))
+		device_init_wakeup(dev, 1);
+
+	return devm_rtc_register_device(priv->rtcdev);
+}
+
+static const struct of_device_id ls2x_rtc_of_match[] = {
+	{ .compatible = "loongson,ls2x-rtc" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ls2x_rtc_of_match);
+
+static const struct acpi_device_id ls2x_rtc_acpi_match[] = {
+	{ "LOON0001" }, /* Loongson LS7A */
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ls2x_rtc_acpi_match);
+
+static struct platform_driver ls2x_rtc_driver = {
+	.probe		= ls2x_rtc_probe,
+	.driver		= {
+		.name	= "ls2x-rtc",
+		.of_match_table = ls2x_rtc_of_match,
+		.acpi_match_table = ls2x_rtc_acpi_match,
+	},
+};
+
+module_platform_driver(ls2x_rtc_driver);
+
+MODULE_DESCRIPTION("Loongson LS2X RTC driver");
+MODULE_AUTHOR("WANG Xuerui <git@xen0n.name>");
+MODULE_AUTHOR("Huacai Chen <chenhuacai@kernel.org>");
+MODULE_AUTHOR("Binbin Zhou <zhoubinbin@loongson.cn>");
+MODULE_LICENSE("GPL");
-- 
2.31.1

