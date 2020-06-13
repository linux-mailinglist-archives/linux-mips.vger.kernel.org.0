Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09AEA1F81D9
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jun 2020 10:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgFMIWS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Jun 2020 04:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgFMIVq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Jun 2020 04:21:46 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00EBC08C5C1;
        Sat, 13 Jun 2020 01:21:45 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id x13so12143304wrv.4;
        Sat, 13 Jun 2020 01:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1E2Ih5H7xJKGoxw3JHd4DtWaa/tIBR+qMw0Gq6OYSe4=;
        b=L6qJwDrnWn0ihRuKWVZpvfxkUnj9w+K8r6r4ikLAtSfUHokX3r1x645HtLs3Xglomu
         BOD37kPT7T/QN5A1LLV7mXPjnN8xXAnYEDF0D3qYDRCVzSDSqeODq7ALfEpFEgNLabPa
         Kq38sCWQ64zudFbRxszzZh0gDtdIFi0qX84TrtxauqOb4RwMTnpTh6ruZ2f37C69XUIw
         /f7NYaMvIRObQb7IVgZrqEe7rICcsnbx6zl9UWLh1XGitCLYnlF0MxjcZdiVJdm6wHJA
         ZMJJHGSNCy2TpbAfjD8ft2VEaNlTariNZ172us5UVWxTl4LUT8WsSVOE6dXfs1agyk9x
         OQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1E2Ih5H7xJKGoxw3JHd4DtWaa/tIBR+qMw0Gq6OYSe4=;
        b=eoM/ilkd4cLIXQdVLdTdkXw7fhNEP2WgTVUzpy/ZAs4NCExJtfOHhJ4eeTX9Yy9HJB
         rng+bvARKS9oR+y3T1zemEFopsyij2AXSq+Z82DuQ9yQ++LIzo9wgU+r/6jr3mNdfyht
         tVH46f8pQzwm6T+Y/EL9ioXXaJdFxSK1jAdPBXTE/ZdyrktYcNyfOo8qsrWSd7Lj3zBC
         6TugiloHUShLfEMsaeK07b2JOf99lmegPXZB/eJH46u6f0abQc9aDHGYa31UIjP/BET2
         HgcHpFVaSFF60sOY0y4s9PNpJ0epGmzTFN8CLeOZcQzzyjf3t6fiR/3HB45A1elk4RPS
         b9Hw==
X-Gm-Message-State: AOAM532+G5c7mOZUPFKMw1oYSb4bkDtJjl5TOJBuf5DsFKXc+SlyrcoJ
        vsFrxox3LiRoqUPTB9l9gHM=
X-Google-Smtp-Source: ABdhPJw1hjDRx32smBdpBxZq6dqT18RaiGPaijgAgtyFVgaMLRqjVXS/AGYQtyGbbQ2rzfHmb3702Q==
X-Received: by 2002:adf:fdcd:: with SMTP id i13mr17893979wrs.190.1592036504596;
        Sat, 13 Jun 2020 01:21:44 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id n189sm12243603wmb.43.2020.06.13.01.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 01:21:44 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 1/9] dt-bindings: soc: brcm: add BCM63xx power domain binding
Date:   Sat, 13 Jun 2020 10:21:32 +0200
Message-Id: <20200613082140.2009461-2-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200613082140.2009461-1-noltari@gmail.com>
References: <20200610171630.465579-1-noltari@gmail.com>
 <20200613082140.2009461-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
to enable/disable certain components in order to save power.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v4: change license and move to bindings/power.
 v3: fix reg maxItems and quote #power-domain-cells.
 v2: Add separate YAML file.

 .../bindings/power/brcm,bcm63xx-power.yaml    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/brcm,bcm63xx-power.yaml

diff --git a/Documentation/devicetree/bindings/power/brcm,bcm63xx-power.yaml b/Documentation/devicetree/bindings/power/brcm,bcm63xx-power.yaml
new file mode 100644
index 000000000000..63b15ac6dde4
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/brcm,bcm63xx-power.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/power/brcm,bcm63xx-power.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: BCM63xx power domain driver
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+
+description: |
+  BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
+  to enable/disable certain components in order to save power.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - brcm,bcm6318-power-controller
+          - brcm,bcm6328-power-controller
+          - brcm,bcm6362-power-controller
+          - brcm,bcm63268-power-controller
+
+  reg:
+    maxItems: 1
+
+  "#power-domain-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#power-domain-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    periph_pwr: power-controller@10001848 {
+        compatible = "brcm,bcm6328-power-controller";
+        reg = <0x10001848 0x4>;
+        #power-domain-cells = <1>;
+    };
-- 
2.27.0

