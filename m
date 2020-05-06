Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9FD1C7D45
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 00:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729654AbgEFWY1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 18:24:27 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:34264 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728888AbgEFWY0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 18:24:26 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 18F74803087C;
        Wed,  6 May 2020 22:24:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FrLyJdpiLxSg; Thu,  7 May 2020 01:24:16 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Tony Xie <tony.xie@rock-chips.com>, Wen He <wen.he_1@nxp.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Joel Stanley <joel@jms.id.au>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
Subject: [PATCH v2 3/4] clk: Add Baikal-T1 CCU PLLs driver
Date:   Thu, 7 May 2020 01:22:59 +0300
Message-ID: <20200506222300.30895-4-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200506222300.30895-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306130053.BCBFC803078F@mail.baikalelectronics.ru>
 <20200506222300.30895-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Baikal-T1 is supposed to be supplied with a high-frequency external
oscillator. But in order to create signals suitable for each IP-block
embedded into the SoC the oscillator output is primarily connected to
a set of CCU PLLs. There are five of them to create clocks for the MIPS
P5600 cores, an embedded DDR controller, SATA, Ethernet and PCIe domains.
The last three domains though named by the biggest system interfaces in
fact include nearly all of the rest SoC peripherals. Each of the PLLs is
based on True Circuits TSMC CLN28HPM IP-core with an interface wrapper
(so called safe PLL' clocks switcher) to simplify the PLL configuration
procedure.

This driver creates the of-based hardware clocks to use them then in
the corresponding subsystems. In order to simplify the driver code we
split the functionality up into the PLLs clocks operations and hardware
clocks declaration/registration procedures.

Even though the PLLs are based on the same IP-core, they may have some
differences. In particular, some CCU PLLs support the output clock change
without gating them (like CPU or PCIe PLLs), while the others don't, some
CCU PLLs are critical and aren't supposed to be gated. In order to cover
all of these cases the hardware clocks driver is designed with an
info-descriptor pattern. So there are special static descriptors declared
for each PLL, which is then used to create a hardware clock with proper
operations. Additionally debugfs-files are provided for each PLL' field
to make sure the implemented rate-PLLs-dividers calculation algorithm is
correct.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org

---

Changelog v2:
- Rearrange the SoBs.
- Don't enable the CCU clock drivers by default for COMPILE_TEST config.
- Make sure the CCU drivers depend on OF kernel config only when built for
  Baikal-T1-based platform.
- Fix spelling in the CCU PLL kernel config description.
- Replace lock delay and frequency calculation macro with inline functions.
- Use 64-bits arithmetics in the PLL output frequency calculation method.
- Use readl_poll_timeout_atomic() to poll the PLL lock state.
- Use FIELD_{GET,PREP}() macro instead of handwritten field setters and
  getters.
- Discard CLK_IGNORE_UNUSED flag setting. It's redundant since CLK_IS_CRITICAL
  is enough for cases when it's appropriate.
- Don't declare private copies of the Common Clock Flags.
- Comment out the CLK_IS_CRITICAL flag settings.
- Discard !pll test in ccu_pll_hw_unregister() method.
- Discard ccu_pll_get_clk_id() method. Use not-null check instead of FFs-
  based invalid ID value.
- Discard alive probe message.
- Remove "clock-output-names" property support.
- Convert the driver to using syscon regmap instead of direct IO methods,
  since now the PLLs DT node is supposed to be a sub-node of the Baikal-T1
  System Controller node.
- Add DebugFS nodes in RO-mode by default.
---
 drivers/clk/Kconfig                 |   1 +
 drivers/clk/Makefile                |   1 +
 drivers/clk/baikal-t1/Kconfig       |  30 ++
 drivers/clk/baikal-t1/Makefile      |   2 +
 drivers/clk/baikal-t1/ccu-pll.c     | 558 ++++++++++++++++++++++++++++
 drivers/clk/baikal-t1/ccu-pll.h     |  64 ++++
 drivers/clk/baikal-t1/clk-ccu-pll.c | 204 ++++++++++
 7 files changed, 860 insertions(+)
 create mode 100644 drivers/clk/baikal-t1/Kconfig
 create mode 100644 drivers/clk/baikal-t1/Makefile
 create mode 100644 drivers/clk/baikal-t1/ccu-pll.c
 create mode 100644 drivers/clk/baikal-t1/ccu-pll.h
 create mode 100644 drivers/clk/baikal-t1/clk-ccu-pll.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index bcb257baed06..b32da34ebcf9 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -341,6 +341,7 @@ config COMMON_CLK_FIXED_MMIO
 
 source "drivers/clk/actions/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
+source "drivers/clk/baikal-t1/Kconfig"
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/imgtec/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index f4169cc2fd31..1496045d4e01 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -75,6 +75,7 @@ obj-y					+= analogbits/
 obj-$(CONFIG_COMMON_CLK_AT91)		+= at91/
 obj-$(CONFIG_ARCH_ARTPEC)		+= axis/
 obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
+obj-$(CONFIG_CLK_BAIKAL_T1)		+= baikal-t1/
 obj-y					+= bcm/
 obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
 obj-$(CONFIG_ARCH_DAVINCI)		+= davinci/
diff --git a/drivers/clk/baikal-t1/Kconfig b/drivers/clk/baikal-t1/Kconfig
new file mode 100644
index 000000000000..e1257af9f49e
--- /dev/null
+++ b/drivers/clk/baikal-t1/Kconfig
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config CLK_BAIKAL_T1
+	bool "Baikal-T1 Clocks Control Unit interface"
+	depends on (MIPS_BAIKAL_T1 && OF) || COMPILE_TEST
+	default MIPS_BAIKAL_T1
+	help
+	  Clocks Control Unit is the core of Baikal-T1 SoC System Controller
+	  responsible for the chip subsystems clocking and resetting. It
+	  consists of multiple global clock domains, which can be reset by
+	  means of the CCU control registers. These domains and devices placed
+	  in them are fed with clocks generated by a hierarchy of PLLs,
+	  configurable and fixed clock dividers. Enable this option to be able
+	  to select Baikal-T1 CCU PLLs and Dividers drivers.
+
+if CLK_BAIKAL_T1
+
+config CLK_BT1_CCU_PLL
+	bool "Baikal-T1 CCU PLLs support"
+	select MFD_SYSCON
+	default MIPS_BAIKAL_T1
+	help
+	  Enable this to support the PLLs embedded into the Baikal-T1 SoC
+	  System Controller. These are five PLLs placed at the root of the
+	  clocks hierarchy, right after an external reference osciallator
+	  (normally of 25MHz). They are used to generate high frequency
+	  signals, which are either directly wired to the consumers (like
+	  CPUs, DDR, etc) or passed over the clock dividers to be only then
+	  used as an individual reference clock of a target device.
+
+endif
diff --git a/drivers/clk/baikal-t1/Makefile b/drivers/clk/baikal-t1/Makefile
new file mode 100644
index 000000000000..4a612bbacc37
--- /dev/null
+++ b/drivers/clk/baikal-t1/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_CLK_BT1_CCU_PLL) += ccu-pll.o clk-ccu-pll.o
diff --git a/drivers/clk/baikal-t1/ccu-pll.c b/drivers/clk/baikal-t1/ccu-pll.c
new file mode 100644
index 000000000000..758393122d2f
--- /dev/null
+++ b/drivers/clk/baikal-t1/ccu-pll.c
@@ -0,0 +1,558 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+ *
+ * Authors:
+ *   Serge Semin <Sergey.Semin@baikalelectronics.ru>
+ *   Dmitry Dunaev <dmitry.dunaev@baikalelectronics.ru>
+ *
+ * Baikal-T1 CCU PLL interface driver
+ */
+
+#define pr_fmt(fmt) "bt1-ccu-pll: " fmt
+
+#include <linux/kernel.h>
+#include <linux/printk.h>
+#include <linux/limits.h>
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/slab.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/spinlock.h>
+#include <linux/regmap.h>
+#include <linux/iopoll.h>
+#include <linux/time64.h>
+#include <linux/rational.h>
+#include <linux/debugfs.h>
+
+#include "ccu-pll.h"
+
+#define CCU_PLL_CTL			0x000
+#define CCU_PLL_CTL_EN			BIT(0)
+#define CCU_PLL_CTL_RST			BIT(1)
+#define CCU_PLL_CTL_CLKR_FLD		2
+#define CCU_PLL_CTL_CLKR_MASK		GENMASK(7, CCU_PLL_CTL_CLKR_FLD)
+#define CCU_PLL_CTL_CLKF_FLD		8
+#define CCU_PLL_CTL_CLKF_MASK		GENMASK(20, CCU_PLL_CTL_CLKF_FLD)
+#define CCU_PLL_CTL_CLKOD_FLD		21
+#define CCU_PLL_CTL_CLKOD_MASK		GENMASK(24, CCU_PLL_CTL_CLKOD_FLD)
+#define CCU_PLL_CTL_BYPASS		BIT(30)
+#define CCU_PLL_CTL_LOCK		BIT(31)
+#define CCU_PLL_CTL1			0x004
+#define CCU_PLL_CTL1_BWADJ_FLD		3
+#define CCU_PLL_CTL1_BWADJ_MASK		GENMASK(14, CCU_PLL_CTL1_BWADJ_FLD)
+
+#define CCU_PLL_LOCK_CHECK_RETRIES	50
+
+#define CCU_PLL_NR_MAX \
+	((CCU_PLL_CTL_CLKR_MASK >> CCU_PLL_CTL_CLKR_FLD) + 1)
+#define CCU_PLL_NF_MAX \
+	((CCU_PLL_CTL_CLKF_MASK >> (CCU_PLL_CTL_CLKF_FLD + 1)) + 1)
+#define CCU_PLL_OD_MAX \
+	((CCU_PLL_CTL_CLKOD_MASK >> CCU_PLL_CTL_CLKOD_FLD) + 1)
+#define CCU_PLL_NB_MAX \
+	((CCU_PLL_CTL1_BWADJ_MASK >> CCU_PLL_CTL1_BWADJ_FLD) + 1)
+#define CCU_PLL_FDIV_MIN		427000UL
+#define CCU_PLL_FDIV_MAX		3500000000UL
+#define CCU_PLL_FOUT_MIN		200000000UL
+#define CCU_PLL_FOUT_MAX		2500000000UL
+#define CCU_PLL_FVCO_MIN		700000000UL
+#define CCU_PLL_FVCO_MAX		3500000000UL
+#define CCU_PLL_CLKOD_FACTOR		2
+
+static inline unsigned long ccu_pll_lock_delay_us(unsigned long ref_clk,
+						  unsigned long nr)
+{
+	u64 us = 500ULL * nr * USEC_PER_SEC;
+
+	do_div(us, ref_clk);
+
+	return us;
+}
+
+static inline unsigned long ccu_pll_calc_freq(unsigned long ref_clk,
+					      unsigned long nr,
+					      unsigned long nf,
+					      unsigned long od)
+{
+	u64 tmp = ref_clk;
+
+	do_div(tmp, nr);
+	tmp *= nf;
+	do_div(tmp, od);
+
+	return tmp;
+}
+
+static int ccu_pll_reset(struct ccu_pll *pll, unsigned long ref_clk,
+			 unsigned long nr)
+{
+	unsigned long ud, ut;
+	u32 val;
+
+	ud = ccu_pll_lock_delay_us(ref_clk, nr);
+	ut = ud * CCU_PLL_LOCK_CHECK_RETRIES;
+
+	regmap_update_bits(pll->sys_regs, pll->reg_ctl,
+			   CCU_PLL_CTL_RST, CCU_PLL_CTL_RST);
+
+	return regmap_read_poll_timeout_atomic(pll->sys_regs, pll->reg_ctl, val,
+					       val & CCU_PLL_CTL_LOCK, ud, ut);
+}
+
+static int ccu_pll_enable(struct clk_hw *hw)
+{
+	struct clk_hw *parent_hw = clk_hw_get_parent(hw);
+	struct ccu_pll *pll = to_ccu_pll(hw);
+	unsigned long flags;
+	u32 val = 0;
+	int ret;
+
+	if (!parent_hw) {
+		pr_err("Can't enable '%s' with no parent", clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	regmap_read(pll->sys_regs, pll->reg_ctl, &val);
+	if (val & CCU_PLL_CTL_EN)
+		return 0;
+
+	spin_lock_irqsave(&pll->lock, flags);
+	regmap_write(pll->sys_regs, pll->reg_ctl, val | CCU_PLL_CTL_EN);
+	ret = ccu_pll_reset(pll, clk_hw_get_rate(parent_hw),
+			    FIELD_GET(CCU_PLL_CTL_CLKR_MASK, val) + 1);
+	spin_unlock_irqrestore(&pll->lock, flags);
+	if (ret)
+		pr_err("PLL '%s' reset timed out\n", clk_hw_get_name(hw));
+
+	return ret;
+}
+
+static void ccu_pll_disable(struct clk_hw *hw)
+{
+	struct ccu_pll *pll = to_ccu_pll(hw);
+	unsigned long flags;
+
+	spin_lock_irqsave(&pll->lock, flags);
+	regmap_update_bits(pll->sys_regs, pll->reg_ctl, CCU_PLL_CTL_EN, 0);
+	spin_unlock_irqrestore(&pll->lock, flags);
+}
+
+static int ccu_pll_is_enabled(struct clk_hw *hw)
+{
+	struct ccu_pll *pll = to_ccu_pll(hw);
+	u32 val = 0;
+
+	regmap_read(pll->sys_regs, pll->reg_ctl, &val);
+
+	return !!(val & CCU_PLL_CTL_EN);
+}
+
+static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct ccu_pll *pll = to_ccu_pll(hw);
+	unsigned long nr, nf, od;
+	u32 val = 0;
+
+	regmap_read(pll->sys_regs, pll->reg_ctl, &val);
+	nr = FIELD_GET(CCU_PLL_CTL_CLKR_MASK, val) + 1;
+	nf = FIELD_GET(CCU_PLL_CTL_CLKF_MASK, val) + 1;
+	od = FIELD_GET(CCU_PLL_CTL_CLKOD_MASK, val) + 1;
+
+	return ccu_pll_calc_freq(parent_rate, nr, nf, od);
+}
+
+static void ccu_pll_calc_factors(unsigned long rate, unsigned long parent_rate,
+				 unsigned long *nr, unsigned long *nf,
+				 unsigned long *od)
+{
+	unsigned long err, freq, min_err = ULONG_MAX;
+	unsigned long num, denom, n1, d1, nri;
+	unsigned long nr_max, nf_max, od_max;
+
+	/*
+	 * Make sure PLL is working with valid input signal (Fdiv). If
+	 * you want to speed the function up just reduce CCU_PLL_NR_MAX.
+	 * This will cause a worse approximation though.
+	 */
+	nri = (parent_rate / CCU_PLL_FDIV_MAX) + 1;
+	nr_max = min(parent_rate / CCU_PLL_FDIV_MIN, CCU_PLL_NR_MAX);
+
+	/*
+	 * Find a closest [nr;nf;od] vector taking into account the
+	 * limitations like: 1) 700MHz <= Fvco <= 3.5GHz, 2) PLL Od is
+	 * either 1 or even number within the acceptable range (alas 1s
+	 * is also excluded by the next loop).
+	 */
+	for (; nri <= nr_max; ++nri) {
+		/* Use Od factor to fulfill the limitation 2). */
+		num = CCU_PLL_CLKOD_FACTOR * rate;
+		denom = parent_rate / nri;
+
+		/*
+		 * Make sure Fvco is within the acceptable range to fulfill
+		 * the condition 1). Note due to the CCU_PLL_CLKOD_FACTOR value
+		 * the actual upper limit is also divided by that factor.
+		 * It's not big problem for us since practically there is no
+		 * need in clocks with that high frequency.
+		 */
+		nf_max = min(CCU_PLL_FVCO_MAX / denom, CCU_PLL_NF_MAX);
+		od_max = CCU_PLL_OD_MAX / CCU_PLL_CLKOD_FACTOR;
+
+		/*
+		 * Bypass the out-of-bound values, which can't be properly
+		 * handled by the rational fraction approximation algorithm.
+		 */
+		if (num / denom >= nf_max) {
+			n1 = nf_max;
+			d1 = 1;
+		} else if (denom / num >= od_max) {
+			n1 = 1;
+			d1 = od_max;
+		} else {
+			rational_best_approximation(num, denom, nf_max, od_max,
+						    &n1, &d1);
+		}
+
+		/* Select the best approximation of the target rate. */
+		freq = ccu_pll_calc_freq(parent_rate, nri, n1, d1);
+		err = abs((int64_t)freq - num);
+		if (err < min_err) {
+			min_err = err;
+			*nr = nri;
+			*nf = n1;
+			*od = CCU_PLL_CLKOD_FACTOR * d1;
+		}
+	}
+}
+
+static long ccu_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *parent_rate)
+{
+	unsigned long nr = 1, nf = 1, od = 1;
+
+	ccu_pll_calc_factors(rate, *parent_rate, &nr, &nf, &od);
+
+	return ccu_pll_calc_freq(*parent_rate, nr, nf, od);
+}
+
+/*
+ * This method is used for PLLs, which support the on-the-fly dividers
+ * adjustment. So there is no need in gating such clocks.
+ */
+static int ccu_pll_set_rate_reset(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct ccu_pll *pll = to_ccu_pll(hw);
+	unsigned long nr, nf, od;
+	unsigned long flags;
+	u32 mask, val;
+	int ret;
+
+	ccu_pll_calc_factors(rate, parent_rate, &nr, &nf, &od);
+
+	mask = CCU_PLL_CTL_CLKR_MASK | CCU_PLL_CTL_CLKF_MASK |
+	       CCU_PLL_CTL_CLKOD_MASK;
+	val = FIELD_PREP(CCU_PLL_CTL_CLKR_MASK, nr - 1) |
+	      FIELD_PREP(CCU_PLL_CTL_CLKF_MASK, nf - 1) |
+	      FIELD_PREP(CCU_PLL_CTL_CLKOD_MASK, od - 1);
+
+	spin_lock_irqsave(&pll->lock, flags);
+	regmap_update_bits(pll->sys_regs, pll->reg_ctl, mask, val);
+	ret = ccu_pll_reset(pll, parent_rate, nr);
+	spin_unlock_irqrestore(&pll->lock, flags);
+	if (ret)
+		pr_err("PLL '%s' reset timed out\n", clk_hw_get_name(hw));
+
+	return ret;
+}
+
+/*
+ * This method is used for PLLs, which don't support the on-the-fly dividers
+ * adjustment. So the corresponding clocks are supposed to be gated first.
+ */
+static int ccu_pll_set_rate_norst(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct ccu_pll *pll = to_ccu_pll(hw);
+	unsigned long nr, nf, od;
+	unsigned long flags;
+	u32 mask, val;
+
+	ccu_pll_calc_factors(rate, parent_rate, &nr, &nf, &od);
+
+	/*
+	 * Disable PLL if it was enabled by default or left enabled by the
+	 * system bootloader.
+	 */
+	mask = CCU_PLL_CTL_CLKR_MASK | CCU_PLL_CTL_CLKF_MASK |
+	       CCU_PLL_CTL_CLKOD_MASK | CCU_PLL_CTL_EN;
+	val = FIELD_PREP(CCU_PLL_CTL_CLKR_MASK, nr - 1) |
+	      FIELD_PREP(CCU_PLL_CTL_CLKF_MASK, nf - 1) |
+	      FIELD_PREP(CCU_PLL_CTL_CLKOD_MASK, od - 1);
+
+	spin_lock_irqsave(&pll->lock, flags);
+	regmap_update_bits(pll->sys_regs, pll->reg_ctl, mask, val);
+	spin_unlock_irqrestore(&pll->lock, flags);
+
+	return 0;
+}
+
+#ifdef CONFIG_DEBUG_FS
+
+struct ccu_pll_dbgfs_bit {
+	struct ccu_pll *pll;
+	const char *name;
+	unsigned int reg;
+	u32 mask;
+};
+
+struct ccu_pll_dbgfs_fld {
+	struct ccu_pll *pll;
+	const char *name;
+	unsigned int reg;
+	unsigned int lsb;
+	u32 mask;
+	u32 min;
+	u32 max;
+};
+
+#define CCU_PLL_DBGFS_BIT_ATTR(_name, _reg, _mask)	\
+	{						\
+		.name = _name,				\
+		.reg = _reg,				\
+		.mask = _mask				\
+	}
+
+#define CCU_PLL_DBGFS_FLD_ATTR(_name, _reg, _lsb, _mask, _min, _max)	\
+	{								\
+		.name = _name,						\
+		.reg = _reg,						\
+		.lsb = _lsb,						\
+		.mask = _mask,						\
+		.min = _min,						\
+		.max = _max						\
+	}
+
+static const struct ccu_pll_dbgfs_bit ccu_pll_bits[] = {
+	CCU_PLL_DBGFS_BIT_ATTR("pll_en", CCU_PLL_CTL, CCU_PLL_CTL_EN),
+	CCU_PLL_DBGFS_BIT_ATTR("pll_rst", CCU_PLL_CTL, CCU_PLL_CTL_RST),
+	CCU_PLL_DBGFS_BIT_ATTR("pll_bypass", CCU_PLL_CTL, CCU_PLL_CTL_BYPASS),
+	CCU_PLL_DBGFS_BIT_ATTR("pll_lock", CCU_PLL_CTL, CCU_PLL_CTL_LOCK)
+};
+
+#define CCU_PLL_DBGFS_BIT_NUM	ARRAY_SIZE(ccu_pll_bits)
+
+static const struct ccu_pll_dbgfs_fld ccu_pll_flds[] = {
+	CCU_PLL_DBGFS_FLD_ATTR("pll_nr", CCU_PLL_CTL, CCU_PLL_CTL_CLKR_FLD,
+				CCU_PLL_CTL_CLKR_MASK, 1, CCU_PLL_NR_MAX),
+	CCU_PLL_DBGFS_FLD_ATTR("pll_nf", CCU_PLL_CTL, CCU_PLL_CTL_CLKF_FLD,
+				CCU_PLL_CTL_CLKF_MASK, 1, CCU_PLL_NF_MAX),
+	CCU_PLL_DBGFS_FLD_ATTR("pll_od", CCU_PLL_CTL, CCU_PLL_CTL_CLKOD_FLD,
+				CCU_PLL_CTL_CLKOD_MASK, 1, CCU_PLL_OD_MAX),
+	CCU_PLL_DBGFS_FLD_ATTR("pll_nb", CCU_PLL_CTL1, CCU_PLL_CTL1_BWADJ_FLD,
+				CCU_PLL_CTL1_BWADJ_MASK, 1, CCU_PLL_NB_MAX)
+};
+
+#define CCU_PLL_DBGFS_FLD_NUM	ARRAY_SIZE(ccu_pll_flds)
+
+/*
+ * It can be dangerous to change the PLL settings behind clock framework back,
+ * therefore we don't provide any kernel config based compile time option for
+ * this feature to enable.
+ */
+#undef CCU_PLL_ALLOW_WRITE_DEBUGFS
+#ifdef CCU_PLL_ALLOW_WRITE_DEBUGFS
+
+static int ccu_pll_dbgfs_bit_set(void *priv, u64 val)
+{
+	const struct ccu_pll_dbgfs_bit *bit = priv;
+	struct ccu_pll *pll = bit->pll;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pll->lock, flags);
+	regmap_update_bits(pll->sys_regs, pll->reg_ctl + bit->reg,
+			   bit->mask, val ? bit->mask : 0);
+	spin_unlock_irqrestore(&pll->lock, flags);
+
+	return 0;
+}
+
+static int ccu_pll_dbgfs_fld_set(void *priv, u64 val)
+{
+	struct ccu_pll_dbgfs_fld *fld = priv;
+	struct ccu_pll *pll = fld->pll;
+	unsigned long flags;
+	u32 data;
+
+	val = clamp_t(u64, val, fld->min, fld->max);
+	data = ((val - 1) << fld->lsb) & fld->mask;
+
+	spin_lock_irqsave(&pll->lock, flags);
+	regmap_update_bits(pll->sys_regs, pll->reg_ctl + fld->reg, fld->mask,
+			   data);
+	spin_unlock_irqrestore(&pll->lock, flags);
+
+	return 0;
+}
+
+#define ccu_pll_dbgfs_mode	0644
+
+#else /* !CCU_PLL_ALLOW_WRITE_DEBUGFS */
+
+#define ccu_pll_dbgfs_bit_set	NULL
+#define ccu_pll_dbgfs_fld_set	NULL
+#define ccu_pll_dbgfs_mode	0444
+
+#endif /* !CCU_PLL_ALLOW_WRITE_DEBUGFS */
+
+static int ccu_pll_dbgfs_bit_get(void *priv, u64 *val)
+{
+	struct ccu_pll_dbgfs_bit *bit = priv;
+	struct ccu_pll *pll = bit->pll;
+	u32 data = 0;
+
+	regmap_read(pll->sys_regs, pll->reg_ctl + bit->reg, &data);
+	*val = !!(data & bit->mask);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ccu_pll_dbgfs_bit_fops,
+	ccu_pll_dbgfs_bit_get, ccu_pll_dbgfs_bit_set, "%llu\n");
+
+static int ccu_pll_dbgfs_fld_get(void *priv, u64 *val)
+{
+	struct ccu_pll_dbgfs_fld *fld = priv;
+	struct ccu_pll *pll = fld->pll;
+	u32 data = 0;
+
+	regmap_read(pll->sys_regs, pll->reg_ctl + fld->reg, &data);
+	*val = ((data & fld->mask) >> fld->lsb) + 1;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ccu_pll_dbgfs_fld_fops,
+	ccu_pll_dbgfs_fld_get, ccu_pll_dbgfs_fld_set, "%llu\n");
+
+static void ccu_pll_debug_init(struct clk_hw *hw, struct dentry *dentry)
+{
+	struct ccu_pll *pll = to_ccu_pll(hw);
+	struct ccu_pll_dbgfs_bit *bits;
+	struct ccu_pll_dbgfs_fld *flds;
+	int idx;
+
+	bits = kcalloc(CCU_PLL_DBGFS_BIT_NUM, sizeof(*bits), GFP_KERNEL);
+	if (!bits)
+		return;
+
+	for (idx = 0; idx < CCU_PLL_DBGFS_BIT_NUM; ++idx) {
+		bits[idx] = ccu_pll_bits[idx];
+		bits[idx].pll = pll;
+
+		debugfs_create_file_unsafe(bits[idx].name, ccu_pll_dbgfs_mode,
+					   dentry, &bits[idx],
+					   &ccu_pll_dbgfs_bit_fops);
+	}
+
+	flds = kcalloc(CCU_PLL_DBGFS_FLD_NUM, sizeof(*flds), GFP_KERNEL);
+	if (!flds)
+		return;
+
+	for (idx = 0; idx < CCU_PLL_DBGFS_FLD_NUM; ++idx) {
+		flds[idx] = ccu_pll_flds[idx];
+		flds[idx].pll = pll;
+
+		debugfs_create_file_unsafe(flds[idx].name, ccu_pll_dbgfs_mode,
+					   dentry, &flds[idx],
+					   &ccu_pll_dbgfs_fld_fops);
+	}
+}
+
+#else /* !CONFIG_DEBUG_FS */
+
+#define ccu_pll_debug_init NULL
+
+#endif /* !CONFIG_DEBUG_FS */
+
+static const struct clk_ops ccu_pll_gate_to_set_ops = {
+	.enable = ccu_pll_enable,
+	.disable = ccu_pll_disable,
+	.is_enabled = ccu_pll_is_enabled,
+	.recalc_rate = ccu_pll_recalc_rate,
+	.round_rate = ccu_pll_round_rate,
+	.set_rate = ccu_pll_set_rate_norst,
+	.debug_init = ccu_pll_debug_init
+};
+
+static const struct clk_ops ccu_pll_straight_set_ops = {
+	.enable = ccu_pll_enable,
+	.disable = ccu_pll_disable,
+	.is_enabled = ccu_pll_is_enabled,
+	.recalc_rate = ccu_pll_recalc_rate,
+	.round_rate = ccu_pll_round_rate,
+	.set_rate = ccu_pll_set_rate_reset,
+	.debug_init = ccu_pll_debug_init
+};
+
+struct ccu_pll *ccu_pll_hw_register(const struct ccu_pll_init_data *pll_init)
+{
+	struct clk_parent_data parent_data = {0};
+	struct clk_init_data hw_init = {0};
+	struct ccu_pll *pll;
+	int ret;
+
+	if (!pll_init)
+		return ERR_PTR(-EINVAL);
+
+	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	/*
+	 * Note since Baikal-T1 System Controller registers are MMIO-backed
+	 * we won't check the regmap IO operations return status, because it
+	 * must be zero anyway.
+	 */
+	pll->hw.init = &hw_init;
+	pll->reg_ctl = pll_init->base + CCU_PLL_CTL;
+	pll->reg_ctl1 = pll_init->base + CCU_PLL_CTL1;
+	pll->sys_regs = pll_init->sys_regs;
+	pll->id = pll_init->id;
+	spin_lock_init(&pll->lock);
+
+	hw_init.name = pll_init->name;
+	hw_init.flags = pll_init->flags;
+
+	if (hw_init.flags & CLK_SET_RATE_GATE)
+		hw_init.ops = &ccu_pll_gate_to_set_ops;
+	else
+		hw_init.ops = &ccu_pll_straight_set_ops;
+
+	if (!pll_init->parent_name) {
+		ret = -EINVAL;
+		goto err_free_pll;
+	}
+	parent_data.fw_name = pll_init->parent_name;
+	hw_init.parent_data = &parent_data;
+	hw_init.num_parents = 1;
+
+	ret = of_clk_hw_register(pll_init->np, &pll->hw);
+	if (ret)
+		goto err_free_pll;
+
+	return pll;
+
+err_free_pll:
+	kfree(pll);
+
+	return ERR_PTR(ret);
+}
+
+void ccu_pll_hw_unregister(struct ccu_pll *pll)
+{
+	clk_hw_unregister(&pll->hw);
+
+	kfree(pll);
+}
diff --git a/drivers/clk/baikal-t1/ccu-pll.h b/drivers/clk/baikal-t1/ccu-pll.h
new file mode 100644
index 000000000000..76cd9132a219
--- /dev/null
+++ b/drivers/clk/baikal-t1/ccu-pll.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+ *
+ * Baikal-T1 CCU PLL interface driver
+ */
+#ifndef __CLK_BT1_CCU_PLL_H__
+#define __CLK_BT1_CCU_PLL_H__
+
+#include <linux/clk-provider.h>
+#include <linux/spinlock.h>
+#include <linux/regmap.h>
+#include <linux/bits.h>
+#include <linux/of.h>
+
+/*
+ * struct ccu_pll_init_data - CCU PLL initialization data
+ * @id: Clock private identifier.
+ * @name: Clocks name.
+ * @parent_name: Clocks parent name in a fw node.
+ * @base: PLL registers base address with respect to the sys_regs base.
+ * @sys_regs: Baikal-T1 System Controller registers map.
+ * @np: Pointer to the node describing the CCU PLLs.
+ * @flags: PLL clock flags.
+ */
+struct ccu_pll_init_data {
+	unsigned int id;
+	const char *name;
+	const char *parent_name;
+	unsigned int base;
+	struct regmap *sys_regs;
+	struct device_node *np;
+	unsigned long flags;
+};
+
+/*
+ * struct ccu_pll - CCU PLL descriptor
+ * @hw: clk_hw of the PLL.
+ * @id: Clock private identifier.
+ * @reg_ctl: PLL control register base.
+ * @reg_ctl1: PLL control1 register base.
+ * @sys_regs: Baikal-T1 System Controller registers map.
+ * @lock: PLL state change spin-lock.
+ */
+struct ccu_pll {
+	struct clk_hw hw;
+	unsigned int id;
+	unsigned int reg_ctl;
+	unsigned int reg_ctl1;
+	struct regmap *sys_regs;
+	spinlock_t lock;
+};
+#define to_ccu_pll(_hw) container_of(_hw, struct ccu_pll, hw)
+
+static inline struct clk_hw *ccu_pll_get_clk_hw(struct ccu_pll *pll)
+{
+	return pll ? &pll->hw : NULL;
+}
+
+struct ccu_pll *ccu_pll_hw_register(const struct ccu_pll_init_data *init);
+
+void ccu_pll_hw_unregister(struct ccu_pll *pll);
+
+#endif /* __CLK_BT1_CCU_PLL_H__ */
diff --git a/drivers/clk/baikal-t1/clk-ccu-pll.c b/drivers/clk/baikal-t1/clk-ccu-pll.c
new file mode 100644
index 000000000000..1eec8c0b8f50
--- /dev/null
+++ b/drivers/clk/baikal-t1/clk-ccu-pll.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+ *
+ * Authors:
+ *   Serge Semin <Sergey.Semin@baikalelectronics.ru>
+ *   Dmitry Dunaev <dmitry.dunaev@baikalelectronics.ru>
+ *
+ * Baikal-T1 CCU PLL clocks driver
+ */
+
+#define pr_fmt(fmt) "bt1-ccu-pll: " fmt
+
+#include <linux/kernel.h>
+#include <linux/printk.h>
+#include <linux/slab.h>
+#include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/ioport.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/bt1-ccu.h>
+
+#include "ccu-pll.h"
+
+#define CCU_CPU_PLL_BASE		0x000
+#define CCU_SATA_PLL_BASE		0x008
+#define CCU_DDR_PLL_BASE		0x010
+#define CCU_PCIE_PLL_BASE		0x018
+#define CCU_ETH_PLL_BASE		0x020
+
+#define CCU_PLL_INFO(_id, _name, _pname, _base, _flags)	\
+	{						\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _pname,			\
+		.base = _base,				\
+		.flags = _flags				\
+	}
+
+#define CCU_PLL_NUM			ARRAY_SIZE(pll_info)
+
+struct ccu_pll_info {
+	unsigned int id;
+	const char *name;
+	const char *parent_name;
+	unsigned int base;
+	unsigned long flags;
+};
+
+/*
+ * Mark as critical all PLLs except Ethernet one. CPU and DDR PLLs are sources
+ * of CPU cores and DDR controller reference clocks, due to which they
+ * obviously shouldn't be ever gated. SATA and PCIe PLLs are the parents of
+ * APB-bus and DDR controller AXI-bus clocks. If they are gated the system will
+ * be unusable.
+ */
+static const struct ccu_pll_info pll_info[] = {
+	CCU_PLL_INFO(CCU_CPU_PLL, "cpu_pll", "ref_clk", CCU_CPU_PLL_BASE,
+		     CLK_IS_CRITICAL),
+	CCU_PLL_INFO(CCU_SATA_PLL, "sata_pll", "ref_clk", CCU_SATA_PLL_BASE,
+		     CLK_IS_CRITICAL | CLK_SET_RATE_GATE),
+	CCU_PLL_INFO(CCU_DDR_PLL, "ddr_pll", "ref_clk", CCU_DDR_PLL_BASE,
+		     CLK_IS_CRITICAL | CLK_SET_RATE_GATE),
+	CCU_PLL_INFO(CCU_PCIE_PLL, "pcie_pll", "ref_clk", CCU_PCIE_PLL_BASE,
+		     CLK_IS_CRITICAL),
+	CCU_PLL_INFO(CCU_ETH_PLL, "eth_pll", "ref_clk", CCU_ETH_PLL_BASE,
+		     CLK_SET_RATE_GATE)
+};
+
+struct ccu_pll_data {
+	struct device_node *np;
+	struct regmap *sys_regs;
+	struct ccu_pll *plls[CCU_PLL_NUM];
+};
+
+static struct ccu_pll *ccu_pll_find_desc(struct ccu_pll_data *data,
+					 unsigned int clk_id)
+{
+	struct ccu_pll *pll;
+	int idx;
+
+	for (idx = 0; idx < CCU_PLL_NUM; ++idx) {
+		pll = data->plls[idx];
+		if (pll && pll->id == clk_id)
+			return pll;
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
+static struct ccu_pll_data *ccu_pll_create_data(struct device_node *np)
+{
+	struct ccu_pll_data *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+
+	data->np = np;
+
+	return data;
+}
+
+static void ccu_pll_free_data(struct ccu_pll_data *data)
+{
+	kfree(data);
+}
+
+static int ccu_pll_find_sys_regs(struct ccu_pll_data *data)
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
+static struct clk_hw *ccu_pll_of_clk_hw_get(struct of_phandle_args *clkspec,
+					    void *priv)
+{
+	struct ccu_pll_data *data = priv;
+	struct ccu_pll *pll;
+	unsigned int clk_id;
+
+	clk_id = clkspec->args[0];
+	pll = ccu_pll_find_desc(data, clk_id);
+	if (IS_ERR(pll)) {
+		pr_info("Invalid PLL clock ID %d specified\n", clk_id);
+		return ERR_CAST(pll);
+	}
+
+	return ccu_pll_get_clk_hw(pll);
+}
+
+static int ccu_pll_clk_register(struct ccu_pll_data *data)
+{
+	int idx, ret;
+
+	for (idx = 0; idx < CCU_PLL_NUM; ++idx) {
+		const struct ccu_pll_info *info = &pll_info[idx];
+		struct ccu_pll_init_data init = {0};
+
+		init.id = info->id;
+		init.name = info->name;
+		init.parent_name = info->parent_name;
+		init.base = info->base;
+		init.sys_regs = data->sys_regs;
+		init.np = data->np;
+		init.flags = info->flags;
+
+		data->plls[idx] = ccu_pll_hw_register(&init);
+		if (IS_ERR(data->plls[idx])) {
+			ret = PTR_ERR(data->plls[idx]);
+			pr_err("Couldn't register PLL hw '%s'\n",
+				init.name);
+			goto err_hw_unregister;
+		}
+	}
+
+	ret = of_clk_add_hw_provider(data->np, ccu_pll_of_clk_hw_get, data);
+	if (ret) {
+		pr_err("Couldn't register PLL provider of '%s'\n",
+			of_node_full_name(data->np));
+		goto err_hw_unregister;
+	}
+
+	return 0;
+
+err_hw_unregister:
+	for (--idx; idx >= 0; --idx)
+		ccu_pll_hw_unregister(data->plls[idx]);
+
+	return ret;
+}
+
+static __init void ccu_pll_init(struct device_node *np)
+{
+	struct ccu_pll_data *data;
+	int ret;
+
+	data = ccu_pll_create_data(np);
+	if (IS_ERR(data))
+		return;
+
+	ret = ccu_pll_find_sys_regs(data);
+	if (ret)
+		goto err_free_data;
+
+	ret = ccu_pll_clk_register(data);
+	if (ret)
+		goto err_free_data;
+
+	return;
+
+err_free_data:
+	ccu_pll_free_data(data);
+}
+CLK_OF_DECLARE(ccu_pll, "baikal,bt1-ccu-pll", ccu_pll_init);
-- 
2.25.1

