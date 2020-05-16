Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3591D5F4F
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2020 09:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgEPHDW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 May 2020 03:03:22 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40162 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725275AbgEPHDW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 16 May 2020 03:03:22 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxFuoxkL9eqmM1AA--.11S2;
        Sat, 16 May 2020 15:03:14 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: Loongson: Add support for serial console
Date:   Sat, 16 May 2020 15:03:08 +0800
Message-Id: <1589612588-29196-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxFuoxkL9eqmM1AA--.11S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1DuFWkXrWxXF47WrWDCFg_yoW8XF45pa
        15Aa1DJFWkWFn5trW8GFyDurWFyFnxAFW2gF17Jr15ua98t34jvr1Sy34Utr47XFWkt3yF
        vr93KF9FyF47C3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
        GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
        WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
        7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
        1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjX_-PUUUU
        U==
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

With this patch, we can see the following boot message:

[    1.877745] printk: console [ttyS0] disabled
[    1.881979] 1fe001e0.serial: ttyS0 at MMIO 0x1fe001e0 (irq = 16, base_baud = 2062500) is a 16550A
[    1.890838] printk: console [ttyS0] enabled

And also, we can login normally from the serial console.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

Hi Jiaxun,

Thank you very much for your suggestion.

 arch/mips/configs/loongson3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 6768c16..cd95f08 100644
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

