Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46A3B5F5280
	for <lists+linux-mips@lfdr.de>; Wed,  5 Oct 2022 12:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbiJEKVh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Oct 2022 06:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiJEKVg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Oct 2022 06:21:36 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8F6760ED;
        Wed,  5 Oct 2022 03:21:35 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id j7so19885070wrr.3;
        Wed, 05 Oct 2022 03:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=HAshog50Hg6lN7H+lni1kCL0WsRmHtb+odbdpswRDfg=;
        b=eefjpfWZ6viq7VLgSGYidDJoK0enVUcRxftegGvZspm3uLeoZwzZ6mwVu5UY/1Iy5+
         ohqR6+8g0FIWC2nVJdiRkYx+aORK2mQW09xkob3+5PwRyZwM+FHEbbHPhoR5wPTkNelx
         sA6KI35a0jygetBBSrs/FkY9loDFb7fQ3ktXaUPJ5KzFVllG+gP+/Jzdx5W+RVT7xT5l
         TBi/Di6XowbReNLIMPi4HkUGNeexebLZjdKBGfeX5hJ8RomixQpwGaNAGr9bx0Ery6ql
         Pa91ycFfnkK7El25ivJEMn8kQrTd0epT9K/Niy8vWNtl2DgjtFTUwMYAjVLtFxdYuMC6
         ER0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=HAshog50Hg6lN7H+lni1kCL0WsRmHtb+odbdpswRDfg=;
        b=PbW5fwAS4CO6e+vKrEgbjIsEr7eL4FNIyVg2mZyheWNhdqxVUywTtIFHIWS1Ck03so
         hjlAreO2FArN2RMf4Dd8sO/QEcme191e4+1ZOqxUlJlktm+Cf4524I/MgDGmQNsO+kAN
         X6Z5/SpYXntibJynQ6S5vG74ZY7wmp4xKTpluN9b83CPQxqOV78tmiRQPd7pZjIvSQ5v
         wCvW8BF+7+jfab7zWgbFcdAR1K1hEhvPFxxl9hOOMioQbhHazBpq0Dsz0XIbmbgDjGPu
         f4hlGjqEm7OJ9fs6kXCRHrF/hm6gYGd4BprQ7qc7yxlCWDFXt3ue4xJjw9ClQkBC+olE
         mGaQ==
X-Gm-Message-State: ACrzQf0XkNH4VI86dZecLF5x9c+DLLKAbkMameMBTl+XJt+oA/j2w9Pk
        DDobxz/eF6otBOdZzjNSTpT08omppp7oAg==
X-Google-Smtp-Source: AMsMyM7dswrfxF2wJ7pLfqIexxnm9UPlD+2f9eJCJhTrbmILLpwTpWIa2TbWWX5SGaELb9k34wd0gA==
X-Received: by 2002:a05:6000:806:b0:22a:36df:2663 with SMTP id bt6-20020a056000080600b0022a36df2663mr18579272wrb.423.1664965293633;
        Wed, 05 Oct 2022 03:21:33 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id az30-20020adfe19e000000b002286670bafasm4481702wrb.48.2022.10.05.03.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 03:21:33 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com, f.fainelli@gmail.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v7 2/2] dt-bindings: mips: brcm: add Broadcom SoCs bindings
Date:   Wed,  5 Oct 2022 12:21:28 +0200
Message-Id: <20221005102128.1014468-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005102128.1014468-1-sergio.paracuellos@gmail.com>
References: <20221005102128.1014468-1-sergio.paracuellos@gmail.com>
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
 .../devicetree/bindings/mips/brcm/soc.yaml    | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.yaml

diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
new file mode 100644
index 000000000000..506316bdf51f
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

