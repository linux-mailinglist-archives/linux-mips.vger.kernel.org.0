Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5110D199782
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 15:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730216AbgCaNdz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Mar 2020 09:33:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:37368 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730845AbgCaNdy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 31 Mar 2020 09:33:54 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf9+pRoNeSSIiAA--.19S2;
        Tue, 31 Mar 2020 21:33:30 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 0/3] Add basic support for Loongson 7A1000 bridge chip
Date:   Tue, 31 Mar 2020 21:33:25 +0800
Message-Id: <1585661608-3356-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxf9+pRoNeSSIiAA--.19S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrWfZF1DZryrZrW7Jr47urg_yoW5Ar4kpF
        W5ua1fGr1DGr1xAas3ur18uF4Fyrn3JrZxWwsrGryUAasIqF1jqr929F15K3W2k3sa9a1U
        Xry2g3ykK3Z8Ca7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
        6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
        rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
        vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
        x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
        xKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
        67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj6pB7UUUUU==
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
bridge chip, the patch about vendor ID and SATA has been merged
into the mainline tree, the next work is to refactor the code about
the interrupt controller, and then power management and some other
controller device drivers.

By the way, if you want the boot process is successful (just for
test) on the Loongson 3A3000 CPU and 7A1000 bridge chip system,
you should not only apply these patches, but also need the support
for SATA and interrupt controller in the v1 patch series.

This patch series is based on mips-next.

If you have any questions and suggestions, please let me know.

Thanks,

Tiezhu Yang

v2:
  - The split patch series about Loongson vendor ID and SATA controller
    has been merged into the linux-block.git by Jens Axboe [1].

  - Think about using hierarchy IRQ domain in the patch of interrupt
    controller, and this maybe depend on the patch series by Jiaxun
    ("Modernize Loongson64 Machine"), so the patch about interrupt is
    not included in this v2 patch series.

v3:
  - The split patch series about Loongson vendor ID and SATA controller
    has been merged into the mainline tree [2]

  - Modify the macro definition and add comment to make it easy to read

  - Move ls7a1000_pci_class_quirk() to fixup-loongson3.c

  - Use PCI_VENDOR_ID_LOONGSON in pci_ids.h instead of 0x0014

[1] https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=9acb9fe18d86
    https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=e49bd683e00b
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9acb9fe18d86
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e49bd683e00b

Tiezhu Yang (3):
  MIPS: Loongson: Get host bridge information
  MIPS: Loongson: Add DMA support for 7A1000
  MIPS: Loongson: Add PCI support for 7A1000

 arch/mips/include/asm/mach-loongson64/boot_param.h | 20 +++++++
 arch/mips/loongson64/dma.c                         |  9 ++--
 arch/mips/loongson64/env.c                         | 22 ++++++++
 arch/mips/loongson64/init.c                        | 17 ++++++
 arch/mips/pci/fixup-loongson3.c                    | 12 +++++
 arch/mips/pci/ops-loongson3.c                      | 63 ++++++++++++++++++++--
 6 files changed, 136 insertions(+), 7 deletions(-)

-- 
2.1.0

