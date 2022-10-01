Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 838B15F19DA
	for <lists+linux-mips@lfdr.de>; Sat,  1 Oct 2022 06:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbiJAEjE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Oct 2022 00:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiJAEjC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Oct 2022 00:39:02 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E48E1A59B1;
        Fri, 30 Sep 2022 21:39:01 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id f11so6908128wrm.6;
        Fri, 30 Sep 2022 21:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=jlBOzvJ5wanT63wwyFnAonptEA0lNzgTOghz1qmOO6o=;
        b=e8Kje7HL9heppqE2kRU7Y7bvNFeRTpSHJgYpWh110JYWSx26DVGwgNP7/WcnNCrjNK
         ptSuKW8yAnz4+qcOdsTNZr6crydZAogYjoutRg/jmKe5NmOx5ebq4vPope1pWFSJGEWN
         8htWYQ+5jU8fRMf8hYcKbbNqgKjGIF8APDVGIaNyTO4llDKWEfK6qnYXvZwqSDMMvB96
         7Hl0/sGXTtm+QtQPYsXoy/nyCYxAKROfCdcK7KdhUn1VqxVWzWKyVpVNNlJ+RFZaAd3M
         ziemroL52UYvPub3Mi2WfM3GBF6VfZIyMi/7pObi+W9KwntHgLcwXwDDxqX/4SQpKseR
         J4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jlBOzvJ5wanT63wwyFnAonptEA0lNzgTOghz1qmOO6o=;
        b=pKfeijbUBWCElxaj3tyHSiV6o11OtDk2rJEEcaMy20AuVTCHQRpH0Vy0Eum+eYqz1x
         eQf8fwlMYtJ11xGzb/8p7bxpz2TS0mh51nZzFKluolThsoBAUgugnHlYa7KRdamrrF0p
         a685TL22j237LwxZ3TGERVaox/euwdD63g3Qtx02/mpkbdR9Ak2OoFevklPsvcJTg4TL
         R8CFzLGSWErURlZ7Stf2ncUPeQInBRyHoo/rvi6WQp0vZxDKa/8NhLib/sw8c0LXy9kN
         LuCRhw2xnBxSUngkEwIqczp1ntctiaajL9AT/dJHZaCUAEzDxD9wbQvTSNwPSXAnLHT4
         NvVQ==
X-Gm-Message-State: ACrzQf359J4M3G9fQacMy140x8NzmUykVIBVhocVM6ZnnvgHR//Fkpyf
        M3EgoS8wP1CSKUwIigUuM2V28hW6NiZv4g==
X-Google-Smtp-Source: AMsMyM549eHevEwPY0Es2FMgm/nyTzPnNzwg3t0XKQXDmSwRnMypyNNLKBouNrRHhXUMCcYSUnh/ew==
X-Received: by 2002:adf:f743:0:b0:22c:c939:bcc with SMTP id z3-20020adff743000000b0022cc9390bccmr7165794wrp.95.1664599139649;
        Fri, 30 Sep 2022 21:38:59 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id m64-20020a1ca343000000b003a6125562e1sm3996206wme.46.2022.09.30.21.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 21:38:59 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com
Subject: [PATCH v4 2/2] dt-bindings: mips: brcm: convert Broadcom SoCs to schema
Date:   Sat,  1 Oct 2022 06:38:55 +0200
Message-Id: <20221001043855.933528-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221001043855.933528-1-sergio.paracuellos@gmail.com>
References: <20221001043855.933528-1-sergio.paracuellos@gmail.com>
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

Convert Broadcom cable/DSL/settop platforms to YAML schema.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../devicetree/bindings/mips/brcm/soc.yaml    | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.yaml

diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
new file mode 100644
index 000000000000..0ddf1fe51802
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom cable/DSL/settop platforms Device Tree Bindings
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
+  compatible:
+    oneOf:
+      - description: Boards with Broadcom bcm3368 SoC
+        items:
+          - const: brcm,bcm3368
+
+      - description: Boards with Broadcom bcm3384 SoC
+        items:
+          - const: brcm,bcm3384
+
+      - description: Boards with Broadcom bcm33843 SoC
+        items:
+          - const: brcm,bcm33843
+
+      - description: Boards with Broadcom bcm3384-viper SoC
+        items:
+          - const: brcm,bcm3384-viper
+
+      - description: Boards with Broadcom bcm33843-viper SoC
+        items:
+          - const: brcm,bcm33843-viper
+
+      - description: Boards with Broadcom bcm6328 SoC
+        items:
+          - const: brcm,bcm6328
+
+      - description: Boards with Broadcom bcm6358 SoC
+        items:
+          - const: brcm,bcm6358
+
+      - description: Boards with Broadcom bcm6362 SoC
+        items:
+          - const: brcm,bcm6362
+
+      - description: Boards with Broadcom bcm6368 SoC
+        items:
+          - const: brcm,bcm6368
+
+      - description: Boards with Broadcom bcm63168 SoC
+        items:
+          - const: brcm,bcm63168
+
+      - description: Boards with Broadcom bcm63268 SoC
+        items:
+          - const: brcm,bcm63268
+
+      - description: Boards with Broadcom bcm7125 SoC
+        items:
+          - const: brcm,bcm7125
+
+      - description: Boards with Broadcom bcm7346 SoC
+        items:
+          - const: brcm,bcm7346
+
+      - description: Boards with Broadcom bcm7358 SoC
+        items:
+          - const: brcm,bcm7358
+
+      - description: Boards with Broadcom bcm7360 SoC
+        items:
+          - const: brcm,bcm7360
+
+      - description: Boards with Broadcom bcm7362 SoC
+        items:
+          - const: brcm,bcm7362
+
+      - description: Boards with Broadcom bcm7420 SoC
+        items:
+          - const: brcm,bcm7420
+
+      - description: Boards with Broadcom bcm7425 SoC
+        items:
+          - const: brcm,bcm7425
+
+  cpus:
+    $ref: "/schemas/mips/cpus.yaml#"
+    unevaluatedProperties: false
+
+    properties:
+      mips-hpt-frequency:
+        description: This is common to all CPUs in the system so it lives
+         under the "cpus" node.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    required:
+      - mips-hpt-frequency
+
+additionalProperties: true
+
+...
-- 
2.25.1

