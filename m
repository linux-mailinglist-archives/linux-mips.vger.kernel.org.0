Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A54D2D5B2F
	for <lists+linux-mips@lfdr.de>; Mon, 14 Oct 2019 08:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730071AbfJNGQT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Oct 2019 02:16:19 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59933 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730052AbfJNGQO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Oct 2019 02:16:14 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1iJte6-0006ew-Fw; Mon, 14 Oct 2019 08:15:54 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1iJte2-0000yb-LL; Mon, 14 Oct 2019 08:15:50 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Andrew Lunn <andrew@lunn.ch>, Chris Snook <chris.snook@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        James Hogan <jhogan@kernel.org>,
        Jay Cliburn <jcliburn@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Vivien Didelot <vivien.didelot@gmail.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH v1 3/4] MIPS: ath79: ar9331: add ar9331-switch node
Date:   Mon, 14 Oct 2019 08:15:48 +0200
Message-Id: <20191014061549.3669-4-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014061549.3669-1-o.rempel@pengutronix.de>
References: <20191014061549.3669-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add switch node supported by dsa ar9331 driver.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/mips/boot/dts/qca/ar9331.dtsi           | 128 ++++++++++++++++++-
 arch/mips/boot/dts/qca/ar9331_dpt_module.dts |  13 ++
 2 files changed, 140 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/qca/ar9331.dtsi b/arch/mips/boot/dts/qca/ar9331.dtsi
index e0f409dd6acf..abd597af7ead 100644
--- a/arch/mips/boot/dts/qca/ar9331.dtsi
+++ b/arch/mips/boot/dts/qca/ar9331.dtsi
@@ -158,6 +158,9 @@
 			clocks = <&pll ATH79_CLK_AHB>, <&pll ATH79_CLK_AHB>;
 			clock-names = "eth", "mdio";
 
+			phy-mode = "mii";
+			phy-handle = <&phy_port4>;
+
 			status = "disabled";
 		};
 
@@ -165,13 +168,136 @@
 			compatible = "qca,ar9330-eth";
 			reg = <0x1a000000 0x200>;
 			interrupts = <5>;
-
 			resets = <&rst 13>, <&rst 23>;
 			reset-names = "mac", "mdio";
 			clocks = <&pll ATH79_CLK_AHB>, <&pll ATH79_CLK_AHB>;
 			clock-names = "eth", "mdio";
 
+			phy-mode = "gmii";
+			phy-handle = <&switch_port0>;
+
 			status = "disabled";
+
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				switch10: switch@10 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compatible = "qca,ar9331-switch";
+					reg = <16>;
+					resets = <&rst 8>;
+					reset-names = "switch";
+
+					interrupt-parent = <&miscintc>;
+					interrupts = <12>;
+
+					interrupt-controller;
+					#interrupt-cells = <1>;
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						switch_port0: port@0 {
+							reg = <0>;
+							label = "cpu";
+							ethernet = <&eth1>;
+
+							phy-mode = "gmii";
+
+							fixed-link {
+								speed = <1000>;
+								full-duplex;
+							};
+						};
+
+						switch_port1: port@1 {
+							reg = <1>;
+							phy-handle = <&phy_port0>;
+							phy-mode = "internal";
+
+							status = "disabled";
+						};
+
+						switch_port2: port@2 {
+							reg = <2>;
+							phy-handle = <&phy_port1>;
+							phy-mode = "internal";
+
+							status = "disabled";
+						};
+
+						switch_port3: port@3 {
+							reg = <3>;
+							phy-handle = <&phy_port2>;
+							phy-mode = "internal";
+
+							status = "disabled";
+						};
+
+						switch_port4: port@4 {
+							reg = <4>;
+							phy-handle = <&phy_port3>;
+							phy-mode = "internal";
+
+							status = "disabled";
+						};
+
+						switch_port5: port@5 {
+							reg = <5>;
+							phy-handle = <&phy_port4>;
+							phy-mode = "internal";
+
+							status = "disabled";
+						};
+					};
+
+					mdio {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						interrupt-parent = <&switch10>;
+
+						phy_port0: phy@0 {
+							reg = <0>;
+							interrupts = <0>;
+							status = "disabled";
+						};
+
+						phy_port1: phy@1 {
+							reg = <1>;
+							interrupts = <0>;
+							status = "disabled";
+						};
+
+						phy_port2: phy@2 {
+							reg = <2>;
+							interrupts = <0>;
+							status = "disabled";
+						};
+
+						phy_port3: phy@3 {
+							reg = <3>;
+							interrupts = <0>;
+							status = "disabled";
+						};
+
+						phy_port4: phy@4 {
+							reg = <4>;
+							interrupts = <0>;
+							status = "disabled";
+						};
+					};
+				};
+			};
 		};
 
 		usb: usb@1b000100 {
diff --git a/arch/mips/boot/dts/qca/ar9331_dpt_module.dts b/arch/mips/boot/dts/qca/ar9331_dpt_module.dts
index 77bab823eb3b..0f2b20044834 100644
--- a/arch/mips/boot/dts/qca/ar9331_dpt_module.dts
+++ b/arch/mips/boot/dts/qca/ar9331_dpt_module.dts
@@ -84,3 +84,16 @@
 &eth1 {
 	status = "okay";
 };
+
+&switch_port1 {
+	label = "lan0";
+	status = "okay";
+};
+
+&phy_port0 {
+	status = "okay";
+};
+
+&phy_port4 {
+	status = "okay";
+};
-- 
2.23.0

