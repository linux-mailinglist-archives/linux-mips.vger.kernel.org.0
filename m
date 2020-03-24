Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD0B190994
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 10:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727238AbgCXJb3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 05:31:29 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38172 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726565AbgCXJb3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 05:31:29 -0400
Received: from [10.130.0.79] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn91c03lezXAfAA--.4S3;
        Tue, 24 Mar 2020 17:31:10 +0800 (CST)
Subject: Re: [PATCH v2 0/3] Add basic support for Loongson 7A1000 bridge chip
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
References: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn>
 <F85A21BA-31A2-4230-BFF8-7B5F355BB125@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <79f960cc-4360-8941-a89d-a61dd86a16bd@loongson.cn>
Date:   Tue, 24 Mar 2020 17:31:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <F85A21BA-31A2-4230-BFF8-7B5F355BB125@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn91c03lezXAfAA--.4S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWr4UGw45ZF4rXw48WFWkXrb_yoW5Cryfpa
        y5uanIgFs8Wry7AFyfuw48CFWYyrs3XrZrW3W7Gr1kCas8ZF10qr929a15G3W7ur92k3W2
        vryUW3yDGa15CaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
        z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
        IFyTuYvjfUeID7DUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/24/2020 03:49 PM, Jiaxun Yang wrote:
>
> 于 2020年3月23日 GMT+08:00 上午10:59:12, Tiezhu Yang <yangtiezhu@loongson.cn> 写到:
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
>> bridge chip, when apply these patches based on linux-5.6-rc7, the
>> boot process is successful and we can login normally used with the
> Is it still true without IRQ driver?

No, I will modify the description.

>
>> latest firmware and discrete graphics card, the next work to do is
>> power management and some other controller device drivers.
>>
>> Additionally, when I git clone mips code [1], the speed is too slow
>> and clone always failed, so this patch series is based on the latest
>> linux-5.6-rc7 [2].
> You can clone stable tree from mirrors in China[1] at first,
> then add mips tree as a remote and fetch from it.
> In this way it will only download a minimal difference set from foreign server so won't spend a lot of time.

Thanks for your suggestion.

>
>
> [1]: https://mirrors.tuna.tsinghua.edu.cn/git/linux-stable.git
>
>> If you have any questions and suggestions, please let me know.
>>
>> Thanks,
>>
>> Tiezhu Yang
>>
>> v2:
>>   - The split patch series about Loongson vendor ID and SATA controller
>>     has been merged into the linux-block.git by Jens Axboe [3].
>>
>>   - Think about using hierarchy IRQ domain in the patch of interrupt
>>     controller, and this maybe depend on the patch series by Jiaxun
>>     ("Modernize Loongson64 Machine"), so the patch about interrupt is
>>     not included in this v2 patch series.
>>
>> [1] git clone
>> https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
>> [2] git clone https://github.com/torvalds/linux.git
>> [3]
>> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=9acb9fe18d86
>> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=e49bd683e00b
>>
>> Tiezhu Yang (3):
>>   MIPS: Loongson: Get host bridge information
>>   MIPS: Loongson: Add DMA support for 7A1000
>>   MIPS: Loongson: Add PCI support for 7A1000
>>
>> arch/mips/include/asm/mach-loongson64/boot_param.h | 20 ++++++
>> arch/mips/loongson64/dma.c                         |  9 ++-
>> arch/mips/loongson64/env.c                         | 20 ++++++
>> arch/mips/loongson64/init.c                        | 17 +++++
>> arch/mips/pci/ops-loongson3.c                      | 72
>> ++++++++++++++++++++--
>> 5 files changed, 131 insertions(+), 7 deletions(-)

