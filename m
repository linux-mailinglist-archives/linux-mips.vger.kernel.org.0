Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC85727136A
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 13:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgITLJy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 07:09:54 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:53264 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgITLJu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Sep 2020 07:09:50 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 1FC878030718;
        Sun, 20 Sep 2020 11:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id hkecACCE9xIw; Sun, 20 Sep 2020 14:09:47 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        <linux-mips@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] hwmon: bt1-pvt: Cache current update timeout
Date:   Sun, 20 Sep 2020 14:09:22 +0300
Message-ID: <20200920110924.19741-3-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200920110924.19741-1-Sergey.Semin@baikalelectronics.ru>
References: <20200920110924.19741-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Instead of converting the update timeout data to the milliseconds each
time on the read procedure let's preserve the currently set timeout in the
dedicated driver private data cache. The cached value will be then used in
the timeout read method and in the alarm-less data conversion to prevent
the caller task hanging up in case if the PVT sensor is suddenly powered
down.

Fixes: 87976ce2825d ("hwmon: Add Baikal-T1 PVT sensor driver")
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 drivers/hwmon/bt1-pvt.c | 85 ++++++++++++++++++++++-------------------
 drivers/hwmon/bt1-pvt.h |  3 ++
 2 files changed, 49 insertions(+), 39 deletions(-)

diff --git a/drivers/hwmon/bt1-pvt.c b/drivers/hwmon/bt1-pvt.c
index f4b7353c078a..2600426a3b21 100644
--- a/drivers/hwmon/bt1-pvt.c
+++ b/drivers/hwmon/bt1-pvt.c
@@ -655,44 +655,16 @@ static int pvt_write_trim(struct pvt_hwmon *pvt, long val)
 
 static int pvt_read_timeout(struct pvt_hwmon *pvt, long *val)
 {
-	unsigned long rate;
-	ktime_t kt;
-	u32 data;
-
-	rate = clk_get_rate(pvt->clks[PVT_CLOCK_REF].clk);
-	if (!rate)
-		return -ENODEV;
-
-	/*
-	 * Don't bother with mutex here, since we just read data from MMIO.
-	 * We also have to scale the ticks timeout up to compensate the
-	 * ms-ns-data translations.
-	 */
-	data = readl(pvt->regs + PVT_TTIMEOUT) + 1;
+	int ret;
 
-	/*
-	 * Calculate ref-clock based delay (Ttotal) between two consecutive
-	 * data samples of the same sensor. So we first must calculate the
-	 * delay introduced by the internal ref-clock timer (Tref * Fclk).
-	 * Then add the constant timeout cuased by each conversion latency
-	 * (Tmin). The basic formulae for each conversion is following:
-	 *   Ttotal = Tref * Fclk + Tmin
-	 * Note if alarms are enabled the sensors are polled one after
-	 * another, so in order to have the delay being applicable for each
-	 * sensor the requested value must be equally redistirbuted.
-	 */
-#if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
-	kt = ktime_set(PVT_SENSORS_NUM * (u64)data, 0);
-	kt = ktime_divns(kt, rate);
-	kt = ktime_add_ns(kt, PVT_SENSORS_NUM * PVT_TOUT_MIN);
-#else
-	kt = ktime_set(data, 0);
-	kt = ktime_divns(kt, rate);
-	kt = ktime_add_ns(kt, PVT_TOUT_MIN);
-#endif
+	ret = mutex_lock_interruptible(&pvt->iface_mtx);
+	if (ret)
+		return ret;
 
 	/* Return the result in msec as hwmon sysfs interface requires. */
-	*val = ktime_to_ms(kt);
+	*val = ktime_to_ms(pvt->timeout);
+
+	mutex_unlock(&pvt->iface_mtx);
 
 	return 0;
 }
@@ -700,7 +672,7 @@ static int pvt_read_timeout(struct pvt_hwmon *pvt, long *val)
 static int pvt_write_timeout(struct pvt_hwmon *pvt, long val)
 {
 	unsigned long rate;
-	ktime_t kt;
+	ktime_t kt, cache;
 	u32 data;
 	int ret;
 
@@ -713,7 +685,7 @@ static int pvt_write_timeout(struct pvt_hwmon *pvt, long val)
 	 * between all available sensors to have the requested delay
 	 * applicable to each individual sensor.
 	 */
-	kt = ms_to_ktime(val);
+	cache = kt = ms_to_ktime(val);
 #if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
 	kt = ktime_divns(kt, PVT_SENSORS_NUM);
 #endif
@@ -742,6 +714,7 @@ static int pvt_write_timeout(struct pvt_hwmon *pvt, long val)
 		return ret;
 
 	pvt_set_tout(pvt, data);
+	pvt->timeout = cache;
 
 	mutex_unlock(&pvt->iface_mtx);
 
@@ -1018,10 +991,17 @@ static int pvt_check_pwr(struct pvt_hwmon *pvt)
 	return ret;
 }
 
-static void pvt_init_iface(struct pvt_hwmon *pvt)
+static int pvt_init_iface(struct pvt_hwmon *pvt)
 {
+	unsigned long rate;
 	u32 trim, temp;
 
+	rate = clk_get_rate(pvt->clks[PVT_CLOCK_REF].clk);
+	if (!rate) {
+		dev_err(pvt->dev, "Invalid reference clock rate\n");
+		return -ENODEV;
+	}
+
 	/*
 	 * Make sure all interrupts and controller are disabled so not to
 	 * accidentally have ISR executed before the driver data is fully
@@ -1036,12 +1016,37 @@ static void pvt_init_iface(struct pvt_hwmon *pvt)
 	pvt_set_mode(pvt, pvt_info[pvt->sensor].mode);
 	pvt_set_tout(pvt, PVT_TOUT_DEF);
 
+	/*
+	 * Preserve the current ref-clock based delay (Ttotal) between the
+	 * sensors data samples in the driver data so not to recalculate it
+	 * each time on the data requests and timeout reads. It consists of the
+	 * delay introduced by the internal ref-clock timer (N / Fclk) and the
+	 * constant timeout caused by each conversion latency (Tmin):
+	 *   Ttotal = N / Fclk + Tmin
+	 * If alarms are enabled the sensors are polled one after another and
+	 * in order to get the next measurement of a particular sensor the
+	 * caller will have to wait for at most until all the others are
+	 * polled. In that case the formulae will look a bit different:
+	 *   Ttotal = 5 * (N / Fclk + Tmin)
+	 */
+#if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
+	pvt->timeout = ktime_set(PVT_SENSORS_NUM * PVT_TOUT_DEF, 0);
+	pvt->timeout = ktime_divns(pvt->timeout, rate);
+	pvt->timeout = ktime_add_ns(pvt->timeout, PVT_SENSORS_NUM * PVT_TOUT_MIN);
+#else
+	pvt->timeout = ktime_set(PVT_TOUT_DEF, 0);
+	pvt->timeout = ktime_divns(pvt->timeout, rate);
+	pvt->timeout = ktime_add_ns(pvt->timeout, PVT_TOUT_MIN);
+#endif
+
 	trim = PVT_TRIM_DEF;
 	if (!of_property_read_u32(pvt->dev->of_node,
 	     "baikal,pvt-temp-offset-millicelsius", &temp))
 		trim = pvt_calc_trim(temp);
 
 	pvt_set_trim(pvt, trim);
+
+	return 0;
 }
 
 static int pvt_request_irq(struct pvt_hwmon *pvt)
@@ -1149,7 +1154,9 @@ static int pvt_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	pvt_init_iface(pvt);
+	ret = pvt_init_iface(pvt);
+	if (ret)
+		return ret;
 
 	ret = pvt_request_irq(pvt);
 	if (ret)
diff --git a/drivers/hwmon/bt1-pvt.h b/drivers/hwmon/bt1-pvt.h
index 5eac73e94885..93b8dd5e7c94 100644
--- a/drivers/hwmon/bt1-pvt.h
+++ b/drivers/hwmon/bt1-pvt.h
@@ -10,6 +10,7 @@
 #include <linux/completion.h>
 #include <linux/hwmon.h>
 #include <linux/kernel.h>
+#include <linux/ktime.h>
 #include <linux/mutex.h>
 #include <linux/seqlock.h>
 
@@ -201,6 +202,7 @@ struct pvt_cache {
  *	       if alarms are disabled).
  * @sensor: current PVT sensor the data conversion is being performed for.
  * @cache: data cache descriptor.
+ * @timeout: conversion timeout cache.
  */
 struct pvt_hwmon {
 	struct device *dev;
@@ -214,6 +216,7 @@ struct pvt_hwmon {
 	struct mutex iface_mtx;
 	enum pvt_sensor_type sensor;
 	struct pvt_cache cache[PVT_SENSORS_NUM];
+	ktime_t timeout;
 };
 
 /*
-- 
2.27.0

