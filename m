Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E32D85F6020
	for <lists+linux-mips@lfdr.de>; Thu,  6 Oct 2022 06:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiJFE3z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Oct 2022 00:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbiJFE3y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Oct 2022 00:29:54 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B250A14010;
        Wed,  5 Oct 2022 21:29:52 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id u10so793618wrq.2;
        Wed, 05 Oct 2022 21:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BRdh4Eu+hCdIPdw82pQPJOsT2zqzo3fFqQ4qmaT/m5A=;
        b=I1t+bkQNfAyHeedVDkoADTRlJJrrAIz7mdiEsmyapPxoeqagEP8GV3Oc5JZn7Be9Al
         g3RiDIbt3ABzzYjiZ0pJVQ1UCTJ5eIxnNOJ7S6ZrIPnfwfWbhzxuF30lA9TztvaccaZJ
         k7d3UI4ot/C8Rc/dpuji7LopZk0YIuDSX2lJJqeMQYoehTQNKY4nTmbgRmvr0MkbHK46
         f5wHTh3ZbT8cGc+7YDvzFBl1d01+cenhsJK9j3o8ZrjfO1CZ4FZVnnxfv8lR++3eMXAC
         uJ/ys9I8pN4aq6iYd0R+DK8Y/G/UeXVPG6trkZ+5W1CWL2ykuiC98YHOP/GIKGjtWFI3
         rwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BRdh4Eu+hCdIPdw82pQPJOsT2zqzo3fFqQ4qmaT/m5A=;
        b=3welaHEfsy7cQHCaCWhY0nVJY6Rpi1zkbUv6vVOUfr9682d+4VU5H2lsndpygHpmbd
         r137R7O/YxN0Q7d0mbkMAo43MPOk/n5/ZKq4IVOcH9LFoCUWfhiY8xjDA0z44rghh81i
         VgomLLZSuAXfD+/STcOFTnbDORXaFUzteu2A70Xms7SPtsb6HQmkKsDYNFPMQeULF1/W
         O2Xx/9vdT/tx+U1tvNQFPFGo8rGGNxn7nXXrV6gaRkRqbkfwBW1mN4Yb++BPPEd2JfDs
         L3URp0TNfd3fR5ngJ4hXaw+IcZqJyWw/7NVfjXVL3gugp7Oc8S+UDwmN6xgAU9LDAq09
         j3gQ==
X-Gm-Message-State: ACrzQf0aoQyeZJGWkOgiykF0SxnFF/jmHUEpkxrdN1d0hiCsUmqXA9tT
        mwU0DLsLGOYdX2gxSsKCFIgKXhxgqB378A==
X-Google-Smtp-Source: AMsMyM7+sKBdAnBh0xg/Y4+rSltxXiTnFmNWeKmJe/7Tj+fZ2paXs/2lHwfFgtzAK6AJKT7lY32xAQ==
X-Received: by 2002:a5d:6da9:0:b0:22e:53bd:31c1 with SMTP id u9-20020a5d6da9000000b0022e53bd31c1mr1812421wrs.358.1665030591000;
        Wed, 05 Oct 2022 21:29:51 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id o11-20020a05600c510b00b003a83ca67f73sm3917017wms.3.2022.10.05.21.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 21:29:50 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com, f.fainelli@gmail.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v8 2/2] dt-bindings: mips: brcm: add Broadcom SoCs bindings
Date:   Thu,  6 Oct 2022 06:29:45 +0200
Message-Id: <20221006042945.1038594-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221006042945.1038594-1-sergio.paracuellos@gmail.com>
References: <20221006042945.1038594-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
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

Add the yaml binding for MIPS Broadcom cable/DSL/settop platforms.

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../devicetree/bindings/mips/brcm/soc.yaml    | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.yaml

diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
new file mode 100644
index 000000000000..975945ca2888
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom cable/DSL/settop platforms
+
+maintainers:
+  - Florian Fainelli <f.fainelli@gmail.com>
+
+description: |
+    Boards Broadcom cable/DSL/settop SoC shall have the following properties.
+    The experimental -viper variants are for running Linux on the 3384's
+    BMIPS4355 cable modem CPU instead of the BMIPS5000 application processor.
+
+properties:
+  $nodename:
+    const: '/'
+
+  compatible:
+    enum:
+      - brcm,bcm3368
+      - brcm,bcm3384
+      - brcm,bcm33843
+      - brcm,bcm3384-viper
+      - brcm,bcm33843-viper
+      - brcm,bcm6328
+      - brcm,bcm6358
+      - brcm,bcm6362
+      - brcm,bcm6368
+      - brcm,bcm63168
+      - brcm,bcm63268
+      - brcm,bcm7125
+      - brcm,bcm7346
+      - brcm,bcm7358
+      - brcm,bcm7360
+      - brcm,bcm7362
+      - brcm,bcm7420
+      - brcm,bcm7425
+
+  cpus:
+    type: object
+    additionalProperties: false
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      mips-hpt-frequency:
+        description: MIPS counter high precision timer frequency.
+         This is common to all CPUs in the system so it lives
+         under the "cpus" node.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    patternProperties:
+      "^cpu@[0-9]$":
+        type: object
+        $ref: /schemas/mips/cpus.yaml#
+        unevaluatedProperties: false
+
+    required:
+      - mips-hpt-frequency
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
+...
-- 
2.25.1

