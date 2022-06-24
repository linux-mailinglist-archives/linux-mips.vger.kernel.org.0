Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE85B559F91
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jun 2022 19:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbiFXRHu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jun 2022 13:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231654AbiFXRHt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Jun 2022 13:07:49 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFAB496A8
        for <linux-mips@vger.kernel.org>; Fri, 24 Jun 2022 10:07:48 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id u15so5926012ejc.10
        for <linux-mips@vger.kernel.org>; Fri, 24 Jun 2022 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=njhxjTKf5qgs999H/NFNZlENyL8kuhp42cJfuLDuDe8=;
        b=DRmse1ypXl3VHFhtM0fcsmCn7+/q47zNeWtzMZTE+8ishHTdLgLxHlbVqqKO27TDCX
         QyCX/uRL352TkcOj0XEA1jqrTDB4+g1jygkbeGFYVUTut1Q1enRegCed8YUgqchsnVlW
         BxplUtOmtf2h9ihNfB1YvxNPnDixxWeQqXjFbevoee7gjWSntrGBH9oGWvINUUsB9KoJ
         qu0e4VbUNSAG0n0L7Ryvb46akd6jUkn9Cyv0YF5YeASDU9pRm0xNzGzsXrzys8JHhRiR
         etgbLPC2GNJYVjH5Kh7kmckCmZA6z/KoxUm7egZb6rBhk2IhFFoAaABVqLga9lMQpBgJ
         tN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=njhxjTKf5qgs999H/NFNZlENyL8kuhp42cJfuLDuDe8=;
        b=apq3lXSISBad57KcviVy0qeE4njj1Ikr007qHtmXb9IdugJO+EIELZ3L+G7vNXW8lJ
         9yGXNOasp7cGl07+wSAsqaV8wmTP+N5dPNZSBevJgkn4YwLxYebK9wFyrt/WkbnKOoKI
         WfCE/4jEOOOpYOBKWgPZWK5CMo2bGye0KP7FA6UC6XxAz0zJs6uKpMUGWoTqFi4Qr859
         Uspo8/23xfeLYOlZM5bQ2YdBil1WDl2X/pzqRSYclABMS770KH0Bc4HhqpOiAlEtiXjy
         0ipEz6ey29F4OZzCyyQhJOy69QznTv6aX1IAP4H+rZPi3ho71DMOY/csMooKUsRK5cu6
         JM9w==
X-Gm-Message-State: AJIora8i3QQOSMG46zeYJw/F1Q8RnGznmNWFFR23IKiV+Nhhl/OFZuTh
        DmIQzJ1knXnu3oPbtVNDeJvrmA==
X-Google-Smtp-Source: AGRyM1usU5fpLW1YUCimsRoTEJR1DvpJy1/MZt5fr7TyD1VT7jW9A3P3c5qYz+5Zb+cMdCk6FTIlyQ==
X-Received: by 2002:a17:906:5d08:b0:6ff:8ed:db63 with SMTP id g8-20020a1709065d0800b006ff08eddb63mr14168737ejt.408.1656090467032;
        Fri, 24 Jun 2022 10:07:47 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b19-20020aa7dc13000000b00435959d3605sm2455929edu.84.2022.06.24.10.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 10:07:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rahul Bedarkar <rahulbedarkar89@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] MIPS: dts: align gpio-key node names with dtschema
Date:   Fri, 24 Jun 2022 19:07:40 +0200
Message-Id: <20220624170740.66271-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220624170740.66271-1-krzysztof.kozlowski@linaro.org>
References: <20220624170740.66271-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/mips/boot/dts/ingenic/ci20.dts                        | 2 +-
 arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts | 2 +-
 arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts         | 2 +-
 arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index ab6e3dc0bc1d..37c46720c719 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -31,7 +31,7 @@ memory {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		sw1 {
+		switch {
 			label = "ci20:sw1";
 			linux,code = <KEY_F13>;
 			gpios = <&gpd 17 GPIO_ACTIVE_HIGH>;
diff --git a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
index 826e91b840a3..179558161f85 100644
--- a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
+++ b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
@@ -26,7 +26,7 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinmux_gpio_gpio>;	/* GPIO11 */
 
-		user_btn1 {
+		button {
 			label = "USER_BTN1";
 			gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
 			linux,code =<KEY_PROG1> ;
diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
index 37037e4f3c3b..24eebc5a85b1 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
@@ -29,7 +29,7 @@ i2c@900 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		reset {
+		key-reset {
 			label = "reset";
 			gpios = <&gpio 18 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_RESTART>;
diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
index a6201a119a1f..34006e667780 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
@@ -29,7 +29,7 @@ i2c@900 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		reset {
+		key-reset {
 			label = "reset";
 			gpios = <&gpio 18 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_RESTART>;
-- 
2.34.1

