Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDDA044EF1D
	for <lists+linux-mips@lfdr.de>; Fri, 12 Nov 2021 23:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233451AbhKLWRj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 17:17:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233116AbhKLWRi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Nov 2021 17:17:38 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D4DC061766;
        Fri, 12 Nov 2021 14:14:47 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id p16so25739836lfa.2;
        Fri, 12 Nov 2021 14:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o/mkbhEb1uyZt1SZztusHTiZond5GP2dgg4hEXLzLtI=;
        b=dCWQYRllb6gdk1ThFJ4g6Pr03S285DhLr5wk28zaa2IVPzZGXDw3lplPIOaOigr9oE
         BjK5zT8eHdmuJe7uG+MO+Rrz58CVdNd4UxeBGr+VtM3meBFlpzDtreARadzShNUwc0im
         YGOLnDH6p68NMyGI4Mfol5AnJ+3czmYb50bXMYmu+G88rBEVcI63NHU2c4yqk7Myih4e
         l7oNoI4TiVEp9b+4v5r7trXxbO3KtKrjASSgk5liGGF6j+kOQeKiqgNBt6xjwxTUyv58
         0EqlP+mDqUP5/8W95uiHAUb14GEsFd7EAqhaUgL6B4C8ADt9fNZK5usAdREiEVPiAZZ4
         ikEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o/mkbhEb1uyZt1SZztusHTiZond5GP2dgg4hEXLzLtI=;
        b=HdpE8BIEkzaN8WBn5U/7QKOIinIbkhtDqiYBgr+pZTEh1iCiTztcbKH9BUc5KiM7tJ
         0NyWAzhke7CgDOGbRAy9VJ03OAiFDlWNiWX/6R1RcfV2E6C8YYSAXiCyOR76O7NS/ZY3
         BHWRX/C7PpcnVpHQXnINElgkmdSIlY4AzGOysT9mY29yuHSaP7f5vGD9Y/ifBewQmCXv
         e5Ggw02gru3smdldhcRLw9Nxec2QmhdwjkeZ5THrMOT9hYuMT36F/9Zg3rWc27zbXnWq
         84aRDtf4woFDjYEIAk2fbW67jZTs32pgMJDZBu1jrcnV3UWXQ9FmbFOxCI3EYXXWiDQK
         xHbA==
X-Gm-Message-State: AOAM532mIO5NWZ3VnFf9L2H0n0xu3d4nvb/Kue9KQ/X/JVAGLhhe7MIL
        ZmUeSicKJS50TnEXTQTwWf0=
X-Google-Smtp-Source: ABdhPJxZBvlSizuoKaqTg8sINaXFYmgWU3RIwUzKXby0ANx4EbiBczHk0Py1Qamb0HDMvmeeMJrreA==
X-Received: by 2002:a05:6512:1296:: with SMTP id u22mr16761074lfs.296.1636755284086;
        Fri, 12 Nov 2021 14:14:44 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id e5sm680536lfs.51.2021.11.12.14.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:14:43 -0800 (PST)
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
Subject: [PATCH V3 2/2] dt-bindings: mfd: add Broadcom's Timer-Watchdog block
Date:   Fri, 12 Nov 2021 23:14:22 +0100
Message-Id: <20211112221422.13735-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112221422.13735-1-zajec5@gmail.com>
References: <20211112221422.13735-1-zajec5@gmail.com>
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

