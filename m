Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9CF171FE4E
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jun 2023 11:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234848AbjFBJvK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jun 2023 05:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234752AbjFBJvJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Jun 2023 05:51:09 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E0EB6133;
        Fri,  2 Jun 2023 02:51:06 -0700 (PDT)
Received: from loongson.cn (unknown [223.106.25.146])
        by gateway (Coremail) with SMTP id _____8Bx3+uJu3lkMZcDAA--.7671S3;
        Fri, 02 Jun 2023 17:51:05 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8AxgjiHu3lk97qFAA--.19179S2;
        Fri, 02 Jun 2023 17:51:04 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Binbin Zhou <zhoubb.aaron@gmail.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>,
        loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        WANG Xuerui <git@xen0n.name>
Subject: [PATCH V5 3/5] rtc: Add rtc driver for the Loongson family chips
Date:   Fri,  2 Jun 2023 17:50:48 +0800
Message-Id: <0c5171156390f614d72f36ceb04a20f432ca639e.1685693501.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1685693501.git.zhoubinbin@loongson.cn>
References: <cover.1685693501.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxgjiHu3lk97qFAA--.19179S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvAXoWfJryfJF1xJFW8CFW5AryDtrb_yoW8XFW8to
        WI9FnxWw48W34xWF4j9rnxJr47ZFZ8ur1xJ34Ivr4kCayjyF1DtFW3K3y3JryFvay5Kryf
        Zr93KrsxuFWxJFs8n29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
        J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
        UUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s
        0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
        M2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zV
        CFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2
        z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I
        0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCI
        bckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
        I_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
        6F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7
        xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
        Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jfHUhUUUUU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Loongson family chips use an on-chip counter 0 (Time Of Year
counter) as the RTC. We will refer to them as rtc-loongson.

Cc: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Yang Ling <gnaygnil@gmail.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 drivers/rtc/Kconfig        |  13 ++
 drivers/rtc/Makefile       |   1 +
 drivers/rtc/rtc-loongson.c | 397 +++++++++++++++++++++++++++++++++++++
 3 files changed, 411 insertions(+)
 create mode 100644 drivers/rtc/rtc-loongson.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 599f5110a251..9f5b0afdbad0 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1685,6 +1685,19 @@ config RTC_DRV_JZ4740
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-jz4740.
 
+config RTC_DRV_LOONGSON
+	tristate "Loongson On-chip RTC"
+	depends on MACH_LOONGSON32 || MACH_LOONGSON64 || COMPILE_TEST
+	select REGMAP_MMIO
+	help
+	  This is a driver for the Loongson on-chip Counter0 (Time-Of-Year
+	  counter) to be used as a RTC.
+	  It can be found on Loongson-1 series cpu, Loongson-2K series cpu
+	  and Loongson LS7A bridge chips.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-loongson.
+
 config RTC_DRV_LPC24XX
 	tristate "NXP RTC for LPC178x/18xx/408x/43xx"
 	depends on ARCH_LPC18XX || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index c50afd8fb9f4..fd209883ee2e 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -78,6 +78,7 @@ obj-$(CONFIG_RTC_DRV_ISL12022)	+= rtc-isl12022.o
 obj-$(CONFIG_RTC_DRV_ISL12026)	+= rtc-isl12026.o
 obj-$(CONFIG_RTC_DRV_ISL1208)	+= rtc-isl1208.o
 obj-$(CONFIG_RTC_DRV_JZ4740)	+= rtc-jz4740.o
+obj-$(CONFIG_RTC_DRV_LOONGSON)	+= rtc-loongson.o
 obj-$(CONFIG_RTC_DRV_LP8788)	+= rtc-lp8788.o
 obj-$(CONFIG_RTC_DRV_LPC24XX)	+= rtc-lpc24xx.o
 obj-$(CONFIG_RTC_DRV_LPC32XX)	+= rtc-lpc32xx.o
diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
new file mode 100644
index 000000000000..e8ffc1ab90b0
--- /dev/null
+++ b/drivers/rtc/rtc-loongson.c
@@ -0,0 +1,397 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Loongson RTC driver
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
+#define PM1_STS_REG		0x0c	/* Power management 1 status register */
+#define RTC_STS			BIT(10)	/* RTC status */
+#define PM1_EN_REG		0x10	/* Power management 1 enable register */
+#define RTC_EN			BIT(10)	/* RTC event enable */
+
+/*
+ * According to the LS1C manual, RTC_CTRL and alarm-related registers are not defined.
+ * Accessing the relevant registers will cause the system to hang.
+ */
+#define LS1C_RTC_CTRL_WORKAROUND	BIT(0)
+
+struct loongson_rtc_config {
+	u32 pm_offset;	/* Offset of PM domain, for RTC alarm wakeup */
+	u32 flags;	/* Workaround bits */
+};
+
+struct loongson_rtc_priv {
+	spinlock_t lock;	/* protects PM registers access */
+	u32 fix_year;		/* RTC alarm year compensation value */
+	struct rtc_device *rtcdev;
+	struct regmap *regmap;
+	void __iomem *pm_base;	/* PM domain base, for RTC alarm wakeup */
+	const struct loongson_rtc_config *config;
+};
+
+static const struct loongson_rtc_config ls1b_rtc_config = {
+	.pm_offset = 0,
+	.flags = 0,
+};
+
+static const struct loongson_rtc_config ls1c_rtc_config = {
+	.pm_offset = 0,
+	.flags = LS1C_RTC_CTRL_WORKAROUND,
+};
+
+static const struct loongson_rtc_config generic_rtc_config = {
+	.pm_offset = 0x100,
+	.flags = 0,
+};
+
+static const struct loongson_rtc_config ls2k1000_rtc_config = {
+	.pm_offset = 0x800,
+	.flags = 0,
+};
+
+static const struct regmap_config loongson_rtc_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+/* RTC alarm irq handler */
+static irqreturn_t loongson_rtc_isr(int irq, void *id)
+{
+	struct loongson_rtc_priv *priv = (struct loongson_rtc_priv *)id;
+
+	rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
+	return IRQ_HANDLED;
+}
+
+/* For ACPI fixed event handler */
+static u32 loongson_rtc_handler(void *id)
+{
+	struct loongson_rtc_priv *priv = (struct loongson_rtc_priv *)id;
+
+	spin_lock(&priv->lock);
+	/* Disable RTC alarm wakeup and interrupt */
+	writel(readl(priv->pm_base + PM1_EN_REG) & ~RTC_EN,
+	       priv->pm_base + PM1_EN_REG);
+
+	/* Clear RTC interrupt status */
+	writel(RTC_STS, priv->pm_base + PM1_STS_REG);
+	spin_unlock(&priv->lock);
+
+	/*
+	 * The TOY_MATCH0_REG should be cleared 0 here,
+	 * otherwise the interrupt cannot be cleared.
+	 */
+	return regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
+}
+
+static int loongson_rtc_set_enabled(struct device *dev)
+{
+	struct loongson_rtc_priv *priv = dev_get_drvdata(dev);
+
+	if (priv->config->flags & LS1C_RTC_CTRL_WORKAROUND)
+		return 0;
+
+	/* Enable RTC TOY counters and crystal */
+	return regmap_update_bits(priv->regmap, RTC_CTRL_REG, TOY_ENABLE_MASK,
+				  TOY_ENABLE_MASK);
+}
+
+static bool loongson_rtc_get_enabled(struct device *dev)
+{
+	int ret;
+	u32 ctrl_data;
+	struct loongson_rtc_priv *priv = dev_get_drvdata(dev);
+
+	if (priv->config->flags & LS1C_RTC_CTRL_WORKAROUND)
+		return true;
+
+	ret = regmap_read(priv->regmap, RTC_CTRL_REG, &ctrl_data);
+	if (ret < 0)
+		return false;
+
+	return ctrl_data & TOY_ENABLE_MASK;
+}
+
+static int loongson_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	int ret;
+	u32 rtc_data[2];
+	struct loongson_rtc_priv *priv = dev_get_drvdata(dev);
+
+	if (!loongson_rtc_get_enabled(dev))
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
+	/* Prepare for RTC alarm year compensation value. */
+	priv->fix_year = tm->tm_year / 64 * 64;
+	return 0;
+}
+
+static int loongson_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	int ret;
+	u32 rtc_data[2];
+	struct loongson_rtc_priv *priv = dev_get_drvdata(dev);
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
+	return loongson_rtc_set_enabled(dev);
+}
+
+static int loongson_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	int ret;
+	u32 alarm_data;
+	struct loongson_rtc_priv *priv = dev_get_drvdata(dev);
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
+	 * This is a hardware bug: the year field of SYS_TOYMATCH is only 6 bits,
+	 * making it impossible to save year values larger than 64.
+	 *
+	 * SYS_TOYMATCH is used to match the alarm time value and determine if
+	 * an alarm is triggered, so we must keep the lower 6 bits of the year
+	 * value constant during the value conversion.
+	 *
+	 * In summary, we need to manually add 64(or a multiple of 64) to the
+	 * year value to avoid the invalid alarm prompt at startup.
+	 */
+	alrm->time.tm_year = FIELD_GET(TOY_MATCH_YEAR, alarm_data) + priv->fix_year;
+
+	alrm->enabled = !!(readl(priv->pm_base + PM1_EN_REG) & RTC_EN);
+	return 0;
+}
+
+static int loongson_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	u32 val;
+	struct loongson_rtc_priv *priv = dev_get_drvdata(dev);
+
+	spin_lock(&priv->lock);
+	val = readl(priv->pm_base + PM1_EN_REG);
+	/* Enable RTC alarm wakeup */
+	writel(enabled ? val | RTC_EN : val & ~RTC_EN,
+	       priv->pm_base + PM1_EN_REG);
+	spin_unlock(&priv->lock);
+
+	return 0;
+}
+
+static int loongson_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	int ret;
+	u32 alarm_data;
+	struct loongson_rtc_priv *priv = dev_get_drvdata(dev);
+
+	alarm_data = FIELD_PREP(TOY_MATCH_SEC, alrm->time.tm_sec)
+		   | FIELD_PREP(TOY_MATCH_MIN, alrm->time.tm_min)
+		   | FIELD_PREP(TOY_MATCH_HOUR, alrm->time.tm_hour)
+		   | FIELD_PREP(TOY_MATCH_DAY, alrm->time.tm_mday)
+		   | FIELD_PREP(TOY_MATCH_MON, alrm->time.tm_mon + 1)
+		   | FIELD_PREP(TOY_MATCH_YEAR, alrm->time.tm_year - priv->fix_year);
+
+	ret = regmap_write(priv->regmap, TOY_MATCH0_REG, alarm_data);
+	if (ret < 0)
+		return ret;
+
+	return loongson_rtc_alarm_irq_enable(dev, alrm->enabled);
+}
+
+static const struct rtc_class_ops loongson_rtc_ops = {
+	.read_time = loongson_rtc_read_time,
+	.set_time = loongson_rtc_set_time,
+	.read_alarm = loongson_rtc_read_alarm,
+	.set_alarm = loongson_rtc_set_alarm,
+	.alarm_irq_enable = loongson_rtc_alarm_irq_enable,
+};
+
+static int loongson_rtc_probe(struct platform_device *pdev)
+{
+	int ret, alarm_irq;
+	void __iomem *regs;
+	struct loongson_rtc_priv *priv;
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
+					     &loongson_rtc_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "devm_regmap_init_mmio failed\n");
+
+	priv->config = device_get_match_data(dev);
+	spin_lock_init(&priv->lock);
+	platform_set_drvdata(pdev, priv);
+
+	priv->rtcdev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(priv->rtcdev))
+		return dev_err_probe(dev, PTR_ERR(priv->rtcdev),
+				     "devm_rtc_allocate_device failed\n");
+
+	/* Get RTC alarm irq */
+	alarm_irq = platform_get_irq(pdev, 0);
+	if (alarm_irq > 0) {
+		ret = devm_request_irq(dev, alarm_irq, loongson_rtc_isr,
+				       0, "loongson-alarm", priv);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Unable to request irq %d\n",
+					     alarm_irq);
+
+		priv->pm_base = regs - priv->config->pm_offset;
+		device_init_wakeup(dev, 1);
+
+		if (has_acpi_companion(dev))
+			acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
+							 loongson_rtc_handler, priv);
+	} else {
+		/* Loongson-1C RTC does not support alarm */
+		clear_bit(RTC_FEATURE_ALARM, priv->rtcdev->features);
+	}
+
+	/* Loongson RTC does not support UIE */
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, priv->rtcdev->features);
+	priv->rtcdev->ops = &loongson_rtc_ops;
+	priv->rtcdev->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	priv->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
+
+	return devm_rtc_register_device(priv->rtcdev);
+}
+
+static void loongson_rtc_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct loongson_rtc_priv *priv = dev_get_drvdata(dev);
+
+	if (!test_bit(RTC_FEATURE_ALARM, priv->rtcdev->features))
+		return;
+
+	if (has_acpi_companion(dev))
+		acpi_remove_fixed_event_handler(ACPI_EVENT_RTC,
+						loongson_rtc_handler);
+
+	device_init_wakeup(dev, 0);
+	loongson_rtc_alarm_irq_enable(dev, 0);
+}
+
+static const struct of_device_id loongson_rtc_of_match[] = {
+	{ .compatible = "loongson,ls1b-rtc", .data = &ls1b_rtc_config },
+	{ .compatible = "loongson,ls1c-rtc", .data = &ls1c_rtc_config },
+	{ .compatible = "loongson,ls7a-rtc", .data = &generic_rtc_config },
+	{ .compatible = "loongson,ls2k1000-rtc", .data = &ls2k1000_rtc_config },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, loongson_rtc_of_match);
+
+static const struct acpi_device_id loongson_rtc_acpi_match[] = {
+	{ "LOON0001", .driver_data = (kernel_ulong_t)&generic_rtc_config },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, loongson_rtc_acpi_match);
+
+static struct platform_driver loongson_rtc_driver = {
+	.probe		= loongson_rtc_probe,
+	.remove_new	= loongson_rtc_remove,
+	.driver		= {
+		.name	= "loongson-rtc",
+		.of_match_table = loongson_rtc_of_match,
+		.acpi_match_table = loongson_rtc_acpi_match,
+	},
+};
+module_platform_driver(loongson_rtc_driver);
+
+MODULE_DESCRIPTION("Loongson RTC driver");
+MODULE_AUTHOR("Binbin Zhou <zhoubinbin@loongson.cn>");
+MODULE_AUTHOR("WANG Xuerui <git@xen0n.name>");
+MODULE_AUTHOR("Huacai Chen <chenhuacai@kernel.org>");
+MODULE_LICENSE("GPL");
-- 
2.39.1

