Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6EE844F2DB
	for <lists+linux-mips@lfdr.de>; Sat, 13 Nov 2021 12:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235377AbhKMLtz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Nov 2021 06:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232651AbhKMLtx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Nov 2021 06:49:53 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3305EC061766;
        Sat, 13 Nov 2021 03:47:01 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id z8so23837144ljz.9;
        Sat, 13 Nov 2021 03:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7KkUIV1LwFCMjUl/KiUeHScGU6JLrELrF5Hve79Ozkg=;
        b=Tiq/Vq0YRfm7QAGYOD6YtRdJihK9+CoePNBVXFNNVxfaUpqEnlEG4OspmsyVUoVy/o
         vTroDEKfVz9f+pZ2V8CKrQrI3o/qV9fg2tZNAuDf3/t9xz7xDcJYq0hFBA0VJFCh2Fm4
         Gbh/Tx/ya+rWtbO+OwBBOMTtfKeVJxq0FTtoRnhTtTuJooexTFfafVmp2/co3tIFrW74
         YjBDimlBPxrdjQPwhiTSvGVsBXEUx7QDCFnKXbCEQBvHD1fpH/TLyhsw0D/bCbQ5Qeo+
         xaYYzpumSwwIWhtJ4mDAh4AKkphCyIQHyVg4IeXZB+dmn+9pU1zTJTsh2ilGUUOvc6IY
         mA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7KkUIV1LwFCMjUl/KiUeHScGU6JLrELrF5Hve79Ozkg=;
        b=GWzhtlCSCXxz45UI0736D3Q1ScDWVNEH1rAi3fw3tc4LD5mqdnpyhi82qSUjIZtL6f
         b9tVm5886fG8oLAtw/kcdLTKfxMproN20AWOX/kSMuf9rEbT2nsEcNKOZRT4YkqF3C+s
         aZPnjNK+9wpqQYk3cVHFkeDXBGu46zOWxSbFxZ1xNBM4uIGoEWs+CLeFZmoMhQnMHg+S
         TP/fwv4Xiz4uyd6QKja1B1ZDiIcRUNBDrcVyM8C0MIriS3AkePwvICxzFICLwsVHkvzX
         rvdUZo84ZP2SRKO5/jw8oN9nX1zNNv/zCRHRUs/TX33jmXxpbgWseWCpafBnYrPGnitg
         RyDw==
X-Gm-Message-State: AOAM530PNG/x2Dn0lFQf+zsFaKbCKj8V3uiL8VLTG4piSvmRvp5v9RNf
        HpQZunkzgWGAup5hzEvBcQM=
X-Google-Smtp-Source: ABdhPJxDvsFT7jq2E3FeQ+QBy8tzZ3rJlzya8Tm+RUV+xahNrNmGKPkDEZaWcBeAiVVGeCMKMpNj5w==
X-Received: by 2002:a2e:890d:: with SMTP id d13mr22127238lji.396.1636804019397;
        Sat, 13 Nov 2021 03:46:59 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id m8sm941676lfg.140.2021.11.13.03.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 03:46:58 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH V4 1/2] dt-bindings: watchdog: convert Broadcom's WDT to the json-schema
Date:   Sat, 13 Nov 2021 12:46:44 +0100
Message-Id: <20211113114645.27360-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS files.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
V2: Use valid $id
V3: Add "clocks" maxItems and include Rob's Reviewed-by
---
 .../bindings/watchdog/brcm,bcm7038-wdt.txt    | 19 ---------
 .../bindings/watchdog/brcm,bcm7038-wdt.yaml   | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml

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
diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
new file mode 100644
index 000000000000..ed6210666ead
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BCM7038 watchdog timer
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+maintainers:
+  - Florian Fainelli <f.fainelli@gmail.com>
+  - Justin Chen <justinpopo6@gmail.com>
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
+    maxItems: 1
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
-- 
2.31.1

