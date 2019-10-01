Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 873FBC40B3
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 21:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfJATJE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 15:09:04 -0400
Received: from srv1.deutnet.info ([116.203.153.70]:55176 "EHLO
        srv1.deutnet.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbfJATJD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Oct 2019 15:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deutnet.info; s=default; h=In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
         bh=LoUpqJudWyj9nM8kZMC0gqj41Fj/RyQbOaPaMoFSwFk=; b=HOr7OuN1Yo72w+QahtQQ8B44z
        5+mKbkTIGc/ZGBnLQyqC2gHbg8IYDt1qVgAiyEWc9R/kc/Cxg4PPawaqy4EpUZlzQMag+GuTSYrFU
        hyh7W8ODHr2NYfbJZgO4o9caK4p5Mm/z2wpK7rbtYf4Laaozdr9Xuggej9notaG9hHW+tpgiBoJyI
        IGSKrEaeFceo6Pa1fqyhQahlS+ukO+5uA1zMTHdXdanpiAPYXib/z/55RalWJ/1hIP7Ky+xGhZzM7
        ia837sgml2zHgEUjP0z8o3b/F0mZFNiroezuQ7Exz2rbSh36U1vBcyvY+wJgpCbbP1DsVdR/y+qAs
        ubH07Yv3w==;
Received: from [2001:bc8:3dc9::1] (helo=localhost)
        by srv1.deutnet.info with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1iFNW8-0000ot-Mi; Tue, 01 Oct 2019 21:09:00 +0200
Received: from agriveaux by localhost with local (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1iFNW8-00BgMV-B5; Tue, 01 Oct 2019 21:09:00 +0200
Date:   Tue, 1 Oct 2019 21:09:00 +0200
From:   Alexandre GRIVEAUX <agriveaux@deutnet.info>
To:     robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, agriveaux@deutnet.info
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/5] MIPS: CI20: DTS: Add I2C nodes
Message-ID: <ceeb8d3316809672697f735b927cac77b449c70f.1569955865.git.agriveaux@deutnet.info>
References: <cover.1569955865.git.agriveaux@deutnet.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1569955865.git.agriveaux@deutnet.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adding missing I2C nodes and some peripheral:
- PMU
- RTC

Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 147 ++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 2e9952311ecd..4a77fa30a9cd 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -87,6 +87,123 @@
 	pinctrl-0 = <&pins_uart4>;
 };
 
+&i2c0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_i2c0>;
+
+	clock-frequency = <400000>;
+
+	act8600: act8600@5a {
+		compatible = "active-semi,act8600";
+		reg = <0x5a>;
+		status = "okay";
+
+		regulators {
+			vddcore: SUDCDC1 {
+				regulator-name = "VDDCORE";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+			};
+			vddmem: SUDCDC2 {
+				regulator-name = "VDDMEM";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-always-on;
+			};
+			vcc_33: SUDCDC3 {
+				regulator-name = "VCC33";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+			vcc_50: SUDCDC4 {
+				regulator-name = "VCC50";
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5000000>;
+				regulator-always-on;
+			};
+			vcc_25: LDO_REG5 {
+				regulator-name = "VCC25";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+				regulator-always-on;
+			};
+			wifi_io: LDO_REG6 {
+				regulator-name = "WIFIIO";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+				regulator-always-on;
+			};
+			vcc_28: LDO_REG7 {
+				regulator-name = "VCC28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-always-on;
+			};
+			vcc_15: LDO_REG8 {
+				regulator-name = "VCC15";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-always-on;
+			};
+			vcc_18: LDO_REG9 {
+				regulator-name = "VCC18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+			vcc_11: LDO_REG10 {
+				regulator-name = "VCC11";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&i2c1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_i2c1>;
+
+};
+
+&i2c2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_i2c2>;
+
+};
+
+&i2c3 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_i2c3>;
+
+};
+
+&i2c4 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_i2c4>;
+
+	clock-frequency = <400000>;
+
+		rtc@51 {
+			compatible = "nxp,pcf8563";
+			reg = <0x51>;
+			interrupts = <110>;
+		};
+};
+
 &nemc {
 	status = "okay";
 
@@ -209,6 +326,36 @@
 		bias-disable;
 	};
 
+	pins_i2c0: i2c0 {
+		function = "i2c0";
+		groups = "i2c0-data";
+		bias-disable;
+	};
+
+	pins_i2c1: i2c1 {
+		function = "i2c1";
+		groups = "i2c1-data";
+		bias-disable;
+	};
+
+	pins_i2c2: i2c2 {
+		function = "i2c2";
+		groups = "i2c2-data";
+		bias-disable;
+	};
+
+	pins_i2c3: i2c3 {
+		function = "i2c3";
+		groups = "i2c3-data";
+		bias-disable;
+	};
+
+	pins_i2c4: i2c4 {
+		function = "i2c4";
+		groups = "i2c4-data-e";
+		bias-disable;
+	};
+
 	pins_nemc: nemc {
 		function = "nemc";
 		groups = "nemc-data", "nemc-cle-ale", "nemc-rd-we", "nemc-frd-fwe";
-- 
2.20.1

