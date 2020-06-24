Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBAF3206CD9
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 08:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389352AbgFXGpu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 02:45:50 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48436 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389380AbgFXGpu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 02:45:50 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxXeuQ9vJebSBJAA--.397S2;
        Wed, 24 Jun 2020 14:45:37 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 0/7 RESEND] irqchip: Fix some issues and do some code cleanups about Loongson
Date:   Wed, 24 Jun 2020 14:45:29 +0800
Message-Id: <1592981136-3572-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxXeuQ9vJebSBJAA--.397S2
X-Coremail-Antispam: 1UD129KBjvJXoW7JF13GF1xurykJr43JFW8Zwb_yoW8JF1fpF
        43C3yagr4UCrW7ZrWfAry8AryayryrKa9rtay7twnxXF98J34DuF15JFykurZ7ArWxWF1j
        9rWFgFW8u3WDCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
        WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
        67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42
        IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Gr0_Zr1l
        IxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26F4UJVW0obIYCT
        nIWIevJa73UjIFyTuYvjfU82NtDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

[git send-email failed, so resend, sorry for that]

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

