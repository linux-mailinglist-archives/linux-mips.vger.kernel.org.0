Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDF7735E32
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jun 2023 22:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjFSULv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jun 2023 16:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbjFSULt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jun 2023 16:11:49 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F066B3
        for <linux-mips@vger.kernel.org>; Mon, 19 Jun 2023 13:11:46 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id BLDzqAqfXv5uIBLE1qiBIR; Mon, 19 Jun 2023 22:11:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205505; bh=KWAwmoxUPL4fboAB5flSZfvLEvkHjPU5FTttzMCJ6lE=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=oq8mejCUrt4+k8qd/UmMZ8ruqY01BxwvA7aITRU7DJJMZgFWc7K6iTscVmiD4EUlr
         2d3qXfqHanydOdTbUaOMpG6edASnezjGjHO0Iq8LH+fNpyU7bXmo+Dt5rNja/tAtKk
         6FooE4p0gPy8HFvKbrmwg1EjqBeCprNsUCMR30akMWFEsk+n90mobmaqr+IY6kyy0/
         LyPSdl6sm7wHltdIIOA0odobng52bduqPdwd/hKdxVO/Tm2Mg0Anfi6mGv9iXD489J
         //5N80Lh2lEYv0JihGFhhSs6+VXIOnUxaxLE75E1E3IuQdcWm9UtG6kXmKTbnVfwmw
         xkxiQ18RKOK6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205505; bh=KWAwmoxUPL4fboAB5flSZfvLEvkHjPU5FTttzMCJ6lE=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=oq8mejCUrt4+k8qd/UmMZ8ruqY01BxwvA7aITRU7DJJMZgFWc7K6iTscVmiD4EUlr
         2d3qXfqHanydOdTbUaOMpG6edASnezjGjHO0Iq8LH+fNpyU7bXmo+Dt5rNja/tAtKk
         6FooE4p0gPy8HFvKbrmwg1EjqBeCprNsUCMR30akMWFEsk+n90mobmaqr+IY6kyy0/
         LyPSdl6sm7wHltdIIOA0odobng52bduqPdwd/hKdxVO/Tm2Mg0Anfi6mGv9iXD489J
         //5N80Lh2lEYv0JihGFhhSs6+VXIOnUxaxLE75E1E3IuQdcWm9UtG6kXmKTbnVfwmw
         xkxiQ18RKOK6A==
Date:   Mon, 19 Jun 2023 22:11:43 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH 02/11] MIPS: OCTEON: octeon-usb: use bitfields for control
 register
Message-ID: <ZJC2f5R6u4lWCUSo@lenoch>
References: <ZJC165p0Mj4jHcBh@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJC165p0Mj4jHcBh@lenoch>
X-CMAE-Envelope: MS4wfAoX8pCNtDqtycWU8qB+qs0lZHpTf0pM96pXKafPFzMdMQfX4Wr+6cv5I+Kh3sNakhjjZQawWOQ/9Rx8N+rbI8WkNAg/yCAsCkn1VQeX6F5SQRtFUoy8
 LpQSZ0DFZf+A2dfVMWZlB3jsetMghbhwi0Nfr3+mnDTnwGXNWqqJywal4zIDfkNNQwinVniAaP5dIjpCofBjPw/jqTXuKt0UBb085qg0T746oubDGlmsWZP6
 QQfYAlxlomJo8w5+Y/RKXg==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

Code needs to compile for all platforms in order to move it to
drivers/usb/dwc3. Use Linux standard bitfield access macros
to manipulate control register.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 arch/mips/cavium-octeon/octeon-usb.c | 330 +++++++++++++--------------
 1 file changed, 159 insertions(+), 171 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
index 4d22eaa8a644..e8e57d0c3b14 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -8,16 +8,117 @@
  * for more details.
  */
 
-#include <linux/module.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/device.h>
-#include <linux/mutex.h>
 #include <linux/delay.h>
-#include <linux/of_platform.h>
 #include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_platform.h>
 
 #include <asm/octeon/octeon.h>
 
+/*
+ * USB Control Register
+ */
 #define USBDRD_UCTL_CTL				0x00
+/* BIST fast-clear mode select. A BIST run with this bit set
+ * clears all entries in USBH RAMs to 0x0.
+ */
+# define USBDRD_UCTL_CTL_CLEAR_BIST		BIT(63)
+/* 1 = Start BIST and cleared by hardware */
+# define USBDRD_UCTL_CTL_START_BIST		BIT(62)
+/* Reference clock select for SuperSpeed and HighSpeed PLLs:
+ *	0x0 = Both PLLs use DLMC_REF_CLK0 for reference clock
+ *	0x1 = Both PLLs use DLMC_REF_CLK1 for reference clock
+ *	0x2 = SuperSpeed PLL uses DLMC_REF_CLK0 for reference clock &
+ *	      HighSpeed PLL uses PLL_REF_CLK for reference clck
+ *	0x3 = SuperSpeed PLL uses DLMC_REF_CLK1 for reference clock &
+ *	      HighSpeed PLL uses PLL_REF_CLK for reference clck
+ */
+# define USBDRD_UCTL_CTL_REF_CLK_SEL		GENMASK(61, 60)
+/* 1 = Spread-spectrum clock enable, 0 = SS clock disable */
+# define USBDRD_UCTL_CTL_SSC_EN			BIT(59)
+/* Spread-spectrum clock modulation range:
+ *	0x0 = -4980 ppm downspread
+ *	0x1 = -4492 ppm downspread
+ *	0x2 = -4003 ppm downspread
+ *	0x3 - 0x7 = Reserved
+ */
+# define USBDRD_UCTL_CTL_SSC_RANGE		GENMASK(58, 56)
+/* Enable non-standard oscillator frequencies:
+ *	[55:53] = modules -1
+ *	[52:47] = 2's complement push amount, 0 = Feature disabled
+ */
+# define USBDRD_UCTL_CTL_SSC_REF_CLK_SEL	GENMASK(55, 47)
+/* Reference clock multiplier for non-standard frequencies:
+ *	0x19 = 100MHz on DLMC_REF_CLK* if REF_CLK_SEL = 0x0 or 0x1
+ *	0x28 = 125MHz on DLMC_REF_CLK* if REF_CLK_SEL = 0x0 or 0x1
+ *	0x32 =  50MHz on DLMC_REF_CLK* if REF_CLK_SEL = 0x0 or 0x1
+ *	Other Values = Reserved
+ */
+# define USBDRD_UCTL_CTL_MPLL_MULTIPLIER	GENMASK(46, 40)
+/* Enable reference clock to prescaler for SuperSpeed functionality.
+ * Should always be set to "1"
+ */
+# define USBDRD_UCTL_CTL_REF_SSP_EN		BIT(39)
+/* Divide the reference clock by 2 before entering the
+ * REF_CLK_FSEL divider:
+ *	If REF_CLK_SEL = 0x0 or 0x1, then only 0x0 is legal
+ *	If REF_CLK_SEL = 0x2 or 0x3, then:
+ *		0x1 = DLMC_REF_CLK* is 125MHz
+ *		0x0 = DLMC_REF_CLK* is another supported frequency
+ */
+# define USBDRD_UCTL_CTL_REF_CLK_DIV2		BIT(38)
+/* Select reference clock freqnuency for both PLL blocks:
+ *	0x27 = REF_CLK_SEL is 0x0 or 0x1
+ *	0x07 = REF_CLK_SEL is 0x2 or 0x3
+ */
+# define USBDRD_UCTL_CTL_REF_CLK_FSEL		GENMASK(37, 32)
+/* Controller clock enable. */
+# define USBDRD_UCTL_CTL_H_CLK_EN		BIT(30)
+/* Select bypass input to controller clock divider:
+ *	0x0 = Use divided coprocessor clock from H_CLKDIV
+ *	0x1 = Use clock from GPIO pins
+ */
+# define USBDRD_UCTL_CTL_H_CLK_BYP_SEL		BIT(29)
+/* Reset controller clock divider. */
+# define USBDRD_UCTL_CTL_H_CLKDIV_RST		BIT(28)
+/* Clock divider select:
+ *	0x0 = divide by 1
+ *	0x1 = divide by 2
+ *	0x2 = divide by 4
+ *	0x3 = divide by 6
+ *	0x4 = divide by 8
+ *	0x5 = divide by 16
+ *	0x6 = divide by 24
+ *	0x7 = divide by 32
+ */
+# define USBDRD_UCTL_CTL_H_CLKDIV_SEL		GENMASK(26, 24)
+/* USB3 port permanently attached: 0x0 = No, 0x1 = Yes */
+# define USBDRD_UCTL_CTL_USB3_PORT_PERM_ATTACH	BIT(21)
+/* USB2 port permanently attached: 0x0 = No, 0x1 = Yes */
+# define USBDRD_UCTL_CTL_USB2_PORT_PERM_ATTACH	BIT(20)
+/* Disable SuperSpeed PHY: 0x0 = No, 0x1 = Yes */
+# define USBDRD_UCTL_CTL_USB3_PORT_DISABLE	BIT(18)
+/* Disable HighSpeed PHY: 0x0 = No, 0x1 = Yes */
+# define USBDRD_UCTL_CTL_USB2_PORT_DISABLE	BIT(16)
+/* Enable PHY SuperSpeed block power: 0x0 = No, 0x1 = Yes */
+# define USBDRD_UCTL_CTL_SS_POWER_EN		BIT(14)
+/* Enable PHY HighSpeed block power: 0x0 = No, 0x1 = Yes */
+# define USBDRD_UCTL_CTL_HS_POWER_EN		BIT(12)
+/* Enable USB UCTL interface clock: 0xx = No, 0x1 = Yes */
+# define USBDRD_UCTL_CTL_CSCLK_EN		BIT(4)
+/* Controller mode: 0x0 = Host, 0x1 = Device */
+# define USBDRD_UCTL_CTL_DRD_MODE		BIT(3)
+/* PHY reset */
+# define USBDRD_UCTL_CTL_UPHY_RST		BIT(2)
+/* Software reset UAHC */
+# define USBDRD_UCTL_CTL_UAHC_RST		BIT(1)
+/* Software resets UCTL */
+# define USBDRD_UCTL_CTL_UCTL_RST		BIT(0)
+
 #define USBDRD_UCTL_BIST_STATUS			0x08
 #define USBDRD_UCTL_SPARE0			0x10
 #define USBDRD_UCTL_INTSTAT			0x30
@@ -30,123 +131,6 @@
 #define USBDRD_UCTL_ECC				0xf0
 #define USBDRD_UCTL_SPARE1			0xf8
 
-/* USB Control Register */
-union cvm_usbdrd_uctl_ctl {
-	uint64_t u64;
-	struct cvm_usbdrd_uctl_ctl_s {
-	/* 1 = BIST and set all USB RAMs to 0x0, 0 = BIST */
-	__BITFIELD_FIELD(uint64_t clear_bist:1,
-	/* 1 = Start BIST and cleared by hardware */
-	__BITFIELD_FIELD(uint64_t start_bist:1,
-	/* Reference clock select for SuperSpeed and HighSpeed PLLs:
-	 *	0x0 = Both PLLs use DLMC_REF_CLK0 for reference clock
-	 *	0x1 = Both PLLs use DLMC_REF_CLK1 for reference clock
-	 *	0x2 = SuperSpeed PLL uses DLMC_REF_CLK0 for reference clock &
-	 *	      HighSpeed PLL uses PLL_REF_CLK for reference clck
-	 *	0x3 = SuperSpeed PLL uses DLMC_REF_CLK1 for reference clock &
-	 *	      HighSpeed PLL uses PLL_REF_CLK for reference clck
-	 */
-	__BITFIELD_FIELD(uint64_t ref_clk_sel:2,
-	/* 1 = Spread-spectrum clock enable, 0 = SS clock disable */
-	__BITFIELD_FIELD(uint64_t ssc_en:1,
-	/* Spread-spectrum clock modulation range:
-	 *	0x0 = -4980 ppm downspread
-	 *	0x1 = -4492 ppm downspread
-	 *	0x2 = -4003 ppm downspread
-	 *	0x3 - 0x7 = Reserved
-	 */
-	__BITFIELD_FIELD(uint64_t ssc_range:3,
-	/* Enable non-standard oscillator frequencies:
-	 *	[55:53] = modules -1
-	 *	[52:47] = 2's complement push amount, 0 = Feature disabled
-	 */
-	__BITFIELD_FIELD(uint64_t ssc_ref_clk_sel:9,
-	/* Reference clock multiplier for non-standard frequencies:
-	 *	0x19 = 100MHz on DLMC_REF_CLK* if REF_CLK_SEL = 0x0 or 0x1
-	 *	0x28 = 125MHz on DLMC_REF_CLK* if REF_CLK_SEL = 0x0 or 0x1
-	 *	0x32 =  50MHz on DLMC_REF_CLK* if REF_CLK_SEL = 0x0 or 0x1
-	 *	Other Values = Reserved
-	 */
-	__BITFIELD_FIELD(uint64_t mpll_multiplier:7,
-	/* Enable reference clock to prescaler for SuperSpeed functionality.
-	 * Should always be set to "1"
-	 */
-	__BITFIELD_FIELD(uint64_t ref_ssp_en:1,
-	/* Divide the reference clock by 2 before entering the
-	 * REF_CLK_FSEL divider:
-	 *	If REF_CLK_SEL = 0x0 or 0x1, then only 0x0 is legal
-	 *	If REF_CLK_SEL = 0x2 or 0x3, then:
-	 *		0x1 = DLMC_REF_CLK* is 125MHz
-	 *		0x0 = DLMC_REF_CLK* is another supported frequency
-	 */
-	__BITFIELD_FIELD(uint64_t ref_clk_div2:1,
-	/* Select reference clock freqnuency for both PLL blocks:
-	 *	0x27 = REF_CLK_SEL is 0x0 or 0x1
-	 *	0x07 = REF_CLK_SEL is 0x2 or 0x3
-	 */
-	__BITFIELD_FIELD(uint64_t ref_clk_fsel:6,
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_31_31:1,
-	/* Controller clock enable. */
-	__BITFIELD_FIELD(uint64_t h_clk_en:1,
-	/* Select bypass input to controller clock divider:
-	 *	0x0 = Use divided coprocessor clock from H_CLKDIV
-	 *	0x1 = Use clock from GPIO pins
-	 */
-	__BITFIELD_FIELD(uint64_t h_clk_byp_sel:1,
-	/* Reset controller clock divider. */
-	__BITFIELD_FIELD(uint64_t h_clkdiv_rst:1,
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_27_27:1,
-	/* Clock divider select:
-	 *	0x0 = divide by 1
-	 *	0x1 = divide by 2
-	 *	0x2 = divide by 4
-	 *	0x3 = divide by 6
-	 *	0x4 = divide by 8
-	 *	0x5 = divide by 16
-	 *	0x6 = divide by 24
-	 *	0x7 = divide by 32
-	 */
-	__BITFIELD_FIELD(uint64_t h_clkdiv_sel:3,
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_22_23:2,
-	/* USB3 port permanently attached: 0x0 = No, 0x1 = Yes */
-	__BITFIELD_FIELD(uint64_t usb3_port_perm_attach:1,
-	/* USB2 port permanently attached: 0x0 = No, 0x1 = Yes */
-	__BITFIELD_FIELD(uint64_t usb2_port_perm_attach:1,
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_19_19:1,
-	/* Disable SuperSpeed PHY: 0x0 = No, 0x1 = Yes */
-	__BITFIELD_FIELD(uint64_t usb3_port_disable:1,
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_17_17:1,
-	/* Disable HighSpeed PHY: 0x0 = No, 0x1 = Yes */
-	__BITFIELD_FIELD(uint64_t usb2_port_disable:1,
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_15_15:1,
-	/* Enable PHY SuperSpeed block power: 0x0 = No, 0x1 = Yes */
-	__BITFIELD_FIELD(uint64_t ss_power_en:1,
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_13_13:1,
-	/* Enable PHY HighSpeed block power: 0x0 = No, 0x1 = Yes */
-	__BITFIELD_FIELD(uint64_t hs_power_en:1,
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_5_11:7,
-	/* Enable USB UCTL interface clock: 0xx = No, 0x1 = Yes */
-	__BITFIELD_FIELD(uint64_t csclk_en:1,
-	/* Controller mode: 0x0 = Host, 0x1 = Device */
-	__BITFIELD_FIELD(uint64_t drd_mode:1,
-	/* PHY reset */
-	__BITFIELD_FIELD(uint64_t uphy_rst:1,
-	/* Software reset UAHC */
-	__BITFIELD_FIELD(uint64_t uahc_rst:1,
-	/* Software resets UCTL */
-	__BITFIELD_FIELD(uint64_t uctl_rst:1,
-	;)))))))))))))))))))))))))))))))))
-	} s;
-};
-
 /* UAHC Configuration Register */
 union cvm_usbdrd_uctl_host_cfg {
 	uint64_t u64;
@@ -297,14 +281,10 @@ static int dwc3_octeon_config_power(struct device *dev, u64 base)
 
 static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 {
-	union cvm_usbdrd_uctl_ctl uctl_ctl;
-	int ref_clk_sel = 2;
-	u64 div;
+	int i, mpll_mul, ref_clk_fsel, ref_clk_sel = 2;
 	u32 clock_rate;
-	int mpll_mul;
-	int i;
-	u64 h_clk_rate;
-	u64 uctl_ctl_reg = base;
+	u64 div, h_clk_rate, val;
+	u64 uctl_ctl_reg = base + USBDRD_UCTL_CTL;
 
 	if (dev->of_node) {
 		const char *ss_clock_type;
@@ -368,16 +348,16 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 	/* Step 2: Select GPIO for overcurrent indication, if desired. SKIP */
 
 	/* Step 3: Assert all resets. */
-	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
-	uctl_ctl.s.uphy_rst = 1;
-	uctl_ctl.s.uahc_rst = 1;
-	uctl_ctl.s.uctl_rst = 1;
-	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
+	val = cvmx_read_csr(uctl_ctl_reg);
+	val |= USBDRD_UCTL_CTL_UPHY_RST |
+	       USBDRD_UCTL_CTL_UAHC_RST |
+	       USBDRD_UCTL_CTL_UCTL_RST;
+	cvmx_write_csr(uctl_ctl_reg, val);
 
 	/* Step 4a: Reset the clock dividers. */
-	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
-	uctl_ctl.s.h_clkdiv_rst = 1;
-	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
+	val = cvmx_read_csr(uctl_ctl_reg);
+	val |= USBDRD_UCTL_CTL_H_CLKDIV_RST;
+	cvmx_write_csr(uctl_ctl_reg, val);
 
 	/* Step 4b: Select controller clock frequency. */
 	for (div = 0; div < OCTEON_H_CLKDIV_SEL; div++) {
@@ -386,26 +366,29 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 				 h_clk_rate >= OCTEON_MIN_H_CLK_RATE)
 			break;
 	}
-	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
-	uctl_ctl.s.h_clkdiv_sel = div;
-	uctl_ctl.s.h_clk_en = 1;
-	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
-	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
-	if ((div != uctl_ctl.s.h_clkdiv_sel) || (!uctl_ctl.s.h_clk_en)) {
+	val = cvmx_read_csr(uctl_ctl_reg);
+	val &= ~USBDRD_UCTL_CTL_H_CLKDIV_SEL;
+	val |= FIELD_PREP(USBDRD_UCTL_CTL_H_CLKDIV_SEL, div);
+	val |= USBDRD_UCTL_CTL_H_CLK_EN;
+	cvmx_write_csr(uctl_ctl_reg, val);
+	val = cvmx_read_csr(uctl_ctl_reg);
+	if ((div != FIELD_GET(USBDRD_UCTL_CTL_H_CLKDIV_SEL, val)) ||
+	    (!(FIELD_GET(USBDRD_UCTL_CTL_H_CLK_EN, val)))) {
 		dev_err(dev, "dwc3 controller clock init failure.\n");
 			return -EINVAL;
 	}
 
 	/* Step 4c: Deassert the controller clock divider reset. */
-	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
-	uctl_ctl.s.h_clkdiv_rst = 0;
-	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
+	val &= ~USBDRD_UCTL_CTL_H_CLKDIV_RST;
+	cvmx_write_csr(uctl_ctl_reg, val);
 
 	/* Step 5a: Reference clock configuration. */
-	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
-	uctl_ctl.s.ref_clk_sel = ref_clk_sel;
-	uctl_ctl.s.ref_clk_fsel = 0x07;
-	uctl_ctl.s.ref_clk_div2 = 0;
+	val = cvmx_read_csr(uctl_ctl_reg);
+	val &= ~USBDRD_UCTL_CTL_REF_CLK_DIV2;
+	val &= ~USBDRD_UCTL_CTL_REF_CLK_SEL;
+	val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_SEL, ref_clk_sel);
+
+	ref_clk_fsel = 0x07;
 	switch (clock_rate) {
 	default:
 		dev_warn(dev, "Invalid ref_clk %u, using 100000000 instead\n",
@@ -414,7 +397,7 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 	case 100000000:
 		mpll_mul = 0x19;
 		if (ref_clk_sel < 2)
-			uctl_ctl.s.ref_clk_fsel = 0x27;
+			ref_clk_fsel = 0x27;
 		break;
 	case 50000000:
 		mpll_mul = 0x32;
@@ -423,28 +406,32 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 		mpll_mul = 0x28;
 		break;
 	}
-	uctl_ctl.s.mpll_multiplier = mpll_mul;
+	val &= ~USBDRD_UCTL_CTL_REF_CLK_FSEL;
+	val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_FSEL, ref_clk_fsel);
+
+	val &= ~USBDRD_UCTL_CTL_MPLL_MULTIPLIER;
+	val |= FIELD_PREP(USBDRD_UCTL_CTL_MPLL_MULTIPLIER, mpll_mul);
 
 	/* Step 5b: Configure and enable spread-spectrum for SuperSpeed. */
-	uctl_ctl.s.ssc_en = 1;
+	val |= USBDRD_UCTL_CTL_SSC_EN;
 
 	/* Step 5c: Enable SuperSpeed. */
-	uctl_ctl.s.ref_ssp_en = 1;
+	val |= USBDRD_UCTL_CTL_REF_SSP_EN;
 
 	/* Step 5d: Configure PHYs. SKIP */
 
 	/* Step 6a & 6b: Power up PHYs. */
-	uctl_ctl.s.hs_power_en = 1;
-	uctl_ctl.s.ss_power_en = 1;
-	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
+	val |= USBDRD_UCTL_CTL_HS_POWER_EN;
+	val |= USBDRD_UCTL_CTL_SS_POWER_EN;
+	cvmx_write_csr(uctl_ctl_reg, val);
 
 	/* Step 7: Wait 10 controller-clock cycles to take effect. */
 	udelay(10);
 
 	/* Step 8a: Deassert UCTL reset signal. */
-	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
-	uctl_ctl.s.uctl_rst = 0;
-	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
+	val = cvmx_read_csr(uctl_ctl_reg);
+	val &= ~USBDRD_UCTL_CTL_UCTL_RST;
+	cvmx_write_csr(uctl_ctl_reg, val);
 
 	/* Step 8b: Wait 10 controller-clock cycles. */
 	udelay(10);
@@ -454,22 +441,22 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 		return -EINVAL;
 
 	/* Step 8d: Deassert UAHC reset signal. */
-	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
-	uctl_ctl.s.uahc_rst = 0;
-	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
+	val = cvmx_read_csr(uctl_ctl_reg);
+	val &= ~USBDRD_UCTL_CTL_UAHC_RST;
+	cvmx_write_csr(uctl_ctl_reg, val);
 
 	/* Step 8e: Wait 10 controller-clock cycles. */
 	udelay(10);
 
 	/* Step 9: Enable conditional coprocessor clock of UCTL. */
-	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
-	uctl_ctl.s.csclk_en = 1;
-	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
+	val = cvmx_read_csr(uctl_ctl_reg);
+	val |= USBDRD_UCTL_CTL_CSCLK_EN;
+	cvmx_write_csr(uctl_ctl_reg, val);
 
 	/*Step 10: Set for host mode only. */
-	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
-	uctl_ctl.s.drd_mode = 0;
-	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
+	val = cvmx_read_csr(uctl_ctl_reg);
+	val &= ~USBDRD_UCTL_CTL_DRD_MODE;
+	cvmx_write_csr(uctl_ctl_reg, val);
 
 	return 0;
 }
@@ -491,11 +478,12 @@ static void __init dwc3_octeon_set_endian_mode(u64 base)
 
 static void __init dwc3_octeon_phy_reset(u64 base)
 {
-	union cvm_usbdrd_uctl_ctl uctl_ctl;
+	u64 val;
+	u64 uctl_ctl_reg = base + USBDRD_UCTL_CTL;
 
-	uctl_ctl.u64 = cvmx_read_csr(base + USBDRD_UCTL_CTL);
-	uctl_ctl.s.uphy_rst = 0;
-	cvmx_write_csr(base + USBDRD_UCTL_CTL, uctl_ctl.u64);
+	val = cvmx_read_csr(uctl_ctl_reg);
+	val &= ~USBDRD_UCTL_CTL_UPHY_RST;
+	cvmx_write_csr(uctl_ctl_reg, val);
 }
 
 static int __init dwc3_octeon_device_init(void)
-- 
2.39.2

