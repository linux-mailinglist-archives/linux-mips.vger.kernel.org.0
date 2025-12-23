Return-Path: <linux-mips+bounces-12546-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D84CD8480
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 07:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDC2B30198A4
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 06:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A980B30274B;
	Tue, 23 Dec 2025 06:42:42 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5242FFF80;
	Tue, 23 Dec 2025 06:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766472162; cv=none; b=n+vyxMEzyYyY1zDaPVYAGR27Y9yXwcHXXkYI/GomUOARKaDI1egELYRQods5sXJmzhgdkqpmOzvBMbkkeRRbnuG/Altk70rHRnaRZk3PQYh/F4If9rZoK4UE0zgu9pbsHajmfx6yilDMlSKHgTgjQLv7NTGRYdWRyDCRz5SRMcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766472162; c=relaxed/simple;
	bh=R3rbppYtdPSOyXLsUKSgPuDIJPjq9NhLpTEFmWQlEEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s6k0G+z43vGRrP5rJ4U/WeSGGyUlk4RSlg0cNyBXxWUtcN9dr6CAcMLYtZemrter1wbaGbUedFOhbOJq5Z8NKrA1ckGTaYDqtt2LJa/TTvU0knDBWAPvvvE27qnPCFsyj2CvKyj/rK9LIX1Y1SAHwEl9d6fgvdRurvgWhr5Ws1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.54])
	by gateway (Coremail) with SMTP id _____8Axz8PcOUppI0wCAA--.7799S3;
	Tue, 23 Dec 2025 14:42:36 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.54])
	by front1 (Coremail) with SMTP id qMiowJBxLMLQOUppTr0DAA--.8929S4;
	Tue, 23 Dec 2025 14:42:32 +0800 (CST)
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
Subject: [PATCH v1 2/2] rtc: loongson: Add Loongson-2K0300 support
Date: Tue, 23 Dec 2025 14:42:13 +0800
Message-ID: <6e10c70653b32f1f79e3f98116924e1aad7154bf.1766471839.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1766471839.git.zhoubinbin@loongson.cn>
References: <cover.1766471839.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxLMLQOUppTr0DAA--.8929S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEFCGlKLxkAeQAAsi
X-Coremail-Antispam: 1Uk129KBj93XoWxZr48JF1xKr13WryUKFWDKFX_yoWrZr4Dpa
	13Ca45Kr4FqF15urZ5JayUGF13CryfXa92qF47K3s7Kr9xA34DZr1kKFy3Z3y3AFZ8ZFW3
	XFWkGFWfua1UCwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0epB3UUUUU==

The Loongson-2K0300's rtc hardware design is similar to that of the
Loongson-1B, but it does not support the alarm feature.

Introduce `LOONGSON_RTC_ALARM_WORKAROUND`, which indicates a chip that
does not support the alarm function, and rewritethe related logic in
`loongson_rtc_alarm_setting()`

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/rtc/rtc-loongson.c | 65 ++++++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
index 2ca7ffd5d7a9..6b076bd4e24e 100644
--- a/drivers/rtc/rtc-loongson.c
+++ b/drivers/rtc/rtc-loongson.c
@@ -67,6 +67,7 @@
  * Accessing the relevant registers will cause the system to hang.
  */
 #define LS1C_RTC_CTRL_WORKAROUND	BIT(0)
+#define LOONGSON_RTC_ALARM_WORKAROUND	BIT(1)
 
 struct loongson_rtc_config {
 	u32 pm_offset;	/* Offset of PM domain, for RTC alarm wakeup */
@@ -89,7 +90,7 @@ static const struct loongson_rtc_config ls1b_rtc_config = {
 
 static const struct loongson_rtc_config ls1c_rtc_config = {
 	.pm_offset = 0,
-	.flags = LS1C_RTC_CTRL_WORKAROUND,
+	.flags = LS1C_RTC_CTRL_WORKAROUND | LOONGSON_RTC_ALARM_WORKAROUND,
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


