Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6A6B33ACA6
	for <lists+linux-mips@lfdr.de>; Mon, 15 Mar 2021 08:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbhCOHum (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Mar 2021 03:50:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41290 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230286AbhCOHuU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Mar 2021 03:50:20 -0400
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxydSsEU9gcqMZAA--.1167S8;
        Mon, 15 Mar 2021 15:50:14 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Ming Wang <wangming01@loongson.cn>
Subject: [PATCH v5 6/7] dt-bindings: interrupt-controller: Add Loongson-2K1000 LIOINTC
Date:   Mon, 15 Mar 2021 15:50:03 +0800
Message-Id: <20210315075004.15465-7-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315075004.15465-1-zhangqing@loongson.cn>
References: <20210315075004.15465-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxydSsEU9gcqMZAA--.1167S8
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw47JrWDWFWftr4rAw48Xrb_yoW8Zr18pF
        ZxCanxWF4UtF13u3y8tFy0ka15Zr95AwnrAan2y3y7GFsrtw1jqr4agF1kJay3Cr92qa4j
        vFy0k3WUGasFyF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
        1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GF4l42
        xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
        GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
        8JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4U
        JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
        C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjPEf3UUUUU==
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add liointc-2.0 properties support, so update the maxItems and
condition description.

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
Tested-by: Ming Wang <wangming01@loongson.cn>
---

v4-v5:
- Add reg condition description

 .../loongson,liointc.yaml                     | 36 ++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
index f38e0113f360..067165c4b836 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
@@ -10,9 +10,9 @@ maintainers:
   - Jiaxun Yang <jiaxun.yang@flygoat.com>
 
 description: |
-  This interrupt controller is found in the Loongson-3 family of chips as the primary
-  package interrupt controller which can route local I/O interrupt to interrupt lines
-  of cores.
+  This interrupt controller is found in the Loongson-3 family of chips and
+  Loongson-2K1000 chip, as the primary package interrupt controller which
+  can route local I/O interrupt to interrupt lines of cores.
 
 allOf:
   - $ref: /schemas/interrupt-controller.yaml#
@@ -22,9 +22,17 @@ properties:
     oneOf:
       - const: loongson,liointc-1.0
       - const: loongson,liointc-1.0a
+      - const: loongson,liointc-2.0
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: main
+      - const: isr0
+      - const: isr1
 
   interrupt-controller: true
 
@@ -69,6 +77,26 @@ required:
 
 unevaluatedProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - loongson,liointc-2.0
+
+then:
+  properties:
+    reg:
+      minItems: 3
+
+  required:
+    - reg-names
+
+else:
+  properties:
+    reg:
+      maxItems: 1
+
 examples:
   - |
     iointc: interrupt-controller@3ff01400 {
-- 
2.20.1

