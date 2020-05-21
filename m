Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4508C1DCEF6
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 16:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729762AbgEUOHo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 10:07:44 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:38286 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729728AbgEUOHk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 May 2020 10:07:40 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id BC46F8030791;
        Thu, 21 May 2020 14:07:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id sop25_UHIheO; Thu, 21 May 2020 17:07:36 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 01/13] dt-bindings: power: Convert mti,mips-cpc to DT schema
Date:   Thu, 21 May 2020 17:07:12 +0300
Message-ID: <20200521140725.29571-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200521140725.29571-1-Sergey.Semin@baikalelectronics.ru>
References: <20200521140725.29571-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It's a Cluster Power Controller embedded into the MIPS IP cores.
Currently the corresponding dts node is supposed to have compatible
and reg properties.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 .../bindings/power/mti,mips-cpc.txt           |  8 -----
 .../bindings/power/mti,mips-cpc.yaml          | 35 +++++++++++++++++++
 2 files changed, 35 insertions(+), 8 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/mti,mips-cpc.txt
 create mode 100644 Documentation/devicetree/bindings/power/mti,mips-cpc.yaml

diff --git a/Documentation/devicetree/bindings/power/mti,mips-cpc.txt b/Documentation/devicetree/bindings/power/mti,mips-cpc.txt
deleted file mode 100644
index c6b82511ae8a..000000000000
--- a/Documentation/devicetree/bindings/power/mti,mips-cpc.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-Binding for MIPS Cluster Power Controller (CPC).
-
-This binding allows a system to specify where the CPC registers are
-located.
-
-Required properties:
-compatible : Should be "mti,mips-cpc".
-regs: Should describe the address & size of the CPC register region.
diff --git a/Documentation/devicetree/bindings/power/mti,mips-cpc.yaml b/Documentation/devicetree/bindings/power/mti,mips-cpc.yaml
new file mode 100644
index 000000000000..9cd92a57130c
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/mti,mips-cpc.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/mti,mips-cpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPS Cluster Power Controller
+
+description: |
+  Defines a location of the MIPS Cluster Power Controller registers.
+
+maintainers:
+  - Paul Burton <paulburton@kernel.org>
+
+properties:
+  compatible:
+    const: mti,mips-cpc
+
+  reg:
+    description: |
+      Base address and size of an unoccupied memory region, which will be
+      used to map the MIPS CPC registers block.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    cpc@1bde0000 {
+      compatible = "mti,mips-cpc";
+      reg = <0 0x1bde0000 0 0x8000>;
+    };
+...
-- 
2.25.1

