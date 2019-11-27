Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE9C10A920
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2019 04:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbfK0Deo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Nov 2019 22:34:44 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25814 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbfK0Deo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Nov 2019 22:34:44 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574825644; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=DMowNLLrISvH4fcGxCWaJchvRMOJFeAjujIq8AUrpgiuBeSqU2LafStZ3m2vWSqCJqCyArOXnNBVYTVIdO6pdKLaGRQ9iCIcASKP/MLyU/mNjdbt8nnpyd0+CMBWtcXZpEcrqMCTevH6tPv/7yERRRK7P1IZ1qSKjkjqiJYRi4w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574825644; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=l9RHxM+V8yMIWYUYxKS8n8Zb95+g5cppcIGHhKGrdPo=; 
        b=bRRAnwMzsgKbtqjTm1qxs+BLnfBGRK5nIMpRJtG2o9dwBB8RAN41kpZTD+9CK6RKtvgVy+dQ1F3sIyZwgTQteBib4qaPj2mbj2F2liDVOlN6nMVrU7mtAs9jgaSjWYwuLKdwvwSxaX9q3TxM7Ajs9Pk8eTN3RT5Chs+d0p/Mlk4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=TacvTK7eOUQ3E+FDPAKrMY9hjUYmWs2z5M3kL59oglahbeVe1Ypu3k7FvR2oQxi7aAvDAJKSNSXk
    RFVq6zSpuoFG0TNHkj+u9rP4sYOvq3vwBqp/QDnubBYtScchd+Ln  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574825644;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=l9RHxM+V8yMIWYUYxKS8n8Zb95+g5cppcIGHhKGrdPo=;
        b=fmYqT5ymMjZoja5Vr1MRxVLtMIgXOWAUcQP/h3pk9Rp2TICbo8+pJh/bWlRSWDA/
        hYa5LF9epDV55loRREbI4LQdfu7eD/beds6fKk7ZZcTbfVkHIuGe6d3OyAqiBWOEPjS
        NNjiwZ4lRBWxsA4G/rXsL3A4OpkrRPgRbTcFeItQ=
Received: from zhouyanjie-virtual-machine.localdomain (139.207.174.158 [139.207.174.158]) by mx.zohomail.com
        with SMTPS id 1574825643667795.2885544068819; Tue, 26 Nov 2019 19:34:03 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        syq@debian.org, paul@crapouillou.net, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH 3/5] clk: Ingenic: Add CGU driver for X1830.
Date:   Wed, 27 Nov 2019 11:32:54 +0800
Message-Id: <1574825576-91028-4-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
References: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for the clocks provided by the CGU in the Ingenic X1830
SoC, making use of the cgu code to do the heavy lifting.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/clk/ingenic/Kconfig     |  10 ++
 drivers/clk/ingenic/Makefile    |   1 +
 drivers/clk/ingenic/x1830-cgu.c | 336 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 347 insertions(+)
 create mode 100644 drivers/clk/ingenic/x1830-cgu.c

diff --git a/drivers/clk/ingenic/Kconfig b/drivers/clk/ingenic/Kconfig
index fb7b399..59c6c2c 100644
--- a/drivers/clk/ingenic/Kconfig
+++ b/drivers/clk/ingenic/Kconfig
@@ -55,6 +55,16 @@ config INGENIC_CGU_X1000
 
 	  If building for a X1000 SoC, you want to say Y here.
 
+config INGENIC_CGU_X1830
+	bool "Ingenic X1830 CGU driver"
+	default MACH_X1830
+	select INGENIC_CGU_COMMON
+	help
+	  Support the clocks provided by the CGU hardware on Ingenic X1830
+	  and compatible SoCs.
+
+	  If building for a X1830 SoC, you want to say Y here.
+
 config INGENIC_TCU_CLK
 	bool "Ingenic JZ47xx TCU clocks driver"
 	default MACH_INGENIC
diff --git a/drivers/clk/ingenic/Makefile b/drivers/clk/ingenic/Makefile
index 8b1dad9..aaa4bff 100644
--- a/drivers/clk/ingenic/Makefile
+++ b/drivers/clk/ingenic/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_INGENIC_CGU_JZ4725B)	+= jz4725b-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4770)	+= jz4770-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4780)	+= jz4780-cgu.o
 obj-$(CONFIG_INGENIC_CGU_X1000)		+= x1000-cgu.o
+obj-$(CONFIG_INGENIC_CGU_X1830)		+= x1830-cgu.o
 obj-$(CONFIG_INGENIC_TCU_CLK)		+= tcu.o
diff --git a/drivers/clk/ingenic/x1830-cgu.c b/drivers/clk/ingenic/x1830-cgu.c
new file mode 100644
index 00000000..946af6f
--- /dev/null
+++ b/drivers/clk/ingenic/x1830-cgu.c
@@ -0,0 +1,336 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * X1830 SoC CGU driver
+ * Copyright (c) 2019 Zhou Yanjie <zhouyanjie@zoho.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/of.h>
+#include <dt-bindings/clock/x1830-cgu.h>
+#include "cgu.h"
+#include "pm.h"
+
+/* CGU register offsets */
+#define CGU_REG_CPCCR		0x00
+#define CGU_REG_CPPCR		0x0c
+#define CGU_REG_APLL		0x10
+#define CGU_REG_MPLL		0x14
+#define CGU_REG_EPLL		0x58
+#define CGU_REG_VPLL		0xe0
+#define CGU_REG_CLKGR0		0x20
+#define CGU_REG_OPCR		0x24
+#define CGU_REG_CLKGR1		0x28
+#define CGU_REG_DDRCDR		0x2c
+#define CGU_REG_USBPCR		0x3c
+#define CGU_REG_USBRDT		0x40
+#define CGU_REG_USBVBFIL	0x44
+#define CGU_REG_USBPCR1		0x48
+#define CGU_REG_MACCDR		0x54
+#define CGU_REG_I2SCDR		0x60
+#define CGU_REG_LPCDR		0x64
+#define CGU_REG_MSC0CDR		0x68
+#define CGU_REG_I2SCDR1		0x70
+#define CGU_REG_SSICDR		0x74
+#define CGU_REG_CIMCDR		0x7c
+#define CGU_REG_MSC1CDR		0xa4
+#define CGU_REG_CMP_INTR	0xb0
+#define CGU_REG_CMP_INTRE	0xb4
+#define CGU_REG_DRCG		0xd0
+#define CGU_REG_CPCSR		0xd4
+#define CGU_REG_MACPHYC		0xe8
+
+/* bits within the OPCR register */
+#define OPCR_SPENDN0		BIT(7)
+#define OPCR_SPENDN1		BIT(6)
+
+static struct ingenic_cgu *cgu;
+
+static const s8 pll_od_encoding[64] = {
+	0x0, 0x1,  -1, 0x2,  -1,  -1,  -1, 0x3,
+	 -1,  -1,  -1,  -1,  -1,  -1,  -1, 0x4,
+	 -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
+	 -1,  -1,  -1,  -1,  -1,  -1,  -1, 0x5,
+	 -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
+	 -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
+	 -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
+	 -1,  -1,  -1,  -1,  -1,  -1,  -1, 0x6,
+};
+
+static const struct ingenic_cgu_clk_info x1830_cgu_clocks[] = {
+
+	/* External clocks */
+
+	[X1830_CLK_EXCLK] = { "ext", CGU_CLK_EXT },
+	[X1830_CLK_RTCLK] = { "rtc", CGU_CLK_EXT },
+
+	/* PLLs */
+
+	[X1830_CLK_APLL] = {
+		"apll", CGU_CLK_PLL,
+		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
+		.pll = {
+			.version = CGU_X1830,
+			.reg = { CGU_REG_CPPCR, CGU_REG_APLL },
+			.m_shift = 20,
+			.m_bits = 9,
+			.m_offset = 1,
+			.n_shift = 14,
+			.n_bits = 6,
+			.n_offset = 1,
+			.od_shift = 11,
+			.od_bits = 3,
+			.od_max = 64,
+			.od_encoding = pll_od_encoding,
+			.bypass_bit = 30,
+			.enable_bit = 0,
+			.stable_bit = 3,
+		},
+	},
+
+	[X1830_CLK_MPLL] = {
+		"mpll", CGU_CLK_PLL,
+		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
+		.pll = {
+			.version = CGU_X1830,
+			.reg = { CGU_REG_CPPCR, CGU_REG_MPLL },
+			.m_shift = 20,
+			.m_bits = 9,
+			.m_offset = 1,
+			.n_shift = 14,
+			.n_bits = 6,
+			.n_offset = 1,
+			.od_shift = 11,
+			.od_bits = 3,
+			.od_max = 64,
+			.od_encoding = pll_od_encoding,
+			.bypass_bit = 28,
+			.enable_bit = 0,
+			.stable_bit = 3,
+		},
+	},
+
+	[X1830_CLK_EPLL] = {
+		"epll", CGU_CLK_PLL,
+		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
+		.pll = {
+			.version = CGU_X1830,
+			.reg = { CGU_REG_CPPCR, CGU_REG_EPLL },
+			.m_shift = 20,
+			.m_bits = 9,
+			.m_offset = 1,
+			.n_shift = 14,
+			.n_bits = 6,
+			.n_offset = 1,
+			.od_shift = 11,
+			.od_bits = 3,
+			.od_max = 64,
+			.od_encoding = pll_od_encoding,
+			.bypass_bit = 24,
+			.enable_bit = 0,
+			.stable_bit = 3,
+		},
+	},
+
+	[X1830_CLK_VPLL] = {
+		"vpll", CGU_CLK_PLL,
+		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
+		.pll = {
+			.version = CGU_X1830,
+			.reg = { CGU_REG_CPPCR, CGU_REG_VPLL },
+			.m_shift = 20,
+			.m_bits = 9,
+			.m_offset = 1,
+			.n_shift = 14,
+			.n_bits = 6,
+			.n_offset = 1,
+			.od_shift = 11,
+			.od_bits = 3,
+			.od_max = 64,
+			.od_encoding = pll_od_encoding,
+			.bypass_bit = 26,
+			.enable_bit = 0,
+			.stable_bit = 3,
+		},
+	},
+
+	/* Muxes & dividers */
+
+	[X1830_CLK_SCLKA] = {
+		"sclk_a", CGU_CLK_MUX,
+		.parents = { -1, X1830_CLK_EXCLK, X1830_CLK_APLL, -1 },
+		.mux = { CGU_REG_CPCCR, 30, 2 },
+	},
+
+	[X1830_CLK_CPUMUX] = {
+		"cpu_mux", CGU_CLK_MUX,
+		.parents = { -1, X1830_CLK_SCLKA, X1830_CLK_MPLL, -1 },
+		.mux = { CGU_REG_CPCCR, 28, 2 },
+	},
+
+	[X1830_CLK_CPU] = {
+		"cpu", CGU_CLK_DIV,
+		.parents = { X1830_CLK_CPUMUX, -1, -1, -1 },
+		.div = { CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1 },
+	},
+
+	[X1830_CLK_L2CACHE] = {
+		"l2cache", CGU_CLK_DIV,
+		.parents = { X1830_CLK_CPUMUX, -1, -1, -1 },
+		.div = { CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1 },
+	},
+
+	[X1830_CLK_AHB0] = {
+		"ahb0", CGU_CLK_MUX | CGU_CLK_DIV,
+		.parents = { -1, X1830_CLK_SCLKA, X1830_CLK_MPLL, -1 },
+		.mux = { CGU_REG_CPCCR, 26, 2 },
+		.div = { CGU_REG_CPCCR, 8, 1, 4, 21, -1, -1 },
+	},
+
+	[X1830_CLK_AHB2PMUX] = {
+		"ahb2_apb_mux", CGU_CLK_MUX,
+		.parents = { -1, X1830_CLK_SCLKA, X1830_CLK_MPLL, -1 },
+		.mux = { CGU_REG_CPCCR, 24, 2 },
+	},
+
+	[X1830_CLK_AHB2] = {
+		"ahb2", CGU_CLK_DIV,
+		.parents = { X1830_CLK_AHB2PMUX, -1, -1, -1 },
+		.div = { CGU_REG_CPCCR, 12, 1, 4, 20, -1, -1 },
+	},
+
+	[X1830_CLK_PCLK] = {
+		"pclk", CGU_CLK_DIV,
+		.parents = { X1830_CLK_AHB2PMUX, -1, -1, -1 },
+		.div = { CGU_REG_CPCCR, 16, 1, 4, 20, -1, -1 },
+	},
+
+	[X1830_CLK_DDR] = {
+		"ddr", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { -1, X1830_CLK_SCLKA, X1830_CLK_MPLL, -1 },
+		.mux = { CGU_REG_DDRCDR, 30, 2 },
+		.div = { CGU_REG_DDRCDR, 0, 1, 4, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR0, 31 },
+	},
+
+	[X1830_CLK_MAC] = {
+		"mac", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X1830_CLK_SCLKA, X1830_CLK_MPLL,
+					 X1830_CLK_VPLL, X1830_CLK_EPLL },
+		.mux = { CGU_REG_MACCDR, 30, 2 },
+		.div = { CGU_REG_MACCDR, 0, 1, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR1, 4 },
+	},
+
+	[X1830_CLK_MSCMUX] = {
+		"msc_mux", CGU_CLK_MUX,
+		.parents = { X1830_CLK_SCLKA, X1830_CLK_MPLL,
+					 X1830_CLK_VPLL, X1830_CLK_EPLL },
+		.mux = { CGU_REG_MSC0CDR, 30, 2 },
+	},
+
+	[X1830_CLK_MSC0] = {
+		"msc0", CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X1830_CLK_MSCMUX, -1, -1, -1 },
+		.div = { CGU_REG_MSC0CDR, 0, 2, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR0, 4 },
+	},
+
+	[X1830_CLK_MSC1] = {
+		"msc1", CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X1830_CLK_MSCMUX, -1, -1, -1 },
+		.div = { CGU_REG_MSC1CDR, 0, 2, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR0, 5 },
+	},
+
+	[X1830_CLK_SSIPLL] = {
+		"ssi_pll", CGU_CLK_MUX | CGU_CLK_DIV,
+		.parents = { X1830_CLK_SCLKA, X1830_CLK_MPLL,
+					 X1830_CLK_VPLL, X1830_CLK_EPLL },
+		.mux = { CGU_REG_SSICDR, 30, 2 },
+		.div = { CGU_REG_SSICDR, 0, 1, 8, 28, 27, 26 },
+	},
+
+	[X1830_CLK_SSIMUX] = {
+		"ssi_mux", CGU_CLK_MUX,
+		.parents = { X1830_CLK_EXCLK, X1830_CLK_SSIPLL, -1, -1 },
+		.mux = { CGU_REG_SSICDR, 29, 1 },
+	},
+
+	/* Gate-only clocks */
+
+	[X1830_CLK_SSI0] = {
+		"ssi0", CGU_CLK_GATE,
+		.parents = { X1830_CLK_SSIMUX, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 6 },
+	},
+
+	[X1830_CLK_SMB0] = {
+		"smb0", CGU_CLK_GATE,
+		.parents = { X1830_CLK_PCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 7 },
+	},
+
+	[X1830_CLK_SMB1] = {
+		"smb1", CGU_CLK_GATE,
+		.parents = { X1830_CLK_PCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 8 },
+	},
+
+	[X1830_CLK_SMB2] = {
+		"smb2", CGU_CLK_GATE,
+		.parents = { X1830_CLK_PCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 9 },
+	},
+
+	[X1830_CLK_UART0] = {
+		"uart0", CGU_CLK_GATE,
+		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 14 },
+	},
+
+	[X1830_CLK_UART1] = {
+		"uart1", CGU_CLK_GATE,
+		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 15 },
+	},
+
+	[X1830_CLK_SSI1] = {
+		"ssi1", CGU_CLK_GATE,
+		.parents = { X1830_CLK_SSIMUX, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 19 },
+	},
+
+	[X1830_CLK_SFC] = {
+		"sfc", CGU_CLK_GATE,
+		.parents = { X1830_CLK_SSIPLL, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 20 },
+	},
+
+	[X1830_CLK_PDMA] = {
+		"pdma", CGU_CLK_GATE,
+		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 21 },
+	},
+};
+
+static void __init x1830_cgu_init(struct device_node *np)
+{
+	int retval;
+
+	cgu = ingenic_cgu_new(x1830_cgu_clocks,
+			      ARRAY_SIZE(x1830_cgu_clocks), np);
+	if (!cgu) {
+		pr_err("%s: failed to initialise CGU\n", __func__);
+		return;
+	}
+
+	retval = ingenic_cgu_register_clocks(cgu);
+	if (retval) {
+		pr_err("%s: failed to register CGU Clocks\n", __func__);
+		return;
+	}
+
+	ingenic_cgu_register_syscore_ops(cgu);
+}
+CLK_OF_DECLARE_DRIVER(x1830_cgu, "ingenic,x1830-cgu", x1830_cgu_init);
-- 
2.7.4


