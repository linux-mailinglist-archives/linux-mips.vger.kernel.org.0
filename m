Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07684323829
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 08:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbhBXH55 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 02:57:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232164AbhBXH5Z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 02:57:25 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F64C06178A;
        Tue, 23 Feb 2021 23:56:45 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id r3so904964wro.9;
        Tue, 23 Feb 2021 23:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+YN7Bc5pB2WEQ1yJoqO0rNS97fCF9BNOChHdZpj7P+c=;
        b=W2qCYlG6qxiSFTw6eXLvAyxB3shzU8qiD36vJ2zVdvPRzcgDq16TEcazS09xpp5VR1
         q6Mk43zlSiJwFy3unwjW322SMBAZbjYT7J+O+Cq/tgPBHim4Bb3C8uDAL7xMfGyz+u0T
         vWxPumVmtT6dg7nwjz0b4xp3waBlrmFRM+o6N5dHvsynJZClMswVEs1lmqWo4/X6Quoi
         JlHNU3MsHGg+2AVZA9a7w+N12YVJ/E/olZcEuU1s1csGxxL5TVsn/QUokFO+E8YcpQmh
         +Sr5KHkzIZUVqW4YN3Epbndd/x2NEHi0712MB+hsDdf1+ZAe71LUqOv1XH2VuRIHZBMA
         2suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+YN7Bc5pB2WEQ1yJoqO0rNS97fCF9BNOChHdZpj7P+c=;
        b=QrHjz1QhauR7C0zt+tc77kqJs69KnGWTNwAifYaI057Vx5mXh2be9j9lJBeFkfeoCk
         wx8p9tSM3YsAY71QvBkDd2UoTpZ/AnbKICKuCmYzSc1WXlrTq87kOQYp1x03UJTT+WJC
         sF6yDO92WP/+iC6oiYVr4ftz0+mOTKcoXxmb6hbW6LC/A03T4GtWektFLrdYKStIIOpr
         fR0eT1vopHLenFsvtYMO99JY6wpsQl1dtVHyFVBwmmblaXehbtKd7S8Y/F4+LlWLYq3T
         Nc0JcSjqjUFojHuD+Epag0JU22IMq6dZMETJnWA0zNBDFAhtFdVP0YobMlesjuHPOg13
         Pcmw==
X-Gm-Message-State: AOAM533dbKWfUJhGqRWIOFFvywwQcOWJ2MuNoNDd2Y7qv8x6opYGATMD
        ajRDj72TK017M8jrU7YxHK0=
X-Google-Smtp-Source: ABdhPJyHvaxP0k4Imi07xm3ejDISkZyQxpndcRvFhBl9o+pxRbnM7JqT5x4WdsayxITrniTNxGkZKg==
X-Received: by 2002:a05:6000:188b:: with SMTP id a11mr29814959wri.151.1614153404063;
        Tue, 23 Feb 2021 23:56:44 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id u7sm1954033wrt.67.2021.02.23.23.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 23:56:43 -0800 (PST)
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
Date:   Wed, 24 Feb 2021 08:56:39 +0100
Message-Id: <20210224075640.20465-2-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224075640.20465-1-noltari@gmail.com>
References: <20210223204340.312-1-noltari@gmail.com>
 <20210224075640.20465-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document the binding for the BCM6345 external interrupt controller.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v3: pass dt_binding_check.
 v2: fix title typo.

 .../brcm,bcm6345-ext-intc.yaml                | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml
new file mode 100644
index 000000000000..a691510e78b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml
@@ -0,0 +1,78 @@
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
+      controller node. Valid values depend on the type of parent interrupt
+      controller.
+    maxItems: 4
+
+  brcm,field-width:
+    description: Interrupt controller field width (the default is 4).
+    maxItems: 1
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - "#address-cells"
+  - compatible
+  - reg
+  - "#interrupt-cells"
+  - interrupt-controller
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@10000018 {
+      #address-cells = <0>;
+      compatible = "brcm,bcm6345-ext-intc";
+      reg = <0x10000018 0x4>;
+
+      interrupt-parent = <&periph_intc>;
+      #interrupt-cells = <2>;
+
+      interrupt-controller;
+      interrupts = <24>, <25>, <26>, <27>;
+    };
+
+  - |
+    interrupt-controller@fffe0014 {
+      #address-cells = <0>;
+      compatible = "brcm,bcm6345-ext-intc";
+      reg = <0xfffe0014 0x4>;
+
+      interrupt-controller;
+      #interrupt-cells = <2>;
+
+      interrupt-parent = <&cpu_intc>;
+      interrupts = <3>, <4>, <5>, <6>;
+
+      brcm,field-width = <5>;
+    };
-- 
2.20.1

