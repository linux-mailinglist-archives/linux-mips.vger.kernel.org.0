Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835251B0D1E
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 15:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728475AbgDTNqb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 09:46:31 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:59096 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgDTNqb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Apr 2020 09:46:31 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 5334E20CD9;
        Mon, 20 Apr 2020 13:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587390390; bh=2Yha78wdaBWdV4Os8gh18PUzHd9AUb6A+au0cwwAvQ0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gLFWuolCyKX/s7wXlWaP50UKXmfpnKgZBwWFSoTeaA5F726Liy2qqg5fyS/G5VT0e
         22FKNYcmvwfz+ACNhNuaqU6Po+u11skto8Jmuat90KO5M5GVRp0hfTWnpyObzuWYzn
         hF8/6h/AUgrVqUNG3FWbaORBhs8a9xLBNrXUxxwaMiuNGaYNGx5bjejlMi22Mm3CO2
         6dHr/P6QUX36PlG6YqN24BSI+KqTJfy/BjObzDViKySV0olHgFOg4iL5k7iRxQ2guz
         bWTLJf7Mr9a0UDC0RvWoxbJfZEua/ly37lLfx7uy9axy5bNQgo4tWNgVIOIl/TLR5i
         RV5MjrUrTh2xA==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] MIPS: Loongson64: Make RS780E ACPI as a platform driver
Date:   Mon, 20 Apr 2020 21:45:26 +0800
Message-Id: <20200420134536.210475-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200420134536.210475-1-jiaxun.yang@flygoat.com>
References: <20200420073347.157230-1-jiaxun.yang@flygoat.com>
 <20200420134536.210475-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Make RS780E ACPI as a platform driver so we can enable it
by DeviceTree selectively.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Rebase to mips-next
---
 arch/mips/loongson64/Makefile                 |  2 +-
 arch/mips/loongson64/pci.c                    |  2 -
 drivers/platform/mips/Kconfig                 |  6 ++
 drivers/platform/mips/Makefile                |  1 +
 .../platform/mips/rs780e-acpi.c               | 58 ++++++++++++-------
 5 files changed, 46 insertions(+), 23 deletions(-)
 rename arch/mips/loongson64/acpi_init.c => drivers/platform/mips/rs780e-acpi.c (70%)

diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
index 32b8c224852f..6f3c2b47f66f 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson64/Makefile
@@ -2,7 +2,7 @@
 #
 # Makefile for Loongson-3 family machines
 #
-obj-$(CONFIG_MACH_LOONGSON64) += cop2-ex.o platform.o acpi_init.o dma.o \
+obj-$(CONFIG_MACH_LOONGSON64) += cop2-ex.o platform.o dma.o \
 				setup.o init.o env.o time.o reset.o \
 
 obj-$(CONFIG_SMP)	+= smp.o
diff --git a/arch/mips/loongson64/pci.c b/arch/mips/loongson64/pci.c
index e84ae20c3290..a440a2725a20 100644
--- a/arch/mips/loongson64/pci.c
+++ b/arch/mips/loongson64/pci.c
@@ -43,8 +43,6 @@ static int __init pcibios_init(void)
 
 	register_pci_controller(&loongson_pci_controller);
 
-	sbx00_acpi_init();
-
 	return 0;
 }
 
diff --git a/drivers/platform/mips/Kconfig b/drivers/platform/mips/Kconfig
index 5e77b0dc5fd6..8ac149173c64 100644
--- a/drivers/platform/mips/Kconfig
+++ b/drivers/platform/mips/Kconfig
@@ -24,4 +24,10 @@ config CPU_HWMON
 	help
 	  Loongson-3A/3B CPU Hwmon (temperature sensor) driver.
 
+config RS780E_ACPI
+	bool "Loongson RS780E ACPI Controller"
+	depends on MACH_LOONGSON64 || COMPILE_TEST
+	help
+	  Loongson RS780E PCH ACPI Controller driver.
+
 endif # MIPS_PLATFORM_DEVICES
diff --git a/drivers/platform/mips/Makefile b/drivers/platform/mips/Makefile
index be8146c20dc8..178149098777 100644
--- a/drivers/platform/mips/Makefile
+++ b/drivers/platform/mips/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CPU_HWMON) += cpu_hwmon.o
+obj-$(CONFIG_RS780E_ACPI) += rs780e-acpi.o
diff --git a/arch/mips/loongson64/acpi_init.c b/drivers/platform/mips/rs780e-acpi.c
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
 
-#define SBX00_ACPI_IO_BASE 0x800
-#define SBX00_ACPI_IO_SIZE 0x100
+static unsigned long acpi_iobase;
 
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
 
 #define PM_INDEX        0xCD6
 #define PM_DATA         0xCD7
 #define PM2_INDEX       0xCD0
 #define PM2_DATA        0xCD1
 
-/*
- * SCI interrupt need acpi space, allocate here
- */
-
-static int __init register_acpi_resource(void)
-{
-	request_region(SBX00_ACPI_IO_BASE, SBX00_ACPI_IO_SIZE, "acpi");
-	return 0;
-}
-
 static void pmio_write_index(u16 index, u8 reg, u8 value)
 {
 	outb(reg, index);
@@ -141,11 +132,38 @@ void acpi_registers_setup(void)
 	pm2_iowrite(0xf8, value);
 }
 
-int __init sbx00_acpi_init(void)
+static int rs780e_acpi_probe(struct platform_device *pdev)
 {
-	register_acpi_resource();
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
+	if (!res)
+		return -ENODEV;
+
+	/* SCI interrupt need acpi space, allocate here */
+	if (!request_region(res->start, resource_size(res), "acpi")) {
+		pr_err("RS780E-ACPI: Failed to request IO Region\n");
+		return -EBUSY;
+	}
+
+	acpi_iobase = res->start;
+
 	acpi_registers_setup();
 	acpi_hw_clear_status();
 
 	return 0;
 }
+
+static const struct of_device_id rs780e_acpi_match[] = {
+	{ .compatible = "loongson,rs780e-acpi" },
+	{},
+};
+
+static struct platform_driver rs780e_acpi_driver = {
+	.probe = rs780e_acpi_probe,
+	.driver = {
+		.name = "RS780E-ACPI",
+		.of_match_table = rs780e_acpi_match,
+	},
+};
+builtin_platform_driver(rs780e_acpi_driver);
-- 
2.26.0.rc2

