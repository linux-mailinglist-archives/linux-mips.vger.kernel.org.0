Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF0A28416C
	for <lists+linux-mips@lfdr.de>; Mon,  5 Oct 2020 22:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729905AbgJEUhA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Oct 2020 16:37:00 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:35725 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729849AbgJEUgf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Oct 2020 16:36:35 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MdwRi-1kz9922frS-00b5yY; Mon, 05 Oct 2020 22:35:54 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kPXD4-0004WP-KP; Mon, 05 Oct 2020 22:35:52 +0200
Received: (nullmailer pid 10337 invoked by uid 2001);
        Mon, 05 Oct 2020 20:35:38 -0000
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
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH v7 05/12] ARM: dts: at91: Fix schema warnings for pwm-leds
Date:   Mon,  5 Oct 2020 22:34:44 +0200
Message-Id: <20201005203451.9985-6-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 5fde76b173404089831f025d7aa48043
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:X5984x5Mu6KOMVT8raz47lW3KsqCqdPqMZbE4qgc5W7KVXr0jy1
 CH2YvDaBph3KN0DNsoz23Pvf8KxfdsvsO4K5peRSNDq5NF+fUAY8FNPx+XoWP4fwymsy+Nt
 3jvlyodVkxO5i4+6qCMJEadwuONX85U59RkMQrnT3SjRgOU/8FYlUwbBSedVDvHVZypybIY
 mf42H18AqHnNwyM84HbDQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/zrJ9qxpvgo=:xigd7oe7ORlWmLXKg0ViLX
 tqes9NtZqSYmmQ7y0YYQE+SsBWBvfti0HAg1v65umwnsBXzpe3CPduch2Izat6lcnKHoi9VcN
 55E2CLnpCxmH/ECvfnfr6aSTawQ50JtX0TvlB7/S6UT7OXLgb/RJF86i0SgRv+CIK4qjwrpmV
 PVSBIBCqQsZ4RC0VQyg71xIuL3JWIR44bKYjZT4Qj9kO8g0Gd/PHOstBJMm+im/UTwYUJxi0K
 ywP7C+BmxDmGEUZaRteqcgJiKqdnWFQ/qkXsK06w1b5l56FTFtBpVnNSwK5Af57RIGgJjZM5U
 eAvubOgMmJ/KFmr+XsA4SQDeoEDGHXKNnbGtj1/4nH+zOmP0HLXx7WpAMJwTSVcf/ogqGF5L6
 SOkM3h6p2xhEkF16IoDfHFTsvCRsBnv6cLjz1tnnVPAQQETg1YehfVgSZAF1J4tj1ssrVzUiV
 RqeaeCeHdJXxl/fwrEzUIb8Rgdrxu+CGDWgp7W75+Fsw7rDQUNddYVbhNph63wRsBjgYd8wAg
 /ET8+8lpPreITtTW8fBMF3KzGfjAYA5lYSjAafTM2DOdqNyoCQ6Du8VkjLRYxEmRiCk30yrzU
 laJ5CWOC/aapEAznciZgDfrQ4yFloFACOKkdmYUkPyCw87tZGUFxXPF3t7IPh0pDp+BeQ9Yer
 eyxj0OlfALcVFAyg6jmlUXFPF/yV7dr3moiTsrQEqkg8zkXNmWl6Ts6xHwcTrgJjDFIOxp+wd
 4mInr8g7xGE9eCHhm2+h+3M5b1l7c/EyLLx+Pe6raAM3uyR/e7g87YoRREltUS14Z9OrWcdqb
 Ri4XI4SWgffUGeyYP0zfNTwbYVyWwbn6JEbxFRaRWD+DibbE8ndrimUoOQuSHcqCbsbvseP
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     arch/arm/boot/dts/at91-kizbox2-2.dt.yaml
  CHECK   arch/arm/boot/dts/at91-kizbox2-2.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/at91-kizbox2-2.dt.yaml: pwm_leds: 'blue', 'green', 'red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/at91-kizbox3-hs.dt.yaml
  CHECK   arch/arm/boot/dts/at91-kizbox3-hs.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/at91-kizbox3-hs.dt.yaml: pwm_leds: 'blue', 'green', 'red', 'white' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

(Warnings above are for armv7 only, armv5 would produce similar warnings.)

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/at91-kizbox.dts             | 10 +++++-----
 arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  8 ++++----
 arch/arm/boot/dts/at91-kizbox3-hs.dts         | 16 ++++++++--------
 arch/arm/boot/dts/at91-kizbox3_common.dtsi    | 10 +++++-----
 arch/arm/boot/dts/at91-kizboxmini-common.dtsi |  8 ++++----
 arch/arm/boot/dts/at91sam9m10g45ek.dts        | 10 +++++-----
 arch/arm/boot/dts/at91sam9rlek.dts            | 10 +++++-----
 7 files changed, 36 insertions(+), 36 deletions(-)

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
-- 
2.20.1

