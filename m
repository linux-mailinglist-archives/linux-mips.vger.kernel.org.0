Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F39661E334A
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 00:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389767AbgEZW7H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 18:59:07 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:60398 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389565AbgEZW7G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 18:59:06 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 86F55803086D;
        Tue, 26 May 2020 22:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id IAHkLLPlnR-a; Wed, 27 May 2020 01:59:01 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Lee Jones <lee.jones@linaro.org>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH RESEND v2] mtd: physmap: Add Baikal-T1 physically mapped ROMs support
Date:   Wed, 27 May 2020 01:58:48 +0300
Message-ID: <20200526225849.20985-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Baikal-T1 Boot Controller provides an access to a RO storages, which are
physically mapped into the MMIO space. In particularly there are the
Internal ROM embedded into the SoC with a pre-installed firmware,
externally attached SPI flash (also accessed in the read-only mode) and a
memory region, which mirrors one of them in accordance with the currently
enabled system boot mode (also called Boot ROM).

This commit adds the ROMs support to the physmap driver of the MTD kernel
subsystem. Currently the driver only supports the Internal ROM, since
physically mapped SPI flash is utilized by the Baikal-T1 System Boot
Controller driver so won't be available over mtd-rom interface and
the Boot ROM mirror mapping has dependency on the SPI flash mapping
switcher available within the SPI flash registers space. The real access
to the Boot ROM memory will be added in future.

Note we had to create a dedicated code for the ROMs since read from the
corresponding memory regions must be done via the dword-aligned addresses.
In addition the driver in future states will have to take into account
that the Boot ROM might mirror the SPI flash region so before accessing it
the SPI flash direct mapping must be enabled by means of a dedicated flag
in the Baikal-T1 System SPI register flag.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linux-mips@vger.kernel.org

---

Miquel, Richard, Vignesh, the merge window is upon us, please review/merge
in/whatever this patch.

This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
tag: v5.7-rc4

New vendor prefix will be added in the framework of the next patchset:
https://lkml.org/lkml/2020/5/6/1047

Note since the next patchset is no longer relevant (as a result of a
discussion with @Lee and @Miquel)
https://lkml.org/lkml/2020/3/6/421
and Boot ROM mtd is currently unsupported I can freely submit this patch,
while in former case I had to wait for the patchset merged.

Link: https://lore.kernel.org/linux-mtd/20200508100905.5854-1-Sergey.Semin@baikalelectronics.ru/
Changelog v2:
- Resend.
---
 drivers/mtd/maps/Kconfig           |   8 ++
 drivers/mtd/maps/Makefile          |   1 +
 drivers/mtd/maps/physmap-bt1-rom.c | 189 +++++++++++++++++++++++++++++
 drivers/mtd/maps/physmap-bt1-rom.h |  17 +++
 drivers/mtd/maps/physmap-core.c    |   5 +
 5 files changed, 220 insertions(+)
 create mode 100644 drivers/mtd/maps/physmap-bt1-rom.c
 create mode 100644 drivers/mtd/maps/physmap-bt1-rom.h

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index b28225a7c4f3..60b4285cd86a 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -107,6 +107,14 @@ config MTD_PHYSMAP_IXP4XX
 	  This provides some extra DT physmap parsing for the Intel IXP4xx
 	  platforms, some elaborate endianness handling in particular.
 
+config MTD_PHYSMAP_BT1_ROM
+	bool "Baikal-T1 Boot ROMs OF-based physical memory map handling"
+	depends on (MIPS_BAIKAL_T1 && MTD_PHYSMAP_OF) || COMPILE_TEST
+	select MTD_COMPLEX_MAPPINGS
+	help
+	  This provides some extra DT physmap parsing for the Baikal-T1
+	  platforms, some detection and setting up ROMs-specific accessors.
+
 config MTD_PHYSMAP_GPIO_ADDR
 	bool "GPIO-assisted Flash Chip Support"
 	depends on MTD_PHYSMAP
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index c0da86a5d26f..45f3a151f568 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -21,6 +21,7 @@ physmap-objs-y			+= physmap-core.o
 physmap-objs-$(CONFIG_MTD_PHYSMAP_VERSATILE) += physmap-versatile.o
 physmap-objs-$(CONFIG_MTD_PHYSMAP_GEMINI) += physmap-gemini.o
 physmap-objs-$(CONFIG_MTD_PHYSMAP_IXP4XX) += physmap-ixp4xx.o
+physmap-objs-$(CONFIG_MTD_PHYSMAP_BT1_ROM) += physmap-bt1-rom.o
 physmap-objs			:= $(physmap-objs-y)
 obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o
 obj-$(CONFIG_MTD_PISMO)		+= pismo.o
diff --git a/drivers/mtd/maps/physmap-bt1-rom.c b/drivers/mtd/maps/physmap-bt1-rom.c
new file mode 100644
index 000000000000..55149af18729
--- /dev/null
+++ b/drivers/mtd/maps/physmap-bt1-rom.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+ *
+ * Authors:
+ *   Serge Semin <Sergey.Semin@baikalelectronics.ru>
+ *
+ * Baikal-T1 Physically Mapped ROMs driver
+ */
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/bits.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/xip.h>
+#include <linux/string.h>
+
+#include "physmap-bt1-rom.h"
+
+struct bt1_rom_io {
+	map_word (*read)(struct map_info *map, unsigned long ofs);
+	void (*copy_from)(struct map_info *map, void *to, unsigned long from,
+			  ssize_t len);
+};
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
+static map_word __xipram bt1_rom_dummy_read(struct map_info *map,
+					  unsigned long ofs)
+{
+	map_word ret;
+
+	ret.x[0] = 0xFF;
+
+	return ret;
+}
+
+static void __xipram bt1_rom_dummy_copy_from(struct map_info *map,
+					   void *to, unsigned long from,
+					   ssize_t len)
+{
+	if (len <= 0 || from >= map->size)
+		return;
+
+	len = min_t(ssize_t, map->size - from, len);
+
+	memset(to, 0xFF, len);
+}
+
+static const struct bt1_rom_io bt1_rom_normal_io = {
+	.read = bt1_rom_map_read,
+	.copy_from = bt1_rom_map_copy_from
+};
+
+static const struct bt1_rom_io bt1_rom_dummy_io = {
+	.read = bt1_rom_dummy_read,
+	.copy_from = bt1_rom_dummy_copy_from
+};
+
+/*
+ * Currently Baikal-T1 SoC internal ROM is only supported. Boot ROM region is
+ * dummy-data filled for now since in case of the system booted up from an
+ * external SPI flash the ROM will mirror the Baikal-T1 System Boot SPI direct
+ * mapping memory region. That region can be only accessed when transparent
+ * mode is enabled, which we unable to do here because this feature is provided
+ * by the SPI controller config space occupied by the corresponding driver.
+ * In future we'll export the mode setting method from the Baikal-T1 System
+ * Boot SPI Controller driver to also have the Boot ROM supported here.
+ */
+static const struct of_device_id bt1_rom_of_match[] = {
+	{
+		.compatible = "baikal,bt1-int-rom",
+		.data = &bt1_rom_normal_io
+	},
+	{
+		.compatible = "baikal,bt1-boot-rom",
+		.data = &bt1_rom_dummy_io
+	},
+	{ }
+};
+
+int of_flash_probe_bt1_rom(struct platform_device *pdev,
+			   struct device_node *np,
+			   struct map_info *map)
+{
+	const struct of_device_id *match;
+	struct device *dev = &pdev->dev;
+	const struct bt1_rom_io *io;
+
+	/* It's supposed to be read-only MTD. */
+	if (!of_device_is_compatible(np, "mtd-rom")) {
+		dev_info(dev, "No mtd-rom compatible string\n");
+		return 0;
+	}
+
+	/* Multiplatform guard. */
+	match = of_match_device(bt1_rom_of_match, dev);
+	if (!match)
+		return 0;
+
+	/* Sanity check the device parameters retrieved from DTB. */
+	if (map->bankwidth != 4)
+		dev_warn(dev, "Bank width is supposed to be 32 bits wide\n");
+
+	io = match->data;
+	map->read = io->read;
+	map->copy_from = io->copy_from;
+
+	return 0;
+}
diff --git a/drivers/mtd/maps/physmap-bt1-rom.h b/drivers/mtd/maps/physmap-bt1-rom.h
new file mode 100644
index 000000000000..5874f2acf929
--- /dev/null
+++ b/drivers/mtd/maps/physmap-bt1-rom.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <linux/of.h>
+#include <linux/mtd/map.h>
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
index 8f7f966fa9a7..a0716da933b5 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -44,6 +44,7 @@
 #include "physmap-gemini.h"
 #include "physmap-ixp4xx.h"
 #include "physmap-versatile.h"
+#include "physmap-bt1-rom.h"
 
 struct physmap_flash_info {
 	unsigned int		nmaps;
@@ -383,6 +384,10 @@ static int physmap_flash_of_init(struct platform_device *dev)
 		if (err)
 			return err;
 
+		err = of_flash_probe_bt1_rom(dev, dp, &info->maps[i]);
+		if (err)
+			return err;
+
 		/*
 		 * On some platforms (e.g. MPC5200) a direct 1:1 mapping
 		 * may cause problems with JFFS2 usage, as the local bus (LPB)
-- 
2.26.2

