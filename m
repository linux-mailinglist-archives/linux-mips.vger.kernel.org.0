Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7AAD1E31A9
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 23:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391025AbgEZV4L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 17:56:11 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:59996 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390105AbgEZVzw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 17:55:52 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id E29AD8030875;
        Tue, 26 May 2020 21:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id jkT4lF_zg2hd; Wed, 27 May 2020 00:55:40 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 07/12] i2c: designware: Add Baytrail sem config DW I2C platform dependency
Date:   Wed, 27 May 2020 00:55:23 +0300
Message-ID: <20200526215528.16417-8-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
References: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently Intel Baytrail I2C semaphore is a feature of the DW APB I2C
platform driver. It's a bit confusing to see it's config in the menu at
some separated place with no reference to the platform code. Let's move the
config definition to be below the I2C_DESIGNWARE_PLATFORM config and mark
it with "depends on I2C_DESIGNWARE_PLATFORM" statement. By doing so the
config menu will display the feature right below the DW I2C platform
driver item and will indent it to the right so signifying its belonging.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org

---

Changelog v3:

- Replace if-endif clause around the I2C_DESIGNWARE_BAYTRAIL config
  with "depends on" operator.
---
 drivers/i2c/busses/Kconfig | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index b907d4046942..4e1997642e73 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -538,6 +538,19 @@ config I2C_DESIGNWARE_PLATFORM
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-designware-platform.
 
+config I2C_DESIGNWARE_BAYTRAIL
+	bool "Intel Baytrail I2C semaphore support"
+	depends on ACPI
+	depends on I2C_DESIGNWARE_PLATFORM
+	depends on (I2C_DESIGNWARE_PLATFORM=m && IOSF_MBI) || \
+		   (I2C_DESIGNWARE_PLATFORM=y && IOSF_MBI=y)
+	help
+	  This driver enables managed host access to the PMIC I2C bus on select
+	  Intel BayTrail platforms using the X-Powers AXP288 PMIC. It allows
+	  the host to request uninterrupted access to the PMIC's I2C bus from
+	  the platform firmware controlling it. You should say Y if running on
+	  a BayTrail system using the AXP288.
+
 config I2C_DESIGNWARE_SLAVE
 	bool "Synopsys DesignWare Slave"
 	depends on I2C_DESIGNWARE_CORE
@@ -560,18 +573,6 @@ config I2C_DESIGNWARE_PCI
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-designware-pci.
 
-config I2C_DESIGNWARE_BAYTRAIL
-	bool "Intel Baytrail I2C semaphore support"
-	depends on ACPI
-	depends on (I2C_DESIGNWARE_PLATFORM=m && IOSF_MBI) || \
-		   (I2C_DESIGNWARE_PLATFORM=y && IOSF_MBI=y)
-	help
-	  This driver enables managed host access to the PMIC I2C bus on select
-	  Intel BayTrail platforms using the X-Powers AXP288 PMIC. It allows
-	  the host to request uninterrupted access to the PMIC's I2C bus from
-	  the platform firmware controlling it. You should say Y if running on
-	  a BayTrail system using the AXP288.
-
 config I2C_DIGICOLOR
 	tristate "Conexant Digicolor I2C driver"
 	depends on ARCH_DIGICOLOR || COMPILE_TEST
-- 
2.26.2

