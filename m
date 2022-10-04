Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF4FC5F3C58
	for <lists+linux-mips@lfdr.de>; Tue,  4 Oct 2022 07:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiJDFJc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Oct 2022 01:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiJDFJb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Oct 2022 01:09:31 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082223FD67;
        Mon,  3 Oct 2022 22:09:30 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id bk15so19524740wrb.13;
        Mon, 03 Oct 2022 22:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ALKnFwRpIOaBlrQAFvWaW5lYm0S2kB5thkEACKlxgCk=;
        b=nUBfpRS6GaU4Bf3ssrOHaQZwbXSr7Zmg7vbArcVhEDt0Kgy2oSoMukksIfjWa2WFw3
         9m7HfOELS0lt2aGMZGSZ/5F4dHwIkr01WcVJHWbSxQ7FhSQ39skVY/8Bfns9IkSiz+6Z
         fu7OIxBe2DbhO/Eg/9aZ/Z2MtcD+NW9yYRxfPSp6ETeR2GHuvlz3xbAMGrvSP7/hBGKp
         Sr7EkOWqBbcoCcKs2NMA/M6SvEau+YosMJN8iapUc+KG0lQpJI8GsCyN4DL9Yt7PTKvh
         dWCWww7isNArfvN4d+UdOgv7iXEU6C8E9MntfJJI6dJ1ANvmQAsrJF3QmxnNHo4nKIQq
         AXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ALKnFwRpIOaBlrQAFvWaW5lYm0S2kB5thkEACKlxgCk=;
        b=xPvGi1PZVs/LSgusV0d+9e7nt3/1CSMMlKEGEbScxslRsXVtYEUMk7cYOaIf6jCPAY
         l/+DA2Mh0BmskSmvh5p0jQx3FmTnXb/wcIpIFVZM7j2P35MFtA69ZPRqLK27zf65iLFB
         00BdGQL9mFJj5WbClOsWS7+ZpnHy+293W7XV9k5qVuWCrZeoVAnbOuPovKzZ847J8i/I
         8ertWlS+42kUfXi1Jxuuj0YidHpvGH8QiidrPHchVEoRqte8Tqy2oK+EA1auQJ1z+HKy
         0sNPD7LaHmMND0GeRoDGdg1Zg6nRfOktPamiMPcoqcKTHbgRTNFspE7aONIE4d2DuTJL
         9bmg==
X-Gm-Message-State: ACrzQf0EPYjsAEwWbkt9bVU/fhMz6RhsB+gr1T471oea74dtjH/NKHAr
        CetvrtiQao7W64n0O2d+WWZjH/W9ivxKgg==
X-Google-Smtp-Source: AMsMyM47hvFin+wTRjIvseCJ1wz6/NarSF3fiXyeA0An6eL4qpnEWXG/oH71rZ+hTKCODqkG38MCXQ==
X-Received: by 2002:a05:6000:1a8d:b0:22a:44e9:831e with SMTP id f13-20020a0560001a8d00b0022a44e9831emr15380616wry.575.1664860168225;
        Mon, 03 Oct 2022 22:09:28 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id i4-20020a05600c354400b003b47b80cec3sm19854250wmq.42.2022.10.03.22.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 22:09:27 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com, f.fainelli@gmail.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/2] dt-bindings: mips: add CPU bindings for MIPS architecture
Date:   Tue,  4 Oct 2022 07:09:23 +0200
Message-Id: <20221004050924.986211-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221004050924.986211-1-sergio.paracuellos@gmail.com>
References: <20221004050924.986211-1-sergio.paracuellos@gmail.com>
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

