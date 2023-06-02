Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA4971FE45
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jun 2023 11:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234635AbjFBJus (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jun 2023 05:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234645AbjFBJuq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Jun 2023 05:50:46 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7EF52E40;
        Fri,  2 Jun 2023 02:50:40 -0700 (PDT)
Received: from loongson.cn (unknown [223.106.25.146])
        by gateway (Coremail) with SMTP id _____8Bx1fBvu3lk85YDAA--.7888S3;
        Fri, 02 Jun 2023 17:50:39 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_7Nqu3lkzrqFAA--.20150S3;
        Fri, 02 Jun 2023 17:50:37 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Binbin Zhou <zhoubb.aaron@gmail.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>,
        loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V5 1/5] dt-bindings: rtc: Remove the LS2X from the trivial RTCs
Date:   Fri,  2 Jun 2023 17:50:20 +0800
Message-Id: <1b0bb443bd74647c17b7902f3d719700f81a1dba.1685693501.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1685693501.git.zhoubinbin@loongson.cn>
References: <cover.1685693501.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx_7Nqu3lkzrqFAA--.20150S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXFWfXF17Cw13XF4xZrWkJFb_yoW5GF4Dpa
        nrC3Z8Kr4qqF17Z39rta48Cw15Zas5A3ZrGFsFyw17Gas8C3WFqw4akw1DX3W3CFW8WFW7
        WFyv9r4rKF17Ar7anT9S1TB71UUUUbUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
        w2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2
        jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262
        kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
        07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
        1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8
        JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
        1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
        YxBIdaVFxhVjvjDU0xZFpf9x07jr9NsUUUUU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move Loongson RTC bindings from trivial-rtc.yaml into loongson,rtc.yaml.

The architectures associated with this driver use the built-in DTB, so
we can just drop the compatible(rtc-ls2x) with wildcards.
Also, soc-based compatible is more accurate for hardware differences
between chips.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../devicetree/bindings/rtc/loongson,rtc.yaml | 57 +++++++++++++++++++
 .../devicetree/bindings/rtc/trivial-rtc.yaml  |  2 -
 2 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/loongson,rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
new file mode 100644
index 000000000000..f89c1f660aee
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/loongson,rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson Real-Time Clock
+
+description:
+  The Loongson family chips use an on-chip counter 0 (Time Of Year
+  counter) as the RTC.
+
+maintainers:
+  - Binbin Zhou <zhoubinbin@loongson.cn>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - loongson,ls1b-rtc
+          - loongson,ls1c-rtc
+          - loongson,ls7a-rtc
+          - loongson,ls2k1000-rtc
+      - items:
+          - enum:
+              - loongson,ls2k2000-rtc
+              - loongson,ls2k0500-rtc
+          - const: loongson,ls7a-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@1fe27800 {
+        compatible = "loongson,ls2k1000-rtc";
+        reg = <0x1fe27800 0x100>;
+
+        interrupt-parent = <&liointc1>;
+        interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index a3603e638c37..9af77f21bb7f 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -47,8 +47,6 @@ properties:
       - isil,isl1218
       # Intersil ISL12022 Real-time Clock
       - isil,isl12022
-      # Loongson-2K Socs/LS7A bridge Real-time Clock
-      - loongson,ls2x-rtc
       # Real Time Clock Module with I2C-Bus
       - microcrystal,rv3029
       # Real Time Clock
-- 
2.39.1

