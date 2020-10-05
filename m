Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF99428417E
	for <lists+linux-mips@lfdr.de>; Mon,  5 Oct 2020 22:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728882AbgJEUhd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Oct 2020 16:37:33 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:46417 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729196AbgJEUh3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Oct 2020 16:37:29 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MUGuZ-1jyPZb1tMx-00REKR; Mon, 05 Oct 2020 22:36:00 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kPXDC-0004XF-0c; Mon, 05 Oct 2020 22:35:58 +0200
Received: (nullmailer pid 10388 invoked by uid 2001);
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH v7 10/12] ARM: dts: stm32: Fix schema warnings for pwm-leds
Date:   Mon,  5 Oct 2020 22:34:49 +0200
Message-Id: <20201005203451.9985-11-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 5d1699e822705c24f051c25a2c63fb4e
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:6ZKlG0rDZ5U1HQ7ILaIQAQNhKsTXV0TSWVRTzdpESm8fmO/tqwD
 iK4rNm/LJgtYztQSGYN9mW2xOwWJqbOhPMTtcK0uMXIKykp/wPaXJdVtzJPD9fS68IFAo13
 m8pjTU++ifqTH58lQckSCePhpI7rOcl9djtxrldlZORvq75IKTz+HyXe6R1Ro14yadqgFaT
 yWxI/4fKVjFWSsSAD+Scw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HfmFjwagyQ0=:h4dYDYwyiy8+d8FNw1Tme/
 r9lDpQaopjx5uAFoZpCL/Sfgflnwwqv7WCVOingGfgSngvmlV8afjKAsdcbXb1invDLOs/m4o
 FRTZ0gcC2VNPdbdZ6gNpvxbSVQFyKlAIoDJstuxvz7C9Xia1cZwKeZQzvbpMOex8Iftfxb+ri
 pvBb/pE0O1Iy2okCv/W4sRx1kFtwJN6Qj2BAFuilTCk9M74ttuKlqRC3pGDq3wb4MuRO5nOhM
 bCrgUYF1thmP0ZWnlJQvAuu+XAlvbrlf0xBPtNaDnrCOG0bj3OfYsUnVw7Pl3ItulFUgoGjwR
 bTN6k+2rYXcKHYWWx7JTQEEJAJZ/v10n6Idw7NqrbwHlN/kAWMssThoV7eL56F3fIW9gi6fJr
 7oz7b5beUetnfvzz8GKLKxZ71DYKKnyzdV6gOVKi/wXHq1IgJr9GaC/02nJJboX3QtNo+z8SD
 XPd6uZGSiq/M7DU4xiAomk8WVT3O/+gxRhpr0lIWm5Q1lt5RF8GJU/7ySadWVWtFTAXHb7R9f
 cWmfIPSLFqWbwuj3hf0Zma1sC55eMQ5NEvJA/00bE8hRE+gTXzZBBFUgxhaLkJXT0KkHfGRw6
 xBiTtP7BsZza7AMHilLGg07Dbji5b19SqrKQET728usCQvFHGjyecAjd41SPv6TzidPqNyojd
 ipJphF2BvRdYxHWsKqS0zDJbdxVZPOFftntG20ilDgZG/L0HyN3VCxm1cDYiNK4utBnpkNbDl
 6d046gXSkxPW0BHlPdD5I0LSChWLPT+BEu4NZchrs5hwMzCHmaA87WM/b0WmUp9zMYoAT2xtM
 FXPk2j6rpzJswBRN3vrEoGBNNux4O4JMoZ17KgGvguzn9fZ6HoQA1AHShUJEtC/9W/vwvpN
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
  CHECK   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml: led-rgb: 'led-blue', 'led-green', 'led-red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

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

