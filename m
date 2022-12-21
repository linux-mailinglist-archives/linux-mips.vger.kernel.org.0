Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55352653269
	for <lists+linux-mips@lfdr.de>; Wed, 21 Dec 2022 15:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234467AbiLUOYY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 21 Dec 2022 09:24:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234218AbiLUOYC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 21 Dec 2022 09:24:02 -0500
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C342923BC7
        for <linux-mips@vger.kernel.org>; Wed, 21 Dec 2022 06:23:53 -0800 (PST)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id 800bpW21Wv5uI800cpa5qP; Wed, 21 Dec 2022 15:23:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671632631; bh=hui9VHk/u2MBeugw0mFQ8B/VyPIY4Wmu9yCPevvSoaQ=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=IeAkCsg64XAqjZlxsa3c65KN8SBiy15EmsEO8HIB/pB4qJVeKflKUhVh2H4SA8BGV
         L5o0J6jGfUPVkRPx/62EvcVpXJOZLQoiN9kfWux91EveVJ2xtF0i9Bg5q7EcNwqFIA
         D7AIbG3qPNTwvwuccQlTvdu20Jwf0epYwF2sgbch55JraLjhnSWZ+dKsIsMSOGjSVE
         DkQHMsjVaHu+YUZT0H8EiVwe4SXkaUnw8xQAZ0CcORYq1j+sbBmVKKVAX+u9QVhX7i
         zqbRzwkiG/NXrOEwBztyOb8Aob0Or2L8ZJlhQc00GJIKEcdKibA49MdflYnbgxeu2y
         v4PE7umVJ5mAA==
Date:   Wed, 21 Dec 2022 15:23:49 +0100
From:   Ladislav Michl <oss-lists@triops.cz>
To:     linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: OCTEON: octeon-usb: Consolidate error messages
Message-ID: <Y6MW9Z4uhrqO4ocn@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: MS4wfJbZlS700P5nfQ7pPWhA8RkVfcj/+mPVIrLs5CwLQScyWXNFJ3MaAyJK19uFs9K9/rMM4mLImbuu+ErtsyR9jnJyQGzZaoxvLU3u0n2iCiq0NZX2QmOU
 y/lr8M4aeYJ9XS7d+s0mpqB5GDMgGDpGZnMTHyyEvnPS4C7OTHSEZjmi
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

Console output currently looks like USB clocks initialized succesfully
even in case of error. Fix that and use consistently dev_err for fatal
errors otherwise dev_warn.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 Hi there,

 this is just cleanup before real work. Just note that even
 warning says "Invalid UCTL clock rate ..., using 100000000 instead"
 clock_rate is not set to 100000000. There's also some indentation
 fixes to be done.

 However my main concern is unimplemented errata 29206 as noted in
 OCTEON III CN70XX/CN71XX Known Issues Revision 1.9, released under
 NDA. You can see its implementation in coreboot here (line 196):
 https://fossies.org/linux/coreboot/src/vendorcode/cavium/bdk/libbdk-hal/bdk-usb.c

 Above looks like BSD license. I'll reimplement said errata
 from scratch, unless someone sees as a problem "Marvell Proprietary
 and Confidential" documentation is used as source.

 arch/mips/cavium-octeon/octeon-usb.c | 42 +++++++++++++---------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
index 5cffe1ed2447..28677c615175 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -245,7 +245,7 @@ static int dwc3_octeon_config_power(struct device *dev, u64 base)
 			power_active_low = 0;
 			gpio = gpio_pwr[1];
 		} else {
-			dev_err(dev, "dwc3 controller clock init failure.\n");
+			dev_err(dev, "invalid power configuration\n");
 			return -EINVAL;
 		}
 		if ((OCTEON_IS_MODEL(OCTEON_CN73XX) ||
@@ -278,7 +278,7 @@ static int dwc3_octeon_config_power(struct device *dev, u64 base)
 		uctl_host_cfg.s.ppc_en = 0;
 		uctl_host_cfg.s.ppc_active_high_en = 0;
 		cvmx_write_csr(base + UCTL_HOST_CFG, uctl_host_cfg.u64);
-		dev_warn(dev, "dwc3 controller clock init failure.\n");
+		dev_info(dev, "power control disabled\n");
 	}
 	return 0;
 }
@@ -301,19 +301,19 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 		i = of_property_read_u32(dev->of_node,
 					 "refclk-frequency", &clock_rate);
 		if (i) {
-			pr_err("No UCTL \"refclk-frequency\"\n");
+			dev_err(dev, "No UCTL \"refclk-frequency\"\n");
 			return -EINVAL;
 		}
 		i = of_property_read_string(dev->of_node,
 					    "refclk-type-ss", &ss_clock_type);
 		if (i) {
-			pr_err("No UCTL \"refclk-type-ss\"\n");
+			dev_err(dev, "No UCTL \"refclk-type-ss\"\n");
 			return -EINVAL;
 		}
 		i = of_property_read_string(dev->of_node,
 					    "refclk-type-hs", &hs_clock_type);
 		if (i) {
-			pr_err("No UCTL \"refclk-type-hs\"\n");
+			dev_err(dev, "No UCTL \"refclk-type-hs\"\n");
 			return -EINVAL;
 		}
 		if (strcmp("dlmc_ref_clk0", ss_clock_type) == 0) {
@@ -322,29 +322,29 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 			else if (strcmp(hs_clock_type, "pll_ref_clk") == 0)
 				ref_clk_sel = 2;
 			else
-				pr_err("Invalid HS clock type %s, using  pll_ref_clk instead\n",
-				       hs_clock_type);
+				dev_warn(dev, "Invalid HS clock type %s, using pll_ref_clk instead\n",
+					 hs_clock_type);
 		} else if (strcmp(ss_clock_type, "dlmc_ref_clk1") == 0) {
 			if (strcmp(hs_clock_type, "dlmc_ref_clk1") == 0)
 				ref_clk_sel = 1;
 			else if (strcmp(hs_clock_type, "pll_ref_clk") == 0)
 				ref_clk_sel = 3;
 			else {
-				pr_err("Invalid HS clock type %s, using  pll_ref_clk instead\n",
-				       hs_clock_type);
+				dev_warn(dev, "Invalid HS clock type %s, using pll_ref_clk instead\n",
+					 hs_clock_type);
 				ref_clk_sel = 3;
 			}
 		} else
-			pr_err("Invalid SS clock type %s, using  dlmc_ref_clk0 instead\n",
-			       ss_clock_type);
+			dev_warn(dev, "Invalid SS clock type %s, using dlmc_ref_clk0 instead\n",
+				 ss_clock_type);
 
 		if ((ref_clk_sel == 0 || ref_clk_sel == 1) &&
-				  (clock_rate != 100000000))
-			pr_err("Invalid UCTL clock rate of %u, using 100000000 instead\n",
-			       clock_rate);
+		    (clock_rate != 100000000))
+			dev_warn(dev, "Invalid UCTL clock rate of %u, using 100000000 instead\n",
+				 clock_rate);
 
 	} else {
-		pr_err("No USB UCTL device node\n");
+		dev_err(dev, "No USB UCTL device node\n");
 		return -EINVAL;
 	}
 
@@ -396,8 +396,8 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 	uctl_ctl.s.ref_clk_div2 = 0;
 	switch (clock_rate) {
 	default:
-		dev_err(dev, "Invalid ref_clk %u, using 100000000 instead\n",
-			clock_rate);
+		dev_warn(dev, "Invalid ref_clk %u, using 100000000 instead\n",
+			 clock_rate);
 		fallthrough;
 	case 100000000:
 		mpll_mul = 0x19;
@@ -438,10 +438,8 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 	udelay(10);
 
 	/* Steo 8c: Setup power-power control. */
-	if (dwc3_octeon_config_power(dev, base)) {
-		dev_err(dev, "Error configuring power.\n");
+	if (dwc3_octeon_config_power(dev, base))
 		return -EINVAL;
-	}
 
 	/* Step 8d: Deassert UAHC reset signal. */
 	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
@@ -529,10 +527,10 @@ static int __init dwc3_octeon_device_init(void)
 			}
 
 			mutex_lock(&dwc3_octeon_clocks_mutex);
-			dwc3_octeon_clocks_start(&pdev->dev, (u64)base);
+			if (dwc3_octeon_clocks_start(&pdev->dev, (u64)base) == 0)
+				dev_info(&pdev->dev, "clocks initialized.\n");
 			dwc3_octeon_set_endian_mode((u64)base);
 			dwc3_octeon_phy_reset((u64)base);
-			dev_info(&pdev->dev, "clocks initialized.\n");
 			mutex_unlock(&dwc3_octeon_clocks_mutex);
 			devm_iounmap(&pdev->dev, base);
 			devm_release_mem_region(&pdev->dev, res->start,
-- 
2.32.0

