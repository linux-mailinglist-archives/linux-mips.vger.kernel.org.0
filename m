Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBF00735E3E
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jun 2023 22:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbjFSUOH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jun 2023 16:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbjFSUOG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jun 2023 16:14:06 -0400
Received: from h3.cmg1.smtp.forpsi.com (h3.cmg1.smtp.forpsi.com [185.129.138.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF7BE4A
        for <linux-mips@vger.kernel.org>; Mon, 19 Jun 2023 13:14:05 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id BLGFq51y0Pm6CBLGGqL79b; Mon, 19 Jun 2023 22:14:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205644; bh=NN3sMROPSk+1aWuzxy0eMWXQTX8wAQ/HmoruSCWv9hs=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=JjnpOKvZnw9FY/N3spVaJoDTbX9d8+k45MMQeJ5sRffUAYAjkLYEnPebefkIba4Iy
         X8e4u9eOGCYyoNCNTZSoJlg4WDSqbRD2cN/M7ZvFtiM824U1r2aWTTtPLALZbvEh0p
         DzMfWOkUL7FfRyx9Rt1zfPadL7YTXBwk0QZ8oY5Zl8W21VLj9CGNIh9G+tAbK4LWyN
         3W20L2rQZIq5Xq6NGmvmnn05t6QazqSrx/T0P0ezyX1TkJ/ldFj/fGxYLR0d13SEmO
         1LcNtmr1SUSmcuNfuEN3CA+NpVsxXGs8YhQUJVJACyb8B0Jss/2m7nKAIyn/sGGfRd
         1hetqp6hACc0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205644; bh=NN3sMROPSk+1aWuzxy0eMWXQTX8wAQ/HmoruSCWv9hs=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=JjnpOKvZnw9FY/N3spVaJoDTbX9d8+k45MMQeJ5sRffUAYAjkLYEnPebefkIba4Iy
         X8e4u9eOGCYyoNCNTZSoJlg4WDSqbRD2cN/M7ZvFtiM824U1r2aWTTtPLALZbvEh0p
         DzMfWOkUL7FfRyx9Rt1zfPadL7YTXBwk0QZ8oY5Zl8W21VLj9CGNIh9G+tAbK4LWyN
         3W20L2rQZIq5Xq6NGmvmnn05t6QazqSrx/T0P0ezyX1TkJ/ldFj/fGxYLR0d13SEmO
         1LcNtmr1SUSmcuNfuEN3CA+NpVsxXGs8YhQUJVJACyb8B0Jss/2m7nKAIyn/sGGfRd
         1hetqp6hACc0A==
Date:   Mon, 19 Jun 2023 22:14:03 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH 07/11] MIPS: OCTEON: octeon-usb: cleanup divider calculation
Message-ID: <ZJC3C5vG2i2mhJwx@lenoch>
References: <ZJC165p0Mj4jHcBh@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJC165p0Mj4jHcBh@lenoch>
X-CMAE-Envelope: MS4wfPzEkbw4klkTN/+pprv6eUIKlF0uA+gWSx42M8Dua9PCWO/8tVWkGUCjuKcM2JKSKWi8GJMB4MjPOcf1/owdFG5JepzE0CnNb9C0csd6fWMQd/cHGXEV
 zWjVbqajVIMn8kfrCjfqWZKTEp/8/1ByvodOGzwsfl9tGjTQEUSaHdfWpYknvNGcY52SLaqjAVWxw2L9tSoXjxu4dmwroM1yqIa5N7Sfkj0N7WT+RpM9wxaU
 2YjAMdrBVqshpXQ85ZRe7A==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

Simple self-contained function is easier to review.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 arch/mips/cavium-octeon/octeon-usb.c | 31 ++++++++++++++++------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
index aaddc874f0ca..2add435ad038 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -187,12 +187,7 @@
 #define USBDRD_UCTL_ECC				0xf0
 #define USBDRD_UCTL_SPARE1			0xf8
 
-#define OCTEON_H_CLKDIV_SEL		8
-#define OCTEON_MIN_H_CLK_RATE		150000000
-#define OCTEON_MAX_H_CLK_RATE		300000000
-
 static DEFINE_MUTEX(dwc3_octeon_clocks_mutex);
-static uint8_t clk_div[OCTEON_H_CLKDIV_SEL] = {1, 2, 4, 6, 8, 16, 24, 32};
 
 #ifdef CONFIG_CAVIUM_OCTEON_SOC
 #include <asm/octeon/octeon.h>
@@ -240,6 +235,21 @@ static inline void dwc3_octeon_writeq(void __iomem *base, uint64_t val) { }
 static inline void dwc3_octeon_config_gpio(int index, int gpio) { }
 #endif
 
+static int dwc3_octeon_get_divider(void)
+{
+	static const uint8_t clk_div[] = { 1, 2, 4, 6, 8, 16, 24, 32 };
+	int div = 0;
+
+	while (div < ARRAY_SIZE(clk_div)) {
+		uint64_t rate = octeon_get_io_clock_rate() / clk_div[div];
+		if (rate <= 300000000 && rate >= 150000000)
+			break;
+		div++;
+	}
+
+	return div;
+}
+
 static int dwc3_octeon_config_power(struct device *dev, void __iomem *base)
 {
 	uint32_t gpio_pwr[3];
@@ -284,9 +294,9 @@ static int dwc3_octeon_config_power(struct device *dev, void __iomem *base)
 
 static int dwc3_octeon_clocks_start(struct device *dev, void __iomem *base)
 {
-	int i, mpll_mul, ref_clk_fsel, ref_clk_sel = 2;
+	int i, div, mpll_mul, ref_clk_fsel, ref_clk_sel = 2;
 	u32 clock_rate;
-	u64 div, h_clk_rate, val;
+	u64 val;
 	void __iomem *uctl_ctl_reg = base + USBDRD_UCTL_CTL;
 
 	if (dev->of_node) {
@@ -363,12 +373,7 @@ static int dwc3_octeon_clocks_start(struct device *dev, void __iomem *base)
 	dwc3_octeon_writeq(uctl_ctl_reg, val);
 
 	/* Step 4b: Select controller clock frequency. */
-	for (div = 0; div < OCTEON_H_CLKDIV_SEL; div++) {
-		h_clk_rate = octeon_get_io_clock_rate() / clk_div[div];
-		if (h_clk_rate <= OCTEON_MAX_H_CLK_RATE &&
-				 h_clk_rate >= OCTEON_MIN_H_CLK_RATE)
-			break;
-	}
+	div = dwc3_octeon_get_divider();
 	val = dwc3_octeon_readq(uctl_ctl_reg);
 	val &= ~USBDRD_UCTL_CTL_H_CLKDIV_SEL;
 	val |= FIELD_PREP(USBDRD_UCTL_CTL_H_CLKDIV_SEL, div);
-- 
2.39.2

