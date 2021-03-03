Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B390032BD92
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 23:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345498AbhCCQQo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 11:16:44 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47270 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1355136AbhCCG0I (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Mar 2021 01:26:08 -0500
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxOdSiKz9gd7ATAA--.25147S8;
        Wed, 03 Mar 2021 14:24:43 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] dt-bindings: interrupt-controller: Add Loongson-2K1000 LIOINTC
Date:   Wed,  3 Mar 2021 14:24:33 +0800
Message-Id: <20210303062434.22280-7-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303062434.22280-1-zhangqing@loongson.cn>
References: <20210303062434.22280-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxOdSiKz9gd7ATAA--.25147S8
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw47JF18XrW3trW3uFWkCrg_yoW8XFWxpF
        srCanIgF4jqF13uay8ta40ka15Zr98AwnrGwsFy3y7GFnrtw4jqw4agF1kJayYkFWIqa4q
        vryF9a10gasIyF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBSb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
        jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI
        8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2
        z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0V
        AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1l
        Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8AwCF04k20x
        vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
        3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
        AIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIhiSDUUUU
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add liointc-2.0 properties support, so update the maxItems and description.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---

v2:
- Add new patch

 .../bindings/interrupt-controller/loongson,liointc.yaml  | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
index f38e0113f360..96162b9d227c 100644
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
@@ -22,9 +22,10 @@ properties:
     oneOf:
       - const: loongson,liointc-1.0
       - const: loongson,liointc-1.0a
+      - const: loongson,liointc-2.0
 
   reg:
-    maxItems: 1
+    maxItems: 3
 
   interrupt-controller: true
 
-- 
2.20.1

