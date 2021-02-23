Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36891323249
	for <lists+linux-mips@lfdr.de>; Tue, 23 Feb 2021 21:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbhBWUon (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 15:44:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234309AbhBWUo2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 15:44:28 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2697C06178A;
        Tue, 23 Feb 2021 12:43:47 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id k66so1261241wmf.1;
        Tue, 23 Feb 2021 12:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7ONzM0LoVk0vRYy/lEpvHhgvMFEPOQG0wnUFT0qIaXQ=;
        b=dgGNr7s0Vgdw189vBCbpdShXOYkJv9KgNAVcfnE3E+eVZawpX0IlexAwukOsorNnuQ
         stMqGTiOQQZOLr/gkZvhT7FbpH5WDI9uV8QnoGsr8SJsvS+LKrLL6NLbYykG1qYHRdGf
         RdK8epcyleVt9/ElLf5b8GOsjxUq/nl/wUnJiHhcC/4l96r/qUwY4gnhxuiHO+vQPGpE
         x6a9E4kSYiQpSABbX5D2NJ/HBqWgqqgiA7cwEbh2gylW2xTrYhBqIefdP0GZv6yXwLDU
         8HHSTJZYD3F60Z1mgYuET6bB1N4P13wIbLCfWo52Onys66ZcC5fq40Uiv8ZcRfec9vHp
         CuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7ONzM0LoVk0vRYy/lEpvHhgvMFEPOQG0wnUFT0qIaXQ=;
        b=gSvR4A/lFoVxr6oTYcnGPsIktbBi/QKgPzvIzIrE47/d0Yw5//XUm/LU2ZBQI84Zxe
         voTGkqt230stK13Nt4lMsQ+a7n+hYw03RgendwZFrIAFQGbFmFgc7NSYnjGpoE1A92ie
         czIkTXtAh2siGg7ZbUjhmDMHHKp1IfVSYllrS+Vagdz2ORqPAI0kFh2QGxEoeWDM0frr
         lOp/7SsKrqRE6WgzN/w3T+y+5mgVDWsh8dZp1SB/NZTmxxi5a/Q/WXqZNenRkkFuk0Or
         R5rNNGsonFVUWxCsIKStVi8QPYAL3aq7w2m0IiyFvZ39Ys64VacHkhf2ypYGwNZ1KIYq
         Sz7g==
X-Gm-Message-State: AOAM533jNV+3a6Bk0uTIUZ/SA2ono62BfLk0wW9Qmm8hUwRjmsx5GPJW
        tWpBJg8wttqU7+9yIG0P7U4=
X-Google-Smtp-Source: ABdhPJxoR8sF6ximqZGkF84Ij7BbF+kG/ld5AozM8i/o69MszTwvfy1gLBrQmXs4aWba/YcCtQaOzQ==
X-Received: by 2002:a05:600c:19cf:: with SMTP id u15mr480014wmq.139.1614113026434;
        Tue, 23 Feb 2021 12:43:46 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id q140sm4048935wme.0.2021.02.23.12.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 12:43:46 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: interrupt-controller: document BCM6345 external interrupt controller
Date:   Tue, 23 Feb 2021 21:43:39 +0100
Message-Id: <20210223204340.312-2-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210223204340.312-1-noltari@gmail.com>
References: <20210223180840.28771-1-noltari@gmail.com>
 <20210223204340.312-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document the binding for the BCM6345 external interrupt controller.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 v2: fix title typo.

 .../brcm,bcm6345-ext-intc.yaml                | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml
new file mode 100644
index 000000000000..b29a3221a6d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm6345-ext-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6345 external interrupt controller
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm6318-ext-intc
+      - brcm,bcm6345-ext-intc
+
+  interrupt-parent:
+    description: Specifies the phandle to the parent interrupt controller
+      this one is cascaded from.
+
+  "#interrupt-cells":
+    const: 2
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 0
+
+  interrupt-controller: true
+
+  interrupts:
+    description: Specifies the interrupt line(s) in the interrupt-parent
+      controller node, valid values depend on the type of parent interrupt
+      controller.
+    maxItems: 4
+
+required:
+  - compatible
+  - interrupt-parent
+  - "#interrupt-cells"
+  - reg
+  - "#address-cells"
+  - interrupt-controller
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    ext_intc: interrupt-controller@10000018 {
+      compatible = "brcm,bcm6345-ext-intc";
+      interrupt-parent = <&periph_intc>;
+      #interrupt-cells = <2>;
+      reg = <0x10000018 0x4>;
+      #address-cells = <0>;
+      interrupt-controller;
+      interrupts = <24>, <25>, <26>, <27>;
+    };
-- 
2.20.1

