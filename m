Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9C744FE79
	for <lists+linux-mips@lfdr.de>; Mon, 15 Nov 2021 06:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhKOF5S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Nov 2021 00:57:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbhKOF5I (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Nov 2021 00:57:08 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400DCC061746;
        Sun, 14 Nov 2021 21:54:09 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 1so33060356ljv.2;
        Sun, 14 Nov 2021 21:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8qflnB7MYgfziBXsT+LtjTucbsoWLob914EY3p4OTsQ=;
        b=K+ISysR7l4RTt12UPbkyLNCunsqekRgtKdrbxcG72ND5Uqvd/bVx8YI+spx3ccPa3+
         cnBCAk/Z0ZVY1XkesS5Fm3Jy6/Ey7n+XsXxYtqqCx3RkKf5XqETAcA3nTqvUGyPcdII8
         07w6fXgUewxdWbBezCFEVk+o9Dv/H0GhXH2tAWORwu1Sg7m75OWs9N0udMT2+XDMgYQa
         9S07cYCS0SXawTtmZXZFUkrPXzSdiFFayOycnuTNlMyV65oDHQghrN8G0RlUYq5NNaCH
         srPK7M8dSunw+8e5FzmE3B+rOf/PoRTXHMfxk5gO6sQLrRw/D/b+M91yZTuocf3ntSFl
         IjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8qflnB7MYgfziBXsT+LtjTucbsoWLob914EY3p4OTsQ=;
        b=IqVJ86OPQI6EnF4dBw9c9K6kL5NGZtNtlasTCGSTYr3K7hyLGbdKyVx2hqCBH8DUAH
         +Fmxezz7fePMWV8LEH4CaU99BEi+bR50zRlzPl6sUTub5mPwhQ5QkQH5N2Qbz2JkUznm
         QQ+oG80krbD85wYWJ7xu15O9Ah0H3JxMkFnSxlpTC7yYN/M2c2bysFdbkzEi3vrEHEfb
         eXxAxDQSCM0Nx0ulzWhlnkKo3Tpr4vs1kx7TM/aETQk95uirj3hGfK6Y+rn/1Q3nuAD3
         1ezxN0U8fXwNTnW+kZUDeDgSIQMmpQF8OfTD4PR3JsTRd02qF21gQXRoYikhfFTu+pPU
         QEEg==
X-Gm-Message-State: AOAM533pnKE/mqFZo6WmkIrM+hY0zoLh9OItN0vyqNqnp3IrjhyWIJqY
        QseZLZn1hjWJQJKei2s1gV7aLTtiTrU=
X-Google-Smtp-Source: ABdhPJyZaHVXNgDAuGbMz7OLoG2mleARlbDaV7o3MGSGjKAWPeHcioFgyl4hXtX9R5+er/99PjoKig==
X-Received: by 2002:a2e:4952:: with SMTP id b18mr36117251ljd.352.1636955645266;
        Sun, 14 Nov 2021 21:54:05 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id i13sm1308668lfb.45.2021.11.14.21.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 21:54:04 -0800 (PST)
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
Subject: [PATCH V4 RESEND 1/2] dt-bindings: watchdog: convert Broadcom's WDT to the json-schema
Date:   Mon, 15 Nov 2021 06:53:53 +0100
Message-Id: <20211115055354.6089-1-zajec5@gmail.com>
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
V4: Add "clocks" maxItems and include Rob's Reviewed-by
RESEND: Patchwork lost 1/2, marc.info lost 2/2
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

