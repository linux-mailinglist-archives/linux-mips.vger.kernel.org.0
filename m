Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 845DC1E2288
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 15:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388801AbgEZM7r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 08:59:47 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57372 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731828AbgEZM7q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 08:59:46 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 9B75E8030870;
        Tue, 26 May 2020 12:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OhPfr2KPV8q7; Tue, 26 May 2020 15:59:38 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <soc@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 6/6] memory: Add Baikal-T1 L2-cache Control Block driver
Date:   Tue, 26 May 2020 15:59:28 +0300
Message-ID: <20200526125928.17096-7-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526125928.17096-1-Sergey.Semin@baikalelectronics.ru>
References: <20200526125928.17096-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Baikal-T1 SoC provides a way to tune the MIPS P5600 CM2 L2-cache
performance up. It can be done by changing the L2-RAM Data/Tag/WS
latencies in a dedicated register exposed by the system controller.
The driver added by this commit provides a dts properties-based and
sysfs-based interface for it. The device DT node is supposed to be a
child of Baikal-T1 System Controller node.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: soc@kernel.org
Cc: devicetree@vger.kernel.org

---

Changelog v2:
- Move driver from soc to memory subsystem.
- Get regmap from the parental syscon DT node.
- Use generic FIELD_{GET,PREP} macro.
- Remove probe-status info string printout.
- Since the driver depends on the OF config we can remove of_match_ptr()
  macro utilization.
- Select MFD_SYSCON config.

Changelog v3:
- Discard CONFIG_OF dependency since there is non at compile-time.
- Fix invalid of_property_read_u32() return value test.
---
 drivers/memory/Kconfig      |  11 ++
 drivers/memory/Makefile     |   1 +
 drivers/memory/bt1-l2-ctl.c | 322 ++++++++++++++++++++++++++++++++++++
 3 files changed, 334 insertions(+)
 create mode 100644 drivers/memory/bt1-l2-ctl.c

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 9bddca292330..04368ee2a809 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -46,6 +46,17 @@ config ATMEL_EBI
 	  tree is used. This bus supports NANDs, external ethernet controller,
 	  SRAMs, ATA devices, etc.
 
+config BT1_L2_CTL
+	bool "Baikal-T1 CM2 L2-RAM Cache Control Block"
+	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
+	select MFD_SYSCON
+	help
+	  Baikal-T1 CPU is based on the MIPS P5600 Warrior IP-core. The CPU
+	  resides Coherency Manager v2 with embedded 1MB L2-cache. It's
+	  possible to tune the L2 cache performance up by setting the data,
+	  tags and way-select latencies of RAM access. This driver provides a
+	  dt properties-based and sysfs interface for it.
+
 config TI_AEMIF
 	tristate "Texas Instruments AEMIF driver"
 	depends on (ARCH_DAVINCI || ARCH_KEYSTONE) && OF
diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index 27b493435e61..6d7e3e64ba62 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_ARM_PL172_MPMC)	+= pl172.o
 obj-$(CONFIG_ATMEL_SDRAMC)	+= atmel-sdramc.o
 obj-$(CONFIG_ATMEL_EBI)		+= atmel-ebi.o
 obj-$(CONFIG_ARCH_BRCMSTB)	+= brcmstb_dpfe.o
+obj-$(CONFIG_BT1_L2_CTL)	+= bt1-l2-ctl.o
 obj-$(CONFIG_TI_AEMIF)		+= ti-aemif.o
 obj-$(CONFIG_TI_EMIF)		+= emif.o
 obj-$(CONFIG_OMAP_GPMC)		+= omap-gpmc.o
diff --git a/drivers/memory/bt1-l2-ctl.c b/drivers/memory/bt1-l2-ctl.c
new file mode 100644
index 000000000000..633fea6a4edf
--- /dev/null
+++ b/drivers/memory/bt1-l2-ctl.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+ *
+ * Authors:
+ *   Serge Semin <Sergey.Semin@baikalelectronics.ru>
+ *
+ * Baikal-T1 CM2 L2-cache Control Block driver.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/bitfield.h>
+#include <linux/types.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+#include <linux/sysfs.h>
+#include <linux/of.h>
+
+#define L2_CTL_REG			0x028
+#define L2_CTL_DATA_STALL_FLD		0
+#define L2_CTL_DATA_STALL_MASK		GENMASK(1, L2_CTL_DATA_STALL_FLD)
+#define L2_CTL_TAG_STALL_FLD		2
+#define L2_CTL_TAG_STALL_MASK		GENMASK(3, L2_CTL_TAG_STALL_FLD)
+#define L2_CTL_WS_STALL_FLD		4
+#define L2_CTL_WS_STALL_MASK		GENMASK(5, L2_CTL_WS_STALL_FLD)
+#define L2_CTL_SET_CLKRATIO		BIT(13)
+#define L2_CTL_CLKRATIO_LOCK		BIT(31)
+
+#define L2_CTL_STALL_MIN		0
+#define L2_CTL_STALL_MAX		3
+#define L2_CTL_STALL_SET_DELAY_US	1
+#define L2_CTL_STALL_SET_TOUT_US	1000
+
+/*
+ * struct l2_ctl - Baikal-T1 L2 Control block private data.
+ * @dev: Pointer to the device structure.
+ * @sys_regs: Baikal-T1 System Controller registers map.
+ */
+struct l2_ctl {
+	struct device *dev;
+
+	struct regmap *sys_regs;
+};
+
+/*
+ * enum l2_ctl_stall - Baikal-T1 L2-cache-RAM stall identifier.
+ * @L2_WSSTALL: Way-select latency.
+ * @L2_TAGSTALL: Tag latency.
+ * @L2_DATASTALL: Data latency.
+ */
+enum l2_ctl_stall {
+	L2_WS_STALL,
+	L2_TAG_STALL,
+	L2_DATA_STALL
+};
+
+/*
+ * struct l2_ctl_device_attribute - Baikal-T1 L2-cache device attribute.
+ * @dev_attr: Actual sysfs device attribute.
+ * @id: L2-cache stall field identifier.
+ */
+struct l2_ctl_device_attribute {
+	struct device_attribute dev_attr;
+	enum l2_ctl_stall id;
+};
+#define to_l2_ctl_dev_attr(_dev_attr) \
+	container_of(_dev_attr, struct l2_ctl_device_attribute, dev_attr)
+
+#define L2_CTL_ATTR_RW(_name, _prefix, _id) \
+	struct l2_ctl_device_attribute l2_ctl_attr_##_name = \
+		{ __ATTR(_name, 0644, _prefix##_show, _prefix##_store),	_id }
+
+static int l2_ctl_get_latency(struct l2_ctl *l2, enum l2_ctl_stall id, u32 *val)
+{
+	u32 data = 0;
+	int ret;
+
+	ret = regmap_read(l2->sys_regs, L2_CTL_REG, &data);
+	if (ret)
+		return ret;
+
+	switch (id) {
+	case L2_WS_STALL:
+		*val = FIELD_GET(L2_CTL_WS_STALL_MASK, data);
+		break;
+	case L2_TAG_STALL:
+		*val = FIELD_GET(L2_CTL_TAG_STALL_MASK, data);
+		break;
+	case L2_DATA_STALL:
+		*val = FIELD_GET(L2_CTL_DATA_STALL_MASK, data);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int l2_ctl_set_latency(struct l2_ctl *l2, enum l2_ctl_stall id, u32 val)
+{
+	u32 mask = 0, data = 0;
+	int ret;
+
+	val = clamp_val(val, L2_CTL_STALL_MIN, L2_CTL_STALL_MAX);
+
+	switch (id) {
+	case L2_WS_STALL:
+		data = FIELD_PREP(L2_CTL_WS_STALL_MASK, val);
+		mask = L2_CTL_WS_STALL_MASK;
+		break;
+	case L2_TAG_STALL:
+		data = FIELD_PREP(L2_CTL_TAG_STALL_MASK, val);
+		mask = L2_CTL_TAG_STALL_MASK;
+		break;
+	case L2_DATA_STALL:
+		data = FIELD_PREP(L2_CTL_DATA_STALL_MASK, val);
+		mask = L2_CTL_DATA_STALL_MASK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	data |= L2_CTL_SET_CLKRATIO;
+	mask |= L2_CTL_SET_CLKRATIO;
+
+	ret = regmap_update_bits(l2->sys_regs, L2_CTL_REG, mask, data);
+	if (ret)
+		return ret;
+
+	return regmap_read_poll_timeout(l2->sys_regs, L2_CTL_REG, data,
+					data & L2_CTL_CLKRATIO_LOCK,
+					L2_CTL_STALL_SET_DELAY_US,
+					L2_CTL_STALL_SET_TOUT_US);
+}
+
+static void l2_ctl_clear_data(void *data)
+{
+	struct l2_ctl *l2 = data;
+	struct platform_device *pdev = to_platform_device(l2->dev);
+
+	platform_set_drvdata(pdev, NULL);
+}
+
+static struct l2_ctl *l2_ctl_create_data(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct l2_ctl *l2;
+	int ret;
+
+	l2 = devm_kzalloc(dev, sizeof(*l2), GFP_KERNEL);
+	if (!l2)
+		return ERR_PTR(-ENOMEM);
+
+	ret = devm_add_action(dev, l2_ctl_clear_data, l2);
+	if (ret) {
+		dev_err(dev, "Can't add L2 CTL data clear action\n");
+		return ERR_PTR(ret);
+	}
+
+	l2->dev = dev;
+	platform_set_drvdata(pdev, l2);
+
+	return l2;
+}
+
+static int l2_ctl_find_sys_regs(struct l2_ctl *l2)
+{
+	l2->sys_regs = syscon_node_to_regmap(l2->dev->of_node->parent);
+	if (IS_ERR(l2->sys_regs)) {
+		dev_err(l2->dev, "Couldn't get L2 CTL register map\n");
+		return PTR_ERR(l2->sys_regs);
+	}
+
+	return 0;
+}
+
+static int l2_ctl_of_parse_property(struct l2_ctl *l2, enum l2_ctl_stall id,
+				    const char *propname)
+{
+	int ret = 0;
+	u32 data;
+
+	if (!of_property_read_u32(l2->dev->of_node, propname, &data)) {
+		ret = l2_ctl_set_latency(l2, id, data);
+		if (ret)
+			dev_err(l2->dev, "Invalid value of '%s'\n", propname);
+	}
+
+	return ret;
+}
+
+static int l2_ctl_of_parse(struct l2_ctl *l2)
+{
+	int ret;
+
+	ret = l2_ctl_of_parse_property(l2, L2_WS_STALL, "baikal,l2-ws-latency");
+	if (ret)
+		return ret;
+
+	ret = l2_ctl_of_parse_property(l2, L2_TAG_STALL, "baikal,l2-tag-latency");
+	if (ret)
+		return ret;
+
+	return l2_ctl_of_parse_property(l2, L2_DATA_STALL,
+					"baikal,l2-data-latency");
+}
+
+static ssize_t l2_ctl_latency_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct l2_ctl_device_attribute *devattr = to_l2_ctl_dev_attr(attr);
+	struct l2_ctl *l2 = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = l2_ctl_get_latency(l2, devattr->id, &data);
+	if (ret)
+		return ret;
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n", data);
+}
+
+static ssize_t l2_ctl_latency_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct l2_ctl_device_attribute *devattr = to_l2_ctl_dev_attr(attr);
+	struct l2_ctl *l2 = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	if (kstrtouint(buf, 0, &data) < 0)
+		return -EINVAL;
+
+	ret = l2_ctl_set_latency(l2, devattr->id, data);
+	if (ret)
+		return ret;
+
+	return count;
+}
+static L2_CTL_ATTR_RW(l2_ws_latency, l2_ctl_latency, L2_WS_STALL);
+static L2_CTL_ATTR_RW(l2_tag_latency, l2_ctl_latency, L2_TAG_STALL);
+static L2_CTL_ATTR_RW(l2_data_latency, l2_ctl_latency, L2_DATA_STALL);
+
+static struct attribute *l2_ctl_sysfs_attrs[] = {
+	&l2_ctl_attr_l2_ws_latency.dev_attr.attr,
+	&l2_ctl_attr_l2_tag_latency.dev_attr.attr,
+	&l2_ctl_attr_l2_data_latency.dev_attr.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(l2_ctl_sysfs);
+
+static void l2_ctl_remove_sysfs(void *data)
+{
+	struct l2_ctl *l2 = data;
+
+	device_remove_groups(l2->dev, l2_ctl_sysfs_groups);
+}
+
+static int l2_ctl_init_sysfs(struct l2_ctl *l2)
+{
+	int ret;
+
+	ret = device_add_groups(l2->dev, l2_ctl_sysfs_groups);
+	if (ret) {
+		dev_err(l2->dev, "Failed to create L2 CTL sysfs nodes\n");
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(l2->dev, l2_ctl_remove_sysfs, l2);
+	if (ret)
+		dev_err(l2->dev, "Can't add L2 CTL sysfs remove action\n");
+
+	return ret;
+}
+
+static int l2_ctl_probe(struct platform_device *pdev)
+{
+	struct l2_ctl *l2;
+	int ret;
+
+	l2 = l2_ctl_create_data(pdev);
+	if (IS_ERR(l2))
+		return PTR_ERR(l2);
+
+	ret = l2_ctl_find_sys_regs(l2);
+	if (ret)
+		return ret;
+
+	ret = l2_ctl_of_parse(l2);
+	if (ret)
+		return ret;
+
+	ret = l2_ctl_init_sysfs(l2);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id l2_ctl_of_match[] = {
+	{ .compatible = "baikal,bt1-l2-ctl" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, l2_ctl_of_match);
+
+static struct platform_driver l2_ctl_driver = {
+	.probe = l2_ctl_probe,
+	.driver = {
+		.name = "bt1-l2-ctl",
+		.of_match_table = l2_ctl_of_match
+	}
+};
+module_platform_driver(l2_ctl_driver);
+
+MODULE_AUTHOR("Serge Semin <Sergey.Semin@baikalelectronics.ru>");
+MODULE_DESCRIPTION("Baikal-T1 L2-cache driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.2

