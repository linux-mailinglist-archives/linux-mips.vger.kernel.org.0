Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68D3D1B0316
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 09:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgDTHes (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 03:34:48 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:59004 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgDTHes (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Apr 2020 03:34:48 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 9FE0F20CF1;
        Mon, 20 Apr 2020 07:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587368088; bh=pGK12Zoy9dgmXGoLGufq1uJz/nApbKf58Ki5B80ncrE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IvkvR/zMgTMN99g8AO44RDwTXjixzCHBqKujnS8cYX0IGRqYzd8/lyVImJHsYzkRG
         iGCPuRJXHsA6yVObzM310q9G5OTueQj7ultYDlOvd6djDWK3g7XAj0DJ2IKDz5Qxej
         9Ml+w8t+e+7cZxQ6STsk3eeQNOyqw0Bv6QNBY8hxmQmnDrnqFC0WAVQc6amLkkaaYI
         z105oxUMIs7WP5IV38RI4FZZLJiC+IOb0Mo21Z5DLfVEsZYyhkFPfb1+BqImQvB5oa
         s3ymKCfmhS5uusnr1KoiL0q3sILFy+MxBvKsYIgIA+2zBeas0/6CPn0ISBvHV+Qtn1
         5g+BhhDsk8Ytw==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/5] MIPS: Loongson64: Make RS780E ACPI as a platform driver
Date:   Mon, 20 Apr 2020 15:33:37 +0800
Message-Id: <20200420073347.157230-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200420073347.157230-1-jiaxun.yang@flygoat.com>
References: <20200420073347.157230-1-jiaxun.yang@flygoat.com>
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
 arch/mips/loongson64/Makefile                 |  2 +-
 drivers/platform/mips/Kconfig                 |  6 ++
 drivers/platform/mips/Makefile                |  1 +
 .../platform/mips/rs780e-acpi.c               | 58 ++++++++++++-------
 4 files changed, 46 insertions(+), 21 deletions(-)
 rename arch/mips/loongson64/acpi_init.c => drivers/platform/mips/rs780e-acpi.c (70%)

diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
index 102a19aa92aa..6f81b822aeae 100644
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

