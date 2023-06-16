Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85BAC732F16
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jun 2023 12:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244275AbjFPKuj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Jun 2023 06:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244763AbjFPKuX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Jun 2023 06:50:23 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F8F55AC
        for <linux-mips@vger.kernel.org>; Fri, 16 Jun 2023 03:42:13 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f7368126a6so4227875e9.0
        for <linux-mips@vger.kernel.org>; Fri, 16 Jun 2023 03:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686912094; x=1689504094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaBTG2zxwhnxmGeWEEvsgJ1P9b9NURsoufZiPInkKEc=;
        b=fXSeEJuukMDErM3faMgJwNN/MXuzgrjHOXYggA+6jR8uajnSL/xJWlP0JVNOfQI+ow
         aHLZ4PWemWhQIGO5GTCv71qqRTrNVPO6dsZmy6NpbntXyFyyMWZtNPHrZhoSEvGFYo+V
         IvfzXxZvn2zy4EeVsBasSU00/oW79mSRwlP0F19/PMzLzgR+rgpk9HEIroTC8DurHaCs
         qnf2D4jg0wAMHPHZeM+R+fHVb954rNwI16pHEkAk7j3ZcdLBPATW8b2+VcFSauH3e5VO
         aRB7VoYhm3+DG9CJmQ4k77Ura9OlfE6GZYCX+V3wfFFkT4000OofjF5Syre7XihikRqZ
         mCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686912094; x=1689504094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kaBTG2zxwhnxmGeWEEvsgJ1P9b9NURsoufZiPInkKEc=;
        b=NHKNywP0t4U+JFS4QxTjduIUoo3WsrwlrdDXYSaVN9lkxbk+hjZL0zm+cVLZQjaqdV
         Whmz/FhjYMMWLBeGn4ew9/6E355PXc/tOHlYbZn+reXQoCzYW21sJIInbuh/YpEiDQ69
         p5x0sSgmzSvLIojugRm0HqcjbzBuKqd/QGwQ/JNy12FP+t7/7h28zx/fpuVX2wfuvqEM
         CyVa1V4UxSdZelRLEKeWMjNOEI+PC9UWkwQBrh1tgaIWjVARWnxZJj+uCO7SnECg5HVX
         aCknzTt6UvWsYr/JbSZzA6oN7tOYPK7tERsyOemA32aAUU0jfLP/3kfV4k4N6d62cFzu
         cKYw==
X-Gm-Message-State: AC+VfDw2E08QTPRl1wGcwnUmgHILq7m/4PPHn3ZvDBB3C6McAu0NwU4o
        2xloCyyz4AmvQ4sutYHDISxU32QIgI4C1M0FV64=
X-Google-Smtp-Source: ACHHUZ46d2PnNLTuBJzAtrPzWBhQyazG0ug3ioL29Qy1uIyi1v1EBT6OTUHZcgKN9qMGn18t6oaADg==
X-Received: by 2002:a17:907:6ea4:b0:978:94b1:25ac with SMTP id sh36-20020a1709076ea400b0097894b125acmr1625268ejc.40.1686911498060;
        Fri, 16 Jun 2023 03:31:38 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id s20-20020a170906961400b009829d2e892csm2251098ejx.15.2023.06.16.03.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 03:31:37 -0700 (PDT)
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
Subject: [RFT PATCH 2/2] MIPS: dts: loongson: drop incorrect dwmac fallback compatible
Date:   Fri, 16 Jun 2023 12:31:27 +0200
Message-Id: <20230616103127.285608-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616103127.285608-1-krzysztof.kozlowski@linaro.org>
References: <20230616103127.285608-1-krzysztof.kozlowski@linaro.org>
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

This patch depends on driver change, thus it should be accepted a
release after the driver is merged.
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 3 +--
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi          | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index 8143a61111e3..c16b521308cb 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -123,8 +123,7 @@ gmac@3,0 {
 				compatible = "pci0014,7a03.0",
 						   "pci0014,7a03",
 						   "pciclass0c0320",
-						   "pciclass0c03",
-						   "loongson, pci-gmac";
+						   "pciclass0c03";
 
 				reg = <0x1800 0x0 0x0 0x0 0x0>;
 				interrupts = <12 IRQ_TYPE_LEVEL_LOW>,
diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 2f45fce2cdc4..ed99ee316feb 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -186,8 +186,7 @@ gmac@3,0 {
 				compatible = "pci0014,7a03.0",
 						   "pci0014,7a03",
 						   "pciclass020000",
-						   "pciclass0200",
-						   "loongson, pci-gmac";
+						   "pciclass0200";
 
 				reg = <0x1800 0x0 0x0 0x0 0x0>;
 				interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.34.1

