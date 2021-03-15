Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 970B533ACAB
	for <lists+linux-mips@lfdr.de>; Mon, 15 Mar 2021 08:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbhCOHuo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Mar 2021 03:50:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41278 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230280AbhCOHuU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Mar 2021 03:50:20 -0400
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxydSsEU9gcqMZAA--.1167S2;
        Mon, 15 Mar 2021 15:50:05 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 0/7] Add basic support for Loongson-2K1000
Date:   Mon, 15 Mar 2021 15:49:57 +0800
Message-Id: <20210315075004.15465-1-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxydSsEU9gcqMZAA--.1167S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urykAr1DAw4DKryfXFWDJwb_yoW8Ww13pw
        43Cw13Krs8Cry7Crn3JFyUur15ZrWrJrZrWF43Xr15G3sIqa4Yvr1fJFs8Jw47Zry8ta4j
        vryrGFW7GFnrC3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4xMxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
        IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
        87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4sXODUUUU
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

These patches support single-core DTS boot to the serial port login
interface, which can be operated using conventional commands.

I have successfully tested it on the Loongson 2K1000 machine.
pmon: http://cgit.loongnix.org/cgit/pmon-loongson3/

Note:
After the basic support is merged,
I will commit SMP and other driver support in the future.

Qing Zhang (7):
  MIPS: Loongson64: DeviceTree for Loongson-2K1000
  MIPS: Loongson64: Distinguish firmware dependencies DTB/LEFI
  MIPS: Loongson64: Add support for the Loongson-2K1000 to get
    cpu_clock_freq
  MIPS: Loongson64: Add Loongson-2K1000 early_printk_port
  irqchip/loongson-liointc: irqchip add 2.0 version
  dt-bindings: interrupt-controller: Add Loongson-2K1000 LIOINTC
  MIPS: Loongson64: Add a Loongson-2K1000 default config file

 .../loongson,liointc.yaml                     |  36 +-
 arch/mips/boot/dts/loongson/Makefile          |   1 +
 .../boot/dts/loongson/loongson64-2k1000.dtsi  | 243 ++++++++++++
 .../dts/loongson/loongson64_2core_2k1000.dts  |  10 +
 arch/mips/configs/loongson2k_defconfig        | 353 ++++++++++++++++++
 .../asm/mach-loongson64/builtin_dtbs.h        |   1 +
 .../include/asm/mach-loongson64/loongson.h    |   9 +-
 arch/mips/loongson64/env.c                    |  13 +-
 arch/mips/loongson64/init.c                   |  21 +-
 arch/mips/loongson64/time.c                   |  24 ++
 drivers/irqchip/irq-loongson-liointc.c        |  58 ++-
 11 files changed, 751 insertions(+), 18 deletions(-)
 create mode 100644 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dts
 create mode 100644 arch/mips/configs/loongson2k_defconfig

-- 
2.20.1

