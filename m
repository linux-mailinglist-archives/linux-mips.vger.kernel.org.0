Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 210D0A2E75
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2019 06:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbfH3EdU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Aug 2019 00:33:20 -0400
Received: from forward102o.mail.yandex.net ([37.140.190.182]:42225 "EHLO
        forward102o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726090AbfH3EdU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Aug 2019 00:33:20 -0400
Received: from mxback10g.mail.yandex.net (mxback10g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:171])
        by forward102o.mail.yandex.net (Yandex) with ESMTP id EB30F66810AC;
        Fri, 30 Aug 2019 07:33:16 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback10g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id TFIhJTMHWz-XGRmmxTZ;
        Fri, 30 Aug 2019 07:33:16 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567139596;
        bh=NZ7snY+0LjG9EqUoVehADJL5MGmOGv9n12pbUOd604M=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=Dhr8UJ4JT3XH5PxeooZ0JazptkOpIFy8fMkUo/IPEY0g6tXloCfjOn69NXLJIiLXr
         gfuYh+PeMNE7t/YK1+A46AsMb5g6SYnaibxzvUGh1MZxk0f4/G2GbKCSYqjnqDKnEW
         7APKmkD6YZit7NkUiNwntfxy+NvqqwXuBYf/CupY=
Authentication-Results: mxback10g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id vFuwVxmDwr-X7DGwFMC;
        Fri, 30 Aug 2019 07:33:14 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 08/18] dt-bindings: interrupt-controller: Add Loongson-3 HTINTC
Date:   Fri, 30 Aug 2019 12:32:22 +0800
Message-Id: <20190830043232.20191-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document Loongson-3 HyperTransport Interrupt controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../loongson,ls3-htintc.yaml                  | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml
new file mode 100644
index 000000000000..51fee46ab060
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/interrupt-controller/loongson,ls3-htintc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Loongson-3 HyperTransport Interrupt Controller
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+description: |
+  This interrupt controller is found in the Loongson-3 family of chips to transfer
+  interrupts from PCH connected on HyperTransport bus.
+
+properties:
+  compatible:
+    const: loongson,ls3-htintc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 4
+    description: |
+      Four parent interrupts that recieve chained interrupt randomly.
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
+    htintc: interrupt-controller@fb000080 {
+      compatible = "loongson,ls3-htintc";
+      reg = <0xfb000080 0x100>;
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
2.22.0

