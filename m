Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4177A1B96B5
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2020 07:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbgD0FmZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Apr 2020 01:42:25 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42014 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726172AbgD0FmY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Apr 2020 01:42:24 -0400
Received: from [10.130.0.79] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP9yucKZeTqUsAA--.20S3;
        Mon, 27 Apr 2020 13:42:06 +0800 (CST)
Subject: Re: [PATCH v4 0/3] Add basic support for LS7A bridge chip
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1585906191-26037-1-git-send-email-yangtiezhu@loongson.cn>
 <8afa3df1-9c9f-aa90-e630-2b77f24fe41f@loongson.cn>
 <20200427125732.3212ced3@flygoat-x1e>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <a6df2442-bb44-5002-09ab-56ad6e7dd528@loongson.cn>
Date:   Mon, 27 Apr 2020 13:42:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200427125732.3212ced3@flygoat-x1e>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxP9yucKZeTqUsAA--.20S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWFWUWFWxtFWfXryUKrWrGrg_yoWrKrWfpa
        y5Ca13Gr4DGryUA3WSvr4xAa1ay393Jr9rWw47G34rCr90vF10qr929F1Yk3W7urnak3Wj
        qFy2g392g3WUC37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
        67vIY487MxkIecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUjWxRDUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 04/27/2020 12:57 PM, Jiaxun Yang wrote:
> On Mon, 27 Apr 2020 09:31:54 +0800
> Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
>> On 04/03/2020 05:29 PM, Tiezhu Yang wrote:
>>> The LS7A bridge chip has been released for several years since the
>>> second half of 2017, but it is not supported by the Linux mainline
>>> kernel while it only works well with the Loongson internal kernel
>>> version. When I update the latest version of Linux mainline kernel
>>> on the Loongson 3A3000 CPU and LS7A bridge chip system, the boot
>>> process failed and I feel depressed.
>>>
>>> The LS7A bridge chip is used a lot with 3A3000 or 3A4000 CPU in
>>> the most Loongson desktop and sever products, it is important to
>>> support LS7A bridge chip by the Linux mainline kernel.
>>>
>>> This patch series adds the basic support for the LS7A bridge chip,
>>> the patch about vendor ID and SATA has been merged into the mainline
>>> tree, the next work is to refactor the code about the interrupt
>>> controller, and then power management and some other controller
>>> device drivers.
>>>
>>> By the way, if you want the boot process is successful (just for
>>> test) on the Loongson 3A3000 CPU and LS7A bridge chip system,
>>> you should not only apply these patches, but also need the support
>>> for SATA and interrupt controller in the v1 patch series.
>>>
>>> This patch series is based on mips-next.
>>>
>>> If you have any questions and suggestions, please let me know.
>>>
>>> Thanks,
>>>
>>> Tiezhu Yang
>>>
>>> v2:
>>>     - The split patch series about Loongson vendor ID and SATA
>>> controller has been merged into the linux-block.git by Jens Axboe
>>> [1].
>>>
>>>     - Think about using hierarchy IRQ domain in the patch of
>>> interrupt controller, and this maybe depend on the patch series by
>>> Jiaxun ("Modernize Loongson64 Machine"), so the patch about
>>> interrupt is not included in this v2 patch series.
>>>
>>> v3:
>>>     - The split patch series about Loongson vendor ID and SATA
>>> controller has been merged into the mainline tree [2]
>>>
>>>     - Modify the macro definition and add comment to make it easy to
>>> read
>>>
>>>     - Move ls7a1000_pci_class_quirk() to fixup-loongson3.c
>>>
>>>     - Use PCI_VENDOR_ID_LOONGSON in pci_ids.h instead of 0x0014
>>>
>>> v4:
>>>     - Use LS7A instead of Loongson 7A1000 in the description
>>>     - Use LS7A or ls7a instead of LS7A1000 or ls7a1000 in the code
>>>
>>> [1]
>>> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=9acb9fe18d86
>>> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=e49bd683e00b
>>> [2]
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9acb9fe18d86
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e49bd683e00b
>>>
>>> Tiezhu Yang (3):
>>>     MIPS: Loongson: Get host bridge information
>>>     MIPS: Loongson: Add DMA support for LS7A
>>>     MIPS: Loongson: Add PCI support for LS7A
>>>
>>>    arch/mips/include/asm/mach-loongson64/boot_param.h | 20 +++++++
>>>    arch/mips/loongson64/dma.c                         |  9 ++--
>>>    arch/mips/loongson64/env.c                         | 22 ++++++++
>>>    arch/mips/loongson64/init.c                        | 17 ++++++
>>>    arch/mips/pci/fixup-loongson3.c                    | 12 +++++
>>>    arch/mips/pci/ops-loongson3.c                      | 63
>>> ++++++++++++++++++++-- 6 files changed, 136 insertions(+), 7
>>> deletions(-)
>> Hi Thomas,
>>
>> Could you please apply the following two patches to mips-next?
>>
>> [v4,1/3] MIPS: Loongson: Get host bridge information
>> https://lore.kernel.org/patchwork/patch/1220009/
>>
>> [v4,2/3] MIPS: Loongson: Add DMA support for LS7A
>> https://lore.kernel.org/patchwork/patch/1220010/
> Sorry but I really don't like the DMA patch, hard coding a config
> register in platform code is not necessarily a good idea, it
> create painful hell for adding new platform support.
>
> I'm trying very hard to let all devices go through DeviceTree.
>
> I'd suggest you to limit DMA capability on LS7A PCH instead of doing
> the hack.

Hi Jiaxun,

Thanks for your suggestion, let me rethink how to properly support DMA.

Do you think the following patch could be applied first?

[v4,1/3] MIPS: Loongson: Get host bridge information
https://lore.kernel.org/patchwork/patch/1220009/

Thanks,
Tiezhu Yang

>
> Or if you think the function is necessary, you can create a DeviceTree
> node called "loongson,ls7a-syscon", and do whatever you like in
> init_calls by parsing this node.
>
> Also that will also block my upcoming LS2K support patches.
> You can check my tree here[1].
>
> Thanks.
>
> [1]: https://github.com/FlyGoat/linux/commits/next-testing-2k
>
>> Thanks,
>> Tiezhu Yang
>>
> --
> Jiaxun Yang

