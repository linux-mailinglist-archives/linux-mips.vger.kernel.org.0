Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB4E1AA63A
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 16:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730867AbfIEOpT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 10:45:19 -0400
Received: from forward106o.mail.yandex.net ([37.140.190.187]:59091 "EHLO
        forward106o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728918AbfIEOpT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 10:45:19 -0400
Received: from mxback29g.mail.yandex.net (mxback29g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:329])
        by forward106o.mail.yandex.net (Yandex) with ESMTP id C3D7750614C8;
        Thu,  5 Sep 2019 17:45:14 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback29g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id qq00eOLOnl-jE4uDOrI;
        Thu, 05 Sep 2019 17:45:14 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567694714;
        bh=gcNq3lEzj5b2qnUJYT9ZNQih1/0Y09rt0QQ/F5oueuw=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=e7ePAFgD3cGrcXyGvUwBTFXH6HBtpiG7EvMQVLJFyASxRze7s5+Y7WbMl4Pclji2j
         wUGaNz0tl6JmT6Ikb4mIggSgh+bhG3errTCauTCVhVQDfZxILHSClUJ8M4xI5ATXVA
         IE/uHZ4VV08eMKG5LCddF6KzK0e+N+bGVobCE7Z8=
Authentication-Results: mxback29g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id zkoybIaMjG-j2xW8RoL;
        Thu, 05 Sep 2019 17:45:12 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 06/19] dt-bindings: interrupt-controller: Add Loongson-3 IOINTC
Date:   Thu,  5 Sep 2019 22:43:03 +0800
Message-Id: <20190905144316.12527-7-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document Loongson-3 I/O Interrupt controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../loongson,ls3-iointc.yaml                  | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml
new file mode 100644
index 000000000000..c6e58c83181e
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/interrupt-controller/loongson,ls3-iointc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Loongson-3 I/O Interrupt Controller
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+description: |
+  This interrupt controller is found in the Loongson-3 family of chips as the primary
+  package interrupt source which can route interrupt to interrupt line of cores.
+
+properties:
+  compatible:
+    const: loongson,ls3-iointc
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    description: |
+      Specifies the number of cells needed to encode an interrupt source.
+      Must be 2 or 4.
+      If the system requires describing interrupt line & core mapping, than
+      it must be 4.
+
+      The 1st cell is the hardware interrupt number.
+
+      The 2nd cell is the flags, encoded as follows:
+        bits[3:0] trigger type and level flags.
+          1 = low-to-high edge triggered
+          2 = high-to-low edge triggered
+          4 = active high level-sensitive
+          8 = active low level-sensitive.
+
+      The 3rd is the parent interrupt line that interrupt would map to.
+      As the CPU preserved 4 interrupt lines for I/O, in theory any of the iointc
+      interrupt can be chained to any interrupt lines on a core. But currently
+      we can only map all the interrupt to a single parent, so this cell must be
+      set uniformly for all the child interrupts corresponding to the parent
+      interrupt.
+
+      The 4th is the parent core that interrupt would map to. The interrupt
+      contoller can map any of the interrupt to the specified core on a package.
+      This cell determined the core. It must be the bootcore.
+
+      If the 3rd, 4th cell is not set, it will default to the 0# interrupt line
+      and bootcore.
+
+    enum: [ 2, 4 ]
+
+  interrupts:
+    description:
+      Interrupt source of the CPU interrupt.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+
+
+examples:
+  - |
+    iointc: interrupt-controller@3ff01400 {
+        compatible = "loongson,ls3-io-intc";
+        reg = <0x3ff01400 0x60>;
+        interrupts = <2>;
+        interrupt-controller;
+        #interrupt-cells = <4>;
+    };
+...
-- 
2.22.0

