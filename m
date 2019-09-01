Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E943DA4A4C
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbfIAPz6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:55:58 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:42238 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfIAPz6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:55:58 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 25CB73F684
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:55:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GdxM6S8gdZkF for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:55:55 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 723A03F615
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:55:55 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:55:55 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 050/120] MIPS: PS2: Real-time clock (RTC) driver
Message-ID: <989f3074c2a336889842012bc806b967eb8ec009.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/rtc/Kconfig   | 10 ++++++
 drivers/rtc/Makefile  |  1 +
 drivers/rtc/rtc-ps2.c | 74 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 drivers/rtc/rtc-ps2.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index e72f65b61176..aaac22576a26 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1896,4 +1896,14 @@ config RTC_DRV_WILCO_EC
 	  This can also be built as a module. If so, the module will
 	  be named "rtc_wilco_ec".
 
+config RTC_DRV_PS2
+	tristate "PlayStation 2 RTC"
+	depends on SONY_PS2
+	default y
+	help
+	  Say yes here to get support for the PlayStation 2 real-time clock.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-ps2.
+
 endif # RTC_CLASS
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 6b09c21dc1b6..5bc300f1040a 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -130,6 +130,7 @@ obj-$(CONFIG_RTC_DRV_PIC32)	+= rtc-pic32.o
 obj-$(CONFIG_RTC_DRV_PL030)	+= rtc-pl030.o
 obj-$(CONFIG_RTC_DRV_PL031)	+= rtc-pl031.o
 obj-$(CONFIG_RTC_DRV_PM8XXX)	+= rtc-pm8xxx.o
+obj-$(CONFIG_RTC_DRV_PS2)	+= rtc-ps2.o
 obj-$(CONFIG_RTC_DRV_PS3)	+= rtc-ps3.o
 obj-$(CONFIG_RTC_DRV_PUV3)	+= rtc-puv3.o
 obj-$(CONFIG_RTC_DRV_PXA)	+= rtc-pxa.o
diff --git a/drivers/rtc/rtc-ps2.c b/drivers/rtc/rtc-ps2.c
new file mode 100644
index 000000000000..d0c732a052df
--- /dev/null
+++ b/drivers/rtc/rtc-ps2.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 real-time clock (RTC)
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+
+#include "asm/mach-ps2/scmd.h"
+
+#define DRVNAME "rtc-ps2"
+
+static int read_time(struct device *dev, struct rtc_time *tm)
+{
+	time64_t t;
+	int err = scmd_read_rtc(&t);
+
+	if (!err)
+		rtc_time64_to_tm(t, tm);
+
+	return err;
+}
+
+static int set_time(struct device *dev, struct rtc_time *tm)
+{
+	return scmd_set_rtc(rtc_tm_to_time64(tm));
+}
+
+static const struct rtc_class_ops ps2_rtc_ops = {
+	.read_time = read_time,
+	.set_time = set_time,
+};
+
+static int ps2_rtc_probe(struct platform_device *pdev)
+{
+	struct rtc_device *rtc;
+
+	rtc = devm_rtc_device_register(&pdev->dev,
+		DRVNAME, &ps2_rtc_ops, THIS_MODULE);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
+
+	rtc->uie_unsupported = 1;
+
+	return 0;
+}
+
+static struct platform_driver ps2_rtc_driver = {
+	.probe = ps2_rtc_probe,
+	.driver = {
+		.name = DRVNAME,
+	},
+};
+
+static int __init ps2_rtc_init(void)
+{
+	return platform_driver_register(&ps2_rtc_driver);
+}
+
+static void __exit ps2_rtc_exit(void)
+{
+	platform_driver_unregister(&ps2_rtc_driver);
+}
+
+module_init(ps2_rtc_init);
+module_exit(ps2_rtc_exit);
+
+MODULE_DESCRIPTION("PlayStation 2 real-time clock (RTC)");
+MODULE_AUTHOR("Fredrik Noring");
+MODULE_LICENSE("GPL");
-- 
2.21.0

