Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2856284173
	for <lists+linux-mips@lfdr.de>; Mon,  5 Oct 2020 22:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729909AbgJEUhA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Oct 2020 16:37:00 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:51187 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729835AbgJEUge (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Oct 2020 16:36:34 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MvrRB-1khLB50vep-00syjW; Mon, 05 Oct 2020 22:35:56 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kPXD7-0004Wl-3i; Mon, 05 Oct 2020 22:35:54 +0200
Received: (nullmailer pid 10382 invoked by uid 2001);
        Mon, 05 Oct 2020 20:35:40 -0000
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
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Subject: [PATCH v7 09/12] ARM: dts: omap: Fix schema warnings for pwm-leds
Date:   Mon,  5 Oct 2020 22:34:48 +0200
Message-Id: <20201005203451.9985-10-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 45ec6910c78ac02328d2d17c1d0778f0
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:tj7egiK6AuNaQWepjgZvHcM6M5lfa7UAR2P9ioUJ3RlNB4jyF7v
 evoYPhbCTvSeI8Op6s+vrsa+6ur+wHyp4SAMR3uXS+LOIsVmqJaZS9m1+Us1wtzVYWtjUUC
 7i1EcRWIR2GkZMhYamcXIZK5SXykWa4MAkqS1rtXB9aUaHPUHjC3rVEmOwCvUVZgBtd1Y4C
 lfn3rw3Xxo1YAgCsLMWUg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jvtlnEnNPm8=:+oNI0rux+CbT7gXthF0CTY
 CDGiyW24Ps0ErOL3NWnOFJjIJCl9wHWn8AvEGroxKmzE2v5lzMtwXiK3i7y2d/Y3/1Yz8l4Xy
 jy4tOMS2DUxviDSgY8WRVLHSWtk2lkPfDYzcSsC2Xma4wSwZG0HqjFWayp9WDn4RPKBQ0ERNn
 pUIqGhFjy4Sh0SkuQ7koPP4CKABIVtRTLUyXHg3jgeBF6cn+ONCKtFChkwgow2EzaCPURLv3p
 DYEebmgnQdCdkBs9R6BRIHGnvHltmQTCRw9Y3eXye5jdB/8ZwyWO6vGxVA938GxYxy51cYdEY
 qow6U4UbcrZYjKabnE8D+Ib8QLgB5+qbDPG9HCRpLxVLyU1qnDVFjMD3aHCJNtggCnfNedxmg
 PeRFrlUYJq8rwMto57vld4CnRVU+HkSso3wCALw+wOdxOesX5xJqZ+F6GCmJFzj2wruaWDr0Z
 V3l+8MZDIquZq0/jZMH474O1k1V3TvlvARnkX8JdAU5VoGvtvd2NH2vorbQOulEODBuf8fMwZ
 B1tu9LZ3OZgv258ZiWlrQuirX9nWpj0+/gZ6PnC/qxHCkq6fXTq2kZxKC6FrVAHjtszWKYqw5
 M298G3+f80uNabZjs8DGjWGDTjK1gmJR3AV0E3pUGSiKyMvTv6RhMLkqBWS3d8UelKe3JPFNw
 M9/g7wxuti2lihIa2kjeLUnUuJM2xZP6wEnDegOuyzgFc8k3RZVjBwHGgn1dTMnLWybvNx1iV
 dyW96cGwYYLiJRzvm7peWiZr5Hn6DxuutMyNYoG8LHIaz8uwAm8+VoOs26by+LHJe+QFpbtsO
 9rn9nfnLt1OJLJxhJO4ZHk+CQp7uyGXEdEC5facXQ4rqxuGB4EXA8fcLSonblpkljvYH1x4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     arch/arm/boot/dts/omap3-beagle-xm.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-beagle-xm.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-beagle-xm.dt.yaml: pwmleds: 'pmu_stat' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-beagle-xm-ab.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-beagle-xm-ab.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-beagle-xm-ab.dt.yaml: pwmleds: 'pmu_stat' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-alto35.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-alto35.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-alto35.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-chestnut43.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-chestnut43.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-chestnut43.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-gallop43.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-gallop43.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-gallop43.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-palo35.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-palo35.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-palo35.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-palo43.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-palo43.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-palo43.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-storm-alto35.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-storm-alto35.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-storm-alto35.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-storm-chestnut43.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-storm-chestnut43.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-storm-chestnut43.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-storm-gallop43.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-storm-gallop43.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-storm-gallop43.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-storm-palo35.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-storm-palo35.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-storm-palo35.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-storm-palo43.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-storm-palo43.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-storm-palo43.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-storm-summit.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-storm-summit.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-storm-summit.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-storm-tobi.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-storm-tobi.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-storm-tobi.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-storm-tobiduo.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-storm-tobiduo.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-storm-tobiduo.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-summit.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-summit.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-summit.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-tobi.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-tobi.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-tobi.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-tobiduo.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-tobiduo.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-tobiduo.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap4-kc1.dt.yaml
  CHECK   arch/arm/boot/dts/omap4-kc1.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap4-kc1.dt.yaml: pwmleds: 'green', 'orange' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap4-sdp.dt.yaml
  CHECK   arch/arm/boot/dts/omap4-sdp.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap4-sdp.dt.yaml: pwmleds: 'charging', 'kpad' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml
  CHECK   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: pwmleds: 'charging', 'kpad' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/omap3-beagle-xm.dts   | 10 +++++-----
 arch/arm/boot/dts/omap3-overo-base.dtsi |  4 ++--
 arch/arm/boot/dts/omap4-kc1.dts         |  6 +++---
 arch/arm/boot/dts/omap4-sdp.dts         | 26 +++++++++++++------------
 4 files changed, 24 insertions(+), 22 deletions(-)

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
-- 
2.20.1

