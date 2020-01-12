Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2C3138577
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2020 09:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732420AbgALIUr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 03:20:47 -0500
Received: from forward103j.mail.yandex.net ([5.45.198.246]:53190 "EHLO
        forward103j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732370AbgALIUq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 03:20:46 -0500
X-Greylist: delayed 363 seconds by postgrey-1.27 at vger.kernel.org; Sun, 12 Jan 2020 03:20:44 EST
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
        by forward103j.mail.yandex.net (Yandex) with ESMTP id 153146740E36;
        Sun, 12 Jan 2020 11:15:01 +0300 (MSK)
Received: from mxback8q.mail.yandex.net (mxback8q.mail.yandex.net [IPv6:2a02:6b8:c0e:42:0:640:b38f:32ec])
        by forward103q.mail.yandex.net (Yandex) with ESMTP id 1022761E0008;
        Sun, 12 Jan 2020 11:15:01 +0300 (MSK)
Received: from vla1-ee05250d997a.qloud-c.yandex.net (vla1-ee05250d997a.qloud-c.yandex.net [2a02:6b8:c0d:3495:0:640:ee05:250d])
        by mxback8q.mail.yandex.net (mxback/Yandex) with ESMTP id OyCHLVWPLH-F0pqfcDT;
        Sun, 12 Jan 2020 11:15:01 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578816901;
        bh=CVEeCj5Nw0JRy5UhMzMQL9w0iN5X3gPEi0kdS+ta39E=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=KoioIhgSID9TutebLu6M1GtXSorWdSkHXB6BYIB7bqe7fFBfXcQOeVzsQWWGWuc8z
         d6pV/9eCRAYUiZPrPD7XWa93SaEPHV/Gjgkmh0UGwpbGNnuy22dD4sP/IO3w7Jkfbn
         Wv/tyAmFc3eiBwoEnqdxu46IqkI7G0kmp0z+9wRk=
Authentication-Results: mxback8q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla1-ee05250d997a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 3jM5RHRYtF-EoV4gOt4;
        Sun, 12 Jan 2020 11:14:55 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 03/10] dt-bindings: interrupt-controller: Add Loongson IOINTC
Date:   Sun, 12 Jan 2020 16:14:09 +0800
Message-Id: <20200112081416.722218-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
References: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document Loongson I/O Interrupt controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../interrupt-controller/loongson,iointc.yaml | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,iointc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,iointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,iointc.yaml
new file mode 100644
index 000000000000..b0fe6c551362
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,iointc.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/interrupt-controller/loongson,iointc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Loongson I/O Interrupt Controller
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+description: |
+  This interrupt controller is found in the Loongson-3 family of chips as the primary
+  package interrupt source which can route interrupt to interrupt line of cores.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: loongson,iointc-1.0
+      - const: loongson,iointc-1.0a
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  interrupts:
+    description:
+      Interrupt source of the CPU interrupts.
+    minItems: 1
+    maxItems: 4
+
+  interrupt-names:
+    description: List of names for the parent interrupts.
+    oneOf:
+      - items:
+          - const: int0
+          - const: int1
+          - const: int2
+          - const: int3
+    minItems: 1
+    maxItems: 4
+
+  '#interrupt-cells':
+    const: 2
+
+  'loongson,parent_int_map':
+    description: |
+      This property points the accept range of children interrupts
+      that parents will recieve. Each cell refers to a parent interrupt line
+      and each bit in the cell refers to a children interrupt. If a parent
+      did not connected, than keep it's cell with zero.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - items:
+          minItems: 4
+          maxItems: 4
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - 'loongson,parent_int_map'
+
+
+examples:
+  - |
+    iointc: interrupt-controller@3ff01400 {
+      compatible = "loongson,iointc-1.0";
+      reg = <0 0x3ff01400 0x64>;
+
+      interrupt-controller;
+      #interrupt-cells = <2>;
+
+      interrupt-parent = <&cpuintc>;
+      interrupts = <2>, <3>;
+      interrupt-names = "int0", "int1";
+
+      loongson,parent_int_map = <0xf0ffffff>, /* int0 */
+                                <0x0f000000>, /* int1 */
+                                <0x00000000>, /* int2 */
+                                <0x00000000>; /* int3 */
+
+    };
+
+...
-- 
2.24.1

