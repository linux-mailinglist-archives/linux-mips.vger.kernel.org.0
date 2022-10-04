Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 198135F3C5B
	for <lists+linux-mips@lfdr.de>; Tue,  4 Oct 2022 07:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbiJDFJs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Oct 2022 01:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiJDFJp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Oct 2022 01:09:45 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B72B3FD67;
        Mon,  3 Oct 2022 22:09:31 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id f11so16885693wrm.6;
        Mon, 03 Oct 2022 22:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=wVarulVxwNGDYq5FDYV3GRBwpER8QJ7eQadO+Il2n1A=;
        b=VaR+hPr460sH0ZaJK2GrSkveqw2vIZSl7ASfsGnPIeT2CI70yvyZ/3rJHBah2ALSiy
         DjihoaxvZJZhln5jRAsZjDW4whlEtAcl6emdbd+y94WX7ohM37jEtKZyYe6v3cgSCKiI
         FxA/fCBIdeB4XjnWC3sub1Nsn3lYzaIfDwXzP71kDG5C0A/MnUhh6KVo9GehOcYsMK8w
         EeF3rDOjefA8HqH1WpYjRTeSFOotwlWJYFdGbRmWGLduf1kdQ6J1A9sTQTAuOy6AGXNx
         57r3/zdXL1jYYLWirIFU8I3gvyNcAhGKwmhTUuX6cQUXnNunGOProkeLO7SWdlP0KBBq
         lT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wVarulVxwNGDYq5FDYV3GRBwpER8QJ7eQadO+Il2n1A=;
        b=im4eQA1/Y2koxR429xwe7Tifg55mNMjaiHq/TxGAknN8iOytnxPAOHKXQ7WsFb7d0K
         hgGByvVUCmR0Dr2C1DVmhFJPPLgfQ7qWbJNXixPg/s2kXcf58OQXGtHJCRvi0vxQqe02
         7iDj9nLgpC4HKXdYSSzsX4zlsDsWL46W1Fg8DeqRLPQxvSRMM89FQK2znVAANSX3jKHX
         Feqh2d1HHgwTwRU0tGsBvlV+gd74YSJPga3BxPAN62g6CkUzZOsmEYhcdSvlkONG/bkt
         hppou+LL9PT1HK81lMEg/zPH7MW84+684wREdnmHQUPOt22lvo/+xZc/IROo1MVdnTbo
         W3jQ==
X-Gm-Message-State: ACrzQf1Cl4kbnbJ3WCh1ttk/L+Oslq4zAo5wTOmonooi1UyDUpsEgpNw
        7XBg/a7FiakZ+6XXBJCuz04LtXxi6zW1QQ==
X-Google-Smtp-Source: AMsMyM5hK2NW5N8KCKJr2x9jeN3fPYeV06mAPMnB4HWM4yeia27t5EmT3uTSXm8+AWfQqBEpZW+Y5w==
X-Received: by 2002:a5d:5b18:0:b0:22a:fb91:3d6b with SMTP id bx24-20020a5d5b18000000b0022afb913d6bmr15408423wrb.56.1664860169612;
        Mon, 03 Oct 2022 22:09:29 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id i4-20020a05600c354400b003b47b80cec3sm19854250wmq.42.2022.10.03.22.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 22:09:29 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com, f.fainelli@gmail.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 2/2] dt-bindings: mips: brcm: add Broadcom SoCs bindings
Date:   Tue,  4 Oct 2022 07:09:24 +0200
Message-Id: <20221004050924.986211-3-sergio.paracuellos@gmail.com>
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

Add the yaml binding for MIPS Broadcom cable/DSL/settop platforms.

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../devicetree/bindings/mips/brcm/soc.yaml    | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.yaml

diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
new file mode 100644
index 000000000000..39b4609cd1cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom cable/DSL/settop platforms
+
+maintainers:
+  - Hauke Mehrtens <hauke@hauke-m.de>
+  - Rafał Miłecki <zajec5@gmail.com>
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

