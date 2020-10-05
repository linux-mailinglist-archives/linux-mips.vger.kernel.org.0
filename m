Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB398284150
	for <lists+linux-mips@lfdr.de>; Mon,  5 Oct 2020 22:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729857AbgJEUge (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Oct 2020 16:36:34 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:46925 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729837AbgJEUgd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Oct 2020 16:36:33 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M7JrG-1kK4681bhc-007kJO; Mon, 05 Oct 2020 22:36:00 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kPXD9-0004X3-UD; Mon, 05 Oct 2020 22:35:56 +0200
Received: (nullmailer pid 10395 invoked by uid 2001);
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
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v7 11/12] arm64: dts: meson: Fix schema warnings for pwm-leds
Date:   Mon,  5 Oct 2020 22:34:50 +0200
Message-Id: <20201005203451.9985-12-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 9f5b2199e4483c1fbb1603fea470fc05
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:A4oxbG+VP4keve1usN9ADR72uw0WccVPSSBWokgSTOYr4HO0wXU
 h4RFD7nLJIzovO2Gs4xcpY+0BKCCyDjL8Mjxgi3z2Qh1iU+WASkkhFmghKKTEFF9Q/f9rpM
 +4/nJcVli6ea+DZquPU/7SLA2oHuGw4PxnchPmtnsm62Gi6nxZo4lk2B3bw2RvLv0lA+h58
 0lhR3dJRtVTCUoBXhvr9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5ovu7SMkV4Q=:PH7u5YKYkwCKqj8o1agAGk
 rWTBchz6xUWT2uBSBXi4dbo0qLg3hNmYgVIEtS3KljJSK0tQ/ZLNwX0FwAf2o1n6GZV35GHDg
 Jev9Z/2ImNZJWCyjAGly9esRXyLPPGZnlTM+ucRmiyjGDBkdLS1RBRRWm5htpCycF2YDJKD0X
 a7HX+Te79Z9hJoLGOYvYCZcBQKJoVj9kdvnFiAmBUI/joN8vflOmZYlZxvBMaZTtiLpmQUN8X
 NUMVCZaJmNkNjn0GfnEnqR/BAfdulIS4Vbx9bwMIDHotBFwTY/SDyTCTgsWgHD6LSwfWEVFT0
 gMkGvSZPyPfnG0T/xmgRSHDEAcJclkHy5TjCSfKHvpki8FGS1IXA+ealzJ3oZ0FoHMtRyoGMD
 ycuGqk+TUjj1N8lV2KqzWDUEcDtwgPzg44iNfa17ioq0yCrwE0b6Hdzt+CgT2XNTJE3DWUaeu
 C6ZojrgnplPxhZkym+Kg1RhZTYmmkFevC3MXgq0CZ6leahy9wN7F7ahrVVLo7MGWQ5lvvGsC5
 XkeegLfcMAHcVIvcbPvjFy2lFzkylqe7lfcW1H2cVOArjikK0zTArJ1ycQa6XHL+1kERqjZGf
 HLPMbza2Pkdgk/pgtdPI5RWswwsxEfwPO/npXiIuM27iW66XnD43Lo7uWVpNgiDZ2o9dyKgrX
 H00a1LUmLwEaV6nBG+Gi5WnVff118/hBl7bNoRiipRWzQSJR4yAE/yYbkzkqgYJ8dRJ/L8D+A
 G3DHdcyiJ6iDDAMwrXygXjhlNm8BB1dHQVxyDpjin+Ybt5QkGqvLuawPQ/MOZ6aVSH366W1z3
 cpzBuPnSl/RVFuPEsY35bJ/23eZOxWq0BhWdwzPKCXcwJ7t67FnX1VKZ5E3TEhM+ZgiScVK
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

Signed-off-by: Alexander Dahl <post@lespocky.de>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---

Notes:
    v6 -> v7:
      * added Reviewed-by
      * added another explaining sentence to commit message
    
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

