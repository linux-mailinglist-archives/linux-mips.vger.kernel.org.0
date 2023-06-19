Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0428E735E33
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jun 2023 22:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbjFSUMS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jun 2023 16:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjFSUMR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jun 2023 16:12:17 -0400
Received: from h3.cmg1.smtp.forpsi.com (h3.cmg1.smtp.forpsi.com [185.129.138.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C12F6E68
        for <linux-mips@vger.kernel.org>; Mon, 19 Jun 2023 13:12:13 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id BLEQq51TSPm6CBLESqL6zD; Mon, 19 Jun 2023 22:12:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205532; bh=5ANEcQq0rsjguuLgM80u50gslNI6pWw0/tkjtsmRLGM=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=iFiXn9cJtUIFKouaxwHWHbWoFOrO37QB43xmqqmI9S14yrLNvOcV/w9sPlAyFZZh7
         +RMrnGKLNnbR1XhD+hj4horMotuVcEOkfsBWraycyj6/K8hnwVhjfPXcVtEAs2NIjI
         ugA1c7B6ARHaXSK9ZiUJL91GHqAg0PGaNmiTy5wKgbhIBHQBRSXSyIPALGzDPG1+Ex
         Iz8jc6Fqo0ok2ItYKz4JqEg4b7CnlZ+HPW4QDCa5rhYVNOTBkojtuZe7sDSu9RNhvY
         SPmi6yLmWeUxcOOZ87hW7KdMMmToJbK7k7Ev7NcWfbgJm7dHuuSeUe+/x34Dfpi9JR
         N/AGn1pI3GglQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205532; bh=5ANEcQq0rsjguuLgM80u50gslNI6pWw0/tkjtsmRLGM=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=iFiXn9cJtUIFKouaxwHWHbWoFOrO37QB43xmqqmI9S14yrLNvOcV/w9sPlAyFZZh7
         +RMrnGKLNnbR1XhD+hj4horMotuVcEOkfsBWraycyj6/K8hnwVhjfPXcVtEAs2NIjI
         ugA1c7B6ARHaXSK9ZiUJL91GHqAg0PGaNmiTy5wKgbhIBHQBRSXSyIPALGzDPG1+Ex
         Iz8jc6Fqo0ok2ItYKz4JqEg4b7CnlZ+HPW4QDCa5rhYVNOTBkojtuZe7sDSu9RNhvY
         SPmi6yLmWeUxcOOZ87hW7KdMMmToJbK7k7Ev7NcWfbgJm7dHuuSeUe+/x34Dfpi9JR
         N/AGn1pI3GglQ==
Date:   Mon, 19 Jun 2023 22:12:10 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH 03/11] MIPS: OCTEON: octeon-usb: use bitfields for host
 config register
Message-ID: <ZJC2msrOeXRDN5bK@lenoch>
References: <ZJC165p0Mj4jHcBh@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJC165p0Mj4jHcBh@lenoch>
X-CMAE-Envelope: MS4wfIOkLxTZTF1ppV4iRn78iHlJuJT8Z6t65ryY8TxRiK+tUak6y/ThvNe4oSoGyIoslGZXGBfNyGkI+YLi2bXIhw5CI3SouQXOjC+RoFSm1t500qYVho4h
 aavfPimB0sbpOsIl/n1w9JG7dztFuf/BdD5b5vHUUfZdacNpHCxlvmvj6kSiFfIOKpc/uKeYiFzg+7Td16TwQgg9Eu/kd8pKI/WsUIZbx2XQSQNXAxVb/+cM
 4p4xWvvPpe3MhRT4AfiUOQ==
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

Use Linux standard bitfield access macros to manipulate
host config register.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 arch/mips/cavium-octeon/octeon-usb.c | 83 +++++++++++++---------------
 1 file changed, 38 insertions(+), 45 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
index e8e57d0c3b14..17051aee491d 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -126,47 +126,36 @@
 #define USBDRD_UCTL_PORT_CFG_SS(port)		(0x48 + (0x20 * port))
 #define USBDRD_UCTL_PORT_CR_DBG_CFG(port)	(0x50 + (0x20 * port))
 #define USBDRD_UCTL_PORT_CR_DBG_STATUS(port)	(0x58 + (0x20 * port))
+
+/*
+ * UCTL Configuration Register
+ */
 #define USBDRD_UCTL_HOST_CFG			0xe0
+/* Indicates minimum value of all received BELT values */
+# define USBDRD_UCTL_HOST_CFG_HOST_CURRENT_BELT	GENMASK(59, 48)
+/* HS jitter adjustment */
+# define USBDRD_UCTL_HOST_CFG_FLA		GENMASK(37, 32)
+/* Bus-master enable: 0x0 = Disabled (stall DMAs), 0x1 = enabled */
+# define USBDRD_UCTL_HOST_CFG_BME		BIT(28)
+/* Overcurrent protection enable: 0x0 = unavailable, 0x1 = available */
+# define USBDRD_UCTL_HOST_OCI_EN		BIT(27)
+/* Overcurrent sene selection:
+ *	0x0 = Overcurrent indication from off-chip is active-low
+ *	0x1 = Overcurrent indication from off-chip is active-high
+ */
+# define USBDRD_UCTL_HOST_OCI_ACTIVE_HIGH_EN	BIT(26)
+/* Port power control enable: 0x0 = unavailable, 0x1 = available */
+# define USBDRD_UCTL_HOST_PPC_EN		BIT(25)
+/* Port power control sense selection:
+ *	0x0 = Port power to off-chip is active-low
+ *	0x1 = Port power to off-chip is active-high
+ */
+# define USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN	BIT(24)
+
 #define USBDRD_UCTL_SHIM_CFG			0xe8
 #define USBDRD_UCTL_ECC				0xf0
 #define USBDRD_UCTL_SPARE1			0xf8
 
-/* UAHC Configuration Register */
-union cvm_usbdrd_uctl_host_cfg {
-	uint64_t u64;
-	struct cvm_usbdrd_uctl_host_cfg_s {
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_60_63:4,
-	/* Indicates minimum value of all received BELT values */
-	__BITFIELD_FIELD(uint64_t host_current_belt:12,
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_38_47:10,
-	/* HS jitter adjustment */
-	__BITFIELD_FIELD(uint64_t fla:6,
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_29_31:3,
-	/* Bus-master enable: 0x0 = Disabled (stall DMAs), 0x1 = enabled */
-	__BITFIELD_FIELD(uint64_t bme:1,
-	/* Overcurrent protection enable: 0x0 = unavailable, 0x1 = available */
-	__BITFIELD_FIELD(uint64_t oci_en:1,
-	/* Overcurrent sene selection:
-	 *	0x0 = Overcurrent indication from off-chip is active-low
-	 *	0x1 = Overcurrent indication from off-chip is active-high
-	 */
-	__BITFIELD_FIELD(uint64_t oci_active_high_en:1,
-	/* Port power control enable: 0x0 = unavailable, 0x1 = available */
-	__BITFIELD_FIELD(uint64_t ppc_en:1,
-	/* Port power control sense selection:
-	 *	0x0 = Port power to off-chip is active-low
-	 *	0x1 = Port power to off-chip is active-high
-	 */
-	__BITFIELD_FIELD(uint64_t ppc_active_high_en:1,
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_0_23:24,
-	;)))))))))))
-	} s;
-};
-
 /* UCTL Shim Features Register */
 union cvm_usbdrd_uctl_shim_cfg {
 	uint64_t u64;
@@ -224,12 +213,13 @@ static uint8_t clk_div[OCTEON_H_CLKDIV_SEL] = {1, 2, 4, 6, 8, 16, 24, 32};
 
 static int dwc3_octeon_config_power(struct device *dev, u64 base)
 {
-	union cvm_usbdrd_uctl_host_cfg uctl_host_cfg;
 	union cvmx_gpio_bit_cfgx gpio_bit;
 	uint32_t gpio_pwr[3];
 	int gpio, len, power_active_low;
 	struct device_node *node = dev->of_node;
 	int index = (base >> 24) & 1;
+	u64 val;
+	u64 uctl_host_cfg_reg = base + USBDRD_UCTL_HOST_CFG;
 
 	if (of_find_property(node, "power", &len) != NULL) {
 		if (len == 12) {
@@ -264,16 +254,19 @@ static int dwc3_octeon_config_power(struct device *dev, u64 base)
 		}
 
 		/* Enable XHCI power control and set if active high or low. */
-		uctl_host_cfg.u64 = cvmx_read_csr(base + USBDRD_UCTL_HOST_CFG);
-		uctl_host_cfg.s.ppc_en = 1;
-		uctl_host_cfg.s.ppc_active_high_en = !power_active_low;
-		cvmx_write_csr(base + USBDRD_UCTL_HOST_CFG, uctl_host_cfg.u64);
+		val = cvmx_read_csr(uctl_host_cfg_reg);
+		val |= USBDRD_UCTL_HOST_PPC_EN;
+		if (power_active_low)
+			val &= ~USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
+		else
+			val |= USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
+		cvmx_write_csr(uctl_host_cfg_reg, val);
 	} else {
 		/* Disable XHCI power control and set if active high. */
-		uctl_host_cfg.u64 = cvmx_read_csr(base + USBDRD_UCTL_HOST_CFG);
-		uctl_host_cfg.s.ppc_en = 0;
-		uctl_host_cfg.s.ppc_active_high_en = 0;
-		cvmx_write_csr(base + USBDRD_UCTL_HOST_CFG, uctl_host_cfg.u64);
+		val = cvmx_read_csr(uctl_host_cfg_reg);
+		val &= ~USBDRD_UCTL_HOST_PPC_EN;
+		val &= ~USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
+		cvmx_write_csr(uctl_host_cfg_reg, val);
 		dev_info(dev, "power control disabled\n");
 	}
 	return 0;
-- 
2.39.2

