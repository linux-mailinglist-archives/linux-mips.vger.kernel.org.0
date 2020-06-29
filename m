Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF8B20E9B4
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2020 02:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbgF2Xwb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jun 2020 19:52:31 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:49234 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726226AbgF2Xwa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Jun 2020 19:52:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1593474741; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gFkdmq/G4hHyDXhFU7khpQyL3r7ItP3IrHY9sXxnEFc=;
        b=yJwfyFh2U1fRCR9fVIcy2RMrK7OtKw65LLI5mnEQQqD9gU3S3CCoiNQVTArh4V3F2SpE72
        8iBLUA905PpUK5xFk22SC/+NZLs4CUtWwNqlHGVhmobBGW8jULPlhbzcn99an7i2IoiB2G
        ed+pYrNprsRMK+OSxxEJu1LvuzaRwHw=
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 02/10] dt-bindings: display: Add ingenic,ipu.yaml
Date:   Tue, 30 Jun 2020 01:52:02 +0200
Message-Id: <20200629235210.441709-2-paul@crapouillou.net>
In-Reply-To: <20200629235210.441709-1-paul@crapouillou.net>
References: <20200629235210.441709-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add documentation of the Device Tree bindings for the Image Processing
Unit (IPU) found in most Ingenic SoCs.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Add missing 'const' in items list

 .../bindings/display/ingenic,ipu.yaml         | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,ipu.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic,ipu.yaml b/Documentation/devicetree/bindings/display/ingenic,ipu.yaml
new file mode 100644
index 000000000000..5bfc33eb32c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic,ipu.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic,ipu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs Image Processing Unit (IPU) devicetree bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+        - ingenic,jz4725b-ipu
+        - ingenic,jz4760-ipu
+      - items:
+        - const: ingenic,jz4770-ipu
+        - const: ingenic,jz4760-ipu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: ipu
+
+patternProperties:
+  "^ports?$":
+    description: OF graph bindings (specified in bindings/graph.txt).
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4770-cgu.h>
+    ipu@13080000 {
+      compatible = "ingenic,jz4770-ipu", "ingenic,jz4760-ipu";
+      reg = <0x13080000 0x800>;
+
+      interrupt-parent = <&intc>;
+      interrupts = <29>;
+
+      clocks = <&cgu JZ4770_CLK_IPU>;
+      clock-names = "ipu";
+
+      port {
+        ipu_ep: endpoint {
+          remote-endpoint = <&lcdc_ep>;
+        };
+      };
+    };
-- 
2.27.0

