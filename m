Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1A025D8B7
	for <lists+linux-mips@lfdr.de>; Fri,  4 Sep 2020 14:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730242AbgIDMhL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Sep 2020 08:37:11 -0400
Received: from crapouillou.net ([89.234.176.41]:51936 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730241AbgIDMg5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 4 Sep 2020 08:36:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599223013; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=111WU6mEpB+nmKTKJ1qIKJgWH37XkpXyxWaxP7CI7B0=;
        b=A2CCPBx1phDcnjYJ1uOAgQjVSYOt+HV4UIi54JsqtXaC29i16oSAU7WEC0cJE66wrO3SbO
        wcZ2r5B87bwnP2tmXPu+YSsNLtty4WyTCzfJniwqzwDjLeooVlGU+Vktm++lTs0EUgtZFO
        byk1NNBY4uH8/bplnfcEBmrGN5l74jY=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me, devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] MIPS: dts/ingenic: Cleanup qi_lb60.dts
Date:   Fri,  4 Sep 2020 14:36:47 +0200
Message-Id: <20200904123647.11678-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Cleanup a bit the Device Tree file:

1. Respect the number of cells in GPIO descriptors and keyboard matrix;
2. Use 'ecc-engine' instead of deprecated 'ingenic,bch-controller'
   property;
3. The NAND's rb-gpios is actually active high;
3. The FRE/FWE pins must be configured in the proper mode for the NAND
   to work if it was not already done by the bootloader.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/qi_lb60.dts | 137 ++++++++++++-------------
 1 file changed, 68 insertions(+), 69 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/qi_lb60.dts b/arch/mips/boot/dts/ingenic/qi_lb60.dts
index bf298268f1a1..ba0218971572 100644
--- a/arch/mips/boot/dts/ingenic/qi_lb60.dts
+++ b/arch/mips/boot/dts/ingenic/qi_lb60.dts
@@ -109,74 +109,73 @@ keyboard {
 		debounce-delay-ms = <10>;
 		wakeup-source;
 
-		row-gpios = <&gpd 18 0 &gpd 19 0 &gpd 20 0 &gpd 21 0
-			     &gpd 22 0 &gpd 23 0 &gpd 24 0 &gpd 26 0>;
-		col-gpios = <&gpc 10 0 &gpc 11 0 &gpc 12 0 &gpc 13 0
-			     &gpc 14 0 &gpc 15 0 &gpc 16 0 &gpc 17 0>;
+		row-gpios = <&gpd 18 0>, <&gpd 19 0>, <&gpd 20 0>, <&gpd 21 0>,
+			    <&gpd 22 0>, <&gpd 23 0>, <&gpd 24 0>, <&gpd 26 0>;
+		col-gpios = <&gpc 10 0>, <&gpc 11 0>, <&gpc 12 0>, <&gpc 13 0>,
+			    <&gpc 14 0>, <&gpc 15 0>, <&gpc 16 0>, <&gpc 17 0>;
 		gpio-activelow;
 
-		linux,keymap = <
-			MATRIX_KEY(0, 0, KEY_F1)	/* S2 */
-			MATRIX_KEY(0, 1, KEY_F2)	/* S3 */
-			MATRIX_KEY(0, 2, KEY_F3)	/* S4 */
-			MATRIX_KEY(0, 3, KEY_F4)	/* S5 */
-			MATRIX_KEY(0, 4, KEY_F5)	/* S6 */
-			MATRIX_KEY(0, 5, KEY_F6)	/* S7 */
-			MATRIX_KEY(0, 6, KEY_F7)	/* S8 */
-
-			MATRIX_KEY(1, 0, KEY_Q)	/* S10 */
-			MATRIX_KEY(1, 1, KEY_W)	/* S11 */
-			MATRIX_KEY(1, 2, KEY_E)	/* S12 */
-			MATRIX_KEY(1, 3, KEY_R)	/* S13 */
-			MATRIX_KEY(1, 4, KEY_T)	/* S14 */
-			MATRIX_KEY(1, 5, KEY_Y)	/* S15 */
-			MATRIX_KEY(1, 6, KEY_U)	/* S16 */
-			MATRIX_KEY(1, 7, KEY_I)	/* S17 */
-			MATRIX_KEY(2, 0, KEY_A)	/* S18 */
-			MATRIX_KEY(2, 1, KEY_S)	/* S19 */
-			MATRIX_KEY(2, 2, KEY_D)	/* S20 */
-			MATRIX_KEY(2, 3, KEY_F)	/* S21 */
-			MATRIX_KEY(2, 4, KEY_G)	/* S22 */
-			MATRIX_KEY(2, 5, KEY_H)	/* S23 */
-			MATRIX_KEY(2, 6, KEY_J)	/* S24 */
-			MATRIX_KEY(2, 7, KEY_K)	/* S25 */
-			MATRIX_KEY(3, 0, KEY_ESC)	/* S26 */
-			MATRIX_KEY(3, 1, KEY_Z)	/* S27 */
-			MATRIX_KEY(3, 2, KEY_X)	/* S28 */
-			MATRIX_KEY(3, 3, KEY_C)	/* S29 */
-			MATRIX_KEY(3, 4, KEY_V)	/* S30 */
-			MATRIX_KEY(3, 5, KEY_B)	/* S31 */
-			MATRIX_KEY(3, 6, KEY_N)	/* S32 */
-			MATRIX_KEY(3, 7, KEY_M)	/* S33 */
-			MATRIX_KEY(4, 0, KEY_TAB)	/* S34 */
-			MATRIX_KEY(4, 1, KEY_CAPSLOCK)	/* S35 */
-			MATRIX_KEY(4, 2, KEY_BACKSLASH)	/* S36 */
-			MATRIX_KEY(4, 3, KEY_APOSTROPHE)	/* S37 */
-			MATRIX_KEY(4, 4, KEY_COMMA)	/* S38 */
-			MATRIX_KEY(4, 5, KEY_DOT)	/* S39 */
-			MATRIX_KEY(4, 6, KEY_SLASH)	/* S40 */
-			MATRIX_KEY(4, 7, KEY_UP)	/* S41 */
-			MATRIX_KEY(5, 0, KEY_O)	/* S42 */
-			MATRIX_KEY(5, 1, KEY_L)	/* S43 */
-			MATRIX_KEY(5, 2, KEY_EQUAL)	/* S44 */
-			MATRIX_KEY(5, 3, KEY_QI_UPRED)	/* S45 */
-			MATRIX_KEY(5, 4, KEY_SPACE)	/* S46 */
-			MATRIX_KEY(5, 5, KEY_QI_QI)	/* S47 */
-			MATRIX_KEY(5, 6, KEY_RIGHTCTRL)	/* S48 */
-			MATRIX_KEY(5, 7, KEY_LEFT)	/* S49 */
-			MATRIX_KEY(6, 0, KEY_F8)	/* S50 */
-			MATRIX_KEY(6, 1, KEY_P)	/* S51 */
-			MATRIX_KEY(6, 2, KEY_BACKSPACE)/* S52 */
-			MATRIX_KEY(6, 3, KEY_ENTER)	/* S53 */
-			MATRIX_KEY(6, 4, KEY_QI_VOLUP)	/* S54 */
-			MATRIX_KEY(6, 5, KEY_QI_VOLDOWN)	/* S55 */
-			MATRIX_KEY(6, 6, KEY_DOWN)	/* S56 */
-			MATRIX_KEY(6, 7, KEY_RIGHT)	/* S57 */
-
-			MATRIX_KEY(7, 0, KEY_LEFTSHIFT)	/* S58 */
-			MATRIX_KEY(7, 1, KEY_LEFTALT) /* S59 */
-			MATRIX_KEY(7, 2, KEY_QI_FN)	/* S60 */
-			>;
+		linux,keymap =
+			<MATRIX_KEY(0, 0, KEY_F1)>,	/* S2 */
+			<MATRIX_KEY(0, 1, KEY_F2)>,	/* S3 */
+			<MATRIX_KEY(0, 2, KEY_F3)>,	/* S4 */
+			<MATRIX_KEY(0, 3, KEY_F4)>,	/* S5 */
+			<MATRIX_KEY(0, 4, KEY_F5)>,	/* S6 */
+			<MATRIX_KEY(0, 5, KEY_F6)>,	/* S7 */
+			<MATRIX_KEY(0, 6, KEY_F7)>,	/* S8 */
+
+			<MATRIX_KEY(1, 0, KEY_Q)>,	/* S10 */
+			<MATRIX_KEY(1, 1, KEY_W)>,	/* S11 */
+			<MATRIX_KEY(1, 2, KEY_E)>,	/* S12 */
+			<MATRIX_KEY(1, 3, KEY_R)>,	/* S13 */
+			<MATRIX_KEY(1, 4, KEY_T)>,	/* S14 */
+			<MATRIX_KEY(1, 5, KEY_Y)>,	/* S15 */
+			<MATRIX_KEY(1, 6, KEY_U)>,	/* S16 */
+			<MATRIX_KEY(1, 7, KEY_I)>,	/* S17 */
+			<MATRIX_KEY(2, 0, KEY_A)>,	/* S18 */
+			<MATRIX_KEY(2, 1, KEY_S)>,	/* S19 */
+			<MATRIX_KEY(2, 2, KEY_D)>,	/* S20 */
+			<MATRIX_KEY(2, 3, KEY_F)>,	/* S21 */
+			<MATRIX_KEY(2, 4, KEY_G)>,	/* S22 */
+			<MATRIX_KEY(2, 5, KEY_H)>,	/* S23 */
+			<MATRIX_KEY(2, 6, KEY_J)>,	/* S24 */
+			<MATRIX_KEY(2, 7, KEY_K)>,	/* S25 */
+			<MATRIX_KEY(3, 0, KEY_ESC)>,	/* S26 */
+			<MATRIX_KEY(3, 1, KEY_Z)>,	/* S27 */
+			<MATRIX_KEY(3, 2, KEY_X)>,	/* S28 */
+			<MATRIX_KEY(3, 3, KEY_C)>,	/* S29 */
+			<MATRIX_KEY(3, 4, KEY_V)>,	/* S30 */
+			<MATRIX_KEY(3, 5, KEY_B)>,	/* S31 */
+			<MATRIX_KEY(3, 6, KEY_N)>,	/* S32 */
+			<MATRIX_KEY(3, 7, KEY_M)>,	/* S33 */
+			<MATRIX_KEY(4, 0, KEY_TAB)>,	/* S34 */
+			<MATRIX_KEY(4, 1, KEY_CAPSLOCK)>,	/* S35 */
+			<MATRIX_KEY(4, 2, KEY_BACKSLASH)>,	/* S36 */
+			<MATRIX_KEY(4, 3, KEY_APOSTROPHE)>,	/* S37 */
+			<MATRIX_KEY(4, 4, KEY_COMMA)>,	/* S38 */
+			<MATRIX_KEY(4, 5, KEY_DOT)>,	/* S39 */
+			<MATRIX_KEY(4, 6, KEY_SLASH)>,	/* S40 */
+			<MATRIX_KEY(4, 7, KEY_UP)>,	/* S41 */
+			<MATRIX_KEY(5, 0, KEY_O)>,	/* S42 */
+			<MATRIX_KEY(5, 1, KEY_L)>,	/* S43 */
+			<MATRIX_KEY(5, 2, KEY_EQUAL)>,	/* S44 */
+			<MATRIX_KEY(5, 3, KEY_QI_UPRED)>,	/* S45 */
+			<MATRIX_KEY(5, 4, KEY_SPACE)>,	/* S46 */
+			<MATRIX_KEY(5, 5, KEY_QI_QI)>,	/* S47 */
+			<MATRIX_KEY(5, 6, KEY_RIGHTCTRL)>,	/* S48 */
+			<MATRIX_KEY(5, 7, KEY_LEFT)>,	/* S49 */
+			<MATRIX_KEY(6, 0, KEY_F8)>,	/* S50 */
+			<MATRIX_KEY(6, 1, KEY_P)>,	/* S51 */
+			<MATRIX_KEY(6, 2, KEY_BACKSPACE)>,/* S52 */
+			<MATRIX_KEY(6, 3, KEY_ENTER)>,	/* S53 */
+			<MATRIX_KEY(6, 4, KEY_QI_VOLUP)>,	/* S54 */
+			<MATRIX_KEY(6, 5, KEY_QI_VOLDOWN)>,	/* S55 */
+			<MATRIX_KEY(6, 6, KEY_DOWN)>,	/* S56 */
+			<MATRIX_KEY(6, 7, KEY_RIGHT)>,	/* S57 */
+
+			<MATRIX_KEY(7, 0, KEY_LEFTSHIFT)>,	/* S58 */
+			<MATRIX_KEY(7, 1, KEY_LEFTALT)>, /* S59 */
+			<MATRIX_KEY(7, 2, KEY_QI_FN)>;	/* S60 */
 	};
 
 	spi {
@@ -261,12 +260,12 @@ nandc: nand-controller@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ingenic,bch-controller = <&ecc>;
+		ecc-engine = <&ecc>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&pins_nemc>;
 
-		rb-gpios = <&gpc 30 GPIO_ACTIVE_LOW>;
+		rb-gpios = <&gpc 30 GPIO_ACTIVE_HIGH>;
 
 		nand@1 {
 			reg = <1>;
@@ -324,7 +323,7 @@ pins_lcd: lcd {
 
 	pins_nemc: nemc {
 		function = "nand";
-		groups = "nand-cs1";
+		groups = "nand-fre-fwe", "nand-cs1";
 	};
 
 	pins_uart0: uart0 {
-- 
2.28.0

