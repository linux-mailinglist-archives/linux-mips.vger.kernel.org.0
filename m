Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1027206C79
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 08:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389144AbgFXGdl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 02:33:41 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45250 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388405AbgFXGdU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 02:33:20 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj9+j8_Je2R5JAA--.564S2;
        Wed, 24 Jun 2020 14:33:08 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 00/14] irqchip: Fix potential resource leaks
Date:   Wed, 24 Jun 2020 14:32:33 +0800
Message-Id: <1592980367-1816-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxj9+j8_Je2R5JAA--.564S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFy5GF48uFW8WFy5uryrtFb_yoW8Zr1DpF
        4xJa90vr48Cay3JrnxAr1jyFy3XwnYyay7t3s7A343Xwn5WryDGF1UAw48XryUWayfGF1j
        kF1rtFyUC3WDAFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
        r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
        xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
        cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
        AvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY
        1x0267AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VUj6pB7UUUUU==
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
 drivers/irqchip/irq-davinci-cp-intc.c | 17 ++++++++++++++---
 drivers/irqchip/irq-digicolor.c       | 14 +++++++++++---
 drivers/irqchip/irq-dw-apb-ictl.c     | 11 ++++++++---
 drivers/irqchip/irq-ls1x.c            |  4 +++-
 drivers/irqchip/irq-mscc-ocelot.c     |  6 ++++--
 drivers/irqchip/irq-nvic.c            | 12 +++++++++---
 drivers/irqchip/irq-omap-intc.c       |  4 +++-
 drivers/irqchip/irq-riscv-intc.c      |  1 +
 drivers/irqchip/irq-s3c24xx.c         | 20 +++++++++++++++-----
 drivers/irqchip/irq-xilinx-intc.c     |  4 +++-
 14 files changed, 125 insertions(+), 37 deletions(-)

-- 
2.1.0

