Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B9B368AC2
	for <lists+linux-mips@lfdr.de>; Fri, 23 Apr 2021 04:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240090AbhDWBxo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Apr 2021 21:53:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54684 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240162AbhDWBxo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Apr 2021 21:53:44 -0400
Received: from localhost.localdomain (unknown [58.249.121.165])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxLcl0KIJg9aoMAA--.16933S2;
        Fri, 23 Apr 2021 09:52:54 +0800 (CST)
From:   xiaochuan mao <maoxiaochuan@loongson.cn>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Qing Zhang <zhangqing@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        xiaochuan mao <maoxiaochuan@loongson.cn>
Subject: [PATCH] MIPS:DTS:Fix label name and interrupt number of ohci for Loongson-2K
Date:   Fri, 23 Apr 2021 09:52:34 +0800
Message-Id: <20210423015234.23870-1-maoxiaochuan@loongson.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: AQAAf9AxLcl0KIJg9aoMAA--.16933S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF13CF4fCr47uw1DWrWkXrb_yoWkKrg_GF
        929a1kGryfXFZakry7urs8JF13u3y7Ca4fCa42qry093s0vrs3GFWUCFWDGF93Wryjvrs3
        X395Wr48Cry7KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
        KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoPEfUUUUU
X-CM-SenderInfo: xpdr5xxdrfx3ldqnw6o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

from Loongson-2K1000 user manual know that under pci bus
the device num is 4, function number is 2 and register is 0x2200
is ohci. the ohci interrupt number is 51. because Loongson-2K1000 has
64 interrupt sources, 0-31 correspond to the device tree liointc0 device
 node, and the other correspond to liointc1 node. so it should be
number 19 correspon to liointc1.

Signed-off-by: xiaochuan mao <maoxiaochuan@loongson.cn>
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index fd0e99bfe57b..89f079097f32 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -125,14 +125,14 @@
 				interrupt-parent = <&liointc1>;
 			};
 
-			ehci@4,2 {
+			ohci@4,2 {
 				compatible = "pci0014,7a24.0",
 						   "pci0014,7a24",
 						   "pciclass0c0310",
 						   "pciclass0c03";
 
 				reg = <0x2200 0x0 0x0 0x0 0x0>;
-				interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+				interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
 				interrupt-parent = <&liointc1>;
 			};
 
-- 
2.17.1

