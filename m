Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A137832F7D6
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 03:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhCFChE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 21:37:04 -0500
Received: from mail.loongson.cn ([114.242.206.163]:52740 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229969AbhCFCgr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Mar 2021 21:36:47 -0500
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH_Gx6kJgzxwVAA--.9772S8;
        Sat, 06 Mar 2021 10:36:41 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        wangming01@loongson.cn
Subject: [PATCH v3 6/7] dt-bindings: interrupt-controller: Add Loongson-2K1000 LIOINTC
Date:   Sat,  6 Mar 2021 10:36:32 +0800
Message-Id: <20210306023633.9579-7-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210306023633.9579-1-zhangqing@loongson.cn>
References: <20210306023633.9579-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxH_Gx6kJgzxwVAA--.9772S8
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw47JF18XrW3uF47uw1xXwb_yoW8XFWkpF
        srCanIgF4UtF13uay8tFy0ka15Zr98AwnruwsFy3y7GFnrtw4jqw1agF1kAayrCFWxXa4q
        vryF9a10gasIyF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4U
        JVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
        C0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j
        6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gr
        1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
        JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7V
        AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIx
        AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbD5r3UUUUU=
        =
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add liointc-2.0 properties support, so update the maxItems and description.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---

v2-v3: Fix warnings/errors abount running 'make dt_binding_check'

 .../bindings/interrupt-controller/loongson,liointc.yaml    | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
index f38e0113f360..5280cf60a9a7 100644
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
@@ -22,6 +22,7 @@ properties:
     oneOf:
       - const: loongson,liointc-1.0
       - const: loongson,liointc-1.0a
+      - const: loongson,liointc-2.0
 
   reg:
     maxItems: 1
-- 
2.20.1

