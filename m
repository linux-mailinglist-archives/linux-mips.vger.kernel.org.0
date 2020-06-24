Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3002E206C99
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 08:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389263AbgFXGgI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 02:36:08 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45768 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389308AbgFXGfm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 02:35:42 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx39809PJeSB9JAA--.620S2;
        Wed, 24 Jun 2020 14:35:33 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 0/7] irqchip: Fix some issues and do some code cleanups about Loongson
Date:   Wed, 24 Jun 2020 14:35:24 +0800
Message-Id: <1592980531-2121-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx39809PJeSB9JAA--.620S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Gw13uFW5CFy3uF1UWF47CFg_yoW8Jr17pF
        43C3yagr4UCrW7ZryfAry8Aryayryrta9rtay7twnxXF98J34DuF13JFykZrZ7ArWxWF1j
        9ryFgrW093WDCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwI
        xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
        Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
        IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK
        8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7
        CjxVAFwI0_Cr1j6rxdYxBIdaVFxhVjvjDU0xZFpf9x0JU3Ma5UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Check the return value of irq_domain_translate_onecell() and
irq_domain_translate_twocell(), do some code cleanups about
Loongson to make it more clean and readable.

v2:
  - In order to avoid git send-email failed, make the related patches
    about Loongson into a new patch series and add "Fixes" tag

Tiezhu Yang (7):
  irqchip/loongson-htpic: Remove redundant kfree operation
  irqchip/loongson-htpic: Remove unneeded select of I8259
  irqchip/loongson-htvec: Fix potential resource leak
  irqchip/loongson-htvec: Check return value of
    irq_domain_translate_onecell()
  irqchip/loongson-pch-pic: Check return value of
    irq_domain_translate_twocell()
  irqchip/loongson-pch-msi: Remove unneeded variable
  dt-bindings: interrupt-controller: Fix typos in loongson,liointc.yaml

 .../bindings/interrupt-controller/loongson,liointc.yaml   |  4 ++--
 drivers/irqchip/Kconfig                                   |  1 -
 drivers/irqchip/irq-loongson-htpic.c                      |  6 ++----
 drivers/irqchip/irq-loongson-htvec.c                      | 10 ++++++++--
 drivers/irqchip/irq-loongson-pch-msi.c                    |  7 +------
 drivers/irqchip/irq-loongson-pch-pic.c                    | 15 +++++++++------
 6 files changed, 22 insertions(+), 21 deletions(-)

-- 
2.1.0

