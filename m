Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9D6735E3C
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jun 2023 22:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjFSUNn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jun 2023 16:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbjFSUNm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jun 2023 16:13:42 -0400
Received: from h3.cmg1.smtp.forpsi.com (h3.cmg1.smtp.forpsi.com [185.129.138.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C2413D
        for <linux-mips@vger.kernel.org>; Mon, 19 Jun 2023 13:13:40 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id BLFqq51rDPm6CBLFrqL77g; Mon, 19 Jun 2023 22:13:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205619; bh=sJgByPYaHelCEmPEMcq6UGvIHEgdEeueJysFidIRM4o=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=OewVUyO9XbVdoTJeFWJX5DcTz+mQkWpbK1cTRZMD9hG13el+TOB2Z+uEsg7+kPqm8
         vI5A+PgaI2gu0pvgzG2csulvBIhMkQTyTo9Cy9q3LgOFi2EkQ78UD+lTXeRaGCSwSh
         +5BMBoQ/lAP8c3wfkchiE50nfgPmHDi3mZV6pfSIGwerbrfh9pU7dfFUJQglFlLI4z
         1WUJC+IEQ08HCFjPOUyYEW2JG7hCHJi4wFv0AVWHfKYW3TzB4qys++kXCrt9g5N5fz
         3EWrxxxxoPHe8fjV5bG/fldT96jHFqmMlMhynIeQltm2Lmt3vBR+LHfaCuH0wWiFpX
         ERrlUvROKvapQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205619; bh=sJgByPYaHelCEmPEMcq6UGvIHEgdEeueJysFidIRM4o=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=OewVUyO9XbVdoTJeFWJX5DcTz+mQkWpbK1cTRZMD9hG13el+TOB2Z+uEsg7+kPqm8
         vI5A+PgaI2gu0pvgzG2csulvBIhMkQTyTo9Cy9q3LgOFi2EkQ78UD+lTXeRaGCSwSh
         +5BMBoQ/lAP8c3wfkchiE50nfgPmHDi3mZV6pfSIGwerbrfh9pU7dfFUJQglFlLI4z
         1WUJC+IEQ08HCFjPOUyYEW2JG7hCHJi4wFv0AVWHfKYW3TzB4qys++kXCrt9g5N5fz
         3EWrxxxxoPHe8fjV5bG/fldT96jHFqmMlMhynIeQltm2Lmt3vBR+LHfaCuH0wWiFpX
         ERrlUvROKvapQ==
Date:   Mon, 19 Jun 2023 22:13:38 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH 06/11] MIPS: OCTEON: octeon-usb: introduce
 dwc3_octeon_{read,write}q
Message-ID: <ZJC28goj9x87BDDN@lenoch>
References: <ZJC165p0Mj4jHcBh@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJC165p0Mj4jHcBh@lenoch>
X-CMAE-Envelope: MS4wfBQ53SS9WPg3VQw92CtWaBW3pXL5WYrSTuPtOyPKFQAh6to+mGgQdQjKSZOJLpKKfUyYsmuawgsrLnmEtxdip40lmNtE7cyeYHMhlMQtVqJRkbiD+KhB
 pT6mJOJu/ZKBJhl/f4PJ0b+syjwxc2qk/T9onXuFCQhZPxm56q7BDx1bhNDdf5h9Eg6QuGMvU8eLcmsaazWwsncFTbSeT0JzxrXxUCoDOfwW3c11X35DjAZO
 p+N5g7K65la95SCHgrq8bA==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

Move all register access code into separate functions and
provide their no-op version for non Octeon platforms.

Later it might be possible to replace them with standard
Linux functions, however datasheets are not publicly available
and I have only one Octeon board to test, so lets stay on safe
side for now.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 arch/mips/cavium-octeon/octeon-usb.c | 99 +++++++++++++++++-----------
 1 file changed, 59 insertions(+), 40 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
index 0f9800b3d373..aaddc874f0ca 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -17,8 +17,6 @@
 #include <linux/mutex.h>
 #include <linux/of_platform.h>
 
-#include <asm/octeon/octeon.h>
-
 /*
  * USB Control Register
  */
@@ -196,6 +194,17 @@
 static DEFINE_MUTEX(dwc3_octeon_clocks_mutex);
 static uint8_t clk_div[OCTEON_H_CLKDIV_SEL] = {1, 2, 4, 6, 8, 16, 24, 32};
 
+#ifdef CONFIG_CAVIUM_OCTEON_SOC
+#include <asm/octeon/octeon.h>
+static inline uint64_t dwc3_octeon_readq(void __iomem *addr)
+{
+	return cvmx_readq_csr(addr);
+}
+
+static inline void dwc3_octeon_writeq(void __iomem *base, uint64_t val)
+{
+	cvmx_writeq_csr(base, val);
+}
 
 static void dwc3_octeon_config_gpio(int index, int gpio)
 {
@@ -220,14 +229,24 @@ static void dwc3_octeon_config_gpio(int index, int gpio)
 		cvmx_write_csr(CVMX_GPIO_XBIT_CFGX(gpio), gpio_bit.u64);
 	}
 }
+#else
+static inline uint64_t dwc3_octeon_readq(void __iomem *addr)
+{
+	return 0;
+}
+
+static inline void dwc3_octeon_writeq(void __iomem *base, uint64_t val) { }
+
+static inline void dwc3_octeon_config_gpio(int index, int gpio) { }
+#endif
 
-static int dwc3_octeon_config_power(struct device *dev, u64 base)
+static int dwc3_octeon_config_power(struct device *dev, void __iomem *base)
 {
 	uint32_t gpio_pwr[3];
 	int gpio, len, power_active_low;
 	struct device_node *node = dev->of_node;
 	u64 val;
-	u64 uctl_host_cfg_reg = base + USBDRD_UCTL_HOST_CFG;
+	void __iomem *uctl_host_cfg_reg = base + USBDRD_UCTL_HOST_CFG;
 
 	if (of_find_property(node, "power", &len) != NULL) {
 		if (len == 12) {
@@ -242,33 +261,33 @@ static int dwc3_octeon_config_power(struct device *dev, u64 base)
 			dev_err(dev, "invalid power configuration\n");
 			return -EINVAL;
 		}
-		dwc3_octeon_config_gpio((base >> 24) & 1, gpio);
+		dwc3_octeon_config_gpio(((u64)base >> 24) & 1, gpio);
 
 		/* Enable XHCI power control and set if active high or low. */
-		val = cvmx_read_csr(uctl_host_cfg_reg);
+		val = dwc3_octeon_readq(uctl_host_cfg_reg);
 		val |= USBDRD_UCTL_HOST_PPC_EN;
 		if (power_active_low)
 			val &= ~USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
 		else
 			val |= USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
-		cvmx_write_csr(uctl_host_cfg_reg, val);
+		dwc3_octeon_writeq(uctl_host_cfg_reg, val);
 	} else {
 		/* Disable XHCI power control and set if active high. */
-		val = cvmx_read_csr(uctl_host_cfg_reg);
+		val = dwc3_octeon_readq(uctl_host_cfg_reg);
 		val &= ~USBDRD_UCTL_HOST_PPC_EN;
 		val &= ~USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
-		cvmx_write_csr(uctl_host_cfg_reg, val);
+		dwc3_octeon_writeq(uctl_host_cfg_reg, val);
 		dev_info(dev, "power control disabled\n");
 	}
 	return 0;
 }
 
-static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
+static int dwc3_octeon_clocks_start(struct device *dev, void __iomem *base)
 {
 	int i, mpll_mul, ref_clk_fsel, ref_clk_sel = 2;
 	u32 clock_rate;
 	u64 div, h_clk_rate, val;
-	u64 uctl_ctl_reg = base + USBDRD_UCTL_CTL;
+	void __iomem *uctl_ctl_reg = base + USBDRD_UCTL_CTL;
 
 	if (dev->of_node) {
 		const char *ss_clock_type;
@@ -332,16 +351,16 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 	/* Step 2: Select GPIO for overcurrent indication, if desired. SKIP */
 
 	/* Step 3: Assert all resets. */
-	val = cvmx_read_csr(uctl_ctl_reg);
+	val = dwc3_octeon_readq(uctl_ctl_reg);
 	val |= USBDRD_UCTL_CTL_UPHY_RST |
 	       USBDRD_UCTL_CTL_UAHC_RST |
 	       USBDRD_UCTL_CTL_UCTL_RST;
-	cvmx_write_csr(uctl_ctl_reg, val);
+	dwc3_octeon_writeq(uctl_ctl_reg, val);
 
 	/* Step 4a: Reset the clock dividers. */
-	val = cvmx_read_csr(uctl_ctl_reg);
+	val = dwc3_octeon_readq(uctl_ctl_reg);
 	val |= USBDRD_UCTL_CTL_H_CLKDIV_RST;
-	cvmx_write_csr(uctl_ctl_reg, val);
+	dwc3_octeon_writeq(uctl_ctl_reg, val);
 
 	/* Step 4b: Select controller clock frequency. */
 	for (div = 0; div < OCTEON_H_CLKDIV_SEL; div++) {
@@ -350,12 +369,12 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 				 h_clk_rate >= OCTEON_MIN_H_CLK_RATE)
 			break;
 	}
-	val = cvmx_read_csr(uctl_ctl_reg);
+	val = dwc3_octeon_readq(uctl_ctl_reg);
 	val &= ~USBDRD_UCTL_CTL_H_CLKDIV_SEL;
 	val |= FIELD_PREP(USBDRD_UCTL_CTL_H_CLKDIV_SEL, div);
 	val |= USBDRD_UCTL_CTL_H_CLK_EN;
-	cvmx_write_csr(uctl_ctl_reg, val);
-	val = cvmx_read_csr(uctl_ctl_reg);
+	dwc3_octeon_writeq(uctl_ctl_reg, val);
+	val = dwc3_octeon_readq(uctl_ctl_reg);
 	if ((div != FIELD_GET(USBDRD_UCTL_CTL_H_CLKDIV_SEL, val)) ||
 	    (!(FIELD_GET(USBDRD_UCTL_CTL_H_CLK_EN, val)))) {
 		dev_err(dev, "dwc3 controller clock init failure.\n");
@@ -364,10 +383,10 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 
 	/* Step 4c: Deassert the controller clock divider reset. */
 	val &= ~USBDRD_UCTL_CTL_H_CLKDIV_RST;
-	cvmx_write_csr(uctl_ctl_reg, val);
+	dwc3_octeon_writeq(uctl_ctl_reg, val);
 
 	/* Step 5a: Reference clock configuration. */
-	val = cvmx_read_csr(uctl_ctl_reg);
+	val = dwc3_octeon_readq(uctl_ctl_reg);
 	val &= ~USBDRD_UCTL_CTL_REF_CLK_DIV2;
 	val &= ~USBDRD_UCTL_CTL_REF_CLK_SEL;
 	val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_SEL, ref_clk_sel);
@@ -407,15 +426,15 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 	/* Step 6a & 6b: Power up PHYs. */
 	val |= USBDRD_UCTL_CTL_HS_POWER_EN;
 	val |= USBDRD_UCTL_CTL_SS_POWER_EN;
-	cvmx_write_csr(uctl_ctl_reg, val);
+	dwc3_octeon_writeq(uctl_ctl_reg, val);
 
 	/* Step 7: Wait 10 controller-clock cycles to take effect. */
 	udelay(10);
 
 	/* Step 8a: Deassert UCTL reset signal. */
-	val = cvmx_read_csr(uctl_ctl_reg);
+	val = dwc3_octeon_readq(uctl_ctl_reg);
 	val &= ~USBDRD_UCTL_CTL_UCTL_RST;
-	cvmx_write_csr(uctl_ctl_reg, val);
+	dwc3_octeon_writeq(uctl_ctl_reg, val);
 
 	/* Step 8b: Wait 10 controller-clock cycles. */
 	udelay(10);
@@ -425,49 +444,49 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 		return -EINVAL;
 
 	/* Step 8d: Deassert UAHC reset signal. */
-	val = cvmx_read_csr(uctl_ctl_reg);
+	val = dwc3_octeon_readq(uctl_ctl_reg);
 	val &= ~USBDRD_UCTL_CTL_UAHC_RST;
-	cvmx_write_csr(uctl_ctl_reg, val);
+	dwc3_octeon_writeq(uctl_ctl_reg, val);
 
 	/* Step 8e: Wait 10 controller-clock cycles. */
 	udelay(10);
 
 	/* Step 9: Enable conditional coprocessor clock of UCTL. */
-	val = cvmx_read_csr(uctl_ctl_reg);
+	val = dwc3_octeon_readq(uctl_ctl_reg);
 	val |= USBDRD_UCTL_CTL_CSCLK_EN;
-	cvmx_write_csr(uctl_ctl_reg, val);
+	dwc3_octeon_writeq(uctl_ctl_reg, val);
 
 	/*Step 10: Set for host mode only. */
-	val = cvmx_read_csr(uctl_ctl_reg);
+	val = dwc3_octeon_readq(uctl_ctl_reg);
 	val &= ~USBDRD_UCTL_CTL_DRD_MODE;
-	cvmx_write_csr(uctl_ctl_reg, val);
+	dwc3_octeon_writeq(uctl_ctl_reg, val);
 
 	return 0;
 }
 
-static void __init dwc3_octeon_set_endian_mode(u64 base)
+static void __init dwc3_octeon_set_endian_mode(void __iomem *base)
 {
 	u64 val;
-	u64 uctl_shim_cfg_reg = base + USBDRD_UCTL_SHIM_CFG;
+	void __iomem *uctl_shim_cfg_reg = base + USBDRD_UCTL_SHIM_CFG;
 
-	val = cvmx_read_csr(uctl_shim_cfg_reg);
+	val = dwc3_octeon_readq(uctl_shim_cfg_reg);
 	val &= ~USBDRD_UCTL_SHIM_CFG_DMA_ENDIAN_MODE;
 	val &= ~USBDRD_UCTL_SHIM_CFG_CSR_ENDIAN_MODE;
 #ifdef __BIG_ENDIAN
 	val |= FIELD_PREP(USBDRD_UCTL_SHIM_CFG_DMA_ENDIAN_MODE, 1);
 	val |= FIELD_PREP(USBDRD_UCTL_SHIM_CFG_CSR_ENDIAN_MODE, 1);
 #endif
-	cvmx_write_csr(uctl_shim_cfg_reg, val);
+	dwc3_octeon_writeq(uctl_shim_cfg_reg, val);
 }
 
-static void __init dwc3_octeon_phy_reset(u64 base)
+static void __init dwc3_octeon_phy_reset(void __iomem *base)
 {
 	u64 val;
-	u64 uctl_ctl_reg = base + USBDRD_UCTL_CTL;
+	void __iomem *uctl_ctl_reg = base + USBDRD_UCTL_CTL;
 
-	val = cvmx_read_csr(uctl_ctl_reg);
+	val = dwc3_octeon_readq(uctl_ctl_reg);
 	val &= ~USBDRD_UCTL_CTL_UPHY_RST;
-	cvmx_write_csr(uctl_ctl_reg, val);
+	dwc3_octeon_writeq(uctl_ctl_reg, val);
 }
 
 static int __init dwc3_octeon_device_init(void)
@@ -506,10 +525,10 @@ static int __init dwc3_octeon_device_init(void)
 			}
 
 			mutex_lock(&dwc3_octeon_clocks_mutex);
-			if (dwc3_octeon_clocks_start(&pdev->dev, (u64)base) == 0)
+			if (dwc3_octeon_clocks_start(&pdev->dev, base) == 0)
 				dev_info(&pdev->dev, "clocks initialized.\n");
-			dwc3_octeon_set_endian_mode((u64)base);
-			dwc3_octeon_phy_reset((u64)base);
+			dwc3_octeon_set_endian_mode(base);
+			dwc3_octeon_phy_reset(base);
 			mutex_unlock(&dwc3_octeon_clocks_mutex);
 			devm_iounmap(&pdev->dev, base);
 			devm_release_mem_region(&pdev->dev, res->start,
-- 
2.39.2

