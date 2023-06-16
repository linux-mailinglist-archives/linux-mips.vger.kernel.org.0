Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C29CF732F15
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jun 2023 12:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbjFPKuT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Jun 2023 06:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345449AbjFPKtr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Jun 2023 06:49:47 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11AD4295B
        for <linux-mips@vger.kernel.org>; Fri, 16 Jun 2023 03:41:43 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f8c5d0b19dso4484815e9.1
        for <linux-mips@vger.kernel.org>; Fri, 16 Jun 2023 03:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686912053; x=1689504053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l7UUUCEiDOQDFLQBmgYOU/VRB87rfpeTkrh78SXewlQ=;
        b=YB7kBgIofaOVhvltAeI5pDi9y3XFJCzJ5Xl/Gq9D3rCU4rxSVLcD0mDvB/WVBq8KO9
         jGOpbuToVtd7gBUNw6hi2h8eDKM7mz7s1R+8EWEQbCyKJLME+B1tPJcvvFEBfl1E6xZi
         FS7T4ol+qnPtJDVHCllpw9hiozr+jWXQRnUB/syqyrvxNKx8+hwmYT6cOfw638kWlWD2
         BWrwt2d79+DYo7qDXOHtIsQDyLE0RU52Bt47SMYfTm/AlTqShmffPVK73NRpyauvdMOt
         8VqN2nXp16OZo7eeGpzxRnnCvoAGIAkKQoW3sbUtL86cHY4SlnNuDILjHAVvSS9UQtAI
         TdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686912053; x=1689504053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7UUUCEiDOQDFLQBmgYOU/VRB87rfpeTkrh78SXewlQ=;
        b=jEmbs55GtmrTvP2yn0qMEHCIcqtGRJr3IZHXV3GcRnQIwreR0yctlQBfLCOgL07RtM
         P1ZuPpfra+Sz/SNzqfgRb3nKA1omrrswXZ8HYHAtwQVcisBECO9L0rgsuPwPg8roe9Gd
         dM87cAwTmRrD/8C/3WmoNO7mu6uAM04j27XQq+5GjKuUtuVy2bNjRSaftCV96FjfVHnj
         QYV8KANWU6Qei2KI5RQ2/zhkJcm2/MB3JqY7cg3Ejm6mVXaOGhpJo0WlUgjR1YblyrY9
         cG79mbhqBlFONriSwquC0EWwLb6v7RnsRkq0XCb2KKbnc3lIBTVa+c/edMGVnEcf909k
         CmPw==
X-Gm-Message-State: AC+VfDw//p80aCl2TBcj8aF5k7wO5iIfoFonDLomsL8wEHmwowm3LVcq
        palAPBVyIFFLJ0a+abmB5g71HQb6gpt17bauSbU=
X-Google-Smtp-Source: ACHHUZ79+WHZQfcfy/frvys94Lo80cA+tl2FV9KD8MCaSKzol/5ipwbVMZ3T04P7GsrXRUhcD5vRDw==
X-Received: by 2002:a17:906:da8a:b0:96f:e45f:92e9 with SMTP id xh10-20020a170906da8a00b0096fe45f92e9mr1493906ejb.16.1686911495167;
        Fri, 16 Jun 2023 03:31:35 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id s20-20020a170906961400b009829d2e892csm2251098ejx.15.2023.06.16.03.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 03:31:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 1/2] stmmac: dwmac-loongson: drop useless check for compatible fallback
Date:   Fri, 16 Jun 2023 12:31:26 +0200
Message-Id: <20230616103127.285608-1-krzysztof.kozlowski@linaro.org>
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

Device binds to proper PCI ID (LOONGSON, 0x7a03), already listed in DTS,
so checking for some other compatible does not make sense.  It cannot be
bound to unsupported platform.

Drop useless, incorrect (space in between) and undocumented compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index a25c187d3185..900972521b59 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -59,11 +59,6 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 		return -ENODEV;
 	}
 
-	if (!of_device_is_compatible(np, "loongson, pci-gmac")) {
-		pr_info("dwmac_loongson_pci: Incompatible OF node\n");
-		return -ENODEV;
-	}
-
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
 	if (!plat)
 		return -ENOMEM;
-- 
2.34.1

