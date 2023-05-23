Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF9370D475
	for <lists+linux-mips@lfdr.de>; Tue, 23 May 2023 09:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235290AbjEWHAi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 May 2023 03:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235306AbjEWHAX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 May 2023 03:00:23 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0DB4CE62;
        Tue, 23 May 2023 00:00:10 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0CC4980B5;
        Tue, 23 May 2023 07:00:07 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] mips: dts: ralink: mt7628a: Unify pinctrl-single pin group nodes
Date:   Tue, 23 May 2023 09:59:58 +0300
Message-Id: <20230523065959.15831-1-tony@atomide.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We want to unify the pinctrl-single pin group nodes to use naming "pins".
Otherwise non-standad pin group names will add make dtbs checks errors
when the pinctrl-single yaml binding gets merged.

Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/mips/boot/dts/ralink/mt7628a.dtsi | 40 +++++++++++++-------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
--- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
@@ -51,85 +51,85 @@ pinmux: pinmux@60 {
 			pinctrl-single,register-width = <32>;
 			pinctrl-single,function-mask = <0x1>;
 
-			pinmux_gpio_gpio: pinmux_gpio_gpio {
+			pinmux_gpio_gpio: gpio-gpio-pins {
 				pinctrl-single,bits = <0x0 0x0 0x3>;
 			};
 
-			pinmux_spi_cs1_cs: pinmux_spi_cs1_cs {
+			pinmux_spi_cs1_cs: spi-cs1-cs-pins {
 				pinctrl-single,bits = <0x0 0x0 0x30>;
 			};
 
-			pinmux_i2s_gpio: pinmux_i2s_gpio {
+			pinmux_i2s_gpio: i2s-gpio-pins {
 				pinctrl-single,bits = <0x0 0x40 0xc0>;
 			};
 
-			pinmux_uart0_uart: pinmux_uart0_uart0 {
+			pinmux_uart0_uart: uart0-uart0-pins {
 				pinctrl-single,bits = <0x0 0x0 0x300>;
 			};
 
-			pinmux_sdmode_sdxc: pinmux_sdmode_sdxc {
+			pinmux_sdmode_sdxc: sdmode-sdxc-pins {
 				pinctrl-single,bits = <0x0 0x0 0xc00>;
 			};
 
-			pinmux_sdmode_gpio: pinmux_sdmode_gpio {
+			pinmux_sdmode_gpio: sdmode-gpio-pins {
 				pinctrl-single,bits = <0x0 0x400 0xc00>;
 			};
 
-			pinmux_spi_spi: pinmux_spi_spi {
+			pinmux_spi_spi: spi-spi-pins {
 				pinctrl-single,bits = <0x0 0x0 0x1000>;
 			};
 
-			pinmux_refclk_gpio: pinmux_refclk_gpio {
+			pinmux_refclk_gpio: refclk-gpio-pins {
 				pinctrl-single,bits = <0x0 0x40000 0x40000>;
 			};
 
-			pinmux_i2c_i2c: pinmux_i2c_i2c {
+			pinmux_i2c_i2c: i2c-i2c-pins {
 				pinctrl-single,bits = <0x0 0x0 0x300000>;
 			};
 
-			pinmux_uart1_uart: pinmux_uart1_uart1 {
+			pinmux_uart1_uart: uart1-uart1-pins {
 				pinctrl-single,bits = <0x0 0x0 0x3000000>;
 			};
 
-			pinmux_uart2_uart: pinmux_uart2_uart {
+			pinmux_uart2_uart: uart2-uart-pins {
 				pinctrl-single,bits = <0x0 0x0 0xc000000>;
 			};
 
-			pinmux_pwm0_pwm: pinmux_pwm0_pwm {
+			pinmux_pwm0_pwm: pwm0-pwm-pins {
 				pinctrl-single,bits = <0x0 0x0 0x30000000>;
 			};
 
-			pinmux_pwm0_gpio: pinmux_pwm0_gpio {
+			pinmux_pwm0_gpio: pwm0-gpio-pins {
 				pinctrl-single,bits = <0x0 0x10000000
 						       0x30000000>;
 			};
 
-			pinmux_pwm1_pwm: pinmux_pwm1_pwm {
+			pinmux_pwm1_pwm: pwm1-pwm-pins {
 				pinctrl-single,bits = <0x0 0x0 0xc0000000>;
 			};
 
-			pinmux_pwm1_gpio: pinmux_pwm1_gpio {
+			pinmux_pwm1_gpio: pwm1-gpio-pins {
 				pinctrl-single,bits = <0x0 0x40000000
 						       0xc0000000>;
 			};
 
-			pinmux_p0led_an_gpio: pinmux_p0led_an_gpio {
+			pinmux_p0led_an_gpio: p0led-an-gpio-pins {
 				pinctrl-single,bits = <0x4 0x4 0xc>;
 			};
 
-			pinmux_p1led_an_gpio: pinmux_p1led_an_gpio {
+			pinmux_p1led_an_gpio: p1led-an-gpio-pins {
 				pinctrl-single,bits = <0x4 0x10 0x30>;
 			};
 
-			pinmux_p2led_an_gpio: pinmux_p2led_an_gpio {
+			pinmux_p2led_an_gpio: p2led-an-gpio-pins {
 				pinctrl-single,bits = <0x4 0x40 0xc0>;
 			};
 
-			pinmux_p3led_an_gpio: pinmux_p3led_an_gpio {
+			pinmux_p3led_an_gpio: p3led-an-gpio-pins {
 				pinctrl-single,bits = <0x4 0x100 0x300>;
 			};
 
-			pinmux_p4led_an_gpio: pinmux_p4led_an_gpio {
+			pinmux_p4led_an_gpio: p4led-an-gpio-pins {
 				pinctrl-single,bits = <0x4 0x400 0xc00>;
 			};
 		};
-- 
2.40.1
