Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C660D1098D7
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2019 06:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbfKZFfV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Nov 2019 00:35:21 -0500
Received: from sender4-pp-o97.zoho.com ([136.143.188.97]:25783 "EHLO
        sender4-pp-o97.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfKZFfU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Nov 2019 00:35:20 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574746487; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=Dq0b4TyGMHqk3ijHZnZil8juYRNT6R+l6W84GYoC11l2fBhVwomV8mtsQbvZaOOF0CtrytdQYsUaoe8a/r5QLT43+4Nz/ggiyIvcXDZIucYq8B8ysNJomgG9EV2vX96zp1j2JoHdK/MraYxl2jcr0vZZguSuX73MuDaAkkpAZBo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574746487; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=daQLwlxO9X0/LGxD7GLZcjAmtuEugfe/4ZMiqWDUXZs=; 
        b=JgC7+l1QRBMuXY/Y9gTX/Nz2jVV9QiQSHRx12692vZ6CejV19GcIXMXnB1vnar+1aUCJ3P2lpbmMToz9U5PrZ+Dm8VK4V+uP83eQkYrQ3QKgtPUC86iL/p1UCO+0+qX43/tNNX1eBUKLPiDWazUrAaJbk7sAZ59WmrFAOzK+f1g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=Cbc2foW3NcPzCWiTqPJS7/qwSgmGAVbwDr/ZBdY4T95LVYuIB/HO9Ovp6M0rm9vjh4bm+ciTwVLO
    /2h8mZ7zUttDsSMU7yqDq9n29u+7xXqS5xp6+5l6UY1x3ek6YK+j  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574746487;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=daQLwlxO9X0/LGxD7GLZcjAmtuEugfe/4ZMiqWDUXZs=;
        b=AGlMGSDr4oADdfSzq70vrvRRadlZBASl4Jw58o4suj/If5zbku7WvFfjrHMTtEQF
        DyIdm130FwwIrMrnLJK9V2TmnWNuFO9Cr4BRjTlSvs4qgu7O0hbpIvF+zhrxypVJl21
        biwmY7nrhW4xXRA5DQBodCggbd3TDkFb+0N0eQds=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1574746485641934.2376507063308; Mon, 25 Nov 2019 21:34:45 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mark.rutland@arm.com, syq@debian.org
Subject: [PATCH v6 4/4] pinctrl: Ingenic: Add pinctrl driver for X1830.
Date:   Tue, 26 Nov 2019 13:33:56 +0800
Message-Id: <1574746436-80066-5-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574746436-80066-1-git-send-email-zhouyanjie@zoho.com>
References: <1574746436-80066-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for probing the pinctrl-ingenic driver on the
X1830 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---

Notes:
    v2:
    New patch.
    
    v2->v3:
    Add pinctrl drivers for the PWM of X1830.
    
    v3->v4:
    1.Use local variables to streamline code.
    2.Prevents processors older than X1830 from being
      configured in HiZ mode.
    
    v4->v5:
    Fix compile-time warnings.
    Reported-by: kbuild test robot <lkp@intel.com>
    
    v5->v6:
    1.Use local variables to streamline code.
    2.Rename "GPIO_HIZ" to "GPIO_PULL_DIS", and adjust
      related code.

 drivers/pinctrl/pinctrl-ingenic.c | 341 +++++++++++++++++++++++++++++++++++---
 1 file changed, 321 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 38f7f147..7b1b7ee 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -28,6 +28,10 @@
 #define GPIO_PIN	0x00
 #define GPIO_MSK	0x20
 
+#define GPIO_PULL_DIS	0x00
+#define GPIO_PULL_UP	0x01
+#define GPIO_PULL_DOWN	0x10
+
 #define JZ4740_GPIO_DATA	0x10
 #define JZ4740_GPIO_PULL_DIS	0x30
 #define JZ4740_GPIO_FUNC	0x40
@@ -45,6 +49,11 @@
 #define X1000_GPIO_PZ_BASE		0x700
 #define X1000_GPIO_PZ_GID2LD	0x7f0
 
+#define X1830_GPIO_PEL			0x110
+#define X1830_GPIO_PEH			0x120
+#define X1830_GPIO_PZ_BASE		0x7000
+#define X1830_GPIO_PZ_GID2LD	0x70f0
+
 #define REG_SET(x) ((x) + 0x4)
 #define REG_CLEAR(x) ((x) + 0x8)
 
@@ -60,6 +69,7 @@ enum jz_version {
 	ID_X1000,
 	ID_X1000E,
 	ID_X1500,
+	ID_X1830,
 };
 
 struct ingenic_chip_info {
@@ -1394,6 +1404,220 @@ static const struct ingenic_chip_info x1500_chip_info = {
 	.pull_downs = x1000_pull_downs,
 };
 
+static const u32 x1830_pull_ups[4] = {
+	0x5fdfffc0, 0xffffefff, 0x1ffffbff, 0x0fcff3fc,
+};
+
+static const u32 x1830_pull_downs[4] = {
+	0x5fdfffc0, 0xffffefff, 0x1ffffbff, 0x0fcff3fc,
+};
+
+static int x1830_uart0_data_pins[] = { 0x33, 0x36, };
+static int x1830_uart0_hwflow_pins[] = { 0x34, 0x35, };
+static int x1830_uart1_data_pins[] = { 0x38, 0x37, };
+static int x1830_sfc_pins[] = { 0x17, 0x18, 0x1a, 0x19, 0x1b, 0x1c, };
+static int x1830_ssi0_dt_pins[] = { 0x4c, };
+static int x1830_ssi0_dr_pins[] = { 0x4b, };
+static int x1830_ssi0_clk_pins[] = { 0x4f, };
+static int x1830_ssi0_gpc_pins[] = { 0x4d, };
+static int x1830_ssi0_ce0_pins[] = { 0x50, };
+static int x1830_ssi0_ce1_pins[] = { 0x4e, };
+static int x1830_ssi1_dt_c_pins[] = { 0x53, };
+static int x1830_ssi1_dr_c_pins[] = { 0x54, };
+static int x1830_ssi1_clk_c_pins[] = { 0x57, };
+static int x1830_ssi1_gpc_c_pins[] = { 0x55, };
+static int x1830_ssi1_ce0_c_pins[] = { 0x58, };
+static int x1830_ssi1_ce1_c_pins[] = { 0x56, };
+static int x1830_ssi1_dt_d_pins[] = { 0x62, };
+static int x1830_ssi1_dr_d_pins[] = { 0x63, };
+static int x1830_ssi1_clk_d_pins[] = { 0x66, };
+static int x1830_ssi1_gpc_d_pins[] = { 0x64, };
+static int x1830_ssi1_ce0_d_pins[] = { 0x67, };
+static int x1830_ssi1_ce1_d_pins[] = { 0x65, };
+static int x1830_mmc0_1bit_pins[] = { 0x24, 0x25, 0x20, };
+static int x1830_mmc0_4bit_pins[] = { 0x21, 0x22, 0x23, };
+static int x1830_mmc1_1bit_pins[] = { 0x42, 0x43, 0x44, };
+static int x1830_mmc1_4bit_pins[] = { 0x45, 0x46, 0x47, };
+static int x1830_i2c0_pins[] = { 0x0c, 0x0d, };
+static int x1830_i2c1_pins[] = { 0x39, 0x3a, };
+static int x1830_i2c2_pins[] = { 0x5b, 0x5c, };
+static int x1830_pwm_pwm0_b_pins[] = { 0x31, };
+static int x1830_pwm_pwm0_c_pins[] = { 0x4b, };
+static int x1830_pwm_pwm1_b_pins[] = { 0x32, };
+static int x1830_pwm_pwm1_c_pins[] = { 0x4c, };
+static int x1830_pwm_pwm2_c_8_pins[] = { 0x48, };
+static int x1830_pwm_pwm2_c_13_pins[] = { 0x4d, };
+static int x1830_pwm_pwm3_c_9_pins[] = { 0x49, };
+static int x1830_pwm_pwm3_c_14_pins[] = { 0x4e, };
+static int x1830_pwm_pwm4_c_15_pins[] = { 0x4f, };
+static int x1830_pwm_pwm4_c_25_pins[] = { 0x59, };
+static int x1830_pwm_pwm5_c_16_pins[] = { 0x50, };
+static int x1830_pwm_pwm5_c_26_pins[] = { 0x5a, };
+static int x1830_pwm_pwm6_c_17_pins[] = { 0x51, };
+static int x1830_pwm_pwm6_c_27_pins[] = { 0x5b, };
+static int x1830_pwm_pwm7_c_18_pins[] = { 0x52, };
+static int x1830_pwm_pwm7_c_28_pins[] = { 0x5c, };
+static int x1830_mac_pins[] = {
+	0x29, 0x30, 0x2f, 0x28, 0x2e, 0x2d, 0x2a, 0x2b, 0x26, 0x27,
+};
+
+static int x1830_uart0_data_funcs[] = { 0, 0, };
+static int x1830_uart0_hwflow_funcs[] = { 0, 0, };
+static int x1830_uart1_data_funcs[] = { 0, 0, };
+static int x1830_sfc_funcs[] = { 1, 1, 1, 1, 1, 1, };
+static int x1830_ssi0_dt_funcs[] = { 0, };
+static int x1830_ssi0_dr_funcs[] = { 0, };
+static int x1830_ssi0_clk_funcs[] = { 0, };
+static int x1830_ssi0_gpc_funcs[] = { 0, };
+static int x1830_ssi0_ce0_funcs[] = { 0, };
+static int x1830_ssi0_ce1_funcs[] = { 0, };
+static int x1830_ssi1_dt_c_funcs[] = { 1, };
+static int x1830_ssi1_dr_c_funcs[] = { 1, };
+static int x1830_ssi1_clk_c_funcs[] = { 1, };
+static int x1830_ssi1_gpc_c_funcs[] = { 1, };
+static int x1830_ssi1_ce0_c_funcs[] = { 1, };
+static int x1830_ssi1_ce1_c_funcs[] = { 1, };
+static int x1830_ssi1_dt_d_funcs[] = { 2, };
+static int x1830_ssi1_dr_d_funcs[] = { 2, };
+static int x1830_ssi1_clk_d_funcs[] = { 2, };
+static int x1830_ssi1_gpc_d_funcs[] = { 2, };
+static int x1830_ssi1_ce0_d_funcs[] = { 2, };
+static int x1830_ssi1_ce1_d_funcs[] = { 2, };
+static int x1830_mmc0_1bit_funcs[] = { 0, 0, 0, };
+static int x1830_mmc0_4bit_funcs[] = { 0, 0, 0, };
+static int x1830_mmc1_1bit_funcs[] = { 0, 0, 0, };
+static int x1830_mmc1_4bit_funcs[] = { 0, 0, 0, };
+static int x1830_i2c0_funcs[] = { 1, 1, };
+static int x1830_i2c1_funcs[] = { 0, 0, };
+static int x1830_i2c2_funcs[] = { 1, 1, };
+static int x1830_pwm_pwm0_b_funcs[] = { 0, };
+static int x1830_pwm_pwm0_c_funcs[] = { 1, };
+static int x1830_pwm_pwm1_b_funcs[] = { 0, };
+static int x1830_pwm_pwm1_c_funcs[] = { 1, };
+static int x1830_pwm_pwm2_c_8_funcs[] = { 0, };
+static int x1830_pwm_pwm2_c_13_funcs[] = { 1, };
+static int x1830_pwm_pwm3_c_9_funcs[] = { 0, };
+static int x1830_pwm_pwm3_c_14_funcs[] = { 1, };
+static int x1830_pwm_pwm4_c_15_funcs[] = { 1, };
+static int x1830_pwm_pwm4_c_25_funcs[] = { 0, };
+static int x1830_pwm_pwm5_c_16_funcs[] = { 1, };
+static int x1830_pwm_pwm5_c_26_funcs[] = { 0, };
+static int x1830_pwm_pwm6_c_17_funcs[] = { 1, };
+static int x1830_pwm_pwm6_c_27_funcs[] = { 0, };
+static int x1830_pwm_pwm7_c_18_funcs[] = { 1, };
+static int x1830_pwm_pwm7_c_28_funcs[] = { 0, };
+static int x1830_mac_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, };
+
+static const struct group_desc x1830_groups[] = {
+	INGENIC_PIN_GROUP("uart0-data", x1830_uart0_data),
+	INGENIC_PIN_GROUP("uart0-hwflow", x1830_uart0_hwflow),
+	INGENIC_PIN_GROUP("uart1-data", x1830_uart1_data),
+	INGENIC_PIN_GROUP("sfc", x1830_sfc),
+	INGENIC_PIN_GROUP("ssi0-dt", x1830_ssi0_dt),
+	INGENIC_PIN_GROUP("ssi0-dr", x1830_ssi0_dr),
+	INGENIC_PIN_GROUP("ssi0-clk", x1830_ssi0_clk),
+	INGENIC_PIN_GROUP("ssi0-gpc", x1830_ssi0_gpc),
+	INGENIC_PIN_GROUP("ssi0-ce0", x1830_ssi0_ce0),
+	INGENIC_PIN_GROUP("ssi0-ce1", x1830_ssi0_ce1),
+	INGENIC_PIN_GROUP("ssi1-dt-c", x1830_ssi1_dt_c),
+	INGENIC_PIN_GROUP("ssi1-dr-c", x1830_ssi1_dr_c),
+	INGENIC_PIN_GROUP("ssi1-clk-c", x1830_ssi1_clk_c),
+	INGENIC_PIN_GROUP("ssi1-gpc-c", x1830_ssi1_gpc_c),
+	INGENIC_PIN_GROUP("ssi1-ce0-c", x1830_ssi1_ce0_c),
+	INGENIC_PIN_GROUP("ssi1-ce1-c", x1830_ssi1_ce1_c),
+	INGENIC_PIN_GROUP("ssi1-dt-d", x1830_ssi1_dt_d),
+	INGENIC_PIN_GROUP("ssi1-dr-d", x1830_ssi1_dr_d),
+	INGENIC_PIN_GROUP("ssi1-clk-d", x1830_ssi1_clk_d),
+	INGENIC_PIN_GROUP("ssi1-gpc-d", x1830_ssi1_gpc_d),
+	INGENIC_PIN_GROUP("ssi1-ce0-d", x1830_ssi1_ce0_d),
+	INGENIC_PIN_GROUP("ssi1-ce1-d", x1830_ssi1_ce1_d),
+	INGENIC_PIN_GROUP("mmc0-1bit", x1830_mmc0_1bit),
+	INGENIC_PIN_GROUP("mmc0-4bit", x1830_mmc0_4bit),
+	INGENIC_PIN_GROUP("mmc1-1bit", x1830_mmc1_1bit),
+	INGENIC_PIN_GROUP("mmc1-4bit", x1830_mmc1_4bit),
+	INGENIC_PIN_GROUP("i2c0-data", x1830_i2c0),
+	INGENIC_PIN_GROUP("i2c1-data", x1830_i2c1),
+	INGENIC_PIN_GROUP("i2c2-data", x1830_i2c2),
+	INGENIC_PIN_GROUP("pwm0-b", x1830_pwm_pwm0_b),
+	INGENIC_PIN_GROUP("pwm0-c", x1830_pwm_pwm0_c),
+	INGENIC_PIN_GROUP("pwm1-b", x1830_pwm_pwm1_b),
+	INGENIC_PIN_GROUP("pwm1-c", x1830_pwm_pwm1_c),
+	INGENIC_PIN_GROUP("pwm2-c-8", x1830_pwm_pwm2_c_8),
+	INGENIC_PIN_GROUP("pwm2-c-13", x1830_pwm_pwm2_c_13),
+	INGENIC_PIN_GROUP("pwm3-c-9", x1830_pwm_pwm3_c_9),
+	INGENIC_PIN_GROUP("pwm3-c-14", x1830_pwm_pwm3_c_14),
+	INGENIC_PIN_GROUP("pwm4-c-15", x1830_pwm_pwm4_c_15),
+	INGENIC_PIN_GROUP("pwm4-c-25", x1830_pwm_pwm4_c_25),
+	INGENIC_PIN_GROUP("pwm5-c-16", x1830_pwm_pwm5_c_16),
+	INGENIC_PIN_GROUP("pwm5-c-26", x1830_pwm_pwm5_c_26),
+	INGENIC_PIN_GROUP("pwm6-c-17", x1830_pwm_pwm6_c_17),
+	INGENIC_PIN_GROUP("pwm6-c-27", x1830_pwm_pwm6_c_27),
+	INGENIC_PIN_GROUP("pwm7-c-18", x1830_pwm_pwm7_c_18),
+	INGENIC_PIN_GROUP("pwm7-c-28", x1830_pwm_pwm7_c_28),
+	INGENIC_PIN_GROUP("mac", x1830_mac),
+};
+
+static const char *x1830_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
+static const char *x1830_uart1_groups[] = { "uart1-data", };
+static const char *x1830_sfc_groups[] = { "sfc", };
+static const char *x1830_ssi0_groups[] = {
+	"ssi0-dt", "ssi0-dr", "ssi0-clk", "ssi0-gpc", "ssi0-ce0", "ssi0-ce1",
+};
+static const char *x1830_ssi1_groups[] = {
+	"ssi1-dt-c", "ssi1-dt-d",
+	"ssi1-dr-c", "ssi1-dr-d",
+	"ssi1-clk-c", "ssi1-clk-d",
+	"ssi1-gpc-c", "ssi1-gpc-d",
+	"ssi1-ce0-c", "ssi1-ce0-d",
+	"ssi1-ce1-c", "ssi1-ce1-d",
+};
+static const char *x1830_mmc0_groups[] = { "mmc0-1bit", "mmc0-4bit", };
+static const char *x1830_mmc1_groups[] = { "mmc1-1bit", "mmc1-4bit", };
+static const char *x1830_i2c0_groups[] = { "i2c0-data", };
+static const char *x1830_i2c1_groups[] = { "i2c1-data", };
+static const char *x1830_i2c2_groups[] = { "i2c2-data", };
+static const char *x1830_pwm0_groups[] = { "pwm0-b", "pwm0-c", };
+static const char *x1830_pwm1_groups[] = { "pwm1-b", "pwm1-c", };
+static const char *x1830_pwm2_groups[] = { "pwm2-c-8", "pwm2-c-13", };
+static const char *x1830_pwm3_groups[] = { "pwm3-c-9", "pwm3-c-14", };
+static const char *x1830_pwm4_groups[] = { "pwm4-c-15", "pwm4-c-25", };
+static const char *x1830_pwm5_groups[] = { "pwm5-c-16", "pwm5-c-26", };
+static const char *x1830_pwm6_groups[] = { "pwm6-c-17", "pwm6-c-27", };
+static const char *x1830_pwm7_groups[] = { "pwm7-c-18", "pwm7-c-28", };
+static const char *x1830_mac_groups[] = { "mac", };
+
+static const struct function_desc x1830_functions[] = {
+	{ "uart0", x1830_uart0_groups, ARRAY_SIZE(x1830_uart0_groups), },
+	{ "uart1", x1830_uart1_groups, ARRAY_SIZE(x1830_uart1_groups), },
+	{ "sfc", x1830_sfc_groups, ARRAY_SIZE(x1830_sfc_groups), },
+	{ "ssi0", x1830_ssi0_groups, ARRAY_SIZE(x1830_ssi0_groups), },
+	{ "ssi1", x1830_ssi1_groups, ARRAY_SIZE(x1830_ssi1_groups), },
+	{ "mmc0", x1830_mmc0_groups, ARRAY_SIZE(x1830_mmc0_groups), },
+	{ "mmc1", x1830_mmc1_groups, ARRAY_SIZE(x1830_mmc1_groups), },
+	{ "i2c0", x1830_i2c0_groups, ARRAY_SIZE(x1830_i2c0_groups), },
+	{ "i2c1", x1830_i2c1_groups, ARRAY_SIZE(x1830_i2c1_groups), },
+	{ "i2c2", x1830_i2c2_groups, ARRAY_SIZE(x1830_i2c2_groups), },
+	{ "pwm0", x1830_pwm0_groups, ARRAY_SIZE(x1830_pwm0_groups), },
+	{ "pwm1", x1830_pwm1_groups, ARRAY_SIZE(x1830_pwm1_groups), },
+	{ "pwm2", x1830_pwm2_groups, ARRAY_SIZE(x1830_pwm2_groups), },
+	{ "pwm3", x1830_pwm3_groups, ARRAY_SIZE(x1830_pwm3_groups), },
+	{ "pwm4", x1830_pwm4_groups, ARRAY_SIZE(x1830_pwm4_groups), },
+	{ "pwm5", x1830_pwm5_groups, ARRAY_SIZE(x1830_pwm4_groups), },
+	{ "pwm6", x1830_pwm6_groups, ARRAY_SIZE(x1830_pwm4_groups), },
+	{ "pwm7", x1830_pwm7_groups, ARRAY_SIZE(x1830_pwm4_groups), },
+	{ "mac", x1830_mac_groups, ARRAY_SIZE(x1830_mac_groups), },
+};
+
+static const struct ingenic_chip_info x1830_chip_info = {
+	.num_chips = 4,
+	.groups = x1830_groups,
+	.num_groups = ARRAY_SIZE(x1830_groups),
+	.functions = x1830_functions,
+	.num_functions = ARRAY_SIZE(x1830_functions),
+	.pull_ups = x1830_pull_ups,
+	.pull_downs = x1830_pull_downs,
+};
+
 static u32 ingenic_gpio_read_reg(struct ingenic_gpio_chip *jzgc, u8 reg)
 {
 	unsigned int val;
@@ -1422,13 +1646,20 @@ static void ingenic_gpio_shadow_set_bit(struct ingenic_gpio_chip *jzgc,
 	else
 		reg = REG_CLEAR(reg);
 
-	regmap_write(jzgc->jzpc->map, X1000_GPIO_PZ_BASE + reg, BIT(offset));
+	if (jzgc->jzpc->version >= ID_X1830)
+		regmap_write(jzgc->jzpc->map, X1830_GPIO_PZ_BASE + reg, BIT(offset));
+	else
+		regmap_write(jzgc->jzpc->map, X1000_GPIO_PZ_BASE + reg, BIT(offset));
 }
 
 static void ingenic_gpio_shadow_set_bit_load(struct ingenic_gpio_chip *jzgc)
 {
-	regmap_write(jzgc->jzpc->map, X1000_GPIO_PZ_GID2LD,
-			jzgc->gc.base / PINS_PER_GPIO_CHIP);
+	unsigned int offt = jzgc->gc.base / PINS_PER_GPIO_CHIP;
+
+	if (jzgc->jzpc->version >= ID_X1830)
+		regmap_write(jzgc->jzpc->map, X1830_GPIO_PZ_GID2LD, offt);
+	else
+		regmap_write(jzgc->jzpc->map, X1000_GPIO_PZ_GID2LD, offt);
 }
 
 static inline bool ingenic_gpio_get_value(struct ingenic_gpio_chip *jzgc,
@@ -1668,25 +1899,36 @@ static inline void ingenic_config_pin(struct ingenic_pinctrl *jzpc,
 		unsigned int pin, u8 reg, bool set)
 {
 	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
-	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
+	unsigned int offt1 = pin / PINS_PER_GPIO_CHIP;
+	unsigned int offt2 = set ? REG_SET(reg) : REG_CLEAR(reg);
 
-	regmap_write(jzpc->map, offt * 0x100 +
-			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
+	if (jzpc->version >= ID_X1830)
+		regmap_write(jzpc->map, offt1 * 0x1000 + offt2, BIT(idx));
+	else
+		regmap_write(jzpc->map, offt1 * 0x100 + offt2, BIT(idx));
 }
 
 static inline void ingenic_shadow_config_pin(struct ingenic_pinctrl *jzpc,
 		unsigned int pin, u8 reg, bool set)
 {
 	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
+	unsigned int offt = set ? REG_SET(reg) : REG_CLEAR(reg);
 
-	regmap_write(jzpc->map, X1000_GPIO_PZ_BASE +
-			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
+	if (jzpc->version >= ID_X1830)
+		regmap_write(jzpc->map, X1830_GPIO_PZ_BASE + offt, BIT(idx));
+	else
+		regmap_write(jzpc->map, X1000_GPIO_PZ_BASE + offt, BIT(idx));
 }
 
 static inline void ingenic_shadow_config_pin_load(struct ingenic_pinctrl *jzpc,
 		unsigned int pin)
 {
-	regmap_write(jzpc->map, X1000_GPIO_PZ_GID2LD, pin / PINS_PER_GPIO_CHIP);
+	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
+
+	if (jzpc->version >= ID_X1830)
+		regmap_write(jzpc->map, X1830_GPIO_PZ_GID2LD, offt);
+	else
+		regmap_write(jzpc->map, X1000_GPIO_PZ_GID2LD, offt);
 }
 
 static inline bool ingenic_get_pin_config(struct ingenic_pinctrl *jzpc,
@@ -1696,7 +1938,10 @@ static inline bool ingenic_get_pin_config(struct ingenic_pinctrl *jzpc,
 	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
 	unsigned int val;
 
-	regmap_read(jzpc->map, offt * 0x100 + reg, &val);
+	if (jzpc->version >= ID_X1830)
+		regmap_read(jzpc->map, offt * 0x1000 + reg, &val);
+	else
+		regmap_read(jzpc->map, offt * 0x100 + reg, &val);
 
 	return val & BIT(idx);
 }
@@ -1857,12 +2102,60 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 }
 
 static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
-		unsigned int pin, bool enabled)
+		unsigned int pin, unsigned int bias)
 {
-	if (jzpc->version >= ID_JZ4760)
-		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PEN, !enabled);
-	else
-		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_PULL_DIS, !enabled);
+	if (jzpc->version >= ID_X1830) {
+		unsigned int idx = pin % PINS_PER_GPIO_CHIP;
+		unsigned int idxl = pin % PINS_PER_GPIO_CHIP * 2;
+		unsigned int idxh = pin % PINS_PER_GPIO_CHIP % 16 * 2;
+		unsigned int offt = pin / PINS_PER_GPIO_CHIP;
+		unsigned int half = PINS_PER_GPIO_CHIP / 2;
+
+		switch (bias) {
+		case GPIO_PULL_UP:
+			if (idx < half) {
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_CLEAR(X1830_GPIO_PEL), BIT(idxl) * 2);
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_SET(X1830_GPIO_PEL), BIT(idxl));
+			} else {
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_CLEAR(X1830_GPIO_PEH), BIT(idxh) * 2);
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_SET(X1830_GPIO_PEH), BIT(idxh));
+			}
+			break;
+
+		case GPIO_PULL_DOWN:
+			if (idx < half) {
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_CLEAR(X1830_GPIO_PEL), BIT(idxl));
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_SET(X1830_GPIO_PEL), BIT(idxl) * 2);
+			} else {
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_CLEAR(X1830_GPIO_PEH), BIT(idxh));
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_SET(X1830_GPIO_PEH), BIT(idxh) * 2);
+			}
+			break;
+
+		case GPIO_PULL_DIS:
+		default:
+			if (idx < half)
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_CLEAR(X1830_GPIO_PEL), BIT(idxl) * 3);
+			else
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_CLEAR(X1830_GPIO_PEH), BIT(idxh) * 3);
+			break;
+		}
+
+	} else if (jzpc->version >= ID_JZ4760) {
+		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PEN, !bias);
+	} else {
+		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_PULL_DIS, !bias);
+	}
 }
 
 static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
@@ -1889,7 +2182,7 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		case PIN_CONFIG_BIAS_DISABLE:
 			dev_dbg(jzpc->dev, "disable pull-over for pin P%c%u\n",
 					'A' + offt, idx);
-			ingenic_set_bias(jzpc, pin, false);
+			ingenic_set_bias(jzpc, pin, GPIO_PULL_DIS);
 			break;
 
 		case PIN_CONFIG_BIAS_PULL_UP:
@@ -1897,7 +2190,7 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				return -EINVAL;
 			dev_dbg(jzpc->dev, "set pull-up for pin P%c%u\n",
 					'A' + offt, idx);
-			ingenic_set_bias(jzpc, pin, true);
+			ingenic_set_bias(jzpc, pin, GPIO_PULL_UP);
 			break;
 
 		case PIN_CONFIG_BIAS_PULL_DOWN:
@@ -1905,7 +2198,7 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				return -EINVAL;
 			dev_dbg(jzpc->dev, "set pull-down for pin P%c%u\n",
 					'A' + offt, idx);
-			ingenic_set_bias(jzpc, pin, true);
+			ingenic_set_bias(jzpc, pin, GPIO_PULL_DOWN);
 			break;
 
 		default:
@@ -1987,6 +2280,7 @@ static const struct of_device_id ingenic_pinctrl_of_match[] = {
 	{ .compatible = "ingenic,x1000-pinctrl", .data = (void *) ID_X1000 },
 	{ .compatible = "ingenic,x1000e-pinctrl", .data = (void *) ID_X1000E },
 	{ .compatible = "ingenic,x1500-pinctrl", .data = (void *) ID_X1500 },
+	{ .compatible = "ingenic,x1830-pinctrl", .data = (void *) ID_X1830 },
 	{},
 };
 
@@ -1996,6 +2290,7 @@ static const struct of_device_id ingenic_gpio_of_match[] __initconst = {
 	{ .compatible = "ingenic,jz4770-gpio", },
 	{ .compatible = "ingenic,jz4780-gpio", },
 	{ .compatible = "ingenic,x1000-gpio", },
+	{ .compatible = "ingenic,x1830-gpio", },
 	{},
 };
 
@@ -2018,7 +2313,10 @@ static int __init ingenic_gpio_probe(struct ingenic_pinctrl *jzpc,
 		return -ENOMEM;
 
 	jzgc->jzpc = jzpc;
-	jzgc->reg_base = bank * 0x100;
+	if (jzpc->version >= ID_X1830)
+		jzgc->reg_base = bank * 0x1000;
+	else
+		jzgc->reg_base = bank * 0x100;
 
 	jzgc->gc.label = devm_kasprintf(dev, GFP_KERNEL, "GPIO%c", 'A' + bank);
 	if (!jzgc->gc.label)
@@ -2111,7 +2409,9 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	else
 		jzpc->version = (enum jz_version)id->driver_data;
 
-	if (jzpc->version >= ID_X1500)
+	if (jzpc->version >= ID_X1830)
+		chip_info = &x1830_chip_info;
+	else if (jzpc->version >= ID_X1500)
 		chip_info = &x1500_chip_info;
 	else if (jzpc->version >= ID_X1000E)
 		chip_info = &x1000e_chip_info;
@@ -2208,6 +2508,7 @@ static const struct platform_device_id ingenic_pinctrl_ids[] = {
 	{ "x1000-pinctrl", ID_X1000 },
 	{ "x1000e-pinctrl", ID_X1000E },
 	{ "x1500-pinctrl", ID_X1500 },
+	{ "x1830-pinctrl", ID_X1830 },
 	{},
 };
 
-- 
2.7.4


