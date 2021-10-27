Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B23943D612
	for <lists+linux-mips@lfdr.de>; Wed, 27 Oct 2021 23:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhJ0V6X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Oct 2021 17:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhJ0V6X (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Oct 2021 17:58:23 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2C8C061570;
        Wed, 27 Oct 2021 14:55:57 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id x27so9168100lfu.5;
        Wed, 27 Oct 2021 14:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tt+wfHCMjz3uOqGn4tVavyhp1tWCt+3SrSjBxRX1YW4=;
        b=Qkj3gbNfEJVwCiAjYORkk4V/p3T+joIwM9U8kAd8/gNjMp5v/sqH9KygyS+PCaTOOY
         WMl5KZwtie9sMVKxBGyufLxMIqJhado0J2G6BUmLcwdkY91bnq4dmI2DBZPFLXxLFTti
         5cVOOW94pawayN8+Phg0EsabNHaaQzpT7cOWCxe9hDXPZq2Dkn/45/iZA8YcOx4U5aNz
         WplXFCgzOxRy2OPiFDCy4v7LB0ks9hbvFy8cCNbDymU5U2h2ht0yXvGgIGfrMO9u1mrT
         fMliN4PYofqVJ2QCKl+vQg7mVrOD//0cWT7ZYseoYlMquk1ONavo+tEQfhKJ6Mb9dRbe
         PVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tt+wfHCMjz3uOqGn4tVavyhp1tWCt+3SrSjBxRX1YW4=;
        b=wBFcHXOItu8VvgyiBnWJP57dEr7vqXODfapPGB234XpJMlYqlw2MTRVDNdMn/h3GvW
         YuDx2qyR+dqcqqj/E5Rl5Mb0so4T4b4YZ/WHr8rEyZHnJ9L/twtrZtPe1gudzak4i7aH
         WNCA03LtDOUm3B32+fEiQtdSN5BxgI1cKgchEgCmMc/tc2fu8Vwf6uBleNaJvkngixXY
         Yxrcu7kV7CfxhfrVU0jisaX361EnATK0YAFQuywndRTg4IaFcB9C3tK/OtB6QNt0bdtg
         uLQL8LojLxFFSptIy7BRXtH46S4MUBH03YS+tE4gKzJrSNXH5dITMdd5Okj1c+PcTLLS
         CKQA==
X-Gm-Message-State: AOAM532DfOMKFT/nMEd8TgMUCcWK1RZOOfw4z6DollOUt202Eka/0cfg
        KPPrAAR2rmLdtDQ11aJ4djY=
X-Google-Smtp-Source: ABdhPJztyTXwzWwqTkX0J8jSHu5gUz8+pMzSYJskFYt7B0aNIm8AFNYPXvZNKY20lyQAGutz7fwdjQ==
X-Received: by 2002:a05:6512:324d:: with SMTP id c13mr240672lfr.349.1635371755801;
        Wed, 27 Oct 2021 14:55:55 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id g35sm110207lfv.248.2021.10.27.14.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 14:55:55 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/3] dt-bindings: watchdog: add Broadcom's BCM63xx watchdog
Date:   Wed, 27 Oct 2021 23:55:29 +0200
Message-Id: <20211027215531.9996-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

It's a block that can be found on old MIPS devices as well as on
relatively new BCM4908.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/watchdog/brcm,bcm63xx-wdt.yaml   | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml
new file mode 100644
index 000000000000..f89bdefdeb19
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/brcm,bcm63xx-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BCM63xx watchdog
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm3368-wdt
+      - brcm,bcm4908-wdt
+      - brcm,bcm6328-wdt
+      - brcm,bcm6338-wdt
+      - brcm,bcm6345-wdt
+      - brcm,bcm6348-wdt
+      - brcm,bcm6358-wdt
+      - brcm,bcm6362-wdt
+      - brcm,bcm6368-wdt
+      - brcm,bcm6838-wdt
+      - brcm,bcm6848-wdt
+      - brcm,bcm6858-wdt
+      - brcm,bcm60333-wdt
+      - brcm,bcm63138-wdt
+      - brcm,bcm63148-wdt
+      - brcm,bcm63268-wdt
+      - brcm,bcm63381-wdt
+      - brcm,bcm68360-wdt
+
+  reg:
+    maxItems: 1
+
+unevaluatedProperties: false
+
+required:
+  - reg
+
+examples:
+  - |
+    watchdog@ff800400 {
+      compatible = "brcm,bcm4908-wdt";
+      reg = <0xff800400 0x3c>;
+    };
-- 
2.31.1

