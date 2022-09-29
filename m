Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 065645EEEC9
	for <lists+linux-mips@lfdr.de>; Thu, 29 Sep 2022 09:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235205AbiI2HU2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Sep 2022 03:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235204AbiI2HUQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Sep 2022 03:20:16 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3249F26AF8;
        Thu, 29 Sep 2022 00:20:10 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id r6so707422wru.8;
        Thu, 29 Sep 2022 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Gh6gb7YiANVNxu4oDg6Xjz3DqjHK4eAT48wIlaA1jFI=;
        b=Fe3WMIx5d8tNrs78x3+nJUKZsCn6tHuuH4mOHlpJHDk53q6zMWUrMzxHTP0bD7lVkv
         BkF3o1mZzeVxnMEdckjC/r33y5qHQhkhoty/3u/cJop3eoZAikc/q46i2Njca4JtodN/
         kYp4j8FgUIXm+B4iVTI7nPHaUGU6fanwaZtP4WtM5gtikWLlGdk53WjCDPJWj76W+wi6
         7FYieu8PSSq9g2LsRXnz2tARjeT/8vatCdVWcohgIi//rQ2C5PPucnE4y3VM9AW+mYuq
         gvInXKnNgvjvEbd0gCnOo7BHrzAXTB5R6tgguv6FS4TT8R0xaqtuAHY0ofqnjKLC2+WY
         J6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Gh6gb7YiANVNxu4oDg6Xjz3DqjHK4eAT48wIlaA1jFI=;
        b=PX47aZAaMI20SIpo3COIr/Lb2PXLGKGMIVwmjCQU6HrekQCo+3VJPhby1SGeG8Li/1
         F7CJ+coCP17/1kjaZuxnZUhGrPq+7sL/jra4ynm/ZApnhN2QoKAIFY+2RrVMDsrBE7mu
         Q6wLMior7kP92WwpOdOo22r/1fuNsV8PUOz2Tdic8gqbfRryAeuOYqIjUFS7XNmf5moW
         2l+6UooPbjdbeyTaK/6QciNFe+TNHAsh3TgP6hKb6xQYy5w/UkIUKlXjjTg2wzpnW8M2
         JoM14MMVvNGQwUOSYLTg7j6/yzWSCSwo/2hQYd7ztoAYSox70JBZgQcNn+NaUbVWTyA7
         M/Rw==
X-Gm-Message-State: ACrzQf2KuugBNo1gAxDnG1y7jx/WVi49tRcBXZQAOIlK1OFx2PE6FbS/
        AZuGGT9M7UZEITgwr1g1D38uBxNxNnnC/g==
X-Google-Smtp-Source: AMsMyM7xl4d6HJLggmkU0k35kTooQN7Kf7m6LEVkwjZ5907aL/1xrpSsatTfB9XITJUfGTqvOXoWcg==
X-Received: by 2002:a5d:5083:0:b0:22c:bdf4:b3f7 with SMTP id a3-20020a5d5083000000b0022cbdf4b3f7mr1023790wrt.129.1664436007907;
        Thu, 29 Sep 2022 00:20:07 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id q63-20020a1c4342000000b003b4bd18a23bsm3674250wma.12.2022.09.29.00.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 00:20:07 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, arinc.unal@arinc9.com
Subject: [PATCH v3 1/3] dt-bindings: mips: add CPU bindings for MIPS architecture
Date:   Thu, 29 Sep 2022 09:20:02 +0200
Message-Id: <20220929072004.874795-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929072004.874795-1-sergio.paracuellos@gmail.com>
References: <20220929072004.874795-1-sergio.paracuellos@gmail.com>
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

Add the yaml binding for available CPUs in MIPS architecture.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../devicetree/bindings/mips/cpus.yaml        | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/cpus.yaml

diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Documentation/devicetree/bindings/mips/cpus.yaml
new file mode 100644
index 000000000000..4f8891f0755b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/cpus.yaml
@@ -0,0 +1,66 @@
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
+required:
+  - compatible
+
+additionalProperties: true
+
+examples:
+  - |
+    cpus {
+      #size-cells = <0>;
+      #address-cells = <1>;
+
+      cpu@0 {
+        device_type = "cpu";
+        compatible = "mips,mips1004Kc";
+        reg = <0>;
+      };
+
+      cpu@1 {
+        device_type = "cpu";
+        compatible = "mips,mips1004Kc";
+        reg = <1>;
+      };
+    };
-- 
2.25.1

