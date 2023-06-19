Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3231E735E2F
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jun 2023 22:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjFSULZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jun 2023 16:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjFSULY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jun 2023 16:11:24 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7C313D
        for <linux-mips@vger.kernel.org>; Mon, 19 Jun 2023 13:11:23 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id BLDbqAqZEv5uIBLDcqiBGn; Mon, 19 Jun 2023 22:11:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205481; bh=3L8XUUElAukUJ5zvUpBIUvwYMZnIT3tvRsfA6+l1vsw=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=sjY46GMJJ9aBL1igxyo2GL1gAHMytf3AM6yXE2TiZ5HsU4YzE2CCpETvk+bbpAZM/
         DInQE+mrryfztnUfiOG5MZsza6mTWNDZZ+LmRwfwzzK5G+7Jc/N/O+6nuLdNiguPlb
         VBE26QNKwYGYev+zVD7o6XH3uEg/5wm0FckcwjFqBnyUwKRGWSYFGWJk3GqI/nEl/0
         IQOVFUPhYUrpx1vYtIxEa0U/75Xc/mPJF64lKpqoPI4IcjeuUGltLsSff+vSqmyarG
         yPBgIfsSRV2x5sG8849F4a02OGkl4VZYIPLinETjAowxpyQ+osPVSgUlpgZeTNKvpA
         pTxTGIfiX8I6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205481; bh=3L8XUUElAukUJ5zvUpBIUvwYMZnIT3tvRsfA6+l1vsw=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=sjY46GMJJ9aBL1igxyo2GL1gAHMytf3AM6yXE2TiZ5HsU4YzE2CCpETvk+bbpAZM/
         DInQE+mrryfztnUfiOG5MZsza6mTWNDZZ+LmRwfwzzK5G+7Jc/N/O+6nuLdNiguPlb
         VBE26QNKwYGYev+zVD7o6XH3uEg/5wm0FckcwjFqBnyUwKRGWSYFGWJk3GqI/nEl/0
         IQOVFUPhYUrpx1vYtIxEa0U/75Xc/mPJF64lKpqoPI4IcjeuUGltLsSff+vSqmyarG
         yPBgIfsSRV2x5sG8849F4a02OGkl4VZYIPLinETjAowxpyQ+osPVSgUlpgZeTNKvpA
         pTxTGIfiX8I6A==
Date:   Mon, 19 Jun 2023 22:11:19 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH 01/11] MIPS: OCTEON: octeon-usb: add all register offsets
Message-ID: <ZJC2ZzZy7XDG/4dS@lenoch>
References: <ZJC165p0Mj4jHcBh@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJC165p0Mj4jHcBh@lenoch>
X-CMAE-Envelope: MS4wfKk8v0+7ZgbvNuwIc8ABro7BZEnu3BHjxX6N5rGCmKRluPHTOntpr1uQq49VYVteWJbdFq40FUMS0P0Tna/NER5lHHIyOGlN1WND1+UwDOQOxjYcQGLu
 rkj9TGZzMQd9VnhDx3beZXifXWtTax1Fw3Ny7CtRkYk4UXF+oR4fqBJqf3B7k3POzLSBuY+lz5Xgu1OZcSBfG62yz9flOliVbJiDoGyKbk6Z3FeEzthHQyaE
 snVTeNZOVT1+UhSwMk3u9A==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

Glue code uses a mix of offset and absolute address register
definition. Define all of them as offsets and use them
consistently.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 arch/mips/cavium-octeon/octeon-usb.c | 35 +++++++++++++++++-----------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
index 28677c615175..4d22eaa8a644 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -17,6 +17,19 @@
 
 #include <asm/octeon/octeon.h>
 
+#define USBDRD_UCTL_CTL				0x00
+#define USBDRD_UCTL_BIST_STATUS			0x08
+#define USBDRD_UCTL_SPARE0			0x10
+#define USBDRD_UCTL_INTSTAT			0x30
+#define USBDRD_UCTL_PORT_CFG_HS(port)		(0x40 + (0x20 * port))
+#define USBDRD_UCTL_PORT_CFG_SS(port)		(0x48 + (0x20 * port))
+#define USBDRD_UCTL_PORT_CR_DBG_CFG(port)	(0x50 + (0x20 * port))
+#define USBDRD_UCTL_PORT_CR_DBG_STATUS(port)	(0x58 + (0x20 * port))
+#define USBDRD_UCTL_HOST_CFG			0xe0
+#define USBDRD_UCTL_SHIM_CFG			0xe8
+#define USBDRD_UCTL_ECC				0xf0
+#define USBDRD_UCTL_SPARE1			0xf8
+
 /* USB Control Register */
 union cvm_usbdrd_uctl_ctl {
 	uint64_t u64;
@@ -227,7 +240,6 @@ static uint8_t clk_div[OCTEON_H_CLKDIV_SEL] = {1, 2, 4, 6, 8, 16, 24, 32};
 
 static int dwc3_octeon_config_power(struct device *dev, u64 base)
 {
-#define UCTL_HOST_CFG	0xe0
 	union cvm_usbdrd_uctl_host_cfg uctl_host_cfg;
 	union cvmx_gpio_bit_cfgx gpio_bit;
 	uint32_t gpio_pwr[3];
@@ -268,16 +280,16 @@ static int dwc3_octeon_config_power(struct device *dev, u64 base)
 		}
 
 		/* Enable XHCI power control and set if active high or low. */
-		uctl_host_cfg.u64 = cvmx_read_csr(base + UCTL_HOST_CFG);
+		uctl_host_cfg.u64 = cvmx_read_csr(base + USBDRD_UCTL_HOST_CFG);
 		uctl_host_cfg.s.ppc_en = 1;
 		uctl_host_cfg.s.ppc_active_high_en = !power_active_low;
-		cvmx_write_csr(base + UCTL_HOST_CFG, uctl_host_cfg.u64);
+		cvmx_write_csr(base + USBDRD_UCTL_HOST_CFG, uctl_host_cfg.u64);
 	} else {
 		/* Disable XHCI power control and set if active high. */
-		uctl_host_cfg.u64 = cvmx_read_csr(base + UCTL_HOST_CFG);
+		uctl_host_cfg.u64 = cvmx_read_csr(base + USBDRD_UCTL_HOST_CFG);
 		uctl_host_cfg.s.ppc_en = 0;
 		uctl_host_cfg.s.ppc_active_high_en = 0;
-		cvmx_write_csr(base + UCTL_HOST_CFG, uctl_host_cfg.u64);
+		cvmx_write_csr(base + USBDRD_UCTL_HOST_CFG, uctl_host_cfg.u64);
 		dev_info(dev, "power control disabled\n");
 	}
 	return 0;
@@ -464,10 +476,9 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 
 static void __init dwc3_octeon_set_endian_mode(u64 base)
 {
-#define UCTL_SHIM_CFG	0xe8
 	union cvm_usbdrd_uctl_shim_cfg shim_cfg;
 
-	shim_cfg.u64 = cvmx_read_csr(base + UCTL_SHIM_CFG);
+	shim_cfg.u64 = cvmx_read_csr(base + USBDRD_UCTL_SHIM_CFG);
 #ifdef __BIG_ENDIAN
 	shim_cfg.s.dma_endian_mode = 1;
 	shim_cfg.s.csr_endian_mode = 1;
@@ -475,20 +486,16 @@ static void __init dwc3_octeon_set_endian_mode(u64 base)
 	shim_cfg.s.dma_endian_mode = 0;
 	shim_cfg.s.csr_endian_mode = 0;
 #endif
-	cvmx_write_csr(base + UCTL_SHIM_CFG, shim_cfg.u64);
+	cvmx_write_csr(base + USBDRD_UCTL_SHIM_CFG, shim_cfg.u64);
 }
 
-#define CVMX_USBDRDX_UCTL_CTL(index)				\
-		(CVMX_ADD_IO_SEG(0x0001180068000000ull) +	\
-		((index & 1) * 0x1000000ull))
 static void __init dwc3_octeon_phy_reset(u64 base)
 {
 	union cvm_usbdrd_uctl_ctl uctl_ctl;
-	int index = (base >> 24) & 1;
 
-	uctl_ctl.u64 = cvmx_read_csr(CVMX_USBDRDX_UCTL_CTL(index));
+	uctl_ctl.u64 = cvmx_read_csr(base + USBDRD_UCTL_CTL);
 	uctl_ctl.s.uphy_rst = 0;
-	cvmx_write_csr(CVMX_USBDRDX_UCTL_CTL(index), uctl_ctl.u64);
+	cvmx_write_csr(base + USBDRD_UCTL_CTL, uctl_ctl.u64);
 }
 
 static int __init dwc3_octeon_device_init(void)
-- 
2.39.2

