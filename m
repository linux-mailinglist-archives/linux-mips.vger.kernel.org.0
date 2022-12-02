Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89548640B2C
	for <lists+linux-mips@lfdr.de>; Fri,  2 Dec 2022 17:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233511AbiLBQuO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Dec 2022 11:50:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233497AbiLBQuG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Dec 2022 11:50:06 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F382DC869F
        for <linux-mips@vger.kernel.org>; Fri,  2 Dec 2022 08:50:01 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2d07:19c5:4d8b:89d9])
        by albert.telenet-ops.be with bizsmtp
        id rUpW2800B0ys3B706UpWC5; Fri, 02 Dec 2022 17:49:59 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p19E9-002K5x-6t; Fri, 02 Dec 2022 17:49:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p19E8-006WaN-BY; Fri, 02 Dec 2022 17:49:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        UNGLinuxDriver@microchip.com,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Subject: [PATCH 04/11] ARM: dts: nuvoton: Fix pca954x i2c-mux node names
Date:   Fri,  2 Dec 2022 17:49:19 +0100
Message-Id: <9b10ee878f8c54d9d26a92749108304d47f4dbbf.1669999298.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669999298.git.geert+renesas@glider.be>
References: <cover.1669999298.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

"make dtbs_check":

    arch/arm/boot/dts/nuvoton-npcm730-gbs.dtb: i2c-switch@71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
    ...

Fix this by renaming PCA954x nodes to "i2c-mux", to match the I2C bus
multiplexer/switch DT bindings and the Generic Names Recommendation in
the Devicetree Specification.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts        | 16 ++++++++--------
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts        |  2 +-
 arch/arm/boot/dts/nuvoton-npcm730-kudo.dts       |  8 ++++----
 .../boot/dts/nuvoton-npcm750-runbmc-olympus.dts  |  4 ++--
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
index 9e9eba8bad5e424a..9f64c85e1c206494 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
@@ -525,7 +525,7 @@ &i2c0 {
 	clock-frequency = <100000>;
 	status = "okay";
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -666,7 +666,7 @@ mb_fru@50 {
 		reg = <0x50>;
 	};
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -727,7 +727,7 @@ &i2c6 {
 	clock-frequency = <100000>;
 	status = "okay";
 
-	i2c-switch@73 {
+	i2c-mux@73 {
 		compatible = "nxp,pca9545";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -763,7 +763,7 @@ &i2c7 {
 	clock-frequency = <100000>;
 	status = "okay";
 
-	i2c-switch@72 {
+	i2c-mux@72 {
 		compatible = "nxp,pca9545";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -812,7 +812,7 @@ &i2c9 {
 	clock-frequency = <100000>;
 	status = "okay";
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -866,7 +866,7 @@ &i2c10 {
 	clock-frequency = <100000>;
 	status = "okay";
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9545";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -902,7 +902,7 @@ &i2c11 {
 	clock-frequency = <100000>;
 	status = "okay";
 
-	i2c-switch@76 {
+	i2c-mux@76 {
 		compatible = "nxp,pca9545";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -961,7 +961,7 @@ &i2c14 {
 	clock-frequency = <100000>;
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9545";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
index 2a394cc15284c55d..9b1cc7f4adf0909d 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
@@ -303,7 +303,7 @@ ucd90160@6b {
 &i2c15 {
 	status = "okay";
 
-	i2c-switch@75 {
+	i2c-mux@75 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
index f7b38bee039bcab5..58329adbd9186fd7 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
@@ -494,7 +494,7 @@ &adc {
 
 &i2c1 {
 	status = "okay";
-	i2c-switch@75 {
+	i2c-mux@75 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -573,7 +573,7 @@ lm75@5c {
 			};
 		};
 	};
-	i2c-switch@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -613,7 +613,7 @@ &i2c3 {
 
 &i2c4 {
 	status = "okay";
-	i2c-switch@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -684,7 +684,7 @@ ssif-bmc@10 {
 
 &i2c13 {
 	status = "okay";
-	i2c-switch@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
index 87359ab05db3ebab..209fa3400317bf19 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
@@ -208,7 +208,7 @@ &gmac0 {
 &i2c1 {
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -258,7 +258,7 @@ i2c_slot5: i2c-bus@6 {
 		};
 	};
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		reg = <0x71>;
 		#address-cells = <1>;
-- 
2.25.1

