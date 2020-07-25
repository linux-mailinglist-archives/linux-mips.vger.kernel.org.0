Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA0D22D906
	for <lists+linux-mips@lfdr.de>; Sat, 25 Jul 2020 19:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgGYRnQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Jul 2020 13:43:16 -0400
Received: from crapouillou.net ([89.234.176.41]:36846 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726995AbgGYRnQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 25 Jul 2020 13:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1595698993; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=ltqw2GR77gneobFOKHAdqBVxbpmJ8lyAosN/a/eYu2M=;
        b=fGK05dKPUN+WsoIaWKOaVG9Vac01YU5IB8GDHtEjSJ5/EJGgwnf31Xp0tlgPh7e28SS2b0
        Px7FM1u03K+kfzu4I0631XjwAZg4AVNcCgUB9lT+ZUc6PW+HG4tEPBg3XJTrR0C+xFy6Qy
        4XJ8jAfVfQheZqcWYJdac/8I647nUPU=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        od@zcrc.me, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] MIPS: ingenic: JZ4725B: Add IPU node
Date:   Sat, 25 Jul 2020 19:43:07 +0200
Message-Id: <20200725174307.99327-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add a devicetree node for the Image Processing Unit (IPU) found in the
JZ4725B. Connect it with graph nodes to the LCD node. The LCD driver
will expect the IPU node to be accessed through graph port #8, as stated
in the bindings documentation.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    Binding documentation was merged in the DRM tree (drm-misc-next branch).
    See https://cgit.freedesktop.org/drm/drm-misc/plain/Documentation/devicetree/bindings/display/ingenic,ipu.yaml

 arch/mips/boot/dts/ingenic/jz4725b.dtsi | 30 +++++++++++++++++++++++++
 arch/mips/boot/dts/ingenic/rs90.dts     |  6 ++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4725b.dtsi b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
index 89402a15f049..a8fca560878d 100644
--- a/arch/mips/boot/dts/ingenic/jz4725b.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
@@ -314,6 +314,36 @@ lcd: lcd-controller@13050000 {
 
 		clocks = <&cgu JZ4725B_CLK_LCD>;
 		clock-names = "lcd_pclk";
+
+		lcd_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@8 {
+				reg = <8>;
+
+				ipu_output: endpoint {
+					remote-endpoint = <&ipu_input>;
+				};
+			};
+		};
+	};
+
+	ipu: ipu@13080000 {
+		compatible = "ingenic,jz4725b-ipu";
+		reg = <0x13080000 0x64>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <30>;
+
+		clocks = <&cgu JZ4725B_CLK_IPU>;
+		clock-names = "ipu";
+
+		port {
+			ipu_input: endpoint {
+				remote-endpoint = <&ipu_output>;
+			};
+		};
 	};
 
 	bch: ecc-controller@130d0000 {
diff --git a/arch/mips/boot/dts/ingenic/rs90.dts b/arch/mips/boot/dts/ingenic/rs90.dts
index 246f97efe5ef..4eb1edbfc155 100644
--- a/arch/mips/boot/dts/ingenic/rs90.dts
+++ b/arch/mips/boot/dts/ingenic/rs90.dts
@@ -302,8 +302,12 @@ &tcu {
 &lcd {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pins_lcd>;
+};
+
+&lcd_ports {
+	port@0 {
+		reg = <0>;
 
-	port {
 		panel_output: endpoint {
 			remote-endpoint = <&panel_input>;
 		};
-- 
2.27.0

