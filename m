Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8DD744EF97
	for <lists+linux-mips@lfdr.de>; Fri, 12 Nov 2021 23:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236008AbhKLWtd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 17:49:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236001AbhKLWtd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Nov 2021 17:49:33 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03CDC061766;
        Fri, 12 Nov 2021 14:46:41 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id g18so9635593pfk.5;
        Fri, 12 Nov 2021 14:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uh9Qlw6LxLHXooJsqQQ7CfQ5xCKmfK88jAvFllzkUvI=;
        b=mCcsii4K1rxmyzWbuQL4gEA71mR8vzZ+wcj+vP08Y7bs2GfwQvJXUh7mlZ8vHuUh8M
         eTWeltYU9rOV89TGAjaIzaGATy31MFYrtysAEIDCfNdlM/BGYhauyXCswCoyyZ+9nIJM
         TraghKoAjfGzFSqi0kp1j4V+6Sy6hJNoRUEfMmq1+PtEH9aIsOAdmfII4/IH4kyDm50Y
         f86FjTzLlJkfLFAT5r5XcTCz/AiPuoPPm9MNDDaHmai2MoHZExrroHoCjkC/H8tDYhBg
         6L/OE+91cUsHk/2QqAULUv61FyEoYZyqblpcMqmxqtomudk1Cw6TaPcLyPwZaH6NKOqm
         J9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uh9Qlw6LxLHXooJsqQQ7CfQ5xCKmfK88jAvFllzkUvI=;
        b=ivo0I75upz/0jQVr1QF7M1Eq0BtfFQN8V5RyXrS/4n31aeTzxli3YsHayE0Dxmx+pS
         FYOGFd8eJQI1hINBpDndcCgavk7xWNpvoenafN1LiUdtbS9zbJhC39Cj6iZ04c69i3Sa
         rywDpiXocHqxm1Xthx76AExCklqkKvU5gcHZRLG5LiZPP6iJG4ghcffrUtKC8ctdW3zC
         IXoKULXa5C+q0GumGgUMG1mfYdNN1nJtYDAqZy0/VT+IY12VGL7r/EVUPKIhrcpm/vwt
         Jd5sf1zc0UX0cJId1RTXC015CXj1qD2Gt/mT/vk7rb/9zBHBaMddgfI26SDj319GfUMR
         Yw6A==
X-Gm-Message-State: AOAM533C0VtcvxbjofA98HpafsWk/3lkIMqkf+imj5T2wkWO2uvzhR0G
        WGZafevlcJfsSs7OzgDsF65+gN3DPwU=
X-Google-Smtp-Source: ABdhPJzwkOp2KP+3vkm3FfojZvwIjm28DWaDuRGlqOldG5gxUB704AvfqQePJSgymKqvkfzdWpJDFg==
X-Received: by 2002:a05:6a00:148c:b0:49f:e048:25dc with SMTP id v12-20020a056a00148c00b0049fe04825dcmr17289615pfu.12.1636757201077;
        Fri, 12 Nov 2021 14:46:41 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm5647004pga.65.2021.11.12.14.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:46:40 -0800 (PST)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v5 1/7] dt-bindings: watchdog: convert Broadcom's WDT to the json-schema
Date:   Fri, 12 Nov 2021 14:46:30 -0800
Message-Id: <20211112224636.395101-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112224636.395101-1-f.fainelli@gmail.com>
References: <20211112224636.395101-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS files.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
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
2.25.1

