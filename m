Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377E21D6EB4
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 04:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgERCLJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 May 2020 22:11:09 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55246 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726670AbgERCLI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 17 May 2020 22:11:08 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axlum37sFexeY1AA--.69S2;
        Mon, 18 May 2020 10:11:03 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2] MIPS: Loongson: Enable devicetree based probing for 8250 ports in defconfig
Date:   Mon, 18 May 2020 10:11:01 +0800
Message-Id: <1589767861-9784-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Axlum37sFexeY1AA--.69S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1DuFWkXrWxXF47WrWDCFg_yoW8Xw15pa
        1fAa1DJFWvqFn5tw48GFyDurWYyFnxAFW2gF47Ar15ua98tay0vw1Sy34jyr47WFWktayF
        vr93KF9FyF43C3DanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9m14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v
        4I1lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMx
        CIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
        JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
        v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
        j40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
        0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUcjjDUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After commit 87fcfa7b7fe6 ("MIPS: Loongson64: Add generic dts"),
there already exists the node and property of Loongson CPU UART0
in loongson3-package.dtsi:

cpu_uart0: serial@1fe001e0 {
        compatible = "ns16550a";
        reg = <0 0x1fe001e0 0x8>;
        clock-frequency = <33000000>;
        interrupt-parent = <&liointc>;
        interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
        no-loopback-test;
};

In order to support for serial console on the Loongson platform,
add CONFIG_SERIAL_OF_PLATFORM=y to loongson3_defconfig.

With this patch, we can see the following boot messages:

[    1.877745] printk: console [ttyS0] disabled
[    1.881979] 1fe001e0.serial: ttyS0 at MMIO 0x1fe001e0 (irq = 16, base_baud = 2062500) is a 16550A
[    1.890838] printk: console [ttyS0] enabled

And also, we can login normally from the serial console.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---

v2:
  - Modify the patch subject

 arch/mips/configs/loongson3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 4df2434..3d4c7e9 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -217,6 +217,7 @@ CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_MANY_PORTS=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_8250_RSA=y
+CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_HW_RANDOM=y
 CONFIG_RAW_DRIVER=m
 CONFIG_I2C_CHARDEV=y
-- 
2.1.0

