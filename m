Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE9827F63E
	for <lists+linux-mips@lfdr.de>; Thu,  1 Oct 2020 01:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732128AbgI3XsQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Sep 2020 19:48:16 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:49661 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732008AbgI3XsM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Sep 2020 19:48:12 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MwgKC-1kdu2L3r4c-00y8gh; Thu, 01 Oct 2020 01:47:48 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kNlp2-0007Zp-Pp; Thu, 01 Oct 2020 01:47:45 +0200
Received: (nullmailer pid 7796 invoked by uid 2001);
        Wed, 30 Sep 2020 23:47:44 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v6 5/7] ARM: dts: Fix schema warnings for pwm-leds
Date:   Thu,  1 Oct 2020 01:46:35 +0200
Message-Id: <20200930234637.7573-6-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 853416b5a92f5196b235addfa69459d5
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:BymeVcQ9TYnr5bpShkQpEkTGEopwo4Ce+0n3ATyltvfOncUe0Ox
 P376QO7O4fVIzBDTpZmyzbyc2eGd5++1CXTC6eh2PHdTM/eF+0iRFc1aTkZLEBIcYUYuJrf
 5KIv4gmofrLatt28XKLBm2kqMHGbMuT6rquYWEoX3O88nOxBDM+DFTxQ3mc6WWBvhzNNg22
 7n4Rb1IIP75/Zb7Q7Oy1A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sYbrWGhTfDQ=:O9ODS8aqVzMqj9LVSrbSHo
 yhyVjRnUeHqW6f/MDXDVIVfaaEtC1XAblrqAt4hmuLAKY84kYuz8Kzzc9y37gZJmZ8vDtxdV2
 pZGyYSOpoVTSBmbn8k2IZGxpi62SN95EFO5sICtX/iuNXK69jvXUdM8Tl6wOyWUK4H+0myviq
 wK/g61JH/Cwl9QMwxDiUcyCCMEy7OBYx8Qda6N3Rq9jk0Q+iIAm4dqJ5/4Hwolu1PS2upSg4z
 VsaOG2KvaoCkSZw6j6uhkgwe4quHs28C8VPbUmDWnpXvnjwP6WxfqNCZA1o6KHvLUDIOqkxYs
 54Xs20K2uhtH618u9J5aR7OHL2ZGhYbw8oVEK2mqU+3ZblubzZdau1hEKNGvbTWZ8vKpxWZ4T
 j1pW+otCnhL4IXZD/mHwoctrcHFEQq+PXjoSyvejibWugH0e4YC7BToEcqg2YZJuWgJAmyGnz
 UBVpTxr+C38AfOLfFR3v4vTIah0XgtGhfGVnfL1zv4ctwQGpswZaeCfaRwm+b+nOWGd1BDUNQ
 hGOY2gJpO8vY3EiUkvoXubH/vc6RoSfTMBqDH76Zf/IIAM0Z8JoqFHrsKH0hl5IoFYnSOcQFq
 V7kZuyGcL8q5189/FBI6BA+01EnCege+EcP8CKH44Dh71GBM8W1cstpxRcoW6lBp88Zrkf/bp
 /RnbVTlNnoA8IzCZYBNtMDZQZfPhPzmHwRVOGaHoBuZ3bzX87paAIBvyYJ0nRqKzu5lKylz5S
 PgXSV9sFPorxCQrV3rdjdIKR1kH4dFirvuMikEVGnoM0BU7nWUGkWKMudN8Dc8GY3TtjTLHeT
 HlvJnBi+UVP3uLKVVhoVtqUEJq4bGA6IgKaYaShw4LXcAvhwCD78V51NcEmUwSs5RRp1+j2
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6:
      * added this patch to series

 arch/arm/boot/dts/at91-kizbox.dts             | 10 +++----
 arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  8 +++---
 arch/arm/boot/dts/at91-kizbox3-hs.dts         | 16 ++++++------
 arch/arm/boot/dts/at91-kizbox3_common.dtsi    | 10 +++----
 arch/arm/boot/dts/at91-kizboxmini-common.dtsi |  8 +++---
 arch/arm/boot/dts/at91sam9m10g45ek.dts        | 10 +++----
 arch/arm/boot/dts/at91sam9rlek.dts            | 10 +++----
 .../boot/dts/berlin2cd-google-chromecast.dts  |  6 ++---
 arch/arm/boot/dts/exynos5422-odroidhc1.dts    |  4 +--
 arch/arm/boot/dts/exynos5422-odroidxu4.dts    |  4 +--
 .../boot/dts/exynos54xx-odroidxu-leds.dtsi    | 11 ++++----
 arch/arm/boot/dts/imx53-ppd.dts               | 15 ++++++-----
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi        |  4 +--
 .../boot/dts/imx6sx-softing-vining-2000.dts   |  8 +++---
 arch/arm/boot/dts/omap3-beagle-xm.dts         | 10 +++----
 arch/arm/boot/dts/omap3-overo-base.dtsi       |  4 +--
 arch/arm/boot/dts/omap4-kc1.dts               |  6 ++---
 arch/arm/boot/dts/omap4-sdp.dts               | 26 ++++++++++---------
 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts     | 12 ++++-----
 19 files changed, 93 insertions(+), 89 deletions(-)

diff --git a/arch/arm/boot/dts/at91-kizbox.dts b/arch/arm/boot/dts/at91-kizbox.dts
index 7d938ccf71b0..6ea5e60d881d 100644
--- a/arch/arm/boot/dts/at91-kizbox.dts
+++ b/arch/arm/boot/dts/at91-kizbox.dts
@@ -48,31 +48,31 @@
 		};
 	};
 
-	pwm_leds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		network_green {
+		led-1 {
 			label = "pwm:green:network";
 			pwms = <&tcb_pwm 2 10000000 PWM_POLARITY_INVERTED>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
-		network_red {
+		led-2 {
 			label = "pwm:red:network";
 			pwms = <&tcb_pwm 4 10000000 PWM_POLARITY_INVERTED>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
-		user_green {
+		led-3 {
 			label = "pwm:green:user";
 			pwms = <&tcb_pwm 0 10000000 PWM_POLARITY_INVERTED>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
-		user_red {
+		led-4 {
 			label = "pwm:red:user";
 			pwms = <&tcb_pwm 1 10000000 PWM_POLARITY_INVERTED>;
 			max-brightness = <255>;
diff --git a/arch/arm/boot/dts/at91-kizbox2-common.dtsi b/arch/arm/boot/dts/at91-kizbox2-common.dtsi
index af38253a6e7a..8dc880c6b9d0 100644
--- a/arch/arm/boot/dts/at91-kizbox2-common.dtsi
+++ b/arch/arm/boot/dts/at91-kizbox2-common.dtsi
@@ -58,24 +58,24 @@
 		};
 	};
 
-	pwm_leds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		blue {
+		led-1 {
 			label = "pwm:blue:user";
 			pwms = <&pwm0 2 10000000 0>;
 			max-brightness = <255>;
 			linux,default-trigger = "none";
 		};
 
-		green {
+		led-2 {
 			label = "pwm:green:user";
 			pwms = <&pwm0 1 10000000 0>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
-		red {
+		led-3 {
 			label = "pwm:red:user";
 			pwms = <&pwm0 0 10000000 0>;
 			max-brightness = <255>;
diff --git a/arch/arm/boot/dts/at91-kizbox3-hs.dts b/arch/arm/boot/dts/at91-kizbox3-hs.dts
index 0da1f0557eaf..2799b2a1f4d2 100644
--- a/arch/arm/boot/dts/at91-kizbox3-hs.dts
+++ b/arch/arm/boot/dts/at91-kizbox3-hs.dts
@@ -15,40 +15,40 @@
 	model = "Overkiz KIZBOX3-HS";
 	compatible = "overkiz,kizbox3-hs", "atmel,sama5d2", "atmel,sama5";
 
-	pwm_leds {
+	led-controller-1 {
 		status = "okay";
 
-		red {
+		led-1 {
 			status = "okay";
 		};
 
-		green {
+		led-2 {
 			status = "okay";
 		};
 
-		blue {
+		led-3 {
 			status = "okay";
 		};
 
-		white {
+		led-4 {
 			status = "okay";
 		};
 	};
 
-	leds  {
+	led-controller-2  {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_led_red
 			     &pinctrl_led_white>;
 		status = "okay";
 
-		red {
+		led-5 {
 			label = "pio:red:user";
 			gpios = <&pioA PIN_PB1 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		white {
+		led-6 {
 			label = "pio:white:user";
 			gpios = <&pioA PIN_PB8 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
diff --git a/arch/arm/boot/dts/at91-kizbox3_common.dtsi b/arch/arm/boot/dts/at91-kizbox3_common.dtsi
index 7c3076e245ef..9ce513dd514b 100644
--- a/arch/arm/boot/dts/at91-kizbox3_common.dtsi
+++ b/arch/arm/boot/dts/at91-kizbox3_common.dtsi
@@ -62,7 +62,7 @@
 		regulator-always-on;
 	};
 
-	pwm_leds {
+	led-controller-1 {
 		compatible = "pwm-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pwm0_pwm_h0
@@ -71,7 +71,7 @@
 			     &pinctrl_pwm0_pwm_h3>;
 		status = "disabled";
 
-		red {
+		led-1 {
 			label = "pwm:red:user";
 			pwms = <&pwm0 0 10000000 0>;
 			max-brightness = <255>;
@@ -79,7 +79,7 @@
 			status = "disabled";
 		};
 
-		green {
+		led-2 {
 			label = "pwm:green:user";
 			pwms = <&pwm0 1 10000000 0>;
 			max-brightness = <255>;
@@ -87,14 +87,14 @@
 			status = "disabled";
 		};
 
-		blue {
+		led-3 {
 			label = "pwm:blue:user";
 			pwms = <&pwm0 2 10000000 0>;
 			max-brightness = <255>;
 			status = "disabled";
 		};
 
-		white {
+		led-4 {
 			label = "pwm:white:user";
 			pwms = <&pwm0 3 10000000 0>;
 			max-brightness = <255>;
diff --git a/arch/arm/boot/dts/at91-kizboxmini-common.dtsi b/arch/arm/boot/dts/at91-kizboxmini-common.dtsi
index fddf267b2d17..5892f20f7b16 100644
--- a/arch/arm/boot/dts/at91-kizboxmini-common.dtsi
+++ b/arch/arm/boot/dts/at91-kizboxmini-common.dtsi
@@ -54,10 +54,10 @@
 		};
 	};
 
-	leds: pwm_leds {
+	leds: led-controller-1 {
 		compatible = "pwm-leds";
 
-		led_blue: pwm_blue {
+		led_blue: led-1 {
 			label = "pwm:blue:user";
 			pwms = <&pwm0 2 10000000 0>;
 			max-brightness = <255>;
@@ -65,14 +65,14 @@
 			status = "disabled";
 		};
 
-		led_green: pwm_green {
+		led_green: led-2 {
 			label = "pwm:green:user";
 			pwms = <&pwm0 0 10000000 0>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
-		led_red: pwm_red {
+		led_red: led-3 {
 			label = "pwm:red:user";
 			pwms = <&pwm0 1 10000000 0>;
 			max-brightness = <255>;
diff --git a/arch/arm/boot/dts/at91sam9m10g45ek.dts b/arch/arm/boot/dts/at91sam9m10g45ek.dts
index a3a5c82d9f29..c50706b653d0 100644
--- a/arch/arm/boot/dts/at91sam9m10g45ek.dts
+++ b/arch/arm/boot/dts/at91sam9m10g45ek.dts
@@ -313,27 +313,27 @@
 		};
 	};
 
-	leds {
+	led-controller-1 {
 		compatible = "gpio-leds";
 
-		d8 {
+		led-1 {
 			label = "d8";
 			gpios = <&pioD 30 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
 	};
 
-	pwmleds {
+	led-controller-2 {
 		compatible = "pwm-leds";
 
-		d6 {
+		led-2 {
 			label = "d6";
 			pwms = <&pwm0 3 5000 PWM_POLARITY_INVERTED>;
 			max-brightness = <255>;
 			linux,default-trigger = "nand-disk";
 		};
 
-		d7 {
+		led-3 {
 			label = "d7";
 			pwms = <&pwm0 1 5000 PWM_POLARITY_INVERTED>;
 			max-brightness = <255>;
diff --git a/arch/arm/boot/dts/at91sam9rlek.dts b/arch/arm/boot/dts/at91sam9rlek.dts
index 0de75d3c4f18..035ce5dedff7 100644
--- a/arch/arm/boot/dts/at91sam9rlek.dts
+++ b/arch/arm/boot/dts/at91sam9rlek.dts
@@ -218,26 +218,26 @@
 		};
 	};
 
-	pwmleds {
+	led-controller-1 {
 		compatible = "pwm-leds";
 
-		ds1 {
+		led-1 {
 			label = "ds1";
 			pwms = <&pwm0 1 5000 PWM_POLARITY_INVERTED>;
 			max-brightness = <255>;
 		};
 
-		ds2 {
+		led-2 {
 			label = "ds2";
 			pwms = <&pwm0 2 5000 PWM_POLARITY_INVERTED>;
 			max-brightness = <255>;
 		};
 	};
 
-	leds {
+	led-controller-2 {
 		compatible = "gpio-leds";
 
-		ds3 {
+		led-3 {
 			label = "ds3";
 			gpios = <&pioD 14 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
diff --git a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
index 56fa951bc86f..c1d91424e658 100644
--- a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
+++ b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
@@ -34,19 +34,19 @@
 		linux,usable-memory = <0x00000000 0x20000000>; /* 512 MB */
 	};
 
-	leds {
+	led-controller {
 		compatible = "pwm-leds";
 		pinctrl-0 = <&ledpwm_pmux>;
 		pinctrl-names = "default";
 
-		white {
+		led-1 {
 			label = "white";
 			pwms = <&pwm 0 600000 0>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
-		red {
+		led-2 {
 			label = "red";
 			pwms = <&pwm 1 600000 0>;
 			max-brightness = <255>;
diff --git a/arch/arm/boot/dts/exynos5422-odroidhc1.dts b/arch/arm/boot/dts/exynos5422-odroidhc1.dts
index 812659260278..20c222b33f98 100644
--- a/arch/arm/boot/dts/exynos5422-odroidhc1.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidhc1.dts
@@ -15,10 +15,10 @@
 	compatible = "hardkernel,odroid-hc1", "samsung,exynos5800", \
 		     "samsung,exynos5";
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		blueled {
+		led-1 {
 			label = "blue:heartbeat";
 			pwms = <&pwm 2 2000000 0>;
 			pwm-names = "pwm2";
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu4.dts b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
index 892d389d6d09..955065ee57a0 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
@@ -17,10 +17,10 @@
 	compatible = "hardkernel,odroid-xu4", "samsung,exynos5800", \
 		     "samsung,exynos5";
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		blueled {
+		led-1 {
 			label = "blue:heartbeat";
 			pwms = <&pwm 2 2000000 0>;
 			pwm-names = "pwm2";
diff --git a/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi b/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
index 56acd832f0b3..2fc3e86dc5f7 100644
--- a/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
+++ b/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
@@ -11,10 +11,10 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	pwmleds {
+	led-controller-1 {
 		compatible = "pwm-leds";
 
-		greenled {
+		led-1 {
 			label = "green:mmc0";
 			pwms = <&pwm 1 2000000 0>;
 			pwm-names = "pwm1";
@@ -26,7 +26,7 @@
 			linux,default-trigger = "mmc0";
 		};
 
-		blueled {
+		led-2 {
 			label = "blue:heartbeat";
 			pwms = <&pwm 2 2000000 0>;
 			pwm-names = "pwm2";
@@ -35,9 +35,10 @@
 		};
 	};
 
-	gpioleds {
+	led-controller-2 {
 		compatible = "gpio-leds";
-		redled {
+
+		led-3 {
 			label = "red:microSD";
 			gpios = <&gpx2 3 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
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
diff --git a/arch/arm/boot/dts/omap3-beagle-xm.dts b/arch/arm/boot/dts/omap3-beagle-xm.dts
index 05077f3c75cd..cbeab697b89f 100644
--- a/arch/arm/boot/dts/omap3-beagle-xm.dts
+++ b/arch/arm/boot/dts/omap3-beagle-xm.dts
@@ -34,26 +34,26 @@
 		clock-frequency = <26000000>;
 	};
 
-	leds {
+	led-controller-1 {
 		compatible = "gpio-leds";
 
-		heartbeat {
+		led-1 {
 			label = "beagleboard::usr0";
 			gpios = <&gpio5 22 GPIO_ACTIVE_HIGH>; /* 150 -> D6 LED */
 			linux,default-trigger = "heartbeat";
 		};
 
-		mmc {
+		led-2 {
 			label = "beagleboard::usr1";
 			gpios = <&gpio5 21 GPIO_ACTIVE_HIGH>; /* 149 -> D7 LED */
 			linux,default-trigger = "mmc0";
 		};
 	};
 
-	pwmleds {
+	led-controller-2 {
 		compatible = "pwm-leds";
 
-		pmu_stat {
+		led-3 {
 			label = "beagleboard::pmu_stat";
 			pwms = <&twl_pwmled 1 7812500>;
 			max-brightness = <127>;
diff --git a/arch/arm/boot/dts/omap3-overo-base.dtsi b/arch/arm/boot/dts/omap3-overo-base.dtsi
index 971d3e250515..006a6d97231c 100644
--- a/arch/arm/boot/dts/omap3-overo-base.dtsi
+++ b/arch/arm/boot/dts/omap3-overo-base.dtsi
@@ -14,10 +14,10 @@
 		reg = <0 0>;
 	};
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		overo {
+		led-1 {
 			label = "overo:blue:COM";
 			pwms = <&twl_pwmled 1 7812500>;
 			max-brightness = <127>;
diff --git a/arch/arm/boot/dts/omap4-kc1.dts b/arch/arm/boot/dts/omap4-kc1.dts
index 31d856b58f8a..e59d17b25a1d 100644
--- a/arch/arm/boot/dts/omap4-kc1.dts
+++ b/arch/arm/boot/dts/omap4-kc1.dts
@@ -15,16 +15,16 @@
 		reg = <0x80000000 0x20000000>; /* 512 MB */
 	};
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		green {
+		led-1 {
 			label = "green";
 			pwms = <&twl_pwm 0 7812500>;
 			max-brightness = <127>;
 		};
 
-		orange {
+		led-2 {
 			label = "orange";
 			pwms = <&twl_pwm 1 7812500>;
 			max-brightness = <127>;
diff --git a/arch/arm/boot/dts/omap4-sdp.dts b/arch/arm/boot/dts/omap4-sdp.dts
index 79e7a41ecb7e..f5d7539a3668 100644
--- a/arch/arm/boot/dts/omap4-sdp.dts
+++ b/arch/arm/boot/dts/omap4-sdp.dts
@@ -45,58 +45,60 @@
 		regulator-boot-on;
 	};
 
-	leds {
+	led-controller-1 {
 		compatible = "gpio-leds";
-		debug0 {
+
+		led-1 {
 			label = "omap4:green:debug0";
 			gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>; /* 61 */
 		};
 
-		debug1 {
+		led-2 {
 			label = "omap4:green:debug1";
 			gpios = <&gpio1 30 GPIO_ACTIVE_HIGH>; /* 30 */
 		};
 
-		debug2 {
+		led-3 {
 			label = "omap4:green:debug2";
 			gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>; /* 7 */
 		};
 
-		debug3 {
+		led-4 {
 			label = "omap4:green:debug3";
 			gpios = <&gpio1 8 GPIO_ACTIVE_HIGH>; /* 8 */
 		};
 
-		debug4 {
+		led-5 {
 			label = "omap4:green:debug4";
 			gpios = <&gpio2 18 GPIO_ACTIVE_HIGH>; /* 50 */
 		};
 
-		user1 {
+		led-6 {
 			label = "omap4:blue:user";
 			gpios = <&gpio6 9 GPIO_ACTIVE_HIGH>; /* 169 */
 		};
 
-		user2 {
+		led-7 {
 			label = "omap4:red:user";
 			gpios = <&gpio6 10 GPIO_ACTIVE_HIGH>; /* 170 */
 		};
 
-		user3 {
+		led-8 {
 			label = "omap4:green:user";
 			gpios = <&gpio5 11 GPIO_ACTIVE_HIGH>; /* 139 */
 		};
 	};
 
-	pwmleds {
+	led-controller-2 {
 		compatible = "pwm-leds";
-		kpad {
+
+		led-9 {
 			label = "omap4::keypad";
 			pwms = <&twl_pwm 0 7812500>;
 			max-brightness = <127>;
 		};
 
-		charging {
+		led-10 {
 			label = "omap4:green:chrg";
 			pwms = <&twl_pwmled 0 7812500>;
 			max-brightness = <255>;
diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
index 5700e6b700d3..25d548cb975b 100644
--- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
@@ -36,34 +36,34 @@
 		stdout-path = &uart4;
 	};
 
-	led-act {
+	led-controller-1 {
 		compatible = "gpio-leds";
 
-		led-green {
+		led-1 {
 			label = "mc1:green:act";
 			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 		};
 	};
 
-	led-rgb {
+	led-controller-2 {
 		compatible = "pwm-leds";
 
-		led-red {
+		led-2 {
 			label = "mc1:red:rgb";
 			pwms = <&leds_pwm 1 1000000 0>;
 			max-brightness = <255>;
 			active-low;
 		};
 
-		led-green {
+		led-3 {
 			label = "mc1:green:rgb";
 			pwms = <&leds_pwm 2 1000000 0>;
 			max-brightness = <255>;
 			active-low;
 		};
 
-		led-blue {
+		led-4 {
 			label = "mc1:blue:rgb";
 			pwms = <&leds_pwm 3 1000000 0>;
 			max-brightness = <255>;
-- 
2.20.1

