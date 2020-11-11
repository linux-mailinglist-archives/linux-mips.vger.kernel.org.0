Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2000D2AF685
	for <lists+linux-mips@lfdr.de>; Wed, 11 Nov 2020 17:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbgKKQa6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Nov 2020 11:30:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbgKKQaX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Nov 2020 11:30:23 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF91C0617A6;
        Wed, 11 Nov 2020 08:30:23 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id j7so3137122wrp.3;
        Wed, 11 Nov 2020 08:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sfgoBgMx0ukozmryc90T0ctPtHbxEn0KGh5GLQjBiSQ=;
        b=SLqzJtlPq65hn058cZYx4fvQ7ZlvtVirTUIw7FR+nbwrhzuli1lOglLVBPtBP8PoAU
         p+H3PgqxU5KpDJgCZfB3HJUBg0T40E/sX3H6lkViJ6qgp1lcmcL21JW7gxnetJYmrxX/
         u35smbmQlYAgBwLhe7bTbxpcjGHrLWoi6rffWerkyxPXFcMImkpX4dX8xNTLD00q3GLX
         iUNB7K9vVVQiOqARk794vPBAOdKp2QWSdX/Zxq9meIdT11PXTakzsM7sVMvdy11TBlF0
         A8EKFTAaAHVdI66tBD+cVRmfX98KD43wEhrA9Mgf1yw+uKssNnxj3/In51pwKYUvx7GO
         pqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sfgoBgMx0ukozmryc90T0ctPtHbxEn0KGh5GLQjBiSQ=;
        b=Rq6qBol3Ys2FOIQ3mV5Rdl4KL9Lw1zbedx5zl4Wuz57cec+EoUo6NhInOGPy8kO3P0
         BlOLtd74ud9HzlfsRfGPbltjCROhoR99iqGoXIEHl/jB684a94KzyEx58cMwzFC9KANa
         eYr7W6qiiy/t98LU5BzGJHci1OVcYUiSaIf+4WgLJ+jnnbeINMI/qHqMpj/LXJDP9LG5
         yUQXqm+YpohdZctDpnHXu5jBX5dNMEcRPM2of4FrlpjGRYSLGGl9c9q6OMl0m14lYiu+
         2/XDTuRcsX873FyBLi17KkU/piOZkKq4TEb/kgh9pUx7aO+94clmjPL2A4XLTKZmPxQZ
         uycg==
X-Gm-Message-State: AOAM530fPQQ/hs1r/1xC24/5aTuOjIBsIy0sv5f1ZqXJXSBK6tkKqOxf
        ZpnV/uC92rhxJ9716wH9pVo=
X-Google-Smtp-Source: ABdhPJyo7oK7tVGbMbVwKN3loD2BtC5vy4H7GCmbgUztrZGgPWh/DuCwlxvd1xSzHU1ZYwCHk7E1IQ==
X-Received: by 2002:a5d:6506:: with SMTP id x6mr32467046wru.71.1605112221795;
        Wed, 11 Nov 2020 08:30:21 -0800 (PST)
Received: from localhost.localdomain (245.red-79-158-78.dynamicip.rima-tde.net. [79.158.78.245])
        by smtp.gmail.com with ESMTPSA id w186sm3196753wmb.26.2020.11.11.08.30.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 08:30:21 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH 4/7] MIPS: ralink: add clock device providing cpu/ahb/apb clock for mt7621
Date:   Wed, 11 Nov 2020 17:30:10 +0100
Message-Id: <20201111163013.29412-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
References: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For a long time the mt7621 uses a fixed cpu clock which causes a problem
if the cpu frequency is not 880MHz.
This patch adds cpu/ahb/apb clock calculation code and binds clocks to
mt7621-pll node.

Adapted from OpenWrt:
c7ca224299 ramips: fix cpu clock of mt7621 and add dt clk devices

Signed-off-by: Weijie Gao <hackpascal@gmail.com>
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/include/asm/mach-ralink/mt7621.h | 20 +++++
 arch/mips/ralink/mt7621.c                  | 87 ++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/arch/mips/include/asm/mach-ralink/mt7621.h b/arch/mips/include/asm/mach-ralink/mt7621.h
index e1af1ba50bd8..a9f3febddf1c 100644
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
index ca0ac607b0f3..4fce37e5ea7a 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -9,12 +9,17 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
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
 
@@ -105,11 +110,93 @@ static struct rt2880_pmx_group mt7621_pinmux_data[] = {
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
+	const char *id, const char *parent_id, unsigned long rate)
+{
+	struct clk *clk;
+	int err;
+
+	clk = clk_register_fixed_rate(NULL, id, parent_id, 0, rate);
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
+#define MHZ(x) ((x) * 1000 * 1000)
+
+void __init ralink_clk_init(void)
+{
+	u32 syscfg, xtal_sel, clkcfg, clk_sel, curclk, ffiv, ffrac;
+	u32 pll, prediv, fbdiv;
+	u32 xtal_clk, cpu_clk, ahb_clk, apb_clk;
+	static const u32 prediv_tbl[] = { 0, 1, 2, 2 };
+
+	syscfg = rt_sysc_r32(SYSC_REG_SYSTEM_CONFIG0);
+	xtal_sel = (syscfg >> XTAL_MODE_SEL_SHIFT) & XTAL_MODE_SEL_MASK;
+
+	clkcfg = rt_sysc_r32(SYSC_REG_CLKCFG0);
+	clk_sel = (clkcfg >> CPU_CLK_SEL_SHIFT) & CPU_CLK_SEL_MASK;
+
+	curclk = rt_sysc_r32(SYSC_REG_CUR_CLK_STS);
+	ffiv = (curclk >> CUR_CPU_FDIV_SHIFT) & CUR_CPU_FDIV_MASK;
+	ffrac = (curclk >> CUR_CPU_FFRAC_SHIFT) & CUR_CPU_FFRAC_MASK;
+
+	if (xtal_sel <= 2)
+		xtal_clk = MHZ(20);
+	else if (xtal_sel <= 5)
+		xtal_clk = MHZ(40);
+	else
+		xtal_clk = MHZ(25);
+
+	switch (clk_sel) {
+	case 0:
+		cpu_clk = MHZ(500);
+		break;
+	case 1:
+		pll = rt_memc_r32(MEMC_REG_CPU_PLL);
+		fbdiv = (pll >> CPU_PLL_FBDIV_SHIFT) & CPU_PLL_FBDIV_MASK;
+		prediv = (pll >> CPU_PLL_PREDIV_SHIFT) & CPU_PLL_PREDIV_MASK;
+		cpu_clk = ((fbdiv + 1) * xtal_clk) >> prediv_tbl[prediv];
+		break;
+	default:
+		cpu_clk = xtal_clk;
+	}
+
+	cpu_clk = cpu_clk / ffiv * ffrac;
+	ahb_clk = cpu_clk / 4;
+	apb_clk = MHZ(50);
+
+	clks[MT7621_CLK_CPU] = mt7621_add_sys_clkdev("cpu", NULL, cpu_clk);
+	clks[MT7621_CLK_AHB] = mt7621_add_sys_clkdev("ahb", NULL, ahb_clk);
+	clks[MT7621_CLK_APB] = mt7621_add_sys_clkdev("apb", NULL, apb_clk);
+
+	pr_info("CPU Clock: %dMHz\n", cpu_clk / 1000000);
+	mips_hpt_frequency = cpu_clk / 2;
+}
+
+static void __init mt7621_clocks_init_dt(struct device_node *np)
+{
+	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
+}
+
+CLK_OF_DECLARE(ar7100, "mediatek,mt7621-pll", mt7621_clocks_init_dt);
+
 void __init ralink_of_remap(void)
 {
 	rt_sysc_membase = plat_of_remap_node("mtk,mt7621-sysc");
-- 
2.25.1

