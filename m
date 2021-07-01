Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6FC33B8C80
	for <lists+linux-mips@lfdr.de>; Thu,  1 Jul 2021 05:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238711AbhGADEQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Jun 2021 23:04:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52792 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238647AbhGADEP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Jun 2021 23:04:15 -0400
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj0MRMN1gsBQbAA--.31546S4;
        Thu, 01 Jul 2021 11:01:39 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/3] dt-bindings: mips: Add Loongson-2K1000 reset support
Date:   Thu,  1 Jul 2021 11:01:37 +0800
Message-Id: <20210701030137.10566-3-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210701030137.10566-1-zhangqing@loongson.cn>
References: <20210701030137.10566-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj0MRMN1gsBQbAA--.31546S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJF15tFW5Gr1xWw1rtFy7Wrg_yoW8Gw43p3
        ZxC3W7Kr4F9F13uwsxKFy8AF1rZr9aya4xXF47twnrt3s8Ga1Yvw1ak3Z8ZF17GFy8XFW7
        XFZ7WFWUKa4Ikw7anT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280
        aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8w
        Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
        14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7
        AKxVWUAVWUtwCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
        Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
        xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
        cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
        AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
        14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU3BTYUUUUU
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Switch the DT binding to a YAML schema to enable the DT validation.

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---

v6-v7:
Add yaml file
---
 .../bindings/mips/loongson/ls2k-reset.yaml    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/loongson/ls2k-reset.yaml

diff --git a/Documentation/devicetree/bindings/mips/loongson/ls2k-reset.yaml b/Documentation/devicetree/bindings/mips/loongson/ls2k-reset.yaml
new file mode 100644
index 000000000000..6016ea756ccd
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/loongson/ls2k-reset.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mips/loongson/ls2k-reset.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Loongson 2K1000 PM Controller
+
+maintainers:
+  - Qing Zhang <zhangqing@loongson.cn>
+
+description: |
+  This controller can be found in Loongson-2K1000 Soc systems.
+
+properties:
+  compatible:
+    const: loongson,ls2k-pm
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        pm: power-controller@1fe07000 {
+            compatible = "loongson,ls2k-pm";
+            reg = <0 0x1fe07000 0 0x422>;
+        };
+    };
+...
-- 
2.31.0

