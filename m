Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19FBE748703
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jul 2023 16:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbjGEO5j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Jul 2023 10:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232679AbjGEO5f (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Jul 2023 10:57:35 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C037F1709
        for <linux-mips@vger.kernel.org>; Wed,  5 Jul 2023 07:57:30 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-991fe70f21bso797407566b.3
        for <linux-mips@vger.kernel.org>; Wed, 05 Jul 2023 07:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688569049; x=1691161049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=789u9c91pFti8cJwGAQPzp/R85GCMqUHG21do0+oMwg=;
        b=CTFBKFSIWMQyOPNmbt3u0xBlkAh8ou8ZsbvMdZZnhRyZprsX7oqq+Mm7s78B/3rv2V
         70GXc8VqO/Mv9kTgjOMrVNovw6xJxAjqgDpDWsELsL8cb6Zmc+qdpM7qH2p62gRlOxZ2
         wSgJXu8lCgPmzmPwPZhYrOBwPdda2kosuxJCB4awV5LGABx63/hH9cu9ky94KkYUxr45
         /pnhNLknBDAzBY21mMtU3iNv1++gVpxCHSuO8oqAMI9CWz6Sb6Vy8hF3OzpG2Yi5Qgws
         hBHp5Sez7FqC10dKwR2tV5aKFGEPQ8+PUGe0RHmhxAIcjSz0kKeYJT9gr7c81slbNVsT
         QzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688569049; x=1691161049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=789u9c91pFti8cJwGAQPzp/R85GCMqUHG21do0+oMwg=;
        b=kXsDgRh6cgw8Dr+iyJ9CTnt3vT6GQupou1czLf+r5uFmbrz1rNxzLpAN4N1LcEUkvP
         YA5CLxs/y7+zCiu7w/LH0YffDw99lZ/gQtODo4/fYDePotDDUjzdTqbbvOb4AN5qgcCw
         wX9cQTmAD2xPrPCqxRvZTAX8fTTsIJyX/d7zJgW6WTijT7Bsw9RAU6xL1nrNG2dm0uMn
         RFfSJkiTzxTObiGhR8M2GBZse9Ev8SZl/gDqJjP2HfONE66udf8AkwrEWlc41fAFjIhT
         wL+sq+9oLMCeC7XyNVk7slFTa8dSeM1FmWfK1FfDRDHAc7UWHkQhfWgZYG13MIhIm1E2
         fThg==
X-Gm-Message-State: AC+VfDyE99agOg30VnmqLJbPE2aAPtv9IryhklW0Un6hUrl43jU+N61T
        M2YVYLoSpue234GGvy+W35Nkss2WKXkE0mt9PyI=
X-Google-Smtp-Source: APBJJlFh1TukfZ8y/fwQrg+JNHoQUmfEZ11PCjSALi9NuxT6CA26M5cMpPioG5ROZoXNRZH2UVLq5Q==
X-Received: by 2002:a17:907:118d:b0:992:6d62:42e1 with SMTP id uz13-20020a170907118d00b009926d6242e1mr10775310ejb.29.1688569049164;
        Wed, 05 Jul 2023 07:57:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id v4-20020a170906180400b009920e9a3a73sm11000228eje.115.2023.07.05.07.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 07:57:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        UNGLinuxDriver@microchip.com, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] MIPS: dts: add missing space before {
Date:   Wed,  5 Jul 2023 16:57:24 +0200
Message-Id: <20230705145724.292793-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add missing whitespace between node name/label and opening {.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/mips/boot/dts/mscc/serval_common.dtsi | 2 +-
 arch/mips/boot/dts/pic32/pic32mzda.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/mscc/serval_common.dtsi b/arch/mips/boot/dts/mscc/serval_common.dtsi
index 0893de420e27..5dc1eac49e50 100644
--- a/arch/mips/boot/dts/mscc/serval_common.dtsi
+++ b/arch/mips/boot/dts/mscc/serval_common.dtsi
@@ -20,7 +20,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	i2c0_imux: i2c0-imux{
+	i2c0_imux: i2c0-imux {
 		compatible = "i2c-mux-pinctrl";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/mips/boot/dts/pic32/pic32mzda.dtsi b/arch/mips/boot/dts/pic32/pic32mzda.dtsi
index f1e3dad6bead..fdc721b414a8 100644
--- a/arch/mips/boot/dts/pic32/pic32mzda.dtsi
+++ b/arch/mips/boot/dts/pic32/pic32mzda.dtsi
@@ -75,7 +75,7 @@ evic: interrupt-controller@1f810000 {
 		microchip,external-irqs = <3 8 13 18 23>;
 	};
 
-	pic32_pinctrl: pinctrl@1f801400{
+	pic32_pinctrl: pinctrl@1f801400 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "microchip,pic32mzda-pinctrl";
-- 
2.34.1

