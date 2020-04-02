Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CAF019BFAA
	for <lists+linux-mips@lfdr.de>; Thu,  2 Apr 2020 12:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387592AbgDBKv2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Apr 2020 06:51:28 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17891 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728803AbgDBKv1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Apr 2020 06:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585824661;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=Uv8IsR0F46zX3A7jJV0gI5cBZUPOu2DYARIA6xMKEbk=;
        b=Qjd6J3vxjTXnGeDQOfOvH12N198djOMVw538KYs7q2nUuN94ZjOtnHNCYq+RiZYQ
        waOW6XvukOvZocLOpkMzbxOb4VaTT1t4fRAuA1ijQZkZG6rvThQQ6urI9W/QW9baBlr
        Yh2xmv80w9C7tY5c+OXsiRJPblvKZu9Wn6f9Waqg=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585824659615842.3791555827346; Thu, 2 Apr 2020 18:50:59 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-ID: <20200402104851.368465-2-jiaxun.yang@flygoat.com>
Subject: [PATCH 2/5] MIPS: Loongson64: Make RS780E ACPI as a platform driver
Date:   Thu,  2 Apr 2020 18:48:40 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200402104851.368465-1-jiaxun.yang@flygoat.com>
References: <20200402104851.368465-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Make RS780E ACPI as a platform driver so we can enable it
by DeviceTree selectively.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/Makefile                 |  2 +-
 drivers/platform/mips/Kconfig                 |  6 ++
 drivers/platform/mips/Makefile                |  1 +
 .../platform/mips/rs780e-acpi.c               | 58 ++++++++++++-------
 4 files changed, 46 insertions(+), 21 deletions(-)
 rename arch/mips/loongson64/acpi_init.c =3D> drivers/platform/mips/rs780e-=
acpi.c (70%)

diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
index 102a19aa92aa..6f81b822aeae 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson64/Makefile
@@ -2,7 +2,7 @@
 #
 # Makefile for Loongson-3 family machines
 #
-obj-$(CONFIG_MACH_LOONGSON64) +=3D cop2-ex.o platform.o acpi_init.o dma.o =
\
+obj-$(CONFIG_MACH_LOONGSON64) +=3D cop2-ex.o platform.o dma.o \
 =09=09=09=09setup.o init.o env.o time.o reset.o \
=20
 obj-$(CONFIG_SMP)=09+=3D smp.o
diff --git a/drivers/platform/mips/Kconfig b/drivers/platform/mips/Kconfig
index 5e77b0dc5fd6..8ac149173c64 100644
--- a/drivers/platform/mips/Kconfig
+++ b/drivers/platform/mips/Kconfig
@@ -24,4 +24,10 @@ config CPU_HWMON
 =09help
 =09  Loongson-3A/3B CPU Hwmon (temperature sensor) driver.
=20
+config RS780E_ACPI
+=09bool "Loongson RS780E ACPI Controller"
+=09depends on MACH_LOONGSON64 || COMPILE_TEST
+=09help
+=09  Loongson RS780E PCH ACPI Controller driver.
+
 endif # MIPS_PLATFORM_DEVICES
diff --git a/drivers/platform/mips/Makefile b/drivers/platform/mips/Makefil=
e
index be8146c20dc8..178149098777 100644
--- a/drivers/platform/mips/Makefile
+++ b/drivers/platform/mips/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CPU_HWMON) +=3D cpu_hwmon.o
+obj-$(CONFIG_RS780E_ACPI) +=3D rs780e-acpi.o
diff --git a/arch/mips/loongson64/acpi_init.c b/drivers/platform/mips/rs780=
e-acpi.c
similarity index 70%
rename from arch/mips/loongson64/acpi_init.c
rename to drivers/platform/mips/rs780e-acpi.c
index 8d7c119ddf91..e5a643b78ac9 100644
--- a/arch/mips/loongson64/acpi_init.c
+++ b/drivers/platform/mips/rs780e-acpi.c
@@ -3,32 +3,23 @@
 #include <linux/init.h>
 #include <linux/ioport.h>
 #include <linux/export.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
=20
-#define SBX00_ACPI_IO_BASE 0x800
-#define SBX00_ACPI_IO_SIZE 0x100
+static unsigned long acpi_iobase;
=20
-#define ACPI_PM_EVT_BLK         (SBX00_ACPI_IO_BASE + 0x00) /* 4 bytes */
-#define ACPI_PM_CNT_BLK         (SBX00_ACPI_IO_BASE + 0x04) /* 2 bytes */
-#define ACPI_PMA_CNT_BLK        (SBX00_ACPI_IO_BASE + 0x0F) /* 1 byte */
-#define ACPI_PM_TMR_BLK         (SBX00_ACPI_IO_BASE + 0x18) /* 4 bytes */
-#define ACPI_GPE0_BLK           (SBX00_ACPI_IO_BASE + 0x10) /* 8 bytes */
-#define ACPI_END                (SBX00_ACPI_IO_BASE + 0x80)
+#define ACPI_PM_EVT_BLK         (acpi_iobase + 0x00) /* 4 bytes */
+#define ACPI_PM_CNT_BLK         (acpi_iobase + 0x04) /* 2 bytes */
+#define ACPI_PMA_CNT_BLK        (acpi_iobase + 0x0F) /* 1 byte */
+#define ACPI_PM_TMR_BLK         (acpi_iobase + 0x18) /* 4 bytes */
+#define ACPI_GPE0_BLK           (acpi_iobase + 0x10) /* 8 bytes */
+#define ACPI_END                (acpi_iobase + 0x80)
=20
 #define PM_INDEX        0xCD6
 #define PM_DATA         0xCD7
 #define PM2_INDEX       0xCD0
 #define PM2_DATA        0xCD1
=20
-/*
- * SCI interrupt need acpi space, allocate here
- */
-
-static int __init register_acpi_resource(void)
-{
-=09request_region(SBX00_ACPI_IO_BASE, SBX00_ACPI_IO_SIZE, "acpi");
-=09return 0;
-}
-
 static void pmio_write_index(u16 index, u8 reg, u8 value)
 {
 =09outb(reg, index);
@@ -141,11 +132,38 @@ void acpi_registers_setup(void)
 =09pm2_iowrite(0xf8, value);
 }
=20
-int __init sbx00_acpi_init(void)
+static int rs780e_acpi_probe(struct platform_device *pdev)
 {
-=09register_acpi_resource();
+=09struct resource *res;
+
+=09res =3D platform_get_resource(pdev, IORESOURCE_IO, 0);
+=09if (!res)
+=09=09return -ENODEV;
+
+=09/* SCI interrupt need acpi space, allocate here */
+=09if (!request_region(res->start, resource_size(res), "acpi")) {
+=09=09pr_err("RS780E-ACPI: Failed to request IO Region\n");
+=09=09return -EBUSY;
+=09}
+
+=09acpi_iobase =3D res->start;
+
 =09acpi_registers_setup();
 =09acpi_hw_clear_status();
=20
 =09return 0;
 }
+
+static const struct of_device_id rs780e_acpi_match[] =3D {
+=09{ .compatible =3D "loongson,rs780e-acpi" },
+=09{},
+};
+
+static struct platform_driver rs780e_acpi_driver =3D {
+=09.probe =3D rs780e_acpi_probe,
+=09.driver =3D {
+=09=09.name =3D "RS780E-ACPI",
+=09=09.of_match_table =3D rs780e_acpi_match,
+=09},
+};
+builtin_platform_driver(rs780e_acpi_driver);
--=20
2.26.0.rc2


