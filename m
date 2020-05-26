Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0006A1A3175
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 11:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbgDIJCx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 05:02:53 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:47445 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgDIJCx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 05:02:53 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N9Mh8-1jGjxi1CFg-015Llz; Thu, 09 Apr 2020 11:02:38 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     sboyd@kernel.org, jiaxun.yang@flygoat.com,
        linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        chenhc@lemote.com, Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        mturquette@baylibre.com, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] mips: loongsoon2ef: remove private clk api
Date:   Thu,  9 Apr 2020 11:02:28 +0200
Message-Id: <20200409090228.2241176-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200409064416.83340-1-sboyd@kernel.org>
References: <20200409064416.83340-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+262q9UA77aJWFHjKmxZSa0iY5GOcX0ILth/tpOhPziL0YwsuY4
 8fdhwju4nCRPdhxtQaF8nAF2oJnQs/Jpav/bcbTC/nPZ8fp7eMHtj3LbvnySELs9CC/BmPJ
 lTBfWXbC2tEZqfWDjCxc4SE75hTZY1X2poo/lRh3qg793jq9KkMhGTSSLeK10EyPK15nBFZ
 UzXVp03Etnc0wTa9MIfVA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:X/PMLhjxSe0=:roICuxUE8MhuZKW+fwvAlC
 JvAow4r4MlAl0tFAVvxX5TUUF4owyfDYsQPigU/eELySQjak71KpEx6/leLe6fSIX4dclO2rJ
 Wi0iT1H37SKwO7JXuEbdiL0De/ATGvyAo1K3qmypZ+IxOno00dht8CdaH1nELlWMh42swZMlU
 LdMi1MMoBkUHwTBuQ7Xi9xTbQe+yedPwSYtnYLyG/o7C/W7dygu/ww+vrKxlm/Sz+1WrgPaJk
 yknzx2vt0GLkWHFvhxlLMdTzt7uFyR8KtkGTAOz1ij4N1ikEageT1aMBvxz3aiSUef2KCA5ae
 PrNKwW8yvySzsBpHOC96iAj9yk58r8QuetPo/fmjOHiVCMrs588lkNPnk5WOlWwXfilGU9ktE
 nARDtpRvovXf92Yu06bN8wLykcUHr/eDyezGQOHRu8fb5tlCQaJHZYNJ7rZUd6s1j5nJGGDv1
 7w68L8qcG4+bEW3MfJUrY7AwAcu4flmaWdzW3Ou1JLCxZOVTKU/Ja6W4arwiCobgaFIgHG7qs
 JvUQZEb63sPppPuGpoVX/xzt9ObvL240onMVBTd7tWJnl51GGEZiYmniBR7JtZzCu4hibuXbC
 H3EhCD9rS10XAeJiF8Jn22aOU9K0Er/jBspTR5NL2GxyhecXpuwekyhMRk13bYqdu4bnibvWE
 FbSkB18ViZfxkkWQFmzQdvq8ivgHIPev7MhZjwVl5Ov2NCx+HRWQFAGMhNLcFQbrhF9znb7mU
 tigmkvgon9cqDXxBl2nhrQuTozWxHvWtgEg9a3wY2FNo/wL9d+nM7Y5c5nJrWtCO0/36XsnSL
 5td0e+gqBIYCDbUmOMCjsgmA5DKfFOV38ZMb3d477X6cxkkLxA=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As platforms are moving to COMMON_CLK in general, loongson2ef
stuck out as something that has a private implementation but
does not actually use it except for setting the frequency of
the CPU itself from the loongson2_cpufreq driver.

Change that driver to call the register setting function directly
and remove the rest of the stub implementation.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/include/asm/clock.h                 | 49 ----------
 .../include/asm/mach-loongson2ef/loongson.h   |  1 +
 arch/mips/loongson2ef/Kconfig                 |  1 -
 arch/mips/loongson2ef/lemote-2f/clock.c       | 98 +------------------
 arch/mips/loongson64/smp.c                    |  1 -
 drivers/cpufreq/loongson2_cpufreq.c           | 22 +----
 6 files changed, 8 insertions(+), 164 deletions(-)
 delete mode 100644 arch/mips/include/asm/clock.h

diff --git a/arch/mips/include/asm/clock.h b/arch/mips/include/asm/clock.h
deleted file mode 100644
index 5a8f96ebe5fa..000000000000
--- a/arch/mips/include/asm/clock.h
+++ /dev/null
@@ -1,49 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_MIPS_CLOCK_H
-#define __ASM_MIPS_CLOCK_H
-
-#include <linux/kref.h>
-#include <linux/list.h>
-#include <linux/seq_file.h>
-#include <linux/clk.h>
-
-struct clk;
-
-struct clk_ops {
-	void (*init) (struct clk *clk);
-	void (*enable) (struct clk *clk);
-	void (*disable) (struct clk *clk);
-	void (*recalc) (struct clk *clk);
-	int (*set_rate) (struct clk *clk, unsigned long rate, int algo_id);
-	long (*round_rate) (struct clk *clk, unsigned long rate);
-};
-
-struct clk {
-	struct list_head node;
-	const char *name;
-	int id;
-	struct module *owner;
-
-	struct clk *parent;
-	struct clk_ops *ops;
-
-	struct kref kref;
-
-	unsigned long rate;
-	unsigned long flags;
-};
-
-#define CLK_ALWAYS_ENABLED	(1 << 0)
-#define CLK_RATE_PROPAGATES	(1 << 1)
-
-int clk_init(void);
-
-int __clk_enable(struct clk *);
-void __clk_disable(struct clk *);
-
-void clk_recalc_rate(struct clk *);
-
-int clk_register(struct clk *);
-void clk_unregister(struct clk *);
-
-#endif				/* __ASM_MIPS_CLOCK_H */
diff --git a/arch/mips/include/asm/mach-loongson2ef/loongson.h b/arch/mips/include/asm/mach-loongson2ef/loongson.h
index 5008af0a1a19..57e571128489 100644
--- a/arch/mips/include/asm/mach-loongson2ef/loongson.h
+++ b/arch/mips/include/asm/mach-loongson2ef/loongson.h
@@ -244,6 +244,7 @@ static inline void do_perfcnt_IRQ(void)
 #ifdef CONFIG_CPU_SUPPORTS_CPUFREQ
 #include <linux/cpufreq.h>
 extern struct cpufreq_frequency_table loongson2_clockmod_table[];
+extern int loongson2_cpu_set_rate(unsigned long rate_khz);
 #endif
 
 /*
diff --git a/arch/mips/loongson2ef/Kconfig b/arch/mips/loongson2ef/Kconfig
index 595dd48e1e4d..96dc6eba4310 100644
--- a/arch/mips/loongson2ef/Kconfig
+++ b/arch/mips/loongson2ef/Kconfig
@@ -46,7 +46,6 @@ config LEMOTE_MACH2F
 	select CSRC_R4K if ! MIPS_EXTERNAL_TIMER
 	select DMA_NONCOHERENT
 	select GENERIC_ISA_DMA_SUPPORT_BROKEN
-	select HAVE_CLK
 	select FORCE_PCI
 	select I8259
 	select IRQ_MIPS_CPU
diff --git a/arch/mips/loongson2ef/lemote-2f/clock.c b/arch/mips/loongson2ef/lemote-2f/clock.c
index 414f282c8ab5..850b6b9f8f15 100644
--- a/arch/mips/loongson2ef/lemote-2f/clock.c
+++ b/arch/mips/loongson2ef/lemote-2f/clock.c
@@ -6,22 +6,12 @@
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
  */
-#include <linux/clk.h>
 #include <linux/cpufreq.h>
 #include <linux/errno.h>
 #include <linux/export.h>
-#include <linux/list.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
 
-#include <asm/clock.h>
 #include <asm/mach-loongson2ef/loongson.h>
 
-static LIST_HEAD(clock_list);
-static DEFINE_SPINLOCK(clock_lock);
-static DEFINE_MUTEX(clock_list_sem);
-
-/* Minimum CLK support */
 enum {
 	DC_ZERO, DC_25PT = 2, DC_37PT, DC_50PT, DC_62PT, DC_75PT,
 	DC_87PT, DC_DISABLE, DC_RESV
@@ -41,103 +31,21 @@ struct cpufreq_frequency_table loongson2_clockmod_table[] = {
 };
 EXPORT_SYMBOL_GPL(loongson2_clockmod_table);
 
-static struct clk cpu_clk = {
-	.name = "cpu_clk",
-	.flags = CLK_ALWAYS_ENABLED | CLK_RATE_PROPAGATES,
-	.rate = 800000000,
-};
-
-struct clk *clk_get(struct device *dev, const char *id)
-{
-	return &cpu_clk;
-}
-EXPORT_SYMBOL(clk_get);
-
-static void propagate_rate(struct clk *clk)
-{
-	struct clk *clkp;
-
-	list_for_each_entry(clkp, &clock_list, node) {
-		if (likely(clkp->parent != clk))
-			continue;
-		if (likely(clkp->ops && clkp->ops->recalc))
-			clkp->ops->recalc(clkp);
-		if (unlikely(clkp->flags & CLK_RATE_PROPAGATES))
-			propagate_rate(clkp);
-	}
-}
-
-int clk_enable(struct clk *clk)
-{
-	return 0;
-}
-EXPORT_SYMBOL(clk_enable);
-
-void clk_disable(struct clk *clk)
+int loongson2_cpu_set_rate(unsigned long rate_khz)
 {
-}
-EXPORT_SYMBOL(clk_disable);
-
-unsigned long clk_get_rate(struct clk *clk)
-{
-	if (!clk)
-		return 0;
-
-	return (unsigned long)clk->rate;
-}
-EXPORT_SYMBOL(clk_get_rate);
-
-void clk_put(struct clk *clk)
-{
-}
-EXPORT_SYMBOL(clk_put);
-
-int clk_set_rate(struct clk *clk, unsigned long rate)
-{
-	unsigned int rate_khz = rate / 1000;
 	struct cpufreq_frequency_table *pos;
-	int ret = 0;
 	int regval;
 
-	if (likely(clk->ops && clk->ops->set_rate)) {
-		unsigned long flags;
-
-		spin_lock_irqsave(&clock_lock, flags);
-		ret = clk->ops->set_rate(clk, rate, 0);
-		spin_unlock_irqrestore(&clock_lock, flags);
-	}
-
-	if (unlikely(clk->flags & CLK_RATE_PROPAGATES))
-		propagate_rate(clk);
-
 	cpufreq_for_each_valid_entry(pos, loongson2_clockmod_table)
 		if (rate_khz == pos->frequency)
 			break;
 	if (rate_khz != pos->frequency)
 		return -ENOTSUPP;
 
-	clk->rate = rate;
-
 	regval = readl(LOONGSON_CHIPCFG);
 	regval = (regval & ~0x7) | (pos->driver_data - 1);
 	writel(regval, LOONGSON_CHIPCFG);
 
-	return ret;
-}
-EXPORT_SYMBOL_GPL(clk_set_rate);
-
-long clk_round_rate(struct clk *clk, unsigned long rate)
-{
-	if (likely(clk->ops && clk->ops->round_rate)) {
-		unsigned long flags, rounded;
-
-		spin_lock_irqsave(&clock_lock, flags);
-		rounded = clk->ops->round_rate(clk, rate);
-		spin_unlock_irqrestore(&clock_lock, flags);
-
-		return rounded;
-	}
-
-	return rate;
+	return 0;
 }
-EXPORT_SYMBOL_GPL(clk_round_rate);
+EXPORT_SYMBOL_GPL(loongson2_cpu_set_rate);
diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index e1fe8bbb377d..e744e1bee49e 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -15,7 +15,6 @@
 #include <linux/kexec.h>
 #include <asm/processor.h>
 #include <asm/time.h>
-#include <asm/clock.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 #include <loongson.h>
diff --git a/drivers/cpufreq/loongson2_cpufreq.c b/drivers/cpufreq/loongson2_cpufreq.c
index 909f40fbcde2..d05e761d9572 100644
--- a/drivers/cpufreq/loongson2_cpufreq.c
+++ b/drivers/cpufreq/loongson2_cpufreq.c
@@ -20,7 +20,6 @@
 #include <linux/delay.h>
 #include <linux/platform_device.h>
 
-#include <asm/clock.h>
 #include <asm/idle.h>
 
 #include <asm/mach-loongson2ef/loongson.h>
@@ -58,29 +57,20 @@ static int loongson2_cpufreq_target(struct cpufreq_policy *policy,
 	     loongson2_clockmod_table[index].driver_data) / 8;
 
 	/* setting the cpu frequency */
-	clk_set_rate(policy->clk, freq * 1000);
+	loongson2_cpu_set_rate(freq);
 
 	return 0;
 }
 
 static int loongson2_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
-	struct clk *cpuclk;
 	int i;
 	unsigned long rate;
 	int ret;
 
-	cpuclk = clk_get(NULL, "cpu_clk");
-	if (IS_ERR(cpuclk)) {
-		pr_err("couldn't get CPU clk\n");
-		return PTR_ERR(cpuclk);
-	}
-
 	rate = cpu_clock_freq / 1000;
-	if (!rate) {
-		clk_put(cpuclk);
+	if (!rate)
 		return -EINVAL;
-	}
 
 	/* clock table init */
 	for (i = 2;
@@ -88,20 +78,16 @@ static int loongson2_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	     i++)
 		loongson2_clockmod_table[i].frequency = (rate * i) / 8;
 
-	ret = clk_set_rate(cpuclk, rate * 1000);
-	if (ret) {
-		clk_put(cpuclk);
+	ret = loongson2_cpu_set_rate(rate);
+	if (ret)
 		return ret;
-	}
 
-	policy->clk = cpuclk;
 	cpufreq_generic_init(policy, &loongson2_clockmod_table[0], 0);
 	return 0;
 }
 
 static int loongson2_cpufreq_exit(struct cpufreq_policy *policy)
 {
-	clk_put(policy->clk);
 	return 0;
 }
 
-- 
2.26.0

