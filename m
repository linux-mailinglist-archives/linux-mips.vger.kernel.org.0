Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5250C44FE77
	for <lists+linux-mips@lfdr.de>; Mon, 15 Nov 2021 06:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbhKOF5W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Nov 2021 00:57:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhKOF5T (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Nov 2021 00:57:19 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A68C9C061766;
        Sun, 14 Nov 2021 21:54:17 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id f18so40544914lfv.6;
        Sun, 14 Nov 2021 21:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0ITzm3kF2CTjx8s3ujmiTGO0Uq6IhLwpCFtlE2jGWfg=;
        b=aoOj9BmpH4wlK0zab+wtjijrWVmtQ4xi1jOJjv6ytq5zQIwDHB6j4PWiuHdABmMAcG
         jKkeKBOVQcpGKbpNuZkWc0NUiLq4eKXBe+zVpph/2LNCibt51n6StqGRS7WUuntduyYJ
         edgGphqzQ770deGyxl7M4vH+dtoHbw2SD6hPQWt1kVNbrbJMf5nwA65epAfG+VwRElK6
         4pQzNoJGasQgeJcKcfS+KRIr7YrDzlnxXYSRnLI+SAWz1Wh8SBtpasyn2FaGBK2Z6qsW
         GvjJh42UCIDnyYIcZ1NkeQhHV0R8KVR6som0znoFT35XVMs85XQUl0VjgwxigTxI/V9c
         0BVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0ITzm3kF2CTjx8s3ujmiTGO0Uq6IhLwpCFtlE2jGWfg=;
        b=JZz9i29H9FPVcJiN6vgaV7mdDyrVrpZrjjZSaG7uxLd7TskG7hIu9SxhRTPIsAZky9
         QiF/Vl5HQ7lPs8C/yY9BdWcpQbU/qJP1ZBl7Ov5U/7bszBmnGA3qgyr4WTg0vqVJFHuj
         iBh/Mn0ub7QFhHTyA6AhAvIBmNv6asJ5Zn8fyBym3C8CiYirDF5pdXvH2jLWsj0Vt8gc
         40xrQDRGwGgVVHC8wDtlYENk9ZTQOdPvuudbpMFjqWd6a7o2oMj4IgbzMeEBmHoreLi7
         NNM/uHnRqf/7VtbJZLhjuDy4aq06UatyH25hvkKPvkgkU6An3S2VlB6jejt2ytCceDZU
         V4wA==
X-Gm-Message-State: AOAM533iR0o/H5QdohdfyyGhGmxga9Ku54YWlHP8ynMxHD5PHHsbdzn7
        AIqVfhRdtXjGI7TVbpo5Fq0=
X-Google-Smtp-Source: ABdhPJxaH7HFu5Imhc8iMFDJJWTHVcWL9DV95cUFtBv5nGIoWSJEtBa9ewhxIb4K6hGUEIFHuLRjxw==
X-Received: by 2002:ac2:4e11:: with SMTP id e17mr32541121lfr.126.1636955655599;
        Sun, 14 Nov 2021 21:54:15 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id i13sm1308668lfb.45.2021.11.14.21.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 21:54:15 -0800 (PST)
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
Subject: [PATCH V4 RESEND 2/2] dt-bindings: mfd: add Broadcom's Timer-Watchdog block
Date:   Mon, 15 Nov 2021 06:53:54 +0100
Message-Id: <20211115055354.6089-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115055354.6089-1-zajec5@gmail.com>
References: <20211115055354.6089-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

It's a block implementing few time related functions depending on a
(SoC specific) variant. At this point there is ready binding for a
watchdog only. Work on remaining subblocks (e.g. "reg" based reboot) is
in progress.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Update $id, description, compatible, example & commit message
V3: Drop "brcm,twd" from compatible list per Rob's review
RESEND: Patchwork lost 1/2, marc.info lost 2/2
---
 .../devicetree/bindings/mfd/brcm,twd.yaml     | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,twd.yaml

diff --git a/Documentation/devicetree/bindings/mfd/brcm,twd.yaml b/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
new file mode 100644
index 000000000000..634526f790b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,twd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom's Timer-Watchdog (aka TWD)
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+description: |
+  Broadcom has a Timer-Watchdog block used in multiple SoCs (e.g., BCM4908,
+  BCM63xx, BCM7038). There are few variants available (they differ slightly in
+  registers layout). This block consists of: timers, watchdog and optionally a
+  software reset handler.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - brcm,bcm4908-twd
+          - brcm,bcm7038-twd
+      - const: simple-mfd
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  '^watchdog@[a-f0-9]+$':
+    $ref: /schemas/watchdog/brcm,bcm7038-wdt.yaml
+
+additionalProperties: false
+
+required:
+  - reg
+
+examples:
+  - |
+    timer-mfd@ff800400 {
+        compatible = "brcm,bcm4908-twd", "simple-mfd", "syscon";
+        reg = <0xff800400 0x4c>;
+        ranges = <0x00000000 0xff800400 0x4c>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        watchdog@28 {
+            compatible = "brcm,bcm7038-wdt";
+            reg = <0x28 0x8>;
+        };
+    };
-- 
2.31.1

