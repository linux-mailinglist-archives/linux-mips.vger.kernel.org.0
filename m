Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C87D1BF00C
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 08:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgD3GLz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 02:11:55 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:38737 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbgD3GLz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Apr 2020 02:11:55 -0400
Received: by mail-il1-f193.google.com with SMTP id c18so243625ile.5;
        Wed, 29 Apr 2020 23:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H/Z/NG3xt+7eYef3fmAdT1EwVOP1RXMi/3PpMayvfSE=;
        b=G1CyT6kxjGG7Q7pshAUsV+gDfqxj9o0Fj9b174+yQHi4IfBSR6RtHSI3JXfAyAbtxH
         1w5clOPh3EfH1+L4JqBMR6PVAINNwtqC7Th5HokfSvs0keUv7RvWeMnu0PXPmCdUukqL
         zl3lbCFkMLkq6vE4kSKo03QUeEFzs1/hD9TKeYg7Mc8OTIUtmQP8a4xaRh9bhjhMShxA
         +zj2Ypd/cJw+19JSlEX9oB8UT21U2/1j/6uMBqoD3POQeR0Jv2S6g/uVoEY9FmIViYbY
         P5oDINXNOPR2vPBlDQsR86HZNDwY9nRyvwjwIWLBn1Y+wXu6zM8x5DUcHPJaki6R+3nv
         xRXg==
X-Gm-Message-State: AGi0PuYYJVgpunHAcuehj3yXDUfHf2B1nMCWSt7iu1xXp/nAlCt9WHUu
        4ZHuQ3zfCp07RQeosqtMpAmNcB7iklwxe28ypRQ=
X-Google-Smtp-Source: APiQypL4QKDFwnemYhat/ReVkS9zXaIb/KMeKVVjiMkBPx0BuX2CER+6pj9ZLeSFvHmD1X46WjFXfNzB9ELgeT6ope4=
X-Received: by 2002:a92:c52a:: with SMTP id m10mr410035ili.208.1588227114118;
 Wed, 29 Apr 2020 23:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <1588213867-32274-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1588213867-32274-1-git-send-email-yangtiezhu@loongson.cn>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 30 Apr 2020 14:19:25 +0800
Message-ID: <CAAhV-H5QBOnrqVbMfGf7H5vJ6UMhUxhkCqAzZiwRFn_VwTQHpA@mail.gmail.com>
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

Hi  Christoph,

On Thu, Apr 30, 2020 at 10:31 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> In the current market, the most used bridge chip on the Loongson
> platform are RS780E and LS7A, the RS780E bridge chip is already
> supported by the mainline kernel.
>
> In order to use the default implementation of __phys_to_dma() and
> __dma_to_phys() in dma-direct.h, remove CONFIG_ARCH_HAS_PHYS_TO_DMA
> and then set the bus's DMA limit to 36 bit for RS780E to maintain
> downward compatibility.
I know that you want use the default implementation of __phys_to_dma()
and __dma_to_phys() as more as possible. But, if that is "impossible"
on Loongson-3, should we still be forced to use the default? Yes, this
patch makes the default version work, but it limit the device's DMA
capability, which is not what we want.

>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>
> Hi Christoph and Jiaxun,
>
> Thank you very much for your suggestions.
>
> v5:
>   - use the default implementation of __phys_to_dma()
>     and __dma_to_phys() in dma-direct.h
>
> v6:
>   - make loongson_dma_config() static
>   - put ls7a things before rs780 things
>
>  arch/mips/Kconfig                                  |  1 -
>  arch/mips/include/asm/mach-loongson64/boot_param.h |  5 +++++
>  arch/mips/loongson64/dma.c                         | 22 +++++++++++-----------
>  arch/mips/loongson64/env.c                         |  2 ++
>  4 files changed, 18 insertions(+), 12 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 9f15539..12b6bdb 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1454,7 +1454,6 @@ choice
>  config CPU_LOONGSON64
>         bool "Loongson 64-bit CPU"
>         depends on SYS_HAS_CPU_LOONGSON64
> -       select ARCH_HAS_PHYS_TO_DMA
>         select CPU_MIPSR2
>         select CPU_HAS_PREFETCH
>         select CPU_SUPPORTS_64BIT_KERNEL
> diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
> index f082d87..0c07a96 100644
> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> @@ -197,6 +197,7 @@ enum loongson_bridge_type {
>         RS780E = 2
>  };
>
> +struct pci_dev;
>  struct loongson_system_configuration {
>         u32 nr_cpus;
>         u32 nr_nodes;
> @@ -221,9 +222,13 @@ struct loongson_system_configuration {
>         u32 nr_sensors;
>         struct sensor_device sensors[MAX_SENSORS];
>         u64 workarounds;
> +       void (*dma_config)(struct pci_dev *pdev);
>  };
>
>  extern struct efi_memory_map_loongson *loongson_memmap;
>  extern struct loongson_system_configuration loongson_sysconf;
>
> +extern void ls7a_dma_config(struct pci_dev *pdev);
> +extern void rs780e_dma_config(struct pci_dev *pdev);
> +
>  #endif
> diff --git a/arch/mips/loongson64/dma.c b/arch/mips/loongson64/dma.c
> index 5e86635..ef40b0d 100644
> --- a/arch/mips/loongson64/dma.c
> +++ b/arch/mips/loongson64/dma.c
> @@ -1,24 +1,24 @@
>  // SPDX-License-Identifier: GPL-2.0
> -#include <linux/dma-direct.h>
> +#include <linux/pci.h>
>  #include <linux/init.h>
>  #include <linux/swiotlb.h>
>
> -dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
> +void ls7a_dma_config(struct pci_dev *pdev)
>  {
> -       /* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
> -        * Loongson-3's 48bit address space and embed it into 40bit */
> -       long nid = (paddr >> 44) & 0x3;
> -       return ((nid << 44) ^ paddr) | (nid << 37);
>  }
>
> -phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
> +void rs780e_dma_config(struct pci_dev *pdev)
>  {
> -       /* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
> -        * Loongson-3's 48bit address space and embed it into 40bit */
> -       long nid = (daddr >> 37) & 0x3;
> -       return ((nid << 37) ^ daddr) | (nid << 44);
> +       pdev->dev.bus_dma_limit = DMA_BIT_MASK(36);
>  }
>
> +static void loongson_dma_config(struct pci_dev *pdev)
> +{
> +       loongson_sysconf.dma_config(pdev);
> +}
> +
> +DECLARE_PCI_FIXUP_EARLY(PCI_ANY_ID, PCI_ANY_ID, loongson_dma_config);
> +
>  void __init plat_swiotlb_setup(void)
>  {
>         swiotlb_init(1);
> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
> index 71f4aaf..496f401 100644
> --- a/arch/mips/loongson64/env.c
> +++ b/arch/mips/loongson64/env.c
> @@ -192,8 +192,10 @@ void __init prom_init_env(void)
>         if (vendor == PCI_VENDOR_ID_LOONGSON && device == 0x7a00) {
>                 pr_info("The bridge chip is LS7A\n");
>                 loongson_sysconf.bridgetype = LS7A;
> +               loongson_sysconf.dma_config = ls7a_dma_config;
>         } else {
>                 pr_info("The bridge chip is RS780E or SR5690\n");
>                 loongson_sysconf.bridgetype = RS780E;
> +               loongson_sysconf.dma_config = rs780e_dma_config;
>         }
>  }
> --
> 2.1.0
>
