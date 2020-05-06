Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C842B1C6910
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 08:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgEFGjC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 02:39:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43614 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725873AbgEFGjC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 6 May 2020 02:39:02 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj99YW7Je0w8xAA--.8S3;
        Wed, 06 May 2020 14:38:18 +0800 (CST)
Subject: Re: [PATCH v6] MIPS: Loongson: Add DMA support for LS7A
To:     Huacai Chen <chenhc@lemote.com>
References: <1588213867-32274-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H5QBOnrqVbMfGf7H5vJ6UMhUxhkCqAzZiwRFn_VwTQHpA@mail.gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Christoph Hellwig <hch@infradead.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <7d7f6211-f6bc-daae-5b13-b54092e762a1@loongson.cn>
Date:   Wed, 6 May 2020 14:38:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5QBOnrqVbMfGf7H5vJ6UMhUxhkCqAzZiwRFn_VwTQHpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxj99YW7Je0w8xAA--.8S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Ww17Gr4rKr1DGry8Xr4rAFb_yoW7AFy5pa
        9xA3WkGF4Ygr15CFZ5Zay8Wr1FyrZ5KrW2kF4aq3W5Cas09w1FyF4kG3WrXF1xAr1DG3WI
        vFWFgry8uF1fWFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
        67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
        AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
        c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
        AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWU
        JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5s
        jjDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 04/30/2020 02:19 PM, Huacai Chen wrote:
> Hi  Christoph,
>
> On Thu, Apr 30, 2020 at 10:31 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>> In the current market, the most used bridge chip on the Loongson
>> platform are RS780E and LS7A, the RS780E bridge chip is already
>> supported by the mainline kernel.
>>
>> In order to use the default implementation of __phys_to_dma() and
>> __dma_to_phys() in dma-direct.h, remove CONFIG_ARCH_HAS_PHYS_TO_DMA
>> and then set the bus's DMA limit to 36 bit for RS780E to maintain
>> downward compatibility.
> I know that you want use the default implementation of __phys_to_dma()
> and __dma_to_phys() as more as possible. But, if that is "impossible"
> on Loongson-3, should we still be forced to use the default? Yes, this
> patch makes the default version work, but it limit the device's DMA
> capability, which is not what we want.

Hi Huacai,

We know that the AMD RS780E bridge chip has been discontinued for
some years, as time goes by, it will gradually quit the stage of
history.

Today and in the future, the most popular used bridge chip on the
Loongson platform is LS7A, so the initial aim of this patch is to
add DMA support for LS7A, at the same time, we should maintain
downward compatibility for RS780E.

For the above reasons, I think what you are concerned is not a
big deal.

Thanks,
Tiezhu Yang

>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>
>> Hi Christoph and Jiaxun,
>>
>> Thank you very much for your suggestions.
>>
>> v5:
>>    - use the default implementation of __phys_to_dma()
>>      and __dma_to_phys() in dma-direct.h
>>
>> v6:
>>    - make loongson_dma_config() static
>>    - put ls7a things before rs780 things
>>
>>   arch/mips/Kconfig                                  |  1 -
>>   arch/mips/include/asm/mach-loongson64/boot_param.h |  5 +++++
>>   arch/mips/loongson64/dma.c                         | 22 +++++++++++-----------
>>   arch/mips/loongson64/env.c                         |  2 ++
>>   4 files changed, 18 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index 9f15539..12b6bdb 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -1454,7 +1454,6 @@ choice
>>   config CPU_LOONGSON64
>>          bool "Loongson 64-bit CPU"
>>          depends on SYS_HAS_CPU_LOONGSON64
>> -       select ARCH_HAS_PHYS_TO_DMA
>>          select CPU_MIPSR2
>>          select CPU_HAS_PREFETCH
>>          select CPU_SUPPORTS_64BIT_KERNEL
>> diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
>> index f082d87..0c07a96 100644
>> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
>> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
>> @@ -197,6 +197,7 @@ enum loongson_bridge_type {
>>          RS780E = 2
>>   };
>>
>> +struct pci_dev;
>>   struct loongson_system_configuration {
>>          u32 nr_cpus;
>>          u32 nr_nodes;
>> @@ -221,9 +222,13 @@ struct loongson_system_configuration {
>>          u32 nr_sensors;
>>          struct sensor_device sensors[MAX_SENSORS];
>>          u64 workarounds;
>> +       void (*dma_config)(struct pci_dev *pdev);
>>   };
>>
>>   extern struct efi_memory_map_loongson *loongson_memmap;
>>   extern struct loongson_system_configuration loongson_sysconf;
>>
>> +extern void ls7a_dma_config(struct pci_dev *pdev);
>> +extern void rs780e_dma_config(struct pci_dev *pdev);
>> +
>>   #endif
>> diff --git a/arch/mips/loongson64/dma.c b/arch/mips/loongson64/dma.c
>> index 5e86635..ef40b0d 100644
>> --- a/arch/mips/loongson64/dma.c
>> +++ b/arch/mips/loongson64/dma.c
>> @@ -1,24 +1,24 @@
>>   // SPDX-License-Identifier: GPL-2.0
>> -#include <linux/dma-direct.h>
>> +#include <linux/pci.h>
>>   #include <linux/init.h>
>>   #include <linux/swiotlb.h>
>>
>> -dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>> +void ls7a_dma_config(struct pci_dev *pdev)
>>   {
>> -       /* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
>> -        * Loongson-3's 48bit address space and embed it into 40bit */
>> -       long nid = (paddr >> 44) & 0x3;
>> -       return ((nid << 44) ^ paddr) | (nid << 37);
>>   }
>>
>> -phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
>> +void rs780e_dma_config(struct pci_dev *pdev)
>>   {
>> -       /* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
>> -        * Loongson-3's 48bit address space and embed it into 40bit */
>> -       long nid = (daddr >> 37) & 0x3;
>> -       return ((nid << 37) ^ daddr) | (nid << 44);
>> +       pdev->dev.bus_dma_limit = DMA_BIT_MASK(36);
>>   }
>>
>> +static void loongson_dma_config(struct pci_dev *pdev)
>> +{
>> +       loongson_sysconf.dma_config(pdev);
>> +}
>> +
>> +DECLARE_PCI_FIXUP_EARLY(PCI_ANY_ID, PCI_ANY_ID, loongson_dma_config);
>> +
>>   void __init plat_swiotlb_setup(void)
>>   {
>>          swiotlb_init(1);
>> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
>> index 71f4aaf..496f401 100644
>> --- a/arch/mips/loongson64/env.c
>> +++ b/arch/mips/loongson64/env.c
>> @@ -192,8 +192,10 @@ void __init prom_init_env(void)
>>          if (vendor == PCI_VENDOR_ID_LOONGSON && device == 0x7a00) {
>>                  pr_info("The bridge chip is LS7A\n");
>>                  loongson_sysconf.bridgetype = LS7A;
>> +               loongson_sysconf.dma_config = ls7a_dma_config;
>>          } else {
>>                  pr_info("The bridge chip is RS780E or SR5690\n");
>>                  loongson_sysconf.bridgetype = RS780E;
>> +               loongson_sysconf.dma_config = rs780e_dma_config;
>>          }
>>   }
>> --
>> 2.1.0
>>

