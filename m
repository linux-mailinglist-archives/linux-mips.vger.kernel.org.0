Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 811F1440403
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 22:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhJ2U1m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 16:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhJ2U1m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 16:27:42 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46075C061570;
        Fri, 29 Oct 2021 13:25:13 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id h11so18737349ljk.1;
        Fri, 29 Oct 2021 13:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=icQv5eiQ4N6GYDvJ5duXwfTCf93mcDCEx7og4XM7esA=;
        b=IXkz1om3NpB5zv4dJBBE2GmC+Ltq/MAlRQNwAfS9IhGREYLy0t3Qh1oADFBcsiyb3Q
         xrKrVqlYU7LuU/qEsl5/R1uVUdRtOOMMa7YjqtoP0f9ksDURtgvxZDnJgxl/ye4sO3Pt
         gheufj7hI03dYX9pBN/zdzXccZ/xmhxw6MEk2SVEFF4ZL+DSFSwqfXZslAhk+wleFki4
         mnT8yAPA02o7S0t2lxcReTT2JIgt7xj5zhHCxeqF+VS5WKjZbg4SsmhAfgOTWkycNLwL
         pvmi2Ni7BJoKPbDVjcgzS07ZCR0xdIf3fLA6KezsuwtL9wa2w3cLN3TFQVv2yu6lNAqy
         TGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=icQv5eiQ4N6GYDvJ5duXwfTCf93mcDCEx7og4XM7esA=;
        b=SoiZh0BoZPGPa5yvRFHqPzrltvf09a6OinzXbGbjrJGOwuIJVKNu6q49g2eUVSqEMn
         FG+FYdllPvsnV4hNacTxuW/2C3kBwu5cNnZ0TP3g3Dp5Hp858/WffQVRfA80C/jsAhEu
         FN1H/OimDUQ2RWnzKNjZFs+JCU5SLKATULphHtBSs+oUL2ZQgrsnesWDX++5sYiq9YLE
         IHGYKBWv6m3FBTi78B8WxcyGdRu9DG8p0xcjvBpKZqY//aVUQuVGAOx0zWMzyiv13v9f
         92n98tLEGcD9IpUPO5S/PJH2FUE4IRrpJz6yvWePyUDeL17NGIxFgvyar1ptAyNlS3kR
         LzTg==
X-Gm-Message-State: AOAM533pCxBAH98qLF7FSIkkCa0kKfbfYnJe+LdnctUdWfwhTM5we4Fl
        rIeu5G0mTcN4hVcDMBaZV1c=
X-Google-Smtp-Source: ABdhPJxQUKhYPuhvCOhPz9Bhjj+MDj+4vHsJbyFZgdln8yL7AW/e7iq2kSug9mvKs7vdEdOn+SVRWA==
X-Received: by 2002:a05:651c:4c6:: with SMTP id e6mr5974781lji.447.1635539111354;
        Fri, 29 Oct 2021 13:25:11 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id c19sm692715lfv.225.2021.10.29.13.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 13:25:10 -0700 (PDT)
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
Subject: [PATCH 2/2] dt-bindings: mfd: add Broadcom's timer MFD block
Date:   Fri, 29 Oct 2021 22:25:05 +0200
Message-Id: <20211029202505.7106-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029202505.7106-1-zajec5@gmail.com>
References: <20211029202505.7106-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This block is called timer in documentation but it actually behaves like
a MFD.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/mfd/brcm,timer-mfd.yaml          | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,timer-mfd.yaml

diff --git a/Documentation/devicetree/bindings/mfd/brcm,timer-mfd.yaml b/Documentation/devicetree/bindings/mfd/brcm,timer-mfd.yaml
new file mode 100644
index 000000000000..0060b6c443a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,timer-mfd.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,timer-mfd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom's timer MFD
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+description: |
+  Broadcom's timer is a block used in multiple SoCs (e.g., BCM4908, BCM63xx,
+  BCM7038). Despite its name it's not strictly a timer device. It consists of:
+  timers, watchdog and software reset handler.
+
+properties:
+  compatible:
+    items:
+      - const: brcm,timer-mfd
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
+    $ref: ../watchdog/brcm,bcm7038-wdt.yaml
+
+additionalProperties: false
+
+required:
+  - reg
+
+examples:
+  - |
+    timer_mfd: timer-mfd@ff800400 {
+        compatible = "brcm,timer-mfd", "simple-mfd", "syscon";
+        reg = <0xff800400 0x4c>;
+        ranges = <0x0 0xff800400 0x4c>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        watchdog@28 {
+            compatible = "brcm,bcm7038-wdt";
+            reg = <0x28 0x8>;
+        };
+    };
+
+    reboot {
+        compatible = "syscon-reboot";
+        regmap = <&timer_mfd>;
+        offset = <0x34>;
+        mask = <1>;
+    };
-- 
2.31.1

