Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39EB31E25B3
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 17:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729631AbgEZPln (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 11:41:43 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:58606 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730135AbgEZPlj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 11:41:39 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id C3E1E8030878;
        Tue, 26 May 2020 15:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 499XuFg3cxQM; Tue, 26 May 2020 18:41:34 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 7/7] watchdog: dw_wdt: Add DebugFS files
Date:   Tue, 26 May 2020 18:41:23 +0300
Message-ID: <20200526154123.24402-8-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526154123.24402-1-Sergey.Semin@baikalelectronics.ru>
References: <20200526154123.24402-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For the sake of the easier device-driver debug procedure, we added a
DebugFS file with the controller registers state. It's available only if
kernel is configured with DebugFS support.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org

---

Changelog v2:
- Rearrange SoBs.
- Discard timeout/pretimeout/ping/enable DebugFS nodes. Registers state
  dump node is only left.
---
 drivers/watchdog/dw_wdt.c | 68 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 3cd7c485cd70..012681baaa6d 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -28,6 +28,7 @@
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/watchdog.h>
+#include <linux/debugfs.h>
 
 #define WDOG_CONTROL_REG_OFFSET		    0x00
 #define WDOG_CONTROL_REG_WDT_EN_MASK	    0x01
@@ -39,8 +40,14 @@
 #define WDOG_COUNTER_RESTART_KICK_VALUE	    0x76
 #define WDOG_INTERRUPT_STATUS_REG_OFFSET    0x10
 #define WDOG_INTERRUPT_CLEAR_REG_OFFSET     0x14
+#define WDOG_COMP_PARAMS_5_REG_OFFSET       0xe4
+#define WDOG_COMP_PARAMS_4_REG_OFFSET       0xe8
+#define WDOG_COMP_PARAMS_3_REG_OFFSET       0xec
+#define WDOG_COMP_PARAMS_2_REG_OFFSET       0xf0
 #define WDOG_COMP_PARAMS_1_REG_OFFSET       0xf4
 #define WDOG_COMP_PARAMS_1_USE_FIX_TOP      BIT(6)
+#define WDOG_COMP_VERSION_REG_OFFSET        0xf8
+#define WDOG_COMP_TYPE_REG_OFFSET           0xfc
 
 /* There are sixteen TOPs (timeout periods) that can be set in the watchdog. */
 #define DW_WDT_NUM_TOPS		16
@@ -85,6 +92,10 @@ struct dw_wdt {
 	/* Save/restore */
 	u32			control;
 	u32			timeout;
+
+#ifdef CONFIG_DEBUG_FS
+	struct dentry		*dbgfs_dir;
+#endif
 };
 
 #define to_dw_wdt(wdd)	container_of(wdd, struct dw_wdt, wdd)
@@ -484,6 +495,59 @@ static int dw_wdt_init_timeouts(struct dw_wdt *dw_wdt, struct device *dev)
 	return 0;
 }
 
+#ifdef CONFIG_DEBUG_FS
+
+#define DW_WDT_DBGFS_REG(_name, _off) \
+{				      \
+	.name = _name,		      \
+	.offset = _off		      \
+}
+
+static const struct debugfs_reg32 dw_wdt_dbgfs_regs[] = {
+	DW_WDT_DBGFS_REG("cr", WDOG_CONTROL_REG_OFFSET),
+	DW_WDT_DBGFS_REG("torr", WDOG_TIMEOUT_RANGE_REG_OFFSET),
+	DW_WDT_DBGFS_REG("ccvr", WDOG_CURRENT_COUNT_REG_OFFSET),
+	DW_WDT_DBGFS_REG("crr", WDOG_COUNTER_RESTART_REG_OFFSET),
+	DW_WDT_DBGFS_REG("stat", WDOG_INTERRUPT_STATUS_REG_OFFSET),
+	DW_WDT_DBGFS_REG("param5", WDOG_COMP_PARAMS_5_REG_OFFSET),
+	DW_WDT_DBGFS_REG("param4", WDOG_COMP_PARAMS_4_REG_OFFSET),
+	DW_WDT_DBGFS_REG("param3", WDOG_COMP_PARAMS_3_REG_OFFSET),
+	DW_WDT_DBGFS_REG("param2", WDOG_COMP_PARAMS_2_REG_OFFSET),
+	DW_WDT_DBGFS_REG("param1", WDOG_COMP_PARAMS_1_REG_OFFSET),
+	DW_WDT_DBGFS_REG("version", WDOG_COMP_VERSION_REG_OFFSET),
+	DW_WDT_DBGFS_REG("type", WDOG_COMP_TYPE_REG_OFFSET)
+};
+
+static void dw_wdt_dbgfs_init(struct dw_wdt *dw_wdt)
+{
+	struct device *dev = dw_wdt->wdd.parent;
+	struct debugfs_regset32 *regset;
+
+	regset = devm_kzalloc(dev, sizeof(*regset), GFP_KERNEL);
+	if (!regset)
+		return;
+
+	regset->regs = dw_wdt_dbgfs_regs;
+	regset->nregs = ARRAY_SIZE(dw_wdt_dbgfs_regs);
+	regset->base = dw_wdt->regs;
+
+	dw_wdt->dbgfs_dir = debugfs_create_dir(dev_name(dev), NULL);
+
+	debugfs_create_regset32("registers", 0444, dw_wdt->dbgfs_dir, regset);
+}
+
+static void dw_wdt_dbgfs_clear(struct dw_wdt *dw_wdt)
+{
+	debugfs_remove_recursive(dw_wdt->dbgfs_dir);
+}
+
+#else /* !CONFIG_DEBUG_FS */
+
+static void dw_wdt_dbgfs_init(struct dw_wdt *dw_wdt) {}
+static void dw_wdt_dbgfs_clear(struct dw_wdt *dw_wdt) {}
+
+#endif /* !CONFIG_DEBUG_FS */
+
 static int dw_wdt_drv_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -607,6 +671,8 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_disable_pclk;
 
+	dw_wdt_dbgfs_init(dw_wdt);
+
 	return 0;
 
 out_disable_pclk:
@@ -621,6 +687,8 @@ static int dw_wdt_drv_remove(struct platform_device *pdev)
 {
 	struct dw_wdt *dw_wdt = platform_get_drvdata(pdev);
 
+	dw_wdt_dbgfs_clear(dw_wdt);
+
 	watchdog_unregister_device(&dw_wdt->wdd);
 	reset_control_assert(dw_wdt->rst);
 	clk_disable_unprepare(dw_wdt->pclk);
-- 
2.26.2

