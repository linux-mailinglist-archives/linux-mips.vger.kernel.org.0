Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8DD440401
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 22:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhJ2U1j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 16:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhJ2U1i (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 16:27:38 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A567AC061570;
        Fri, 29 Oct 2021 13:25:09 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id u5so18674405ljo.8;
        Fri, 29 Oct 2021 13:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uwSQ5O46XQWq/lDnechLXeMde+M4E9bl0BI41ywS9so=;
        b=qFHa+Y0nq19Wnz1rYDkGGnQ7CPH8tO2/O/fq8Kwcy7a/S7ublc/0U1PsykHPMEjRBV
         mJCZop8bzU6RGKjK7x686hQZBcHhBAehEraBgbAtnzqyGJ0stJ2QZm6ayAXA7lqRUJrn
         v4QWRBaHpRadOFfU3eyb6qfRMzYoXEQVQ8U+rAoiCXo3y/q2IzhivXi4Ds9yXi/3sst0
         ozqUaeT4xVto5IVVligZHVrxdkcRDXX3+WgYrdY86uJ8Fdt9rNkpw3CcSNxjXCAr+Kay
         SZo4eQOQkHbsn2rPmP9MHtcsENy6zxtxT+izm2LtibT304gStT13ERDGAqRR5oY24s5Y
         sC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uwSQ5O46XQWq/lDnechLXeMde+M4E9bl0BI41ywS9so=;
        b=NwyJh03Jmv8VLvqwNMchp8gI6pRHmYugwu9q3xlr0ciLkeoRBV9o+DlYxfs8+9d7iA
         akNAZIhja7UoV6Pd/VZn3C1J7+ROknS47YWwY8aCuEumuDoNDNTbESRL8T+6cbTvd6ma
         +FDVhRcGATkwEv36znBjY/PdXWsP+ZlBc9ji7X/m7ENoqsNGcxZQxRxaKTM93JjTO/qk
         uRCT1DoqxkfJUXtB8s2jrt8Qlz6EA/4VblqvKQlTlSR4kwVkPvAIOnYRj3BE1lu1TF9s
         kA45BEujRzNYJkeLGZmBnUR7MStF51y0lo2MgQjmLM/YlJGMsYbaNSesWT+Wqa9s9WPN
         QFhw==
X-Gm-Message-State: AOAM530zPc8ZziO4VQZKYxiM2CEk5Xue4TxseuzsjCt2LfIOy7FTQXi/
        UCq49EPa+MB3k5QnxcJNBC0=
X-Google-Smtp-Source: ABdhPJwM7qQIaQzjKAfq7HyW7IxgXBps3wCGWHUVtI6GyptFa1yoEs+L5X/1tC8iQmGC3lWoaniORA==
X-Received: by 2002:a05:651c:510:: with SMTP id o16mr14152214ljp.359.1635539107957;
        Fri, 29 Oct 2021 13:25:07 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id c19sm692715lfv.225.2021.10.29.13.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 13:25:07 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: watchdog: convert Broadcom's WDT to the json-schema
Date:   Fri, 29 Oct 2021 22:25:04 +0200
Message-Id: <20211029202505.7106-1-zajec5@gmail.com>
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

