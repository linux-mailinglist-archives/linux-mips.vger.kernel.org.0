Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6589D284144
	for <lists+linux-mips@lfdr.de>; Mon,  5 Oct 2020 22:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729838AbgJEUg3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Oct 2020 16:36:29 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:51353 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729313AbgJEUgT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Oct 2020 16:36:19 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Md6AP-1kxlZ32Jsp-00aH1b; Mon, 05 Oct 2020 22:35:46 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kPXCx-0004Vb-Sq; Mon, 05 Oct 2020 22:35:44 +0200
Received: (nullmailer pid 10367 invoked by uid 2001);
        Mon, 05 Oct 2020 20:35:39 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Russell King <linux@armlinux.org.uk>
Subject: [PATCH v7 08/12] ARM: dts: imx: Fix schema warnings for pwm-leds
Date:   Mon,  5 Oct 2020 22:34:47 +0200
Message-Id: <20201005203451.9985-9-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 68681318e863c9f5270c704b7be598c0
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:lWn/Muqkqh4PPb1qlIzjSTvDw1aTRx7hjYe/2nooxhQ/hIT1n06
 kdYYros5syyoKmfYgkwMvoyStyjCTqgrQNKE0tQpi1NlqX4bCwN8glJUUmKX/FvR9a1CG07
 m0Ikhogvv0C4eK98r+nJ5dvcEOWSKt50vAaxIyznza7kqWKhBEvuXIW+AwDshdD+5vAVRMC
 gr0fKbKzGUfSO9WV/CedA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q5iI14eylOg=:UvTYIYQig8trsx5KyLUhMc
 z5VOu5BFYQTkckWR1rCDxGi1B39SaYDfKVZOT71HwLJd9CNg3WkN8BA2cY3tBnSYig+3MXSa7
 YQfY8R9pYVnpD3JLjAzqbahwLZpWUx5+Guo6sz+R6yXUGCQI9aZsvFIIFxEzJo7rPkIk3Zzvv
 /XSTT2c+rYAmQoj6DWazJEcuZvzCv4atkQHyd4mpiSofsIYdTrTrOqZ7HnmtPEHwcqK9DrYXS
 0y0B25+xTRmYsR3PrIVSiDFns+8ky28WUzAQKPH+sslbk0f4epAI33KLhbwNArOfVUUSJVCW0
 p89rocq16MPmP2VC10vfr2PfHtl3cucdKX6nzmGKXqm/Zf8BMjzP7hoN0XzA93jAp7jC+ZmTS
 N/5T62WUWVPYKtX5vC5WqiEQbBJM2IgyyIRq9cRV34/Gc2tKNfJrjOU349A+ikpwyu0tsgkWJ
 BvYPD2zPLHEDQmmTQHuuRh3dpXiMDggqrNWlGwYq3z/EO2mKfEjKTm8ySHdQjQYZo8UbGhH4R
 ICRG+k4HRDLkQetcr0WZfhp4KmcTRSsibJqPCWosIOeWu5AyyLHymXE7wLP9s7eJTuqfaB/lt
 PWUk2S2qi3RztwuJZBo8ykF1DTY60G+E3jfAKx+DFbuDAefEm6sffclPSISGb6ykab/rOipCi
 ev9H86atvLoVFslwP80qGZLWfHW3QJWRdOaBMJD+ZwHwcjMZ6spOv6llleYrncMGxBRxgv227
 3BazHS2RQgDiC3AcnulVeGv982eHNj1j904MSba87OSL0WzFtYjxeqXg2VfEMttIzCCBKD8rK
 2FjAGfFGQS7uFzyoy1IwfiFlomts9kTGGSdzrBAnBeIcx2EJMoyKytoTl8watUfEzMPjLKk
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     arch/arm/boot/dts/imx53-ppd.dt.yaml
  CHECK   arch/arm/boot/dts/imx53-ppd.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/imx53-ppd.dt.yaml: leds-brightness: 'alarm-brightness' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/imx6dl-cubox-i.dt.yaml
  CHECK   arch/arm/boot/dts/imx6dl-cubox-i.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/imx6dl-cubox-i.dt.yaml: pwmleds: 'front' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dt.yaml
  CHECK   arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dt.yaml: pwmleds: 'front' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/imx6dl-cubox-i-som-v15.dt.yaml
  CHECK   arch/arm/boot/dts/imx6dl-cubox-i-som-v15.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/imx6dl-cubox-i-som-v15.dt.yaml: pwmleds: 'front' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml
  CHECK   arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml: pwmleds: 'blue', 'green', 'red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/imx53-ppd.dts                  | 15 ++++++++-------
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi           |  4 ++--
 arch/arm/boot/dts/imx6sx-softing-vining-2000.dts |  8 ++++----
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/imx53-ppd.dts b/arch/arm/boot/dts/imx53-ppd.dts
index f7dcdf96e5c0..b480614efb30 100644
--- a/arch/arm/boot/dts/imx53-ppd.dts
+++ b/arch/arm/boot/dts/imx53-ppd.dts
@@ -176,36 +176,37 @@
 		power-supply = <&reg_3v3_lcd>;
 	};
 
-	leds-brightness {
+	led-controller-1 {
 		compatible = "pwm-leds";
 
-		alarm-brightness {
+		led-1 {
+			label = "alarm-brightness";
 			pwms = <&pwm1 0 100000>;
 			max-brightness = <255>;
 		};
 	};
 
-	leds {
+	led-controller-2 {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_alarmled_pins>;
 
-		alarm1 {
+		led-2 {
 			label = "alarm:red";
 			gpios = <&gpio7 3 GPIO_ACTIVE_HIGH>;
 		};
 
-		alarm2 {
+		led-3 {
 			label = "alarm:yellow";
 			gpios = <&gpio7 7 GPIO_ACTIVE_HIGH>;
 		};
 
-		alarm3 {
+		led-4 {
 			label = "alarm:blue";
 			gpios = <&gpio7 8 GPIO_ACTIVE_HIGH>;
 		};
 
-		alarm4 {
+		led-5 {
 			label = "alarm:silenced";
 			gpios = <&gpio7 13 GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
index 67042793b0ca..1e530d892b76 100644
--- a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
@@ -55,12 +55,12 @@
 		pinctrl-0 = <&pinctrl_cubox_i_ir>;
 	};
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_cubox_i_pwm1>;
 
-		front {
+		led-1 {
 			active-low;
 			label = "imx6:red:front";
 			max-brightness = <248>;
diff --git a/arch/arm/boot/dts/imx6sx-softing-vining-2000.dts b/arch/arm/boot/dts/imx6sx-softing-vining-2000.dts
index d25e27d0315f..83bff1a129ec 100644
--- a/arch/arm/boot/dts/imx6sx-softing-vining-2000.dts
+++ b/arch/arm/boot/dts/imx6sx-softing-vining-2000.dts
@@ -40,22 +40,22 @@
 		regulator-max-microvolt = <3300000>;
 	};
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		red {
+		led-1 {
 			label = "red";
 			max-brightness = <255>;
 			pwms = <&pwm6 0 50000>;
 		};
 
-		green {
+		led-2 {
 			label = "green";
 			max-brightness = <255>;
 			pwms = <&pwm2 0 50000>;
 		};
 
-		blue {
+		led-3 {
 			label = "blue";
 			max-brightness = <255>;
 			pwms = <&pwm1 0 50000>;
-- 
2.20.1

