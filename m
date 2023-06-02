Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07D6E71FE47
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jun 2023 11:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234713AbjFBJus (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jun 2023 05:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234752AbjFBJur (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Jun 2023 05:50:47 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 39B04180;
        Fri,  2 Jun 2023 02:50:42 -0700 (PDT)
Received: from loongson.cn (unknown [223.106.25.146])
        by gateway (Coremail) with SMTP id _____8CxZ_Fwu3lk_pYDAA--.7906S3;
        Fri, 02 Jun 2023 17:50:40 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_7Nqu3lkzrqFAA--.20150S4;
        Fri, 02 Jun 2023 17:50:39 +0800 (CST)
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
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V5 2/5] rtc: Remove the Loongson-1 RTC driver
Date:   Fri,  2 Jun 2023 17:50:21 +0800
Message-Id: <c38c666015a162d7031b20a48209ce577bab62cd.1685693501.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1685693501.git.zhoubinbin@loongson.cn>
References: <cover.1685693501.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx_7Nqu3lkzrqFAA--.20150S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxuFW3uFy7Jw1DAw1rJw1fWFg_yoW3XFWfpF
        4ayayfJr1UJF4Y93s2yF98Kay3Kw47JryUKFs8Cw429F10y3Wrtrnag3yrtr1rZ3ykZrWI
        qrn5W3WSgFW5C37anT9S1TB71UUUUbUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
        n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
        87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxV
        Aaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxY
        O2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
        WUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
        Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
        WUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
        JbIYCTnIWIevJa73UjIFyTuYvjxU4YLvDUUUU
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove the ls1x-rtc driver as it is obsolete. We will continue to
support the ls1x RTC in the upcoming Loongson unified RTC driver
rtc-loongson.

Cc: Keguang Zhang <keguang.zhang@gmail.com>
Cc: zhao zhang <zhzhl555@gmail.com>
Cc: Yang Ling <gnaygnil@gmail.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/rtc/Kconfig    |  10 ---
 drivers/rtc/Makefile   |   1 -
 drivers/rtc/rtc-ls1x.c | 192 -----------------------------------------
 3 files changed, 203 deletions(-)
 delete mode 100644 drivers/rtc/rtc-ls1x.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 753872408615..599f5110a251 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1726,16 +1726,6 @@ config RTC_DRV_TEGRA
 	  This drive can also be built as a module. If so, the module
 	  will be called rtc-tegra.
 
-config RTC_DRV_LOONGSON1
-	tristate "loongson1 RTC support"
-	depends on MACH_LOONGSON32
-	help
-	  This is a driver for the loongson1 on-chip Counter0 (Time-Of-Year
-	  counter) to be used as a RTC.
-
-	  This driver can also be built as a module. If so, the module
-	  will be called rtc-ls1x.
-
 config RTC_DRV_MXC
 	tristate "Freescale MXC Real Time Clock"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index ea445d1ebb17..c50afd8fb9f4 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -78,7 +78,6 @@ obj-$(CONFIG_RTC_DRV_ISL12022)	+= rtc-isl12022.o
 obj-$(CONFIG_RTC_DRV_ISL12026)	+= rtc-isl12026.o
 obj-$(CONFIG_RTC_DRV_ISL1208)	+= rtc-isl1208.o
 obj-$(CONFIG_RTC_DRV_JZ4740)	+= rtc-jz4740.o
-obj-$(CONFIG_RTC_DRV_LOONGSON1)	+= rtc-ls1x.o
 obj-$(CONFIG_RTC_DRV_LP8788)	+= rtc-lp8788.o
 obj-$(CONFIG_RTC_DRV_LPC24XX)	+= rtc-lpc24xx.o
 obj-$(CONFIG_RTC_DRV_LPC32XX)	+= rtc-lpc32xx.o
diff --git a/drivers/rtc/rtc-ls1x.c b/drivers/rtc/rtc-ls1x.c
deleted file mode 100644
index 5af26dc5c2a3..000000000000
--- a/drivers/rtc/rtc-ls1x.c
+++ /dev/null
@@ -1,192 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (c) 2011 Zhao Zhang <zhzhl555@gmail.com>
- *
- * Derived from driver/rtc/rtc-au1xxx.c
- */
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/rtc.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/delay.h>
-#include <linux/types.h>
-#include <linux/io.h>
-#include <loongson1.h>
-
-#define LS1X_RTC_REG_OFFSET	(LS1X_RTC_BASE + 0x20)
-#define LS1X_RTC_REGS(x) \
-		((void __iomem *)KSEG1ADDR(LS1X_RTC_REG_OFFSET + (x)))
-
-/*RTC programmable counters 0 and 1*/
-#define SYS_COUNTER_CNTRL		(LS1X_RTC_REGS(0x20))
-#define SYS_CNTRL_ERS			(1 << 23)
-#define SYS_CNTRL_RTS			(1 << 20)
-#define SYS_CNTRL_RM2			(1 << 19)
-#define SYS_CNTRL_RM1			(1 << 18)
-#define SYS_CNTRL_RM0			(1 << 17)
-#define SYS_CNTRL_RS			(1 << 16)
-#define SYS_CNTRL_BP			(1 << 14)
-#define SYS_CNTRL_REN			(1 << 13)
-#define SYS_CNTRL_BRT			(1 << 12)
-#define SYS_CNTRL_TEN			(1 << 11)
-#define SYS_CNTRL_BTT			(1 << 10)
-#define SYS_CNTRL_E0			(1 << 8)
-#define SYS_CNTRL_ETS			(1 << 7)
-#define SYS_CNTRL_32S			(1 << 5)
-#define SYS_CNTRL_TTS			(1 << 4)
-#define SYS_CNTRL_TM2			(1 << 3)
-#define SYS_CNTRL_TM1			(1 << 2)
-#define SYS_CNTRL_TM0			(1 << 1)
-#define SYS_CNTRL_TS			(1 << 0)
-
-/* Programmable Counter 0 Registers */
-#define SYS_TOYTRIM		(LS1X_RTC_REGS(0))
-#define SYS_TOYWRITE0		(LS1X_RTC_REGS(4))
-#define SYS_TOYWRITE1		(LS1X_RTC_REGS(8))
-#define SYS_TOYREAD0		(LS1X_RTC_REGS(0xC))
-#define SYS_TOYREAD1		(LS1X_RTC_REGS(0x10))
-#define SYS_TOYMATCH0		(LS1X_RTC_REGS(0x14))
-#define SYS_TOYMATCH1		(LS1X_RTC_REGS(0x18))
-#define SYS_TOYMATCH2		(LS1X_RTC_REGS(0x1C))
-
-/* Programmable Counter 1 Registers */
-#define SYS_RTCTRIM		(LS1X_RTC_REGS(0x40))
-#define SYS_RTCWRITE0		(LS1X_RTC_REGS(0x44))
-#define SYS_RTCREAD0		(LS1X_RTC_REGS(0x48))
-#define SYS_RTCMATCH0		(LS1X_RTC_REGS(0x4C))
-#define SYS_RTCMATCH1		(LS1X_RTC_REGS(0x50))
-#define SYS_RTCMATCH2		(LS1X_RTC_REGS(0x54))
-
-#define LS1X_SEC_OFFSET		(4)
-#define LS1X_MIN_OFFSET		(10)
-#define LS1X_HOUR_OFFSET	(16)
-#define LS1X_DAY_OFFSET		(21)
-#define LS1X_MONTH_OFFSET	(26)
-
-
-#define LS1X_SEC_MASK		(0x3f)
-#define LS1X_MIN_MASK		(0x3f)
-#define LS1X_HOUR_MASK		(0x1f)
-#define LS1X_DAY_MASK		(0x1f)
-#define LS1X_MONTH_MASK		(0x3f)
-#define LS1X_YEAR_MASK		(0xffffffff)
-
-#define ls1x_get_sec(t)		(((t) >> LS1X_SEC_OFFSET) & LS1X_SEC_MASK)
-#define ls1x_get_min(t)		(((t) >> LS1X_MIN_OFFSET) & LS1X_MIN_MASK)
-#define ls1x_get_hour(t)	(((t) >> LS1X_HOUR_OFFSET) & LS1X_HOUR_MASK)
-#define ls1x_get_day(t)		(((t) >> LS1X_DAY_OFFSET) & LS1X_DAY_MASK)
-#define ls1x_get_month(t)	(((t) >> LS1X_MONTH_OFFSET) & LS1X_MONTH_MASK)
-
-#define RTC_CNTR_OK (SYS_CNTRL_E0 | SYS_CNTRL_32S)
-
-static int ls1x_rtc_read_time(struct device *dev, struct rtc_time *rtm)
-{
-	unsigned long v;
-	time64_t t;
-
-	v = readl(SYS_TOYREAD0);
-	t = readl(SYS_TOYREAD1);
-
-	memset(rtm, 0, sizeof(struct rtc_time));
-	t  = mktime64((t & LS1X_YEAR_MASK), ls1x_get_month(v),
-			ls1x_get_day(v), ls1x_get_hour(v),
-			ls1x_get_min(v), ls1x_get_sec(v));
-	rtc_time64_to_tm(t, rtm);
-
-	return 0;
-}
-
-static int ls1x_rtc_set_time(struct device *dev, struct  rtc_time *rtm)
-{
-	unsigned long v, t, c;
-	int ret = -ETIMEDOUT;
-
-	v = ((rtm->tm_mon + 1)  << LS1X_MONTH_OFFSET)
-		| (rtm->tm_mday << LS1X_DAY_OFFSET)
-		| (rtm->tm_hour << LS1X_HOUR_OFFSET)
-		| (rtm->tm_min  << LS1X_MIN_OFFSET)
-		| (rtm->tm_sec  << LS1X_SEC_OFFSET);
-
-	writel(v, SYS_TOYWRITE0);
-	c = 0x10000;
-	/* add timeout check counter, for more safe */
-	while ((readl(SYS_COUNTER_CNTRL) & SYS_CNTRL_TS) && --c)
-		usleep_range(1000, 3000);
-
-	if (!c) {
-		dev_err(dev, "set time timeout!\n");
-		goto err;
-	}
-
-	t = rtm->tm_year + 1900;
-	writel(t, SYS_TOYWRITE1);
-	c = 0x10000;
-	while ((readl(SYS_COUNTER_CNTRL) & SYS_CNTRL_TS) && --c)
-		usleep_range(1000, 3000);
-
-	if (!c) {
-		dev_err(dev, "set time timeout!\n");
-		goto err;
-	}
-	return 0;
-err:
-	return ret;
-}
-
-static const struct rtc_class_ops  ls1x_rtc_ops = {
-	.read_time	= ls1x_rtc_read_time,
-	.set_time	= ls1x_rtc_set_time,
-};
-
-static int ls1x_rtc_probe(struct platform_device *pdev)
-{
-	struct rtc_device *rtcdev;
-	unsigned long v;
-
-	v = readl(SYS_COUNTER_CNTRL);
-	if (!(v & RTC_CNTR_OK)) {
-		dev_err(&pdev->dev, "rtc counters not working\n");
-		return -ENODEV;
-	}
-
-	/* set to 1 HZ if needed */
-	if (readl(SYS_TOYTRIM) != 32767) {
-		v = 0x100000;
-		while ((readl(SYS_COUNTER_CNTRL) & SYS_CNTRL_TTS) && --v)
-			usleep_range(1000, 3000);
-
-		if (!v) {
-			dev_err(&pdev->dev, "time out\n");
-			return -ETIMEDOUT;
-		}
-		writel(32767, SYS_TOYTRIM);
-	}
-	/* this loop coundn't be endless */
-	while (readl(SYS_COUNTER_CNTRL) & SYS_CNTRL_TTS)
-		usleep_range(1000, 3000);
-
-	rtcdev = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(rtcdev))
-		return PTR_ERR(rtcdev);
-
-	platform_set_drvdata(pdev, rtcdev);
-	rtcdev->ops = &ls1x_rtc_ops;
-	rtcdev->range_min = RTC_TIMESTAMP_BEGIN_1900;
-	rtcdev->range_max = RTC_TIMESTAMP_END_2099;
-
-	return devm_rtc_register_device(rtcdev);
-}
-
-static struct platform_driver  ls1x_rtc_driver = {
-	.driver		= {
-		.name	= "ls1x-rtc",
-	},
-	.probe		= ls1x_rtc_probe,
-};
-
-module_platform_driver(ls1x_rtc_driver);
-
-MODULE_AUTHOR("zhao zhang <zhzhl555@gmail.com>");
-MODULE_LICENSE("GPL");
-- 
2.39.1

