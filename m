Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2F35754EF8
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jul 2023 16:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjGPOPZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Jul 2023 10:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGPOPZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Jul 2023 10:15:25 -0400
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93710BA
        for <linux-mips@vger.kernel.org>; Sun, 16 Jul 2023 07:15:23 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id L2WuqBWL6Pm6CL2WvqIOAK; Sun, 16 Jul 2023 16:15:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689516921; bh=7mmkvQv6aEFrTdJigTMeMePl0wk5IoScoajAYdJEYC4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=FxqRW/XS/Zbp7hFiCpK/SBXoX9c4kh3A5WD7vSbBpax6ZqcSvpADJlLxDob0KSZNw
         IlJt455CkvilYnkZKiEUSkFpZ2wVUPzQBFyY8U0W97PCebfW90nD7dKaB7/9EFo8LH
         LymFXVdThgFunD9x+UK+Gu9aObbp64KB27aZhxO82i0gfEJQr+GIVbe/0C9MkqIgMh
         yt7Aq/iKUovWQNdtISvjqsq9ghlN3EsRatmiNiSIYZWkYAEiPLRMjqRGM1fHZNyQOp
         uOu2uKhy2saQZPECK9pN9iVlziAzofW4sUV+N95RZjnXnWUyfw6l29TIN2GFQmDyMJ
         fj6Py+ia0FQ4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689516921; bh=7mmkvQv6aEFrTdJigTMeMePl0wk5IoScoajAYdJEYC4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=FxqRW/XS/Zbp7hFiCpK/SBXoX9c4kh3A5WD7vSbBpax6ZqcSvpADJlLxDob0KSZNw
         IlJt455CkvilYnkZKiEUSkFpZ2wVUPzQBFyY8U0W97PCebfW90nD7dKaB7/9EFo8LH
         LymFXVdThgFunD9x+UK+Gu9aObbp64KB27aZhxO82i0gfEJQr+GIVbe/0C9MkqIgMh
         yt7Aq/iKUovWQNdtISvjqsq9ghlN3EsRatmiNiSIYZWkYAEiPLRMjqRGM1fHZNyQOp
         uOu2uKhy2saQZPECK9pN9iVlziAzofW4sUV+N95RZjnXnWUyfw6l29TIN2GFQmDyMJ
         fj6Py+ia0FQ4w==
Date:   Sun, 16 Jul 2023 16:15:19 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 2/6] usb: dwc3: dwc3-octeon: Pass dwc3_octeon to setup
 functions
Message-ID: <ZLP7d65Lc6jC0Tc/@lenoch>
References: <ZLP7CSUm095ADtdw@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLP7CSUm095ADtdw@lenoch>
X-CMAE-Envelope: MS4wfExOYcVFDVq8z2WsAQmrYoo7nfvrPM4OGIU9aUZLnLohU6vv53ZgWhOQ8pe4VLjD5iuIwKc2ACgqRSOc8I3y+om9kT/xmEHc34TPL28QDgKhZeVxUv+s
 D70qYFfSV/ZeOVxu02TqWMFtBfGOvQF9WDdVkY26bzW0G/Cko5YjaRLvV9eakqBtBkAIdttPS5b9yx5kmKw33N+hW9gaMwz2qYxC5VKR2OMqZZDeRCjDiPxd
 ub/R7fq2vGYP8UJBqbz0Enu2JPRMCGDqA3vPbCObrq4mn9+PBLLCRmb5OeL+WknCYoGCBMmB0W6s8FhESnwI0WAduw6r8d/ElIQ2mSXEsT48OknipSRli++D
 H+P7NpYP
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
---
 CHANGES:
 - v4: new patch

 drivers/usb/dwc3/dwc3-octeon.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 7134cdfc0fb6..20440c4d2366 100644
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

