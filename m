Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53ACF4432B7
	for <lists+linux-mips@lfdr.de>; Tue,  2 Nov 2021 17:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbhKBQcv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Nov 2021 12:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234799AbhKBQKF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Nov 2021 12:10:05 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73447C0613B9;
        Tue,  2 Nov 2021 09:06:23 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bq11so43934148lfb.10;
        Tue, 02 Nov 2021 09:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xmTEhzdHehFTh2rOC5A4/85h3lppQ/OuyTKeK2Y6gpg=;
        b=jbSdoRSnZpJpb1xMwfliQYqi6BWpzh3/POXa3M5Jp44Zr4DPvR4+7wbPW2cUwEdqDd
         tU5b4TRmU8xO5NVWglio3BZBKYWo87hqPMpHAI/D7JgWrX5E/G1du7NHNineE1KbWr/n
         pIgCY5KXOasUP5DvhiUpdUbuHerH5oxqa2Ivtr6fSK1zumgIh5PflpgfH8vD+DiVH8/L
         ppFYakoo+2aLolP4cB8AJZ3t305QyCVbksqOTuvJCeSJKhhCtAAWr/N3Xq2bVWOJ+FjS
         3+WHaZPF0NhI3wnWfMeuCFspvL7v+WMQEKwQGiNemLp8YlBI2jUorw9hZRNFY9h8SAL/
         AoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xmTEhzdHehFTh2rOC5A4/85h3lppQ/OuyTKeK2Y6gpg=;
        b=DFkUhkL9jcKtHA+uZ1qVlSqAjDiLncUBgnpq5kx2jd/8jTCR7kX8QWbXUzcAM5sdEb
         6qzZk2WqumSUfUePpcMPapZSDUkT3ffXV0D8oDiHZ2wTNx1aSrrNDo229gYaCeK+L9fD
         QGkTWZvLO5vFQbzmnjB6Wy+1Y5w/GadOF58glxMmxcqKggIUG0X4XrQm2e+sKNhha3d3
         BUtqlOqykYok/wAl8knuuVGWb04YWwTEmP4PUVWtJeaHrQvS1wC/jgFo3YyU6Z2UVwff
         L1WQlsbAtrp+egKqn9ypzO1WpG7BGLV7av2H1g38PaK1NL2OxLKyoIyrPQjAbcwRMVK9
         se+w==
X-Gm-Message-State: AOAM530ZApdRCar4dUYJSExdC5NqvjOO6x6zfzR9hZLicfmkKbaZKbVt
        7jTZXy+ZTUgbApWg0uiP4ZY=
X-Google-Smtp-Source: ABdhPJwN3SfVNJzWLHd2NoXaXIsz6B3j4SquFe0BqjmcyzICL+jbvu0vWMByQvIqdObcheKvoz06jg==
X-Received: by 2002:a05:6512:aca:: with SMTP id n10mr6248506lfu.352.1635869181799;
        Tue, 02 Nov 2021 09:06:21 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t6sm1798895lji.109.2021.11.02.09.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:06:21 -0700 (PDT)
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
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/2] dt-bindings: watchdog: convert Broadcom's WDT to the json-schema
Date:   Tue,  2 Nov 2021 17:06:14 +0100
Message-Id: <20211102160615.14672-1-zajec5@gmail.com>
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
---
V2: Use valid $id
---
 .../bindings/watchdog/brcm,bcm7038-wdt.txt    | 19 ---------
 .../bindings/watchdog/brcm,bcm7038-wdt.yaml   | 40 +++++++++++++++++++
 2 files changed, 40 insertions(+), 19 deletions(-)
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
index 000000000000..53a3245a6193
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
@@ -0,0 +1,40 @@
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

