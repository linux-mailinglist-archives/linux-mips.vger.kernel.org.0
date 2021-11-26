Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B893D45EBA5
	for <lists+linux-mips@lfdr.de>; Fri, 26 Nov 2021 11:31:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376717AbhKZKea (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Nov 2021 05:34:30 -0500
Received: from mga09.intel.com ([134.134.136.24]:30486 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239294AbhKZKca (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 26 Nov 2021 05:32:30 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="235465911"
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; 
   d="scan'208";a="235465911"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 02:23:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; 
   d="scan'208";a="555029775"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2021 02:23:44 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4C746120; Fri, 26 Nov 2021 12:23:48 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v1 1/1] MIPS: TXx9: Convert SPI platform data to software nodes
Date:   Fri, 26 Nov 2021 12:23:39 +0200
Message-Id: <20211126102339.28908-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to get rid of legacy platform data in AT25 driver,
convert its users to use software nodes.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/mips/include/asm/txx9/spi.h    |  4 ++--
 arch/mips/txx9/generic/spi_eeprom.c | 32 +++++++++++++++++------------
 arch/mips/txx9/rbtx4938/setup.c     |  6 +++---
 3 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/arch/mips/include/asm/txx9/spi.h b/arch/mips/include/asm/txx9/spi.h
index 0d727f354557..1ca87a516b81 100644
--- a/arch/mips/include/asm/txx9/spi.h
+++ b/arch/mips/include/asm/txx9/spi.h
@@ -16,11 +16,11 @@
 #include <linux/errno.h>
 
 #ifdef CONFIG_SPI
-int spi_eeprom_register(int busid, int chipid, int size);
+int spi_eeprom_register(int busid, int chipid);
 int spi_eeprom_read(int busid, int chipid,
 		    int address, unsigned char *buf, int len);
 #else
-static inline int spi_eeprom_register(int busid, int chipid, int size)
+static inline int spi_eeprom_register(int busid, int chipid)
 {
 	return -ENODEV;
 }
diff --git a/arch/mips/txx9/generic/spi_eeprom.c b/arch/mips/txx9/generic/spi_eeprom.c
index d833dd2c9b55..cb4b4d47437e 100644
--- a/arch/mips/txx9/generic/spi_eeprom.c
+++ b/arch/mips/txx9/generic/spi_eeprom.c
@@ -9,18 +9,32 @@
  *
  * Support for TX4938 in 2.6 - Manish Lachwani (mlachwani@mvista.com)
  */
+#include <linux/device.h>
+#include <linux/export.h>
 #include <linux/init.h>
+#include <linux/property.h>
 #include <linux/slab.h>
-#include <linux/export.h>
-#include <linux/device.h>
+
 #include <linux/spi/spi.h>
-#include <linux/spi/eeprom.h>
+
 #include <asm/txx9/spi.h>
 
+#define AT250X0_SIZE		128
 #define AT250X0_PAGE_SIZE	8
 
+static const struct property_entry spi_eeprom_properties[] = {
+	PROPERTY_ENTRY_U32("size", AT250X0_SIZE),
+	PROPERTY_ENTRY_U32("pagesize", AT250X0_PAGE_SIZE),
+	PROPERTY_ENTRY_U32("address-width", 8),
+	{ }
+};
+
+static const struct software_node spi_eeprom_node = {
+	.properties = spi_eeprom_properties,
+};
+
 /* register board information for at25 driver */
-int __init spi_eeprom_register(int busid, int chipid, int size)
+int __init spi_eeprom_register(int busid, int chipid)
 {
 	struct spi_board_info info = {
 		.modalias = "at25",
@@ -28,16 +42,8 @@ int __init spi_eeprom_register(int busid, int chipid, int size)
 		.bus_num = busid,
 		.chip_select = chipid,
 		/* Mode 0: High-Active, Sample-Then-Shift */
+		.swnode = &spi_eeprom_node,
 	};
-	struct spi_eeprom *eeprom;
-	eeprom = kzalloc(sizeof(*eeprom), GFP_KERNEL);
-	if (!eeprom)
-		return -ENOMEM;
-	strcpy(eeprom->name, "at250x0");
-	eeprom->byte_len = size;
-	eeprom->page_size = AT250X0_PAGE_SIZE;
-	eeprom->flags = EE_ADDR1;
-	info.platform_data = eeprom;
 	return spi_register_board_info(&info, 1);
 }
 
diff --git a/arch/mips/txx9/rbtx4938/setup.c b/arch/mips/txx9/rbtx4938/setup.c
index e68eb2e7ce0c..136af1cace75 100644
--- a/arch/mips/txx9/rbtx4938/setup.c
+++ b/arch/mips/txx9/rbtx4938/setup.c
@@ -283,9 +283,9 @@ static int __init rbtx4938_spi_init(void)
 		.mode = SPI_MODE_1 | SPI_CS_HIGH,
 	};
 	spi_register_board_info(&srtc_info, 1);
-	spi_eeprom_register(SPI_BUSNO, SEEPROM1_CS, 128);
-	spi_eeprom_register(SPI_BUSNO, 16 + SEEPROM2_CS, 128);
-	spi_eeprom_register(SPI_BUSNO, 16 + SEEPROM3_CS, 128);
+	spi_eeprom_register(SPI_BUSNO,  0 + SEEPROM1_CS);
+	spi_eeprom_register(SPI_BUSNO, 16 + SEEPROM2_CS);
+	spi_eeprom_register(SPI_BUSNO, 16 + SEEPROM3_CS);
 	gpio_request(16 + SRTC_CS, "rtc-rs5c348");
 	gpio_direction_output(16 + SRTC_CS, 0);
 	gpio_request(SEEPROM1_CS, "seeprom1");
-- 
2.33.0

