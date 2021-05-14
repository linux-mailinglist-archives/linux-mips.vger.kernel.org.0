Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9D5380333
	for <lists+linux-mips@lfdr.de>; Fri, 14 May 2021 07:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232318AbhENFTE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 May 2021 01:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232364AbhENFTC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 May 2021 01:19:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B4BC06175F
        for <linux-mips@vger.kernel.org>; Thu, 13 May 2021 22:17:51 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lhQCo-0003er-DQ; Fri, 14 May 2021 07:17:46 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lhQCm-0003zS-Vy; Fri, 14 May 2021 07:17:44 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v1 2/3] MIPS: ath79: ar9331: Add OpeneEmbed SOM9331 Board
Date:   Fri, 14 May 2021 07:17:42 +0200
Message-Id: <20210514051743.15248-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210514051743.15248-1-o.rempel@pengutronix.de>
References: <20210514051743.15248-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add SOM9331 based Board. It has 3 LAN ports, usb to uart controller and
USB type A port.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/mips/boot/dts/qca/Makefile               |   1 +
 .../qca/ar9331_openembed_som9331_board.dts    | 110 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dts

diff --git a/arch/mips/boot/dts/qca/Makefile b/arch/mips/boot/dts/qca/Makefile
index 4451cf45b0ad..6749f77068a8 100644
--- a/arch/mips/boot/dts/qca/Makefile
+++ b/arch/mips/boot/dts/qca/Makefile
@@ -4,4 +4,5 @@ dtb-$(CONFIG_ATH79)			+= ar9132_tl_wr1043nd_v1.dtb
 dtb-$(CONFIG_ATH79)			+= ar9331_dpt_module.dtb
 dtb-$(CONFIG_ATH79)			+= ar9331_dragino_ms14.dtb
 dtb-$(CONFIG_ATH79)			+= ar9331_omega.dtb
+dtb-$(CONFIG_ATH79)			+= ar9331_openembed_som9331_board.dtb
 dtb-$(CONFIG_ATH79)			+= ar9331_tl_mr3020.dtb
diff --git a/arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dts b/arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dts
new file mode 100644
index 000000000000..e6622f8e8c2b
--- /dev/null
+++ b/arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dts
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+#include "ar9331.dtsi"
+
+/ {
+	model = "OpenEmbed SOM9331 Board";
+	compatible = "openembed,som9331";
+
+	aliases {
+		serial0 = &uart;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x4000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		button@0 {
+			label = "reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpio 11 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&ref {
+	clock-frequency = <25000000>;
+};
+
+&uart {
+	status = "okay";
+};
+
+&gpio {
+	status = "okay";
+};
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb_phy {
+	status = "okay";
+};
+
+&spi {
+	num-chipselects = <1>;
+	status = "okay";
+
+	/* Winbond 25Q64FVSIG SPI flash */
+	spiflash: w25q64@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "winbond,w25q64", "jedec,spi-nor";
+		spi-max-frequency = <104000000>;
+		reg = <0>;
+	};
+};
+
+&eth0 {
+	status = "okay";
+};
+
+&eth1 {
+	status = "okay";
+};
+
+&switch_port1 {
+	label = "lan0";
+	status = "okay";
+};
+
+&switch_port3 {
+	label = "lan1";
+	status = "okay";
+};
+
+&phy_port0 {
+	status = "okay";
+};
+
+&phy_port2 {
+	status = "okay";
+};
+
+&phy_port4 {
+	status = "okay";
+};
-- 
2.29.2

