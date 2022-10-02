Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 842B65F2239
	for <lists+linux-mips@lfdr.de>; Sun,  2 Oct 2022 11:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbiJBJQW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Oct 2022 05:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiJBJQV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 2 Oct 2022 05:16:21 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D00C37F9E;
        Sun,  2 Oct 2022 02:16:16 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id l8so5333409wmi.2;
        Sun, 02 Oct 2022 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=iTKd0GBznWfUc6uXLaLBYT59IrIElailln/6OMSg4YY=;
        b=IOBVRuG/SgnV1LPwkuSrUEziVAWe8nYyBmpWibUVnDzm4rHzqUl7f1OBLhnX3X3oZb
         2dr1PjM+3rI+8lAVzJ49i5cZDwl1zgw760WM0b1YUSDI72XZ9uteSOYnkbrXMjTkWsf6
         viKmOOpx54Ns2Wd22fJKGJ+QooWA+nppBiHN76kqdtcUfaFaj6u197ZGXbFmSgcEmHjG
         kRzUDKjmD2u2gl9s6FRWAIvnLaouY1gIe/qLxVddqDrEPXDxrBic86ObFy3dz8QsLj/U
         Gbrvn/vM3t3dqCVyDq4Av78VCaeOVVlsa4KsytqgupGpCBoAEuTM+SWj/MrEd8K2Slzs
         aXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=iTKd0GBznWfUc6uXLaLBYT59IrIElailln/6OMSg4YY=;
        b=okhKqcBnRc1SedMylFLamCjoym/e50KfBNYbzScZnXHxsN9TBHCvjQcWc5DDbsFXDj
         Mtpgl6vvvSZO8MuvCG+s6/Lp1A2fcw9XPMFjWCOpcJHnJoaGYKVajuir+oiAlFe0zg/y
         pvqj1q2R8GH7nkuvSyY5sWSGqwq2feZtsoew7KeOArbC17JNK+0eoTWbU2NFEUX3p8fJ
         ryja5G7EO6gKP566palRFQ4Gsbh5UgqYP/iZWTjVhL9EuuJHE4yqLaOo6Fg7w/zDZWCr
         CeFyfRMz2hvqjCRMelPfky00N0eKPK68xqg4PVhAoQuAl13yyVHLAnwCJChgyd5RKOb3
         hQcw==
X-Gm-Message-State: ACrzQf0PKsiuavVSm5X5lQUR4rz+o8vdSXgaE/VNx5OCxxNcicj4fNQR
        JEv/hybEQy4myxb9Uz1LgUlJrKotTwn4FA==
X-Google-Smtp-Source: AMsMyM6elORMA6XrmJ/3TeKOtoLZiUXhKuqpI8KTQPnkAJHOh9uBciW2N6BzeS1cA3YqgeFbp7cA5A==
X-Received: by 2002:a05:600c:247:b0:3b4:7644:42b4 with SMTP id 7-20020a05600c024700b003b4764442b4mr3792170wmj.5.1664702174838;
        Sun, 02 Oct 2022 02:16:14 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id bs11-20020a056000070b00b0022a2bacabbasm7107638wrb.31.2022.10.02.02.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 02:16:14 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com
Subject: [PATCH v5 1/2] dt-bindings: mips: add CPU bindings for MIPS architecture
Date:   Sun,  2 Oct 2022 11:16:10 +0200
Message-Id: <20221002091611.946210-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221002091611.946210-1-sergio.paracuellos@gmail.com>
References: <20221002091611.946210-1-sergio.paracuellos@gmail.com>
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

