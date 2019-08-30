Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFB39A2E67
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2019 06:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbfH3EdB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Aug 2019 00:33:01 -0400
Received: from forward101p.mail.yandex.net ([77.88.28.101]:59209 "EHLO
        forward101p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725819AbfH3EdA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Aug 2019 00:33:00 -0400
Received: from mxback11g.mail.yandex.net (mxback11g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:90])
        by forward101p.mail.yandex.net (Yandex) with ESMTP id 7FD383280711;
        Fri, 30 Aug 2019 07:32:56 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback11g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id ed7UcnEzyq-WuC8gcCF;
        Fri, 30 Aug 2019 07:32:56 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567139576;
        bh=VD9k6EC93VnKj/3YVMc7QTVJI+Lj0puUJgN+sd5hBPM=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=HfERE2Im2NgUtA1292WFPq/OzdAsL6ntfOSFHEhGOJhK8IJdAISVOFgTlDaqVnRE3
         l/UQMoKGBY3Xn+rCEOFZ0vwYO68uYzqZj6bJXhOYHzY9kYwZeRNDpBgAsszjsmm7my
         6Y6d9M+VXLIPD00GIlE3I+pepqAZt1+Od2pCs2as=
Authentication-Results: mxback11g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id vFuwVxmDwr-WlDGm3mn;
        Fri, 30 Aug 2019 07:32:54 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 06/18] dt-bindings: interrupt-controller: Add Loongson-3 IOINTC
Date:   Fri, 30 Aug 2019 12:32:20 +0800
Message-Id: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document Loongson-3 I/O Interrupt controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../loongson,ls3-iointc.yaml                  | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml
new file mode 100644
index 000000000000..9aee10abd5cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml
@@ -0,0 +1,75 @@
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

