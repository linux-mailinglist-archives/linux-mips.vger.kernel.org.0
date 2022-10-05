Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A33BF5F527E
	for <lists+linux-mips@lfdr.de>; Wed,  5 Oct 2022 12:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbiJEKVg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Oct 2022 06:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiJEKVf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Oct 2022 06:21:35 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B36C760FC;
        Wed,  5 Oct 2022 03:21:34 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id bu30so5359895wrb.8;
        Wed, 05 Oct 2022 03:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ALKnFwRpIOaBlrQAFvWaW5lYm0S2kB5thkEACKlxgCk=;
        b=QWtRjLVq0DLQLshDqTY607nx/oSCv6qrtiuhvZGqksHcA/Cc79xE5PMJb0HqmB8t3t
         2SustCoOcin3MHvEuUqiSMHlaoFvXkBLFmIrnUifeGJ8/krqslaRpvG7LlMkadaKrta0
         QIDpWrzicAU8EBhhdTQ2A791aanmyWLObaufcnBMZVE81AVlMr11yOoMLXtk8GSB9YkI
         sgKoGuIZjar0WL4g3JKv7fKDhNuNNVp7k48/QUal2gr2woAShsIkLQK8kAqnhhsnOz2S
         JoOH7yHROPcBqFw8/ejn0hUdAsMGFxk4ULQXuirgIK4c5wapCYOB70/gQ3kSm6nET1yA
         SgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ALKnFwRpIOaBlrQAFvWaW5lYm0S2kB5thkEACKlxgCk=;
        b=FW81Qtzz00aJsfmt9iDd7+mjqJccrFkNveXLCBTi5jBT4NHtoudwjO3C+qMGaxydY3
         ATa+mcJMPnX0qAQ7S+NBO/43JKruTuWBt6qcpCNA+wk890VhNHEyBpBpox1gTxS6uD+U
         QZIedX6G7Ln1eSO5Mmb55/fd4lFjznNqJ9mN6poUsA75ziwmyWXWd30gcpuk708ZMwWU
         9pnmq0TOjUU/jVkxSR6K1Ht27/+YF+NDi8vQjrfg0Tt6XEY46rYV3srjNtXNiJDw5d0j
         xtwK+CZs8mq7fbFkmff4oxvPP+8BPIDZZwOi5CCV11CtXFROMO34cvRWGAJRdcIeedA9
         2jKQ==
X-Gm-Message-State: ACrzQf39LAuTjfbgfHa12S7oKM4O0iX1rZFeuf5y5mc3BYsN6FZgSQN+
        8Hxt9CnQBfEtoi5QyQfOVJpzhFHt0ptHvA==
X-Google-Smtp-Source: AMsMyM4l3IB8W/4m17JOXylZcluagQ2H6QqefuOxcPfTLbnU0djRgZcUY0BcdSFzI3YQfwmJtbtM1Q==
X-Received: by 2002:a5d:620b:0:b0:22c:9eb4:d6ed with SMTP id y11-20020a5d620b000000b0022c9eb4d6edmr19980139wru.530.1664965292522;
        Wed, 05 Oct 2022 03:21:32 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id az30-20020adfe19e000000b002286670bafasm4481702wrb.48.2022.10.05.03.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 03:21:32 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com, f.fainelli@gmail.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v7 1/2] dt-bindings: mips: add CPU bindings for MIPS architecture
Date:   Wed,  5 Oct 2022 12:21:27 +0200
Message-Id: <20221005102128.1014468-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005102128.1014468-1-sergio.paracuellos@gmail.com>
References: <20221005102128.1014468-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the yaml binding for available CPUs in MIPS architecture.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/mips/brcm/brcm,bmips.txt         |   8 --
 .../devicetree/bindings/mips/cpus.yaml        | 115 ++++++++++++++++++
 .../bindings/mips/ingenic/ingenic,cpu.yaml    |  69 -----------
 3 files changed, 115 insertions(+), 77 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,bmips.txt
 create mode 100644 Documentation/devicetree/bindings/mips/cpus.yaml
 delete mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml

diff --git a/Documentation/devicetree/bindings/mips/brcm/brcm,bmips.txt b/Documentation/devicetree/bindings/mips/brcm/brcm,bmips.txt
deleted file mode 100644
index 8ef71b4085ca..000000000000
--- a/Documentation/devicetree/bindings/mips/brcm/brcm,bmips.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-* Broadcom MIPS (BMIPS) CPUs
-
-Required properties:
-- compatible: "brcm,bmips3300", "brcm,bmips4350", "brcm,bmips4380",
-  "brcm,bmips5000"
-
-- mips-hpt-frequency: This is common to all CPUs in the system so it lives
-  under the "cpus" node.
diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Documentation/devicetree/bindings/mips/cpus.yaml
new file mode 100644
index 000000000000..e991f4c6668d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/cpus.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/cpus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPS CPUs bindings
+
+maintainers:
+  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
+  - 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
+
+description: |
+  The device tree allows to describe the layout of CPUs in a system through
+  the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
+  defining properties for every CPU.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bmips3300
+      - brcm,bmips4350
+      - brcm,bmips4380
+      - brcm,bmips5000
+      - brcm,bmips5200
+      - ingenic,xburst-mxu1.0
+      - ingenic,xburst-fpu1.0-mxu1.1
+      - ingenic,xburst-fpu2.0-mxu2.0
+      - ingenic,xburst2-fpu2.1-mxu2.1-smt
+      - loongson,gs264
+      - mips,m14Kc
+      - mips,mips4Kc
+      - mips,mips4KEc
+      - mips,mips24Kc
+      - mips,mips24KEc
+      - mips,mips74Kc
+      - mips,mips1004Kc
+      - mti,interaptiv
+      - mti,mips24KEc
+      - mti,mips14KEc
+      - mti,mips14Kc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  device_type: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ingenic,xburst-mxu1.0
+              - ingenic,xburst-fpu1.0-mxu1.1
+              - ingenic,xburst-fpu2.0-mxu2.0
+              - ingenic,xburst2-fpu2.1-mxu2.1-smt
+    then:
+      required:
+        - device_type
+        - clocks
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    cpus {
+      #size-cells = <0>;
+      #address-cells = <1>;
+
+      cpu@0 {
+        compatible = "mips,mips1004Kc";
+        device_type = "cpu";
+        reg = <0>;
+      };
+
+      cpu@1 {
+        compatible = "mips,mips1004Kc";
+        device_type = "cpu";
+        reg = <1>;
+      };
+    };
+
+  - |
+    // Example 2 (Ingenic CPU)
+    #include <dt-bindings/clock/ingenic,jz4780-cgu.h>
+
+    cpus {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      cpu@0 {
+        compatible = "ingenic,xburst-fpu1.0-mxu1.1";
+        device_type = "cpu";
+        reg = <0>;
+
+        clocks = <&cgu JZ4780_CLK_CPU>;
+      };
+
+      cpu@1 {
+        compatible = "ingenic,xburst-fpu1.0-mxu1.1";
+        device_type = "cpu";
+        reg = <1>;
+
+        clocks = <&cgu JZ4780_CLK_CORE1>;
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
deleted file mode 100644
index b7e7fa715437..000000000000
--- a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
+++ /dev/null
@@ -1,69 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/mips/ingenic/ingenic,cpu.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Bindings for Ingenic XBurst family CPUs
-
-maintainers:
-  - 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
-
-description:
-  Ingenic XBurst family CPUs shall have the following properties.
-
-properties:
-  compatible:
-    oneOf:
-
-      - description: Ingenic XBurst®1 CPU Cores
-        enum:
-          - ingenic,xburst-mxu1.0
-          - ingenic,xburst-fpu1.0-mxu1.1
-          - ingenic,xburst-fpu2.0-mxu2.0
-
-      - description: Ingenic XBurst®2 CPU Cores
-        enum:
-          - ingenic,xburst2-fpu2.1-mxu2.1-smt
-
-  reg:
-    maxItems: 1
-
-  clocks:
-    maxItems: 1
-
-  device_type: true
-
-required:
-  - device_type
-  - compatible
-  - reg
-  - clocks
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/ingenic,jz4780-cgu.h>
-
-    cpus {
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        cpu0: cpu@0 {
-                device_type = "cpu";
-                compatible = "ingenic,xburst-fpu1.0-mxu1.1";
-                reg = <0>;
-
-                clocks = <&cgu JZ4780_CLK_CPU>;
-        };
-
-        cpu1: cpu@1 {
-                device_type = "cpu";
-                compatible = "ingenic,xburst-fpu1.0-mxu1.1";
-                reg = <1>;
-
-                clocks = <&cgu JZ4780_CLK_CORE1>;
-        };
-    };
-...
-- 
2.25.1

