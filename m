Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4701735E44
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jun 2023 22:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjFSUPP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jun 2023 16:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjFSUPO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jun 2023 16:15:14 -0400
Received: from h4.cmg1.smtp.forpsi.com (h4.cmg1.smtp.forpsi.com [185.129.138.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC7013D
        for <linux-mips@vger.kernel.org>; Mon, 19 Jun 2023 13:15:13 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id BLHKq52GkPm6CBLHLqL7EX; Mon, 19 Jun 2023 22:15:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205711; bh=WMJ3+35eA39OpL7FYZeQOMS96PRO2jxUPQicwsKhheI=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=Xtx8rv4oWjXzZXdY1U/y202rpfKDtWStQOEWH6yrR3saqWx7bcOqF6vel/Bc5MdFi
         fraxZm61J2qPdpkF5AA4wSj91pPos/37T6+mUNC/Fq1HUlU/1P8EiRye93J1HMbD4E
         w2LQS2TIO8qybnBIr1gUuwkXm4r9Mv5GE2LsEjrV+aidKsXvKa22O2xqnFffA5j27I
         V4XjsySDKFW3IgDs1SoXl4tD6YqxGgaUFRYCRdWA9HjNe1vMczEa+k4I3uV8ofdXuD
         12lkTM+OGgPdEMJ23WJul0LIpMkE/sZGFQMUBBdgQbIySWmwosbmlGz22myEUTig5k
         PHRwJ/hAXRxmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205711; bh=WMJ3+35eA39OpL7FYZeQOMS96PRO2jxUPQicwsKhheI=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=Xtx8rv4oWjXzZXdY1U/y202rpfKDtWStQOEWH6yrR3saqWx7bcOqF6vel/Bc5MdFi
         fraxZm61J2qPdpkF5AA4wSj91pPos/37T6+mUNC/Fq1HUlU/1P8EiRye93J1HMbD4E
         w2LQS2TIO8qybnBIr1gUuwkXm4r9Mv5GE2LsEjrV+aidKsXvKa22O2xqnFffA5j27I
         V4XjsySDKFW3IgDs1SoXl4tD6YqxGgaUFRYCRdWA9HjNe1vMczEa+k4I3uV8ofdXuD
         12lkTM+OGgPdEMJ23WJul0LIpMkE/sZGFQMUBBdgQbIySWmwosbmlGz22myEUTig5k
         PHRwJ/hAXRxmA==
Date:   Mon, 19 Jun 2023 22:15:10 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH 09/11] usb: dwc3: dwc3-octeon: Convert to glue driver
Message-ID: <ZJC3TpgZJ6HtknhY@lenoch>
References: <ZJC165p0Mj4jHcBh@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJC165p0Mj4jHcBh@lenoch>
X-CMAE-Envelope: MS4wfCHtnYnAgZ9GhS+LrvtkGDdA1Yxz2F3FqQolpafnaKheAJcZMZMYXBsyqY0/2eK40yjKgaIJ1RMQpvLQDQf4f0iRR8tEpy0mJzqY/vc65PTUvj2xmMXy
 VwzZAm11I4WMefBP8oQ1p7rqvSlQbX3Z9c+5PTtJh55M214H2iNjPSBtRD58RJPvW1mHDycwRFo73/ENmm/y2A6A9GZnHdiM6a9SHJJeQsM6EHv0CVx79Kz2
 NM/+RvBu9A9JD0WpRP8+Eg==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

Use Octeon specific DWC3 glue instead of dwc3-of-simple.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 arch/mips/cavium-octeon/octeon-platform.c |   1 -
 drivers/usb/dwc3/dwc3-octeon.c            | 100 +++++++++++-----------
 drivers/usb/dwc3/dwc3-of-simple.c         |   1 -
 3 files changed, 52 insertions(+), 50 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-platform.c b/arch/mips/cavium-octeon/octeon-platform.c
index ce05c0dd3acd..235c77ce7b18 100644
--- a/arch/mips/cavium-octeon/octeon-platform.c
+++ b/arch/mips/cavium-octeon/octeon-platform.c
@@ -450,7 +450,6 @@ static const struct of_device_id octeon_ids[] __initconst = {
 	{ .compatible = "cavium,octeon-3860-bootbus", },
 	{ .compatible = "cavium,mdio-mux", },
 	{ .compatible = "gpio-leds", },
-	{ .compatible = "cavium,octeon-7130-usb-uctl", },
 	{},
 };
 
diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 2add435ad038..3ebcf2a61233 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -187,7 +187,10 @@
 #define USBDRD_UCTL_ECC				0xf0
 #define USBDRD_UCTL_SPARE1			0xf8
 
-static DEFINE_MUTEX(dwc3_octeon_clocks_mutex);
+struct dwc3_data {
+	struct device *dev;
+	void __iomem *base;
+};
 
 #ifdef CONFIG_CAVIUM_OCTEON_SOC
 #include <asm/octeon/octeon.h>
@@ -494,58 +499,57 @@ static void __init dwc3_octeon_phy_reset(void __iomem *base)
 	dwc3_octeon_writeq(uctl_ctl_reg, val);
 }
 
-static int __init dwc3_octeon_device_init(void)
+static int dwc3_octeon_probe(struct platform_device *pdev)
 {
-	const char compat_node_name[] = "cavium,octeon-7130-usb-uctl";
-	struct platform_device *pdev;
-	struct device_node *node;
-	struct resource *res;
-	void __iomem *base;
+	struct device *dev = &pdev->dev;
+	struct dwc3_data *data;
+	int err;
 
-	/*
-	 * There should only be three universal controllers, "uctl"
-	 * in the device tree. Two USB and a SATA, which we ignore.
-	 */
-	node = NULL;
-	do {
-		node = of_find_node_by_name(node, "uctl");
-		if (!node)
-			return -ENODEV;
-
-		if (of_device_is_compatible(node, compat_node_name)) {
-			pdev = of_find_device_by_node(node);
-			if (!pdev)
-				return -ENODEV;
-
-			/*
-			 * The code below maps in the registers necessary for
-			 * setting up the clocks and reseting PHYs. We must
-			 * release the resources so the dwc3 subsystem doesn't
-			 * know the difference.
-			 */
-			base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-			if (IS_ERR(base)) {
-				put_device(&pdev->dev);
-				return PTR_ERR(base);
-			}
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
 
-			mutex_lock(&dwc3_octeon_clocks_mutex);
-			if (dwc3_octeon_clocks_start(&pdev->dev, base) == 0)
-				dev_info(&pdev->dev, "clocks initialized.\n");
-			dwc3_octeon_set_endian_mode(base);
-			dwc3_octeon_phy_reset(base);
-			mutex_unlock(&dwc3_octeon_clocks_mutex);
-			devm_iounmap(&pdev->dev, base);
-			devm_release_mem_region(&pdev->dev, res->start,
-						resource_size(res));
-			put_device(&pdev->dev);
-		}
-	} while (node != NULL);
+	data->dev = dev;
+	platform_set_drvdata(pdev, data);
 
-	return 0;
+	data->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->base))
+		return PTR_ERR(data->base);
+
+	err = dwc3_octeon_clocks_start(dev, data->base);
+	if (err)
+		return err;
+
+	dwc3_octeon_set_endian_mode(data->base);
+	dwc3_octeon_phy_reset(data->base);
+
+	return of_platform_populate(node, NULL, NULL, dev);
+}
+
+static void dwc3_octeon_remove(struct platform_device *pdev)
+{
+	struct dwc3_data *data = platform_get_drvdata(pdev);
+
+	of_platform_depopulate(data->dev);
 }
-device_initcall(dwc3_octeon_device_init);
 
+static const struct of_device_id dwc3_octeon_of_match[] = {
+	{ .compatible = "cavium,octeon-7130-usb-uctl" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, dwc3_octeon_of_match);
+
+static struct platform_driver dwc3_octeon_driver = {
+	.probe		= dwc3_octeon_probe,
+	.remove_new	= dwc3_octeon_remove,
+	.driver		= {
+		.name	= "dwc3-octeon",
+		.of_match_table = dwc3_octeon_of_match,
+	},
+};
+module_platform_driver(dwc3_octeon_driver);
+
+MODULE_ALIAS("platform:dwc3-octeon");
 MODULE_AUTHOR("David Daney <david.daney@cavium.com>");
 MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("USB driver for OCTEON III SoC");
+MODULE_DESCRIPTION("DesignWare USB3 OCTEON III Glue Layer");
diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index 71fd620c5161..e3423fbea3ed 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -172,7 +172,6 @@ static const struct dev_pm_ops dwc3_of_simple_dev_pm_ops = {
 
 static const struct of_device_id of_dwc3_simple_match[] = {
 	{ .compatible = "rockchip,rk3399-dwc3" },
-	{ .compatible = "cavium,octeon-7130-usb-uctl" },
 	{ .compatible = "sprd,sc9860-dwc3" },
 	{ .compatible = "allwinner,sun50i-h6-dwc3" },
 	{ .compatible = "hisilicon,hi3670-dwc3" },
-- 
2.39.2

