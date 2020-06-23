Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4335204D44
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 11:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732005AbgFWJCE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 05:02:04 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43606 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731852AbgFWJCE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 23 Jun 2020 05:02:04 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_2r7xPFer7FIAA--.12008S2;
        Tue, 23 Jun 2020 17:01:47 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Guo Ren <guoren@kernel.org>, Baruch Siach <baruch@tkos.co.il>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 0/7 RESEND] Fix potential resource leaks and do some code cleanups about irqchip
Date:   Tue, 23 Jun 2020 17:01:40 +0800
Message-Id: <1592902907-5062-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx_2r7xPFer7FIAA--.12008S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF48Zw13Zry5JFyfXF1UKFg_yoW8Cw1rpF
        47A39Ivr1fCa43Ar13Ar40yry3A3Z5Kay7K3yxt3sxXr95G34DWF1UAa4kXrn7JrWxG3Wj
        9F4rWFWUG3WUCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
        WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
        67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42
        IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1U
        MIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCT
        nIWIevJa73UjIFyTuYvjfU00PfDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

[git send-email failed, so resend it, sorry for that]

When I test the irqchip code of Loongson, I read the related code of other
chips in drivers/irqchip and I find some potential resource leaks in the
error path, I think it is better to fix them. Additionally, do some code
cleanups about Loongson to make it more clean and readable.

Tiezhu Yang (7):
  irqchip: Fix potential resource leaks
  irqchip/loongson-htpic: Remove redundant kfree operation
  irqchip/loongson-htvec: Check return value of
    irq_domain_translate_onecell()
  irqchip/loongson-pch-pic: Check return value of
    irq_domain_translate_twocell()
  irqchip/loongson-pch-msi: Remove unneeded variable
  irqchip/loongson-htpic: Remove unneeded select of I8259
  dt-bindings: interrupt-controller: Fix typos in loongson,liointc.yaml

 .../interrupt-controller/loongson,liointc.yaml     |  4 ++--
 drivers/irqchip/Kconfig                            |  1 -
 drivers/irqchip/irq-ath79-misc.c                   |  3 +++
 drivers/irqchip/irq-csky-apb-intc.c                |  3 +++
 drivers/irqchip/irq-csky-mpintc.c                  | 26 +++++++++++++++++-----
 drivers/irqchip/irq-davinci-aintc.c                | 17 ++++++++++----
 drivers/irqchip/irq-davinci-cp-intc.c              | 17 +++++++++++---
 drivers/irqchip/irq-digicolor.c                    |  4 ++++
 drivers/irqchip/irq-dw-apb-ictl.c                  | 11 ++++++---
 drivers/irqchip/irq-loongson-htpic.c               |  6 ++---
 drivers/irqchip/irq-loongson-htvec.c               | 10 +++++++--
 drivers/irqchip/irq-loongson-pch-msi.c             |  7 +-----
 drivers/irqchip/irq-loongson-pch-pic.c             | 15 ++++++++-----
 drivers/irqchip/irq-ls1x.c                         |  4 +++-
 drivers/irqchip/irq-mscc-ocelot.c                  |  6 +++--
 drivers/irqchip/irq-nvic.c                         |  2 ++
 drivers/irqchip/irq-omap-intc.c                    |  4 +++-
 drivers/irqchip/irq-riscv-intc.c                   |  1 +
 drivers/irqchip/irq-s3c24xx.c                      | 20 ++++++++++++-----
 drivers/irqchip/irq-xilinx-intc.c                  |  1 +
 20 files changed, 116 insertions(+), 46 deletions(-)

-- 
2.1.0

