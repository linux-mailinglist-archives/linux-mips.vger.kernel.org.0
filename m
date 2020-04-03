Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9872C19D3B0
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2020 11:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390614AbgDCJaK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Apr 2020 05:30:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42910 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390504AbgDCJaJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 3 Apr 2020 05:30:09 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX2gQAodeHGAjAA--.150S2;
        Fri, 03 Apr 2020 17:29:53 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v4 0/3] Add basic support for LS7A bridge chip
Date:   Fri,  3 Apr 2020 17:29:48 +0800
Message-Id: <1585906191-26037-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxX2gQAodeHGAjAA--.150S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrWfGw4DArW8uw4ftF1fJFb_yoW5AFWkpF
        W5ua1fGr1DGF18Aa4fur48u3WFvrn3Jr9xWwsrG34rAas0qr10qr929F15J3W7Cr9Y9a1j
        vr12g3yvg3ZrCa7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
        r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
        xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
        cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
        AvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
        7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0iiSUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The LS7A bridge chip has been released for several years since the
second half of 2017, but it is not supported by the Linux mainline
kernel while it only works well with the Loongson internal kernel
version. When I update the latest version of Linux mainline kernel
on the Loongson 3A3000 CPU and LS7A bridge chip system, the boot
process failed and I feel depressed.

The LS7A bridge chip is used a lot with 3A3000 or 3A4000 CPU in
the most Loongson desktop and sever products, it is important to
support LS7A bridge chip by the Linux mainline kernel.

This patch series adds the basic support for the LS7A bridge chip,
the patch about vendor ID and SATA has been merged into the mainline
tree, the next work is to refactor the code about the interrupt
controller, and then power management and some other controller
device drivers.

By the way, if you want the boot process is successful (just for
test) on the Loongson 3A3000 CPU and LS7A bridge chip system,
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

v4:
  - Use LS7A instead of Loongson 7A1000 in the description
  - Use LS7A or ls7a instead of LS7A1000 or ls7a1000 in the code

[1] https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=9acb9fe18d86
    https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=e49bd683e00b
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9acb9fe18d86
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e49bd683e00b

Tiezhu Yang (3):
  MIPS: Loongson: Get host bridge information
  MIPS: Loongson: Add DMA support for LS7A
  MIPS: Loongson: Add PCI support for LS7A

 arch/mips/include/asm/mach-loongson64/boot_param.h | 20 +++++++
 arch/mips/loongson64/dma.c                         |  9 ++--
 arch/mips/loongson64/env.c                         | 22 ++++++++
 arch/mips/loongson64/init.c                        | 17 ++++++
 arch/mips/pci/fixup-loongson3.c                    | 12 +++++
 arch/mips/pci/ops-loongson3.c                      | 63 ++++++++++++++++++++--
 6 files changed, 136 insertions(+), 7 deletions(-)

-- 
2.1.0

