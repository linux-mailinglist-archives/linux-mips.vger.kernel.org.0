Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E13163AD0
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2019 20:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727353AbfGISWb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jul 2019 14:22:31 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42584 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbfGISWa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jul 2019 14:22:30 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so9688538pff.9;
        Tue, 09 Jul 2019 11:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U1sP01z1tONmh5GWSZICOzts+V0dp/K1omZR11yOJpM=;
        b=QhDmc+Yt7aX/kWNLZfJwZOkYHx9rRWnvs9Q7XumHFVJueP44+phWYld4rqJ7+Jan5A
         dB4aglS09c/iFyWcxpuedXPoL17EamixBumDreIPRpbc5z91QjFwsiqGUudikuZdEJfs
         oJM9VA1klnM026G0WG+eK8wRf/7YlpJd1rBS4PpLe7vrK7FWh94t3BgDjropr0lHKXjX
         kryWHkGO6xozBFsCHbchzhjxTFJ1fIRKeAi8YVebHlo7/7VyJXzS2ASqsyS6NCnyk93D
         q1dVYIMmAS/kJrb2SthctcWyaR9mYTUUXidpFVbmY5vVRtjNKvokkG3THJ4Hq4wbyMJb
         I9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U1sP01z1tONmh5GWSZICOzts+V0dp/K1omZR11yOJpM=;
        b=rpDKAJHwcg88lBfWKr8faR34bmMrINzSufLGc13lUX08Nr8WeSSZFd2nVGGZv26G9y
         9IR5aXC9B1DrQ9SEeUmgljgvr3dtl3n+i4VTumDlpMNUd319ZHzcTp3ewTGyYEn1dDZL
         6ma/cetzFdmsrHxjtV/mdR+ZiXOkZGAdhzfqsDZOyoFGwSMo8yhFH3Kj6fzxnRIcBCf4
         Qov1d06t4dh9gmWlRoCvA/1eWEGQJXCX5/59QqZAvbLg3YQr+7wBsWqvlB6xVV/1ULrX
         sTHSO+meUfLmZNaB+YmQj9j4iATlexJRln6JVH1JkSpBBMtwXPetaIK2efpZAzU1ww8O
         EXXQ==
X-Gm-Message-State: APjAAAVV1FGC262KF671yyNyELLDm8dPQkvgL+V22JD3AOQoDTFgpT2p
        vOEtv81dDxgMW+d9GLCsFoIVtdNrmoWAaQ==
X-Google-Smtp-Source: APXvYqwCnW4w0GnKlSp4Yh+i8KGhW25g9e/rE8dDky2tYSa1fXAAuNXjpzRmzhHD/9ijDv8cfFPdLw==
X-Received: by 2002:a63:e356:: with SMTP id o22mr32326590pgj.150.1562696549596;
        Tue, 09 Jul 2019 11:22:29 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:7001:2668:5400:1ff:fe62:2bbd])
        by smtp.gmail.com with ESMTPSA id m69sm21008639pga.11.2019.07.09.11.22.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 11:22:12 -0700 (PDT)
From:   Chuanhong Guo <gch981213@gmail.com>
To:     linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list),
        linux-mips@vger.kernel.org (open list:MIPS),
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM)
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        John Crispin <john@phrozen.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>,
        Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 2/5] MIPS: ralink: fix cpu clock of mt7621 and add dt clk devices
Date:   Wed, 10 Jul 2019 02:20:15 +0800
Message-Id: <20190709182018.23193-3-gch981213@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190709182018.23193-1-gch981213@gmail.com>
References: <20190709182018.23193-1-gch981213@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For a long time the mt7621 uses a fixed cpu clock which causes a problem
if the cpu frequency is not 880MHz.

This patch fixes the cpu clock calculation and adds the cpu/bus clkdev
which will be used in dts.

Ported from OpenWrt:
c7ca224299 ramips: fix cpu clock of mt7621 and add dt clk devices

Signed-off-by: Weijie Gao <hackpascal@gmail.com>
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/mips/include/asm/mach-ralink/mt7621.h |  20 ++++
 arch/mips/ralink/mt7621.c                  | 102 ++++++++++++++-------
 arch/mips/ralink/timer-gic.c               |   4 +-
 3 files changed, 93 insertions(+), 33 deletions(-)

diff --git a/arch/mips/include/asm/mach-ralink/mt7621.h b/arch/mips/include/asm/mach-ralink/mt7621.h
index 65483a4681ab..51a6e51aef3f 100644
--- a/arch/mips/include/asm/mach-ralink/mt7621.h
+++ b/arch/mips/include/asm/mach-ralink/mt7621.h
@@ -17,6 +17,10 @@
 #define SYSC_REG_CHIP_REV		0x0c
 #define SYSC_REG_SYSTEM_CONFIG0		0x10
 #define SYSC_REG_SYSTEM_CONFIG1		0x14
+#define SYSC_REG_CLKCFG0		0x2c
+#define SYSC_REG_CUR_CLK_STS		0x44
+
+#define MEMC_REG_CPU_PLL		0x648
 
 #define CHIP_REV_PKG_MASK		0x1
 #define CHIP_REV_PKG_SHIFT		16
@@ -24,6 +28,22 @@
 #define CHIP_REV_VER_SHIFT		8
 #define CHIP_REV_ECO_MASK		0xf
 
+#define XTAL_MODE_SEL_MASK		0x7
+#define XTAL_MODE_SEL_SHIFT		6
+
+#define CPU_CLK_SEL_MASK		0x3
+#define CPU_CLK_SEL_SHIFT		30
+
+#define CUR_CPU_FDIV_MASK		0x1f
+#define CUR_CPU_FDIV_SHIFT		8
+#define CUR_CPU_FFRAC_MASK		0x1f
+#define CUR_CPU_FFRAC_SHIFT		0
+
+#define CPU_PLL_PREDIV_MASK		0x3
+#define CPU_PLL_PREDIV_SHIFT		12
+#define CPU_PLL_FBDIV_MASK		0x7f
+#define CPU_PLL_FBDIV_SHIFT		4
+
 #define MT7621_DRAM_BASE                0x0
 #define MT7621_DDR2_SIZE_MIN		32
 #define MT7621_DDR2_SIZE_MAX		256
diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index 9415be0d57b8..31158b88bcb6 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -7,22 +7,22 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
+#include <dt-bindings/clock/mt7621-clk.h>
 
 #include <asm/mipsregs.h>
 #include <asm/smp-ops.h>
 #include <asm/mips-cps.h>
 #include <asm/mach-ralink/ralink_regs.h>
 #include <asm/mach-ralink/mt7621.h>
+#include <asm/time.h>
 
 #include <pinmux.h>
 
 #include "common.h"
 
-#define SYSC_REG_SYSCFG		0x10
-#define SYSC_REG_CPLL_CLKCFG0	0x2c
-#define SYSC_REG_CUR_CLK_STS	0x44
-#define CPU_CLK_SEL		(BIT(30) | BIT(31))
-
 #define MT7621_GPIO_MODE_UART1		1
 #define MT7621_GPIO_MODE_I2C		2
 #define MT7621_GPIO_MODE_UART3_MASK	0x3
@@ -108,49 +108,89 @@ static struct rt2880_pmx_group mt7621_pinmux_data[] = {
 	{ 0 }
 };
 
+static struct clk *clks[MT7621_CLK_MAX];
+static struct clk_onecell_data clk_data = {
+	.clks = clks,
+	.clk_num = ARRAY_SIZE(clks),
+};
+
 phys_addr_t mips_cpc_default_phys_base(void)
 {
 	panic("Cannot detect cpc address");
 }
 
+static struct clk *__init mt7621_add_sys_clkdev(
+	const char *id, unsigned long rate)
+{
+	struct clk *clk;
+	int err;
+
+	clk = clk_register_fixed_rate(NULL, id, NULL, 0, rate);
+	if (IS_ERR(clk))
+		panic("failed to allocate %s clock structure", id);
+
+	err = clk_register_clkdev(clk, id, NULL);
+	if (err)
+		panic("unable to register %s clock device", id);
+
+	return clk;
+}
+
 void __init ralink_clk_init(void)
 {
-	int cpu_fdiv = 0;
-	int cpu_ffrac = 0;
-	int fbdiv = 0;
-	u32 clk_sts, syscfg;
-	u8 clk_sel = 0, xtal_mode;
-	u32 cpu_clk;
+	const static u32 prediv_tbl[] = {0, 1, 2, 2};
+	u32 syscfg, xtal_sel, clkcfg, clk_sel, curclk, ffiv, ffrac;
+	u32 pll, prediv, fbdiv;
+	u32 xtal_clk, cpu_clk, bus_clk;
+
+	syscfg = rt_sysc_r32(SYSC_REG_SYSTEM_CONFIG0);
+	xtal_sel = (syscfg >> XTAL_MODE_SEL_SHIFT) & XTAL_MODE_SEL_MASK;
 
-	if ((rt_sysc_r32(SYSC_REG_CPLL_CLKCFG0) & CPU_CLK_SEL) != 0)
-		clk_sel = 1;
+	clkcfg = rt_sysc_r32(SYSC_REG_CLKCFG0);
+	clk_sel = (clkcfg >> CPU_CLK_SEL_SHIFT) & CPU_CLK_SEL_MASK;
+
+	curclk = rt_sysc_r32(SYSC_REG_CUR_CLK_STS);
+	ffiv = (curclk >> CUR_CPU_FDIV_SHIFT) & CUR_CPU_FDIV_MASK;
+	ffrac = (curclk >> CUR_CPU_FFRAC_SHIFT) & CUR_CPU_FFRAC_MASK;
+
+	if (xtal_sel <= 2)
+		xtal_clk = 20 * 1000 * 1000;
+	else if (xtal_sel <= 5)
+		xtal_clk = 40 * 1000 * 1000;
+	else
+		xtal_clk = 25 * 1000 * 1000;
 
 	switch (clk_sel) {
 	case 0:
-		clk_sts = rt_sysc_r32(SYSC_REG_CUR_CLK_STS);
-		cpu_fdiv = ((clk_sts >> 8) & 0x1F);
-		cpu_ffrac = (clk_sts & 0x1F);
-		cpu_clk = (500 * cpu_ffrac / cpu_fdiv) * 1000 * 1000;
+		cpu_clk = 500 * 1000 * 1000;
 		break;
-
 	case 1:
-		fbdiv = ((rt_sysc_r32(0x648) >> 4) & 0x7F) + 1;
-		syscfg = rt_sysc_r32(SYSC_REG_SYSCFG);
-		xtal_mode = (syscfg >> 6) & 0x7;
-		if (xtal_mode >= 6) {
-			/* 25Mhz Xtal */
-			cpu_clk = 25 * fbdiv * 1000 * 1000;
-		} else if (xtal_mode >= 3) {
-			/* 40Mhz Xtal */
-			cpu_clk = 40 * fbdiv * 1000 * 1000;
-		} else {
-			/* 20Mhz Xtal */
-			cpu_clk = 20 * fbdiv * 1000 * 1000;
-		}
+		pll = rt_memc_r32(MEMC_REG_CPU_PLL);
+		fbdiv = (pll >> CPU_PLL_FBDIV_SHIFT) & CPU_PLL_FBDIV_MASK;
+		prediv = (pll >> CPU_PLL_PREDIV_SHIFT) & CPU_PLL_PREDIV_MASK;
+		cpu_clk = ((fbdiv + 1) * xtal_clk) >> prediv_tbl[prediv];
 		break;
+	default:
+		cpu_clk = xtal_clk;
 	}
+
+	cpu_clk = cpu_clk / ffiv * ffrac;
+	bus_clk = cpu_clk / 4;
+
+	clks[MT7621_CLK_CPU] = mt7621_add_sys_clkdev("cpu", cpu_clk);
+	clks[MT7621_CLK_BUS] = mt7621_add_sys_clkdev("bus", bus_clk);
+
+	pr_info("CPU Clock: %dMHz\n", cpu_clk / 1000000);
+	mips_hpt_frequency = cpu_clk / 2;
 }
 
+static void __init mt7621_clocks_init_dt(struct device_node *np)
+{
+	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
+}
+
+CLK_OF_DECLARE(mt7621_clk, "mediatek,mt7621-pll", mt7621_clocks_init_dt);
+
 void __init ralink_of_remap(void)
 {
 	rt_sysc_membase = plat_of_remap_node("mtk,mt7621-sysc");
diff --git a/arch/mips/ralink/timer-gic.c b/arch/mips/ralink/timer-gic.c
index 944fbe0fc741..9bbaa37a0da1 100644
--- a/arch/mips/ralink/timer-gic.c
+++ b/arch/mips/ralink/timer-gic.c
@@ -9,14 +9,14 @@
 
 #include <linux/of.h>
 #include <linux/clk-provider.h>
-#include <linux/clocksource.h>
+#include <asm/time.h>
 
 #include "common.h"
 
 void __init plat_time_init(void)
 {
 	ralink_of_remap();
-
+	ralink_clk_init();
 	of_clk_init(NULL);
 	timer_probe();
 }
-- 
2.21.0

