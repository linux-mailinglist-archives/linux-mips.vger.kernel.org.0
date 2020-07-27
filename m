Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03BEE22E411
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jul 2020 04:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgG0Cl2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Jul 2020 22:41:28 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:37239 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgG0Cl2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Jul 2020 22:41:28 -0400
Received: by mail-il1-f195.google.com with SMTP id r12so11809757ilh.4;
        Sun, 26 Jul 2020 19:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hxBCzF4sEdVcGB9on95Q5MqqVkkXMRnrOfrJamWLZSg=;
        b=dtoDtQw1f6evRUTm0/t8DENgjo+3OFMNoIMyV4oxLoC5yHm6nlj0AJI6Uw6lkc6Ip5
         EOemzFO2qb1Gbpv9dZH1gY8lnxqAyBIuMgHvG9/E2MEkIk2mrpZyurrE+/9F+OKB/tzQ
         SqMz+ATcLvjRN//nq08kLA9W0pjXB9MlDWnZaytXzYSqnHxlzOcITY5AO1+EOqlGXxUk
         j20gR1wGWXUR2uIsSrsAFVcmilgUS3/PWSvojDRGVH7ILMJXNEVtkIlvu0xRr+4i6yMH
         Y2OcbYbw8aBM63SgUKDsynoF8vzc2/k6SceFa2R69xKfHb3nzpRUkcm0o1krCtnIGDUg
         BJmQ==
X-Gm-Message-State: AOAM530+b8tK2EKHqIICpkMBLBgMNx+Sfxe4/WTjrsjoqrofyhn6t35z
        86mM0RhzYsn6bYTq6JcXa7H/Rk1wPsK6f2OU5yiVXltwCNDXdA==
X-Google-Smtp-Source: ABdhPJyPwq1U2CZ80IZGzBds/tCPF/CyydICyyqjM8NFZvKy4Q8c246iVsGdnQG+G6/LcYmCBUNqgdVmzYmXmZRYOzg=
X-Received: by 2002:a05:6e02:e08:: with SMTP id a8mr22345863ilk.171.1595817686422;
 Sun, 26 Jul 2020 19:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200725014529.1143208-1-jiaxun.yang@flygoat.com> <20200725014529.1143208-3-jiaxun.yang@flygoat.com>
In-Reply-To: <20200725014529.1143208-3-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 27 Jul 2020 10:41:15 +0800
Message-ID: <CAAhV-H6xVi=6WPhiZ=oJDho_jY_nHZRc5-FSs8O9YKwCYzxh9w@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] MIPS: Loongson64: Process ISA Node in DeviceTree
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For the whole series,

Tested-by: Huacai Chen <chenhc@lemote.com>
Reviewed-by: Huacai Chen <chenhc@lemote.com>


On Sat, Jul 25, 2020 at 9:48 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Previously, we're hardcoding resserved ISA I/O Space in code, now
> we're processing reverved I/O via DeviceTree directly. Using the ranges
> property to determine the size and address of reserved I/O space.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> --
> v2: Use range_parser instead of pci_range_parser
> ---
>  arch/mips/loongson64/init.c | 87 ++++++++++++++++++++++++++-----------
>  1 file changed, 62 insertions(+), 25 deletions(-)
>
> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> index 59ddadace83f..8ba22c30f312 100644
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
> @@ -63,41 +65,76 @@ void __init prom_free_prom_memory(void)
>  {
>  }
>
> -static __init void reserve_pio_range(void)
> +static int __init add_legacy_isa_io(struct fwnode_handle *fwnode, resource_size_t hw_start,
> +                                   resource_size_t size)
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
> +       range->hw_start = hw_start;
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
> +       ioremap_page_range(vaddr, vaddr + size, hw_start, pgprot_device(PAGE_KERNEL));
> +
> +       return 0;
> +}
> +
> +static __init void reserve_pio_range(void)
> +{
> +       struct device_node *np;
> +
> +       for_each_node_by_name(np, "isa") {
> +               struct of_range range;
> +               struct of_range_parser parser;
> +
> +               pr_info("ISA Bridge: %pOF\n", np);
> +
> +               if (of_range_parser_init(&parser, np)) {
> +                       pr_info("Failed to parse resources.\n");
> +                       break;
> +               }
> +
> +               for_each_of_range(&parser, &range) {
> +                       switch (range.flags & IORESOURCE_TYPE_BITS) {
> +                       case IORESOURCE_IO:
> +                               pr_info(" IO 0x%016llx..0x%016llx  ->  0x%016llx\n",
> +                                       range.cpu_addr,
> +                                       range.cpu_addr + range.size - 1,
> +                                       range.bus_addr);
> +                               if (add_legacy_isa_io(&np->fwnode, range.cpu_addr, range.size))
> +                                       pr_warn("Failed to reserve legacy IO in Logic PIO\n");
> +                               break;
> +                       case IORESOURCE_MEM:
> +                               pr_info(" MEM 0x%016llx..0x%016llx  ->  0x%016llx\n",
> +                                       range.cpu_addr,
> +                                       range.cpu_addr + range.size - 1,
> +                                       range.bus_addr);
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
