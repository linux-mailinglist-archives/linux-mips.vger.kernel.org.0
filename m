Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11AC443FEE2
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 17:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbhJ2PDy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 11:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbhJ2PDy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 11:03:54 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B506C061570;
        Fri, 29 Oct 2021 08:01:25 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id c28so21527242lfv.13;
        Fri, 29 Oct 2021 08:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EIMZ7pbSFB4v6PfIZ9phtnUvHe3NBf2JaKS4zkLAeYk=;
        b=PmRCir877CmYrnGpp7JJOnwVJrrB2MVpKB1X5QDJkhPzKsHbApM/QhNMkUEXe6kJVq
         604s0kSdPuBBOKjp8Mq43bczETrjUugeShs7zLzYG894BsDUMWReiKADs/xMM5Tee+lr
         dtChxFNoCPGHupGxKJmSFumnB3ervj3Eze4CyukaCLn7nFyWmH7GHKHQWec2IAUrow0c
         s+U/Evjn7Tkpk0ee2hQXgZcN5RJb9LnvFtzU31seFC8gt/M9ernV/PmgnzZxznnTKoCB
         1s5JPzaNGgTClOOr0wgrXIxl0od2mcXgpLUaqM4DD6Ue6PdDZ493wZqBrvEvLK+s/F36
         L+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EIMZ7pbSFB4v6PfIZ9phtnUvHe3NBf2JaKS4zkLAeYk=;
        b=0oy806fNHR0x5ynYcHvRhzBhRad8uk7lyjNjRWxt5FXHvo0cVRVgz+b9TZ+wObr+bQ
         pLR9fc8kdJsRYwpRDffN58DZg4mI4zkVfPOqjFhJEj7yBByw3MiLJEgc5id49x5elZWq
         8gaggSxz2MEzy9cMnXPjsJ/R843TMWo5cC7edR37e4x0pk3w8pT5/+1codu+Npi93LNE
         U5HZlFBxliQRlMwChVPemvF3E9Sr8kEKH9nDzFjZHPygPZLH9MOwDJ/0tmnP6rCxV/Ok
         bMZP39cgqaBaVAeelxQ+VJKz3JeXdQ+3bl4uT4tqM7XZR4Mk3xGa5yNbocNRfvta/jr2
         Wpcw==
X-Gm-Message-State: AOAM5334Eya0nPAbLSlr652Mr7zYAaF2BP4iFIaXH5P/PAviCinOxUEM
        JnoodYGiplGnnf/zCmNs7ro=
X-Google-Smtp-Source: ABdhPJxuH8Hus+kWGh9Ip1HJ0R5uZgd0JzbwBTrjSlXXw7zQ2P/NUMlv8JTd5gY53aQKRH91ke0IRQ==
X-Received: by 2002:a05:6512:22cb:: with SMTP id g11mr10856273lfu.417.1635519682183;
        Fri, 29 Oct 2021 08:01:22 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id s13sm90358ljo.56.2021.10.29.08.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 08:01:21 -0700 (PDT)
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
Subject: [PATCH V2 1/3] dt-bindings: watchdog: convert Broadcom's WDT to the json-schema
Date:   Fri, 29 Oct 2021 17:00:49 +0200
Message-Id: <20211029150051.3955-1-zajec5@gmail.com>
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
---
V2: Don't rename to bcm63xx
    Add driver authors as maintainers
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
index 000000000000..69e5a1ef6a1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/brcm,bcm63xx-wdt.yaml#
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

