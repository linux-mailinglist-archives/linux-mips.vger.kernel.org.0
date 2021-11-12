Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A68044EF1C
	for <lists+linux-mips@lfdr.de>; Fri, 12 Nov 2021 23:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbhKLWRg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 17:17:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhKLWRg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Nov 2021 17:17:36 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03669C061766;
        Fri, 12 Nov 2021 14:14:45 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id u22so14381920lju.7;
        Fri, 12 Nov 2021 14:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xmTEhzdHehFTh2rOC5A4/85h3lppQ/OuyTKeK2Y6gpg=;
        b=NAtWk8j0VLJ95v6LcZaZ4NVQdq1DZusI07UgDJzg5khMwRypGFoyGXphBFvUdsP2Ym
         JiTSA2/3WdmcQnDJsHm4E3RqldsVgAU2AJiKMXQmX1GRQH68TO3iwK0F4vf5CtzV/OCI
         K0wKiHuiMr028pOUlwwzLbXqNOzRLPUkdshIdq+SkdWEvq8XGt9vnjXNay/Kas+P58wy
         ESRthfIm8P0jH+rCteQVZDpk+JjdFsu8MBg0L52nmVndjCR+IJeLKV2KLnlfMK9acQFg
         XPgWZsVA2xnro40Jn43niiqxfkgM0+ALZbebrIk+imrVL3QjtM0XFW7ep0NdyJj7ODlA
         Q6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xmTEhzdHehFTh2rOC5A4/85h3lppQ/OuyTKeK2Y6gpg=;
        b=g5LSoJUy4GiPzS1kjhLdXs818r290ZOlDtGvGAWHM9YDQfSUN/mw3NlYONqoR6C8ac
         sRW013AB9pSXV71pRwXXVnfIJ7jXJX0FsPwKvMr3aqMTMMpGfBBpB9Cd/om22ivd+X7j
         38+HIUCsh9FD7QWDxqIjfW1Kz5ABaZrrU6pzVi+6csIIsfUYYeTWCqYSJ/MxEmEcXiaj
         anBkqItX+UiGBaPYzlOQS4lPxV9AM+RpQGhDtMKkMDuhyGhwxy03Uo70R/JYJWSH1dRz
         RvDe12xynkcf6nBjoOILNyRnVcJP/uIiOZeN5YfyDh9PUYj0092guY99clocH47wDhr0
         hlig==
X-Gm-Message-State: AOAM5308uzW8jRhUWqMKdx9/XxOwwCIaNcfOaqBiSCMng361wzSUUzlD
        jxn8+6CDxvOI9kwbtZZCNMY=
X-Google-Smtp-Source: ABdhPJx03w631kSQzSJha6yE2qu0BPqpA3mOCava/15g/CCSqqu/TIdGoN5xO4/QxNawim0U9+ZVEw==
X-Received: by 2002:a05:651c:a11:: with SMTP id k17mr18213730ljq.243.1636755281856;
        Fri, 12 Nov 2021 14:14:41 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id e5sm680536lfs.51.2021.11.12.14.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:14:41 -0800 (PST)
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
Subject: [PATCH V3 1/2] dt-bindings: watchdog: convert Broadcom's WDT to the json-schema
Date:   Fri, 12 Nov 2021 23:14:21 +0100
Message-Id: <20211112221422.13735-1-zajec5@gmail.com>
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

