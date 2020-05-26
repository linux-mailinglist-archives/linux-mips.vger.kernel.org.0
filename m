Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD481E2286
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 15:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729079AbgEZM7l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 08:59:41 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57336 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731781AbgEZM7k (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 08:59:40 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id A74078030869;
        Tue, 26 May 2020 12:59:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id iRqTKHYwckN4; Tue, 26 May 2020 15:59:36 +0300 (MSK)
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
Subject: [PATCH v3 4/6] bus: Add Baikal-T1 AXI-bus driver
Date:   Tue, 26 May 2020 15:59:26 +0300
Message-ID: <20200526125928.17096-5-Sergey.Semin@baikalelectronics.ru>
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

AXI3-bus is the main communication bus connecting all high-speed
peripheral IP-cores with RAM controller and MIPS P5600 cores on Baikal-T1
SoC. Bus traffic arbitration is done by means of DW AMBA 3 AXI
Interconnect (so called AXI Main Interconnect) routing IO requests from
one SoC block to another. This driver provides a way to detect any bus
protocol errors and device not responding situations by means of an
embedded on top of the interconnect errors handler block (EHB). AXI
Interconnect QoS arbitration tuning is currently unsupported.
The bus doesn't provide a way to detect the interconnected devices,
so they are supposed to be statically defined like by means of the
simple-bus sub-nodes.

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
- Fix commit message and Kconfig help text spelling.
- Move driver from soc to the bus subsystem.
- Convert a simple EHB driver to the Baikal-T1 AXI-bus one.
- Use syscon regmap to access the AXI-bus erroneous address.
- Add interconnect reset line support.
- Remove probe-status info string printout.
- Use generic FIELD_{GET,PREP} macros instead of handwritten ones.
- Since the driver depends on the OF config we can remove of_match_ptr()
  macro utilization.
- Don't print error-message if no platform IRQ found. Just return an error.
- Select MFD_SYSCON config.

Changelog v3:
- Retrieve QoS registers by resource name "qos".
- Discard CONFIG_OF dependency since there is none at compile-time.
---
 drivers/bus/Kconfig   |  15 ++
 drivers/bus/Makefile  |   1 +
 drivers/bus/bt1-axi.c | 318 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 334 insertions(+)
 create mode 100644 drivers/bus/bt1-axi.c

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 6d4e4497b59b..1080dd26e268 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -29,6 +29,21 @@ config BRCMSTB_GISB_ARB
 	  arbiter. This driver provides timeout and target abort error handling
 	  and internal bus master decoding.
 
+config BT1_AXI
+	tristate "Baikal-T1 AXI-bus driver"
+	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
+	select MFD_SYSCON
+	help
+	  AXI3-bus is the main communication bus connecting all high-speed
+	  peripheral IP-cores with RAM controller and with MIPS P5600 cores on
+	  Baikal-T1 SoC. Traffic arbitration is done by means of DW AMBA 3 AXI
+	  Interconnect (so called AXI Main Interconnect) routing IO requests
+	  from one SoC block to another. This driver provides a way to detect
+	  any bus protocol errors and device not responding situations by
+	  means of an embedded on top of the interconnect errors handler
+	  block (EHB). AXI Interconnect QoS arbitration tuning is currently
+	  unsupported.
+
 config MOXTET
 	tristate "CZ.NIC Turris Mox module configuration bus"
 	depends on SPI_MASTER && OF
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index 05f32cd694a4..eaa25d171ebd 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_MOXTET)		+= moxtet.o
 # DPAA2 fsl-mc bus
 obj-$(CONFIG_FSL_MC_BUS)	+= fsl-mc/
 
+obj-$(CONFIG_BT1_AXI)		+= bt1-axi.o
 obj-$(CONFIG_IMX_WEIM)		+= imx-weim.o
 obj-$(CONFIG_MIPS_CDMM)		+= mips_cdmm.o
 obj-$(CONFIG_MVEBU_MBUS) 	+= mvebu-mbus.o
diff --git a/drivers/bus/bt1-axi.c b/drivers/bus/bt1-axi.c
new file mode 100644
index 000000000000..a52a5b9bbaf5
--- /dev/null
+++ b/drivers/bus/bt1-axi.c
@@ -0,0 +1,318 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+ *
+ * Authors:
+ *   Serge Semin <Sergey.Semin@baikalelectronics.ru>
+ *
+ * Baikal-T1 AXI-bus driver
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/atomic.h>
+#include <linux/regmap.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/syscon.h>
+#include <linux/interrupt.h>
+#include <linux/nmi.h>
+#include <linux/clk.h>
+#include <linux/reset.h>
+#include <linux/sysfs.h>
+
+#define BT1_AXI_WERRL			0x110
+#define BT1_AXI_WERRH			0x114
+#define BT1_AXI_WERRH_TYPE		BIT(23)
+#define BT1_AXI_WERRH_ADDR_FLD		24
+#define BT1_AXI_WERRH_ADDR_MASK		GENMASK(31, BT1_AXI_WERRH_ADDR_FLD)
+
+/*
+ * struct bt1_axi - Baikal-T1 AXI-bus private data
+ * @dev: Pointer to the device structure.
+ * @qos_regs: AXI Interconnect QoS tuning registers.
+ * @sys_regs: Baikal-T1 System Controller registers map.
+ * @irq: Errors IRQ number.
+ * @aclk: AXI reference clock.
+ * @arst: AXI Interconnect reset line.
+ * @count: Number of errors detected.
+ */
+struct bt1_axi {
+	struct device *dev;
+
+	void __iomem *qos_regs;
+	struct regmap *sys_regs;
+	int irq;
+
+	struct clk *aclk;
+
+	struct reset_control *arst;
+
+	atomic_t count;
+};
+
+static irqreturn_t bt1_axi_isr(int irq, void *data)
+{
+	struct bt1_axi *axi = data;
+	u32 low = 0, high = 0;
+
+	regmap_read(axi->sys_regs, BT1_AXI_WERRL, &low);
+	regmap_read(axi->sys_regs, BT1_AXI_WERRH, &high);
+
+	dev_crit_ratelimited(axi->dev,
+		"AXI-bus fault %d: %s at 0x%x%08x\n",
+		atomic_inc_return(&axi->count),
+		high & BT1_AXI_WERRH_TYPE ? "no slave" : "slave protocol error",
+		high, low);
+
+	/*
+	 * Print backtrace on each CPU. This might be pointless if the fault
+	 * has happened on the same CPU as the IRQ handler is executed or
+	 * the other core proceeded further execution despite the error.
+	 * But if it's not, by looking at the trace we would get straight to
+	 * the cause of the problem.
+	 */
+	trigger_all_cpu_backtrace();
+
+	return IRQ_HANDLED;
+}
+
+static void bt1_axi_clear_data(void *data)
+{
+	struct bt1_axi *axi = data;
+	struct platform_device *pdev = to_platform_device(axi->dev);
+
+	platform_set_drvdata(pdev, NULL);
+}
+
+static struct bt1_axi *bt1_axi_create_data(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct bt1_axi *axi;
+	int ret;
+
+	axi = devm_kzalloc(dev, sizeof(*axi), GFP_KERNEL);
+	if (!axi)
+		return ERR_PTR(-ENOMEM);
+
+	ret = devm_add_action(dev, bt1_axi_clear_data, axi);
+	if (ret) {
+		dev_err(dev, "Can't add AXI EHB data clear action\n");
+		return ERR_PTR(ret);
+	}
+
+	axi->dev = dev;
+	atomic_set(&axi->count, 0);
+	platform_set_drvdata(pdev, axi);
+
+	return axi;
+}
+
+static int bt1_axi_request_regs(struct bt1_axi *axi)
+{
+	struct platform_device *pdev = to_platform_device(axi->dev);
+	struct device *dev = axi->dev;
+
+	axi->sys_regs = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
+	if (IS_ERR(axi->sys_regs)) {
+		dev_err(dev, "Couldn't find syscon registers\n");
+		return PTR_ERR(axi->sys_regs);
+	}
+
+	axi->qos_regs = devm_platform_ioremap_resource_byname(pdev, "qos");
+	if (IS_ERR(axi->qos_regs)) {
+		dev_err(dev, "Couldn't map AXI-bus QoS registers\n");
+		return PTR_ERR(axi->qos_regs);
+	}
+
+	return 0;
+}
+
+static int bt1_axi_request_rst(struct bt1_axi *axi)
+{
+	int ret;
+
+	axi->arst = devm_reset_control_get_optional_exclusive(axi->dev, "arst");
+	if (IS_ERR(axi->arst)) {
+		dev_warn(axi->dev, "Couldn't get reset control line\n");
+		return PTR_ERR(axi->arst);
+	}
+
+	ret = reset_control_deassert(axi->arst);
+	if (ret)
+		dev_err(axi->dev, "Failed to deassert the reset line\n");
+
+	return ret;
+}
+
+static void bt1_axi_disable_clk(void *data)
+{
+	struct bt1_axi *axi = data;
+
+	clk_disable_unprepare(axi->aclk);
+}
+
+static int bt1_axi_request_clk(struct bt1_axi *axi)
+{
+	int ret;
+
+	axi->aclk = devm_clk_get(axi->dev, "aclk");
+	if (IS_ERR(axi->aclk)) {
+		dev_err(axi->dev, "Couldn't get AXI Interconnect clock\n");
+		return PTR_ERR(axi->aclk);
+	}
+
+	ret = clk_prepare_enable(axi->aclk);
+	if (ret) {
+		dev_err(axi->dev, "Couldn't enable the AXI clock\n");
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(axi->dev, bt1_axi_disable_clk, axi);
+	if (ret) {
+		dev_err(axi->dev, "Can't add AXI clock disable action\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int bt1_axi_request_irq(struct bt1_axi *axi)
+{
+	struct platform_device *pdev = to_platform_device(axi->dev);
+	int ret;
+
+	axi->irq = platform_get_irq(pdev, 0);
+	if (axi->irq < 0)
+		return axi->irq;
+
+	ret = devm_request_irq(axi->dev, axi->irq, bt1_axi_isr, IRQF_SHARED,
+			       "bt1-axi", axi);
+	if (ret) {
+		dev_err(axi->dev, "Couldn't request AXI EHB IRQ\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static ssize_t count_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	struct bt1_axi *axi = dev_get_drvdata(dev);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", atomic_read(&axi->count));
+}
+static DEVICE_ATTR_RO(count);
+
+static int inject_error_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	return scnprintf(buf, PAGE_SIZE, "Error injection: bus unaligned\n");
+}
+
+static int inject_error_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *data, size_t count)
+{
+	struct bt1_axi *axi = dev_get_drvdata(dev);
+
+	/*
+	 * Performing unaligned read from the memory will cause the CM2 bus
+	 * error while unaligned writing - the AXI bus write error handled
+	 * by this driver.
+	 */
+	if (!strncmp(data, "bus", 3))
+		readb(axi->qos_regs);
+	else if (!strncmp(data, "unaligned", 9))
+		writeb(0, axi->qos_regs);
+	else
+		return -EINVAL;
+
+	return count;
+}
+static DEVICE_ATTR_RW(inject_error);
+
+static struct attribute *bt1_axi_sysfs_attrs[] = {
+	&dev_attr_count.attr,
+	&dev_attr_inject_error.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(bt1_axi_sysfs);
+
+static void bt1_axi_remove_sysfs(void *data)
+{
+	struct bt1_axi *axi = data;
+
+	device_remove_groups(axi->dev, bt1_axi_sysfs_groups);
+}
+
+static int bt1_axi_init_sysfs(struct bt1_axi *axi)
+{
+	int ret;
+
+	ret = device_add_groups(axi->dev, bt1_axi_sysfs_groups);
+	if (ret) {
+		dev_err(axi->dev, "Failed to add sysfs files group\n");
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(axi->dev, bt1_axi_remove_sysfs, axi);
+	if (ret)
+		dev_err(axi->dev, "Can't add AXI EHB sysfs remove action\n");
+
+	return ret;
+}
+
+static int bt1_axi_probe(struct platform_device *pdev)
+{
+	struct bt1_axi *axi;
+	int ret;
+
+	axi = bt1_axi_create_data(pdev);
+	if (IS_ERR(axi))
+		return PTR_ERR(axi);
+
+	ret = bt1_axi_request_regs(axi);
+	if (ret)
+		return ret;
+
+	ret = bt1_axi_request_rst(axi);
+	if (ret)
+		return ret;
+
+	ret = bt1_axi_request_clk(axi);
+	if (ret)
+		return ret;
+
+	ret = bt1_axi_request_irq(axi);
+	if (ret)
+		return ret;
+
+	ret = bt1_axi_init_sysfs(axi);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id bt1_axi_of_match[] = {
+	{ .compatible = "baikal,bt1-axi" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, bt1_axi_of_match);
+
+static struct platform_driver bt1_axi_driver = {
+	.probe = bt1_axi_probe,
+	.driver = {
+		.name = "bt1-axi",
+		.of_match_table = bt1_axi_of_match
+	}
+};
+module_platform_driver(bt1_axi_driver);
+
+MODULE_AUTHOR("Serge Semin <Sergey.Semin@baikalelectronics.ru>");
+MODULE_DESCRIPTION("Baikal-T1 AXI-bus driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.2

