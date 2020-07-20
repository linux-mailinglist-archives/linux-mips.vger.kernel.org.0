Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 170F2225DA9
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jul 2020 13:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbgGTLoY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 20 Jul 2020 07:44:24 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36001 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728058AbgGTLoY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Jul 2020 07:44:24 -0400
Received: by mail-io1-f67.google.com with SMTP id y2so17218005ioy.3;
        Mon, 20 Jul 2020 04:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+GN39BSEPAUfJ0bpjcxQHGly9Se3lNLoksrqMlxAACI=;
        b=kEUcdS8XOKileHZATRLxqzaBDBZHx8ePPXyU//4NBgasjV5meACd+T3anZ77V6IvM4
         AD0Bf3aKxIFHFHEq6octXjALzM7KxGlcBEcWQ43zHIHe+NcKzjZxoAfKdmpMwBbK8Os3
         zlyCxFKKpuiku2xBRrzPUZ4KjNfZiw8pRSUHuRP3TN1mJjzy+yrmidXToioycrXzP6wS
         KmjUZu/KO2qBPnguodSh5oowJHvAYxM00o0SIn05snRwI7/Bs6mBUQcXHYak2jRrJ5U8
         +SaPXnZU/bDAMwoqjwadNJv0GQg0zjEh7aU8VMWmj0UUAZFnqM9nN4OBB6DjwF2RsrtT
         eIhQ==
X-Gm-Message-State: AOAM532E4xQonKSlZk5l6nUkIVs9T5whxGNVBNPfrsZq8xiWyV13h615
        jZ3i//Zg3RMmPazZ6vghn5bLCXIZvTu+AkU+xJg=
X-Google-Smtp-Source: ABdhPJwHsT+22EimMWWdW5XiMz9g20yj0zPkGPGv0lZLPIwCzNsJkybtQeO7vSlQlH+9nyTdmMI+jz/itVffUz0hzmE=
X-Received: by 2002:a5d:97d9:: with SMTP id k25mr22575386ios.42.1595245462494;
 Mon, 20 Jul 2020 04:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200720074249.596364-1-jiaxun.yang@flygoat.com>
 <20200720074249.596364-3-jiaxun.yang@flygoat.com> <CAAhV-H52=2-Hij0AFBGuZWhQ4kWqEwLsvzXPR-ZndQKtkjnMbw@mail.gmail.com>
 <618053d0-57ea-8675-99ee-2f0b93faa334@flygoat.com>
In-Reply-To: <618053d0-57ea-8675-99ee-2f0b93faa334@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 20 Jul 2020 19:44:10 +0800
Message-ID: <CAAhV-H7n3Uy-X6ePgTsC6VfV0HbV22SM-BV9Q0i6BS=oxw__yA@mail.gmail.com>
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
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Mon, Jul 20, 2020 at 6:20 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>
>
> 在 2020/7/20 下午6:01, Huacai Chen 写道:
> > Hi, Jiaxun,
> >
> > On Mon, Jul 20, 2020 at 3:44 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> >> Previously, we're hardcoding resserved ISA I/O Space in code, now
> >> we're processing reverved I/O via DeviceTree directly. Using the ranges
> >> property to determine the size and address of reserved I/O space.
> > Maybe it is better to reserve a default legacy io range if there is no
> > "isa" node in the .dts file?
>
> As currently all dts is built-in in Kernel, I don't think it's necessary.
>
> Also the only ISA driver remaining that can't be probed by dts is i8042.
> We can convert it to DeviceTree based, and then we'll always be safe.
>
If you don't reserve a default legacy io range, then I should define
an "isa" node for KVM guests even if the VM doesn't have i8042 and
i8259. Because some pci devices still have legacy i/o ports, such as
qxl. I have tested your patches and found that KVM guests with qxl
cannot work without an "isa" node.

Huacai
> Thanks.
>
> - Jiaxun
>
> >
> > Huacai
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> ---
> >>   arch/mips/loongson64/init.c | 85 ++++++++++++++++++++++++++-----------
> >>   1 file changed, 60 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> >> index 59ddadace83f..028d7b324ec2 100644
> >> --- a/arch/mips/loongson64/init.c
> >> +++ b/arch/mips/loongson64/init.c
> >> @@ -7,6 +7,8 @@
> >>   #include <linux/irqchip.h>
> >>   #include <linux/logic_pio.h>
> >>   #include <linux/memblock.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_address.h>
> >>   #include <asm/bootinfo.h>
> >>   #include <asm/traps.h>
> >>   #include <asm/smp-ops.h>
> >> @@ -63,41 +65,74 @@ void __init prom_free_prom_memory(void)
> >>   {
> >>   }
> >>
> >> -static __init void reserve_pio_range(void)
> >> +static int __init add_legacy_isa_io(struct fwnode_handle *fwnode, phys_addr_t addr,
> >> +                            resource_size_t    size)
> >>   {
> >> +       int ret = 0;
> >>          struct logic_pio_hwaddr *range;
> >> +       unsigned long vaddr;
> >>
> >>          range = kzalloc(sizeof(*range), GFP_ATOMIC);
> >>          if (!range)
> >> -               return;
> >> +               return -ENOMEM;
> >>
> >> -       range->fwnode = &of_root->fwnode;
> >> -       range->size = MMIO_LOWER_RESERVED;
> >> -       range->hw_start = LOONGSON_PCIIO_BASE;
> >> +       range->fwnode = fwnode;
> >> +       range->size = size;
> >> +       range->hw_start = addr;
> >>          range->flags = LOGIC_PIO_CPU_MMIO;
> >>
> >> -       if (logic_pio_register_range(range)) {
> >> -               pr_err("Failed to reserve PIO range for legacy ISA\n");
> >> -               goto free_range;
> >> +       ret = logic_pio_register_range(range);
> >> +       if (ret) {
> >> +               kfree(range);
> >> +               return ret;
> >> +       }
> >> +
> >> +       /* Legacy ISA must placed at the start of PCI_IOBASE */
> >> +       if (range->io_start != 0) {
> >> +               logic_pio_unregister_range(range);
> >> +               kfree(range);
> >> +               return -EINVAL;
> >>          }
> >>
> >> -       if (WARN(range->io_start != 0,
> >> -                       "Reserved PIO range does not start from 0\n"))
> >> -               goto unregister;
> >> -
> >> -       /*
> >> -        * i8259 would access I/O space, so mapping must be done here.
> >> -        * Please remove it when all drivers can be managed by logic_pio.
> >> -        */
> >> -       ioremap_page_range(PCI_IOBASE, PCI_IOBASE + MMIO_LOWER_RESERVED,
> >> -                               LOONGSON_PCIIO_BASE,
> >> -                               pgprot_device(PAGE_KERNEL));
> >> -
> >> -       return;
> >> -unregister:
> >> -       logic_pio_unregister_range(range);
> >> -free_range:
> >> -       kfree(range);
> >> +       vaddr = PCI_IOBASE + range->io_start;
> >> +
> >> +       ioremap_page_range(vaddr, vaddr + size, addr, pgprot_device(PAGE_KERNEL));
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static __init void reserve_pio_range(void)
> >> +{
> >> +       struct device_node *np;
> >> +
> >> +       for_each_node_by_name(np, "isa") {
> >> +               struct of_pci_range range;
> >> +               struct of_pci_range_parser parser;
> >> +
> >> +               pr_info("ISA Bridge: %pOF\n", np);
> >> +
> >> +               if (of_pci_range_parser_init(&parser, np)) {
> >> +                       pr_info("Failed to parse resources.\n");
> >> +                       break;
> >> +               }
> >> +
> >> +               for_each_of_pci_range(&parser, &range) {
> >> +                       switch (range.flags & IORESOURCE_TYPE_BITS) {
> >> +                       case IORESOURCE_IO:
> >> +                               pr_info(" IO 0x%016llx..0x%016llx\n",
> >> +                                       range.cpu_addr,
> >> +                                       range.cpu_addr + range.size - 1);
> >> +                               if (add_legacy_isa_io(&np->fwnode, range.cpu_addr, range.size))
> >> +                                       pr_warn("Failed to reserve legacy IO in Logic PIO\n");
> >> +                               break;
> >> +                       case IORESOURCE_MEM:
> >> +                               pr_info(" MEM 0x%016llx..0x%016llx\n",
> >> +                                       range.cpu_addr,
> >> +                                       range.cpu_addr + range.size - 1);
> >> +                               break;
> >> +                       }
> >> +               }
> >> +       }
> >>   }
> >>
> >>   void __init arch_init_irq(void)
> >> --
> >> 2.28.0.rc1
> >>
