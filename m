Return-Path: <linux-mips+bounces-12953-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A37D38B9F
	for <lists+linux-mips@lfdr.de>; Sat, 17 Jan 2026 03:27:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8B9F300D551
	for <lists+linux-mips@lfdr.de>; Sat, 17 Jan 2026 02:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D31319858;
	Sat, 17 Jan 2026 02:27:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F017A314B93;
	Sat, 17 Jan 2026 02:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768616845; cv=none; b=Z2QKx4L9fO0AvVwlUDoF9j8IQr2EHaIP/8ECfF2J4O2Op9ZW+KAJCH7KXdf/iHFf9LpwEnSVipYEAOIJk6RF3F/rTOi4g/uP0zAQi5e2A0lrdcyN9wRP7VnLjXmU6U/YZICXwXRvb7I8p7fxT5nvcDClSvmAuxHYOHiGHhBMBBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768616845; c=relaxed/simple;
	bh=TAG9OVTnNO+QpdOQEVxPbs/3BVwx5fE1zOvGMqWSGK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KrTzma5RHMNFBlsFbeNytn+ez1HkwDAAf+wvuD+TYkwUzNoUYKxJCh8THL/C6HJL1yb34eVc3txZQwxMKvjimjCTqEIuCYGi4hZ7dE53XxnPqQIL4ZR4okExYhkRGKQkSA+y5bg7fU0smZZLa0ZRrHRhTVJ6tymOUHN+K4QUpko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8BxmsKA82pp38cJAA--.31811S3;
	Sat, 17 Jan 2026 10:27:12 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJDxTMJ082ppbNkgAA--.65061S5;
	Sat, 17 Jan 2026 10:27:11 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 3/3] rtc: loongson: Add Loongson-2K0300 support
Date: Sat, 17 Jan 2026 10:26:50 +0800
Message-ID: <abff68dda2fe6a6601a9e58b31e278d941297fce.1768616276.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768616276.git.zhoubinbin@loongson.cn>
References: <cover.1768616276.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTMJ082ppbNkgAA--.65061S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEKCGlp0xwWWAAAsA
X-Coremail-Antispam: 1Uk129KBj93XoWxuFW3uw1fKry8GF1kXw17twc_yoW7WF17pw
	43Aa45Kr4FqF15urs5JayUGF13CryfGa4IqF47K3s2g3sxA34DZr1kKFy3Z3y3AF98ZFW3
	XFWkGFWfua1UCwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0epB3UUUUU==

The Loongson-2K0300's rtc hardware design is similar to that of the
Loongson-1B, but it does not support the alarm feature.

Introduce `LOONGSON_RTC_ALARM_WORKAROUND`, which indicates a chip that
does not support the alarm feature, and rewrite the related logic in
`loongson_rtc_alarm_setting()`.

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/rtc/rtc-loongson.c | 71 +++++++++++++++++++++++++-------------
 1 file changed, 47 insertions(+), 24 deletions(-)

diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
index 2ca7ffd5d7a9..066f0644d1c3 100644
--- a/drivers/rtc/rtc-loongson.c
+++ b/drivers/rtc/rtc-loongson.c
@@ -66,7 +66,8 @@
  * According to the LS1C manual, RTC_CTRL and alarm-related registers are not defined.
  * Accessing the relevant registers will cause the system to hang.
  */
-#define LS1C_RTC_CTRL_WORKAROUND	BIT(0)
+#define LOONGSON_RTC_CTRL_WORKAROUND	BIT(0)
+#define LOONGSON_RTC_ALARM_WORKAROUND	BIT(1)
 
 struct loongson_rtc_config {
 	u32 pm_offset;	/* Offset of PM domain, for RTC alarm wakeup */
@@ -89,7 +90,7 @@ static const struct loongson_rtc_config ls1b_rtc_config = {
 
 static const struct loongson_rtc_config ls1c_rtc_config = {
 	.pm_offset = 0,
-	.flags = LS1C_RTC_CTRL_WORKAROUND,
+	.flags = LOONGSON_RTC_CTRL_WORKAROUND | LOONGSON_RTC_ALARM_WORKAROUND,
 };
 
 static const struct loongson_rtc_config generic_rtc_config = {
@@ -97,6 +98,11 @@ static const struct loongson_rtc_config generic_rtc_config = {
 	.flags = 0,
 };
 
+static const struct loongson_rtc_config ls2k0300_rtc_config = {
+	.pm_offset = 0x0,
+	.flags = LOONGSON_RTC_ALARM_WORKAROUND,
+};
+
 static const struct loongson_rtc_config ls2k1000_rtc_config = {
 	.pm_offset = 0x800,
 	.flags = 0,
@@ -153,7 +159,7 @@ static int loongson_rtc_set_enabled(struct device *dev)
 {
 	struct loongson_rtc_priv *priv = dev_get_drvdata(dev);
 
-	if (priv->config->flags & LS1C_RTC_CTRL_WORKAROUND)
+	if (priv->config->flags & LOONGSON_RTC_CTRL_WORKAROUND)
 		return 0;
 
 	/* Enable RTC TOY counters and crystal */
@@ -167,7 +173,7 @@ static bool loongson_rtc_get_enabled(struct device *dev)
 	u32 ctrl_data;
 	struct loongson_rtc_priv *priv = dev_get_drvdata(dev);
 
-	if (priv->config->flags & LS1C_RTC_CTRL_WORKAROUND)
+	if (priv->config->flags & LOONGSON_RTC_CTRL_WORKAROUND)
 		return true;
 
 	ret = regmap_read(priv->regmap, RTC_CTRL_REG, &ctrl_data);
@@ -299,9 +305,41 @@ static const struct rtc_class_ops loongson_rtc_ops = {
 	.alarm_irq_enable = loongson_rtc_alarm_irq_enable,
 };
 
+static int loongson_rtc_alarm_setting(struct platform_device *pdev, void __iomem *regs)
+{
+	int ret = 0, alarm_irq;
+	struct device *dev = &pdev->dev;
+	struct loongson_rtc_priv *priv = dev_get_drvdata(dev);
+
+	if (priv->config->flags & LOONGSON_RTC_ALARM_WORKAROUND) {
+		/* Loongson-1C/Loongson-2K0300 RTC does not support alarm */
+		clear_bit(RTC_FEATURE_ALARM, priv->rtcdev->features);
+		return 0;
+	}
+
+	/* Get RTC alarm irq */
+	alarm_irq = platform_get_irq(pdev, 0);
+	if (alarm_irq < 0)
+		return alarm_irq;
+
+	ret = devm_request_irq(dev, alarm_irq, loongson_rtc_isr, 0, "loongson-alarm",
+			       priv);
+	if (ret < 0)
+		return ret;
+
+	priv->pm_base = regs - priv->config->pm_offset;
+	device_init_wakeup(dev, true);
+
+	if (has_acpi_companion(dev))
+		acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
+						 loongson_rtc_handler, priv);
+
+	return ret;
+}
+
 static int loongson_rtc_probe(struct platform_device *pdev)
 {
-	int ret, alarm_irq;
+	int ret;
 	void __iomem *regs;
 	struct loongson_rtc_priv *priv;
 	struct device *dev = &pdev->dev;
@@ -330,25 +368,9 @@ static int loongson_rtc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->rtcdev),
 				     "devm_rtc_allocate_device failed\n");
 
-	/* Get RTC alarm irq */
-	alarm_irq = platform_get_irq(pdev, 0);
-	if (alarm_irq > 0) {
-		ret = devm_request_irq(dev, alarm_irq, loongson_rtc_isr,
-				       0, "loongson-alarm", priv);
-		if (ret < 0)
-			return dev_err_probe(dev, ret, "Unable to request irq %d\n",
-					     alarm_irq);
-
-		priv->pm_base = regs - priv->config->pm_offset;
-		device_init_wakeup(dev, true);
-
-		if (has_acpi_companion(dev))
-			acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
-							 loongson_rtc_handler, priv);
-	} else {
-		/* Loongson-1C RTC does not support alarm */
-		clear_bit(RTC_FEATURE_ALARM, priv->rtcdev->features);
-	}
+	ret = loongson_rtc_alarm_setting(pdev, regs);
+	if (ret)
+		return ret;
 
 	/* Loongson RTC does not support UIE */
 	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, priv->rtcdev->features);
@@ -379,6 +401,7 @@ static const struct of_device_id loongson_rtc_of_match[] = {
 	{ .compatible = "loongson,ls1b-rtc", .data = &ls1b_rtc_config },
 	{ .compatible = "loongson,ls1c-rtc", .data = &ls1c_rtc_config },
 	{ .compatible = "loongson,ls7a-rtc", .data = &generic_rtc_config },
+	{ .compatible = "loongson,ls2k0300-rtc", .data = &ls2k0300_rtc_config },
 	{ .compatible = "loongson,ls2k1000-rtc", .data = &ls2k1000_rtc_config },
 	{ /* sentinel */ }
 };
-- 
2.47.3


