Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645AB206DB9
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 09:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389747AbgFXH3z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 03:29:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59662 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388248AbgFXH3z (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 03:29:55 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_93mAPNezSRJAA--.399S2;
        Wed, 24 Jun 2020 15:29:43 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 00/14] irqchip: Fix potential resource leaks
Date:   Wed, 24 Jun 2020 15:29:28 +0800
Message-Id: <1592983782-8842-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx_93mAPNezSRJAA--.399S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFy5GF48uFW8Wr4xCryxGrg_yoW8ZFykpF
        4xJa90vr48Cay3JrnxAr1jyFy3XwnYyay7t3s7A343Xw1kWryDGF1UAw48XryUWayfGF1j
        kr1rJFyUC3WDAFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
        WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
        67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42
        IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1U
        MIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcS
        sGvfC2KfnxnUUI43ZEXa7VUb3l1PUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When I test the irqchip code of Loongson, I read the related code of other
chips in drivers/irqchip and I find some potential resource leaks in the
error path, I think it is better to fix them.

v2:
  - Split the first patch into a new patch series which
    includes small patches and add "Fixes" tag
  - Use "goto" label to handle error path in some patches

v3:
  - Add missed variable "ret" in the patch #5 and #13,
    sorry for that

Tiezhu Yang (14):
  irqchip/ath79-misc: Fix potential resource leaks
  irqchip/csky-apb-intc: Fix potential resource leaks
  irqchip/csky-mpintc: Fix potential resource leaks
  irqchip/davinci-aintc: Fix potential resource leaks
  irqchip/davinci-cp-intc: Fix potential resource leaks
  irqchip/digicolor: Fix potential resource leaks
  irqchip/dw-apb-ictl: Fix potential resource leaks
  irqchip/ls1x: Fix potential resource leaks
  irqchip/mscc-ocelot: Fix potential resource leaks
  irqchip/nvic: Fix potential resource leaks
  irqchip/omap-intc: Fix potential resource leak
  irqchip/riscv-intc: Fix potential resource leak
  irqchip/s3c24xx: Fix potential resource leaks
  irqchip/xilinx-intc: Fix potential resource leak

 drivers/irqchip/irq-ath79-misc.c      | 14 +++++++++++---
 drivers/irqchip/irq-csky-apb-intc.c   | 12 ++++++++++--
 drivers/irqchip/irq-csky-mpintc.c     | 26 ++++++++++++++++++++------
 drivers/irqchip/irq-davinci-aintc.c   | 17 +++++++++++++----
 drivers/irqchip/irq-davinci-cp-intc.c | 18 +++++++++++++++---
 drivers/irqchip/irq-digicolor.c       | 14 +++++++++++---
 drivers/irqchip/irq-dw-apb-ictl.c     | 11 ++++++++---
 drivers/irqchip/irq-ls1x.c            |  4 +++-
 drivers/irqchip/irq-mscc-ocelot.c     |  6 ++++--
 drivers/irqchip/irq-nvic.c            | 12 +++++++++---
 drivers/irqchip/irq-omap-intc.c       |  4 +++-
 drivers/irqchip/irq-riscv-intc.c      |  1 +
 drivers/irqchip/irq-s3c24xx.c         | 23 +++++++++++++++++------
 drivers/irqchip/irq-xilinx-intc.c     |  4 +++-
 14 files changed, 128 insertions(+), 38 deletions(-)

-- 
2.1.0

