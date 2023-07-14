Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22ADF753350
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jul 2023 09:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234831AbjGNHlU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Jul 2023 03:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234935AbjGNHlT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Jul 2023 03:41:19 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C8A30DF
        for <linux-mips@vger.kernel.org>; Fri, 14 Jul 2023 00:41:14 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id KDQHquYpqv5uIKDQMqbPuo; Fri, 14 Jul 2023 09:41:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689320472; bh=L0M56Ul6Fzv3R1AEfp83hvMFtQiLvRUd1gpugeqWdrk=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=jy2lPV3jdQdduH9x/dhSIAOhk+wbHxhF0r6iZbJsIr+pcT2U8qXCbnLNWYbrP3MhS
         prZgkZhJmPukTCyo6vFpUahi0a5i25BTIDKR1eQrM9Dj+2deFuiiF8s7gq0Z/+ljkR
         HbpfwIEgHCC8m4vcsf4vrDafE71pGii+Y5xxtS0zSBrXdKq/Sgfl8fUnrzwdYDO48p
         v/NuSOzxN8Hzn8DpAx6oCEog5NC+e2lpunqVB2kZvBvKk8ZBbBP7XTs0k/juUPqw9h
         yqQFBGmGAYfznbhPhrIN07qQuF1N9aLwjC8YKIhkTJRzmYgYJ5R/4gDDSCnvibtuom
         4pldxtbU40Khg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689320472; bh=L0M56Ul6Fzv3R1AEfp83hvMFtQiLvRUd1gpugeqWdrk=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=jy2lPV3jdQdduH9x/dhSIAOhk+wbHxhF0r6iZbJsIr+pcT2U8qXCbnLNWYbrP3MhS
         prZgkZhJmPukTCyo6vFpUahi0a5i25BTIDKR1eQrM9Dj+2deFuiiF8s7gq0Z/+ljkR
         HbpfwIEgHCC8m4vcsf4vrDafE71pGii+Y5xxtS0zSBrXdKq/Sgfl8fUnrzwdYDO48p
         v/NuSOzxN8Hzn8DpAx6oCEog5NC+e2lpunqVB2kZvBvKk8ZBbBP7XTs0k/juUPqw9h
         yqQFBGmGAYfznbhPhrIN07qQuF1N9aLwjC8YKIhkTJRzmYgYJ5R/4gDDSCnvibtuom
         4pldxtbU40Khg==
Date:   Fri, 14 Jul 2023 09:41:03 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v3 2/3] usb: dwc3: dwc3-octeon: Move node parsing into driver
 probe
Message-ID: <ZLD8D+zum2dN0pE9@lenoch>
References: <ZLD7RHvE4eRPoqKN@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLD7RHvE4eRPoqKN@lenoch>
X-CMAE-Envelope: MS4wfDG5PklRqomwxqEuSecZCU3Y+NKvNauKoAlpfZfHf0mKTpm92WLK0yUoAr/ArS4S20mM8LQphMo4CREhA4ITSaGuoMW56xE3MnTJIM1FbMBKgaKrr5MJ
 SLN6vZoJpCJVrLQrl0YcdpeyGiIw86uELXBtOT7/oz8jyILzo+41Q6QSK/pp7NP3E+va6NK3NP/2raGYtZhdGrynr4saUA9GZ8UippXAvJgBF/7L/ZD9uFjE
 v6M8I8LQCL95O3qaOKOqT1T3nn8lexGFM/L70ux1sVUDPoxgDZFi+3zFVi2vQZjI/G8HAoafA4paUaLCwbXZle95fQdlFOYKLIFInvSs08SCwy3FHjTu+hG4
 hFHyPCft
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

Parse and verify device tree node first, then setup UCTL bridge
using verified values. This avoids half initialized hardware state
in case DT misconfiguration was found in the middle of setup.
As a dwc3_octeon_clocks_start already did more than just starting
a clock, rename it approprietly and move all hardware setup there.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 CHANGES:
 - v2: if else block bracket according CodingStyle
 - v3: more descriptive commit message, power gpio parsing in probe too,
       checkpatch --strict passed

 drivers/usb/dwc3/dwc3-octeon.c | 236 +++++++++++++++------------------
 1 file changed, 109 insertions(+), 127 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 69bac61ccbe0..dd47498f4efb 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -258,108 +258,14 @@ static int dwc3_octeon_get_divider(void)
 	return div;
 }
 
-static int dwc3_octeon_config_power(struct device *dev, void __iomem *base)
+static int dwc3_octeon_setup(void __iomem *base,
+			     int ref_clk_sel, int ref_clk_fsel, int mpll_mul,
+			     int power_gpio, int power_active_low)
 {
-	uint32_t gpio_pwr[3];
-	int gpio, len, power_active_low;
-	struct device_node *node = dev->of_node;
-	u64 val;
-	void __iomem *uctl_host_cfg_reg = base + USBDRD_UCTL_HOST_CFG;
-
-	if (of_find_property(node, "power", &len) != NULL) {
-		if (len == 12) {
-			of_property_read_u32_array(node, "power", gpio_pwr, 3);
-			power_active_low = gpio_pwr[2] & 0x01;
-			gpio = gpio_pwr[1];
-		} else if (len == 8) {
-			of_property_read_u32_array(node, "power", gpio_pwr, 2);
-			power_active_low = 0;
-			gpio = gpio_pwr[1];
-		} else {
-			dev_err(dev, "invalid power configuration\n");
-			return -EINVAL;
-		}
-		dwc3_octeon_config_gpio(((u64)base >> 24) & 1, gpio);
-
-		/* Enable XHCI power control and set if active high or low. */
-		val = dwc3_octeon_readq(uctl_host_cfg_reg);
-		val |= USBDRD_UCTL_HOST_PPC_EN;
-		if (power_active_low)
-			val &= ~USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
-		else
-			val |= USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
-		dwc3_octeon_writeq(uctl_host_cfg_reg, val);
-	} else {
-		/* Disable XHCI power control and set if active high. */
-		val = dwc3_octeon_readq(uctl_host_cfg_reg);
-		val &= ~USBDRD_UCTL_HOST_PPC_EN;
-		val &= ~USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
-		dwc3_octeon_writeq(uctl_host_cfg_reg, val);
-		dev_info(dev, "power control disabled\n");
-	}
-	return 0;
-}
-
-static int dwc3_octeon_clocks_start(struct device *dev, void __iomem *base)
-{
-	int i, div, mpll_mul, ref_clk_fsel, ref_clk_sel = 2;
-	u32 clock_rate;
+	int div;
 	u64 val;
 	void __iomem *uctl_ctl_reg = base + USBDRD_UCTL_CTL;
-
-	if (dev->of_node) {
-		const char *ss_clock_type;
-		const char *hs_clock_type;
-
-		i = of_property_read_u32(dev->of_node,
-					 "refclk-frequency", &clock_rate);
-		if (i) {
-			dev_err(dev, "No UCTL \"refclk-frequency\"\n");
-			return -EINVAL;
-		}
-		i = of_property_read_string(dev->of_node,
-					    "refclk-type-ss", &ss_clock_type);
-		if (i) {
-			dev_err(dev, "No UCTL \"refclk-type-ss\"\n");
-			return -EINVAL;
-		}
-		i = of_property_read_string(dev->of_node,
-					    "refclk-type-hs", &hs_clock_type);
-		if (i) {
-			dev_err(dev, "No UCTL \"refclk-type-hs\"\n");
-			return -EINVAL;
-		}
-		if (strcmp("dlmc_ref_clk0", ss_clock_type) == 0) {
-			if (strcmp(hs_clock_type, "dlmc_ref_clk0") == 0)
-				ref_clk_sel = 0;
-			else if (strcmp(hs_clock_type, "pll_ref_clk") == 0)
-				ref_clk_sel = 2;
-			else
-				dev_warn(dev, "Invalid HS clock type %s, using pll_ref_clk instead\n",
-					 hs_clock_type);
-		} else if (strcmp(ss_clock_type, "dlmc_ref_clk1") == 0) {
-			if (strcmp(hs_clock_type, "dlmc_ref_clk1") == 0)
-				ref_clk_sel = 1;
-			else if (strcmp(hs_clock_type, "pll_ref_clk") == 0)
-				ref_clk_sel = 3;
-			else {
-				dev_warn(dev, "Invalid HS clock type %s, using pll_ref_clk instead\n",
-					 hs_clock_type);
-				ref_clk_sel = 3;
-			}
-		} else
-			dev_warn(dev, "Invalid SS clock type %s, using dlmc_ref_clk0 instead\n",
-				 ss_clock_type);
-
-		if ((ref_clk_sel == 0 || ref_clk_sel == 1) &&
-		    (clock_rate != 100000000))
-			dev_warn(dev, "Invalid UCTL clock rate of %u, using 100000000 instead\n",
-				 clock_rate);
-
-	} else {
-		dev_err(dev, "No USB UCTL device node\n");
-		return -EINVAL;
-	}
+	void __iomem *uctl_host_cfg_reg = base + USBDRD_UCTL_HOST_CFG;
 
 	/*
 	 * Step 1: Wait for all voltages to be stable...that surely
@@ -389,10 +295,8 @@ static int dwc3_octeon_clocks_start(struct device *dev, void __iomem *base)
 	dwc3_octeon_writeq(uctl_ctl_reg, val);
 	val = dwc3_octeon_readq(uctl_ctl_reg);
 	if ((div != FIELD_GET(USBDRD_UCTL_CTL_H_CLKDIV_SEL, val)) ||
-	    (!(FIELD_GET(USBDRD_UCTL_CTL_H_CLK_EN, val)))) {
-		dev_err(dev, "dwc3 controller clock init failure.\n");
-			return -EINVAL;
-	}
+	    (!(FIELD_GET(USBDRD_UCTL_CTL_H_CLK_EN, val))))
+		return -EINVAL;
 
 	/* Step 4c: Deassert the controller clock divider reset. */
 	val &= ~USBDRD_UCTL_CTL_H_CLKDIV_RST;
@@ -404,24 +308,6 @@ static int dwc3_octeon_clocks_start(struct device *dev, void __iomem *base)
 	val &= ~USBDRD_UCTL_CTL_REF_CLK_SEL;
 	val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_SEL, ref_clk_sel);
 
-	ref_clk_fsel = 0x07;
-	switch (clock_rate) {
-	default:
-		dev_warn(dev, "Invalid ref_clk %u, using 100000000 instead\n",
-			 clock_rate);
-		fallthrough;
-	case 100000000:
-		mpll_mul = 0x19;
-		if (ref_clk_sel < 2)
-			ref_clk_fsel = 0x27;
-		break;
-	case 50000000:
-		mpll_mul = 0x32;
-		break;
-	case 125000000:
-		mpll_mul = 0x28;
-		break;
-	}
 	val &= ~USBDRD_UCTL_CTL_REF_CLK_FSEL;
 	val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_FSEL, ref_clk_fsel);
 
@@ -452,9 +338,21 @@ static int dwc3_octeon_clocks_start(struct device *dev, void __iomem *base)
 	/* Step 8b: Wait 10 controller-clock cycles. */
 	udelay(10);
 
-	/* Steo 8c: Setup power-power control. */
-	if (dwc3_octeon_config_power(dev, base))
-		return -EINVAL;
+	/* Step 8c: Setup power control. */
+	val = dwc3_octeon_readq(uctl_host_cfg_reg);
+	val |= USBDRD_UCTL_HOST_PPC_EN;
+	if (power_gpio < 0) {
+		val &= ~USBDRD_UCTL_HOST_PPC_EN;
+	} else {
+		val |= USBDRD_UCTL_HOST_PPC_EN;
+		dwc3_octeon_config_gpio(((__force u64)base >> 24) & 1,
+					power_gpio);
+	}
+	if (power_active_low)
+		val &= ~USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
+	else
+		val |= USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
+	dwc3_octeon_writeq(uctl_host_cfg_reg, val);
 
 	/* Step 8d: Deassert UAHC reset signal. */
 	val = dwc3_octeon_readq(uctl_ctl_reg);
@@ -505,8 +403,89 @@ static void __init dwc3_octeon_phy_reset(void __iomem *base)
 static int dwc3_octeon_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
 	struct dwc3_data *data;
-	int err;
+	int err, len, ref_clk_sel, ref_clk_fsel, mpll_mul;
+	int power_active_low, power_gpio;
+	u32 clock_rate, gpio_pwr[3];
+	const char *hs_clock_type, *ss_clock_type;
+
+	if (!node) {
+		dev_err(dev, "No USB UCTL device node\n");
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32(node, "refclk-frequency", &clock_rate)) {
+		dev_err(dev, "No UCTL \"refclk-frequency\"\n");
+		return -EINVAL;
+	}
+	if (of_property_read_string(node, "refclk-type-ss", &ss_clock_type)) {
+		dev_err(dev, "No UCTL \"refclk-type-ss\"\n");
+		return -EINVAL;
+	}
+	if (of_property_read_string(node, "refclk-type-hs", &hs_clock_type)) {
+		dev_err(dev, "No UCTL \"refclk-type-hs\"\n");
+		return -EINVAL;
+	}
+
+	ref_clk_sel = 2;
+	if (strcmp("dlmc_ref_clk0", ss_clock_type) == 0) {
+		if (strcmp(hs_clock_type, "dlmc_ref_clk0") == 0)
+			ref_clk_sel = 0;
+		else if (strcmp(hs_clock_type, "pll_ref_clk"))
+			dev_warn(dev, "Invalid HS clock type %s, using pll_ref_clk instead\n",
+				 hs_clock_type);
+	} else if (strcmp(ss_clock_type, "dlmc_ref_clk1") == 0) {
+		if (strcmp(hs_clock_type, "dlmc_ref_clk1") == 0) {
+			ref_clk_sel = 1;
+		} else {
+			ref_clk_sel = 3;
+			if (strcmp(hs_clock_type, "pll_ref_clk"))
+				dev_warn(dev, "Invalid HS clock type %s, using pll_ref_clk instead\n",
+					 hs_clock_type);
+		}
+	} else {
+		dev_warn(dev, "Invalid SS clock type %s, using dlmc_ref_clk0 instead\n",
+			 ss_clock_type);
+	}
+
+	ref_clk_fsel = 0x07;
+	switch (clock_rate) {
+	default:
+		dev_warn(dev, "Invalid ref_clk %u, using 100000000 instead\n",
+			 clock_rate);
+		fallthrough;
+	case 100000000:
+		mpll_mul = 0x19;
+		if (ref_clk_sel < 2)
+			ref_clk_fsel = 0x27;
+		break;
+	case 50000000:
+		mpll_mul = 0x32;
+		break;
+	case 125000000:
+		mpll_mul = 0x28;
+		break;
+	}
+
+	if (of_find_property(node, "power", &len)) {
+		if (len == 12) {
+			of_property_read_u32_array(node, "power", gpio_pwr, 3);
+			power_active_low = gpio_pwr[2] & 0x01;
+			power_gpio = gpio_pwr[1];
+		} else if (len == 8) {
+			of_property_read_u32_array(node, "power", gpio_pwr, 2);
+			power_active_low = 0;
+			power_gpio = gpio_pwr[1];
+		} else {
+			dev_err(dev, "invalid power configuration\n");
+			return -EINVAL;
+		}
+	} else {
+		power_gpio = -1;
+		power_active_low = 0;
+		dev_info(dev, "power control disabled\n");
+	}
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -516,9 +495,12 @@ static int dwc3_octeon_probe(struct platform_device *pdev)
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
 
-	err = dwc3_octeon_clocks_start(dev, data->base);
-	if (err)
+	err = dwc3_octeon_setup(data->base, ref_clk_sel, ref_clk_fsel,
+				mpll_mul, power_gpio, power_active_low);
+	if (err) {
+		dev_err(dev, "controller init failure\n");
 		return err;
+	}
 
 	dwc3_octeon_set_endian_mode(data->base);
 	dwc3_octeon_phy_reset(data->base);
-- 
2.39.2

