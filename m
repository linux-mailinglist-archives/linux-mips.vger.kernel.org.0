Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6869243E722
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 19:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbhJ1RZz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 13:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbhJ1RZy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 13:25:54 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D09C061570;
        Thu, 28 Oct 2021 10:23:27 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id t21so4910579plr.6;
        Thu, 28 Oct 2021 10:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x8MeLTK/d7GnlqXrAXWg0WParJO9OxcW6hqMxpYGMbg=;
        b=JYxIcBak34+NRDBt5juEYvl8MFYDTInq9yD7soilY3uwsY8bmuXTqFwfbY18uBQ7e7
         /p0yoQJvQ9i6ND1LDVSDH/iqx3b7d9AeaEaj3QfiXAhJ2DLZQiThppq6BZq8Y9Gb+7i7
         p7vuFdbgIKgOXRoy8HN1+XlXKJkG/3ND8S+QgROFC5h2rXxWKL2wMcmgZpOLmq6zSRgD
         ZE2qgElakFsSAOz3lVG+NCG5iwakBlWhKth5Qs80QQ+GkDEbHZItG7YRzHsJJgwWwAyj
         6KLjo1KNqsybiOLvPKpXacKcGoLy+z6NX/jrAeGRYYKJVQlBFYmnPIukyxVxgW3yJH9M
         Lnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x8MeLTK/d7GnlqXrAXWg0WParJO9OxcW6hqMxpYGMbg=;
        b=J0Z9Owm/k6Zba4t+xQvbBQxCi0g4mImSYNQ/2Pzu9VVtXLhlILZlNOCsq94yr/jYqW
         PECc6+w1fRg4/0eaidmQ/k7cChKn6eK/3WJ+5dXO5NzY/esBzabI4ubbr37wIDJZsi0j
         7SzX6xkjKWqvGIQKXi/IwEa9rpjkO7RDy0dJw+cktzJLETbwJaK1d8Onekm+YJJCAPQv
         6+Ges6I0gFZq+J7z2LCVC01PjZliOJLgI9IqwT4H5JAWdwGDfJGqO3/9rx/C0UuCO+JX
         zx6MI88xdS/FKZLGmuMBgh/Z5jwbaVdZXsHrT12eF32Zbg7nyKBJxbi3x4EWuq+9oAda
         /eyw==
X-Gm-Message-State: AOAM533FLgWE6jS6HeA7Rswl7TQp7ROAkchVUr919kwWIkTvLzun7r/C
        XTz2O68VzO3AY0RFuhywg/ttFoyJdr8=
X-Google-Smtp-Source: ABdhPJyUqHQc1HMwqDJnlGFYUcR71rU8gP4ior0r7LOdKERIHcGUtj/gvNNMbnPHBwJ/EoJotkIoog==
X-Received: by 2002:a17:90b:380a:: with SMTP id mq10mr14091490pjb.182.1635441806503;
        Thu, 28 Oct 2021 10:23:26 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id l20sm3222499pgo.67.2021.10.28.10.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 10:23:25 -0700 (PDT)
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
Subject: [PATCH 1/7] dt-bindings: watchdog: convert Broadcom's WDT to the json-schema
Date:   Thu, 28 Oct 2021 10:23:16 -0700
Message-Id: <20211028172322.4021440-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028172322.4021440-1-f.fainelli@gmail.com>
References: <20211028172322.4021440-1-f.fainelli@gmail.com>
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

