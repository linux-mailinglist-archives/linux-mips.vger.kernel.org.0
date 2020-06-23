Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42545204D14
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 10:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731885AbgFWIwf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 04:52:35 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41238 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731811AbgFWIwW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 23 Jun 2020 04:52:22 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv2uFwvFecLBIAA--.12S2;
        Tue, 23 Jun 2020 16:51:19 +0800 (CST)
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
        linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 0/7] Fix potential resource leaks and do some code cleanups about irqchip
Date:   Tue, 23 Jun 2020 16:51:09 +0800
Message-Id: <1592902276-3969-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxv2uFwvFecLBIAA--.12S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFy5GF48uFy7WrWfGr1Utrb_yoW8CrWDpF
        47A39Ivr1fCay3Zr1fAr40yry3A3Z5Kay7K3yxt3sxXr95G34DWF1UAa4kXr97JrWxG3Wj
        9F1rWFWUG3WUCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvF14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
        xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
        MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
        0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AK
        xVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
        fUeApeUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

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

