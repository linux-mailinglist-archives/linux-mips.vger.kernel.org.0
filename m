Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE7B1BD611
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 09:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgD2Hab (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 03:30:31 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39587 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgD2Haa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Apr 2020 03:30:30 -0400
Received: by mail-io1-f68.google.com with SMTP id w4so1133761ioc.6;
        Wed, 29 Apr 2020 00:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dZHTcsvd+3N0oInRnY4DjkFuABRDZ8hC5QyzW4Fndpw=;
        b=TetJLiZPw6ChEh/JCuL44cexQY5WkpSd0UwYbPCSF07RKtB6rl4zlPjtgA9qhsNUcm
         RY331mi+u67yhgxSlCGyTCgiA1R4kB0PLQu3rSrRjeQlNmXDO7+jo4byfaWMcl64uDnC
         g5jzIMav8lH7bU2n3Jk/C+VWRqK4eIpf12wXkfdnThJmJ/LWHY+RNyh+55jX1/dgbTK1
         MpDcUoeNFxkWCLO0DRXTZucSRBKBh3lnLlaqepnSqSjouds8L6kFtkTQGf85EQK5HMfI
         zN/cmvkNbu/gldmdroVXYwRmX6fkIyq1qtEEKCX7dXzImr0erYVtowXcjMe0+Jr/dblN
         fqbQ==
X-Gm-Message-State: AGi0PubdiMi9IWuBqvyJ6eaVoiUBiEqjunuxQuETiyNFDs+zXiPSSlwu
        sYtACUhOMHLHVmxGrGgGQkDeKX4FeMI3aJLKIfg=
X-Google-Smtp-Source: APiQypJVWPuYy7vf+TXR8F6vp7ZkZTtUEZL+3Ecw2/FSpOFVbzuOM17akv3bF+vwpip+kTcDxviWpnQ/PJfWO7N+NWw=
X-Received: by 2002:a02:415:: with SMTP id 21mr29604089jab.126.1588145429339;
 Wed, 29 Apr 2020 00:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <1588143611-6815-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1588143611-6815-1-git-send-email-yangtiezhu@loongson.cn>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Wed, 29 Apr 2020 15:38:00 +0800
Message-ID: <CAAhV-H7uhPo_ZCTyt8eh9LSXXW7Unbr0SEXwG55GWLTksiNBWQ@mail.gmail.com>
Subject: Re: [PATCH v5] MIPS: Loongson: Add DMA support for LS7A
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

On Wed, Apr 29, 2020 at 3:00 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> In the current market, the most used bridge chip on the Loongson
> platform are RS780E and LS7A, the RS780E bridge chip is already
> supported by the mainline kernel.
>
> In order to use the default implementation of __phys_to_dma() and
> __dma_to_phys() in dma-direct.h, remove CONFIG_ARCH_HAS_PHYS_TO_DMA
> and then set the bus's DMA limit to 36 bit for RS780E to maintain
> downward compatibility.
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
> index fc9f14b..cccf4cb 100644
> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> @@ -197,6 +197,7 @@ enum loongson_bridge_type {
>         LS7A = 2
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
> +extern void rs780e_dma_config(struct pci_dev *pdev);
> +extern void ls7a_dma_config(struct pci_dev *pdev);
Please use alpha-betical order here, which means put ls7a things
before rs780 things.

> +
>  #endif
> diff --git a/arch/mips/loongson64/dma.c b/arch/mips/loongson64/dma.c
> index 5e86635..6878bcc 100644
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
> +void rs780e_dma_config(struct pci_dev *pdev)
>  {
> -       /* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
> -        * Loongson-3's 48bit address space and embed it into 40bit */
> -       long nid = (paddr >> 44) & 0x3;
> -       return ((nid << 44) ^ paddr) | (nid << 37);
> +       pdev->dev.bus_dma_limit = DMA_BIT_MASK(36);
>  }
>
> -phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
> +void ls7a_dma_config(struct pci_dev *pdev)
>  {
> -       /* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
> -        * Loongson-3's 48bit address space and embed it into 40bit */
> -       long nid = (daddr >> 37) & 0x3;
> -       return ((nid << 37) ^ daddr) | (nid << 44);
>  }
Why use a hardcoded 37? LS7A's node-id bits are configurable in BIOS.

>
> +void loongson_dma_config(struct pci_dev *pdev)
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
