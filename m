Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 910CC4F81D3
	for <lists+linux-mips@lfdr.de>; Thu,  7 Apr 2022 16:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235661AbiDGOgR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Apr 2022 10:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344023AbiDGOgD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Apr 2022 10:36:03 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D74851BFDF3
        for <linux-mips@vger.kernel.org>; Thu,  7 Apr 2022 07:33:31 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id bh17so11234408ejb.8
        for <linux-mips@vger.kernel.org>; Thu, 07 Apr 2022 07:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1jOfGY2aWB6ytElc3A8TYe1lFhh8rzUDtI1qb0xPNWc=;
        b=TN89JKEfl9AxOmTFv7RkLldl9yUqbqq288C1keYFmxd40sY3RW0quDl9ywjD9PjL/Y
         agKVab8ZUTrbszOKkNKg0lLp7N1XEENxL7mQwobdcPRQWDAUn/BMg8H6vnBLFi0zAVRM
         LuL0f61r0sFD0A6b342d469AsYsfbXat52/eg4TVEIEPcSjUASf0RGN5MKJbvFYzx2J1
         aKEyTSaMoRX3nd1drizcBQmdzFo1CwC94A+zx2Bqbs/TWLG4UjhZheZInK/OV2U6ITE5
         XfeN5zBiwOD1KP8k0tbu0ZL9VnJElePg/mY7wLl6+KOiea+vcus6rH/w807vQ2D/j/a+
         fZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1jOfGY2aWB6ytElc3A8TYe1lFhh8rzUDtI1qb0xPNWc=;
        b=oS0+/bHUJPiJu+T19D6hzqPCAyqwKaX58Vn4KKxNiTReOxBmwxdWU1uON83OZ2BKi9
         JRU1enGRY4UbK3XIcIk0QNexEHZ3dkFdNYY2dFpUiY5csv6VC6BWMvQGY0cM1ABVvMrQ
         k8d7nGvT/G+Pu5ItwuIVrIWrnZdhBMDwvrNRXHBG00v5hWYxlRvi1UY2vNIXWrkaV3Rp
         VTkA2pZAW4oHMsZxAkPOm1wSY2Dm8D8e6VnnIK9lIYNbdxXNf8IEsB3zHS4jW8TlofRX
         C8oY9Hmu1bTuoAWzkM1/Z80ORn6vfcRV4m0BI6FWd7x2BreGpRRQWuOmNtqPbnGP7mjj
         IWJw==
X-Gm-Message-State: AOAM530wqXpIUqJCB29bkdGpYTa8LQnDtIHattBUJEQ6sVFMe2IBPLGy
        iHgRsWSfQGORAao6kozrwYGIzjexgXAdW8Tl
X-Google-Smtp-Source: ABdhPJw3RYZO7ZNQxKKRlLqoHhj3X3DBP2V/Sm5elqCPxW4lwfL1OHoBjDOdMAM81b2iiTLvHXEfmg==
X-Received: by 2002:a17:906:7056:b0:6d6:dd99:f2a4 with SMTP id r22-20020a170906705600b006d6dd99f2a4mr13357831ejj.43.1649342010386;
        Thu, 07 Apr 2022 07:33:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id do8-20020a170906c10800b006dfe4d1edc6sm7624054ejc.61.2022.04.07.07.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 07:33:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] MIPS: dts: align SPI NOR node name with dtschema
Date:   Thu,  7 Apr 2022 16:33:28 +0200
Message-Id: <20220407143328.295762-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The node names should be generic and SPI NOR dtschema expects "flash".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/mips/boot/dts/brcm/bcm97358svmb.dts                   | 2 +-
 arch/mips/boot/dts/brcm/bcm97360svmb.dts                   | 2 +-
 arch/mips/boot/dts/brcm/bcm97425svmb.dts                   | 2 +-
 arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts | 2 +-
 arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts         | 2 +-
 arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts         | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm97358svmb.dts b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
index 522f2c40d6e6..c17fc14d4899 100644
--- a/arch/mips/boot/dts/brcm/bcm97358svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
@@ -78,7 +78,7 @@ &nand {
 &qspi {
 	status = "okay";
 
-	m25p80@0 {
+	flash@0 {
 		compatible = "m25p80";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
diff --git a/arch/mips/boot/dts/brcm/bcm97360svmb.dts b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
index 01f215b08dba..c9b76f41e7a6 100644
--- a/arch/mips/boot/dts/brcm/bcm97360svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
@@ -81,7 +81,7 @@ &sdhci0 {
 &qspi {
 	status = "okay";
 
-	m25p80@0 {
+	flash@0 {
 		compatible = "m25p80";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
diff --git a/arch/mips/boot/dts/brcm/bcm97425svmb.dts b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
index f38934934349..289a57b912ef 100644
--- a/arch/mips/boot/dts/brcm/bcm97425svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
@@ -116,7 +116,7 @@ &sdhci1 {
 &qspi {
 	status = "okay";
 
-	m25p80@0 {
+	flash@0 {
 		compatible = "m25p80";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
diff --git a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
index 6069b33cf09f..826e91b840a3 100644
--- a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
+++ b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
@@ -129,7 +129,7 @@ &spi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinmux_spi_spi>, <&pinmux_spi_cs1_cs>;
 
-	m25p80@0 {
+	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
index 5892bcf71595..db961d61cfde 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
@@ -60,7 +60,7 @@ &sdhci {
 &spi0 {
 	status = "okay";
 
-	m25p80@0 {
+	flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
index a7fce8de6147..224383a30ce3 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
@@ -44,7 +44,7 @@ &sdhci {
 &spi0 {
 	status = "okay";
 
-	m25p80@0 {
+	flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
-- 
2.32.0

