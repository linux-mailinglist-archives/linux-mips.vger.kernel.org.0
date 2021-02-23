Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3988B323044
	for <lists+linux-mips@lfdr.de>; Tue, 23 Feb 2021 19:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233843AbhBWSJ2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 13:09:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233167AbhBWSJ0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 13:09:26 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A98C06174A;
        Tue, 23 Feb 2021 10:08:45 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id t15so23460846wrx.13;
        Tue, 23 Feb 2021 10:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FDqNjV640N+fZG6ZT5uNH9gvHou59xVjyGD1FaFKSKs=;
        b=LGhnwtAw4zed9PSaqk2CtUiHjfHnnl6F+qdH+thJyJkKkJNFplPPAhxYnvXXXwUAqJ
         HG49/53GpnXRy7UcEtVYC+HzZ9NzIVz4RmVYOPZkkRgfvWVUbOOCJ9YMm44Tm/JW7QtL
         ndkpJE5eD3lsECnpCIr9SU8HqjWmycBbowTcdvkDdLWSzFH1i7xOVAByxoGl2ooy/sR3
         QCrelWOUSpl5bo5rS+oVXLWqQa5NP7IfAUT9vLhI40KgYbRKbYnzhG1s0Uim1OZqVO+M
         MLJ+bXDHjmki6NQJXTl7Rxgrq57aDRrEXWmeaeCKJ3Yi4BlDy1njL03INcRJ8o4CB0tT
         4VQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FDqNjV640N+fZG6ZT5uNH9gvHou59xVjyGD1FaFKSKs=;
        b=GVNDWej7CqDYz2933h1gW3SoW8sL+y5VAEuOm0ADKrssC0J+mc9KPKsSBzraVGLgll
         +EE7H7JfZxMT1f2+EemgcwJ5ONUiSemYFgtXgPqvIdU+1h07IFAvwYeuezYFq0RCIZ1I
         yax0R/e3cEIPqzd20hOA5X6+WIVfV2eIJEEEuto2z7rB8RQhMOk5IgzGZ3thoViheLvj
         jNbJUYL5/GhBYWkylLw5VLpiuVvWbkgmEkJKfwSNtPcedwzOSGq8k1k2f3tqzvnbrp1n
         Yor52pg20BsqH+uSUA2nu8eDZijKzi9uM8Sb8h/lejcLPlPSLQ5hpjcFIzruwYEoizHj
         esqQ==
X-Gm-Message-State: AOAM530OyNYbNuhLcLqHGoepNabU3l+Frjf7k22dUS84ea3czvkceq7V
        7UU/KF077BSHlTY5/APeSW4=
X-Google-Smtp-Source: ABdhPJyXpcpT5q48IXHL8o184o4yW+1nqBkQnC8Hl86JYaiCTWzeiJZmwqWs0sZx7Pq8D7WnBwKElw==
X-Received: by 2002:adf:e8c2:: with SMTP id k2mr6450124wrn.401.1614103724535;
        Tue, 23 Feb 2021 10:08:44 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id v18sm31101709wrf.75.2021.02.23.10.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 10:08:44 -0800 (PST)
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
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: document BCM6345 external interrupt controller
Date:   Tue, 23 Feb 2021 19:08:39 +0100
Message-Id: <20210223180840.28771-2-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210223180840.28771-1-noltari@gmail.com>
References: <20210223180840.28771-1-noltari@gmail.com>
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
 .../brcm,bcm6345-ext-intc.yaml                | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml
new file mode 100644
index 000000000000..9cc29fa03968
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/brcm,brcm6345-ext-intc.yaml#
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

