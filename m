Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3F845E432
	for <lists+linux-mips@lfdr.de>; Fri, 26 Nov 2021 02:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357603AbhKZB5p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Nov 2021 20:57:45 -0500
Received: from mail.loongson.cn ([114.242.206.163]:35570 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1357502AbhKZBzn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Nov 2021 20:55:43 -0500
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_9PSPaBh1ooBAA--.6419S4;
        Fri, 26 Nov 2021 09:52:19 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/3] dt-bindings: mips: Add Loongson-2K1000 reset support
Date:   Fri, 26 Nov 2021 09:52:16 +0800
Message-Id: <20211126015216.26605-3-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211126015216.26605-1-zhangqing@loongson.cn>
References: <20211126015216.26605-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_9PSPaBh1ooBAA--.6419S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJF15Xw13Zr1rtF1kCr1xXwb_yoW8XF4rpF
        nxC3W7Kr4F9F13uws3KFy8Aw1rZr9aya4xXF47tr1Dtwn8Ga1Yvw1ak3Z8ZF17GF18XFWU
        XFZ7urWUKa42kw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUB2b7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2
        jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
        kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm
        72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6w4l42xK82IYc2
        Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
        6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
        vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
        42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
        kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIg18DUUUU
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Switch the DT binding to a YAML schema to enable the DT validation.

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---
v8-v9:
only modify 'make DT_CHECKER_FLAGS=-m dt_binding_check' warnings/errors
---
 .../bindings/mips/loongson/ls2k-reset.yaml    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/loongson/ls2k-reset.yaml

diff --git a/Documentation/devicetree/bindings/mips/loongson/ls2k-reset.yaml b/Documentation/devicetree/bindings/mips/loongson/ls2k-reset.yaml
new file mode 100644
index 0000000000000..20b5836efd90a
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
+        pm: reset-controller@1fe07000 {
+            compatible = "loongson,ls2k-pm";
+            reg = <0 0x1fe07000 0 0x422>;
+        };
+    };
+...
-- 
2.31.0

