Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4DC1E25B6
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 17:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729652AbgEZPlq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 11:41:46 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:58614 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729436AbgEZPlo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 11:41:44 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 939278030875;
        Tue, 26 May 2020 15:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id sevAE6JIOsEL; Tue, 26 May 2020 18:41:33 +0300 (MSK)
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
Subject: [PATCH v3 6/7] watchdog: dw_wdt: Add pre-timeouts support
Date:   Tue, 26 May 2020 18:41:22 +0300
Message-ID: <20200526154123.24402-7-Sergey.Semin@baikalelectronics.ru>
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

DW Watchdog can rise an interrupt in case if IRQ request mode is enabled
and timer reaches the zero value. In this case the IRQ lane is left
pending until either the next watchdog kick event (watchdog restart) or
until the WDT_EOI register is read or the device/system reset. This
interface can be used to implement the pre-timeout functionality
optionally provided by the Linux kernel watchdog devices.

IRQ mode provides a two stages timeout interface. It means the IRQ is
raised when the counter reaches zero, while the system reset occurs only
after subsequent timeout if the timer restart is not performed. Due to
this peculiarity the pre-timeout value is actually set to the achieved
hardware timeout, while the real watchdog timeout is considered to be
twice as much of it. This applies a significant limitation on the
pre-timeout values, so current implementation supports either zero value,
which disables the pre-timeout events, or non-zero values, which imply
the pre-timeout to be at least half of the current watchdog timeout.

Note that we ask the interrupt controller to detect the rising-edge
pre-timeout interrupts to prevent the high-level-IRQs flood, since
if the pre-timeout happens, the IRQ lane will be left pending until
it's cleared by the timer restart.

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
- Make the Pre-timeout IRQ being optionally supported.
---
 drivers/watchdog/dw_wdt.c | 138 +++++++++++++++++++++++++++++++++++---
 1 file changed, 130 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index efbc36872670..3cd7c485cd70 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -22,6 +22,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
+#include <linux/interrupt.h>
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/platform_device.h>
@@ -36,6 +37,8 @@
 #define WDOG_CURRENT_COUNT_REG_OFFSET	    0x08
 #define WDOG_COUNTER_RESTART_REG_OFFSET     0x0c
 #define WDOG_COUNTER_RESTART_KICK_VALUE	    0x76
+#define WDOG_INTERRUPT_STATUS_REG_OFFSET    0x10
+#define WDOG_INTERRUPT_CLEAR_REG_OFFSET     0x14
 #define WDOG_COMP_PARAMS_1_REG_OFFSET       0xf4
 #define WDOG_COMP_PARAMS_1_USE_FIX_TOP      BIT(6)
 
@@ -59,6 +62,11 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
 		 "(default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+enum dw_wdt_rmod {
+	DW_WDT_RMOD_RESET = 1,
+	DW_WDT_RMOD_IRQ = 2
+};
+
 struct dw_wdt_timeout {
 	u32 top_val;
 	unsigned int sec;
@@ -70,6 +78,7 @@ struct dw_wdt {
 	struct clk		*clk;
 	struct clk		*pclk;
 	unsigned long		rate;
+	enum dw_wdt_rmod	rmod;
 	struct dw_wdt_timeout	timeouts[DW_WDT_NUM_TOPS];
 	struct watchdog_device	wdd;
 	struct reset_control	*rst;
@@ -86,6 +95,20 @@ static inline int dw_wdt_is_enabled(struct dw_wdt *dw_wdt)
 		WDOG_CONTROL_REG_WDT_EN_MASK;
 }
 
+static void dw_wdt_update_mode(struct dw_wdt *dw_wdt, enum dw_wdt_rmod rmod)
+{
+	u32 val;
+
+	val = readl(dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
+	if (rmod == DW_WDT_RMOD_IRQ)
+		val |= WDOG_CONTROL_REG_RESP_MODE_MASK;
+	else
+		val &= ~WDOG_CONTROL_REG_RESP_MODE_MASK;
+	writel(val, dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
+
+	dw_wdt->rmod = rmod;
+}
+
 static unsigned int dw_wdt_find_best_top(struct dw_wdt *dw_wdt,
 					 unsigned int timeout, u32 *top_val)
 {
@@ -145,7 +168,11 @@ static unsigned int dw_wdt_get_timeout(struct dw_wdt *dw_wdt)
 			break;
 	}
 
-	return dw_wdt->timeouts[idx].sec;
+	/*
+	 * In IRQ mode due to the two stages counter, the actual timeout is
+	 * twice greater than the TOP setting.
+	 */
+	return dw_wdt->timeouts[idx].sec * dw_wdt->rmod;
 }
 
 static int dw_wdt_ping(struct watchdog_device *wdd)
@@ -164,7 +191,20 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
 	unsigned int timeout;
 	u32 top_val;
 
-	timeout = dw_wdt_find_best_top(dw_wdt, top_s, &top_val);
+	/*
+	 * Note IRQ mode being enabled means having a non-zero pre-timeout
+	 * setup. In this case we try to find a TOP as close to the half of the
+	 * requested timeout as possible since DW Watchdog IRQ mode is designed
+	 * in two stages way - first timeout rises the pre-timeout interrupt,
+	 * second timeout performs the system reset. So basically the effective
+	 * watchdog-caused reset happens after two watchdog TOPs elapsed.
+	 */
+	timeout = dw_wdt_find_best_top(dw_wdt, DIV_ROUND_UP(top_s, dw_wdt->rmod),
+				       &top_val);
+	if (dw_wdt->rmod == DW_WDT_RMOD_IRQ)
+		wdd->pretimeout = timeout;
+	else
+		wdd->pretimeout = 0;
 
 	/*
 	 * Set the new value in the watchdog.  Some versions of dw_wdt
@@ -175,25 +215,47 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
 	writel(top_val | top_val << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
 	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
 
+	/* Kick new TOP value into the watchdog counter if activated. */
+	if (watchdog_active(wdd))
+		dw_wdt_ping(wdd);
+
 	/*
 	 * In case users set bigger timeout value than HW can support,
 	 * kernel(watchdog_dev.c) helps to feed watchdog before
 	 * wdd->max_hw_heartbeat_ms
 	 */
 	if (top_s * 1000 <= wdd->max_hw_heartbeat_ms)
-		wdd->timeout = timeout;
+		wdd->timeout = timeout * dw_wdt->rmod;
 	else
 		wdd->timeout = top_s;
 
 	return 0;
 }
 
+static int dw_wdt_set_pretimeout(struct watchdog_device *wdd, unsigned int req)
+{
+	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
+
+	/*
+	 * We ignore actual value of the timeout passed from user-space
+	 * using it as a flag whether the pretimeout functionality is intended
+	 * to be activated.
+	 */
+	dw_wdt_update_mode(dw_wdt, req ? DW_WDT_RMOD_IRQ : DW_WDT_RMOD_RESET);
+	dw_wdt_set_timeout(wdd, wdd->timeout);
+
+	return 0;
+}
+
 static void dw_wdt_arm_system_reset(struct dw_wdt *dw_wdt)
 {
 	u32 val = readl(dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
 
-	/* Disable interrupt mode; always perform system reset. */
-	val &= ~WDOG_CONTROL_REG_RESP_MODE_MASK;
+	/* Disable/enable interrupt mode depending on the RMOD flag. */
+	if (dw_wdt->rmod == DW_WDT_RMOD_IRQ)
+		val |= WDOG_CONTROL_REG_RESP_MODE_MASK;
+	else
+		val &= ~WDOG_CONTROL_REG_RESP_MODE_MASK;
 	/* Enable watchdog. */
 	val |= WDOG_CONTROL_REG_WDT_EN_MASK;
 	writel(val, dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
@@ -231,6 +293,7 @@ static int dw_wdt_restart(struct watchdog_device *wdd,
 	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
 
 	writel(0, dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
+	dw_wdt_update_mode(dw_wdt, DW_WDT_RMOD_RESET);
 	if (dw_wdt_is_enabled(dw_wdt))
 		writel(WDOG_COUNTER_RESTART_KICK_VALUE,
 		       dw_wdt->regs + WDOG_COUNTER_RESTART_REG_OFFSET);
@@ -246,9 +309,19 @@ static int dw_wdt_restart(struct watchdog_device *wdd,
 static unsigned int dw_wdt_get_timeleft(struct watchdog_device *wdd)
 {
 	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
+	unsigned int sec;
+	u32 val;
+
+	val = readl(dw_wdt->regs + WDOG_CURRENT_COUNT_REG_OFFSET);
+	sec = val / dw_wdt->rate;
 
-	return readl(dw_wdt->regs + WDOG_CURRENT_COUNT_REG_OFFSET) /
-		dw_wdt->rate;
+	if (dw_wdt->rmod == DW_WDT_RMOD_IRQ) {
+		val = readl(dw_wdt->regs + WDOG_INTERRUPT_STATUS_REG_OFFSET);
+		if (!val)
+			sec += wdd->pretimeout;
+	}
+
+	return sec;
 }
 
 static const struct watchdog_info dw_wdt_ident = {
@@ -257,16 +330,41 @@ static const struct watchdog_info dw_wdt_ident = {
 	.identity	= "Synopsys DesignWare Watchdog",
 };
 
+static const struct watchdog_info dw_wdt_pt_ident = {
+	.options	= WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT |
+			  WDIOF_PRETIMEOUT | WDIOF_MAGICCLOSE,
+	.identity	= "Synopsys DesignWare Watchdog",
+};
+
 static const struct watchdog_ops dw_wdt_ops = {
 	.owner		= THIS_MODULE,
 	.start		= dw_wdt_start,
 	.stop		= dw_wdt_stop,
 	.ping		= dw_wdt_ping,
 	.set_timeout	= dw_wdt_set_timeout,
+	.set_pretimeout	= dw_wdt_set_pretimeout,
 	.get_timeleft	= dw_wdt_get_timeleft,
 	.restart	= dw_wdt_restart,
 };
 
+static irqreturn_t dw_wdt_irq(int irq, void *devid)
+{
+	struct dw_wdt *dw_wdt = devid;
+	u32 val;
+
+	/*
+	 * We don't clear the IRQ status. It's supposed to be done by the
+	 * following ping operations.
+	 */
+	val = readl(dw_wdt->regs + WDOG_INTERRUPT_STATUS_REG_OFFSET);
+	if (!val)
+		return IRQ_NONE;
+
+	watchdog_notify_pretimeout(&dw_wdt->wdd);
+
+	return IRQ_HANDLED;
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int dw_wdt_suspend(struct device *dev)
 {
@@ -447,6 +545,31 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 		goto out_disable_pclk;
 	}
 
+	/* Enable normal reset without pre-timeout by default. */
+	dw_wdt_update_mode(dw_wdt, DW_WDT_RMOD_RESET);
+
+	/*
+	 * Pre-timeout IRQ is optional, since some hardware may lack support
+	 * of it. Note we must request rising-edge IRQ, since the lane is left
+	 * pending either until the next watchdog kick event or up to the
+	 * system reset.
+	 */
+	ret = platform_get_irq_optional(pdev, 0);
+	if (ret >= 0) {
+		ret = devm_request_irq(dev, ret, dw_wdt_irq,
+				       IRQF_SHARED | IRQF_TRIGGER_RISING,
+				       pdev->name, dw_wdt);
+		if (ret)
+			goto out_disable_pclk;
+
+		dw_wdt->wdd.info = &dw_wdt_pt_ident;
+	} else {
+		if (ret == -EPROBE_DEFER)
+			goto out_disable_pclk;
+
+		dw_wdt->wdd.info = &dw_wdt_ident;
+	}
+
 	reset_control_deassert(dw_wdt->rst);
 
 	ret = dw_wdt_init_timeouts(dw_wdt, dev);
@@ -454,7 +577,6 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 		goto out_disable_clk;
 
 	wdd = &dw_wdt->wdd;
-	wdd->info = &dw_wdt_ident;
 	wdd->ops = &dw_wdt_ops;
 	wdd->min_timeout = dw_wdt_get_min_timeout(dw_wdt);
 	wdd->max_hw_heartbeat_ms = dw_wdt_get_max_timeout_ms(dw_wdt);
-- 
2.26.2

