Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8134465F1
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 16:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbhKEPoz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 11:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231928AbhKEPoy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 11:44:54 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E49C061714;
        Fri,  5 Nov 2021 08:42:15 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id k2so9186134pff.11;
        Fri, 05 Nov 2021 08:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YfMuUPgTSkKVtweKxnjhP3J/8y+ffSmINL7aJBkm/mo=;
        b=XtFqEVpPbBJIB6AmRp/CbODV5dWdZ4PiKwRyIsa7vfbexAmy2Z9UdlHnj2Pk4YWr/k
         2Z6pF7hnSGoRHKlTuRDU4TysE6/5xV7bE9QbiMFPTlpeu9n+zza7t9WcbSsXSn8O/WWS
         PLJ4ofUTyWnw76zD+tgqhV9I37utGeTIcfUDnStstdZfesdERQAmSReCjVSkKPRCzbjG
         wdNyYi5HdRUKPi1bLmAzfUTqQlAPY0ejNSFF/3oKbDBgQNjPmlvQl6NEo46hf6IWGWyY
         Chp1ZdT7Wh2tMEAx/hGlJW+sgCr73IFQXJMaitWpjee1aCyP7N45UY7wx2bYfsZKDAkR
         e5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YfMuUPgTSkKVtweKxnjhP3J/8y+ffSmINL7aJBkm/mo=;
        b=QPePq/5evktQBHqJHF3MPRLDxFqIIaFnkNSMIs9CgumEfAZ+qaL3Luv4cydOhq8z92
         yhK1ymwXLCQ1OahMI5m8MhJZ8oOjY+sj7sdba4DlceaDxCanF4QuPh8YYoKRfb3jyC9Z
         AsSQVwx/+59WUnWyS1+nAXIdo0ZUHhxCnPV1S3YN+XmRKEKZ5jnDjAT1SxWVNk1DUjIw
         obC9D6APjxkHIGjP2nhCbKY83Qlu+BxN7v7JzzaoLuc/2a3j/S3jgvV6oNBN1v8dnGFb
         DKNcVGXesMYGGFTcKli+EakV39/MMNsXJqyD7Ei1tHCJsoK4IGxm5s8E6KLujsqsMaai
         7OuQ==
X-Gm-Message-State: AOAM530Q6MhP+qeATV96fycAcRE33QAq1j+Xhcrnq8k04HyBTNsHaEn2
        sxWfh+bkI0xhedmrjJkdXJQaDFqOunY=
X-Google-Smtp-Source: ABdhPJx2ewCOIj3UhxMUM5+yHqTrnC7jS3uV9/CW6F16yORyZQ5okBpauuqIef7JfJlri9rbmnawpA==
X-Received: by 2002:a63:9042:: with SMTP id a63mr32101221pge.345.1636126934223;
        Fri, 05 Nov 2021 08:42:14 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id b8sm7547097pfi.103.2021.11.05.08.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 08:42:13 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM BCM63XX ARM
        ARCHITECTURE), Justin Chen <justinpopo6@gmail.com>,
        linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-mips@vger.kernel.org (open list:MIPS),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM63XX
        ARM ARCHITECTURE)
Subject: [PATCH v4 1/7] dt-bindings: watchdog: convert Broadcom's WDT to the json-schema
Date:   Fri,  5 Nov 2021 08:42:02 -0700
Message-Id: <20211105154208.614260-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105154208.614260-1-f.fainelli@gmail.com>
References: <20211105154208.614260-1-f.fainelli@gmail.com>
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
2.25.1

