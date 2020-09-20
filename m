Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2CD271374
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 13:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgITLPU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 07:15:20 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:53292 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgITLPU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Sep 2020 07:15:20 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id C6DF2803073F;
        Sun, 20 Sep 2020 11:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8uDbgm43KziS; Sun, 20 Sep 2020 14:15:15 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v3] mtd: physmap: Add Baikal-T1 physically mapped ROM support
Date:   Sun, 20 Sep 2020 14:14:44 +0300
Message-ID: <20200920111445.21816-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Baikal-T1 Boot Controller provides an access to a RO storages, which are
physically mapped into the SoC MMIO space. In particularly there are
Internal ROM embedded into the SoC with a pre-installed firmware,
externally attached SPI flash (also accessed in the read-only mode) and a
memory region, which mirrors one of them in accordance with the currently
enabled system boot mode (also called Boot ROM).

This commit adds the Internal ROM support to the physmap driver of the MTD
kernel subsystem. The driver will create the Internal ROM MTD as long as
it is defined in the system dts file. The physically mapped SPI flash
region will be used to implement the SPI-mem interface. The mirroring
memory region won't be accessible directly since it's redundant due to
both bootable regions being exposed anyway.

Note we had to create a dedicated code for the ROMs since read from the
corresponding memory regions must be done via the dword-aligned addresses.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linux-mips@vger.kernel.org

---

Link: https://lore.kernel.org/linux-mtd/20200508100905.5854-1-Sergey.Semin@baikalelectronics.ru/
Changelog v2:
- Resend.

Link: https://lore.kernel.org/linux-mtd/20200526225849.20985-1-Sergey.Semin@baikalelectronics.ru
Changelog v3:
- Alphabetically order the include statements.
- Discard dummy IOs.
- Discard Baikal-T1 Boot ROM support. The directly mapped SPI flash
  memory will be used in the DW APB SSI driver instead.
---
 drivers/mtd/maps/Kconfig           |  11 +++
 drivers/mtd/maps/Makefile          |   1 +
 drivers/mtd/maps/physmap-bt1-rom.c | 126 +++++++++++++++++++++++++++++
 drivers/mtd/maps/physmap-bt1-rom.h |  17 ++++
 drivers/mtd/maps/physmap-core.c    |   5 ++
 5 files changed, 160 insertions(+)
 create mode 100644 drivers/mtd/maps/physmap-bt1-rom.c
 create mode 100644 drivers/mtd/maps/physmap-bt1-rom.h

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index fd37553f1b07..6650acbc961e 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -75,6 +75,17 @@ config MTD_PHYSMAP_OF
 	  physically into the CPU's memory. The mapping description here is
 	  taken from OF device tree.
 
+config MTD_PHYSMAP_BT1_ROM
+	bool "Baikal-T1 Boot ROMs OF-based physical memory map handling"
+	depends on MTD_PHYSMAP_OF
+	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
+	select MTD_COMPLEX_MAPPINGS
+	select MULTIPLEXER
+	select MUX_MMIO
+	help
+	  This provides some extra DT physmap parsing for the Baikal-T1
+	  platforms, some detection and setting up ROMs-specific accessors.
+
 config MTD_PHYSMAP_VERSATILE
 	bool "ARM Versatile OF-based physical memory map handling"
 	depends on MTD_PHYSMAP_OF
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index c0da86a5d26f..79f018cf412f 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_MTD_CK804XROM)	+= ck804xrom.o
 obj-$(CONFIG_MTD_TSUNAMI)	+= tsunami_flash.o
 obj-$(CONFIG_MTD_PXA2XX)	+= pxa2xx-flash.o
 physmap-objs-y			+= physmap-core.o
+physmap-objs-$(CONFIG_MTD_PHYSMAP_BT1_ROM) += physmap-bt1-rom.o
 physmap-objs-$(CONFIG_MTD_PHYSMAP_VERSATILE) += physmap-versatile.o
 physmap-objs-$(CONFIG_MTD_PHYSMAP_GEMINI) += physmap-gemini.o
 physmap-objs-$(CONFIG_MTD_PHYSMAP_IXP4XX) += physmap-ixp4xx.o
diff --git a/drivers/mtd/maps/physmap-bt1-rom.c b/drivers/mtd/maps/physmap-bt1-rom.c
new file mode 100644
index 000000000000..27cfe1c63a2e
--- /dev/null
+++ b/drivers/mtd/maps/physmap-bt1-rom.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+ *
+ * Authors:
+ *   Serge Semin <Sergey.Semin@baikalelectronics.ru>
+ *
+ * Baikal-T1 Physically Mapped Internal ROM driver
+ */
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/xip.h>
+#include <linux/mux/consumer.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include "physmap-bt1-rom.h"
+
+/*
+ * Baikal-T1 SoC ROMs are only accessible by the dword-aligned instructions.
+ * We have to take this into account when implementing the data read-methods.
+ * Note there is no need in bothering with endianness, since both Baikal-T1
+ * CPU and MMIO are LE.
+ */
+static map_word __xipram bt1_rom_map_read(struct map_info *map,
+					  unsigned long ofs)
+{
+	void __iomem *src = map->virt + ofs;
+	unsigned long shift;
+	map_word ret;
+	u32 data;
+
+	/* Read data within offset dword. */
+	shift = (unsigned long)src & 0x3;
+	data = readl_relaxed(src - shift);
+	if (!shift) {
+		ret.x[0] = data;
+		return ret;
+	}
+	ret.x[0] = data >> (shift * BITS_PER_BYTE);
+
+	/* Read data from the next dword. */
+	shift = 4 - shift;
+	if (ofs + shift >= map->size)
+		return ret;
+
+	data = readl_relaxed(src + shift);
+	ret.x[0] |= data << (shift * BITS_PER_BYTE);
+
+	return ret;
+}
+
+static void __xipram bt1_rom_map_copy_from(struct map_info *map,
+					   void *to, unsigned long from,
+					   ssize_t len)
+{
+	void __iomem *src = map->virt + from;
+	ssize_t shift, chunk;
+	u32 data;
+
+	if (len <= 0 || from >= map->size)
+		return;
+
+	/* Make sure we don't go over the map limit. */
+	len = min_t(ssize_t, map->size - from, len);
+
+	/*
+	 * Since requested data size can be pretty big we have to implement
+	 * the copy procedure as optimal as possible. That's why it's split
+	 * up into the next three stages: unaligned head, aligned body,
+	 * unaligned tail.
+	 */
+	shift = (ssize_t)src & 0x3;
+	if (shift) {
+		chunk = min_t(ssize_t, 4 - shift, len);
+		data = readl_relaxed(src - shift);
+		memcpy(to, &data + shift, chunk);
+		src += chunk;
+		to += chunk;
+		len -= chunk;
+	}
+
+	while (len >= 4) {
+		data = readl_relaxed(src);
+		memcpy(to, &data, 4);
+		src += 4;
+		to += 4;
+		len -= 4;
+	}
+
+	if (len) {
+		data = readl_relaxed(src);
+		memcpy(to, &data, len);
+	}
+}
+
+int of_flash_probe_bt1_rom(struct platform_device *pdev,
+			   struct device_node *np,
+			   struct map_info *map)
+{
+	struct device *dev = &pdev->dev;
+
+	/* It's supposed to be read-only MTD. */
+	if (!of_device_is_compatible(np, "mtd-rom")) {
+		dev_info(dev, "No mtd-rom compatible string\n");
+		return 0;
+	}
+
+	/* Multiplatform guard. */
+	if (!of_device_is_compatible(np, "baikal,bt1-int-rom"))
+		return 0;
+
+	/* Sanity check the device parameters retrieved from DTB. */
+	if (map->bankwidth != 4)
+		dev_warn(dev, "Bank width is supposed to be 32 bits wide\n");
+
+	map->read = bt1_rom_map_read;
+	map->copy_from = bt1_rom_map_copy_from;
+
+	return 0;
+}
diff --git a/drivers/mtd/maps/physmap-bt1-rom.h b/drivers/mtd/maps/physmap-bt1-rom.h
new file mode 100644
index 000000000000..6782899598a4
--- /dev/null
+++ b/drivers/mtd/maps/physmap-bt1-rom.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <linux/mtd/map.h>
+#include <linux/of.h>
+
+#ifdef CONFIG_MTD_PHYSMAP_BT1_ROM
+int of_flash_probe_bt1_rom(struct platform_device *pdev,
+			   struct device_node *np,
+			   struct map_info *map);
+#else
+static inline
+int of_flash_probe_bt1_rom(struct platform_device *pdev,
+			   struct device_node *np,
+			   struct map_info *map)
+{
+	return 0;
+}
+#endif
diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 8f7f966fa9a7..8843e780f5c8 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -41,6 +41,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/gpio/consumer.h>
 
+#include "physmap-bt1-rom.h"
 #include "physmap-gemini.h"
 #include "physmap-ixp4xx.h"
 #include "physmap-versatile.h"
@@ -371,6 +372,10 @@ static int physmap_flash_of_init(struct platform_device *dev)
 		info->maps[i].bankwidth = bankwidth;
 		info->maps[i].device_node = dp;
 
+		err = of_flash_probe_bt1_rom(dev, dp, &info->maps[i]);
+		if (err)
+			return err;
+
 		err = of_flash_probe_gemini(dev, dp, &info->maps[i]);
 		if (err)
 			return err;
-- 
2.27.0

