Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC0E532F7CE
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 03:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbhCFC20 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 21:28:26 -0500
Received: from mail.loongson.cn ([114.242.206.163]:51206 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229901AbhCFC2O (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Mar 2021 21:28:14 -0500
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKdWv6EJgvxsVAA--.26817S2;
        Sat, 06 Mar 2021 10:28:00 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        wangming01@loongson.cn
Subject: [PATCH v3 0/7] Add basic support for Loongson-2K1000
Date:   Sat,  6 Mar 2021 10:27:52 +0800
Message-Id: <20210306022759.9431-1-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxKdWv6EJgvxsVAA--.26817S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urykAr1DAw4DKryfXFWDJwb_yoW8Wr4kpw
        43Cw15KF45Cry3Crn3JryUWryrArWfJrZrWF47Xr15GasIqa4Yvr1fJFs8Jr42vrykta4j
        9ry8WrW7GFnrC3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK
        6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
        0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
        0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
        WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_
        Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbF4iU
        UUUUU==
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
 arch/mips/loongson64/time.c                   |  20 +
 drivers/irqchip/irq-loongson-liointc.c        |  55 ++-
 12 files changed, 716 insertions(+), 17 deletions(-)
 create mode 100644 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dts
 create mode 100644 arch/mips/configs/loongson2k_defconfig

-- 
2.20.1

