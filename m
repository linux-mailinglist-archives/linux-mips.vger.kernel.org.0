Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 994C47691D2
	for <lists+linux-mips@lfdr.de>; Mon, 31 Jul 2023 11:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbjGaJdE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 05:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232355AbjGaJcZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 05:32:25 -0400
Received: from h1.cmg1.smtp.forpsi.com (h1.cmg1.smtp.forpsi.com [81.2.195.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB3A127
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 02:32:19 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id QPGCqwV2zPm6CQPGEqqIHT; Mon, 31 Jul 2023 11:32:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690795938; bh=nWemIEuN8F90ycMXo5G6slMMbUU2sM5EfPT8NBTPH+w=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=tPJrgk8lnUJXstbdwX1HVnU9HrDu83n0Wqi/T1wobk9a7u/2berlAmLDoHvs0ETbC
         6n996SaL93cnvSxiCKFg12tssBD/uSXgPV1aZRV0kYm3v8IAuCyuPZP/XzczKi4Hqu
         o2YImRhZZHdhokB/gpFhV1mx1xrH9LQ0mv12q+wLGujSv+bcYdXvRWHSn36eSZoSfu
         6aLWr5kpl1RqH1dy23MplV8JPHX/F7RSG3BupMOXW5eFzo+CGyaau+N6SAXe6SemlK
         uZC8Sx4oknIa0UugQBEcmMDQ2f3M/egP//axTSU6vumyTo04QBWw0dHaWnRzBYWUeK
         MPx8pCXB4awMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690795938; bh=nWemIEuN8F90ycMXo5G6slMMbUU2sM5EfPT8NBTPH+w=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=tPJrgk8lnUJXstbdwX1HVnU9HrDu83n0Wqi/T1wobk9a7u/2berlAmLDoHvs0ETbC
         6n996SaL93cnvSxiCKFg12tssBD/uSXgPV1aZRV0kYm3v8IAuCyuPZP/XzczKi4Hqu
         o2YImRhZZHdhokB/gpFhV1mx1xrH9LQ0mv12q+wLGujSv+bcYdXvRWHSn36eSZoSfu
         6aLWr5kpl1RqH1dy23MplV8JPHX/F7RSG3BupMOXW5eFzo+CGyaau+N6SAXe6SemlK
         uZC8Sx4oknIa0UugQBEcmMDQ2f3M/egP//axTSU6vumyTo04QBWw0dHaWnRzBYWUeK
         MPx8pCXB4awMA==
Date:   Mon, 31 Jul 2023 11:32:16 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v5 4/7] usb: dwc3: dwc3-octeon: Avoid half-initialized
 controller state
Message-ID: <ZMd/oMRx8ze22/kK@lenoch>
References: <ZMd/HzISn0mPsNWt@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMd/HzISn0mPsNWt@lenoch>
X-CMAE-Envelope: MS4wfJvX+DbKj70iVO55h/ufyqck4oKCkcAtuowsxZyJcQ+RO55f2pB5igYfDhqg5RhMSr8ReDu9kD6h4C6wSQSR7b+rufVFVr7TzBPy1+I2dM3S40sS2xKY
 PyayaoR333GNTqDljQfUn6G7Yn5v6nv2wJdNX4Ig9/tROAfl4bQNknGEAxXzBItvh+0LQSj1csVXlxsla3J3SK0LJa1Fk9c74wmEpnQmQDvTx7SgP2H63yAg
 31FQe0EB4pfAdiUGOS9NHSVBA6qCe8oFTPtqEyHhXt54rxyYXF3gjU+jfywaLPIA2zieLKxHdwFm4r0ebi8va/1e1Y1cVx7M2kNL+1PU4Gm5Z1u8hoRS8e5Y
 n+roVJO+
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

Power gpio configuration is done from the middle of
dwc3_octeon_clocks_start leaving hardware in half-initialized
state if it fails. As that indicates dwc3_octeon_clocks_start
does more than just initialize the clocks rename it appropriately
and verify power gpio configuration in advance at the beginning
of device probe.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 CHANGES:
 - v4: new patch
 - v5: use uintptr_t instead of u64 to retype base address to make 32bit
       compilers happy.

 drivers/usb/dwc3/dwc3-octeon.c | 90 ++++++++++++++++------------------
 1 file changed, 43 insertions(+), 47 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 24e75881b5cf..0dc45dda134c 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -192,6 +192,8 @@ struct dwc3_octeon {
 	void __iomem *base;
 };
 
+#define DWC3_GPIO_POWER_NONE	(-1)
+
 #ifdef CONFIG_CAVIUM_OCTEON_SOC
 #include <asm/octeon/octeon.h>
 static inline uint64_t dwc3_octeon_readq(void __iomem *addr)
@@ -258,55 +260,15 @@ static int dwc3_octeon_get_divider(void)
 	return div;
 }
 
-static int dwc3_octeon_config_power(struct device *dev, void __iomem *base)
-{
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
-static int dwc3_octeon_clocks_start(struct dwc3_octeon *octeon)
+static int dwc3_octeon_setup(struct dwc3_octeon *octeon,
+			     int power_gpio, int power_active_low)
 {
 	int i, div, mpll_mul, ref_clk_fsel, ref_clk_sel = 2;
 	u32 clock_rate;
 	u64 val;
 	struct device *dev = octeon->dev;
 	void __iomem *uctl_ctl_reg = octeon->base + USBDRD_UCTL_CTL;
+	void __iomem *uctl_host_cfg_reg = octeon->base + USBDRD_UCTL_HOST_CFG;
 
 	if (dev->of_node) {
 		const char *ss_clock_type;
@@ -454,8 +416,21 @@ static int dwc3_octeon_clocks_start(struct dwc3_octeon *octeon)
 	udelay(10);
 
 	/* Step 8c: Setup power control. */
-	if (dwc3_octeon_config_power(dev, octeon->base))
-		return -EINVAL;
+	val = dwc3_octeon_readq(uctl_host_cfg_reg);
+	val |= USBDRD_UCTL_HOST_PPC_EN;
+	if (power_gpio == DWC3_GPIO_POWER_NONE) {
+		val &= ~USBDRD_UCTL_HOST_PPC_EN;
+	} else {
+		val |= USBDRD_UCTL_HOST_PPC_EN;
+		dwc3_octeon_config_gpio(((__force uintptr_t)octeon->base >> 24) & 1,
+					power_gpio);
+		dev_dbg(dev, "power control is using gpio%d\n", power_gpio);
+	}
+	if (power_active_low)
+		val &= ~USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
+	else
+		val |= USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
+	dwc3_octeon_writeq(uctl_host_cfg_reg, val);
 
 	/* Step 8d: Deassert UAHC reset signal. */
 	val = dwc3_octeon_readq(uctl_ctl_reg);
@@ -508,7 +483,28 @@ static int dwc3_octeon_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 	struct dwc3_octeon *octeon;
-	int err;
+	int power_active_low, power_gpio;
+	int err, len;
+
+	power_gpio = DWC3_GPIO_POWER_NONE;
+	power_active_low = 0;
+	if (of_find_property(node, "power", &len)) {
+		u32 gpio_pwr[3];
+
+		switch (len) {
+		case 8:
+			of_property_read_u32_array(node, "power", gpio_pwr, 2);
+			break;
+		case 12:
+			of_property_read_u32_array(node, "power", gpio_pwr, 3);
+			power_active_low = gpio_pwr[2] & 0x01;
+			break;
+		default:
+			dev_err(dev, "invalid power configuration\n");
+			return -EINVAL;
+		}
+		power_gpio = gpio_pwr[1];
+	}
 
 	octeon = devm_kzalloc(dev, sizeof(*octeon), GFP_KERNEL);
 	if (!octeon)
@@ -519,7 +515,7 @@ static int dwc3_octeon_probe(struct platform_device *pdev)
 	if (IS_ERR(octeon->base))
 		return PTR_ERR(octeon->base);
 
-	err = dwc3_octeon_clocks_start(octeon);
+	err = dwc3_octeon_setup(octeon, power_gpio, power_active_low);
 	if (err)
 		return err;
 
-- 
2.39.2

