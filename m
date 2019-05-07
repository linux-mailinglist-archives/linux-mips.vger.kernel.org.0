Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C00A16B71
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2019 21:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfEGTes (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 May 2019 15:34:48 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:56208 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbfEGTer (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 May 2019 15:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1557257684; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iPX9tqlcV3Mqzr6PCxQ/J+TBbWjuB9oRfNwRjXOAVq0=;
        b=BjsrOmH/9r9zfZXty+GW39MvchWH50NsjnVF6AX47hFM/u2zd7n/mamVwPcP0mV0IZFgOL
        4H20q86XDYeJi7cERn3VQ4hqfBc1bmDRHxcLQ2gwmk30tFsfqh1FPDijo06vCodhlXDmzl
        Rzj6tVlkGEJWvOLeG/pgiIpUAr1aAiY=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 4/5] clk: ingenic: Remove unused functions
Date:   Tue,  7 May 2019 21:34:20 +0200
Message-Id: <20190507193421.12260-4-paul@crapouillou.net>
In-Reply-To: <20190507193421.12260-1-paul@crapouillou.net>
References: <20190507193421.12260-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

These functions are not called anywhere anymore, they can safely be
removed.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/clk/ingenic/jz4740-cgu.c | 73 --------------------------------
 1 file changed, 73 deletions(-)

diff --git a/drivers/clk/ingenic/jz4740-cgu.c b/drivers/clk/ingenic/jz4740-cgu.c
index c036b2e8d9a8..c46c430e4281 100644
--- a/drivers/clk/ingenic/jz4740-cgu.c
+++ b/drivers/clk/ingenic/jz4740-cgu.c
@@ -18,7 +18,6 @@
 #include <linux/delay.h>
 #include <linux/of.h>
 #include <dt-bindings/clock/jz4740-cgu.h>
-#include <asm/mach-jz4740/clock.h>
 #include "cgu.h"
 #include "pm.h"
 
@@ -231,75 +230,3 @@ static void __init jz4740_cgu_init(struct device_node *np)
 	ingenic_cgu_register_syscore_ops(cgu);
 }
 CLK_OF_DECLARE(jz4740_cgu, "ingenic,jz4740-cgu", jz4740_cgu_init);
-
-void jz4740_clock_set_wait_mode(enum jz4740_wait_mode mode)
-{
-	uint32_t lcr = readl(cgu->base + CGU_REG_LCR);
-
-	switch (mode) {
-	case JZ4740_WAIT_MODE_IDLE:
-		lcr &= ~LCR_SLEEP;
-		break;
-
-	case JZ4740_WAIT_MODE_SLEEP:
-		lcr |= LCR_SLEEP;
-		break;
-	}
-
-	writel(lcr, cgu->base + CGU_REG_LCR);
-}
-
-void jz4740_clock_udc_disable_auto_suspend(void)
-{
-	uint32_t clkgr = readl(cgu->base + CGU_REG_CLKGR);
-
-	clkgr &= ~CLKGR_UDC;
-	writel(clkgr, cgu->base + CGU_REG_CLKGR);
-}
-EXPORT_SYMBOL_GPL(jz4740_clock_udc_disable_auto_suspend);
-
-void jz4740_clock_udc_enable_auto_suspend(void)
-{
-	uint32_t clkgr = readl(cgu->base + CGU_REG_CLKGR);
-
-	clkgr |= CLKGR_UDC;
-	writel(clkgr, cgu->base + CGU_REG_CLKGR);
-}
-EXPORT_SYMBOL_GPL(jz4740_clock_udc_enable_auto_suspend);
-
-#define JZ_CLOCK_GATE_UART0	BIT(0)
-#define JZ_CLOCK_GATE_TCU	BIT(1)
-#define JZ_CLOCK_GATE_DMAC	BIT(12)
-
-void jz4740_clock_suspend(void)
-{
-	uint32_t clkgr, cppcr;
-
-	clkgr = readl(cgu->base + CGU_REG_CLKGR);
-	clkgr |= JZ_CLOCK_GATE_TCU | JZ_CLOCK_GATE_DMAC | JZ_CLOCK_GATE_UART0;
-	writel(clkgr, cgu->base + CGU_REG_CLKGR);
-
-	cppcr = readl(cgu->base + CGU_REG_CPPCR);
-	cppcr &= ~BIT(jz4740_cgu_clocks[JZ4740_CLK_PLL].pll.enable_bit);
-	writel(cppcr, cgu->base + CGU_REG_CPPCR);
-}
-
-void jz4740_clock_resume(void)
-{
-	uint32_t clkgr, cppcr, stable;
-
-	cppcr = readl(cgu->base + CGU_REG_CPPCR);
-	cppcr |= BIT(jz4740_cgu_clocks[JZ4740_CLK_PLL].pll.enable_bit);
-	writel(cppcr, cgu->base + CGU_REG_CPPCR);
-
-	stable = BIT(jz4740_cgu_clocks[JZ4740_CLK_PLL].pll.stable_bit);
-	do {
-		cppcr = readl(cgu->base + CGU_REG_CPPCR);
-	} while (!(cppcr & stable));
-
-	clkgr = readl(cgu->base + CGU_REG_CLKGR);
-	clkgr &= ~JZ_CLOCK_GATE_TCU;
-	clkgr &= ~JZ_CLOCK_GATE_DMAC;
-	clkgr &= ~JZ_CLOCK_GATE_UART0;
-	writel(clkgr, cgu->base + CGU_REG_CLKGR);
-}
-- 
2.21.0.593.g511ec345e18

