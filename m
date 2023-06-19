Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCB07735E39
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jun 2023 22:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbjFSUNT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jun 2023 16:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjFSUNS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jun 2023 16:13:18 -0400
Received: from h3.cmg1.smtp.forpsi.com (h3.cmg1.smtp.forpsi.com [185.129.138.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8AE130
        for <linux-mips@vger.kernel.org>; Mon, 19 Jun 2023 13:13:17 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id BLFTq51krPm6CBLFUqL76A; Mon, 19 Jun 2023 22:13:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205597; bh=La5RVvh62/rh2LKqh8/r8tTls0RHx4TgLGa6q6WIl7g=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=nxN1eeaOBMm4vLOJm4c4W+M4x5AuV5Ol4VWv5QGpQOBBC+GCFP+Y3yFUvOyLN7tyT
         rszT/0xKpEdfMscDXpVUsh3PzETBiuHPTqX4f5hT/L09az0XSN26NRNWMw7GfGtR+R
         VD/ZvpalDUmxGOAKrg9xX/H/c2FXUI/SXb3TatnAS5c2E7xvYSLe3lex2CwmWvNz8H
         BmonnCBsBVX01I2J6tBPoA27W0q3lqZi84NmB6jf8ZOTOxz6ywYDNN93yh/VUoNvI7
         qW4gCzUvVMYTwpRWAH6oHjkCA0Aq8zfoaXcDhY6vl2LcG+0DFcMbu5QcBtu8t4Hyea
         SotDa+3/rWj8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205597; bh=La5RVvh62/rh2LKqh8/r8tTls0RHx4TgLGa6q6WIl7g=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=nxN1eeaOBMm4vLOJm4c4W+M4x5AuV5Ol4VWv5QGpQOBBC+GCFP+Y3yFUvOyLN7tyT
         rszT/0xKpEdfMscDXpVUsh3PzETBiuHPTqX4f5hT/L09az0XSN26NRNWMw7GfGtR+R
         VD/ZvpalDUmxGOAKrg9xX/H/c2FXUI/SXb3TatnAS5c2E7xvYSLe3lex2CwmWvNz8H
         BmonnCBsBVX01I2J6tBPoA27W0q3lqZi84NmB6jf8ZOTOxz6ywYDNN93yh/VUoNvI7
         qW4gCzUvVMYTwpRWAH6oHjkCA0Aq8zfoaXcDhY6vl2LcG+0DFcMbu5QcBtu8t4Hyea
         SotDa+3/rWj8g==
Date:   Mon, 19 Jun 2023 22:13:14 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH 05/11] MIPS: OCTEON: octeon-usb: move gpio config to separate
 function
Message-ID: <ZJC22uFYvtc1mqRU@lenoch>
References: <ZJC165p0Mj4jHcBh@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJC165p0Mj4jHcBh@lenoch>
X-CMAE-Envelope: MS4wfHEMptSr/xQTLVSvx4YLnxQfTwq4AfmkXmluBzlj5HV4LagHlBTN9ng0H6DBzlQp2RhZcI1cjmienFcjYKVEg90aioEz6UlVOIZZjPy4gyEj/pEZ9YZ4
 60P5Lubzc99dYKfU3wdRJaaPZKKWhsI/KlhZ1IsaqaJCUfwJxB0EXRkubKNTLwVZTV9MiEP3DBx5N70Pd9lhqEnIF28EehrCa/543n6PkA+oJsfSKDOpyRp8
 hJr0U6glvZ4uP6/VwVk+Xw==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Power gpio configuration is using Octeon specific code, so
move it to separate function, that can later be guarded
with ifdefs.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 arch/mips/cavium-octeon/octeon-usb.c | 45 +++++++++++++++-------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
index 1c48ee77125a..0f9800b3d373 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -197,13 +197,35 @@ static DEFINE_MUTEX(dwc3_octeon_clocks_mutex);
 static uint8_t clk_div[OCTEON_H_CLKDIV_SEL] = {1, 2, 4, 6, 8, 16, 24, 32};
 
 
-static int dwc3_octeon_config_power(struct device *dev, u64 base)
+static void dwc3_octeon_config_gpio(int index, int gpio)
 {
 	union cvmx_gpio_bit_cfgx gpio_bit;
+
+	if ((OCTEON_IS_MODEL(OCTEON_CN73XX) ||
+	    OCTEON_IS_MODEL(OCTEON_CNF75XX))
+	    && gpio <= 31) {
+		gpio_bit.u64 = cvmx_read_csr(CVMX_GPIO_BIT_CFGX(gpio));
+		gpio_bit.s.tx_oe = 1;
+		gpio_bit.s.output_sel = (index == 0 ? 0x14 : 0x15);
+		cvmx_write_csr(CVMX_GPIO_BIT_CFGX(gpio), gpio_bit.u64);
+	} else if (gpio <= 15) {
+		gpio_bit.u64 = cvmx_read_csr(CVMX_GPIO_BIT_CFGX(gpio));
+		gpio_bit.s.tx_oe = 1;
+		gpio_bit.s.output_sel = (index == 0 ? 0x14 : 0x19);
+		cvmx_write_csr(CVMX_GPIO_BIT_CFGX(gpio), gpio_bit.u64);
+	} else {
+		gpio_bit.u64 = cvmx_read_csr(CVMX_GPIO_XBIT_CFGX(gpio));
+		gpio_bit.s.tx_oe = 1;
+		gpio_bit.s.output_sel = (index == 0 ? 0x14 : 0x19);
+		cvmx_write_csr(CVMX_GPIO_XBIT_CFGX(gpio), gpio_bit.u64);
+	}
+}
+
+static int dwc3_octeon_config_power(struct device *dev, u64 base)
+{
 	uint32_t gpio_pwr[3];
 	int gpio, len, power_active_low;
 	struct device_node *node = dev->of_node;
-	int index = (base >> 24) & 1;
 	u64 val;
 	u64 uctl_host_cfg_reg = base + USBDRD_UCTL_HOST_CFG;
 
@@ -220,24 +242,7 @@ static int dwc3_octeon_config_power(struct device *dev, u64 base)
 			dev_err(dev, "invalid power configuration\n");
 			return -EINVAL;
 		}
-		if ((OCTEON_IS_MODEL(OCTEON_CN73XX) ||
-		    OCTEON_IS_MODEL(OCTEON_CNF75XX))
-		    && gpio <= 31) {
-			gpio_bit.u64 = cvmx_read_csr(CVMX_GPIO_BIT_CFGX(gpio));
-			gpio_bit.s.tx_oe = 1;
-			gpio_bit.s.output_sel = (index == 0 ? 0x14 : 0x15);
-			cvmx_write_csr(CVMX_GPIO_BIT_CFGX(gpio), gpio_bit.u64);
-		} else if (gpio <= 15) {
-			gpio_bit.u64 = cvmx_read_csr(CVMX_GPIO_BIT_CFGX(gpio));
-			gpio_bit.s.tx_oe = 1;
-			gpio_bit.s.output_sel = (index == 0 ? 0x14 : 0x19);
-			cvmx_write_csr(CVMX_GPIO_BIT_CFGX(gpio), gpio_bit.u64);
-		} else {
-			gpio_bit.u64 = cvmx_read_csr(CVMX_GPIO_XBIT_CFGX(gpio));
-			gpio_bit.s.tx_oe = 1;
-			gpio_bit.s.output_sel = (index == 0 ? 0x14 : 0x19);
-			cvmx_write_csr(CVMX_GPIO_XBIT_CFGX(gpio), gpio_bit.u64);
-		}
+		dwc3_octeon_config_gpio((base >> 24) & 1, gpio);
 
 		/* Enable XHCI power control and set if active high or low. */
 		val = cvmx_read_csr(uctl_host_cfg_reg);
-- 
2.39.2

