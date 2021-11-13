Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB6244F2DE
	for <lists+linux-mips@lfdr.de>; Sat, 13 Nov 2021 12:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbhKMLtz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Nov 2021 06:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234372AbhKMLtz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Nov 2021 06:49:55 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E0B8C061766;
        Sat, 13 Nov 2021 03:47:02 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id k37so29183712lfv.3;
        Sat, 13 Nov 2021 03:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o/mkbhEb1uyZt1SZztusHTiZond5GP2dgg4hEXLzLtI=;
        b=EACvDY4D3mB3Si/gjQbY9KAzfrF6MJRZ6GtiTj+KRnyp/6+e0xthGIk3P3om983TNA
         fXBSLGyaug8icy7/kmW6XQ+rRwDzt8XQx1+bEsQh3MmaVtiwtLoE/l70aRll/s1MDWHO
         W4bTLf+HSrnU84QQ5Tg3NbVz8TnZOotzX5Ffe61jgLhmRPrzDtBkDTe36o2bRMK8/LAn
         zKmRSvzBR6zlB66IbN3bArUP0otUerHr4zrxg3Ok7hACpRoGppdxuL/6mRNs0ltdTL78
         fZTTcNiccsVXdBlvaOSvKfG1BctCZtrbGaWU2KhO6RfKUV3aTK6aSrseLEZIHTl9Sg0G
         a3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o/mkbhEb1uyZt1SZztusHTiZond5GP2dgg4hEXLzLtI=;
        b=UKmX8fQcvmmGzsME9ROoI/venFn7bOM+gW22Rtv0WU3jB3sMKagLfN7dtAQK9VkSsf
         x06oE0Dwfcx/e9nb7P13M9jfXlm2bB01irSGNhBYXWDb8XhRcDbXiFz7+NSmoTybpljl
         vs0tMgp7eSV0mD7F8At9MOvZpNsQ7YeWRTqmgXRUIQN298m3xgCvXXJdQI2fO2yfMahz
         t3Dwu0hMz4hZJykB/P4z7W7F9GWscgEC9/Nfs07kRky4iHOPBB6hsY35xbhCsDv3rKEF
         42Z0KrATR2TSsBTFJGiybog/cNTwymX7GfjZQJP/yqrXU0eYEbzIlLK7XE5H5vSANWfD
         1pUQ==
X-Gm-Message-State: AOAM533Jlh7aQSitl91E1GrUaCGJ25XXJd/1N+X5fxVd82eQWpgYj6Jt
        e46/aXj4ZwY+Zpkg6PK+HoU=
X-Google-Smtp-Source: ABdhPJzLh+TG6zpNdV+lzp/25s3Gzt2l7hc5dGJPc6FCRfTQpKWWS7eBbbS4Hu+rwIGzUuE+Smt9Jw==
X-Received: by 2002:a05:6512:3f86:: with SMTP id x6mr20906852lfa.389.1636804020908;
        Sat, 13 Nov 2021 03:47:00 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id m8sm941676lfg.140.2021.11.13.03.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 03:47:00 -0800 (PST)
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
Subject: [PATCH V4 2/2] dt-bindings: mfd: add Broadcom's Timer-Watchdog block
Date:   Sat, 13 Nov 2021 12:46:45 +0100
Message-Id: <20211113114645.27360-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211113114645.27360-1-zajec5@gmail.com>
References: <20211113114645.27360-1-zajec5@gmail.com>
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

