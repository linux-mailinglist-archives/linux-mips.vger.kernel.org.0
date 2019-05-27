Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE382B126
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2019 11:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbfE0JNw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 May 2019 05:13:52 -0400
Received: from mx1.mailbox.org ([80.241.60.212]:55326 "EHLO mx1.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725973AbfE0JNw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 May 2019 05:13:52 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx1.mailbox.org (Postfix) with ESMTPS id 528A55045F;
        Mon, 27 May 2019 11:13:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173]) (amavisd-new, port 10030)
        with ESMTP id mFHm7l363T-v; Mon, 27 May 2019 11:13:24 +0200 (CEST)
From:   Stefan Roese <sr@denx.de>
To:     linux-mips@vger.kernel.org
Cc:     Paul Burton <paul.burton@mips.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>
Subject: [PATCH 2/8 v2] MIPS: ralink: mt7628a.dtsi: Add pinmux DT node
Date:   Mon, 27 May 2019 11:13:17 +0200
Message-Id: <20190527091323.4582-2-sr@denx.de>
In-Reply-To: <20190527091323.4582-1-sr@denx.de>
References: <20190527091323.4582-1-sr@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch adds the pinmux DT node using the generic "pinctrl-single"
pinmux driver. For this the system-controller register area needs to be
changed to not overlap with the pinmux registers.

This patch is based on work done by John Crispin.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Paul Burton <paul.burton@mips.com>
Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: John Crispin <john@phrozen.org>
---
v2:
- Use Harvey's new email address (not at imgtec)
- Use correct linux-mips list address

 arch/mips/boot/dts/ralink/mt7628a.dtsi | 95 +++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
index 3e88c8d496e4..d87f53bd6d72 100644
--- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
@@ -38,7 +38,100 @@
 
 		sysc: system-controller@0 {
 			compatible = "ralink,mt7620a-sysc", "syscon";
-			reg = <0x0 0x100>;
+			reg = <0x0 0x60>;
+		};
+
+		pinmux: pinmux@60 {
+			compatible = "pinctrl-single";
+			reg = <0x60 0x8>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#pinctrl-cells = <2>;
+			pinctrl-single,bit-per-mux;
+			pinctrl-single,register-width = <32>;
+			pinctrl-single,function-mask = <0x1>;
+
+			pinmux_gpio_gpio: pinmux_gpio_gpio {
+				pinctrl-single,bits = <0x0 0x0 0x3>;
+			};
+
+			pinmux_spi_cs1_cs: pinmux_spi_cs1_cs {
+				pinctrl-single,bits = <0x0 0x0 0x30>;
+			};
+
+			pinmux_i2s_gpio: pinmux_i2s_gpio {
+				pinctrl-single,bits = <0x0 0x40 0xc0>;
+			};
+
+			pinmux_uart0_uart: pinmux_uart0_uart0 {
+				pinctrl-single,bits = <0x0 0x0 0x300>;
+			};
+
+			pinmux_sdmode_sdxc: pinmux_sdmode_sdxc {
+				pinctrl-single,bits = <0x0 0x0 0xc00>;
+			};
+
+			pinmux_sdmode_gpio: pinmux_sdmode_gpio {
+				pinctrl-single,bits = <0x0 0x400 0xc00>;
+			};
+
+			pinmux_spi_spi: pinmux_spi_spi {
+				pinctrl-single,bits = <0x0 0x0 0x1000>;
+			};
+
+			pinmux_refclk_gpio: pinmux_refclk_gpio {
+				pinctrl-single,bits = <0x0 0x40000 0x40000>;
+			};
+
+			pinmux_i2c_i2c: pinmux_i2c_i2c {
+				pinctrl-single,bits = <0x0 0x0 0x300000>;
+			};
+
+			pinmux_uart1_uart: pinmux_uart1_uart1 {
+				pinctrl-single,bits = <0x0 0x0 0x3000000>;
+			};
+
+			pinmux_uart2_uart: pinmux_uart2_uart {
+				pinctrl-single,bits = <0x0 0x0 0xc000000>;
+			};
+
+			pinmux_pwm0_pwm: pinmux_pwm0_pwm {
+				pinctrl-single,bits = <0x0 0x0 0x30000000>;
+			};
+
+			pinmux_pwm0_gpio: pinmux_pwm0_gpio {
+				pinctrl-single,bits = <0x0 0x10000000
+						       0x30000000>;
+			};
+
+			pinmux_pwm1_pwm: pinmux_pwm1_pwm {
+				pinctrl-single,bits = <0x0 0x0 0xc0000000>;
+			};
+
+			pinmux_pwm1_gpio: pinmux_pwm1_gpio {
+				pinctrl-single,bits = <0x0 0x40000000
+						       0xc0000000>;
+			};
+
+			pinmux_p0led_an_gpio: pinmux_p0led_an_gpio {
+				pinctrl-single,bits = <0x4 0x4 0xc>;
+			};
+
+			pinmux_p1led_an_gpio: pinmux_p1led_an_gpio {
+				pinctrl-single,bits = <0x4 0x10 0x30>;
+			};
+
+			pinmux_p2led_an_gpio: pinmux_p2led_an_gpio {
+				pinctrl-single,bits = <0x4 0x40 0xc0>;
+			};
+
+			pinmux_p3led_an_gpio: pinmux_p3led_an_gpio {
+				pinctrl-single,bits = <0x4 0x100 0x300>;
+			};
+
+			pinmux_p4led_an_gpio: pinmux_p4led_an_gpio {
+				pinctrl-single,bits = <0x4 0x400 0xc00>;
+			};
 		};
 
 		intc: interrupt-controller@200 {
-- 
2.21.0

