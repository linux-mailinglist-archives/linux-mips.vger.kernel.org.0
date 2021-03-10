Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 539AA3336BD
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 08:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhCJH5Q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 02:57:16 -0500
Received: from mail.loongson.cn ([114.242.206.163]:33360 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229828AbhCJH4z (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 02:56:55 -0500
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn_O3e0hg6KoXAA--.12657S2;
        Wed, 10 Mar 2021 15:56:39 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 0/7] Add basic support for Loongson-2K1000
Date:   Wed, 10 Mar 2021 15:56:32 +0800
Message-Id: <20210310075639.20372-1-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn_O3e0hg6KoXAA--.12657S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urykAr1DAw4DKryfXFWDJwb_yoW8ArW3pw
        43CwnxKF45Cry7Crn3JFyUuryrZrWfJrZrWF43Xr15GasIqa4Yvr13tFs8JwsrZr93ta4j
        9ryrGFW7GFnrC3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8CwCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
        AIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
        z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU890ePUUUUU==
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
I will submit SMP and other peripheral support in the future. 

Qing Zhang (7):
  MIPS: Loongson64: DeviceTree for Loongson-2K1000
  MIPS: Loongson64: Distinguish firmware dependencies DTB/LEFI
  MIPS: Loongson64: Add support for the Loongson-2K1000 to get
    cpu_clock_freq
  MIPS: Loongson64: Add Loongson-2K1000 early_printk_port
  irqchip/loongson-liointc: irqchip add 2.0 version
  dt-bindings: interrupt-controller: Add Loongson-2K1000 LIOINTC
  MIPS: Loongson64: Add a Loongson-2K1000 default config file

 .../loongson,liointc.yaml                     |   7 +-
 arch/mips/boot/dts/loongson/Makefile          |   1 +
 .../boot/dts/loongson/loongson64-2k1000.dtsi  | 243 ++++++++++++
 .../dts/loongson/loongson64_2core_2k1000.dts  |  10 +
 arch/mips/configs/loongson2k_defconfig        | 353 ++++++++++++++++++
 .../include/asm/mach-loongson64/boot_param.h  |   6 +
 .../asm/mach-loongson64/builtin_dtbs.h        |   1 +
 .../include/asm/mach-loongson64/loongson.h    |   3 +-
 arch/mips/loongson64/env.c                    |  13 +-
 arch/mips/loongson64/init.c                   |  21 +-
 arch/mips/loongson64/time.c                   |  24 ++
 drivers/irqchip/irq-loongson-liointc.c        |  58 ++-
 12 files changed, 723 insertions(+), 17 deletions(-)
 create mode 100644 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dts
 create mode 100644 arch/mips/configs/loongson2k_defconfig

-- 
2.20.1

