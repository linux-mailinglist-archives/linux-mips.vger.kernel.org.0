Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83EA827F661
	for <lists+linux-mips@lfdr.de>; Thu,  1 Oct 2020 01:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731489AbgI3Xxa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Sep 2020 19:53:30 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:50677 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731302AbgI3Xxa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Sep 2020 19:53:30 -0400
X-Greylist: delayed 313 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Sep 2020 19:53:28 EDT
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MWiYo-1jvFXk1OsC-00X0F6; Thu, 01 Oct 2020 01:47:52 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kNlp7-0007a8-MI; Thu, 01 Oct 2020 01:47:50 +0200
Received: (nullmailer pid 7811 invoked by uid 2001);
        Wed, 30 Sep 2020 23:47:49 -0000
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
Subject: [PATCH v6 6/7] arm64: dts: meson: Fix schema warnings for pwm-leds
Date:   Thu,  1 Oct 2020 01:46:36 +0200
Message-Id: <20200930234637.7573-7-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 57fe0bff746948a1c00c1c012c955907
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:aZN4vsQ09FD4ST1oiQw/j/zmw/WZNfS+WwJm4ljdYqSrse6wOJB
 HIwUSHD8ea0pFYgoq2609uGTcfq+/wDtaLXxV06FrmGKixxlLClh9iiByk498n0mUczE2FF
 F/K5zjrNkCk6f5MbiWHQn7sUxo+NM/BUwyGjUIuw14TGdLjs4Kwa+ZFrJCRuLIfO/DnScWu
 5T8JxfvsL1SFxYJ42c6Uw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uZY0ejErFkM=:NJi+ShfstAl+ru7Y3A3K4A
 t9i94xEbc0pNzV+Gx4LOFVA6cDdAY+MmTJNXvg5uP2Mfi9So0D3dBi/23arNLuKDV+tlX4/Uu
 pVdf0NMh1b6XXnVG/spPFE2D4qiePwUTTIRipJoJTc/8c4A6PYhWG5WwjwWFWH7/xiS6f5vqm
 eIaqvUS7QY3Pn9jIKtIQWXeADY1jjDVuToulKk8UiUg4vFQGyNfuQuySqCZ3bW3H7uJbQZehN
 LKIeokXpkqz3Y/35LU9LfwixGjAa+g3kTFxrp0Ytii3e+7sqJT1++SU2qxY+L4WlMBDb0056E
 6yzofW4o6OQebcOYsp6gTf8tIrIfv1po/2GZg0OKFD2FlwrSi94G1ruJeQyRrShLaz1VzTRPY
 VAEYcxypEzZckQPwjIGGfNKzIh5tXRhSr8Q2BLOK1v0S8wEEW0EdpKi5HCDr2K43BdDPP4W4c
 xqW3Qop8IcCFSJAa5TxAM5tgUSkXgVxNS+j0vC/DIfnEMgjB3Wcnoc9DTItafvexYaDHFvrR1
 FOuWLgiQ6jWsXJSm5XX9kbecfUL6U4R3PVmk3TiIoDy/4MB4nDmN9O7jphi2ApuPrwJ9lMG2Z
 GjjIMYoiOJT81WY2+xiPhc6LoeA0aGC7SECJEB24rW8hXGPogI9nHoM/TFa+DRcl/Fme1rIDg
 BV8oivJqfSrPLMAVODjiHDi6XArUHJ3u+ZxSrPcqwfKFSM/36mQujJjVBupzsOsBKMl4M580f
 cDGvhVO4IorZyPWsE0JNblCY6yYxyZ1AwjjfpH30CXJMA2DJqJyRCDNYRunSLcWUNNHmMeEro
 8reaqK85WPUu2z/Nzo4PMNiR7PF75FO+9lSo8cu7nbXAX0Iho/mgoYl9B2y9/DK7NiMu+hT
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

 .../arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts     | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts          | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 8bcdffdf55d0..adfc72500e66 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -42,10 +42,10 @@
 		};
 	};
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		power {
+		led-1 {
 			label = "vim:red:power";
 			pwms = <&pwm_AO_ab 1 7812500 0>;
 			max-brightness = <255>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index bff8ec2c1c70..dcb435af4e0b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -81,10 +81,10 @@
 		};
 	};
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		power {
+		led-1 {
 			label = "vim:red:power";
 			pwms = <&pwm_AO_ab 1 7812500 0>;
 			max-brightness = <255>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 5ab139a34c01..039a8d0d1e9b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -101,20 +101,20 @@
 		};
 	};
 
-	leds {
+	led-controller-1 {
 		compatible = "gpio-leds";
 
-		led-bluetooth {
+		led-1 {
 			label = "sei610:blue:bt";
 			gpios = <&gpio GPIOC_7 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
 			default-state = "off";
 		};
 	};
 
-	pwmleds {
+	led-controller-2 {
 		compatible = "pwm-leds";
 
-		power {
+		led-2 {
 			label = "sei610:red:power";
 			pwms = <&pwm_AO_ab 0 30518 0>;
 			max-brightness = <255>;
-- 
2.20.1

