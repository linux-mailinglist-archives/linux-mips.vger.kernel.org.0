Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A334A4432C7
	for <lists+linux-mips@lfdr.de>; Tue,  2 Nov 2021 17:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234838AbhKBQdO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Nov 2021 12:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234798AbhKBQKQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Nov 2021 12:10:16 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2ABC061203;
        Tue,  2 Nov 2021 09:06:27 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 17so32630833ljq.0;
        Tue, 02 Nov 2021 09:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5we+ngsabeSIgxk8EL0owZimFzpBYd2svuAuN0pJ4yE=;
        b=WtRtW2Nmyd5DSdXZWaxLgDqKEf/VPM3+3pnx50sujC8E0ge5De48uNQpMaVy7FqHBx
         LT565HDhRvPjASD9k5RlqBS3RNfGBZJYeLJhYO5DP8Z5wFNbPleEBs1x+XzZvVOu/fOo
         O3hGsYgDWbAn13dRYImuGonhbpWQZd4H6qwOU7LaAMtJBQ56UnXONku0kmW21ozuPLjW
         Bu6WLqS8mwRI14MfZ8xr85lkKdQ2lkpk5qEqdjrNc9OO/a7SjZ6SEmJEHPKwOO+Zfa7z
         yRKl+whCiCGlF79jxCbV/W3SQlmLcgsi/0xIG5CkvjzswyHJqfZHnOYtlUQbBgIDb58P
         1Mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5we+ngsabeSIgxk8EL0owZimFzpBYd2svuAuN0pJ4yE=;
        b=6sjBrXfszJ64kCuDlu6cUIrHRdkF5udR8G8fdVtlN0vZrgeneytrzL7NTI0N5F0oyn
         J6ocEccRb1tORsxdxGhHBIHVnM/x7FyMi4edu0Y5RTMewqwcn6e8aDs5q70B79K057wk
         47nR1Xg1YxFmkrCIwXhk5MJjdn/Lcx34PHxQyI/MOUWMBjALdx5nLORN0f2ekf2Bp7yy
         0QBRcIcsTb3lgBt3XpIZSEDrGSM/9WCCSYLw7W76LtE04pFmW8MGHktkXhG9w+H3753+
         EvsDnNToxH+OlyDpU+nBGHqUue92evNqFsQ32mketYi1v5e91O3y2uHEaLphXGZ4lxsR
         HFiQ==
X-Gm-Message-State: AOAM531hY7A9KdQ/OiTSIIAeYmE7jlcXPzWtX3+bFo+ji33UOTL7AQYv
        MB+nWZM28M3bELeEKUacmksFEzqRnSs=
X-Google-Smtp-Source: ABdhPJw8yJGezU5RdVmSwZoRkcyQObCFHZkbMgHpvZdlEGRwIuwDDqRWRIJ1u6r0z7FfDiwehDojBA==
X-Received: by 2002:a2e:a587:: with SMTP id m7mr18156500ljp.330.1635869185832;
        Tue, 02 Nov 2021 09:06:25 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t6sm1798895lji.109.2021.11.02.09.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:06:25 -0700 (PDT)
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
Subject: [PATCH V2 2/2] dt-bindings: mfd: add Broadcom's Timer-Watchdog block
Date:   Tue,  2 Nov 2021 17:06:15 +0100
Message-Id: <20211102160615.14672-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102160615.14672-1-zajec5@gmail.com>
References: <20211102160615.14672-1-zajec5@gmail.com>
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
---
 .../devicetree/bindings/mfd/brcm,twd.yaml     | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,twd.yaml

diff --git a/Documentation/devicetree/bindings/mfd/brcm,twd.yaml b/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
new file mode 100644
index 000000000000..ed167055be06
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
@@ -0,0 +1,62 @@
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
+        - brcm,bcm4908-twd
+        - brcm,bcm7038-twd
+      - const: brcm,twd
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
+        compatible = "brcm,bcm4908-twd", "brcm,twd", "simple-mfd", "syscon";
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

