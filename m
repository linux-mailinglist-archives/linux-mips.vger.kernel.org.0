Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE531B0D1A
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 15:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728437AbgDTNqY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 09:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725944AbgDTNqY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 09:46:24 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F50C061A0C;
        Mon, 20 Apr 2020 06:46:24 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 0CFF820CD8;
        Mon, 20 Apr 2020 13:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587390382; bh=pAU0GQtIe9CHI3zEvVQ1okUdMcuIoJdTgDyCDw9GKa0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hicy5CuBUVkL+GjmHHgahKbGXfIOV7xU5qO9uM1DXePwmgRRE+Qc080dMhME8SrEl
         ix8+eCtdGMwxqHABdEky2mXP0tgimZmn1VF/tEUlfTx/3c3XePU9wQG0w+NqWioJyE
         2a43/4letXnP+yNs6W1ZyeT0U5FJQj9N1uUjqJniFGsaYKTsMGeFtQYalQoGI+zlOk
         eLD49M4zm/+ePKfoIXU7uBs4JCLyXYS9gugchvCOBzWMDIdBVHJnvxUSykZiYH32+M
         PhnIHd0pC7tOy20W2ru/Cn65pcWSyG931fnjQ5o933wzA70rQtsqU0Pa5r7dCvFk4J
         OoiGIp/R11hVQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] MIPS: Loongson64: Remove dead RTC code
Date:   Mon, 20 Apr 2020 21:45:25 +0800
Message-Id: <20200420134536.210475-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200420073347.157230-1-jiaxun.yang@flygoat.com>
References: <20200420073347.157230-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

RTC is now enabled by devicetree. So platform code is
no longer needed.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Rebase to mips-next
---
 .../include/asm/mach-loongson64/mc146818rtc.h | 36 -----------------
 arch/mips/loongson64/Kconfig                  |  4 --
 arch/mips/loongson64/Makefile                 |  1 -
 arch/mips/loongson64/rtc.c                    | 39 -------------------
 arch/mips/loongson64/time.c                   |  8 +---
 5 files changed, 1 insertion(+), 87 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-loongson64/mc146818rtc.h
 delete mode 100644 arch/mips/loongson64/rtc.c

diff --git a/arch/mips/include/asm/mach-loongson64/mc146818rtc.h b/arch/mips/include/asm/mach-loongson64/mc146818rtc.h
deleted file mode 100644
index ebdccfee50be..000000000000
--- a/arch/mips/include/asm/mach-loongson64/mc146818rtc.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 1998, 2001, 03, 07 by Ralf Baechle (ralf@linux-mips.org)
- *
- * RTC routines for PC style attached Dallas chip.
- */
-#ifndef __ASM_MACH_LOONGSON64_MC146818RTC_H
-#define __ASM_MACH_LOONGSON64_MC146818RTC_H
-
-#include <linux/io.h>
-
-#define RTC_PORT(x)	(0x70 + (x))
-#define RTC_IRQ		8
-
-static inline unsigned char CMOS_READ(unsigned long addr)
-{
-	outb_p(addr, RTC_PORT(0));
-	return inb_p(RTC_PORT(1));
-}
-
-static inline void CMOS_WRITE(unsigned char data, unsigned long addr)
-{
-	outb_p(addr, RTC_PORT(0));
-	outb_p(data, RTC_PORT(1));
-}
-
-#define RTC_ALWAYS_BCD	0
-
-#ifndef mc146818_decode_year
-#define mc146818_decode_year(year) ((year) < 70 ? (year) + 2000 : (year) + 1970)
-#endif
-
-#endif /* __ASM_MACH_LOONGSON64_MC146818RTC_H */
diff --git a/arch/mips/loongson64/Kconfig b/arch/mips/loongson64/Kconfig
index 48b29c198acf..c386b8a3c753 100644
--- a/arch/mips/loongson64/Kconfig
+++ b/arch/mips/loongson64/Kconfig
@@ -14,8 +14,4 @@ config RS780_HPET
 	  If unsure, say Yes.
 
 
-config LOONGSON_MC146818
-	bool
-	default n
-
 endif # MACH_LOONGSON64
diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
index b7f40b179c71..32b8c224852f 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson64/Makefile
@@ -9,5 +9,4 @@ obj-$(CONFIG_SMP)	+= smp.o
 obj-$(CONFIG_NUMA)	+= numa.o
 obj-$(CONFIG_RS780_HPET) += hpet.o
 obj-$(CONFIG_PCI) += pci.o
-obj-$(CONFIG_LOONGSON_MC146818) += rtc.o
 obj-$(CONFIG_SUSPEND) += pm.o
diff --git a/arch/mips/loongson64/rtc.c b/arch/mips/loongson64/rtc.c
deleted file mode 100644
index 8d7628c0f513..000000000000
--- a/arch/mips/loongson64/rtc.c
+++ /dev/null
@@ -1,39 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Lemote Fuloong platform support
- *
- *  Copyright(c) 2010 Arnaud Patard <apatard@mandriva.com>
- */
-
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/platform_device.h>
-#include <linux/mc146818rtc.h>
-
-static struct resource loongson_rtc_resources[] = {
-	{
-		.start	= RTC_PORT(0),
-		.end	= RTC_PORT(1),
-		.flags	= IORESOURCE_IO,
-	}, {
-		.start	= RTC_IRQ,
-		.end	= RTC_IRQ,
-		.flags	= IORESOURCE_IRQ,
-	}
-};
-
-static struct platform_device loongson_rtc_device = {
-	.name		= "rtc_cmos",
-	.id		= -1,
-	.resource	= loongson_rtc_resources,
-	.num_resources	= ARRAY_SIZE(loongson_rtc_resources),
-};
-
-
-static int __init loongson_rtc_platform_init(void)
-{
-	platform_device_register(&loongson_rtc_device);
-	return 0;
-}
-
-device_initcall(loongson_rtc_platform_init);
diff --git a/arch/mips/loongson64/time.c b/arch/mips/loongson64/time.c
index 1245f22cec84..91e842b58365 100644
--- a/arch/mips/loongson64/time.c
+++ b/arch/mips/loongson64/time.c
@@ -6,7 +6,7 @@
  * Copyright (C) 2009 Lemote Inc.
  * Author: Wu Zhangjin, wuzhangjin@gmail.com
  */
-#include <asm/mc146818-time.h>
+
 #include <asm/time.h>
 #include <asm/hpet.h>
 
@@ -21,9 +21,3 @@ void __init plat_time_init(void)
 	setup_hpet_timer();
 #endif
 }
-
-void read_persistent_clock64(struct timespec64 *ts)
-{
-	ts->tv_sec = mc146818_get_cmos_time();
-	ts->tv_nsec = 0;
-}
-- 
2.26.0.rc2

