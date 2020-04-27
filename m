Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B48391B94F7
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2020 03:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgD0BcC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 21:32:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35326 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726186AbgD0BcC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 21:32:02 -0400
Received: from [10.130.0.79] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz2kKNqZePpQsAA--.0S3;
        Mon, 27 Apr 2020 09:31:55 +0800 (CST)
Subject: Re: [PATCH v4 0/3] Add basic support for LS7A bridge chip
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1585906191-26037-1-git-send-email-yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <8afa3df1-9c9f-aa90-e630-2b77f24fe41f@loongson.cn>
Date:   Mon, 27 Apr 2020 09:31:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1585906191-26037-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxz2kKNqZePpQsAA--.0S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXw48tw1xuw18AF1rKF4UJwb_yoW5tF15pa
        y5ua13Gr1DGr1UJa1fur4xua15Aws3Jr9xWw47G3s5AF9IqF10qr9avF15KF129r9Y93W2
        qr12g3yvg3W7Ca7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
        0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
        UI43ZEXa7VU1ItC7UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 04/03/2020 05:29 PM, Tiezhu Yang wrote:
> The LS7A bridge chip has been released for several years since the
> second half of 2017, but it is not supported by the Linux mainline
> kernel while it only works well with the Loongson internal kernel
> version. When I update the latest version of Linux mainline kernel
> on the Loongson 3A3000 CPU and LS7A bridge chip system, the boot
> process failed and I feel depressed.
>
> The LS7A bridge chip is used a lot with 3A3000 or 3A4000 CPU in
> the most Loongson desktop and sever products, it is important to
> support LS7A bridge chip by the Linux mainline kernel.
>
> This patch series adds the basic support for the LS7A bridge chip,
> the patch about vendor ID and SATA has been merged into the mainline
> tree, the next work is to refactor the code about the interrupt
> controller, and then power management and some other controller
> device drivers.
>
> By the way, if you want the boot process is successful (just for
> test) on the Loongson 3A3000 CPU and LS7A bridge chip system,
> you should not only apply these patches, but also need the support
> for SATA and interrupt controller in the v1 patch series.
>
> This patch series is based on mips-next.
>
> If you have any questions and suggestions, please let me know.
>
> Thanks,
>
> Tiezhu Yang
>
> v2:
>    - The split patch series about Loongson vendor ID and SATA controller
>      has been merged into the linux-block.git by Jens Axboe [1].
>
>    - Think about using hierarchy IRQ domain in the patch of interrupt
>      controller, and this maybe depend on the patch series by Jiaxun
>      ("Modernize Loongson64 Machine"), so the patch about interrupt is
>      not included in this v2 patch series.
>
> v3:
>    - The split patch series about Loongson vendor ID and SATA controller
>      has been merged into the mainline tree [2]
>
>    - Modify the macro definition and add comment to make it easy to read
>
>    - Move ls7a1000_pci_class_quirk() to fixup-loongson3.c
>
>    - Use PCI_VENDOR_ID_LOONGSON in pci_ids.h instead of 0x0014
>
> v4:
>    - Use LS7A instead of Loongson 7A1000 in the description
>    - Use LS7A or ls7a instead of LS7A1000 or ls7a1000 in the code
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=9acb9fe18d86
>      https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=e49bd683e00b
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9acb9fe18d86
>      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e49bd683e00b
>
> Tiezhu Yang (3):
>    MIPS: Loongson: Get host bridge information
>    MIPS: Loongson: Add DMA support for LS7A
>    MIPS: Loongson: Add PCI support for LS7A
>
>   arch/mips/include/asm/mach-loongson64/boot_param.h | 20 +++++++
>   arch/mips/loongson64/dma.c                         |  9 ++--
>   arch/mips/loongson64/env.c                         | 22 ++++++++
>   arch/mips/loongson64/init.c                        | 17 ++++++
>   arch/mips/pci/fixup-loongson3.c                    | 12 +++++
>   arch/mips/pci/ops-loongson3.c                      | 63 ++++++++++++++++++++--
>   6 files changed, 136 insertions(+), 7 deletions(-)
>

Hi Thomas,

Could you please apply the following two patches to mips-next?

[v4,1/3] MIPS: Loongson: Get host bridge information
https://lore.kernel.org/patchwork/patch/1220009/

[v4,2/3] MIPS: Loongson: Add DMA support for LS7A
https://lore.kernel.org/patchwork/patch/1220010/

Thanks,
Tiezhu Yang

