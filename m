Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAA55EEEC6
	for <lists+linux-mips@lfdr.de>; Thu, 29 Sep 2022 09:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235199AbiI2HU2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Sep 2022 03:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235203AbiI2HUQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Sep 2022 03:20:16 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323E126ADE;
        Thu, 29 Sep 2022 00:20:11 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id n35-20020a05600c502300b003b4924c6868so3195924wmr.1;
        Thu, 29 Sep 2022 00:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=SilQIeFOIqfwLSvrNmgYyTgTLx0VsqPkOEz/SAixv60=;
        b=YyPeNCn+dWqutClydurprDQkhtBS7hEiJcTdEpZzoMtzxo94Oxw9s5EEPyb3Aot0Og
         sXdutRJ65dWp/G4XojGa/GD1UpEPIdbBEIV78aq7jqlbj66ihszTTEI3vW7qP1YYMlJB
         s0TuY6QXBg8c9gARg9L73VPQlM1b1wuCIv1emacym7qsC9Rtq8xkyLK3X2uW8oZ9bm7X
         LeRgD6dHdAY0hFDODBaXUHFE6DdeasOXdGFJmm7lPywxUdDPxNhPZwAfyqjIhMI4vLfP
         Qylxbi3dUN8UlR3nPKSQE9FWi0dbbfXpQUcQyAyQH0HASyHGmwwT7fpR12XoxpymQATB
         bz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SilQIeFOIqfwLSvrNmgYyTgTLx0VsqPkOEz/SAixv60=;
        b=H/n3Ez5OWV+2L2ak5g/WlOl7EhO7BfUB6XYyffCLb0HY11ogFFp+Mt7BvSSS9L91ja
         mT0lB+RaLQ7k/82nXUH1YWJrr9ZCqmYcYinq/5XyrLXQ2FXuc/DhbIUQnmQEAJi3/Xxw
         jhdMjPoy6hwgzBQeoQn5rvI+OXQWsaK7XvyiWJuaOvXvYPTjLSsQ3rZohn16VE/d7TqQ
         IjAxM0+VqygWXeFbjQqKHJloMJdx/LbipxaMv1b7zduif8NKebYSgtSzLBi8su2GA3kF
         C21fmXahyNadtkICFqNoDw5ozadSuo4cUKRWw9GIkETCRLtyaoAKJQ307EUQ75fXviYP
         GK5w==
X-Gm-Message-State: ACrzQf0sJ2EfWVWx9brlzWwlj4wg1vtO4bTgn2XdQ1egKRAPrBOI/e45
        uN6G6b76BHSt1UuoF8Jze3wb3Q0jmoCc2w==
X-Google-Smtp-Source: AMsMyM7x+0//EeA/jslItZnMc2J24QjcWKYfzMgbV6loMCr3P3ENmv+FrGHZgsv4mO/elbSRSyQRJg==
X-Received: by 2002:a05:600c:1e87:b0:3b5:1e2:3c3c with SMTP id be7-20020a05600c1e8700b003b501e23c3cmr1160405wmb.130.1664436009811;
        Thu, 29 Sep 2022 00:20:09 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id q63-20020a1c4342000000b003b4bd18a23bsm3674250wma.12.2022.09.29.00.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 00:20:09 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, arinc.unal@arinc9.com
Subject: [PATCH v3 3/3] dt-bindings: mips: brcm: convert CPU bindings for BMIPS architecture
Date:   Thu, 29 Sep 2022 09:20:04 +0200
Message-Id: <20220929072004.874795-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929072004.874795-1-sergio.paracuellos@gmail.com>
References: <20220929072004.874795-1-sergio.paracuellos@gmail.com>
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

Convert the yaml binding for available CPUs in BMIPS architecture.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/mips/brcm/brcm,bmips-cpus.yaml   | 102 ++++++++++++++++++
 .../bindings/mips/brcm/brcm,bmips.txt         |   8 --
 2 files changed, 102 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,bmips-cpus.yaml
 delete mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,bmips.txt

diff --git a/Documentation/devicetree/bindings/mips/brcm/brcm,bmips-cpus.yaml b/Documentation/devicetree/bindings/mips/brcm/brcm,bmips-cpus.yaml
new file mode 100644
index 000000000000..60aa7df9a543
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/brcm/brcm,bmips-cpus.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/brcm/brcm,bmips-cpus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPS CPUs bindings
+
+maintainers:
+  - Hauke Mehrtens <hauke@hauke-m.de>
+  - Rafał Miłecki <zajec5@gmail.com>
+
+description: |
+  The device tree allows to describe the layout of BMIPS CPUs.
+
+patternProperties:
+  "^/":
+    type: object
+    $ref: "/schemas/mips/brcm/soc.yaml#"
+
+properties:
+  cpus:
+    type: object
+    additionalProperties: true
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      mips-hpt-frequency:
+        description: This is common to all CPUs in the system so it lives
+          under the "cpus" node.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    patternProperties:
+      "^cpu@[0-9]$":
+        type: object
+        $ref: "/schemas/mips/cpus.yaml#"
+
+    required:
+      - '#address-cells'
+      - '#size-cells'
+
+    allOf:
+      - if:
+          properties:
+            compatible:
+              contains:
+                enum:
+                  - "brcm,bcm3368"
+                  - "brcm,bcm3384"
+                  - "brcm,bcm33843"
+                  - "brcm,bcm3384-viper"
+                  - "brcm,bcm33843-viper"
+                  - "brcm,bcm6328"
+                  - "brcm,bcm6358"
+                  - "brcm,bcm6362"
+                  - "brcm,bcm6368"
+                  - "brcm,bcm63168"
+                  - "brcm,bcm63268"
+                  - "brcm,bcm7125"
+                  - "brcm,bcm7346"
+                  - "brcm,bcm7358"
+                  - "brcm,bcm7360"
+                  - "brcm,bcm7362"
+                  - "brcm,bcm7420"
+                  - "brcm,bcm7425"
+        then:
+          required:
+            - mips-hpt-frequency
+
+additionalProperties: true
+
+examples:
+  - |
+     / {
+         compatible = "brcm,bcm3368";
+         #address-cells = <1>;
+         #size-cells = <1>;
+         model = "Broadcom 3368";
+
+         cpus {
+           #address-cells = <1>;
+           #size-cells = <0>;
+
+           mips-hpt-frequency = <150000000>;
+
+           cpu@0 {
+             compatible = "brcm,bmips4350";
+             device_type = "cpu";
+             reg = <0>;
+           };
+
+           cpu@1 {
+             compatible = "brcm,bmips4350";
+             device_type = "cpu";
+             reg = <1>;
+           };
+         };
+       };
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
-- 
2.25.1

