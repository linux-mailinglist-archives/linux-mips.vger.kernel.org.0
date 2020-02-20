Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4D616628C
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 17:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgBTQ0D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 11:26:03 -0500
Received: from out28-195.mail.aliyun.com ([115.124.28.195]:57095 "EHLO
        out28-195.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728217AbgBTQ0C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Feb 2020 11:26:02 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07466222|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.452662-0.00849394-0.538844;DS=CONTINUE|ham_alarm|0.00316388-0.000108622-0.996728;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03279;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.GqC0FCl_1582215911;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GqC0FCl_1582215911)
          by smtp.aliyun-inc.com(10.147.40.2);
          Fri, 21 Feb 2020 00:25:22 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, tglx@linutronix.de,
        ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, sboyd@kernel.org,
        mturquette@baylibre.com, mark.rutland@arm.com, robh+dt@kernel.org,
        daniel.lezcano@linaro.org, paul@crapouillou.net,
        geert+renesas@glider.be, krzk@kernel.org, ebiederm@xmission.com,
        miquel.raynal@bootlin.com, keescook@chromium.org,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        dongsheng.qiu@ingenic.com
Subject: [PATCH v6 1/7] clk: JZ4780: Add function for enable the second core.
Date:   Fri, 21 Feb 2020 00:24:43 +0800
Message-Id: <1582215889-113034-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582215889-113034-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1582215889-113034-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add "jz4780_core1_enable()" for enable the second core of JZ4780,
prepare for later commits.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
Tested-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---

Notes:
    v5:
    New patch, split from [1/6] in v4.
    
    v5->v6:
    simplify code with "readl_poll_timeout()".

 drivers/clk/ingenic/jz4780-cgu.c | 55 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index d07fff1..92102d8 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -9,14 +9,16 @@
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/of.h>
+
 #include <dt-bindings/clock/jz4780-cgu.h>
 #include "cgu.h"
 #include "pm.h"
 
 /* CGU register offsets */
 #define CGU_REG_CLOCKCONTROL	0x00
-#define CGU_REG_PLLCONTROL	0x0c
+#define CGU_REG_LCR			0x04
 #define CGU_REG_APLL		0x10
 #define CGU_REG_MPLL		0x14
 #define CGU_REG_EPLL		0x18
@@ -46,8 +48,8 @@
 #define CGU_REG_CLOCKSTATUS	0xd4
 
 /* bits within the OPCR register */
-#define OPCR_SPENDN0		(1 << 7)
-#define OPCR_SPENDN1		(1 << 6)
+#define OPCR_SPENDN0		BIT(7)
+#define OPCR_SPENDN1		BIT(6)
 
 /* bits within the USBPCR register */
 #define USBPCR_USB_MODE		BIT(31)
@@ -88,6 +90,13 @@
 #define USBVBFIL_IDDIGFIL_MASK	(0xffff << USBVBFIL_IDDIGFIL_SHIFT)
 #define USBVBFIL_USBVBFIL_MASK	(0xffff)
 
+/* bits within the LCR register */
+#define LCR_PD_SCPU			BIT(31)
+#define LCR_SCPUS			BIT(27)
+
+/* bits within the CLKGR1 register */
+#define CLKGR1_CORE1		BIT(15)
+
 static struct ingenic_cgu *cgu;
 
 static u8 jz4780_otg_phy_get_parent(struct clk_hw *hw)
@@ -205,6 +214,42 @@ static const struct clk_ops jz4780_otg_phy_ops = {
 	.set_rate = jz4780_otg_phy_set_rate,
 };
 
+static int jz4780_core1_enable(struct clk_hw *hw)
+{
+	struct ingenic_clk *ingenic_clk = to_ingenic_clk(hw);
+	struct ingenic_cgu *cgu = ingenic_clk->cgu;
+	const unsigned int timeout = 5000;
+	unsigned long flags;
+	int retval;
+	u32 lcr, clkgr1;
+
+	spin_lock_irqsave(&cgu->lock, flags);
+
+	lcr = readl(cgu->base + CGU_REG_LCR);
+	lcr &= ~LCR_PD_SCPU;
+	writel(lcr, cgu->base + CGU_REG_LCR);
+
+	clkgr1 = readl(cgu->base + CGU_REG_CLKGR1);
+	clkgr1 &= ~CLKGR1_CORE1;
+	writel(clkgr1, cgu->base + CGU_REG_CLKGR1);
+
+	spin_unlock_irqrestore(&cgu->lock, flags);
+
+	/* wait for the CPU to be powered up */
+	retval = readl_poll_timeout(cgu->base + CGU_REG_LCR, lcr,
+				 !(lcr & LCR_SCPUS), 10, timeout);
+	if (retval == -ETIMEDOUT) {
+		pr_err("%s: Wait for power up core1 timeout\n", __func__);
+		return retval;
+	}
+
+	return 0;
+}
+
+static const struct clk_ops jz4780_core1_ops = {
+	.enable = jz4780_core1_enable,
+};
+
 static const s8 pll_od_encoding[16] = {
 	0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7,
 	0x8, 0x9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf,
@@ -701,9 +746,9 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 	},
 
 	[JZ4780_CLK_CORE1] = {
-		"core1", CGU_CLK_GATE,
+		"core1", CGU_CLK_CUSTOM,
 		.parents = { JZ4780_CLK_CPU, -1, -1, -1 },
-		.gate = { CGU_REG_CLKGR1, 15 },
+		.custom = { &jz4780_core1_ops },
 	},
 
 };
-- 
2.7.4

