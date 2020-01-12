Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24403138570
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2020 09:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732371AbgALIUo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 03:20:44 -0500
Received: from forward104o.mail.yandex.net ([37.140.190.179]:48898 "EHLO
        forward104o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732369AbgALIUo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 03:20:44 -0500
Received: from forward100q.mail.yandex.net (forward100q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb97])
        by forward104o.mail.yandex.net (Yandex) with ESMTP id 440DD940B15;
        Sun, 12 Jan 2020 11:15:21 +0300 (MSK)
Received: from mxback10q.mail.yandex.net (mxback10q.mail.yandex.net [IPv6:2a02:6b8:c0e:1b4:0:640:b6ef:cb3])
        by forward100q.mail.yandex.net (Yandex) with ESMTP id 3EA1D7080004;
        Sun, 12 Jan 2020 11:15:21 +0300 (MSK)
Received: from vla1-ee05250d997a.qloud-c.yandex.net (vla1-ee05250d997a.qloud-c.yandex.net [2a02:6b8:c0d:3495:0:640:ee05:250d])
        by mxback10q.mail.yandex.net (mxback/Yandex) with ESMTP id zMZ6PamTTa-FKq0GxCt;
        Sun, 12 Jan 2020 11:15:21 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578816921;
        bh=kFUYrcnxgHhYt9NZF/PFTRJ9jW7qOpJ8qLdxtiiXBEo=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=vtVOJ5uuuwcqZt3Wp7mDGcWm2RTU0ac3q6QqObK27nejqJ+QKpZyybI9vTpYCpsMh
         JxWONnunGnLvc21+FaEOMuWidfSRcIzrdpdhKy+x6o/Z/uKkZ3ZsbgVcGDIX7bKuhb
         VTRw3D1A/eOEQP6JVMH4Y98E3MU+c+5vvL6DodNU=
Authentication-Results: mxback10q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla1-ee05250d997a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 3jM5RHRYtF-FDV4R9L7;
        Sun, 12 Jan 2020 11:15:18 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 05/10] dt-bindings: interrupt-controller: Add Loongson-3 HTPIC
Date:   Sun, 12 Jan 2020 16:14:11 +0800
Message-Id: <20200112081416.722218-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
References: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document Loongson-3 HyperTransport PIC controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../interrupt-controller/loongson,htpic.yaml  | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,htpic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,htpic.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,htpic.yaml
new file mode 100644
index 000000000000..efcc3f43e45b
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,htpic.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/interrupt-controller/loongson,htpic.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Loongson-3 HyperTransport Interrupt Controller
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+description: |
+  This interrupt controller is found in the Loongson-3 family of chips to transfer
+  interrupts from PCH PIC connected on HyperTransport bus.
+
+properties:
+  compatible:
+    const: loongson,htpic-1.0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+    description: |
+      Four parent interrupts that recieve chained interrupts.
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    htintc: interrupt-controller@1fb000080 {
+      compatible = "loongson,htintc-1.0";
+      reg = <0x1fb000080 0x100>;
+      interrupt-controller;
+      #interrupt-cells = <1>;
+
+      interrupt-parent = <&iointc>;
+      interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
+            <25 IRQ_TYPE_LEVEL_HIGH>,
+            <26 IRQ_TYPE_LEVEL_HIGH>,
+            <27 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
-- 
2.24.1

