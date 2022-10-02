Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E51195F223A
	for <lists+linux-mips@lfdr.de>; Sun,  2 Oct 2022 11:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbiJBJQX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Oct 2022 05:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbiJBJQW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 2 Oct 2022 05:16:22 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90FD838472;
        Sun,  2 Oct 2022 02:16:17 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id r6so12837493wru.8;
        Sun, 02 Oct 2022 02:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BCrmD7HGeq/gtUjl7FgjlsLBsFqFcCdPf3DYW6/nSiU=;
        b=S3Zp4w0rKcRxGoVy9bKyHt0KkPtDp7O5b+m8B043FzPy7d3qQe/cExeRjDXXCwZuWH
         +qoJDQmFAe/O1cA2W8PLqAQgR7rjAZQVgjkchdZvmaC8zwb8l0G63Jnhu0R40yLmmOET
         NmnQlInPA1YW7r9g52lgHlZNOwMZzAfQrkL+rIiVZKYRrWXqtFje0HruG32i0MkH/+sH
         s/wYqRYGH4fNXILquTyJpR3m2rKxVx24894pd5kNOB6GCq6XxOlzdtiUJDyStwPZuC4N
         3b9uRe/meA7PwrJsKH59EGk+o+fCaNEcxVFiWUmsHVrfIXOU7vKGcowI7lMajpkUjxJ0
         66aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BCrmD7HGeq/gtUjl7FgjlsLBsFqFcCdPf3DYW6/nSiU=;
        b=N548rpNFjDiBu7Tc02VXGgzVcroEvAvetbuCHRLYU3F9jkR3YqVRIXS96b7Icdo37i
         nRn2IvyvP9ELQthLANnvAmhNp03DSip8Anv4SNDlZQWfHi+JPTJhe5yRqDNH2GwlRM4M
         Lz2NU1dsMJem297f/rHPuBNYq1HlIwPjuxmOP0Bw1OHJKqh21jXFF+anNxxAecxAK7ej
         mDZ2RPo8VEawXed88HSieNJNCuGPd6HjV/sUbSnvp1NhjgZXHRNx1dMdI+h6C36TIPBQ
         /roWYFP1ySKDNGCyeNy9Il9BFA0B0eD6bMNkryDPmm6uqi8urX5zhxd3RtIdX6MXngvs
         5Yxw==
X-Gm-Message-State: ACrzQf3VUSwkG+Mrp++vO76QrsSuXHhoC9dCGoiGYBJkHzphHbt7DLSy
        5UmzV9lc5L/mFSQa/InnqY6pFdXMEg3bqA==
X-Google-Smtp-Source: AMsMyM4wMpXiX+KgF/fCSCi3q+JnYkmst+jWZy3pAVaWmMAktNIBpmOcdTG2tj+ZmKdbUlNNiz0ZMw==
X-Received: by 2002:a05:6000:1110:b0:22e:327d:c146 with SMTP id z16-20020a056000111000b0022e327dc146mr2933416wrw.453.1664702175803;
        Sun, 02 Oct 2022 02:16:15 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id bs11-20020a056000070b00b0022a2bacabbasm7107638wrb.31.2022.10.02.02.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 02:16:15 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com
Subject: [PATCH v5 2/2] dt-bindings: mips: brcm: convert Broadcom SoCs to schema
Date:   Sun,  2 Oct 2022 11:16:11 +0200
Message-Id: <20221002091611.946210-3-sergio.paracuellos@gmail.com>
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

Add the yaml binding for MIPS Broadcom cable/DSL/settop platforms.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../devicetree/bindings/mips/brcm/soc.yaml    | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.yaml

diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
new file mode 100644
index 000000000000..a47a5bcc5e0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
@@ -0,0 +1,97 @@
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

