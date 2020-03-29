Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 013DD196EBB
	for <lists+linux-mips@lfdr.de>; Sun, 29 Mar 2020 19:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgC2RgO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 Mar 2020 13:36:14 -0400
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.122]:25297 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728478AbgC2RgO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 29 Mar 2020 13:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585503369;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=I039DbbWJmbU19A6VUFjmteqqzf+SHEXviIex+72I2k=;
        b=p9/C7oLnqU7pXKvQiaKafDCTeyTcyvnwoTQsYwJnbHl8AHMM9fK4DP43kbC4QeRSaf
        Km22xtr+au3K28aRo0aobZ1nlklr7/50J4Sla8O3vEl/t6thMsb2TWnwdOqk/yAhZ2eN
        H2SOtnPWgL7cBp1pOxpUK/KzD7E3ROIBRB8w8ONki+fwNqUGWBXlBJ8zs8+PdVxVRS80
        //ZY+aqIKGfSui/Bc61LPCQyQ6gkhKJXicgkaY8rE1OjAPk35M6R9I8UCEIbssRt+bKM
        Enizh5yBhv0kwpcBpk433xv1nw99XnoAHBtHEqNRFDNui04jnm7jK9xWdOiUhCgHOvrz
        gXIQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDz2rsNxxv"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w2THa2BMG
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 29 Mar 2020 19:36:02 +0200 (CEST)
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
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        mips-creator-ci20-dev@googlegroups.com
Subject: [RFC v3 7/8] MIPS: DTS: CI20: add HDMI setup
Date:   Sun, 29 Mar 2020 19:35:53 +0200
Message-Id: <90644c5a90f3321fc1542aa016c9eb848191526e.1585503354.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585503354.git.hns@goldelico.com>
References: <cover.1585503354.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Boddie <paul@boddie.org.uk>

We need to hook up
* HDMI power regulator
* HDMI connector
* DDC pinmux
* HDMI and LCD endpoint connections

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 64 +++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index c340f947baa0..97e09382ebd7 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -62,6 +62,28 @@ eth0_power: fixedregulator@0 {
 		enable-active-high;
 	};
 
+	hdmi_power: fixedregulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "hdmi_power";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpa 25 GPIO_ACTIVE_LOW>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	hdmi_out: connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&dw_hdmi_out>;
+			};
+		};
+	};
+
 	wlan0_power: fixedregulator@1 {
 		compatible = "regulator-fixed";
 		regulator-name = "wlan0_power";
@@ -435,6 +457,12 @@ pins_i2c4: i2c4 {
 		bias-disable;
 	};
 
+	pins_hdmi_ddc: hdmi_ddc {
+		function = "hdmi-ddc";
+		groups = "hdmi-ddc";
+		bias-disable;
+	};
+
 	pins_nemc: nemc {
 		function = "nemc";
 		groups = "nemc-data", "nemc-cle-ale", "nemc-rd-we", "nemc-frd-fwe";
@@ -471,3 +499,39 @@ &tcu {
 	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>;
 	assigned-clock-rates = <3000000>, <3000000>;
 };
+
+&hdmi {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_hdmi_ddc>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dw_hdmi_in: endpoint {
+				remote-endpoint = <&lcd_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dw_hdmi_out: endpoint {
+				remote-endpoint = <&hdmi_con>;
+			};
+		};
+	};
+};
+
+&lcdc0 {
+	status = "okay";
+
+	port {
+		lcd_out: endpoint {
+			remote-endpoint = <&dw_hdmi_in>;
+		};
+	};
+};
-- 
2.25.1

