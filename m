Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D19E819BFAD
	for <lists+linux-mips@lfdr.de>; Thu,  2 Apr 2020 12:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388035AbgDBKvf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Apr 2020 06:51:35 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17854 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728612AbgDBKvf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Apr 2020 06:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585824653;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=V1naS5Jb3/T3bL/D1LVRUiDK4v8P1YPjYMYwaqddEmE=;
        b=T9aWlCUeCQDUa48ENhkUDlpY03v5VQKgzVq6ipYLhFPZYxhPnzKJm2m14wZeC5VT
        0kV/AuX6Dfgf2EZ9NvwaXM/ydyA5CADR1dxjeHeiDhFfEvVDm9t8sEo5uYlLZG4yXSz
        yBiAOixfjRy+mnQ0rxVyx49OPqJkinmKw3f9uAXQ=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585824651402683.1521658948714; Thu, 2 Apr 2020 18:50:51 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-ID: <20200402104851.368465-1-jiaxun.yang@flygoat.com>
Subject: [PATCH 1/5] MIPS: Loongson64: Remove dead RTC code
Date:   Thu,  2 Apr 2020 18:48:39 +0800
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

RTC is now enabled by devicetree. So platform code is
no longer needed.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../include/asm/mach-loongson64/mc146818rtc.h | 36 -----------------
 arch/mips/loongson64/Kconfig                  |  4 --
 arch/mips/loongson64/Makefile                 |  1 -
 arch/mips/loongson64/rtc.c                    | 39 -------------------
 arch/mips/loongson64/time.c                   |  8 +---
 5 files changed, 1 insertion(+), 87 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-loongson64/mc146818rtc.h
 delete mode 100644 arch/mips/loongson64/rtc.c

diff --git a/arch/mips/include/asm/mach-loongson64/mc146818rtc.h b/arch/mip=
s/include/asm/mach-loongson64/mc146818rtc.h
deleted file mode 100644
index ebdccfee50be..000000000000
--- a/arch/mips/include/asm/mach-loongson64/mc146818rtc.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Pub=
lic
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
-#define RTC_PORT(x)=09(0x70 + (x))
-#define RTC_IRQ=09=098
-
-static inline unsigned char CMOS_READ(unsigned long addr)
-{
-=09outb_p(addr, RTC_PORT(0));
-=09return inb_p(RTC_PORT(1));
-}
-
-static inline void CMOS_WRITE(unsigned char data, unsigned long addr)
-{
-=09outb_p(addr, RTC_PORT(0));
-=09outb_p(data, RTC_PORT(1));
-}
-
-#define RTC_ALWAYS_BCD=090
-
-#ifndef mc146818_decode_year
-#define mc146818_decode_year(year) ((year) < 70 ? (year) + 2000 : (year) +=
 1970)
-#endif
-
-#endif /* __ASM_MACH_LOONGSON64_MC146818RTC_H */
diff --git a/arch/mips/loongson64/Kconfig b/arch/mips/loongson64/Kconfig
index 48b29c198acf..c386b8a3c753 100644
--- a/arch/mips/loongson64/Kconfig
+++ b/arch/mips/loongson64/Kconfig
@@ -14,8 +14,4 @@ config RS780_HPET
 =09  If unsure, say Yes.
=20
=20
-config LOONGSON_MC146818
-=09bool
-=09default n
-
 endif # MACH_LOONGSON64
diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
index f04461839540..102a19aa92aa 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson64/Makefile
@@ -8,6 +8,5 @@ obj-$(CONFIG_MACH_LOONGSON64) +=3D cop2-ex.o platform.o acp=
i_init.o dma.o \
 obj-$(CONFIG_SMP)=09+=3D smp.o
 obj-$(CONFIG_NUMA)=09+=3D numa.o
 obj-$(CONFIG_RS780_HPET) +=3D hpet.o
-obj-$(CONFIG_LOONGSON_MC146818) +=3D rtc.o
 obj-$(CONFIG_SUSPEND) +=3D pm.o
 obj-$(CONFIG_PCI_QUIRKS) +=3D vbios_quirk.o
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
-static struct resource loongson_rtc_resources[] =3D {
-=09{
-=09=09.start=09=3D RTC_PORT(0),
-=09=09.end=09=3D RTC_PORT(1),
-=09=09.flags=09=3D IORESOURCE_IO,
-=09}, {
-=09=09.start=09=3D RTC_IRQ,
-=09=09.end=09=3D RTC_IRQ,
-=09=09.flags=09=3D IORESOURCE_IRQ,
-=09}
-};
-
-static struct platform_device loongson_rtc_device =3D {
-=09.name=09=09=3D "rtc_cmos",
-=09.id=09=09=3D -1,
-=09.resource=09=3D loongson_rtc_resources,
-=09.num_resources=09=3D ARRAY_SIZE(loongson_rtc_resources),
-};
-
-
-static int __init loongson_rtc_platform_init(void)
-{
-=09platform_device_register(&loongson_rtc_device);
-=09return 0;
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
=20
@@ -21,9 +21,3 @@ void __init plat_time_init(void)
 =09setup_hpet_timer();
 #endif
 }
-
-void read_persistent_clock64(struct timespec64 *ts)
-{
-=09ts->tv_sec =3D mc146818_get_cmos_time();
-=09ts->tv_nsec =3D 0;
-}
--=20
2.26.0.rc2


