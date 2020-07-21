Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0918A2273C8
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jul 2020 02:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgGUA1g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Jul 2020 20:27:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:56066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727119AbgGUA1f (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Jul 2020 20:27:35 -0400
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0ACB82080D;
        Tue, 21 Jul 2020 00:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595291255;
        bh=c6SZiY+whgjX+KRRviicz0UCk9I8GfA5MfRpG2BBP94=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=h25Ur3YjDXsIffNXZbUEBviwLUlanTRFbhwbcg8s+C+yYrfFTYIWsit+7qQSc+V8s
         8O1o15xWRghSS3gfayQfZmw7lGcP6klqpEGdE6Jl4feXp8b0tUvfLKezUjoZEAcstW
         D8t7q8kYE+tLgxEgh745NuSPqBpOJ99ojzMEhBuA=
Received: by mail-ot1-f50.google.com with SMTP id 72so13757859otc.3;
        Mon, 20 Jul 2020 17:27:35 -0700 (PDT)
X-Gm-Message-State: AOAM533IcDoMSj7MN3QdD7Br4oeEdjzymF5zSDoRS/20KGj4eReK0Dfk
        BHhecWyOt1xOHekWBeBQVoelk0nCDNSRK0Bfzg==
X-Google-Smtp-Source: ABdhPJy1WG7lsLgsUdYuKa9S5Q9mvAiX/mi4NprNl1cvMY0HgadPJ9FKGMIqdUm5qCrPvLhnJyKu659d9wOYC469eCU=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr20951382otb.107.1595291254348;
 Mon, 20 Jul 2020 17:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200720074249.596364-1-jiaxun.yang@flygoat.com> <20200720074249.596364-3-jiaxun.yang@flygoat.com>
In-Reply-To: <20200720074249.596364-3-jiaxun.yang@flygoat.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 20 Jul 2020 18:27:22 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLOVwgFGm82EA+rs2Skjv_=xuuW1V_Asnu2yHHqdy6CvA@mail.gmail.com>
Message-ID: <CAL_JsqLOVwgFGm82EA+rs2Skjv_=xuuW1V_Asnu2yHHqdy6CvA@mail.gmail.com>
Subject: Re: [PATCH 2/5] MIPS: Loongson64: Process ISA Node in DeviceTree
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 20, 2020 at 1:54 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Previously, we're hardcoding resserved ISA I/O Space in code, now
> we're processing reverved I/O via DeviceTree directly. Using the ranges
> property to determine the size and address of reserved I/O space.
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

Use of_range, of_range_parser instead of PCI variant.

> +
> +               pr_info("ISA Bridge: %pOF\n", np);
> +
> +               if (of_pci_range_parser_init(&parser, np)) {
> +                       pr_info("Failed to parse resources.\n");
> +                       break;
> +               }
> +
> +               for_each_of_pci_range(&parser, &range) {

for_each_of_range()

We need to add a define for of_range_parser_init too.

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
