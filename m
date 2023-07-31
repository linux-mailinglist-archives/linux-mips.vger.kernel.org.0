Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9CC7691C0
	for <lists+linux-mips@lfdr.de>; Mon, 31 Jul 2023 11:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbjGaJbL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 05:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232263AbjGaJa6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 05:30:58 -0400
Received: from h1.cmg1.smtp.forpsi.com (h1.cmg1.smtp.forpsi.com [81.2.195.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F7610D5
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 02:30:48 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id QPEjqwTxdPm6CQPEkqqHpc; Mon, 31 Jul 2023 11:30:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690795846; bh=AQGXBy7vpP7NRtHMfFfektc5a+kpqauMMvPT8YLPz4I=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=nsYdX1EF3tJlUGI5wpKmWWRWh9E9lS8QN+v65uI/yD9w/rGE8MiyT6HGB/diG2PhS
         oFYBqbF2wXDwktY+7L7Xi1f0s8D90GSE5lVuFrFpSrpnW+SMJJtWuX64dS8tzgH67Q
         8HXSYiHwG6yffMu4NRifCkq7yU3GRl4PFwqX7bly0uBoazx0EnaXKOF8GJf34CKHpp
         IbtlX+GKj8IHMjbDywETVfv+7VhsiA9udhCyXWMyC6evoOhveYndcSqNLFoC+VfdmI
         KEKYnJyWOnl41j512UdIvKHKcxjAtw4zT4D9EfAHHWhwyVv6YsFJB4vKpBAruYTEal
         TfxX3a9EVtqvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690795846; bh=AQGXBy7vpP7NRtHMfFfektc5a+kpqauMMvPT8YLPz4I=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=nsYdX1EF3tJlUGI5wpKmWWRWh9E9lS8QN+v65uI/yD9w/rGE8MiyT6HGB/diG2PhS
         oFYBqbF2wXDwktY+7L7Xi1f0s8D90GSE5lVuFrFpSrpnW+SMJJtWuX64dS8tzgH67Q
         8HXSYiHwG6yffMu4NRifCkq7yU3GRl4PFwqX7bly0uBoazx0EnaXKOF8GJf34CKHpp
         IbtlX+GKj8IHMjbDywETVfv+7VhsiA9udhCyXWMyC6evoOhveYndcSqNLFoC+VfdmI
         KEKYnJyWOnl41j512UdIvKHKcxjAtw4zT4D9EfAHHWhwyVv6YsFJB4vKpBAruYTEal
         TfxX3a9EVtqvA==
Date:   Mon, 31 Jul 2023 11:30:45 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v5 1/7] usb: dwc3: dwc3-octeon: Convert to glue driver
Message-ID: <ZMd/ReyiY7wS6DvN@lenoch>
References: <ZMd/HzISn0mPsNWt@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMd/HzISn0mPsNWt@lenoch>
X-CMAE-Envelope: MS4wfLRrfpUdRpgDrOtJ/kM5h/XfOB6pfYUGb9XG11zId09rqFeJHvbxLrv0UtRpW90a5XWXP+WK/MwYsQ6f8mYW9Lp6M2V5IDrdthdETEO7X1/29MEzUMFI
 7MxMOYCCdj1L+fLtjdjXJyF5S8YyNhLU8goajRbTWiIE1FFIkG54kXcqRdbOfhqmVBdIjSehvLInO6vmeqQJ81jucX/0xSIDTyza004OyXDjGSZE30g1HKp8
 6CHjk+phClF6Tl7SyXqSwMpcd4BZP0OOwDlHTzasiO0ztyYDdc44wBLD4Z/UFOtHxOuf0RRzVCsEyq1VDbDEPy0TpqF9MCamq4XrhxU4/h2YvnlKZmYxZpi+
 FnOleQ7a
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

DWC3 as implemented in Cavium SoC is using UCTL bridge unit
between I/O interconnect and USB controller.

Currently there is no bond with dwc3 core code, so if anything goes
wrong in UCTL setup dwc3 is left in reset, which leads to bus error
while trying to read any device register. Thus any failure in UCTL
initialization ends with kernel panic.

To avoid this move Octeon DWC3 glue code from arch/mips and make it
proper glue driver which is used instead of dwc3-of-simple.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 CHANGES:
 - v2: squashed move and glue conversion patch, fixed sparse warning
       and formatting issue. Set private data at the end of probe.
       Clear drvdata on remove. Added host mode only notice.
       Collected ack for move from arch/mips.
 - v3: more descriptive commit message, dropped unrelated changes
 - v4: rename dwc3_data to dwc3_octeon, collect Thinh's ack.
 - v5: none

 arch/mips/cavium-octeon/Makefile              |   1 -
 arch/mips/cavium-octeon/octeon-platform.c     |   1 -
 drivers/usb/dwc3/Kconfig                      |  10 ++
 drivers/usb/dwc3/Makefile                     |   1 +
 .../usb/dwc3/dwc3-octeon.c                    | 105 ++++++++++--------
 drivers/usb/dwc3/dwc3-of-simple.c             |   1 -
 6 files changed, 68 insertions(+), 51 deletions(-)
 rename arch/mips/cavium-octeon/octeon-usb.c => drivers/usb/dwc3/dwc3-octeon.c (91%)

diff --git a/arch/mips/cavium-octeon/Makefile b/arch/mips/cavium-octeon/Makefile
index 7c02e542959a..2a5926578841 100644
--- a/arch/mips/cavium-octeon/Makefile
+++ b/arch/mips/cavium-octeon/Makefile
@@ -18,4 +18,3 @@ obj-y += crypto/
 obj-$(CONFIG_MTD)		      += flash_setup.o
 obj-$(CONFIG_SMP)		      += smp.o
 obj-$(CONFIG_OCTEON_ILM)	      += oct_ilm.o
-obj-$(CONFIG_USB)		      += octeon-usb.o
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
 
diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index be954a9abbe0..98efcbb76c88 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -168,4 +168,14 @@ config USB_DWC3_AM62
 	  The Designware Core USB3 IP is programmed to operate in
 	  in USB 2.0 mode only.
 	  Say 'Y' or 'M' here if you have one such device
+
+config USB_DWC3_OCTEON
+	tristate "Cavium Octeon Platforms"
+	depends on CAVIUM_OCTEON_SOC || COMPILE_TEST
+	default USB_DWC3
+	help
+	  Support Cavium Octeon platforms with DesignWare Core USB3 IP.
+	  Only the host mode is currently supported.
+	  Say 'Y' or 'M' here if you have one such device.
+
 endif
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index 9f66bd82b639..fe1493d4bbe5 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -54,3 +54,4 @@ obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
 obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
 obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
+obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/drivers/usb/dwc3/dwc3-octeon.c
similarity index 91%
rename from arch/mips/cavium-octeon/octeon-usb.c
rename to drivers/usb/dwc3/dwc3-octeon.c
index 2add435ad038..7134cdfc0fb6 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -187,7 +187,10 @@
 #define USBDRD_UCTL_ECC				0xf0
 #define USBDRD_UCTL_SPARE1			0xf8
 
-static DEFINE_MUTEX(dwc3_octeon_clocks_mutex);
+struct dwc3_octeon {
+	struct device *dev;
+	void __iomem *base;
+};
 
 #ifdef CONFIG_CAVIUM_OCTEON_SOC
 #include <asm/octeon/octeon.h>
@@ -233,6 +236,11 @@ static inline uint64_t dwc3_octeon_readq(void __iomem *addr)
 static inline void dwc3_octeon_writeq(void __iomem *base, uint64_t val) { }
 
 static inline void dwc3_octeon_config_gpio(int index, int gpio) { }
+
+static uint64_t octeon_get_io_clock_rate(void)
+{
+	return 150000000;
+}
 #endif
 
 static int dwc3_octeon_get_divider(void)
@@ -494,58 +502,59 @@ static void __init dwc3_octeon_phy_reset(void __iomem *base)
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
+	struct device_node *node = dev->of_node;
+	struct dwc3_octeon *octeon;
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
+	octeon = devm_kzalloc(dev, sizeof(*octeon), GFP_KERNEL);
+	if (!octeon)
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
+	octeon->dev = dev;
+	octeon->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(octeon->base))
+		return PTR_ERR(octeon->base);
 
-	return 0;
+	err = dwc3_octeon_clocks_start(dev, octeon->base);
+	if (err)
+		return err;
+
+	dwc3_octeon_set_endian_mode(octeon->base);
+	dwc3_octeon_phy_reset(octeon->base);
+
+	platform_set_drvdata(pdev, octeon);
+
+	return of_platform_populate(node, NULL, NULL, dev);
+}
+
+static void dwc3_octeon_remove(struct platform_device *pdev)
+{
+	struct dwc3_octeon *octeon = platform_get_drvdata(pdev);
+
+	of_platform_depopulate(octeon->dev);
+	platform_set_drvdata(pdev, NULL);
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
index 7e6ad8fe61a5..d1539fc9eabd 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -170,7 +170,6 @@ static const struct dev_pm_ops dwc3_of_simple_dev_pm_ops = {
 
 static const struct of_device_id of_dwc3_simple_match[] = {
 	{ .compatible = "rockchip,rk3399-dwc3" },
-	{ .compatible = "cavium,octeon-7130-usb-uctl" },
 	{ .compatible = "sprd,sc9860-dwc3" },
 	{ .compatible = "allwinner,sun50i-h6-dwc3" },
 	{ .compatible = "hisilicon,hi3670-dwc3" },
-- 
2.39.2

