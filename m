Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1480C6E086A
	for <lists+linux-mips@lfdr.de>; Thu, 13 Apr 2023 09:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbjDMH6Q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Apr 2023 03:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbjDMH6O (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Apr 2023 03:58:14 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C2F15869B;
        Thu, 13 Apr 2023 00:58:02 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.110.113])
        by gateway (Coremail) with SMTP id _____8AxJFwJtjdkNbobAA--.42761S3;
        Thu, 13 Apr 2023 15:58:01 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.110.113])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxHuQDtjdk7BciAA--.6706S4;
        Thu, 13 Apr 2023 15:58:00 +0800 (CST)
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
        zhaoxiao <zhaoxiao@uniontech.com>, keguang.zhang@gmail.com,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <git@xen0n.name>
Subject: [PATCH V3 2/7] rtc: Add support for the Loongson-2K/LS7A RTC
Date:   Thu, 13 Apr 2023 15:57:34 +0800
Message-Id: <09f381f445cfbcf857845f61d10238452037b2e8.1681370153.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1681370153.git.zhoubinbin@loongson.cn>
References: <cover.1681370153.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxHuQDtjdk7BciAA--.6706S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvAXoW3tw4xArWDtry3Cw4UWr1UGFg_yoW8Gr1DXo
        WIgF1agw18Gw18uayYkr47JF47ZrZY9r1UJ34IqrWkCa4jv3WDKr43u3y5Xw1jv3yrKryx
        Zw1kKwnxZFZ3XFsxn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
        J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
        UUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s
        0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
        JwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4
        CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0E
        x4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x
        0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCF
        I7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
        106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
        xVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7
        xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
        Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jr9NsUUUUU=
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

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 drivers/rtc/Kconfig    |  11 ++
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/rtc-ls2x.c | 345 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 357 insertions(+)
 create mode 100644 drivers/rtc/rtc-ls2x.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 753872408615..e1b9d64d2678 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1706,6 +1706,17 @@ config RTC_DRV_LPC32XX
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
index ea445d1ebb17..cff5df09fc60 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_RTC_DRV_LOONGSON1)	+= rtc-ls1x.o
 obj-$(CONFIG_RTC_DRV_LP8788)	+= rtc-lp8788.o
 obj-$(CONFIG_RTC_DRV_LPC24XX)	+= rtc-lpc24xx.o
 obj-$(CONFIG_RTC_DRV_LPC32XX)	+= rtc-lpc32xx.o
+obj-$(CONFIG_RTC_DRV_LS2X)	+= rtc-ls2x.o
 obj-$(CONFIG_RTC_DRV_M41T80)	+= rtc-m41t80.o
 obj-$(CONFIG_RTC_DRV_M41T93)	+= rtc-m41t93.o
 obj-$(CONFIG_RTC_DRV_M41T94)	+= rtc-m41t94.o
diff --git a/drivers/rtc/rtc-ls2x.c b/drivers/rtc/rtc-ls2x.c
new file mode 100644
index 000000000000..c74dd88ae11b
--- /dev/null
+++ b/drivers/rtc/rtc-ls2x.c
@@ -0,0 +1,345 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
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
+#define TOY_WRITE0_REG		0x24 /* TOY low 32-bits value (write-only) */
+#define TOY_WRITE1_REG		0x28 /* TOY high 32-bits value (write-only) */
+#define TOY_READ0_REG		0x2c /* TOY low 32-bits value (read-only) */
+#define TOY_READ1_REG		0x30 /* TOY high 32-bits value (read-only) */
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
+/* bitmask of TOY_WRITE0_REG */
+#define TOY_MON			GENMASK(31, 26)
+#define TOY_DAY			GENMASK(25, 21)
+#define TOY_HOUR		GENMASK(20, 16)
+#define TOY_MIN			GENMASK(15, 10)
+#define TOY_SEC			GENMASK(9, 4)
+#define TOY_MSEC		GENMASK(3, 0)
+
+/* bitmask of TOY_MATCH0/1/2_REG */
+#define TOY_MATCH_YEAR		GENMASK(31, 26)
+#define TOY_MATCH_MON		GENMASK(25, 22)
+#define TOY_MATCH_DAY		GENMASK(21, 17)
+#define TOY_MATCH_HOUR		GENMASK(16, 12)
+#define TOY_MATCH_MIN		GENMASK(11, 6)
+#define TOY_MATCH_SEC		GENMASK(5, 0)
+
+/* bitmask of RTC_CTRL_REG */
+#define RTC_ENABLE		BIT(13) /* 1: RTC counters enable */
+#define TOY_ENABLE		BIT(11) /* 1: TOY counters enable */
+#define OSC_ENABLE		BIT(8) /* 1: 32.768k crystal enable */
+#define TOY_ENABLE_MASK		(TOY_ENABLE | OSC_ENABLE)
+
+/* PM domain registers */
+#define PM1_STS_REG		0x0c /* Power management 1 status register */
+#define RTC_STS			BIT(10) /* RTC status */
+#define PM1_EN_REG		0x10 /* Power management 1 enable register */
+#define RTC_EN			BIT(10) /* RTC event enable */
+
+/* Offset of PM domain from RTC domain, for rtc alarm */
+enum ls2x_pm_offset {
+	GENERIC_OFFSET = 0x100,
+	LS2K1000_OFFSET = 0x800,
+};
+
+struct ls2x_rtc_priv {
+	spinlock_t lock; /* protects PM registers access */
+	int irq;
+	struct rtc_device *rtcdev;
+	struct regmap *regmap;
+	void __iomem *pm_base; /* PM domain base, for rtc alarm */
+};
+
+static const struct regmap_config ls2x_rtc_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
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
+static u32 ls2x_rtc_handler(void *id)
+{
+	u32 ret;
+	struct ls2x_rtc_priv *priv = (struct ls2x_rtc_priv *)id;
+
+	spin_lock(&priv->lock);
+	/* Disable rtc event */
+	writel(readl(priv->pm_base + PM1_EN_REG) & ~RTC_EN,
+	       priv->pm_base + PM1_EN_REG);
+
+	/* Clear rtc interrupt status */
+	writel(RTC_STS, priv->pm_base + PM1_STS_REG);
+	spin_unlock(&priv->lock);
+
+	/*
+	 * The TOY_MATCH0_REG should be cleared 0 here,
+	 * otherwise the interrupt cannot be cleared.
+	 */
+	ret = regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
+	if (ret < 0)
+		return ret;
+
+	rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
+	return 0;
+}
+
+static int ls2x_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	int ret;
+	u32 ctrl_data, rtc_data[2];
+	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
+
+	ret = regmap_read(priv->regmap, RTC_CTRL_REG, &ctrl_data);
+	if (ret < 0)
+		return ret;
+
+	if (!(ctrl_data & TOY_ENABLE_MASK))
+		return -EINVAL;
+
+	ret = regmap_bulk_read(priv->regmap, TOY_READ0_REG, rtc_data,
+			       ARRAY_SIZE(rtc_data));
+	if (ret < 0)
+		return ret;
+
+	tm->tm_sec = FIELD_GET(TOY_SEC, rtc_data[0]);
+	tm->tm_min = FIELD_GET(TOY_MIN, rtc_data[0]);
+	tm->tm_hour = FIELD_GET(TOY_HOUR, rtc_data[0]);
+	tm->tm_mday = FIELD_GET(TOY_DAY, rtc_data[0]);
+	tm->tm_mon = FIELD_GET(TOY_MON, rtc_data[0]) - 1;
+	tm->tm_year = rtc_data[1];
+
+	return 0;
+}
+
+static int ls2x_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	int ret;
+	u32 rtc_data[2];
+	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
+
+	rtc_data[0] = FIELD_PREP(TOY_SEC, tm->tm_sec)
+		    | FIELD_PREP(TOY_MIN, tm->tm_min)
+		    | FIELD_PREP(TOY_HOUR, tm->tm_hour)
+		    | FIELD_PREP(TOY_DAY, tm->tm_mday)
+		    | FIELD_PREP(TOY_MON, tm->tm_mon + 1);
+	rtc_data[1] = tm->tm_year;
+
+	ret = regmap_bulk_write(priv->regmap, TOY_WRITE0_REG, rtc_data,
+				ARRAY_SIZE(rtc_data));
+	if (ret < 0)
+		return ret;
+
+	/* Enable RTC TOY counters and crystal */
+	return regmap_update_bits(priv->regmap, RTC_CTRL_REG, TOY_ENABLE_MASK,
+				  TOY_ENABLE_MASK);
+}
+
+static int ls2x_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	int ret;
+	u32 alarm_data;
+	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
+
+	ret = regmap_read(priv->regmap, TOY_MATCH0_REG, &alarm_data);
+	if (ret < 0)
+		return ret;
+
+	alrm->time.tm_sec = FIELD_GET(TOY_MATCH_SEC, alarm_data);
+	alrm->time.tm_min = FIELD_GET(TOY_MATCH_MIN, alarm_data);
+	alrm->time.tm_hour = FIELD_GET(TOY_MATCH_HOUR, alarm_data);
+	alrm->time.tm_mday = FIELD_GET(TOY_MATCH_DAY, alarm_data);
+	alrm->time.tm_mon = FIELD_GET(TOY_MATCH_MON, alarm_data) - 1;
+	/*
+	 * This is a hardware bug.
+	 * The year field in the SYS_TOYMATCH has only 6 bits(bits[31:26]),
+	 * so it can only be set from 1900 to 1963.
+	 * In order to avoid an invalid alarm value during booting, we manually
+	 * add 64 after reading the year field (equivalent to filling in the
+	 * high bits).
+	 */
+	alrm->time.tm_year = FIELD_GET(TOY_MATCH_YEAR, alarm_data) + 64;
+
+	alrm->enabled = !!(readl(priv->pm_base + PM1_EN_REG) & RTC_EN);
+	return 0;
+}
+
+static int ls2x_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	u32 val;
+	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
+
+	spin_lock(&priv->lock);
+	val = readl(priv->pm_base + PM1_EN_REG);
+
+	/* Enable RTC alarm */
+	writel(enabled ? val | RTC_EN : val & ~RTC_EN,
+	       priv->pm_base + PM1_EN_REG);
+
+	/* Clear the pending events */
+	writel(RTC_STS, priv->pm_base + PM1_STS_REG);
+	spin_unlock(&priv->lock);
+
+	return 0;
+}
+
+static int ls2x_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	int ret;
+	u32 alarm_data;
+	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
+
+	alarm_data = FIELD_PREP(TOY_MATCH_SEC, alrm->time.tm_sec)
+		   | FIELD_PREP(TOY_MATCH_MIN, alrm->time.tm_min)
+		   | FIELD_PREP(TOY_MATCH_HOUR, alrm->time.tm_hour)
+		   | FIELD_PREP(TOY_MATCH_DAY, alrm->time.tm_mday)
+		   | FIELD_PREP(TOY_MATCH_MON, alrm->time.tm_mon + 1)
+		   | FIELD_PREP(TOY_MATCH_YEAR, alrm->time.tm_year - 64);
+
+	ret = regmap_write(priv->regmap, TOY_MATCH0_REG, alarm_data);
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
+	device_init_wakeup(dev, 1);
+	spin_lock_init(&priv->lock);
+	platform_set_drvdata(pdev, priv);
+
+	priv->pm_base = regs - (enum ls2x_pm_offset)device_get_match_data(dev);
+
+	if (has_acpi_companion(dev))
+		acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
+						 ls2x_rtc_handler, priv);
+
+	priv->rtcdev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(priv->rtcdev))
+		return dev_err_probe(dev, PTR_ERR(priv->rtcdev),
+				     "devm_rtc_allocate_device failed\n");
+
+	priv->rtcdev->ops = &ls2x_rtc_ops;
+	priv->rtcdev->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	priv->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return dev_err_probe(dev, priv->irq, "platform_get_irq failed\n");
+
+	ret = devm_request_irq(dev, priv->irq, ls2x_rtc_isr,
+			       IRQF_TRIGGER_RISING, "ls2x-alarm", priv);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Unable to request irq %d\n",
+				     priv->irq);
+
+	return devm_rtc_register_device(priv->rtcdev);
+}
+
+static void ls2x_rtc_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	if (has_acpi_companion(dev))
+		acpi_remove_fixed_event_handler(ACPI_EVENT_RTC,
+						ls2x_rtc_handler);
+
+	device_init_wakeup(dev, 0);
+	ls2x_rtc_alarm_irq_enable(dev, 0);
+}
+
+static const struct of_device_id ls2x_rtc_of_match[] = {
+	{ .compatible = "loongson,ls7a-rtc", .data = (void *)GENERIC_OFFSET },
+	{ .compatible = "loongson,ls2k0500-rtc", .data = (void *)GENERIC_OFFSET },
+	{ .compatible = "loongson,ls2k1000-rtc", .data = (void *)LS2K1000_OFFSET },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ls2x_rtc_of_match);
+
+static const struct acpi_device_id ls2x_rtc_acpi_match[] = {
+	{ "LOON0001", .driver_data = (kernel_ulong_t)GENERIC_OFFSET },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ls2x_rtc_acpi_match);
+
+static struct platform_driver ls2x_rtc_driver = {
+	.probe		= ls2x_rtc_probe,
+	.remove_new	= ls2x_rtc_remove,
+	.driver		= {
+		.name	= "ls2x-rtc",
+		.of_match_table = ls2x_rtc_of_match,
+		.acpi_match_table = ls2x_rtc_acpi_match,
+	},
+};
+module_platform_driver(ls2x_rtc_driver);
+
+MODULE_DESCRIPTION("Loongson LS2X RTC driver");
+MODULE_AUTHOR("Binbin Zhou <zhoubinbin@loongson.cn>");
+MODULE_AUTHOR("WANG Xuerui <git@xen0n.name>");
+MODULE_AUTHOR("Huacai Chen <chenhuacai@kernel.org>");
+MODULE_LICENSE("GPL");
-- 
2.39.1

