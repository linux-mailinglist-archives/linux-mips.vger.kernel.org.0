Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB97206CEA
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 08:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389382AbgFXGqU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 02:46:20 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48424 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389144AbgFXGpt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 02:45:49 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxXeuQ9vJebSBJAA--.397S9;
        Wed, 24 Jun 2020 14:45:40 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 7/7 RESEND] dt-bindings: interrupt-controller: Fix typos in loongson,liointc.yaml
Date:   Wed, 24 Jun 2020 14:45:36 +0800
Message-Id: <1592981136-3572-8-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592981136-3572-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592981136-3572-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxXeuQ9vJebSBJAA--.397S9
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4Dtw4rXr1ktry8Ww1Dtrb_yoW8Gry7pa
        yDC3ZFgF4Utr17C3yDt3Wvk3W3Zr98AwnrGFZ3ZrWxJFsxuw1jqr4agF95A3W5GrWxtFWU
        XryrKa10gFy2yw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUQa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
        ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48J
        MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
        AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
        0xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8V
        AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7Cj
        xVAFwI0_Cr1j6rxdYxBIdaVFxhVjvjDU0xZFpf9x0JUwmRUUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix the following two typos in loongson,liointc.yaml:
fron -> from
it's -> its

Fixes: b6280c8bb6f5 ("dt-bindings: interrupt-controller: Add Loongson LIOINTC")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 .../devicetree/bindings/interrupt-controller/loongson,liointc.yaml    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
index b1db21e..13908ca 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
@@ -51,8 +51,8 @@ properties:
     description: |
       This property points how the children interrupts will be mapped into CPU
       interrupt lines. Each cell refers to a parent interrupt line from 0 to 3
-      and each bit in the cell refers to a children interrupt fron 0 to 31.
-      If a CPU interrupt line didn't connected with liointc, then keep it's
+      and each bit in the cell refers to a children interrupt from 0 to 31.
+      If a CPU interrupt line didn't connected with liointc, then keep its
       cell with zero.
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 4
-- 
2.1.0

