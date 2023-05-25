Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A85F710C83
	for <lists+linux-mips@lfdr.de>; Thu, 25 May 2023 14:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240404AbjEYM4b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 May 2023 08:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241035AbjEYM43 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 May 2023 08:56:29 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DF632197;
        Thu, 25 May 2023 05:55:57 -0700 (PDT)
Received: from loongson.cn (unknown [223.106.25.146])
        by gateway (Coremail) with SMTP id _____8Cx5fDLWm9kYf8AAA--.2532S3;
        Thu, 25 May 2023 20:55:39 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxFLXFWm9kdYR3AA--.1778S4;
        Thu, 25 May 2023 20:55:38 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        loongson-kernel@lists.loongnix.cn,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V4 2/5] rtc: Remove the Loongson-1 RTC driver
Date:   Thu, 25 May 2023 20:55:24 +0800
Message-Id: <98fc717871d3a39b18ad1a26780d0d2cf1fa0896.1684983279.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1684983279.git.zhoubinbin@loongson.cn>
References: <cover.1684983279.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxFLXFWm9kdYR3AA--.1778S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxuFW3uFy7Jw1DAw1rJw1fWFg_yoW3XFWfpF
        4ayayfJr1UJF4Y93s2yF98Kay3Kw47JryUKFs8Cw429F10y3Wrtrnag3yrtr1rZ3ykZrWI
        qrn5W3WSgFW5C37anT9S1TB71UUUUbUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
        e7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
        0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280
        aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4
        kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
        1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
        Wlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj
        6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr
        0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
        cSsGvfC2KfnxnUUI43ZEXa7IU8XTm3UUUUU==
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

