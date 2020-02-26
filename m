Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23B171708A6
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2020 20:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbgBZTNU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Feb 2020 14:13:20 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:35283 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727497AbgBZTNU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Feb 2020 14:13:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582744398;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=rmAyGFH2w0GQdDqcolLuvQb3bXwl+Mlnr1aULm9Zmtc=;
        b=biKRRS3dxnZ2gWZXq4Wxhu/ZGWhZfJ4x/idUbOGxce+LpsqYgTgCSQHMgx8oooURKq
        E7RyH/mhiK2JKm3D2IojrPC7sR9kUwTr9FsE/bhxVrt10/81+J6QllCpH+uUItWWIsUY
        g2c9KJ22QfL85zEQOdkygmnTqBweniAA/2ZEOW6AvVWJduXkWt/4vkn3rhMzWLKv6e/y
        ooX+zK4po6kkcBerVLJls6fTxjxh180xECz0IETkvpRL6f4adD3d49oqz3HuxeQj7lXx
        reHNW5OZ057sRrHsU0ayK7eVbA25kVD7uEkWT+6fB8qxA70k5lbB8tzGjF7/IhoxJ+21
        AZTA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAzoz/Oc2x"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1QJD16bK
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 26 Feb 2020 20:13:01 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com,
        Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [RFC 1/8] dt-bindings: video: Add jz4780-lcd binding
Date:   Wed, 26 Feb 2020 20:12:53 +0100
Message-Id: <d7dd7c52a9f6cb4e31bce69bb6879e46bfba530c.1582744379.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582744379.git.hns@goldelico.com>
References: <cover.1582744379.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

Add DT bindings for the LCD controller on the jz4780 SoC

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 .../bindings/display/ingenic-jz4780-lcd.txt   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt

diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt
new file mode 100644
index 000000000000..8512ce3f93df
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt
@@ -0,0 +1,39 @@
+Bindings for Ingenic JZ4780 LCD Controller
+
+LCD Controller is the Display Controller for the Ingenic JZ4780 SoC
+
+Required properties:
+- compatible: should be "ingenic,jz4780-lcd"
+- reg: Should contain the address & size of the LCD controller registers.
+- interrupts: Should specify the interrupt provided by parent.
+- clocks: Should contain two clock specifiers for the JZ4780_CLK_TVE JZ4780_CLK_LCD0PIXCLK.
+- clock-names : Must be "lcd_clk", "lcd_pixclk";
+- port: A port node with endpoint definitions as defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Optional properties:
+- interrupt-parent: phandle to parent interrupt controller
+
+Example:
+
+lcd: jz4780-lcdk@0x13050000 {
+	compatible = "ingenic,jz4780-lcd";
+	reg = <0x13050000 0x1800>;
+
+	clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
+	clock-names = "lcd_clk", "lcd_pixclk";
+
+	interrupt-parent = <&intc>;
+	interrupts = <31>;
+
+	jz4780_lcd_out: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			jz4780_out_hdmi: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&hdmi_in_lcd>;
+			};
+		};
+
+};
-- 
2.23.0

