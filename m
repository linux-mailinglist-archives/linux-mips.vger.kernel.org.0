Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECFC21C6BF2
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 10:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbgEFIj6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 04:39:58 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:45881 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728524AbgEFIj5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 04:39:57 -0400
Received: by mail-il1-f195.google.com with SMTP id i16so943780ils.12;
        Wed, 06 May 2020 01:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sQZRu3UTjV+/kLJxLqBTxgv9YHYyyavj3ZSdubKbJCI=;
        b=HM7iIL5SES4Y2mqOxjaTKo674lUQuxcDXj/nJn866vM4q2Nn9gsREhOP8VVZ8nL/bA
         Wn0sIM9shfnU7Rn1/YnbpG3R2DmJnLVB5Qjjlxs6dJyRV7tDj41UH90eEqF55pzkU/dE
         gnPNmkt9GpHKqxZLiA8kW9BRwBWUTJ6fvzXQy02FJpQ3nz0bbVcIqMIiCppOneNdIv0x
         BSDrsLphYba2JQAQkC1Bt8unv47CVkPSsUcB9KsRRpBqG53iS7saZYoh1grxk5cHouMo
         PBl8nDoZCM6VLQpzunQJYC30i71iVDYmIcQlVuPiXXLIWoiClCeD6UQUGoJpVrWiHe61
         imZA==
X-Gm-Message-State: AGi0PuZc+Nc1rv8XJLliFCufQ8q4X1nYM3ONxXCUPfaYYiYCShhp89II
        td37qRZp8Skxf1f3NDD4HecKbPOIUsC8Sywiyds=
X-Google-Smtp-Source: APiQypJhL5x4h6yRyrQcH4I8C6qpXD2jAX+nlqG3C7D9G5pkYUXsahCUXP2HkUMXF39EcBY9bS+dFjnQzmYXOtQ5WtA=
X-Received: by 2002:a92:c52a:: with SMTP id m10mr7949632ili.208.1588754396262;
 Wed, 06 May 2020 01:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <1588213867-32274-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H5QBOnrqVbMfGf7H5vJ6UMhUxhkCqAzZiwRFn_VwTQHpA@mail.gmail.com> <7d7f6211-f6bc-daae-5b13-b54092e762a1@loongson.cn>
In-Reply-To: <7d7f6211-f6bc-daae-5b13-b54092e762a1@loongson.cn>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Wed, 6 May 2020 16:47:30 +0800
Message-ID: <CAAhV-H7jX9uVwb+GnaKXHPBsBQY35YKccbDedLrmfp8-hveVfw@mail.gmail.com>
Subject: Re: [PATCH v6] MIPS: Loongson: Add DMA support for LS7A
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Christoph Hellwig <hch@infradead.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Tiezhu,

On Wed, May 6, 2020 at 2:39 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> On 04/30/2020 02:19 PM, Huacai Chen wrote:
> > Hi  Christoph,
> >
> > On Thu, Apr 30, 2020 at 10:31 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> >> In the current market, the most used bridge chip on the Loongson
> >> platform are RS780E and LS7A, the RS780E bridge chip is already
> >> supported by the mainline kernel.
> >>
> >> In order to use the default implementation of __phys_to_dma() and
> >> __dma_to_phys() in dma-direct.h, remove CONFIG_ARCH_HAS_PHYS_TO_DMA
> >> and then set the bus's DMA limit to 36 bit for RS780E to maintain
> >> downward compatibility.
> > I know that you want use the default implementation of __phys_to_dma()
> > and __dma_to_phys() as more as possible. But, if that is "impossible"
> > on Loongson-3, should we still be forced to use the default? Yes, this
> > patch makes the default version work, but it limit the device's DMA
> > capability, which is not what we want.
>
> Hi Huacai,
>
> We know that the AMD RS780E bridge chip has been discontinued for
> some years, as time goes by, it will gradually quit the stage of
> history.
>
> Today and in the future, the most popular used bridge chip on the
> Loongson platform is LS7A, so the initial aim of this patch is to
> add DMA support for LS7A, at the same time, we should maintain
> downward compatibility for RS780E.
>
> For the above reasons, I think what you are concerned is not a
> big deal.
I don't think so, this is obviously a regression. If we can accept a
regression of RS780E, why we still maintain Loongson-2EF rather than
simply drop them?

>
> Thanks,
> Tiezhu Yang
>
> >
> >> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> >> ---
> >>
> >> Hi Christoph and Jiaxun,
> >>
> >> Thank you very much for your suggestions.
> >>
> >> v5:
> >>    - use the default implementation of __phys_to_dma()
> >>      and __dma_to_phys() in dma-direct.h
> >>
> >> v6:
> >>    - make loongson_dma_config() static
> >>    - put ls7a things before rs780 things
> >>
> >>   arch/mips/Kconfig                                  |  1 -
> >>   arch/mips/include/asm/mach-loongson64/boot_param.h |  5 +++++
> >>   arch/mips/loongson64/dma.c                         | 22 +++++++++++-----------
> >>   arch/mips/loongson64/env.c                         |  2 ++
> >>   4 files changed, 18 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> >> index 9f15539..12b6bdb 100644
> >> --- a/arch/mips/Kconfig
> >> +++ b/arch/mips/Kconfig
> >> @@ -1454,7 +1454,6 @@ choice
> >>   config CPU_LOONGSON64
> >>          bool "Loongson 64-bit CPU"
> >>          depends on SYS_HAS_CPU_LOONGSON64
> >> -       select ARCH_HAS_PHYS_TO_DMA
> >>          select CPU_MIPSR2
> >>          select CPU_HAS_PREFETCH
> >>          select CPU_SUPPORTS_64BIT_KERNEL
> >> diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
> >> index f082d87..0c07a96 100644
> >> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> >> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> >> @@ -197,6 +197,7 @@ enum loongson_bridge_type {
> >>          RS780E = 2
> >>   };
> >>
> >> +struct pci_dev;
> >>   struct loongson_system_configuration {
> >>          u32 nr_cpus;
> >>          u32 nr_nodes;
> >> @@ -221,9 +222,13 @@ struct loongson_system_configuration {
> >>          u32 nr_sensors;
> >>          struct sensor_device sensors[MAX_SENSORS];
> >>          u64 workarounds;
> >> +       void (*dma_config)(struct pci_dev *pdev);
> >>   };
> >>
> >>   extern struct efi_memory_map_loongson *loongson_memmap;
> >>   extern struct loongson_system_configuration loongson_sysconf;
> >>
> >> +extern void ls7a_dma_config(struct pci_dev *pdev);
> >> +extern void rs780e_dma_config(struct pci_dev *pdev);
> >> +
> >>   #endif
> >> diff --git a/arch/mips/loongson64/dma.c b/arch/mips/loongson64/dma.c
> >> index 5e86635..ef40b0d 100644
> >> --- a/arch/mips/loongson64/dma.c
> >> +++ b/arch/mips/loongson64/dma.c
> >> @@ -1,24 +1,24 @@
> >>   // SPDX-License-Identifier: GPL-2.0
> >> -#include <linux/dma-direct.h>
> >> +#include <linux/pci.h>
> >>   #include <linux/init.h>
> >>   #include <linux/swiotlb.h>
> >>
> >> -dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
> >> +void ls7a_dma_config(struct pci_dev *pdev)
> >>   {
> >> -       /* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
> >> -        * Loongson-3's 48bit address space and embed it into 40bit */
> >> -       long nid = (paddr >> 44) & 0x3;
> >> -       return ((nid << 44) ^ paddr) | (nid << 37);
> >>   }
> >>
> >> -phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
> >> +void rs780e_dma_config(struct pci_dev *pdev)
> >>   {
> >> -       /* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
> >> -        * Loongson-3's 48bit address space and embed it into 40bit */
> >> -       long nid = (daddr >> 37) & 0x3;
> >> -       return ((nid << 37) ^ daddr) | (nid << 44);
> >> +       pdev->dev.bus_dma_limit = DMA_BIT_MASK(36);
> >>   }
> >>
> >> +static void loongson_dma_config(struct pci_dev *pdev)
> >> +{
> >> +       loongson_sysconf.dma_config(pdev);
> >> +}
> >> +
> >> +DECLARE_PCI_FIXUP_EARLY(PCI_ANY_ID, PCI_ANY_ID, loongson_dma_config);
> >> +
> >>   void __init plat_swiotlb_setup(void)
> >>   {
> >>          swiotlb_init(1);
> >> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
> >> index 71f4aaf..496f401 100644
> >> --- a/arch/mips/loongson64/env.c
> >> +++ b/arch/mips/loongson64/env.c
> >> @@ -192,8 +192,10 @@ void __init prom_init_env(void)
> >>          if (vendor == PCI_VENDOR_ID_LOONGSON && device == 0x7a00) {
> >>                  pr_info("The bridge chip is LS7A\n");
> >>                  loongson_sysconf.bridgetype = LS7A;
> >> +               loongson_sysconf.dma_config = ls7a_dma_config;
> >>          } else {
> >>                  pr_info("The bridge chip is RS780E or SR5690\n");
> >>                  loongson_sysconf.bridgetype = RS780E;
> >> +               loongson_sysconf.dma_config = rs780e_dma_config;
> >>          }
> >>   }
> >> --
> >> 2.1.0
> >>
>
