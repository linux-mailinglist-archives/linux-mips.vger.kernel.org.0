Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6435618EE50
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2020 04:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbgCWC70 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Mar 2020 22:59:26 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56006 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727050AbgCWC70 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 22 Mar 2020 22:59:26 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxP+gDJnhedaseAA--.407S2;
        Mon, 23 Mar 2020 10:59:15 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 0/3] Add basic support for Loongson 7A1000 bridge chip
Date:   Mon, 23 Mar 2020 10:59:12 +0800
Message-Id: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxP+gDJnhedaseAA--.407S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4UGr4xXFW7tryfGF48WFg_yoW8KFW7pF
        WF9a1rWrs8Wry7Aasxur48ur4rArn3JrZrWa17Gr1kAa98XF10qr929a15t3W29r9a9a1U
        Xry8WrWDKa15CaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
        Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
        WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
        7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
        1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
        IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjg_-DUUUU
        U==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Loongson 7A1000 bridge chip has been released for several years
since the second half of 2017, but it is not supported by the Linux
mainline kernel while it only works well with the Loongson internal
kernel version. When I update the latest version of Linux mainline
kernel on the Loongson 3A3000 CPU and 7A1000 bridge chip system,
the boot process failed and I feel depressed.

The 7A1000 bridge chip is used a lot with 3A3000 or 3A4000 CPU in
the most Loongson desktop and sever products, it is important to
support Loongson 7A1000 bridge chip by the Linux mainline kernel.

This patch series adds the basic support for the Loongson 7A1000
bridge chip, when apply these patches based on linux-5.6-rc7, the
boot process is successful and we can login normally used with the
latest firmware and discrete graphics card, the next work to do is
power management and some other controller device drivers.

Additionally, when I git clone mips code [1], the speed is too slow
and clone always failed, so this patch series is based on the latest
linux-5.6-rc7 [2].

If you have any questions and suggestions, please let me know.

Thanks,

Tiezhu Yang

v2:
  - The split patch series about Loongson vendor ID and SATA controller
    has been merged into the linux-block.git by Jens Axboe [3].

  - Think about using hierarchy IRQ domain in the patch of interrupt
    controller, and this maybe depend on the patch series by Jiaxun
    ("Modernize Loongson64 Machine"), so the patch about interrupt is
    not included in this v2 patch series.

[1] git clone https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
[2] git clone https://github.com/torvalds/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=9acb9fe18d86
    https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=e49bd683e00b

Tiezhu Yang (3):
  MIPS: Loongson: Get host bridge information
  MIPS: Loongson: Add DMA support for 7A1000
  MIPS: Loongson: Add PCI support for 7A1000

 arch/mips/include/asm/mach-loongson64/boot_param.h | 20 ++++++
 arch/mips/loongson64/dma.c                         |  9 ++-
 arch/mips/loongson64/env.c                         | 20 ++++++
 arch/mips/loongson64/init.c                        | 17 +++++
 arch/mips/pci/ops-loongson3.c                      | 72 ++++++++++++++++++++--
 5 files changed, 131 insertions(+), 7 deletions(-)

-- 
2.1.0

