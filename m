Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE501E324F
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 00:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404259AbgEZWVf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 18:21:35 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:60146 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404066AbgEZWVa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 18:21:30 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id EEA96803086D;
        Tue, 26 May 2020 22:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gdEpPFzOICqm; Wed, 27 May 2020 01:21:20 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
Subject: [PATCH v3 4/4] clk: Add Baikal-T1 CCU Dividers driver
Date:   Wed, 27 May 2020 01:20:56 +0300
Message-ID: <20200526222056.18072-5-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526222056.18072-1-Sergey.Semin@baikalelectronics.ru>
References: <20200526222056.18072-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Nearly each Baikal-T1 IP-core is supposed to have a clock source
of particular frequency. But since there are greater than five
IP-blocks embedded into the SoC, the CCU PLLs can't fulfill all the
needs. Baikal-T1 CCU provides a set of fixed and configurable clock
dividers in order to generate a necessary signal for each chip
sub-block.

This driver creates the of-based hardware clocks for each divider
available in Baikal-T1 CCU. The same way as for PLLs we split the
functionality up into the clocks operations (gate, ungate, set rate,
etc) and hardware clocks declaration/registration procedures.

In accordance with the CCU documentation all its dividers are distributed
into two CCU sub-blocks: AXI-bus and system devices reference clocks.
The former sub-block is used to supply the clocks for AXI-bus interfaces
(AXI clock domains) and the later one provides the SoC IP-cores reference
clocks. Each sub-block is represented by a dedicated DT node, so they
have different compatible strings to distinguish one from another.

For some reason CCU provides the dividers of different types. Some
dividers can be gateable some can't, some are fixed while the others
are variable, some have special divider' limitations, some've got a
non-standard register layout and so on. In order to cover all of these
cases the hardware clocks driver is designed with an info-descriptor
pattern. So there are special static descriptors declared for the
dividers of each type with additional flags describing the block
peculiarity. These descriptors are then used to create hardware clocks
with proper operations.

Some CCU dividers provide a way to reset a domain they generate
a clock for. So the CCU AXI-bus and CCU system devices clock
drivers also perform the reset controller registration.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org

---

Changelog v2:
- Rearrange the SoBs.
- Alter the commit message, since CCU isn't considered as MFD anymore.
- Enable the CCU Divider clock driver by default only if MIPS_BAIKAL_T1
  config.
- Fix spelling in the CCU Dividers kernel config description.
- Replace lock delay and frequency calculation macros with inline functions.
- Replace the data field setter and getter macro with handwritten inliners.
  Alas FIELD_{GET,PREP} can't be used here due to non-constant mask.
- Discard CLK_IGNORE_UNUSED flag setting. It's redundant since CLK_IS_CRITICAL
  is enough for cases when it's appropriate.
- Don't declare private copies of the Common Clock flags. Driver specific flags
  I renamed to "features".
- Comment out the CLK_IS_CRITICAL flag settings.
- Discard !div test in ccu_div_hw_unregister() method.
- Discard ccu_div_get_clk_id() method. Use not-null check instead of FFs-based
  invalid ID value.
- Discard alive probe message.
- Remove "clock-output-names" property support.
- Convert the driver to using syscon regmap instead of direct IO methods,
  since now the PLLs DT node is supposed to be a sub-node of the Baikal-T1
  System Controller node.
- Add DebugFS nodes in RO-mode by default.
---
 drivers/clk/baikal-t1/Kconfig       |  12 +
 drivers/clk/baikal-t1/Makefile      |   1 +
 drivers/clk/baikal-t1/ccu-div.c     | 602 ++++++++++++++++++++++++++++
 drivers/clk/baikal-t1/ccu-div.h     | 110 +++++
 drivers/clk/baikal-t1/clk-ccu-div.c | 487 ++++++++++++++++++++++
 5 files changed, 1212 insertions(+)
 create mode 100644 drivers/clk/baikal-t1/ccu-div.c
 create mode 100644 drivers/clk/baikal-t1/ccu-div.h
 create mode 100644 drivers/clk/baikal-t1/clk-ccu-div.c

diff --git a/drivers/clk/baikal-t1/Kconfig b/drivers/clk/baikal-t1/Kconfig
index 00398ee916dc..03102f1094bc 100644
--- a/drivers/clk/baikal-t1/Kconfig
+++ b/drivers/clk/baikal-t1/Kconfig
@@ -27,4 +27,16 @@ config CLK_BT1_CCU_PLL
 	  CPUs, DDR, etc.) or passed over the clock dividers to be only
 	  then used as an individual reference clock of a target device.
 
+config CLK_BT1_CCU_DIV
+	bool "Baikal-T1 CCU Dividers support"
+	select RESET_CONTROLLER
+	select MFD_SYSCON
+	default MIPS_BAIKAL_T1
+	help
+	  Enable this to support the CCU dividers used to distribute clocks
+	  between AXI-bus and system devices coming from CCU PLLs of Baikal-T1
+	  SoC. CCU dividers can be either configurable or with fixed divider,
+	  either gateable or ungateable. Some of the CCU dividers can be as well
+	  used to reset the domains they're supplying clock to.
+
 endif
diff --git a/drivers/clk/baikal-t1/Makefile b/drivers/clk/baikal-t1/Makefile
index 4a612bbacc37..b3b9590b95ed 100644
--- a/drivers/clk/baikal-t1/Makefile
+++ b/drivers/clk/baikal-t1/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CLK_BT1_CCU_PLL) += ccu-pll.o clk-ccu-pll.o
+obj-$(CONFIG_CLK_BT1_CCU_DIV) += ccu-div.o clk-ccu-div.o
diff --git a/drivers/clk/baikal-t1/ccu-div.c b/drivers/clk/baikal-t1/ccu-div.c
new file mode 100644
index 000000000000..26aae8eec5ec
--- /dev/null
+++ b/drivers/clk/baikal-t1/ccu-div.c
@@ -0,0 +1,602 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+ *
+ * Authors:
+ *   Serge Semin <Sergey.Semin@baikalelectronics.ru>
+ *   Dmitry Dunaev <dmitry.dunaev@baikalelectronics.ru>
+ *
+ * Baikal-T1 CCU Dividers interface driver
+ */
+
+#define pr_fmt(fmt) "bt1-ccu-div: " fmt
+
+#include <linux/kernel.h>
+#include <linux/printk.h>
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/slab.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/spinlock.h>
+#include <linux/regmap.h>
+#include <linux/delay.h>
+#include <linux/time64.h>
+#include <linux/debugfs.h>
+
+#include "ccu-div.h"
+
+#define CCU_DIV_CTL			0x00
+#define CCU_DIV_CTL_EN			BIT(0)
+#define CCU_DIV_CTL_RST			BIT(1)
+#define CCU_DIV_CTL_SET_CLKDIV		BIT(2)
+#define CCU_DIV_CTL_CLKDIV_FLD		4
+#define CCU_DIV_CTL_CLKDIV_MASK(_width) \
+	GENMASK((_width) + CCU_DIV_CTL_CLKDIV_FLD - 1, CCU_DIV_CTL_CLKDIV_FLD)
+#define CCU_DIV_CTL_LOCK_SHIFTED	BIT(27)
+#define CCU_DIV_CTL_LOCK_NORMAL		BIT(31)
+
+#define CCU_DIV_RST_DELAY_US		1
+#define CCU_DIV_LOCK_CHECK_RETRIES	50
+
+#define CCU_DIV_CLKDIV_MIN		0
+#define CCU_DIV_CLKDIV_MAX(_mask) \
+	((_mask) >> CCU_DIV_CTL_CLKDIV_FLD)
+
+/*
+ * Use the next two methods until there are generic field setter and
+ * getter available with non-constant mask support.
+ */
+static inline u32 ccu_div_get(u32 mask, u32 val)
+{
+	return (val & mask) >> CCU_DIV_CTL_CLKDIV_FLD;
+}
+
+static inline u32 ccu_div_prep(u32 mask, u32 val)
+{
+	return (val << CCU_DIV_CTL_CLKDIV_FLD) & mask;
+}
+
+static inline unsigned long ccu_div_lock_delay_ns(unsigned long ref_clk,
+						  unsigned long div)
+{
+	u64 ns = 4ULL * (div ?: 1) * NSEC_PER_SEC;
+
+	do_div(ns, ref_clk);
+
+	return ns;
+}
+
+static inline unsigned long ccu_div_calc_freq(unsigned long ref_clk,
+					      unsigned long div)
+{
+	return ref_clk / (div ?: 1);
+}
+
+static int ccu_div_var_update_clkdiv(struct ccu_div *div,
+				     unsigned long parent_rate,
+				     unsigned long divider)
+{
+	unsigned long nd;
+	u32 val = 0;
+	u32 lock;
+	int count;
+
+	nd = ccu_div_lock_delay_ns(parent_rate, divider);
+
+	if (div->features & CCU_DIV_LOCK_SHIFTED)
+		lock = CCU_DIV_CTL_LOCK_SHIFTED;
+	else
+		lock = CCU_DIV_CTL_LOCK_NORMAL;
+
+	regmap_update_bits(div->sys_regs, div->reg_ctl,
+			   CCU_DIV_CTL_SET_CLKDIV, CCU_DIV_CTL_SET_CLKDIV);
+
+	/*
+	 * Until there is nsec-version of readl_poll_timeout() is available
+	 * we have to implement the next polling loop.
+	 */
+	count = CCU_DIV_LOCK_CHECK_RETRIES;
+	do {
+		ndelay(nd);
+		regmap_read(div->sys_regs, div->reg_ctl, &val);
+		if (val & lock)
+			return 0;
+	} while (--count);
+
+	return -ETIMEDOUT;
+}
+
+static int ccu_div_var_enable(struct clk_hw *hw)
+{
+	struct clk_hw *parent_hw = clk_hw_get_parent(hw);
+	struct ccu_div *div = to_ccu_div(hw);
+	unsigned long flags;
+	u32 val = 0;
+	int ret;
+
+	if (!parent_hw) {
+		pr_err("Can't enable '%s' with no parent", clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	regmap_read(div->sys_regs, div->reg_ctl, &val);
+	if (val & CCU_DIV_CTL_EN)
+		return 0;
+
+	spin_lock_irqsave(&div->lock, flags);
+	ret = ccu_div_var_update_clkdiv(div, clk_hw_get_rate(parent_hw),
+					ccu_div_get(div->mask, val));
+	if (!ret)
+		regmap_update_bits(div->sys_regs, div->reg_ctl,
+				   CCU_DIV_CTL_EN, CCU_DIV_CTL_EN);
+	spin_unlock_irqrestore(&div->lock, flags);
+	if (ret)
+		pr_err("Divider '%s' lock timed out\n", clk_hw_get_name(hw));
+
+	return ret;
+}
+
+static int ccu_div_gate_enable(struct clk_hw *hw)
+{
+	struct ccu_div *div = to_ccu_div(hw);
+	unsigned long flags;
+
+	spin_lock_irqsave(&div->lock, flags);
+	regmap_update_bits(div->sys_regs, div->reg_ctl,
+			   CCU_DIV_CTL_EN, CCU_DIV_CTL_EN);
+	spin_unlock_irqrestore(&div->lock, flags);
+
+	return 0;
+}
+
+static void ccu_div_gate_disable(struct clk_hw *hw)
+{
+	struct ccu_div *div = to_ccu_div(hw);
+	unsigned long flags;
+
+	spin_lock_irqsave(&div->lock, flags);
+	regmap_update_bits(div->sys_regs, div->reg_ctl, CCU_DIV_CTL_EN, 0);
+	spin_unlock_irqrestore(&div->lock, flags);
+}
+
+static int ccu_div_gate_is_enabled(struct clk_hw *hw)
+{
+	struct ccu_div *div = to_ccu_div(hw);
+	u32 val = 0;
+
+	regmap_read(div->sys_regs, div->reg_ctl, &val);
+
+	return !!(val & CCU_DIV_CTL_EN);
+}
+
+static unsigned long ccu_div_var_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	struct ccu_div *div = to_ccu_div(hw);
+	unsigned long divider;
+	u32 val = 0;
+
+	regmap_read(div->sys_regs, div->reg_ctl, &val);
+	divider = ccu_div_get(div->mask, val);
+
+	return ccu_div_calc_freq(parent_rate, divider);
+}
+
+static inline unsigned long ccu_div_var_calc_divider(unsigned long rate,
+						     unsigned long parent_rate,
+						     unsigned int mask)
+{
+	unsigned long divider;
+
+	divider = parent_rate / rate;
+	return clamp_t(unsigned long, divider, CCU_DIV_CLKDIV_MIN,
+		       CCU_DIV_CLKDIV_MAX(mask));
+}
+
+static long ccu_div_var_round_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long *parent_rate)
+{
+	struct ccu_div *div = to_ccu_div(hw);
+	unsigned long divider;
+
+	divider = ccu_div_var_calc_divider(rate, *parent_rate, div->mask);
+
+	return ccu_div_calc_freq(*parent_rate, divider);
+}
+
+/*
+ * This method is used for the clock divider blocks, which support the
+ * on-the-fly rate change. So due to lacking the EN bit functionality
+ * they can't be gated before the rate adjustment.
+ */
+static int ccu_div_var_set_rate_slow(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
+{
+	struct ccu_div *div = to_ccu_div(hw);
+	unsigned long flags, divider;
+	u32 val;
+	int ret;
+
+	divider = ccu_div_var_calc_divider(rate, parent_rate, div->mask);
+	if (divider == 1 && div->features & CCU_DIV_SKIP_ONE) {
+		divider = 0;
+	} else if (div->features & CCU_DIV_SKIP_ONE_TO_THREE) {
+		if (divider == 1 || divider == 2)
+			divider = 0;
+		else if (divider == 3)
+			divider = 4;
+	}
+
+	val = ccu_div_prep(div->mask, divider);
+
+	spin_lock_irqsave(&div->lock, flags);
+	regmap_update_bits(div->sys_regs, div->reg_ctl, div->mask, val);
+	ret = ccu_div_var_update_clkdiv(div, parent_rate, divider);
+	spin_unlock_irqrestore(&div->lock, flags);
+	if (ret)
+		pr_err("Divider '%s' lock timed out\n", clk_hw_get_name(hw));
+
+	return ret;
+}
+
+/*
+ * This method is used for the clock divider blocks, which don't support
+ * the on-the-fly rate change.
+ */
+static int ccu_div_var_set_rate_fast(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
+{
+	struct ccu_div *div = to_ccu_div(hw);
+	unsigned long flags, divider = 1;
+	u32 val;
+
+	divider = ccu_div_var_calc_divider(rate, parent_rate, div->mask);
+	val = ccu_div_prep(div->mask, divider);
+
+	/*
+	 * Also disable the clock divider block if it was enabled by default
+	 * or by the bootloader.
+	 */
+	spin_lock_irqsave(&div->lock, flags);
+	regmap_update_bits(div->sys_regs, div->reg_ctl,
+			   div->mask | CCU_DIV_CTL_EN, val);
+	spin_unlock_irqrestore(&div->lock, flags);
+
+	return 0;
+}
+
+static unsigned long ccu_div_fixed_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct ccu_div *div = to_ccu_div(hw);
+
+	return ccu_div_calc_freq(parent_rate, div->divider);
+}
+
+static long ccu_div_fixed_round_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long *parent_rate)
+{
+	struct ccu_div *div = to_ccu_div(hw);
+
+	return ccu_div_calc_freq(*parent_rate, div->divider);
+}
+
+static int ccu_div_fixed_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	return 0;
+}
+
+int ccu_div_reset_domain(struct ccu_div *div)
+{
+	unsigned long flags;
+
+	if (!div || !(div->features & CCU_DIV_RESET_DOMAIN))
+		return -EINVAL;
+
+	spin_lock_irqsave(&div->lock, flags);
+	regmap_update_bits(div->sys_regs, div->reg_ctl,
+			   CCU_DIV_CTL_RST, CCU_DIV_CTL_RST);
+	spin_unlock_irqrestore(&div->lock, flags);
+
+	/* The next delay must be enough to cover all the resets. */
+	udelay(CCU_DIV_RST_DELAY_US);
+
+	return 0;
+}
+
+#ifdef CONFIG_DEBUG_FS
+
+struct ccu_div_dbgfs_bit {
+	struct ccu_div *div;
+	const char *name;
+	u32 mask;
+};
+
+#define CCU_DIV_DBGFS_BIT_ATTR(_name, _mask) {	\
+		.name = _name,			\
+		.mask = _mask			\
+	}
+
+static const struct ccu_div_dbgfs_bit ccu_div_bits[] = {
+	CCU_DIV_DBGFS_BIT_ATTR("div_en", CCU_DIV_CTL_EN),
+	CCU_DIV_DBGFS_BIT_ATTR("div_rst", CCU_DIV_CTL_RST),
+	CCU_DIV_DBGFS_BIT_ATTR("div_bypass", CCU_DIV_CTL_SET_CLKDIV),
+	CCU_DIV_DBGFS_BIT_ATTR("div_lock", CCU_DIV_CTL_LOCK_NORMAL)
+};
+
+#define CCU_DIV_DBGFS_BIT_NUM	ARRAY_SIZE(ccu_div_bits)
+
+/*
+ * It can be dangerous to change the Divider settings behind clock framework
+ * back, therefore we don't provide any kernel config based compile time option
+ * for this feature to enable.
+ */
+#undef CCU_DIV_ALLOW_WRITE_DEBUGFS
+#ifdef CCU_DIV_ALLOW_WRITE_DEBUGFS
+
+static int ccu_div_dbgfs_bit_set(void *priv, u64 val)
+{
+	const struct ccu_div_dbgfs_bit *bit = priv;
+	struct ccu_div *div = bit->div;
+	unsigned long flags;
+
+	spin_lock_irqsave(&div->lock, flags);
+	regmap_update_bits(div->sys_regs, div->reg_ctl,
+			   bit->mask, val ? bit->mask : 0);
+	spin_unlock_irqrestore(&div->lock, flags);
+
+	return 0;
+}
+
+static int ccu_div_dbgfs_var_clkdiv_set(void *priv, u64 val)
+{
+	struct ccu_div *div = priv;
+	unsigned long flags;
+	u32 data;
+
+	val = clamp_t(u64, val, CCU_DIV_CLKDIV_MIN,
+		      CCU_DIV_CLKDIV_MAX(div->mask));
+	data = ccu_div_prep(div->mask, val);
+
+	spin_lock_irqsave(&div->lock, flags);
+	regmap_update_bits(div->sys_regs, div->reg_ctl, div->mask, data);
+	spin_unlock_irqrestore(&div->lock, flags);
+
+	return 0;
+}
+
+#define ccu_div_dbgfs_mode		0644
+
+#else /* !CCU_DIV_ALLOW_WRITE_DEBUGFS */
+
+#define ccu_div_dbgfs_bit_set		NULL
+#define ccu_div_dbgfs_var_clkdiv_set	NULL
+#define ccu_div_dbgfs_mode		0444
+
+#endif /* !CCU_DIV_ALLOW_WRITE_DEBUGFS */
+
+static int ccu_div_dbgfs_bit_get(void *priv, u64 *val)
+{
+	const struct ccu_div_dbgfs_bit *bit = priv;
+	struct ccu_div *div = bit->div;
+	u32 data = 0;
+
+	regmap_read(div->sys_regs, div->reg_ctl, &data);
+	*val = !!(data & bit->mask);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ccu_div_dbgfs_bit_fops,
+	ccu_div_dbgfs_bit_get, ccu_div_dbgfs_bit_set, "%llu\n");
+
+static int ccu_div_dbgfs_var_clkdiv_get(void *priv, u64 *val)
+{
+	struct ccu_div *div = priv;
+	u32 data = 0;
+
+	regmap_read(div->sys_regs, div->reg_ctl, &data);
+	*val = ccu_div_get(div->mask, data);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ccu_div_dbgfs_var_clkdiv_fops,
+	ccu_div_dbgfs_var_clkdiv_get, ccu_div_dbgfs_var_clkdiv_set, "%llu\n");
+
+static int ccu_div_dbgfs_fixed_clkdiv_get(void *priv, u64 *val)
+{
+	struct ccu_div *div = priv;
+
+	*val = div->divider;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ccu_div_dbgfs_fixed_clkdiv_fops,
+	ccu_div_dbgfs_fixed_clkdiv_get, NULL, "%llu\n");
+
+static void ccu_div_var_debug_init(struct clk_hw *hw, struct dentry *dentry)
+{
+	struct ccu_div *div = to_ccu_div(hw);
+	struct ccu_div_dbgfs_bit *bits;
+	int didx, bidx, num = 2;
+	const char *name;
+
+	num += !!(div->flags & CLK_SET_RATE_GATE) +
+		!!(div->features & CCU_DIV_RESET_DOMAIN);
+
+	bits = kcalloc(num, sizeof(*bits), GFP_KERNEL);
+	if (!bits)
+		return;
+
+	for (didx = 0, bidx = 0; bidx < CCU_DIV_DBGFS_BIT_NUM; ++bidx) {
+		name = ccu_div_bits[bidx].name;
+		if (!(div->flags & CLK_SET_RATE_GATE) &&
+		    !strcmp("div_en", name)) {
+			continue;
+		}
+
+		if (!(div->features & CCU_DIV_RESET_DOMAIN) &&
+		    !strcmp("div_rst", name)) {
+			continue;
+		}
+
+		bits[didx] = ccu_div_bits[bidx];
+		bits[didx].div = div;
+
+		if (div->features & CCU_DIV_LOCK_SHIFTED &&
+		    !strcmp("div_lock", name)) {
+			bits[didx].mask = CCU_DIV_CTL_LOCK_SHIFTED;
+		}
+
+		debugfs_create_file_unsafe(bits[didx].name, ccu_div_dbgfs_mode,
+					   dentry, &bits[didx],
+					   &ccu_div_dbgfs_bit_fops);
+		++didx;
+	}
+
+	debugfs_create_file_unsafe("div_clkdiv", ccu_div_dbgfs_mode, dentry,
+				   div, &ccu_div_dbgfs_var_clkdiv_fops);
+}
+
+static void ccu_div_gate_debug_init(struct clk_hw *hw, struct dentry *dentry)
+{
+	struct ccu_div *div = to_ccu_div(hw);
+	struct ccu_div_dbgfs_bit *bit;
+
+	bit = kmalloc(sizeof(*bit), GFP_KERNEL);
+	if (!bit)
+		return;
+
+	*bit = ccu_div_bits[0];
+	bit->div = div;
+	debugfs_create_file_unsafe(bit->name, ccu_div_dbgfs_mode, dentry, bit,
+				   &ccu_div_dbgfs_bit_fops);
+
+	debugfs_create_file_unsafe("div_clkdiv", 0400, dentry, div,
+				   &ccu_div_dbgfs_fixed_clkdiv_fops);
+}
+
+static void ccu_div_fixed_debug_init(struct clk_hw *hw, struct dentry *dentry)
+{
+	struct ccu_div *div = to_ccu_div(hw);
+
+	debugfs_create_file_unsafe("div_clkdiv", 0400, dentry, div,
+				   &ccu_div_dbgfs_fixed_clkdiv_fops);
+}
+
+#else /* !CONFIG_DEBUG_FS */
+
+#define ccu_div_var_debug_init NULL
+#define ccu_div_gate_debug_init NULL
+#define ccu_div_fixed_debug_init NULL
+
+#endif /* !CONFIG_DEBUG_FS */
+
+static const struct clk_ops ccu_div_var_gate_to_set_ops = {
+	.enable = ccu_div_var_enable,
+	.disable = ccu_div_gate_disable,
+	.is_enabled = ccu_div_gate_is_enabled,
+	.recalc_rate = ccu_div_var_recalc_rate,
+	.round_rate = ccu_div_var_round_rate,
+	.set_rate = ccu_div_var_set_rate_fast,
+	.debug_init = ccu_div_var_debug_init
+};
+
+static const struct clk_ops ccu_div_var_nogate_ops = {
+	.recalc_rate = ccu_div_var_recalc_rate,
+	.round_rate = ccu_div_var_round_rate,
+	.set_rate = ccu_div_var_set_rate_slow,
+	.debug_init = ccu_div_var_debug_init
+};
+
+static const struct clk_ops ccu_div_gate_ops = {
+	.enable = ccu_div_gate_enable,
+	.disable = ccu_div_gate_disable,
+	.is_enabled = ccu_div_gate_is_enabled,
+	.recalc_rate = ccu_div_fixed_recalc_rate,
+	.round_rate = ccu_div_fixed_round_rate,
+	.set_rate = ccu_div_fixed_set_rate,
+	.debug_init = ccu_div_gate_debug_init
+};
+
+static const struct clk_ops ccu_div_fixed_ops = {
+	.recalc_rate = ccu_div_fixed_recalc_rate,
+	.round_rate = ccu_div_fixed_round_rate,
+	.set_rate = ccu_div_fixed_set_rate,
+	.debug_init = ccu_div_fixed_debug_init
+};
+
+struct ccu_div *ccu_div_hw_register(const struct ccu_div_init_data *div_init)
+{
+	struct clk_parent_data parent_data = {0};
+	struct clk_init_data hw_init = {0};
+	struct ccu_div *div;
+	int ret;
+
+	if (!div_init)
+		return ERR_PTR(-EINVAL);
+
+	div = kzalloc(sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return ERR_PTR(-ENOMEM);
+
+	/*
+	 * Note since Baikal-T1 System Controller registers are MMIO-backed
+	 * we won't check the regmap IO operations return status, because it
+	 * must be zero anyway.
+	 */
+	div->hw.init = &hw_init;
+	div->id = div_init->id;
+	div->reg_ctl = div_init->base + CCU_DIV_CTL;
+	div->sys_regs = div_init->sys_regs;
+	div->flags = div_init->flags;
+	div->features = div_init->features;
+	spin_lock_init(&div->lock);
+
+	hw_init.name = div_init->name;
+	hw_init.flags = div_init->flags;
+
+	if (div_init->type == CCU_DIV_VAR) {
+		if (hw_init.flags & CLK_SET_RATE_GATE)
+			hw_init.ops = &ccu_div_var_gate_to_set_ops;
+		else
+			hw_init.ops = &ccu_div_var_nogate_ops;
+		div->mask = CCU_DIV_CTL_CLKDIV_MASK(div_init->width);
+	} else if (div_init->type == CCU_DIV_GATE) {
+		hw_init.ops = &ccu_div_gate_ops;
+		div->divider = div_init->divider;
+	} else if (div_init->type == CCU_DIV_FIXED) {
+		hw_init.ops = &ccu_div_fixed_ops;
+		div->divider = div_init->divider;
+	} else {
+		ret = -EINVAL;
+		goto err_free_div;
+	}
+
+	if (!div_init->parent_name) {
+		ret = -EINVAL;
+		goto err_free_div;
+	}
+	parent_data.fw_name = div_init->parent_name;
+	hw_init.parent_data = &parent_data;
+	hw_init.num_parents = 1;
+
+	ret = of_clk_hw_register(div_init->np, &div->hw);
+	if (ret)
+		goto err_free_div;
+
+	return div;
+
+err_free_div:
+	kfree(div);
+
+	return ERR_PTR(ret);
+}
+
+void ccu_div_hw_unregister(struct ccu_div *div)
+{
+	clk_hw_unregister(&div->hw);
+
+	kfree(div);
+}
diff --git a/drivers/clk/baikal-t1/ccu-div.h b/drivers/clk/baikal-t1/ccu-div.h
new file mode 100644
index 000000000000..795665caefbd
--- /dev/null
+++ b/drivers/clk/baikal-t1/ccu-div.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+ *
+ * Baikal-T1 CCU Dividers interface driver
+ */
+#ifndef __CLK_BT1_CCU_DIV_H__
+#define __CLK_BT1_CCU_DIV_H__
+
+#include <linux/clk-provider.h>
+#include <linux/spinlock.h>
+#include <linux/regmap.h>
+#include <linux/bits.h>
+#include <linux/of.h>
+
+/*
+ * CCU Divider private flags
+ * @CCU_DIV_SKIP_ONE: Due to some reason divider can't be set to 1.
+ *		      It can be 0 though, which is functionally the same.
+ * @CCU_DIV_SKIP_ONE_TO_THREE: For some reason divider can't be within [1,3].
+ *			       It can be either 0 or greater than 3.
+ * @CCU_DIV_LOCK_SHIFTED: Find lock-bit at non-standard position.
+ * @CCU_DIV_RESET_DOMAIN: Provide reset clock domain method.
+ */
+#define CCU_DIV_SKIP_ONE		BIT(1)
+#define CCU_DIV_SKIP_ONE_TO_THREE	BIT(2)
+#define CCU_DIV_LOCK_SHIFTED		BIT(3)
+#define CCU_DIV_RESET_DOMAIN		BIT(4)
+
+/*
+ * enum ccu_div_type - CCU Divider types
+ * @CCU_DIV_VAR: Clocks gate with variable divider.
+ * @CCU_DIV_GATE: Clocks gate with fixed divider.
+ * @CCU_DIV_FIXED: Ungateable clock with fixed divider.
+ */
+enum ccu_div_type {
+	CCU_DIV_VAR,
+	CCU_DIV_GATE,
+	CCU_DIV_FIXED
+};
+
+/*
+ * struct ccu_div_init_data - CCU Divider initialization data
+ * @id: Clocks private identifier.
+ * @name: Clocks name.
+ * @parent_name: Parent clocks name in a fw node.
+ * @base: Divider register base address with respect to the sys_regs base.
+ * @sys_regs: Baikal-T1 System Controller registers map.
+ * @np: Pointer to the node describing the CCU Dividers.
+ * @type: CCU divider type (variable, fixed with and without gate).
+ * @width: Divider width if it's variable.
+ * @divider: Divider fixed value.
+ * @flags: CCU Divider clock flags.
+ * @features: CCU Divider private features.
+ */
+struct ccu_div_init_data {
+	unsigned int id;
+	const char *name;
+	const char *parent_name;
+	unsigned int base;
+	struct regmap *sys_regs;
+	struct device_node *np;
+	enum ccu_div_type type;
+	union {
+		unsigned int width;
+		unsigned int divider;
+	};
+	unsigned long flags;
+	unsigned long features;
+};
+
+/*
+ * struct ccu_div - CCU Divider descriptor
+ * @hw: clk_hw of the divider.
+ * @id: Clock private identifier.
+ * @reg_ctl: Divider control register base address.
+ * @sys_regs: Baikal-T1 System Controller registers map.
+ * @lock: Divider state change spin-lock.
+ * @mask: Divider field mask.
+ * @divider: Divider fixed value.
+ * @flags: Divider clock flags.
+ * @features: CCU Divider private features.
+ */
+struct ccu_div {
+	struct clk_hw hw;
+	unsigned int id;
+	unsigned int reg_ctl;
+	struct regmap *sys_regs;
+	spinlock_t lock;
+	union {
+		u32 mask;
+		unsigned int divider;
+	};
+	unsigned long flags;
+	unsigned long features;
+};
+#define to_ccu_div(_hw) container_of(_hw, struct ccu_div, hw)
+
+static inline struct clk_hw *ccu_div_get_clk_hw(struct ccu_div *div)
+{
+	return div ? &div->hw : NULL;
+}
+
+struct ccu_div *ccu_div_hw_register(const struct ccu_div_init_data *init);
+
+void ccu_div_hw_unregister(struct ccu_div *div);
+
+int ccu_div_reset_domain(struct ccu_div *div);
+
+#endif /* __CLK_BT1_CCU_DIV_H__ */
diff --git a/drivers/clk/baikal-t1/clk-ccu-div.c b/drivers/clk/baikal-t1/clk-ccu-div.c
new file mode 100644
index 000000000000..3931a2d33943
--- /dev/null
+++ b/drivers/clk/baikal-t1/clk-ccu-div.c
@@ -0,0 +1,487 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+ *
+ * Authors:
+ *   Serge Semin <Sergey.Semin@baikalelectronics.ru>
+ *   Dmitry Dunaev <dmitry.dunaev@baikalelectronics.ru>
+ *
+ * Baikal-T1 CCU Dividers clock driver
+ */
+
+#define pr_fmt(fmt) "bt1-ccu-div: " fmt
+
+#include <linux/kernel.h>
+#include <linux/printk.h>
+#include <linux/slab.h>
+#include <linux/clk-provider.h>
+#include <linux/reset-controller.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/ioport.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/bt1-ccu.h>
+#include <dt-bindings/reset/bt1-ccu.h>
+
+#include "ccu-div.h"
+
+#define CCU_AXI_MAIN_BASE		0x030
+#define CCU_AXI_DDR_BASE		0x034
+#define CCU_AXI_SATA_BASE		0x038
+#define CCU_AXI_GMAC0_BASE		0x03C
+#define CCU_AXI_GMAC1_BASE		0x040
+#define CCU_AXI_XGMAC_BASE		0x044
+#define CCU_AXI_PCIE_M_BASE		0x048
+#define CCU_AXI_PCIE_S_BASE		0x04C
+#define CCU_AXI_USB_BASE		0x050
+#define CCU_AXI_HWA_BASE		0x054
+#define CCU_AXI_SRAM_BASE		0x058
+
+#define CCU_SYS_SATA_REF_BASE		0x060
+#define CCU_SYS_APB_BASE		0x064
+#define CCU_SYS_GMAC0_BASE		0x068
+#define CCU_SYS_GMAC1_BASE		0x06C
+#define CCU_SYS_XGMAC_BASE		0x070
+#define CCU_SYS_USB_BASE		0x074
+#define CCU_SYS_PVT_BASE		0x078
+#define CCU_SYS_HWA_BASE		0x07C
+#define CCU_SYS_UART_BASE		0x084
+#define CCU_SYS_TIMER0_BASE		0x088
+#define CCU_SYS_TIMER1_BASE		0x08C
+#define CCU_SYS_TIMER2_BASE		0x090
+#define CCU_SYS_WDT_BASE		0x150
+
+#define CCU_DIV_VAR_INFO(_id, _name, _pname, _base, _width, _flags, _features) \
+	{								\
+		.id = _id,						\
+		.name = _name,						\
+		.parent_name = _pname,					\
+		.base = _base,						\
+		.type = CCU_DIV_VAR,					\
+		.width = _width,					\
+		.flags = _flags,					\
+		.features = _features					\
+	}
+
+#define CCU_DIV_GATE_INFO(_id, _name, _pname, _base, _divider)	\
+	{							\
+		.id = _id,					\
+		.name = _name,					\
+		.parent_name = _pname,				\
+		.base = _base,					\
+		.type = CCU_DIV_GATE,				\
+		.divider = _divider				\
+	}
+
+#define CCU_DIV_FIXED_INFO(_id, _name, _pname, _divider)	\
+	{							\
+		.id = _id,					\
+		.name = _name,					\
+		.parent_name = _pname,				\
+		.type = CCU_DIV_FIXED,				\
+		.divider = _divider				\
+	}
+
+#define CCU_DIV_RST_MAP(_rst_id, _clk_id)	\
+	{					\
+		.rst_id = _rst_id,		\
+		.clk_id = _clk_id		\
+	}
+
+struct ccu_div_info {
+	unsigned int id;
+	const char *name;
+	const char *parent_name;
+	unsigned int base;
+	enum ccu_div_type type;
+	union {
+		unsigned int width;
+		unsigned int divider;
+	};
+	unsigned long flags;
+	unsigned long features;
+};
+
+struct ccu_div_rst_map {
+	unsigned int rst_id;
+	unsigned int clk_id;
+};
+
+struct ccu_div_data {
+	struct device_node *np;
+	struct regmap *sys_regs;
+
+	unsigned int divs_num;
+	const struct ccu_div_info *divs_info;
+	struct ccu_div **divs;
+
+	unsigned int rst_num;
+	const struct ccu_div_rst_map *rst_map;
+	struct reset_controller_dev rcdev;
+};
+#define to_ccu_div_data(_rcdev) container_of(_rcdev, struct ccu_div_data, rcdev)
+
+/*
+ * AXI Main Interconnect (axi_main_clk) and DDR AXI-bus (axi_ddr_clk) clocks
+ * must be left enabled in any case, since former one is responsible for
+ * clocking a bus between CPU cores and the rest of the SoC components, while
+ * the later is clocking the AXI-bus between DDR controller and the Main
+ * Interconnect. So should any of these clocks get to be disabled, the system
+ * will literally stop working. That's why we marked them as critical.
+ */
+static const struct ccu_div_info axi_info[] = {
+	CCU_DIV_VAR_INFO(CCU_AXI_MAIN_CLK, "axi_main_clk", "pcie_clk",
+			 CCU_AXI_MAIN_BASE, 4,
+			 CLK_IS_CRITICAL, CCU_DIV_RESET_DOMAIN),
+	CCU_DIV_VAR_INFO(CCU_AXI_DDR_CLK, "axi_ddr_clk", "sata_clk",
+			 CCU_AXI_DDR_BASE, 4,
+			 CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
+			 CCU_DIV_RESET_DOMAIN),
+	CCU_DIV_VAR_INFO(CCU_AXI_SATA_CLK, "axi_sata_clk", "sata_clk",
+			 CCU_AXI_SATA_BASE, 4,
+			 CLK_SET_RATE_GATE, CCU_DIV_RESET_DOMAIN),
+	CCU_DIV_VAR_INFO(CCU_AXI_GMAC0_CLK, "axi_gmac0_clk", "eth_clk",
+			 CCU_AXI_GMAC0_BASE, 4,
+			 CLK_SET_RATE_GATE, CCU_DIV_RESET_DOMAIN),
+	CCU_DIV_VAR_INFO(CCU_AXI_GMAC1_CLK, "axi_gmac1_clk", "eth_clk",
+			 CCU_AXI_GMAC1_BASE, 4,
+			 CLK_SET_RATE_GATE, CCU_DIV_RESET_DOMAIN),
+	CCU_DIV_VAR_INFO(CCU_AXI_XGMAC_CLK, "axi_xgmac_clk", "eth_clk",
+			 CCU_AXI_XGMAC_BASE, 4,
+			 CLK_SET_RATE_GATE, CCU_DIV_RESET_DOMAIN),
+	CCU_DIV_VAR_INFO(CCU_AXI_PCIE_M_CLK, "axi_pcie_m_clk", "pcie_clk",
+			 CCU_AXI_PCIE_M_BASE, 4,
+			 CLK_SET_RATE_GATE, CCU_DIV_RESET_DOMAIN),
+	CCU_DIV_VAR_INFO(CCU_AXI_PCIE_S_CLK, "axi_pcie_s_clk", "pcie_clk",
+			 CCU_AXI_PCIE_S_BASE, 4,
+			 CLK_SET_RATE_GATE, CCU_DIV_RESET_DOMAIN),
+	CCU_DIV_VAR_INFO(CCU_AXI_USB_CLK, "axi_usb_clk", "sata_clk",
+			 CCU_AXI_USB_BASE, 4,
+			 CLK_SET_RATE_GATE, CCU_DIV_RESET_DOMAIN),
+	CCU_DIV_VAR_INFO(CCU_AXI_HWA_CLK, "axi_hwa_clk", "sata_clk",
+			 CCU_AXI_HWA_BASE, 4,
+			 CLK_SET_RATE_GATE, CCU_DIV_RESET_DOMAIN),
+	CCU_DIV_VAR_INFO(CCU_AXI_SRAM_CLK, "axi_sram_clk", "eth_clk",
+			 CCU_AXI_SRAM_BASE, 4,
+			 CLK_SET_RATE_GATE, CCU_DIV_RESET_DOMAIN)
+};
+
+static const struct ccu_div_rst_map axi_rst_map[] = {
+	CCU_DIV_RST_MAP(CCU_AXI_MAIN_RST, CCU_AXI_MAIN_CLK),
+	CCU_DIV_RST_MAP(CCU_AXI_DDR_RST, CCU_AXI_DDR_CLK),
+	CCU_DIV_RST_MAP(CCU_AXI_SATA_RST, CCU_AXI_SATA_CLK),
+	CCU_DIV_RST_MAP(CCU_AXI_GMAC0_RST, CCU_AXI_GMAC0_CLK),
+	CCU_DIV_RST_MAP(CCU_AXI_GMAC1_RST, CCU_AXI_GMAC1_CLK),
+	CCU_DIV_RST_MAP(CCU_AXI_XGMAC_RST, CCU_AXI_XGMAC_CLK),
+	CCU_DIV_RST_MAP(CCU_AXI_PCIE_M_RST, CCU_AXI_PCIE_M_CLK),
+	CCU_DIV_RST_MAP(CCU_AXI_PCIE_S_RST, CCU_AXI_PCIE_S_CLK),
+	CCU_DIV_RST_MAP(CCU_AXI_USB_RST, CCU_AXI_USB_CLK),
+	CCU_DIV_RST_MAP(CCU_AXI_HWA_RST, CCU_AXI_HWA_CLK),
+	CCU_DIV_RST_MAP(CCU_AXI_SRAM_RST, CCU_AXI_SRAM_CLK)
+};
+
+/*
+ * APB-bus clock is marked as critical since it's a main communication bus
+ * for the SoC devices registers IO-operations.
+ */
+static const struct ccu_div_info sys_info[] = {
+	CCU_DIV_VAR_INFO(CCU_SYS_SATA_REF_CLK, "sys_sata_ref_clk",
+			 "sata_clk", CCU_SYS_SATA_REF_BASE, 4,
+			 CLK_SET_RATE_GATE,
+			 CCU_DIV_SKIP_ONE | CCU_DIV_LOCK_SHIFTED |
+			 CCU_DIV_RESET_DOMAIN),
+	CCU_DIV_VAR_INFO(CCU_SYS_APB_CLK, "sys_apb_clk",
+			 "pcie_clk", CCU_SYS_APB_BASE, 5,
+			 CLK_IS_CRITICAL, CCU_DIV_RESET_DOMAIN),
+	CCU_DIV_GATE_INFO(CCU_SYS_GMAC0_TX_CLK, "sys_gmac0_tx_clk",
+			  "eth_clk", CCU_SYS_GMAC0_BASE, 5),
+	CCU_DIV_FIXED_INFO(CCU_SYS_GMAC0_PTP_CLK, "sys_gmac0_ptp_clk",
+			   "eth_clk", 10),
+	CCU_DIV_GATE_INFO(CCU_SYS_GMAC1_TX_CLK, "sys_gmac1_tx_clk",
+			  "eth_clk", CCU_SYS_GMAC1_BASE, 5),
+	CCU_DIV_FIXED_INFO(CCU_SYS_GMAC1_PTP_CLK, "sys_gmac1_ptp_clk",
+			   "eth_clk", 10),
+	CCU_DIV_GATE_INFO(CCU_SYS_XGMAC_REF_CLK, "sys_xgmac_ref_clk",
+			  "eth_clk", CCU_SYS_XGMAC_BASE, 8),
+	CCU_DIV_FIXED_INFO(CCU_SYS_XGMAC_PTP_CLK, "sys_xgmac_ptp_clk",
+			   "eth_clk", 10),
+	CCU_DIV_GATE_INFO(CCU_SYS_USB_CLK, "sys_usb_clk",
+			  "eth_clk", CCU_SYS_USB_BASE, 10),
+	CCU_DIV_VAR_INFO(CCU_SYS_PVT_CLK, "sys_pvt_clk",
+			 "ref_clk", CCU_SYS_PVT_BASE, 5,
+			 CLK_SET_RATE_GATE, 0),
+	CCU_DIV_VAR_INFO(CCU_SYS_HWA_CLK, "sys_hwa_clk",
+			 "sata_clk", CCU_SYS_HWA_BASE, 4,
+			 CLK_SET_RATE_GATE, 0),
+	CCU_DIV_VAR_INFO(CCU_SYS_UART_CLK, "sys_uart_clk",
+			 "eth_clk", CCU_SYS_UART_BASE, 17,
+			 CLK_SET_RATE_GATE, 0),
+	CCU_DIV_FIXED_INFO(CCU_SYS_I2C1_CLK, "sys_i2c1_clk",
+			   "eth_clk", 10),
+	CCU_DIV_FIXED_INFO(CCU_SYS_I2C2_CLK, "sys_i2c2_clk",
+			   "eth_clk", 10),
+	CCU_DIV_FIXED_INFO(CCU_SYS_GPIO_CLK, "sys_gpio_clk",
+			   "ref_clk", 25),
+	CCU_DIV_VAR_INFO(CCU_SYS_TIMER0_CLK, "sys_timer0_clk",
+			 "ref_clk", CCU_SYS_TIMER0_BASE, 17,
+			 CLK_SET_RATE_GATE, 0),
+	CCU_DIV_VAR_INFO(CCU_SYS_TIMER1_CLK, "sys_timer1_clk",
+			 "ref_clk", CCU_SYS_TIMER1_BASE, 17,
+			 CLK_SET_RATE_GATE, 0),
+	CCU_DIV_VAR_INFO(CCU_SYS_TIMER2_CLK, "sys_timer2_clk",
+			 "ref_clk", CCU_SYS_TIMER2_BASE, 17,
+			 CLK_SET_RATE_GATE, 0),
+	CCU_DIV_VAR_INFO(CCU_SYS_WDT_CLK, "sys_wdt_clk",
+			 "eth_clk", CCU_SYS_WDT_BASE, 17,
+			 CLK_SET_RATE_GATE, CCU_DIV_SKIP_ONE_TO_THREE)
+};
+
+static const struct ccu_div_rst_map sys_rst_map[] = {
+	CCU_DIV_RST_MAP(CCU_SYS_SATA_REF_RST, CCU_SYS_SATA_REF_CLK),
+	CCU_DIV_RST_MAP(CCU_SYS_APB_RST, CCU_SYS_APB_CLK),
+};
+
+static struct ccu_div *ccu_div_find_desc(struct ccu_div_data *data,
+					 unsigned int clk_id)
+{
+	struct ccu_div *div;
+	int idx;
+
+	for (idx = 0; idx < data->divs_num; ++idx) {
+		div = data->divs[idx];
+		if (div && div->id == clk_id)
+			return div;
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int ccu_div_reset(struct reset_controller_dev *rcdev,
+			 unsigned long rst_id)
+{
+	struct ccu_div_data *data = to_ccu_div_data(rcdev);
+	const struct ccu_div_rst_map *map;
+	struct ccu_div *div;
+	int idx, ret;
+
+	for (idx = 0, map = data->rst_map; idx < data->rst_num; ++idx, ++map) {
+		if (map->rst_id == rst_id)
+			break;
+	}
+	if (idx == data->rst_num) {
+		pr_err("Invalid reset ID %lu specified\n", rst_id);
+		return -EINVAL;
+	}
+
+	div = ccu_div_find_desc(data, map->clk_id);
+	if (IS_ERR(div)) {
+		pr_err("Invalid clock ID %d in mapping\n", map->clk_id);
+		return PTR_ERR(div);
+	}
+
+	ret = ccu_div_reset_domain(div);
+	if (ret) {
+		pr_err("Reset isn't supported by divider %s\n",
+			clk_hw_get_name(ccu_div_get_clk_hw(div)));
+	}
+
+	return ret;
+}
+
+static const struct reset_control_ops ccu_div_rst_ops = {
+	.reset = ccu_div_reset,
+};
+
+static struct ccu_div_data *ccu_div_create_data(struct device_node *np)
+{
+	struct ccu_div_data *data;
+	int ret;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+
+	data->np = np;
+	if (of_device_is_compatible(np, "baikal,bt1-ccu-axi")) {
+		data->divs_num = ARRAY_SIZE(axi_info);
+		data->divs_info = axi_info;
+		data->rst_num = ARRAY_SIZE(axi_rst_map);
+		data->rst_map = axi_rst_map;
+	} else if (of_device_is_compatible(np, "baikal,bt1-ccu-sys")) {
+		data->divs_num = ARRAY_SIZE(sys_info);
+		data->divs_info = sys_info;
+		data->rst_num = ARRAY_SIZE(sys_rst_map);
+		data->rst_map = sys_rst_map;
+	} else {
+		pr_err("Uncompatible DT node '%s' specified\n",
+			of_node_full_name(np));
+		ret = -EINVAL;
+		goto err_kfree_data;
+	}
+
+	data->divs = kcalloc(data->divs_num, sizeof(*data->divs), GFP_KERNEL);
+	if (!data->divs) {
+		ret = -ENOMEM;
+		goto err_kfree_data;
+	}
+
+	return data;
+
+err_kfree_data:
+	kfree(data);
+
+	return ERR_PTR(ret);
+}
+
+static void ccu_div_free_data(struct ccu_div_data *data)
+{
+	kfree(data->divs);
+
+	kfree(data);
+}
+
+static int ccu_div_find_sys_regs(struct ccu_div_data *data)
+{
+	data->sys_regs = syscon_node_to_regmap(data->np->parent);
+	if (IS_ERR(data->sys_regs)) {
+		pr_err("Failed to find syscon regs for '%s'\n",
+			of_node_full_name(data->np));
+		return PTR_ERR(data->sys_regs);
+	}
+
+	return 0;
+}
+
+static struct clk_hw *ccu_div_of_clk_hw_get(struct of_phandle_args *clkspec,
+					    void *priv)
+{
+	struct ccu_div_data *data = priv;
+	struct ccu_div *div;
+	unsigned int clk_id;
+
+	clk_id = clkspec->args[0];
+	div = ccu_div_find_desc(data, clk_id);
+	if (IS_ERR(div)) {
+		pr_info("Invalid clock ID %d specified\n", clk_id);
+		return ERR_CAST(div);
+	}
+
+	return ccu_div_get_clk_hw(div);
+}
+
+static int ccu_div_clk_register(struct ccu_div_data *data)
+{
+	int idx, ret;
+
+	for (idx = 0; idx < data->divs_num; ++idx) {
+		const struct ccu_div_info *info = &data->divs_info[idx];
+		struct ccu_div_init_data init = {0};
+
+		init.id = info->id;
+		init.name = info->name;
+		init.parent_name = info->parent_name;
+		init.np = data->np;
+		init.type = info->type;
+		init.flags = info->flags;
+		init.features = info->features;
+
+		if (init.type == CCU_DIV_VAR) {
+			init.base = info->base;
+			init.sys_regs = data->sys_regs;
+			init.width = info->width;
+		} else if (init.type == CCU_DIV_GATE) {
+			init.base = info->base;
+			init.sys_regs = data->sys_regs;
+			init.divider = info->divider;
+		} else {
+			init.divider = info->divider;
+		}
+
+		data->divs[idx] = ccu_div_hw_register(&init);
+		if (IS_ERR(data->divs[idx])) {
+			ret = PTR_ERR(data->divs[idx]);
+			pr_err("Couldn't register divider '%s' hw\n",
+				init.name);
+			goto err_hw_unregister;
+		}
+	}
+
+	ret = of_clk_add_hw_provider(data->np, ccu_div_of_clk_hw_get, data);
+	if (ret) {
+		pr_err("Couldn't register dividers '%s' clock provider\n",
+			of_node_full_name(data->np));
+		goto err_hw_unregister;
+	}
+
+	return 0;
+
+err_hw_unregister:
+	for (--idx; idx >= 0; --idx)
+		ccu_div_hw_unregister(data->divs[idx]);
+
+	return ret;
+}
+
+static void ccu_div_clk_unregister(struct ccu_div_data *data)
+{
+	int idx;
+
+	of_clk_del_provider(data->np);
+
+	for (idx = 0; idx < data->divs_num; ++idx)
+		ccu_div_hw_unregister(data->divs[idx]);
+}
+
+static int ccu_div_rst_register(struct ccu_div_data *data)
+{
+	int ret;
+
+	data->rcdev.ops = &ccu_div_rst_ops;
+	data->rcdev.of_node = data->np;
+	data->rcdev.nr_resets = data->rst_num;
+
+	ret = reset_controller_register(&data->rcdev);
+	if (ret)
+		pr_err("Couldn't register divider '%s' reset controller\n",
+			of_node_full_name(data->np));
+
+	return ret;
+}
+
+static void ccu_div_init(struct device_node *np)
+{
+	struct ccu_div_data *data;
+	int ret;
+
+	data = ccu_div_create_data(np);
+	if (IS_ERR(data))
+		return;
+
+	ret = ccu_div_find_sys_regs(data);
+	if (ret)
+		goto err_free_data;
+
+	ret = ccu_div_clk_register(data);
+	if (ret)
+		goto err_free_data;
+
+	ret = ccu_div_rst_register(data);
+	if (ret)
+		goto err_clk_unregister;
+
+	return;
+
+err_clk_unregister:
+	ccu_div_clk_unregister(data);
+
+err_free_data:
+	ccu_div_free_data(data);
+
+	return;
+}
+
+CLK_OF_DECLARE(ccu_axi, "baikal,bt1-ccu-axi", ccu_div_init);
+CLK_OF_DECLARE(ccu_sys, "baikal,bt1-ccu-sys", ccu_div_init);
-- 
2.26.2


