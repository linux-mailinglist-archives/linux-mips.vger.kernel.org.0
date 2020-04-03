Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6714719D067
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2020 08:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388540AbgDCGrh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Apr 2020 02:47:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38622 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730759AbgDCGrh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 3 Apr 2020 02:47:37 -0400
Received: from [10.130.0.79] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax9un824Ze81EjAA--.24S3;
        Fri, 03 Apr 2020 14:47:25 +0800 (CST)
Subject: Re: [PATCH v3 0/3] Add basic support for Loongson 7A1000 bridge chip
To:     Huacai Chen <chenhc@lemote.com>
References: <1585661608-3356-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H5zKaWREreiDmmRgtAuTvOcQwEm1xvQxcCGrpdiiW7uWg@mail.gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <0e6a8ef4-4a4f-b75c-fdf9-bcc4c02dfc50@loongson.cn>
Date:   Fri, 3 Apr 2020 14:47:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5zKaWREreiDmmRgtAuTvOcQwEm1xvQxcCGrpdiiW7uWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Ax9un824Ze81EjAA--.24S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXFyrJF1fWFyxJw1fXw1DWrg_yoW5tw4kpa
        y5Ca13KF4DWr1xAa4avr18uF4SyrZ3Xr9xWw47Gr1rCas0q3W0qr92gF4rGa47ur9Y9a12
        vryjg3yDG3WUC37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
        v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
        c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
        0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_
        Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5sjjDU
        UUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 04/03/2020 12:28 PM, Huacai Chen wrote:
> We have a rule of naming to avoid confusing: Use Loongson-3A,
> Loongson-3B, etc. to describe processor; use LS2H, LS7A, etc. to
> describe bridge. So please don't use Loongson 7A1000.

OK, thanks for your suggestion. I will modify it and send v4.

Thanks,

Tiezhu Yang

>
> Thanks,
> Huacai
>
> On Tue, Mar 31, 2020 at 9:34 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>> The Loongson 7A1000 bridge chip has been released for several years
>> since the second half of 2017, but it is not supported by the Linux
>> mainline kernel while it only works well with the Loongson internal
>> kernel version. When I update the latest version of Linux mainline
>> kernel on the Loongson 3A3000 CPU and 7A1000 bridge chip system,
>> the boot process failed and I feel depressed.
>>
>> The 7A1000 bridge chip is used a lot with 3A3000 or 3A4000 CPU in
>> the most Loongson desktop and sever products, it is important to
>> support Loongson 7A1000 bridge chip by the Linux mainline kernel.
>>
>> This patch series adds the basic support for the Loongson 7A1000
>> bridge chip, the patch about vendor ID and SATA has been merged
>> into the mainline tree, the next work is to refactor the code about
>> the interrupt controller, and then power management and some other
>> controller device drivers.
>>
>> By the way, if you want the boot process is successful (just for
>> test) on the Loongson 3A3000 CPU and 7A1000 bridge chip system,
>> you should not only apply these patches, but also need the support
>> for SATA and interrupt controller in the v1 patch series.
>>
>> This patch series is based on mips-next.
>>
>> If you have any questions and suggestions, please let me know.
>>
>> Thanks,
>>
>> Tiezhu Yang
>>
>> v2:
>>    - The split patch series about Loongson vendor ID and SATA controller
>>      has been merged into the linux-block.git by Jens Axboe [1].
>>
>>    - Think about using hierarchy IRQ domain in the patch of interrupt
>>      controller, and this maybe depend on the patch series by Jiaxun
>>      ("Modernize Loongson64 Machine"), so the patch about interrupt is
>>      not included in this v2 patch series.
>>
>> v3:
>>    - The split patch series about Loongson vendor ID and SATA controller
>>      has been merged into the mainline tree [2]
>>
>>    - Modify the macro definition and add comment to make it easy to read
>>
>>    - Move ls7a1000_pci_class_quirk() to fixup-loongson3.c
>>
>>    - Use PCI_VENDOR_ID_LOONGSON in pci_ids.h instead of 0x0014
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=9acb9fe18d86
>>      https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=e49bd683e00b
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9acb9fe18d86
>>      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e49bd683e00b
>>
>> Tiezhu Yang (3):
>>    MIPS: Loongson: Get host bridge information
>>    MIPS: Loongson: Add DMA support for 7A1000
>>    MIPS: Loongson: Add PCI support for 7A1000
>>
>>   arch/mips/include/asm/mach-loongson64/boot_param.h | 20 +++++++
>>   arch/mips/loongson64/dma.c                         |  9 ++--
>>   arch/mips/loongson64/env.c                         | 22 ++++++++
>>   arch/mips/loongson64/init.c                        | 17 ++++++
>>   arch/mips/pci/fixup-loongson3.c                    | 12 +++++
>>   arch/mips/pci/ops-loongson3.c                      | 63 ++++++++++++++++++++--
>>   6 files changed, 136 insertions(+), 7 deletions(-)
>>
>> --
>> 2.1.0
>>

