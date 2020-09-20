Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B421427136B
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 13:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgITLJz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 07:09:55 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:53276 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgITLJv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Sep 2020 07:09:51 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id A0F21803073C;
        Sun, 20 Sep 2020 11:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id JKIOTng_EiOp; Sun, 20 Sep 2020 14:09:48 +0300 (MSK)
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
Subject: [PATCH 3/3] hwmon: bt1-pvt: Wait for the completion with timeout
Date:   Sun, 20 Sep 2020 14:09:23 +0300
Message-ID: <20200920110924.19741-4-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200920110924.19741-1-Sergey.Semin@baikalelectronics.ru>
References: <20200920110924.19741-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If the PVT sensor is suddenly powered down while a caller is waiting for
the conversion completion, the request won't be finished and the task will
hang up on this procedure until the power is back up again. Let's call the
wait_for_completion_timeout() method instead to prevent that. The cached
timeout is exactly what we need to predict for how long conversion could
normally last.

Fixes: 87976ce2825d ("hwmon: Add Baikal-T1 PVT sensor driver")
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 drivers/hwmon/bt1-pvt.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/bt1-pvt.c b/drivers/hwmon/bt1-pvt.c
index 2600426a3b21..3e1d56585b91 100644
--- a/drivers/hwmon/bt1-pvt.c
+++ b/drivers/hwmon/bt1-pvt.c
@@ -477,6 +477,7 @@ static int pvt_read_data(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
 			 long *val)
 {
 	struct pvt_cache *cache = &pvt->cache[type];
+	unsigned long timeout;
 	u32 data;
 	int ret;
 
@@ -500,7 +501,14 @@ static int pvt_read_data(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
 	pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_DVALID, 0);
 	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, PVT_CTRL_EN);
 
-	wait_for_completion(&cache->conversion);
+	/*
+	 * Wait with timeout since in case if the sensor is suddenly powered
+	 * down the request won't be completed and the caller will hang up on
+	 * this procedure until the power is back up again. Multiply the
+	 * timeout by the factor of two to prevent a false timeout.
+	 */
+	timeout = 2 * usecs_to_jiffies(ktime_to_us(pvt->timeout));
+	ret = wait_for_completion_timeout(&cache->conversion, timeout);
 
 	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, 0);
 	pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_DVALID,
@@ -510,6 +518,9 @@ static int pvt_read_data(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
 
 	mutex_unlock(&pvt->iface_mtx);
 
+	if (!ret)
+		return -ETIMEDOUT;
+
 	if (type == PVT_TEMP)
 		*val = pvt_calc_poly(&poly_N_to_temp, data);
 	else
-- 
2.27.0

