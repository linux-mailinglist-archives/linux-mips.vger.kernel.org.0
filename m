Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7C635EEEC4
	for <lists+linux-mips@lfdr.de>; Thu, 29 Sep 2022 09:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235201AbiI2HU1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Sep 2022 03:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235198AbiI2HUP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Sep 2022 03:20:15 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3130C26106;
        Thu, 29 Sep 2022 00:20:10 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id ay7-20020a05600c1e0700b003b49861bf48so3376334wmb.0;
        Thu, 29 Sep 2022 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=nMAz+L+s6YIiw81tTgwMIbW0yzcm75JT2BvSqiuubfs=;
        b=hZQc5dBXtfgYaKhglXeRNgCIWleUx1X4N9prZrzvBGA2NkLhMxvYP/2HBwKLWejP0B
         5vVJUhHjWTo6Gac+HpZDqdDXbFFZ5/erK8vjnU6iwmKgZ3ABnmZNX71v2YWBl549h8Ad
         sJZJJEyPgsbmZdCUbsutovdHlaPCWN/CIY1XhHMiRF531o1AGu0kut4kXqzopvuCgOD1
         X41DlS8O8LPnz3PNQZjKsLIhJNBpVMWpKY2sH4zMUJyMhF52AannoFa2/8wxe+6Za10t
         iwevSu7HLsk3nqGPJId+pfXmYtHp6cLmqp86skOnrcSpwVAKVpD1EZplReeFwNEogAiy
         JO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nMAz+L+s6YIiw81tTgwMIbW0yzcm75JT2BvSqiuubfs=;
        b=7RkJ9wXPMu9JpQ/hN5X4KTIQAXDTmhe0OaNTeFggmw97zD6uehbCBKmmXN/xGRr7FR
         J0Jlz/7afzaNefP7xvYPrHcxVKfyu2oFY4AshryNYgn/OTjswc+7gS2nwlZtUvqCHUsN
         4IHVmMgBFIT1KtNn53YGhQFTC4VfiVwlGjIt+/OUnQhOPruBT9iV3mUBLYVek6gcRuJH
         zJcLerptr0narhI5Lk+JMaCas6tORV9RRk/yb5ozjrcaeu7B7s+L1I4QVWK/mW6DzPD5
         V6HCTn0+7VVgHVflg9EQVpWWLoAYZsMf7X2hfLTGrR0pEFgoXUGB2vJHieS+uWgYeheC
         mRSQ==
X-Gm-Message-State: ACrzQf0rzOBKR3H3ZbVci6yFrG1EAqedcrOZiutjlJgXtZm7xhLn6Hcz
        pAZl+KQEpgJGnCa+mrybhDcYCNrVgKjP+A==
X-Google-Smtp-Source: AMsMyM6jK0SIYY/bBid7hASVGNeEs0oYduRxPL7g2hDE0KZU3rV0TV+tj9szbjGxIvIo5dYs2DXnKg==
X-Received: by 2002:a05:600c:4f82:b0:3b4:9f2f:430b with SMTP id n2-20020a05600c4f8200b003b49f2f430bmr9545846wmq.16.1664436008863;
        Thu, 29 Sep 2022 00:20:08 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id q63-20020a1c4342000000b003b4bd18a23bsm3674250wma.12.2022.09.29.00.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 00:20:08 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, arinc.unal@arinc9.com
Subject: [PATCH v3 2/3] dt-bindings: mips: brcm: convert Broadcom SoCs to schema
Date:   Thu, 29 Sep 2022 09:20:03 +0200
Message-Id: <20220929072004.874795-3-sergio.paracuellos@gmail.com>
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

Convert Broadcom cable/DSL/settop platforms to YAML schema.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../devicetree/bindings/mips/brcm/soc.yaml    | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.yaml

diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
new file mode 100644
index 000000000000..37353709b5a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
@@ -0,0 +1,97 @@
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
+additionalProperties: true
+
+...
-- 
2.25.1

