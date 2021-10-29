Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA81440204
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 20:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbhJ2ShK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 14:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbhJ2ShG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 14:37:06 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E02BC06120C;
        Fri, 29 Oct 2021 11:34:36 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id m21so10627934pgu.13;
        Fri, 29 Oct 2021 11:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x8MeLTK/d7GnlqXrAXWg0WParJO9OxcW6hqMxpYGMbg=;
        b=EP+8z/W9sU3u+MHqTlHda7Wtm68iwTwyQcuSW6BAJvPFRJESNT8mn54GHkgaBfzeqV
         A/9X9qoZp5zpMNgOgZK9bfFwZKjvyQ9vwzduHepz33m6haFDNw+pPdkOrST2n1wQbGeV
         nflqibu+Bgh25jC4u07LF25IP9irXitcz9PN+jfle5xQGUABx2nn8xV0C9XIJBVA1eGM
         cspUJTcGeH8RwdIOrwb4jm92PLd3aeq/S0sNIIlO2Fl1rL54rVorBTI6LkcWk2C6GTfz
         7kV65H3IL+TuIeMemvA2lQ3Pu18g3VGGzs/wN1Alu0I8W/8GSxEw3wr9OeHCtlofBREr
         NJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x8MeLTK/d7GnlqXrAXWg0WParJO9OxcW6hqMxpYGMbg=;
        b=e6XcCdahUbnU3VXtbwHeaIuft0zowCCHysHfxHLrYj30fCnEDpGz0XR1L1ok1yLQnE
         MgTqJ+0z4wJfRybvD0ot6XCxdDo35JZhsWwG2mn1JiRaymfh4s4GmwindQUproESGcW9
         1PRwAV2Y/Hj4wrd+b4nCAqkGrn+sY0PLHSADxOd8LsjmHRO0pdsU5WoVhsKJrnoauun1
         xN82wqBChENlauKM4NWP3MSjY9C5/NWulqWcE/X8w0kpDUhU+CkTMs3aIJn3Wp4dypZM
         N5c7PvKFTyORoizButqMjqxAwqGDPj79eTyFRZatyoV1ZLRLqj7cNQSG32JY9WzL5pvS
         QOWw==
X-Gm-Message-State: AOAM533bMAzDA+ykU2zM9RqXNQhItVfFoguywnbIbvNLZIlP8Azo2MA4
        pGOrEgyxL8KXueibntu8axTWvC0wOq4=
X-Google-Smtp-Source: ABdhPJwtN3rJYgxyv38V2DnuBEWKAl/IrMtV8We+wQG01E+R6w0948bihyxE5OuhWKgieW/YTHjGUw==
X-Received: by 2002:a62:e707:0:b0:47b:e32f:8538 with SMTP id s7-20020a62e707000000b0047be32f8538mr12335462pfh.69.1635532475148;
        Fri, 29 Oct 2021 11:34:35 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j15sm7730868pfh.35.2021.10.29.11.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 11:34:34 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     rafal@milecki.pl, Florian Fainelli <f.fainelli@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM BCM63XX ARM
        ARCHITECTURE), Justin Chen <justinpopo6@gmail.com>,
        linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-mips@vger.kernel.org (open list:MIPS),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM63XX
        ARM ARCHITECTURE)
Subject: [PATCH v2 1/7] dt-bindings: watchdog: convert Broadcom's WDT to the json-schema
Date:   Fri, 29 Oct 2021 11:34:24 -0700
Message-Id: <20211029183430.4086765-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029183430.4086765-1-f.fainelli@gmail.com>
References: <20211029183430.4086765-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS files.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../bindings/watchdog/brcm,bcm7038-wdt.txt    | 19 ---------
 .../bindings/watchdog/brcm,bcm7038-wdt.yaml   | 39 +++++++++++++++++++
 2 files changed, 39 insertions(+), 19 deletions(-)
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
index 000000000000..bbf2e91f9db7
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
@@ -0,0 +1,39 @@
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
+  - Justin Chen <justinpopo6@gmail.com>
+  - Florian Fainelli <f.fainelli@gmail.com>
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
2.25.1

