Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3459A27136D
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 13:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgITLJu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 07:09:50 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:53248 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITLJt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Sep 2020 07:09:49 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 361978030833;
        Sun, 20 Sep 2020 11:09:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7sL0JnpcuwWw; Sun, 20 Sep 2020 14:09:46 +0300 (MSK)
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
Subject: [PATCH 1/3] hwmon: bt1-pvt: Test sensor power supply on probe
Date:   Sun, 20 Sep 2020 14:09:21 +0300
Message-ID: <20200920110924.19741-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200920110924.19741-1-Sergey.Semin@baikalelectronics.ru>
References: <20200920110924.19741-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Baikal-T1 PVT sensor has got a dedicated power supply domain (feed up by
the external GPVT/VPVT_18 pins). In case if it isn't powered up, the
registers will be accessible, but the sensor conversion just won't happen.
Due to that an attempt to read data from any PVT sensor will cause the
task hanging up.  For instance that will happen if XP11 jumper isn't
installed on the Baikal-T1-based BFK3.1 board. Let's at least test whether
the conversion work on the device probe procedure. By doing so will make
sure that the PVT sensor is powered up at least at boot time.

Fixes: 87976ce2825d ("hwmon: Add Baikal-T1 PVT sensor driver")
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 drivers/hwmon/bt1-pvt.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/hwmon/bt1-pvt.c b/drivers/hwmon/bt1-pvt.c
index 94698cae0497..f4b7353c078a 100644
--- a/drivers/hwmon/bt1-pvt.c
+++ b/drivers/hwmon/bt1-pvt.c
@@ -13,6 +13,7 @@
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/hwmon.h>
@@ -982,6 +983,41 @@ static int pvt_request_clks(struct pvt_hwmon *pvt)
 	return 0;
 }
 
+static int pvt_check_pwr(struct pvt_hwmon *pvt)
+{
+	unsigned long tout;
+	int ret = 0;
+	u32 data;
+
+	/*
+	 * Test out the sensor conversion functionality. If it is not done on
+	 * time then the domain must have been unpowered and we won't be able
+	 * to use the device later in this driver.
+	 * Note If the power source is lost during the normal driver work the
+	 * data read procedure will either return -ETIMEDOUT (for the
+	 * alarm-less driver configuration) or just stop the repeated
+	 * conversion. In the later case alas we won't be able to detect the
+	 * problem.
+	 */
+	pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_ALL, PVT_INTR_ALL);
+	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, PVT_CTRL_EN);
+	pvt_set_tout(pvt, 0);
+	readl(pvt->regs + PVT_DATA);
+
+	tout = PVT_TOUT_MIN / NSEC_PER_USEC;
+	usleep_range(tout, 2 * tout);
+
+	data = readl(pvt->regs + PVT_DATA);
+	if (!(data & PVT_DATA_VALID)) {
+		ret = -ENODEV;
+		dev_err(pvt->dev, "Sensor is powered down\n");
+	}
+
+	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, 0);
+
+	return ret;
+}
+
 static void pvt_init_iface(struct pvt_hwmon *pvt)
 {
 	u32 trim, temp;
@@ -1109,6 +1145,10 @@ static int pvt_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = pvt_check_pwr(pvt);
+	if (ret)
+		return ret;
+
 	pvt_init_iface(pvt);
 
 	ret = pvt_request_irq(pvt);
-- 
2.27.0

