Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED8517691CE
	for <lists+linux-mips@lfdr.de>; Mon, 31 Jul 2023 11:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbjGaJcY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 05:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232356AbjGaJb4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 05:31:56 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55ADE12D
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 02:31:49 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id QPFiq0lZmv5uIQPFjqCu2p; Mon, 31 Jul 2023 11:31:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690795907; bh=ejQNu4WaAC5/i3r4ni9jXUpPtWCphTBUKHGIV1oS+Es=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=wWNbnff0ZGavtkCVSjvEMIo3BM47uINeewbsWB8Pmt3bt9gLKooxo7gCqifQVwyPY
         oRdTdXxszSoaqcbLUUVmX8walu+4XvKTMXABR+L1slXEV3Kk8vLaXJrCDwst43DP8F
         Lb2CeE6q+f1GuZEu6iTGFwWH14gtjwG0KJBI7PQFkZ/rXeaXFWgEj8MO1qiS2h0umO
         q+9Gyu/T65z7W5J4kjevfzfuyjwvghRXn9EpjRzT5Tme38ntIG+QlxM15cwKaWAIgo
         2HvUtLoUuvEFnXsIh8XYfv2zdCIDS5bGwkYWsp7dFpIcH2NU3rtvO0xuL2tzDYV7X2
         ljx6EKytc0eJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690795907; bh=ejQNu4WaAC5/i3r4ni9jXUpPtWCphTBUKHGIV1oS+Es=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=wWNbnff0ZGavtkCVSjvEMIo3BM47uINeewbsWB8Pmt3bt9gLKooxo7gCqifQVwyPY
         oRdTdXxszSoaqcbLUUVmX8walu+4XvKTMXABR+L1slXEV3Kk8vLaXJrCDwst43DP8F
         Lb2CeE6q+f1GuZEu6iTGFwWH14gtjwG0KJBI7PQFkZ/rXeaXFWgEj8MO1qiS2h0umO
         q+9Gyu/T65z7W5J4kjevfzfuyjwvghRXn9EpjRzT5Tme38ntIG+QlxM15cwKaWAIgo
         2HvUtLoUuvEFnXsIh8XYfv2zdCIDS5bGwkYWsp7dFpIcH2NU3rtvO0xuL2tzDYV7X2
         ljx6EKytc0eJg==
Date:   Mon, 31 Jul 2023 11:31:46 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v5 3/7] usb: dwc3: dwc3-octeon: Pass dwc3_octeon to setup
 functions
Message-ID: <ZMd/gt58laSlqAAT@lenoch>
References: <ZMd/HzISn0mPsNWt@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZMd/HzISn0mPsNWt@lenoch>
X-CMAE-Envelope: MS4wfKaZp2d7YTiWz14zlRtMEtkytLrK9QOyIOtBr0V4GGUwshynwMrNafveOkks+uRpldnAszgys7NkRl687c7P06JNeywwAZgJRBylFLXcwGas9lelgBO7
 H+7qQc9WPTTx2PBLFYbWXi0lj4RNsG7ueNFsautf4w/L6TSQx6NJHkeU1kpmy5IADlJom3dCB+2GrDsXAh4TFRJ7HCpWnq+7pinSSilW6TzhYjAlq2gE6rQr
 7z3yzizKTdqhINkLVqxPjCWgMLy+P3sazUSTPEZdYE/W0VZ5xP4kM84SGuq3TMBDeTXFJBRIBZ7sXsZcWXGC+sMACn/AXy0rVO+glsuGpGQ4/jnzWEswZf8n
 bW+MmpVE
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

Pass dwc3_octeon instead of just the base. It fits with the
function names and it requires less change in the future if
access to dwc3_octeon is needed.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 CHANGES:
 - v4: new patch
 - v5: Philippe's review tag

 drivers/usb/dwc3/dwc3-octeon.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 69fe50cfa719..24e75881b5cf 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -300,12 +300,13 @@ static int dwc3_octeon_config_power(struct device *dev, void __iomem *base)
 	return 0;
 }
 
-static int dwc3_octeon_clocks_start(struct device *dev, void __iomem *base)
+static int dwc3_octeon_clocks_start(struct dwc3_octeon *octeon)
 {
 	int i, div, mpll_mul, ref_clk_fsel, ref_clk_sel = 2;
 	u32 clock_rate;
 	u64 val;
-	void __iomem *uctl_ctl_reg = base + USBDRD_UCTL_CTL;
+	struct device *dev = octeon->dev;
+	void __iomem *uctl_ctl_reg = octeon->base + USBDRD_UCTL_CTL;
 
 	if (dev->of_node) {
 		const char *ss_clock_type;
@@ -452,8 +453,8 @@ static int dwc3_octeon_clocks_start(struct device *dev, void __iomem *base)
 	/* Step 8b: Wait 10 controller-clock cycles. */
 	udelay(10);
 
-	/* Steo 8c: Setup power-power control. */
-	if (dwc3_octeon_config_power(dev, base))
+	/* Step 8c: Setup power control. */
+	if (dwc3_octeon_config_power(dev, octeon->base))
 		return -EINVAL;
 
 	/* Step 8d: Deassert UAHC reset signal. */
@@ -477,10 +478,10 @@ static int dwc3_octeon_clocks_start(struct device *dev, void __iomem *base)
 	return 0;
 }
 
-static void __init dwc3_octeon_set_endian_mode(void __iomem *base)
+static void dwc3_octeon_set_endian_mode(struct dwc3_octeon *octeon)
 {
 	u64 val;
-	void __iomem *uctl_shim_cfg_reg = base + USBDRD_UCTL_SHIM_CFG;
+	void __iomem *uctl_shim_cfg_reg = octeon->base + USBDRD_UCTL_SHIM_CFG;
 
 	val = dwc3_octeon_readq(uctl_shim_cfg_reg);
 	val &= ~USBDRD_UCTL_SHIM_CFG_DMA_ENDIAN_MODE;
@@ -492,10 +493,10 @@ static void __init dwc3_octeon_set_endian_mode(void __iomem *base)
 	dwc3_octeon_writeq(uctl_shim_cfg_reg, val);
 }
 
-static void __init dwc3_octeon_phy_reset(void __iomem *base)
+static void dwc3_octeon_phy_reset(struct dwc3_octeon *octeon)
 {
 	u64 val;
-	void __iomem *uctl_ctl_reg = base + USBDRD_UCTL_CTL;
+	void __iomem *uctl_ctl_reg = octeon->base + USBDRD_UCTL_CTL;
 
 	val = dwc3_octeon_readq(uctl_ctl_reg);
 	val &= ~USBDRD_UCTL_CTL_UPHY_RST;
@@ -518,12 +519,12 @@ static int dwc3_octeon_probe(struct platform_device *pdev)
 	if (IS_ERR(octeon->base))
 		return PTR_ERR(octeon->base);
 
-	err = dwc3_octeon_clocks_start(dev, octeon->base);
+	err = dwc3_octeon_clocks_start(octeon);
 	if (err)
 		return err;
 
-	dwc3_octeon_set_endian_mode(octeon->base);
-	dwc3_octeon_phy_reset(octeon->base);
+	dwc3_octeon_set_endian_mode(octeon);
+	dwc3_octeon_phy_reset(octeon);
 
 	platform_set_drvdata(pdev, octeon);
 
-- 
2.39.2

