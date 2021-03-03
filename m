Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA8532BD94
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 23:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345647AbhCCQRD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 11:17:03 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47210 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1353365AbhCCG0I (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Mar 2021 01:26:08 -0500
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxOdSiKz9gd7ATAA--.25147S2;
        Wed, 03 Mar 2021 14:24:34 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] Add basic support for Loongson-2K1000
Date:   Wed,  3 Mar 2021 14:24:27 +0800
Message-Id: <20210303062434.22280-1-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxOdSiKz9gd7ATAA--.25147S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urykAr1DAw4DKryfXFWDJwb_yoW8Wr4kpw
        43Cw15KF45Cry3Crn3JryUWr1rArWfJrZrWF47Xr15GasIqa4Yvr1fJFs8Jr42vrykta4j
        9ry8WFW7GFnrC37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8AwCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
        AIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
        z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUxPl1DUUUU
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

These patches support single-core DTS boot to the serial port login
interface, which can be operated using conventional commands.

I have successfully tested it on the Loongson 2K1000 machine.
pmon: http://cgit.loongnix.org/cgit/pmon-loongson3/

Qing Zhang (7):
  MIPS: Loongson64: DeviceTree for 2K1000
  MIPS: Loongson64: Distinguish firmware dependencies DTB/LEFI
  MIPS: Loongson64: Add support for the 2K1000 to get cpu_clock_freq
  MIPS: Loongson64: Add 2K1000 early_printk_port
  irqchip/loongson-liointc: irqchip add 2.0 version
  dt-bindings: interrupt-controller: Add Loongson-2K1000 LIOINTC
  MIPS: Loongson64: Add a Loongson-2k default config file

 .../loongson,liointc.yaml                     |   9 +-
 arch/mips/boot/dts/loongson/Makefile          |   1 +
 .../boot/dts/loongson/loongson64-2k1000.dtsi  | 243 ++++++++++++
 .../dts/loongson/loongson64_2core_2k1000.dts  |  10 +
 arch/mips/configs/loongson2k_defconfig        | 353 ++++++++++++++++++
 .../include/asm/mach-loongson64/boot_param.h  |   6 +
 .../asm/mach-loongson64/builtin_dtbs.h        |   1 +
 .../include/asm/mach-loongson64/loongson.h    |   3 +-
 arch/mips/loongson64/env.c                    |  13 +-
 arch/mips/loongson64/init.c                   |  21 +-
 arch/mips/loongson64/time.c                   |  14 +
 drivers/irqchip/irq-loongson-liointc.c        |  55 ++-
 12 files changed, 711 insertions(+), 18 deletions(-)
 create mode 100644 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dts
 create mode 100644 arch/mips/configs/loongson2k_defconfig

-- 
2.20.1

