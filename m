Return-Path: <linux-mips+bounces-7059-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CF89F44DE
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 08:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70FD9188BDF0
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 07:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D1D16D9AF;
	Tue, 17 Dec 2024 07:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aTCZSgXi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3149914831E
	for <linux-mips@vger.kernel.org>; Tue, 17 Dec 2024 07:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734419747; cv=none; b=YUK4dpvYFNSOjYcLUzk0CoP/7lvP6qropVx3VjEXyr4Q2vRKOSCHY2uMBq/ek0J5XCk2JTh1ALAd3vmsGM66cvU/CFuHQrPjD/x6owoQfmvj4ELVwz7+Q988TS+wuiTpqj1vAKUIo8rHodYe7uR9WGxQB7DKO1hSDe5sBHdqBw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734419747; c=relaxed/simple;
	bh=WPui7jMUaBHKPyiD+wAhYBFDBlqkc+fFLFeTeTz33rg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fMwpP9qdqLrli8YrNYBpcB9oXohST7FVAZsB748qqaULZD+P4baYFdJgw3kO0s1mJfx+/R/Lqq5xi89eMRI3gnRVyQmpUcuRwGvMA6fmrNRjP4T7I4BVSi2PclkL+uxd3TeNgWS7H8HLpnHMYkoj2ZNnsm81azngfarVbWPjUX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aTCZSgXi; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=b/7I37hxwoXCTJ
	gyBf1JpuEr92Ph0ikoAk2pcmg4ckM=; b=aTCZSgXiv3O7G4p6VHvXKpHcWEyGW1
	aJpixOg3kqNkPtJoulqHAdqGEEXfsyIR3VDFBDV9gpbJc6EIS3usJRiT0YO/BvDo
	u0u/shsCvMQ2CmVxmOHUxkCJTDXyMWE5rVQL70yjcgK5utLkuIpephkboCJWkpyX
	TqZ1PCaxeZVCeImVN3agTlaYNLESyn2ZlNmUdFa2PKP3sbj6YRFYLQmjHRWNjPq+
	L1qaJUm+4bieXdYdYf8UzBbPNR5HfgwFqpJP3wCu288HR+szFX+1UnAAsf/q79cj
	rWx/2bEI4g3kyQRn28iqbh/Ou2kaYs+JI2k17jgKZNOgKx/UeNIqZ/HQ==
Received: (qmail 3980322 invoked from network); 17 Dec 2024 08:15:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Dec 2024 08:15:40 +0100
X-UD-Smtp-Session: l3s3148p1@VAKHEHIpqoVehhtS
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-rtc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Yiting Deng <yiting.deng@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vincent Shih <vincent.sunplus@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH] rtc: use boolean values with device_init_wakeup()
Date: Tue, 17 Dec 2024 08:13:26 +0100
Message-ID: <20241217071331.3607-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

device_init_wakeup() second argument is a bool type. Use proper boolean
values when calling it to match the type and to produce unambiguous code
which is easier to understand.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Created with a coccinelle script. I opted for a single patch because the change
is rather trivial. I can break out per driver if this is desired. If you
like the change at all, that is.

 drivers/rtc/rtc-88pm80x.c       | 2 +-
 drivers/rtc/rtc-88pm860x.c      | 2 +-
 drivers/rtc/rtc-amlogic-a4.c    | 6 +++---
 drivers/rtc/rtc-armada38x.c     | 2 +-
 drivers/rtc/rtc-as3722.c        | 2 +-
 drivers/rtc/rtc-at91rm9200.c    | 2 +-
 drivers/rtc/rtc-at91sam9.c      | 2 +-
 drivers/rtc/rtc-cadence.c       | 2 +-
 drivers/rtc/rtc-cmos.c          | 2 +-
 drivers/rtc/rtc-cpcap.c         | 2 +-
 drivers/rtc/rtc-cros-ec.c       | 2 +-
 drivers/rtc/rtc-da9055.c        | 2 +-
 drivers/rtc/rtc-ds3232.c        | 2 +-
 drivers/rtc/rtc-isl1208.c       | 2 +-
 drivers/rtc/rtc-jz4740.c        | 2 +-
 drivers/rtc/rtc-loongson.c      | 4 ++--
 drivers/rtc/rtc-lp8788.c        | 2 +-
 drivers/rtc/rtc-lpc32xx.c       | 2 +-
 drivers/rtc/rtc-max77686.c      | 2 +-
 drivers/rtc/rtc-max8925.c       | 2 +-
 drivers/rtc/rtc-max8997.c       | 2 +-
 drivers/rtc/rtc-meson-vrtc.c    | 2 +-
 drivers/rtc/rtc-mpc5121.c       | 2 +-
 drivers/rtc/rtc-mt6397.c        | 2 +-
 drivers/rtc/rtc-mv.c            | 4 ++--
 drivers/rtc/rtc-mxc.c           | 2 +-
 drivers/rtc/rtc-mxc_v2.c        | 2 +-
 drivers/rtc/rtc-omap.c          | 2 +-
 drivers/rtc/rtc-palmas.c        | 2 +-
 drivers/rtc/rtc-pic32.c         | 2 +-
 drivers/rtc/rtc-pm8xxx.c        | 2 +-
 drivers/rtc/rtc-pxa.c           | 2 +-
 drivers/rtc/rtc-rc5t583.c       | 2 +-
 drivers/rtc/rtc-rc5t619.c       | 2 +-
 drivers/rtc/rtc-renesas-rtca3.c | 2 +-
 drivers/rtc/rtc-rk808.c         | 2 +-
 drivers/rtc/rtc-s3c.c           | 2 +-
 drivers/rtc/rtc-s5m.c           | 2 +-
 drivers/rtc/rtc-sa1100.c        | 2 +-
 drivers/rtc/rtc-sc27xx.c        | 4 ++--
 drivers/rtc/rtc-sh.c            | 2 +-
 drivers/rtc/rtc-spear.c         | 4 ++--
 drivers/rtc/rtc-sun6i.c         | 2 +-
 drivers/rtc/rtc-sunplus.c       | 4 ++--
 drivers/rtc/rtc-tegra.c         | 2 +-
 drivers/rtc/rtc-test.c          | 2 +-
 drivers/rtc/rtc-tps6586x.c      | 2 +-
 drivers/rtc/rtc-tps65910.c      | 2 +-
 drivers/rtc/rtc-twl.c           | 2 +-
 drivers/rtc/rtc-wm831x.c        | 2 +-
 drivers/rtc/rtc-wm8350.c        | 2 +-
 drivers/rtc/rtc-xgene.c         | 4 ++--
 drivers/rtc/rtc-zynqmp.c        | 4 ++--
 53 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/drivers/rtc/rtc-88pm80x.c b/drivers/rtc/rtc-88pm80x.c
index 5c39cf252392..a3e52a5a708f 100644
--- a/drivers/rtc/rtc-88pm80x.c
+++ b/drivers/rtc/rtc-88pm80x.c
@@ -308,7 +308,7 @@ static int pm80x_rtc_probe(struct platform_device *pdev)
 	/* remember whether this power up is caused by PMIC RTC or not */
 	info->rtc_dev->dev.platform_data = &pdata->rtc_wakeup;
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	return 0;
 out_rtc:
diff --git a/drivers/rtc/rtc-88pm860x.c b/drivers/rtc/rtc-88pm860x.c
index 814230d61842..964cd048fcdb 100644
--- a/drivers/rtc/rtc-88pm860x.c
+++ b/drivers/rtc/rtc-88pm860x.c
@@ -326,7 +326,7 @@ static int pm860x_rtc_probe(struct platform_device *pdev)
 	schedule_delayed_work(&info->calib_work, VRTC_CALIB_INTERVAL);
 #endif	/* VRTC_CALIBRATION */
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	return 0;
 }
diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index 2278b4c98a71..09d78c2cc691 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -361,7 +361,7 @@ static int aml_rtc_probe(struct platform_device *pdev)
 				     "failed to get_enable rtc sys clk\n");
 	aml_rtc_init(rtc);
 
-	device_init_wakeup(dev, 1);
+	device_init_wakeup(dev, true);
 	platform_set_drvdata(pdev, rtc);
 
 	rtc->rtc_dev = devm_rtc_allocate_device(dev);
@@ -391,7 +391,7 @@ static int aml_rtc_probe(struct platform_device *pdev)
 	return 0;
 err_clk:
 	clk_disable_unprepare(rtc->sys_clk);
-	device_init_wakeup(dev, 0);
+	device_init_wakeup(dev, false);
 
 	return ret;
 }
@@ -426,7 +426,7 @@ static void aml_rtc_remove(struct platform_device *pdev)
 	struct aml_rtc_data *rtc = dev_get_drvdata(&pdev->dev);
 
 	clk_disable_unprepare(rtc->sys_clk);
-	device_init_wakeup(&pdev->dev, 0);
+	device_init_wakeup(&pdev->dev, false);
 }
 
 static const struct aml_rtc_config a5_rtc_config = {
diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
index 569c1054d6b0..713fa0d077cd 100644
--- a/drivers/rtc/rtc-armada38x.c
+++ b/drivers/rtc/rtc-armada38x.c
@@ -527,7 +527,7 @@ static __init int armada38x_rtc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rtc);
 
 	if (rtc->irq != -1)
-		device_init_wakeup(&pdev->dev, 1);
+		device_init_wakeup(&pdev->dev, true);
 	else
 		clear_bit(RTC_FEATURE_ALARM, rtc->rtc_dev->features);
 
diff --git a/drivers/rtc/rtc-as3722.c b/drivers/rtc/rtc-as3722.c
index 0f21af27f4cf..9682d6457b7f 100644
--- a/drivers/rtc/rtc-as3722.c
+++ b/drivers/rtc/rtc-as3722.c
@@ -187,7 +187,7 @@ static int as3722_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	as3722_rtc->rtc = devm_rtc_device_register(&pdev->dev, "as3722-rtc",
 				&as3722_rtc_ops, THIS_MODULE);
diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index 9b3898b8de7c..f6b0102a843a 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -528,7 +528,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 	 * being wake-capable; if it didn't, do that here.
 	 */
 	if (!device_can_wakeup(&pdev->dev))
-		device_init_wakeup(&pdev->dev, 1);
+		device_init_wakeup(&pdev->dev, true);
 
 	if (at91_rtc_config->has_correction)
 		rtc->ops = &sama5d4_rtc_ops;
diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
index 15b21da2788f..38991cca5930 100644
--- a/drivers/rtc/rtc-at91sam9.c
+++ b/drivers/rtc/rtc-at91sam9.c
@@ -353,7 +353,7 @@ static int at91_rtc_probe(struct platform_device *pdev)
 
 	/* platform setup code should have handled this; sigh */
 	if (!device_can_wakeup(&pdev->dev))
-		device_init_wakeup(&pdev->dev, 1);
+		device_init_wakeup(&pdev->dev, true);
 
 	platform_set_drvdata(pdev, rtc);
 
diff --git a/drivers/rtc/rtc-cadence.c b/drivers/rtc/rtc-cadence.c
index bf2a9a1fdea7..8634eea799ab 100644
--- a/drivers/rtc/rtc-cadence.c
+++ b/drivers/rtc/rtc-cadence.c
@@ -359,7 +359,7 @@ static void cdns_rtc_remove(struct platform_device *pdev)
 	struct cdns_rtc *crtc = platform_get_drvdata(pdev);
 
 	cdns_rtc_alarm_irq_enable(&pdev->dev, 0);
-	device_init_wakeup(&pdev->dev, 0);
+	device_init_wakeup(&pdev->dev, false);
 
 	clk_disable_unprepare(crtc->pclk);
 	clk_disable_unprepare(crtc->ref_clk);
diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 78f2ce12c75a..4bd3a3a04d44 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -864,7 +864,7 @@ static void acpi_cmos_wake_setup(struct device *dev)
 		dev_info(dev, "RTC can wake from S4\n");
 
 	/* RTC always wakes from S1/S2/S3, and often S4/STD */
-	device_init_wakeup(dev, 1);
+	device_init_wakeup(dev, true);
 }
 
 static void cmos_check_acpi_rtc_status(struct device *dev,
diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
index afc8fcba8f88..568a89e79c11 100644
--- a/drivers/rtc/rtc-cpcap.c
+++ b/drivers/rtc/rtc-cpcap.c
@@ -295,7 +295,7 @@ static int cpcap_rtc_probe(struct platform_device *pdev)
 	}
 	disable_irq(rtc->update_irq);
 
-	err = device_init_wakeup(dev, 1);
+	err = device_init_wakeup(dev, true);
 	if (err) {
 		dev_err(dev, "wakeup initialization failed (%d)\n", err);
 		/* ignore error and continue without wakeup support */
diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index 60a48c3ba3ca..865c2e82c7a5 100644
--- a/drivers/rtc/rtc-cros-ec.c
+++ b/drivers/rtc/rtc-cros-ec.c
@@ -337,7 +337,7 @@ static int cros_ec_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = device_init_wakeup(&pdev->dev, 1);
+	ret = device_init_wakeup(&pdev->dev, true);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to initialize wakeup\n");
 		return ret;
diff --git a/drivers/rtc/rtc-da9055.c b/drivers/rtc/rtc-da9055.c
index 844168fcae1e..05adec6b77bf 100644
--- a/drivers/rtc/rtc-da9055.c
+++ b/drivers/rtc/rtc-da9055.c
@@ -288,7 +288,7 @@ static int da9055_rtc_probe(struct platform_device *pdev)
 	if (ret & DA9055_RTC_ALM_EN)
 		rtc->alarm_enable = 1;
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
 					&da9055_rtc_ops, THIS_MODULE);
diff --git a/drivers/rtc/rtc-ds3232.c b/drivers/rtc/rtc-ds3232.c
index dd37b055693c..19c09c418746 100644
--- a/drivers/rtc/rtc-ds3232.c
+++ b/drivers/rtc/rtc-ds3232.c
@@ -508,7 +508,7 @@ static int ds3232_probe(struct device *dev, struct regmap *regmap, int irq,
 		return ret;
 
 	if (ds3232->irq > 0)
-		device_init_wakeup(dev, 1);
+		device_init_wakeup(dev, true);
 
 	ds3232_hwmon_register(dev, name);
 
diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index 7b82e4a14b7a..f71a6bb77b2a 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -830,7 +830,7 @@ static int isl1208_setup_irq(struct i2c_client *client, int irq)
 					isl1208_driver.driver.name,
 					client);
 	if (!rc) {
-		device_init_wakeup(&client->dev, 1);
+		device_init_wakeup(&client->dev, true);
 		enable_irq_wake(irq);
 	} else {
 		dev_err(&client->dev,
diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index bafa7d1b9b88..44bba356268c 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -367,7 +367,7 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rtc);
 
-	device_init_wakeup(dev, 1);
+	device_init_wakeup(dev, true);
 
 	ret = dev_pm_set_wake_irq(dev, irq);
 	if (ret)
diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
index 8d713e563d7c..6f5f4430c2ae 100644
--- a/drivers/rtc/rtc-loongson.c
+++ b/drivers/rtc/rtc-loongson.c
@@ -329,7 +329,7 @@ static int loongson_rtc_probe(struct platform_device *pdev)
 					     alarm_irq);
 
 		priv->pm_base = regs - priv->config->pm_offset;
-		device_init_wakeup(dev, 1);
+		device_init_wakeup(dev, true);
 
 		if (has_acpi_companion(dev))
 			acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
@@ -360,7 +360,7 @@ static void loongson_rtc_remove(struct platform_device *pdev)
 		acpi_remove_fixed_event_handler(ACPI_EVENT_RTC,
 						loongson_rtc_handler);
 
-	device_init_wakeup(dev, 0);
+	device_init_wakeup(dev, false);
 	loongson_rtc_alarm_irq_enable(dev, 0);
 }
 
diff --git a/drivers/rtc/rtc-lp8788.c b/drivers/rtc/rtc-lp8788.c
index c0b8fbce1082..0793d70507f7 100644
--- a/drivers/rtc/rtc-lp8788.c
+++ b/drivers/rtc/rtc-lp8788.c
@@ -293,7 +293,7 @@ static int lp8788_rtc_probe(struct platform_device *pdev)
 	rtc->alarm = lp->pdata ? lp->pdata->alarm_sel : DEFAULT_ALARM_SEL;
 	platform_set_drvdata(pdev, rtc);
 
-	device_init_wakeup(dev, 1);
+	device_init_wakeup(dev, true);
 
 	rtc->rdev = devm_rtc_device_register(dev, "lp8788_rtc",
 					&lp8788_rtc_ops, THIS_MODULE);
diff --git a/drivers/rtc/rtc-lpc32xx.c b/drivers/rtc/rtc-lpc32xx.c
index 76ad7031a13d..74280bffe1b0 100644
--- a/drivers/rtc/rtc-lpc32xx.c
+++ b/drivers/rtc/rtc-lpc32xx.c
@@ -257,7 +257,7 @@ static int lpc32xx_rtc_probe(struct platform_device *pdev)
 			dev_warn(&pdev->dev, "Can't request interrupt.\n");
 			rtc->irq = -1;
 		} else {
-			device_init_wakeup(&pdev->dev, 1);
+			device_init_wakeup(&pdev->dev, true);
 		}
 	}
 
diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index a8f4b645c09d..7bb044d2ac25 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -770,7 +770,7 @@ static int max77686_rtc_probe(struct platform_device *pdev)
 		goto err_rtc;
 	}
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	info->rtc_dev = devm_rtc_device_register(&pdev->dev, id->name,
 					&max77686_rtc_ops, THIS_MODULE);
diff --git a/drivers/rtc/rtc-max8925.c b/drivers/rtc/rtc-max8925.c
index 64bb8ac6ef62..6ce8afbeac68 100644
--- a/drivers/rtc/rtc-max8925.c
+++ b/drivers/rtc/rtc-max8925.c
@@ -270,7 +270,7 @@ static int max8925_rtc_probe(struct platform_device *pdev)
 	/* XXX - isn't this redundant? */
 	platform_set_drvdata(pdev, info);
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	info->rtc_dev = devm_rtc_device_register(&pdev->dev, "max8925-rtc",
 					&max8925_rtc_ops, THIS_MODULE);
diff --git a/drivers/rtc/rtc-max8997.c b/drivers/rtc/rtc-max8997.c
index 20e50d9fdf88..e7618d715bd8 100644
--- a/drivers/rtc/rtc-max8997.c
+++ b/drivers/rtc/rtc-max8997.c
@@ -473,7 +473,7 @@ static int max8997_rtc_probe(struct platform_device *pdev)
 	max8997_rtc_enable_wtsr(info, true);
 	max8997_rtc_enable_smpl(info, true);
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	info->rtc_dev = devm_rtc_device_register(&pdev->dev, "max8997-rtc",
 					&max8997_rtc_ops, THIS_MODULE);
diff --git a/drivers/rtc/rtc-meson-vrtc.c b/drivers/rtc/rtc-meson-vrtc.c
index 648fa362ec44..5849729f7d01 100644
--- a/drivers/rtc/rtc-meson-vrtc.c
+++ b/drivers/rtc/rtc-meson-vrtc.c
@@ -74,7 +74,7 @@ static int meson_vrtc_probe(struct platform_device *pdev)
 	if (IS_ERR(vrtc->io_alarm))
 		return PTR_ERR(vrtc->io_alarm);
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	platform_set_drvdata(pdev, vrtc);
 
diff --git a/drivers/rtc/rtc-mpc5121.c b/drivers/rtc/rtc-mpc5121.c
index 600328131603..b90f8337a7e6 100644
--- a/drivers/rtc/rtc-mpc5121.c
+++ b/drivers/rtc/rtc-mpc5121.c
@@ -303,7 +303,7 @@ static int mpc5121_rtc_probe(struct platform_device *op)
 		return PTR_ERR(rtc->regs);
 	}
 
-	device_init_wakeup(&op->dev, 1);
+	device_init_wakeup(&op->dev, true);
 
 	platform_set_drvdata(op, rtc);
 
diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 152699219a2b..6979d225a78e 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -286,7 +286,7 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	rtc->rtc_dev->ops = &mtk_rtc_ops;
 	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
diff --git a/drivers/rtc/rtc-mv.c b/drivers/rtc/rtc-mv.c
index 51029c536244..c27ad626d09f 100644
--- a/drivers/rtc/rtc-mv.c
+++ b/drivers/rtc/rtc-mv.c
@@ -264,7 +264,7 @@ static int __init mv_rtc_probe(struct platform_device *pdev)
 	}
 
 	if (pdata->irq >= 0)
-		device_init_wakeup(&pdev->dev, 1);
+		device_init_wakeup(&pdev->dev, true);
 	else
 		clear_bit(RTC_FEATURE_ALARM, pdata->rtc->features);
 
@@ -287,7 +287,7 @@ static void __exit mv_rtc_remove(struct platform_device *pdev)
 	struct rtc_plat_data *pdata = platform_get_drvdata(pdev);
 
 	if (pdata->irq >= 0)
-		device_init_wakeup(&pdev->dev, 0);
+		device_init_wakeup(&pdev->dev, false);
 
 	if (!IS_ERR(pdata->clk))
 		clk_disable_unprepare(pdata->clk);
diff --git a/drivers/rtc/rtc-mxc.c b/drivers/rtc/rtc-mxc.c
index dbb935dbbd8a..608db97d450c 100644
--- a/drivers/rtc/rtc-mxc.c
+++ b/drivers/rtc/rtc-mxc.c
@@ -377,7 +377,7 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 	}
 
 	if (pdata->irq >= 0) {
-		device_init_wakeup(&pdev->dev, 1);
+		device_init_wakeup(&pdev->dev, true);
 		ret = dev_pm_set_wake_irq(&pdev->dev, pdata->irq);
 		if (ret)
 			dev_err(&pdev->dev, "failed to enable irq wake\n");
diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
index 13c041bb79f1..570f27af4732 100644
--- a/drivers/rtc/rtc-mxc_v2.c
+++ b/drivers/rtc/rtc-mxc_v2.c
@@ -302,7 +302,7 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 	if (pdata->irq < 0)
 		return pdata->irq;
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 	ret = dev_pm_set_wake_irq(&pdev->dev, pdata->irq);
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index c123778e2d9b..0f90065e352c 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -920,7 +920,7 @@ static void omap_rtc_remove(struct platform_device *pdev)
 		omap_rtc_power_off_rtc = NULL;
 	}
 
-	device_init_wakeup(&pdev->dev, 0);
+	device_init_wakeup(&pdev->dev, false);
 
 	if (!IS_ERR(rtc->clk))
 		clk_disable_unprepare(rtc->clk);
diff --git a/drivers/rtc/rtc-palmas.c b/drivers/rtc/rtc-palmas.c
index 7256a88b490c..aecada6bcf8b 100644
--- a/drivers/rtc/rtc-palmas.c
+++ b/drivers/rtc/rtc-palmas.c
@@ -287,7 +287,7 @@ static int palmas_rtc_probe(struct platform_device *pdev)
 
 	palmas_rtc->irq = platform_get_irq(pdev, 0);
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 	palmas_rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
 				&palmas_rtc_ops, THIS_MODULE);
 	if (IS_ERR(palmas_rtc->rtc)) {
diff --git a/drivers/rtc/rtc-pic32.c b/drivers/rtc/rtc-pic32.c
index bed3c27e665f..2812da2c50c5 100644
--- a/drivers/rtc/rtc-pic32.c
+++ b/drivers/rtc/rtc-pic32.c
@@ -330,7 +330,7 @@ static int pic32_rtc_probe(struct platform_device *pdev)
 
 	pic32_rtc_enable(pdata, 1);
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	pdata->rtc->ops = &pic32_rtcops;
 	pdata->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 2f32187ecc8d..b2518aea4218 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -503,7 +503,7 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rtc_dd);
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	rtc_dd->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc_dd->rtc))
diff --git a/drivers/rtc/rtc-pxa.c b/drivers/rtc/rtc-pxa.c
index 34d8545c8e15..62ee6b8f9bcd 100644
--- a/drivers/rtc/rtc-pxa.c
+++ b/drivers/rtc/rtc-pxa.c
@@ -360,7 +360,7 @@ static int __init pxa_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	device_init_wakeup(dev, 1);
+	device_init_wakeup(dev, true);
 
 	return 0;
 }
diff --git a/drivers/rtc/rtc-rc5t583.c b/drivers/rtc/rtc-rc5t583.c
index eecb49bab56a..8ba9cda74acf 100644
--- a/drivers/rtc/rtc-rc5t583.c
+++ b/drivers/rtc/rtc-rc5t583.c
@@ -245,7 +245,7 @@ static int rc5t583_rtc_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "IRQ is not free.\n");
 		return ret;
 	}
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	ricoh_rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
 		&rc5t583_rtc_ops, THIS_MODULE);
diff --git a/drivers/rtc/rtc-rc5t619.c b/drivers/rtc/rtc-rc5t619.c
index 711f62eecd79..74d169102074 100644
--- a/drivers/rtc/rtc-rc5t619.c
+++ b/drivers/rtc/rtc-rc5t619.c
@@ -414,7 +414,7 @@ static int rc5t619_rtc_probe(struct platform_device *pdev)
 
 		} else {
 			/* enable wake */
-			device_init_wakeup(&pdev->dev, 1);
+			device_init_wakeup(&pdev->dev, true);
 			enable_irq_wake(rtc->irq);
 		}
 	} else {
diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index d127933bfc8a..a056291d3887 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -768,7 +768,7 @@ static int rtca3_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	priv->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(priv->rtc_dev))
diff --git a/drivers/rtc/rtc-rk808.c b/drivers/rtc/rtc-rk808.c
index 2d9bcb3ce1e3..59b8e9a30fe6 100644
--- a/drivers/rtc/rtc-rk808.c
+++ b/drivers/rtc/rtc-rk808.c
@@ -418,7 +418,7 @@ static int rk808_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	rk808_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rk808_rtc->rtc))
diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index c0ac3bdb2f42..58c957eb753d 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -456,7 +456,7 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "s3c2410_rtc: RTCCON=%02x\n",
 		readw(info->base + S3C2410_RTCCON));
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	info->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(info->rtc)) {
diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index dad294a0ce2a..36acca5b2639 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -729,7 +729,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 				info->irq, ret);
 			return ret;
 		}
-		device_init_wakeup(&pdev->dev, 1);
+		device_init_wakeup(&pdev->dev, true);
 	}
 
 	return devm_rtc_register_device(info->rtc_dev);
diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
index 13799b1abca1..1ad93648d69c 100644
--- a/drivers/rtc/rtc-sa1100.c
+++ b/drivers/rtc/rtc-sa1100.c
@@ -292,7 +292,7 @@ static int sa1100_rtc_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, info);
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	return sa1100_rtc_init(pdev, info);
 }
diff --git a/drivers/rtc/rtc-sc27xx.c b/drivers/rtc/rtc-sc27xx.c
index ce7a2ddbbc16..2b83561d4d28 100644
--- a/drivers/rtc/rtc-sc27xx.c
+++ b/drivers/rtc/rtc-sc27xx.c
@@ -613,14 +613,14 @@ static int sprd_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	rtc->rtc->ops = &sprd_rtc_ops;
 	rtc->rtc->range_min = 0;
 	rtc->rtc->range_max = 5662310399LL;
 	ret = devm_rtc_register_device(rtc->rtc);
 	if (ret) {
-		device_init_wakeup(&pdev->dev, 0);
+		device_init_wakeup(&pdev->dev, false);
 		return ret;
 	}
 
diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index a5df521876ba..9ea40f40188f 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -611,7 +611,7 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unmap;
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 	return 0;
 
 err_unmap:
diff --git a/drivers/rtc/rtc-spear.c b/drivers/rtc/rtc-spear.c
index 26eed927f8b3..959acff8faff 100644
--- a/drivers/rtc/rtc-spear.c
+++ b/drivers/rtc/rtc-spear.c
@@ -395,7 +395,7 @@ static int spear_rtc_probe(struct platform_device *pdev)
 		goto err_disable_clock;
 
 	if (!device_can_wakeup(&pdev->dev))
-		device_init_wakeup(&pdev->dev, 1);
+		device_init_wakeup(&pdev->dev, true);
 
 	return 0;
 
@@ -411,7 +411,7 @@ static void spear_rtc_remove(struct platform_device *pdev)
 
 	spear_rtc_disable_interrupt(config);
 	clk_disable_unprepare(config->clk);
-	device_init_wakeup(&pdev->dev, 0);
+	device_init_wakeup(&pdev->dev, false);
 }
 
 #ifdef CONFIG_PM_SLEEP
diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index e681c1745866..e5e6013d080e 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -826,7 +826,7 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 
 	clk_prepare_enable(chip->losc);
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	chip->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(chip->rtc))
diff --git a/drivers/rtc/rtc-sunplus.c b/drivers/rtc/rtc-sunplus.c
index 9b1ce0e8ba27..519a06e728d6 100644
--- a/drivers/rtc/rtc-sunplus.c
+++ b/drivers/rtc/rtc-sunplus.c
@@ -269,7 +269,7 @@ static int sp_rtc_probe(struct platform_device *plat_dev)
 	if (ret)
 		goto free_reset_assert;
 
-	device_init_wakeup(&plat_dev->dev, 1);
+	device_init_wakeup(&plat_dev->dev, true);
 	dev_set_drvdata(&plat_dev->dev, sp_rtc);
 
 	sp_rtc->rtc = devm_rtc_allocate_device(&plat_dev->dev);
@@ -307,7 +307,7 @@ static void sp_rtc_remove(struct platform_device *plat_dev)
 {
 	struct sunplus_rtc *sp_rtc = dev_get_drvdata(&plat_dev->dev);
 
-	device_init_wakeup(&plat_dev->dev, 0);
+	device_init_wakeup(&plat_dev->dev, false);
 	reset_control_assert(sp_rtc->rstc);
 	clk_disable_unprepare(sp_rtc->rtcclk);
 }
diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 79a3102c8354..46788db89953 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -319,7 +319,7 @@ static int tegra_rtc_probe(struct platform_device *pdev)
 	writel(0xffffffff, info->base + TEGRA_RTC_REG_INTR_STATUS);
 	writel(0, info->base + TEGRA_RTC_REG_INTR_MASK);
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	ret = devm_request_irq(&pdev->dev, info->irq, tegra_rtc_irq_handler,
 			       IRQF_TRIGGER_HIGH, dev_name(&pdev->dev),
diff --git a/drivers/rtc/rtc-test.c b/drivers/rtc/rtc-test.c
index 7e0d8fb26465..a68b8c884102 100644
--- a/drivers/rtc/rtc-test.c
+++ b/drivers/rtc/rtc-test.c
@@ -132,7 +132,7 @@ static int test_probe(struct platform_device *plat_dev)
 		break;
 	default:
 		rtd->rtc->ops = &test_rtc_ops;
-		device_init_wakeup(&plat_dev->dev, 1);
+		device_init_wakeup(&plat_dev->dev, true);
 	}
 
 	timer_setup(&rtd->alarm, test_rtc_alarm_handler, 0);
diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
index e796729fc817..54c8429b16bf 100644
--- a/drivers/rtc/rtc-tps6586x.c
+++ b/drivers/rtc/rtc-tps6586x.c
@@ -241,7 +241,7 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	platform_set_drvdata(pdev, rtc);
 	rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
diff --git a/drivers/rtc/rtc-tps65910.c b/drivers/rtc/rtc-tps65910.c
index 2ea1bbfbbc2a..284aa2f0392b 100644
--- a/drivers/rtc/rtc-tps65910.c
+++ b/drivers/rtc/rtc-tps65910.c
@@ -418,7 +418,7 @@ static int tps65910_rtc_probe(struct platform_device *pdev)
 	tps_rtc->irq = irq;
 	if (irq != -1) {
 		if (device_property_present(tps65910->dev, "wakeup-source"))
-			device_init_wakeup(&pdev->dev, 1);
+			device_init_wakeup(&pdev->dev, true);
 		else
 			device_set_wakeup_capable(&pdev->dev, 1);
 	} else {
diff --git a/drivers/rtc/rtc-twl.c b/drivers/rtc/rtc-twl.c
index 794429182b34..e6106e67e1f4 100644
--- a/drivers/rtc/rtc-twl.c
+++ b/drivers/rtc/rtc-twl.c
@@ -572,7 +572,7 @@ static int twl_rtc_probe(struct platform_device *pdev)
 		return ret;
 
 	platform_set_drvdata(pdev, twl_rtc);
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	twl_rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
 					&twl_rtc_ops, THIS_MODULE);
diff --git a/drivers/rtc/rtc-wm831x.c b/drivers/rtc/rtc-wm831x.c
index 640833e21057..218316be942a 100644
--- a/drivers/rtc/rtc-wm831x.c
+++ b/drivers/rtc/rtc-wm831x.c
@@ -420,7 +420,7 @@ static int wm831x_rtc_probe(struct platform_device *pdev)
 	if (ret & WM831X_RTC_ALM_ENA)
 		wm831x_rtc->alarm_enabled = 1;
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	wm831x_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(wm831x_rtc->rtc))
diff --git a/drivers/rtc/rtc-wm8350.c b/drivers/rtc/rtc-wm8350.c
index 6797eb4d2e49..3bd60d067a5e 100644
--- a/drivers/rtc/rtc-wm8350.c
+++ b/drivers/rtc/rtc-wm8350.c
@@ -420,7 +420,7 @@ static int wm8350_rtc_probe(struct platform_device *pdev)
 		}
 	}
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	wm_rtc->rtc = devm_rtc_device_register(&pdev->dev, "wm8350",
 					&wm8350_rtc_ops, THIS_MODULE);
diff --git a/drivers/rtc/rtc-xgene.c b/drivers/rtc/rtc-xgene.c
index 0813ea1a03c2..6660b664e8dd 100644
--- a/drivers/rtc/rtc-xgene.c
+++ b/drivers/rtc/rtc-xgene.c
@@ -174,7 +174,7 @@ static int xgene_rtc_probe(struct platform_device *pdev)
 	/* Turn on the clock and the crystal */
 	writel(RTC_CCR_EN, pdata->csr_base + RTC_CCR);
 
-	ret = device_init_wakeup(&pdev->dev, 1);
+	ret = device_init_wakeup(&pdev->dev, true);
 	if (ret) {
 		clk_disable_unprepare(pdata->clk);
 		return ret;
@@ -197,7 +197,7 @@ static void xgene_rtc_remove(struct platform_device *pdev)
 	struct xgene_rtc_dev *pdata = platform_get_drvdata(pdev);
 
 	xgene_rtc_alarm_irq_enable(&pdev->dev, 0);
-	device_init_wakeup(&pdev->dev, 0);
+	device_init_wakeup(&pdev->dev, false);
 	clk_disable_unprepare(pdata->clk);
 }
 
diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index af1abb69d1e3..625f708a7caf 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -337,7 +337,7 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 
 	xlnx_init_rtc(xrtcdev);
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(&pdev->dev, true);
 
 	return devm_rtc_register_device(xrtcdev->rtc);
 }
@@ -345,7 +345,7 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 static void xlnx_rtc_remove(struct platform_device *pdev)
 {
 	xlnx_rtc_alarm_irq_enable(&pdev->dev, 0);
-	device_init_wakeup(&pdev->dev, 0);
+	device_init_wakeup(&pdev->dev, false);
 }
 
 static int __maybe_unused xlnx_rtc_suspend(struct device *dev)
-- 
2.45.2


