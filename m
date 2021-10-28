Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C455C43DDC2
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 11:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhJ1Jdi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 05:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJ1Jdi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 05:33:38 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0643C061570;
        Thu, 28 Oct 2021 02:31:11 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id b32so9051958lfv.0;
        Thu, 28 Oct 2021 02:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GJtTeFua6lj9e76ebkvIivdZ4sX1YjABoZmJlmyJ+/0=;
        b=nDe/JuovQzaDd3onwK8nvQ84ElOBguBnuH3PSYdw1Ybt/WiMzcd7yP7PZgdonxWMWa
         uf0rA5R7FfsG1dIbzHw9s7jxcnvhCl8opEmCRoyPfo6PMXift0fN/L6LCHRfXhTU1RV+
         R8jaPLf2oBLtMpFMj83oa/0w5QQ6dCF+ecrPOirFrLJIsokKMX8isphE/ecYn+i+BRf8
         RbuHPU+e/Dc+IWRXUXBUMQFKekBFcc9Q42WpWRUQzL3PsgigVmONn2YISA5b02Kg7s/N
         FY0i4pGzEO0IKq+Cgwj0L3bZuF45hQu/1EOGucChLVk7eiuL155AaDakwVx4DNrLznng
         cY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GJtTeFua6lj9e76ebkvIivdZ4sX1YjABoZmJlmyJ+/0=;
        b=VgLrPDjMa/W+lcyGe9FETF9bJclPKiyOuCma2f50srZJEY+uIF9aZC8/mMhCeiFQvq
         rS8RZo5JZsO4pE/4LYcet80lOF63pFtIxRXv7C5Rc9ZUWqcq084v7n3StGlulCdU2BNg
         nmwMD9D4iUq9Uvs5DMK/CN41ZelHIDp90LktL0bBauJC/iQ6jdpa8GLtWPbnFEcn3j+/
         5GQHCYMM0ocKF3BusZCp9m8Jlh1M5AsHFsP/+U09qhGhvSxc5NeyAIK0YaNGa0ltl8zb
         QZkeuIwyJo0gf3egPlIEQON9isSnOpH4Hp3Vp+Y5pXzTLsCMdTXwRZ60NQY/EoCKmBM9
         +NPA==
X-Gm-Message-State: AOAM532aeOx3xJyvoIh0zgTdgW/aqcvy1N4/0E8IFP79LyuF+heDl6aH
        7Siznm7GKftGkBnl3E+d+qA=
X-Google-Smtp-Source: ABdhPJwD/Nmz+HPNfdTuek7uwHRScDFKgOUBd0NBJdoD1GL1DnpA/2l4Mi5CwPF4XTuDQu2bB8/peA==
X-Received: by 2002:a05:6512:260e:: with SMTP id bt14mr3078320lfb.129.1635413470075;
        Thu, 28 Oct 2021 02:31:10 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id o26sm231548ljg.92.2021.10.28.02.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 02:31:09 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/3] dt-bindings: watchdog: convert Broadcom's WDT to the json-schema
Date:   Thu, 28 Oct 2021 11:30:57 +0200
Message-Id: <20211028093059.32535-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS files. While at it also rename it to bcm63xx.
It's the first SoC with that hardware block and it's a naming schema
used for other Broadcom blocks. It's common for some (originally)
bcm63xx blocks to be reused in newer SoCs (like 7038 or 4908).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/watchdog/brcm,bcm63xx-wdt.yaml   | 38 +++++++++++++++++++
 .../bindings/watchdog/brcm,bcm7038-wdt.txt    | 19 ----------
 2 files changed, 38 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml
new file mode 100644
index 000000000000..9d468026550f
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/brcm,bcm63xx-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BCM63xx watchdog timer
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+properties:
+  compatible:
+    const: brcm,bcm7038-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: >
+      The clock running the watchdog. If no clock is found the driver will
+      default to 27000000 Hz.
+
+unevaluatedProperties: false
+
+required:
+  - reg
+
+examples:
+  - |
+    watchdog@f040a7e8 {
+      compatible = "brcm,bcm7038-wdt";
+      reg = <0xf040a7e8 0x16>;
+      clocks = <&upg_fixed>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
deleted file mode 100644
index 84122270be8f..000000000000
--- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-BCM7038 Watchdog timer
-
-Required properties:
-
-- compatible : should be "brcm,bcm7038-wdt"
-- reg : Specifies base physical address and size of the registers.
-
-Optional properties:
-
-- clocks: The clock running the watchdog. If no clock is found the
-	  driver will default to 27000000 Hz.
-
-Example:
-
-watchdog@f040a7e8 {
-	compatible = "brcm,bcm7038-wdt";
-	clocks = <&upg_fixed>;
-	reg = <0xf040a7e8 0x16>;
-};
-- 
2.31.1

