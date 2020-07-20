Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 852C3225C4E
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jul 2020 12:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbgGTKBU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Jul 2020 06:01:20 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34354 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728310AbgGTKBT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Jul 2020 06:01:19 -0400
Received: by mail-io1-f66.google.com with SMTP id q74so16979572iod.1;
        Mon, 20 Jul 2020 03:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KYxjoHTv6uKj3n82G+0SsQK8lIYz9oQYev2/3hv38x8=;
        b=l1A9RaESSIv9LCpOJcjB+lYwQoR48Iyyp8lTYOEmofQn76sU46CBTgW6LI9mRv8tFM
         z943HuHltQ520CuiVkALpTpnABK40jg9+HD2U4b7vrYXl4g9x9fbbNCtP9k3/2FzY9ry
         05GSlwxYopmXxqtIwGR7P6ib0nEKGg86SLCPs4Vee44FITghccbaIu+HiZxxpUI+Cokl
         kpU/n51Jwrug/TYUuHdO0uAgAz4cmStZcYN1llsBCE4ZEwrmKTZeqfFfxcZvQorwvYE1
         TP0Wdk4rOwphPiLb4C62jf5ykyw8x4nXiSox9YtRHuDazqc1Q894oRJu0/XTQOM4rsxr
         7uAg==
X-Gm-Message-State: AOAM530Z7g+UGrMNG0ipo7qKO3tNcGvxU6FNYqavrPcnlyPBqXShIGuZ
        wtiqnL/0P3Qa6a5hsy5xZ5jgtDk+u1dY3g2DjzY=
X-Google-Smtp-Source: ABdhPJxV6pAPGfa2GlMeYrPfo3O8mGIdY1f8QN1EuHpGCMVzgot8SC6RrqrpcHDVHe6pI9EGohzO21pxRbGKfeAPToY=
X-Received: by 2002:a5d:97d9:: with SMTP id k25mr22200787ios.42.1595239278579;
 Mon, 20 Jul 2020 03:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200720074249.596364-1-jiaxun.yang@flygoat.com> <20200720074249.596364-3-jiaxun.yang@flygoat.com>
In-Reply-To: <20200720074249.596364-3-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 20 Jul 2020 18:01:07 +0800
Message-ID: <CAAhV-H52=2-Hij0AFBGuZWhQ4kWqEwLsvzXPR-ZndQKtkjnMbw@mail.gmail.com>
Subject: Re: [PATCH 2/5] MIPS: Loongson64: Process ISA Node in DeviceTree
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Mon, Jul 20, 2020 at 3:44 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Previously, we're hardcoding resserved ISA I/O Space in code, now
> we're processing reverved I/O via DeviceTree directly. Using the ranges
> property to determine the size and address of reserved I/O space.
Maybe it is better to reserve a default legacy io range if there is no
"isa" node in the .dts file?

Huacai
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/loongson64/init.c | 85 ++++++++++++++++++++++++++-----------
>  1 file changed, 60 insertions(+), 25 deletions(-)
>
> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> index 59ddadace83f..028d7b324ec2 100644
> --- a/arch/mips/loongson64/init.c
> +++ b/arch/mips/loongson64/init.c
> @@ -7,6 +7,8 @@
>  #include <linux/irqchip.h>
>  #include <linux/logic_pio.h>
>  #include <linux/memblock.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <asm/bootinfo.h>
>  #include <asm/traps.h>
>  #include <asm/smp-ops.h>
> @@ -63,41 +65,74 @@ void __init prom_free_prom_memory(void)
>  {
>  }
>
> -static __init void reserve_pio_range(void)
> +static int __init add_legacy_isa_io(struct fwnode_handle *fwnode, phys_addr_t addr,
> +                            resource_size_t    size)
>  {
> +       int ret = 0;
>         struct logic_pio_hwaddr *range;
> +       unsigned long vaddr;
>
>         range = kzalloc(sizeof(*range), GFP_ATOMIC);
>         if (!range)
> -               return;
> +               return -ENOMEM;
>
> -       range->fwnode = &of_root->fwnode;
> -       range->size = MMIO_LOWER_RESERVED;
> -       range->hw_start = LOONGSON_PCIIO_BASE;
> +       range->fwnode = fwnode;
> +       range->size = size;
> +       range->hw_start = addr;
>         range->flags = LOGIC_PIO_CPU_MMIO;
>
> -       if (logic_pio_register_range(range)) {
> -               pr_err("Failed to reserve PIO range for legacy ISA\n");
> -               goto free_range;
> +       ret = logic_pio_register_range(range);
> +       if (ret) {
> +               kfree(range);
> +               return ret;
> +       }
> +
> +       /* Legacy ISA must placed at the start of PCI_IOBASE */
> +       if (range->io_start != 0) {
> +               logic_pio_unregister_range(range);
> +               kfree(range);
> +               return -EINVAL;
>         }
>
> -       if (WARN(range->io_start != 0,
> -                       "Reserved PIO range does not start from 0\n"))
> -               goto unregister;
> -
> -       /*
> -        * i8259 would access I/O space, so mapping must be done here.
> -        * Please remove it when all drivers can be managed by logic_pio.
> -        */
> -       ioremap_page_range(PCI_IOBASE, PCI_IOBASE + MMIO_LOWER_RESERVED,
> -                               LOONGSON_PCIIO_BASE,
> -                               pgprot_device(PAGE_KERNEL));
> -
> -       return;
> -unregister:
> -       logic_pio_unregister_range(range);
> -free_range:
> -       kfree(range);
> +       vaddr = PCI_IOBASE + range->io_start;
> +
> +       ioremap_page_range(vaddr, vaddr + size, addr, pgprot_device(PAGE_KERNEL));
> +
> +       return 0;
> +}
> +
> +static __init void reserve_pio_range(void)
> +{
> +       struct device_node *np;
> +
> +       for_each_node_by_name(np, "isa") {
> +               struct of_pci_range range;
> +               struct of_pci_range_parser parser;
> +
> +               pr_info("ISA Bridge: %pOF\n", np);
> +
> +               if (of_pci_range_parser_init(&parser, np)) {
> +                       pr_info("Failed to parse resources.\n");
> +                       break;
> +               }
> +
> +               for_each_of_pci_range(&parser, &range) {
> +                       switch (range.flags & IORESOURCE_TYPE_BITS) {
> +                       case IORESOURCE_IO:
> +                               pr_info(" IO 0x%016llx..0x%016llx\n",
> +                                       range.cpu_addr,
> +                                       range.cpu_addr + range.size - 1);
> +                               if (add_legacy_isa_io(&np->fwnode, range.cpu_addr, range.size))
> +                                       pr_warn("Failed to reserve legacy IO in Logic PIO\n");
> +                               break;
> +                       case IORESOURCE_MEM:
> +                               pr_info(" MEM 0x%016llx..0x%016llx\n",
> +                                       range.cpu_addr,
> +                                       range.cpu_addr + range.size - 1);
> +                               break;
> +                       }
> +               }
> +       }
>  }
>
>  void __init arch_init_irq(void)
> --
> 2.28.0.rc1
>
