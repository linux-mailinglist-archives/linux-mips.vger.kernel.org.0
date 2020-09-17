Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4521926DBE9
	for <lists+linux-mips@lfdr.de>; Thu, 17 Sep 2020 14:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgIQMp6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Sep 2020 08:45:58 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44074 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726859AbgIQMpt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Sep 2020 08:45:49 -0400
X-Greylist: delayed 389 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 08:45:42 EDT
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj8flWGNf7PsVAA--.770S2;
        Thu, 17 Sep 2020 20:39:01 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: Loongson64: Add UART node for LS7A PCH
Date:   Thu, 17 Sep 2020 20:39:01 +0800
Message-Id: <1600346341-5158-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxj8flWGNf7PsVAA--.770S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr1kAr4DCrW3Xr47ZrWxCrg_yoW8AFWxpF
        4jya9YgrWxXFnI9w13JFy8KF4fGFZ5CF9rWrn2y3y8Jws5K3Z0vr1xJFy8tF17WrW8ZayU
        Wan2934q9FsrZw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Xr1l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUL0eQUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When I update the latest kernel on the Loongson platform used with
LS7A bridge chip, the serial console has no output, this is because
the machine uses LS7A UART0 instead of CPU UART0, add UART node for
LS7A PCH to enhance the compatibility.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index e574a06..f99a7a1 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -19,6 +19,45 @@
 			#interrupt-cells = <2>;
 		};
 
+		ls7a_uart0: serial@10080000 {
+			compatible = "ns16550a";
+			reg = <0 0x10080000 0 0x100>;
+			clock-frequency = <50000000>;
+			interrupt-parent = <&pic>;
+			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+		};
+
+		ls7a_uart1: serial@10080100 {
+			status = "disabled";
+			compatible = "ns16550a";
+			reg = <0 0x10080100 0 0x100>;
+			clock-frequency = <50000000>;
+			interrupt-parent = <&pic>;
+			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+		};
+
+		ls7a_uart2: serial@10080200 {
+			status = "disabled";
+			compatible = "ns16550a";
+			reg = <0 0x10080200 0 0x100>;
+			clock-frequency = <50000000>;
+			interrupt-parent = <&pic>;
+			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+		};
+
+		ls7a_uart3: serial@10080300 {
+			status = "disabled";
+			compatible = "ns16550a";
+			reg = <0 0x10080300 0 0x100>;
+			clock-frequency = <50000000>;
+			interrupt-parent = <&pic>;
+			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+		};
+
 		pci@1a000000 {
 			compatible = "loongson,ls7a-pci";
 			device_type = "pci";
-- 
2.1.0

