Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A87D57691D5
	for <lists+linux-mips@lfdr.de>; Mon, 31 Jul 2023 11:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231924AbjGaJdO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 05:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232267AbjGaJc7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 05:32:59 -0400
Received: from h1.cmg1.smtp.forpsi.com (h1.cmg1.smtp.forpsi.com [81.2.195.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60EE6E40
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 02:32:58 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id QPGpqwVUgPm6CQPGqqqIQx; Mon, 31 Jul 2023 11:32:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690795976; bh=s9wblspwj9Vu52h88bzBEwg8cmpKO+43BMvX9zWQhHk=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=GeNgdcHmIWQahqDkkbd7jrO/82zpm+uM9fjT6YJv3ti3lMC0ZlwwlRObXpRS1y7lc
         LITm1eJowYZ5sMcfiR+u98s9jJeagm7fvQ3gDxtmi4UlJR/Xlvo0mMBhA3knV0iVaZ
         Q70UZ+vLPCi+ybHZd11wEDfCx2A1UeXv9nznR4+x+pT99uwPfxYb0XTG60p0fIW/6G
         UXFH/ricfBOvaCYr/lJyVXLHwaKeKT5G29/EovolBabQccfBUUK22SgJMtbayDw+l7
         c14rXvxd6L7lLOXb3oJdwxJfW3MSBM1zczDM0Xl3leFOcI8JtyRt+ZMhEXqW/wkRxr
         FAe7WE/pliI7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690795976; bh=s9wblspwj9Vu52h88bzBEwg8cmpKO+43BMvX9zWQhHk=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=GeNgdcHmIWQahqDkkbd7jrO/82zpm+uM9fjT6YJv3ti3lMC0ZlwwlRObXpRS1y7lc
         LITm1eJowYZ5sMcfiR+u98s9jJeagm7fvQ3gDxtmi4UlJR/Xlvo0mMBhA3knV0iVaZ
         Q70UZ+vLPCi+ybHZd11wEDfCx2A1UeXv9nznR4+x+pT99uwPfxYb0XTG60p0fIW/6G
         UXFH/ricfBOvaCYr/lJyVXLHwaKeKT5G29/EovolBabQccfBUUK22SgJMtbayDw+l7
         c14rXvxd6L7lLOXb3oJdwxJfW3MSBM1zczDM0Xl3leFOcI8JtyRt+ZMhEXqW/wkRxr
         FAe7WE/pliI7g==
Date:   Mon, 31 Jul 2023 11:32:55 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v5 5/7] usb: dwc3: dwc3-octeon: Move node parsing into driver
 probe
Message-ID: <ZMd/x3MHA4/QowMO@lenoch>
References: <ZMd/HzISn0mPsNWt@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMd/HzISn0mPsNWt@lenoch>
X-CMAE-Envelope: MS4wfOz47zrcMbx+CLTdTNma5gF++/y9i/v5353Enp6LVelH+x8FwXbGxSqr0VbKyFX/xvLp4w3o2/Fd9u+DjJ/ELK2JmFDjSylcPPZaAJXT6C5iE5AbTwF/
 v4dxMb1aCe26vuJroKkAW0ZAHvoXFeK8PGTDPTtSGimob8bQmjPLWKo29SeyuJ2plnzem9id1bfSfkYPWwbMeb6IkaxNBnXXqJzh34eEqTC/1UnyYLD1oxrb
 BbYos1bo3PDHapgxvuhsaD/XIIi9bMKK+uIZQrhM+zjPXvlFf8sUXlEWpsw9aqQ4DB/xi5D//+NC/Fb7iSpysZxl/v9OL6lpYawPHQ8f9h4D9vyB8XdTMSJF
 bhIf7Kvz
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

Parse and verify device tree node first, then setup UCTL bridge
using verified values. This avoids needless allocations
in case DT misconfiguration was found in the middle of setup.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 CHANGES:
 - v2: if else block bracket according CodingStyle
 - v3: more descriptive commit message, power gpio parsing in probe too,
       checkpatch --strict passed
 - v4: move changes unrelated to parsing move into separate patches
 - v5: none

 drivers/usb/dwc3/dwc3-octeon.c | 135 +++++++++++++++------------------
 1 file changed, 60 insertions(+), 75 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 0dc45dda134c..330bcb59cc95 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -261,69 +261,15 @@ static int dwc3_octeon_get_divider(void)
 }
 
 static int dwc3_octeon_setup(struct dwc3_octeon *octeon,
+			     int ref_clk_sel, int ref_clk_fsel, int mpll_mul,
 			     int power_gpio, int power_active_low)
 {
-	int i, div, mpll_mul, ref_clk_fsel, ref_clk_sel = 2;
-	u32 clock_rate;
 	u64 val;
+	int div;
 	struct device *dev = octeon->dev;
 	void __iomem *uctl_ctl_reg = octeon->base + USBDRD_UCTL_CTL;
 	void __iomem *uctl_host_cfg_reg = octeon->base + USBDRD_UCTL_HOST_CFG;
 
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
-
 	/*
 	 * Step 1: Wait for all voltages to be stable...that surely
 	 *         happened before starting the kernel. SKIP
@@ -367,24 +313,6 @@ static int dwc3_octeon_setup(struct dwc3_octeon *octeon,
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
 
@@ -483,8 +411,64 @@ static int dwc3_octeon_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 	struct dwc3_octeon *octeon;
+	const char *hs_clock_type, *ss_clock_type;
+	int ref_clk_sel, ref_clk_fsel, mpll_mul;
 	int power_active_low, power_gpio;
 	int err, len;
+	u32 clock_rate;
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
 
 	power_gpio = DWC3_GPIO_POWER_NONE;
 	power_active_low = 0;
@@ -515,7 +499,8 @@ static int dwc3_octeon_probe(struct platform_device *pdev)
 	if (IS_ERR(octeon->base))
 		return PTR_ERR(octeon->base);
 
-	err = dwc3_octeon_setup(octeon, power_gpio, power_active_low);
+	err = dwc3_octeon_setup(octeon, ref_clk_sel, ref_clk_fsel, mpll_mul,
+				power_gpio, power_active_low);
 	if (err)
 		return err;
 
-- 
2.39.2

