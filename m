Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72439444B4D
	for <lists+linux-mips@lfdr.de>; Thu,  4 Nov 2021 00:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhKCXQ4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Nov 2021 19:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbhKCXQy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Nov 2021 19:16:54 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D778C061714;
        Wed,  3 Nov 2021 16:14:18 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id g11so3942478pfv.7;
        Wed, 03 Nov 2021 16:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GQbUuqqzIBcZH9+H5Tk/WXcUevcK7q2Ku4w0/2122MA=;
        b=WNxfcHo9IrfclXZJWB8HuQKEacDw8R3U/OUFe9YeL7OMSfnktTI4GfH+tRxOqahNkF
         he4sAyF4hFG2H0vOY8M6tdyG+JII4tGFrD27/34xjhEu2fO6vzRSlOaULTETXkcb3hp6
         Uv3ypo9gQknmSpr8y2DAVXI1642AHJ+CNlL9ObiyuLCZBIO7+TtiX7UD/fuN9pwwQruU
         owBftbXWFUsAwM9RooOWLFDXUjGMxQKURSUHuRClSk6o7E9WHj5rRKCBOKR3FE65Kohs
         2ZW1HgcG4GaSZV/bBMwZ7pxolmNHWxuRIRqo7+4jwgbdTIO3w4AOh8BmJSIXye8kHG96
         vUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GQbUuqqzIBcZH9+H5Tk/WXcUevcK7q2Ku4w0/2122MA=;
        b=QAsyGnwpXaW9DlqukS8/mIowlYOUz8I22DmNOBuMkUSbNJ5EEVxD1FeRWwUFCuoaVT
         9SrxEh3fRqSsPvwGyjjwdSUqCqOszHp8w/a5FaujfwxrlUoYNu9jJszlVKfj+QRzH0QL
         S75bxdBsWIJfWt1oXzO9fZuGm8AHZSjavxlfbXc7ZgVHnTge1enerngIl43ri3x3EvZL
         gjrjd87fwjqK0Yvhk7/ijWlibK1z1okeklCm2NJ1EHtBIcylfco6SbcUnl8V09gg12C0
         TTEo0CYHDbr5JVq77lSwTkdZmM/EjPQvg83hG37Z+m/HUJJ1RIXQSJB60pv2BBzBj13q
         r4zg==
X-Gm-Message-State: AOAM531/U8G0NPmUrgPF+fM4IFvaqOIxjHNitP6ZIxoMSXU1hPXu66sb
        MXNDKz/IPQ9ewvjERIjYnkh2Dr1Dapw=
X-Google-Smtp-Source: ABdhPJzTCocXCAk/Kwart0ynFiG4172jybWWbdGW9UsWlCC12/9zh4r+ojE8S1CVBTA8czewgVks4w==
X-Received: by 2002:a05:6a00:1995:b0:47c:1f59:a27a with SMTP id d21-20020a056a00199500b0047c1f59a27amr48155914pfl.36.1635981257334;
        Wed, 03 Nov 2021 16:14:17 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id p7sm2613549pgn.52.2021.11.03.16.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 16:14:16 -0700 (PDT)
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
Subject: [PATCH v3 1/7] dt-bindings: watchdog: convert Broadcom's WDT to the json-schema
Date:   Wed,  3 Nov 2021 16:13:21 -0700
Message-Id: <20211103231327.385186-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103231327.385186-1-f.fainelli@gmail.com>
References: <20211103231327.385186-1-f.fainelli@gmail.com>
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
2.25.1

