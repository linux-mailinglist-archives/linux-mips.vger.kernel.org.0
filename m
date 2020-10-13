Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92A6928CFE2
	for <lists+linux-mips@lfdr.de>; Tue, 13 Oct 2020 16:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388330AbgJMOKv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Oct 2020 10:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388308AbgJMOKv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Oct 2020 10:10:51 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1442DC0613D0;
        Tue, 13 Oct 2020 07:10:51 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id n6so23933220wrm.13;
        Tue, 13 Oct 2020 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=acncEnNzh2Kx8Q5xd32ptk//3pcuaQHvqi6YTvBHIfg=;
        b=Fraa76wNWViVcPu0JLQQ3Vh0cIIfcSVnbxHrEL6MkGvIPZiHxdqmQz5J8p14d8QDM1
         VFS9/dzSoHTY1FLZDpHdWlaE8cX4XWMZQk6J+i7KAz8qw8t4ntsSNEhLAGHM5YF0vFax
         nlndfzxaFWg+T+FnSyM4KIjkfJQncMlKqC/+ZTXFSJOwXWh0FtqIG3OxRC39nJI4pkUc
         admvpt/RdXi/sEZ0Aa7LdtBHk/Wvp03aIwTWTP+10yrEOI+iU5SLJMce5rzbFdoD7yUB
         BRXcrzwuBNsB/YCSUvCF1Z4kTB6TEbCYRFITsHg6Yd/qSqWug/rhjFq21c3pmwIZjPOC
         /JWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=acncEnNzh2Kx8Q5xd32ptk//3pcuaQHvqi6YTvBHIfg=;
        b=ttu5DbWIt299a/LZ6FaWGA+RHk7P42YVdVcL65tuWAps2akWCELNPK6vnGzZSSELtz
         Tz+LW6vjfNklaJXeGH9r6NywHxVAQrlO9Kj51XqHrmga/boynLHFVmhynOfR2VZHVWMQ
         UpLUfWvVkm1KwpTuifko+15xIGiKla9NCyGUAQ9VdZv5nGgI3MS1w2aYYTKVebcPdlvl
         P19VPj8oeWl5yXCvWA+ryycnfM/aBfoYFX2dVm4Rv7PBeGGqONPloM5h2GMRebDzX4Tr
         cW53/L+Z9M/IKk/VQh7sUNx5qBrzv1QMsVBhBANBYFCwfDBaPIzDS/Gn8sP+/1Hf7Zac
         dDyA==
X-Gm-Message-State: AOAM530ZQvq4VODRrABGmW+fdNDMWSO42DIEbJylw3pw4Z1j69YGO/lU
        LTIaloxnRsLPHQx4+M16t+NYbNoDDkY=
X-Google-Smtp-Source: ABdhPJwt1vJQ0PIQADXPPaOctuDYkWMvrilvh3YqFqpEL2wZhBPFtO9mf9CA1/qfVR/mXNHsOHmGng==
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr36518832wrg.83.1602598249164;
        Tue, 13 Oct 2020 07:10:49 -0700 (PDT)
Received: from [192.168.0.10] (lns-bzn-57-82-249-60-161.adsl.proxad.net. [82.249.60.161])
        by smtp.googlemail.com with ESMTPSA id b15sm940718wrm.65.2020.10.13.07.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 07:10:47 -0700 (PDT)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From:   =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <funman@videolan.org>
Subject: [RFC/PATCH] MIPS: ralink: adds support for RT6855 SoC family
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     John Crispin <john@phrozen.org>,
        =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <funman@videolan.org>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-ID: <46c608d4-4f11-9464-0eda-2857ccde3bad@videolan.org>
Date:   Tue, 13 Oct 2020 16:10:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support code for rt6855 SOC.
The new irq-rt6855.c is based on irq.c

Signed-off-by: Rafaël Carré <funman@videolan.org>
---
Hello,

I decided I wanted to make OpenWRT run on this Linksys WAP300N router.

With the help of a serial console and the vendor GPL sources dump the
router can now boot 5.9 and give me a console prompt.

As a MIPS and kernel newbie I am pretty stoked ;)

It is still missing quite a few devices: net (ethernet/wlan), watchdog,
button, leds, maybe something else.

The timer (used to update jiffies I guess?) is most likely already
setup by U-Boot. IIUC there is room for a second timer although I am
not sure if it's required.

The simple IRQ controller is based on the existing Ralink 'intc' one.
I even re-used the name, I guess intc stands for "INTerrupt Controller"

Please give me your comments and insights on this simple patch, and
let me know if it's worth upstreaming this or if I should just leave
this patch and the next ones in the OpenWRT tree.

Thanks

Rafaël


  arch/mips/boot/dts/ralink/Makefile    |   1 +
  arch/mips/boot/dts/ralink/rt6855.dtsi |  64 ++++++++++
  arch/mips/boot/dts/ralink/wap300n.dts |  18 +++
  arch/mips/ralink/Kconfig              |  11 +-
  arch/mips/ralink/Makefile             |   6 +-
  arch/mips/ralink/Platform             |   5 +
  arch/mips/ralink/early_printk.c       |   5 +-
  arch/mips/ralink/irq-rt6855.c         | 168 ++++++++++++++++++++++++++
  arch/mips/ralink/rt6855.c             |  48 ++++++++
  9 files changed, 323 insertions(+), 3 deletions(-)
  create mode 100644 arch/mips/boot/dts/ralink/rt6855.dtsi
  create mode 100644 arch/mips/boot/dts/ralink/wap300n.dts
  create mode 100644 arch/mips/ralink/irq-rt6855.c
  create mode 100644 arch/mips/ralink/rt6855.c

diff --git a/arch/mips/boot/dts/ralink/Makefile 
b/arch/mips/boot/dts/ralink/Makefile
index 6c26dfa0a903..08c612190936 100644
--- a/arch/mips/boot/dts/ralink/Makefile
+++ b/arch/mips/boot/dts/ralink/Makefile
@@ -3,6 +3,7 @@ dtb-$(CONFIG_DTB_RT2880_EVAL)	+= rt2880_eval.dtb
  dtb-$(CONFIG_DTB_RT305X_EVAL)	+= rt3052_eval.dtb
  dtb-$(CONFIG_DTB_RT3883_EVAL)	+= rt3883_eval.dtb
  dtb-$(CONFIG_DTB_MT7620A_EVAL)	+= mt7620a_eval.dtb
+dtb-$(CONFIG_DTB_WAP300N)	+= wap300n.dtb
  dtb-$(CONFIG_DTB_OMEGA2P)	+= omega2p.dtb
  dtb-$(CONFIG_DTB_VOCORE2)	+= vocore2.dtb
  diff --git a/arch/mips/boot/dts/ralink/rt6855.dtsi 
b/arch/mips/boot/dts/ralink/rt6855.dtsi
new file mode 100644
index 000000000000..745808ee1e37
--- /dev/null
+++ b/arch/mips/boot/dts/ralink/rt6855.dtsi
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "ralink,rt6855-soc";
+
+	cpus {
+		cpu@0 {
+			compatible = "mips,mips4KEc";
+		};
+	};
+
+	cpuintc: cpuintc {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		compatible = "mti,cpu-interrupt-controller";
+	};
+
+	palmbus@1fb20000 {
+		compatible = "palmbus";
+		reg = <0x1fb20000 0xe0000>;
+		ranges = <0x0 0x1fb20000 0xDFFFF>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		sysc@0 {
+			compatible = "ralink,rt6855-sysc", "ralink,rt3050-sysc";
+			reg = <0x0 0x100>;
+		};
+
+		intc: intc@20000 {
+			compatible = "ralink,rt6855-intc", "ralink,rt2880-intc";
+			reg = <0x20000 0x100>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interrupt-parent = <&cpuintc>;
+		};
+
+		memc@300 {
+			compatible = "ralink,rt6855-memc", "ralink,rt3050-memc";
+			reg = <0x300 0x100>;
+		};
+
+		uart: uart@d0000 {
+			compatible = "ns8250";
+			reg = <0xd0000 0x30>;
+			interrupts = <0>;
+
+			clock-frequency = <921600>;
+
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			no-loopback-test;
+
+			status = "okay";
+
+			interrupt-parent = <&intc>;
+		};
+	};
+};
diff --git a/arch/mips/boot/dts/ralink/wap300n.dts 
b/arch/mips/boot/dts/ralink/wap300n.dts
new file mode 100644
index 000000000000..d923946c4abe
--- /dev/null
+++ b/arch/mips/boot/dts/ralink/wap300n.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+/include/ "rt6855.dtsi"
+
+/ {
+	compatible = "ralink,rt6855-soc";
+	model = "Linksys WAP300n";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x20000 0x3fe0000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,57600";
+	};
+};
diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index c10d8b233ab1..3d40d9432e8e 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -16,7 +16,7 @@ config RALINK_ILL_ACC
  config IRQ_INTC
  	bool
  	default y
-	depends on !SOC_MT7621
+	depends on !SOC_MT7621 && !SOC_RT6855
   choice
  	prompt "Ralink SoC selection"
@@ -39,6 +39,10 @@ choice
  		select HAVE_LEGACY_CLK
  		select HAVE_PCI
  +	config SOC_RT6855
+		bool "RT6855"
+		select HAVE_LEGACY_CLK
+
  	config SOC_MT7620
  		bool "MT7620/8"
  		select CPU_MIPSR2_IRQ_VI
@@ -98,6 +102,11 @@ choice
  		depends on SOC_MT7620
  		select BUILTIN_DTB
  +	config DTB_WAP300N
+		bool "WAP300N"
+		depends on SOC_RT6855
+		select BUILTIN_DTB
+
  endchoice
   endif
diff --git a/arch/mips/ralink/Makefile b/arch/mips/ralink/Makefile
index 26fabbdea1f1..2d5a17a87d3e 100644
--- a/arch/mips/ralink/Makefile
+++ b/arch/mips/ralink/Makefile
@@ -7,7 +7,10 @@
  obj-y := prom.o of.o reset.o
   ifndef CONFIG_MIPS_GIC
-	obj-y += clk.o timer.o
+obj-y += clk.o
+ifndef CONFIG_SOC_RT6855
+	obj-y += timer.o
+endif
  endif
   obj-$(CONFIG_CLKEVT_RT3352) += cevt-rt3352.o
@@ -22,6 +25,7 @@ obj-$(CONFIG_SOC_RT305X) += rt305x.o
  obj-$(CONFIG_SOC_RT3883) += rt3883.o
  obj-$(CONFIG_SOC_MT7620) += mt7620.o
  obj-$(CONFIG_SOC_MT7621) += mt7621.o
+obj-$(CONFIG_SOC_RT6855) += rt6855.o irq-rt6855.o
   obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
  diff --git a/arch/mips/ralink/Platform b/arch/mips/ralink/Platform
index 02ee0791481d..7fa42eac44b1 100644
--- a/arch/mips/ralink/Platform
+++ b/arch/mips/ralink/Platform
@@ -21,6 +21,11 @@ cflags-$(CONFIG_SOC_RT305X)	+= 
-I$(srctree)/arch/mips/include/asm/mach-ralink/rt
  load-$(CONFIG_SOC_RT3883)	+= 0xffffffff80000000
  cflags-$(CONFIG_SOC_RT3883)	+= 
-I$(srctree)/arch/mips/include/asm/mach-ralink/rt3883
  +# Ralink RT6855
+#
+load-$(CONFIG_SOC_RT6855)	+= 0xffffffff80020000
+cflags-$(CONFIG_SOC_RT6855)	+= $(call 
as-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
+
  #
  # Ralink MT7620
  #
diff --git a/arch/mips/ralink/early_printk.c 
b/arch/mips/ralink/early_printk.c
index eb4fac25eaf6..eb5f04809e8a 100644
--- a/arch/mips/ralink/early_printk.c
+++ b/arch/mips/ralink/early_printk.c
@@ -16,6 +16,9 @@
  #elif defined(CONFIG_SOC_MT7621)
  #define EARLY_UART_BASE		0x1E000c00
  #define CHIPID_BASE		0x1E000004
+#elif defined(CONFIG_SOC_RT6855)
+#define EARLY_UART_BASE		0x1FBF0000
+#define CHIPID_BASE		0x1E000004
  #else
  #define EARLY_UART_BASE		0x10000c00
  #define CHIPID_BASE		0x10000004
@@ -74,7 +77,7 @@ void prom_putchar(char ch)
  		init_complete = 1;
  	}
  -	if (IS_ENABLED(CONFIG_SOC_MT7621) || soc_is_mt7628()) {
+	if (IS_ENABLED(CONFIG_SOC_MT7621) || soc_is_mt7628() || 
IS_ENABLED(CONFIG_SOC_RT6855)) {
  		uart_w32((unsigned char)ch, UART_TX);
  		while ((uart_r32(UART_REG_LSR) & UART_LSR_THRE) == 0)
  			;
diff --git a/arch/mips/ralink/irq-rt6855.c b/arch/mips/ralink/irq-rt6855.c
new file mode 100644
index 000000000000..7e5bb330d837
--- /dev/null
+++ b/arch/mips/ralink/irq-rt6855.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *
+ * Copyright (C) 2009 Gabor Juhos <juhosg@openwrt.org>
+ * Copyright (C) 2013 John Crispin <john@phrozen.org>
+ */
+
+#include <linux/io.h>
+#include <linux/bitops.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/interrupt.h>
+
+#include <asm/irq_cpu.h>
+#include <ioremap.h>
+#include <asm/mipsregs.h>
+
+#include "common.h"
+
+/* we have a cascade of 8 irqs */
+#define RALINK_INTC_IRQ_BASE	8
+
+/* we have 32 SoC irqs */
+#define RALINK_INTC_IRQ_COUNT	32
+
+#define RALINK_SOC_IRQ_TIMER	30
+
+enum rt_intc_regs_enum {
+	INTC_REG_MASK = 0,
+	INTC_REG_PRIO,
+};
+
+static u32 rt_intc_regs[] = {
+	[INTC_REG_MASK] = 0x04,
+	[INTC_REG_PRIO] = 0x10,
+};
+
+static DEFINE_SPINLOCK(rt6855_irq_lock);
+
+static void __iomem *rt_intc_membase;
+
+static inline void rt_intc_w32(u32 val, unsigned reg)
+{
+	__raw_writel(val, rt_intc_membase + rt_intc_regs[reg]);
+}
+
+static inline void rt_intc_prio_w8(u32 val, unsigned prio)
+{
+	__raw_writeb(val, rt_intc_membase + rt_intc_regs[INTC_REG_PRIO] + prio);
+}
+
+static inline u32 rt_intc_r32(unsigned reg)
+{
+	return __raw_readl(rt_intc_membase + rt_intc_regs[reg]);
+}
+
+static void ralink_intc_irq_unmask(struct irq_data *d)
+{
+	unsigned long flags;
+	u32 mask;
+
+	spin_lock_irqsave(&rt6855_irq_lock, flags);
+
+	mask = rt_intc_r32(INTC_REG_MASK);
+	mask |= BIT(d->hwirq);
+	rt_intc_w32(mask, INTC_REG_MASK);
+
+	spin_unlock_irqrestore(&rt6855_irq_lock, flags);
+}
+
+static void ralink_intc_irq_mask(struct irq_data *d)
+{
+	unsigned long flags;
+	u32 mask;
+
+	spin_lock_irqsave(&rt6855_irq_lock, flags);
+
+	mask = rt_intc_r32(INTC_REG_MASK);
+	mask &= ~BIT(d->hwirq);
+	rt_intc_w32(mask, INTC_REG_MASK);
+
+	spin_unlock_irqrestore(&rt6855_irq_lock, flags);
+}
+
+static struct irq_chip ralink_intc_irq_chip = {
+	.name			= "INTC",
+	.irq_ack		= ralink_intc_irq_mask,
+	.irq_mask		= ralink_intc_irq_mask,
+	.irq_mask_ack	= ralink_intc_irq_mask,
+	.irq_unmask		= ralink_intc_irq_unmask,
+	.irq_eoi		= ralink_intc_irq_unmask,
+};
+
+unsigned int get_c0_compare_int(void)
+{
+	return RALINK_INTC_IRQ_BASE + RALINK_SOC_IRQ_TIMER;
+}
+
+asmlinkage void plat_irq_dispatch(void)
+{
+	unsigned long pending;
+
+	pending = (read_c0_status() & read_c0_cause() & ST0_IM) >> 10;
+
+	do_IRQ(pending + RALINK_INTC_IRQ_BASE - 1);
+}
+
+static int intc_map(struct irq_domain *d, unsigned int irq, 
irq_hw_number_t hw)
+{
+	irq_set_chip_and_handler(irq, &ralink_intc_irq_chip, handle_level_irq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops irq_domain_ops = {
+	.xlate = irq_domain_xlate_onecell,
+	.map = intc_map,
+};
+
+static int __init intc_of_init(struct device_node *node,
+		struct device_node *parent)
+{
+	struct resource res;
+	struct irq_domain *domain;
+
+	if (!of_property_read_u32_array(node, "ralink,intc-registers",
+				rt_intc_regs, 2))
+		pr_info("intc: using register map from devicetree\n");
+
+	if (of_address_to_resource(node, 0, &res))
+		panic("Failed to get intc memory range");
+
+	if (!request_mem_region(res.start, resource_size(&res),
+				res.name))
+		pr_err("Failed to request intc memory");
+
+	rt_intc_membase = ioremap(res.start,
+			resource_size(&res));
+	if (!rt_intc_membase)
+		panic("Failed to remap intc memory");
+
+	rt_intc_prio_w8(RALINK_SOC_IRQ_TIMER, 1);
+
+	clear_c0_status(ST0_IM);
+	clear_c0_cause(CAUSEF_IP);
+
+	domain = irq_domain_add_legacy(node, RALINK_INTC_IRQ_COUNT,
+			RALINK_INTC_IRQ_BASE, 0, &irq_domain_ops, NULL);
+	if (!domain)
+		panic("Failed to add irqdomain");
+
+	set_c0_status(ST0_IM);
+
+	return 0;
+}
+
+static struct of_device_id __initdata of_irq_ids[] = {
+	{ .compatible = "mti,cpu-interrupt-controller", .data = 
mips_cpu_irq_of_init },
+	{ .compatible = "ralink,rt6855-intc", .data = intc_of_init },
+	{},
+};
+
+void __init arch_init_irq(void)
+{
+	of_irq_init(of_irq_ids);
+}
diff --git a/arch/mips/ralink/rt6855.c b/arch/mips/ralink/rt6855.c
new file mode 100644
index 000000000000..46cc496aa8e9
--- /dev/null
+++ b/arch/mips/ralink/rt6855.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2016 Imagination Technologies
+ * Author: Paul Burton <paul.burton@mips.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/clocksource.h>
+#include <linux/init.h>
+#include <linux/irqchip.h>
+#include <linux/of_clk.h>
+#include <linux/of_fdt.h>
+#include <linux/serial_reg.h>
+
+#include <asm/bootinfo.h>
+#include <asm/fw/fw.h>
+#include <asm/irq_cpu.h>
+#include <asm/machine.h>
+#include <asm/mips-cps.h>
+#include <asm/prom.h>
+#include <asm/smp-ops.h>
+#include <asm/time.h>
+
+#include <asm/mach-ralink/ralink_regs.h>
+
+#include "common.h"
+
+void prom_soc_init(struct ralink_soc_info *soc_info)
+{
+	soc_info->mem_size_min = 64;
+	soc_info->mem_size_max = 64;
+	soc_info->compatible = "ralink,rt6855-soc";
+	soc_info->mem_base = 0x20000;
+}
+
+void __init ralink_of_remap(void)
+{
+	rt_sysc_membase = plat_of_remap_node("ralink,rt6855-sysc");
+	rt_memc_membase = plat_of_remap_node("ralink,rt6855-memc");
+
+	if (!rt_sysc_membase || !rt_memc_membase)
+		panic("Failed to remap core resources");
+}
+
+void __init ralink_clk_init(void)
+{
+	ralink_clk_add("cpu", 700000000);
+}
-- 
2.27.0

