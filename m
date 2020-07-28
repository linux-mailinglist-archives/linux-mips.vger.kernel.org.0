Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 128C4230078
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 06:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgG1EIW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 00:08:22 -0400
Received: from [115.28.160.31] ([115.28.160.31]:54742 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726004AbgG1EIV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jul 2020 00:08:21 -0400
Received: from hanazono.local (unknown [116.236.177.53])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 5BEBF6006D;
        Tue, 28 Jul 2020 12:08:12 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1595909292; bh=7sU+b2S5OQeF51fBW5K0xFQWC95f2Va54OtBp2iiUT0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ASOVaySfrnbNQNSf6P2yQu7oteymYDCChKRnXURc05Td9jut3RI28PEHnB6lGLGEB
         SdYAN4AeDs1LPBYioJT9e8seGa9b+jyrazqi/Nq4/Kcyqcvrw1HiCKHbpLqlTzC9wu
         P2EYUkAeg0n09nVgq/K7iSYvyIGoTKiMJ1/GmY1I=
Subject: Re: [PATCH v3 2/5] MIPS: Loongson64: Process ISA Node in DeviceTree
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200725014529.1143208-1-jiaxun.yang@flygoat.com>
 <20200725014529.1143208-3-jiaxun.yang@flygoat.com>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <b239011a-d946-17b8-3d29-995f1158d0bf@xen0n.name>
Date:   Tue, 28 Jul 2020 12:08:11 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:80.0)
 Gecko/20100101 Thunderbird/80.0a1
MIME-Version: 1.0
In-Reply-To: <20200725014529.1143208-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,


On 2020/7/25 09:45, Jiaxun Yang wrote:
> Previously, we're hardcoding resserved ISA I/O Space in code, now
"reserved"; also "in code" seems redundant (we're "hard-coding", aren't we?)
> we're processing reverved I/O via DeviceTree directly. Using the ranges
another "reserved" typo, but better restructure the whole clause.
> property to determine the size and address of reserved I/O space.
This sentence has no verb. Maybe you mean "Use"?
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
> +				    resource_size_t size)
>  {
> +	int ret = 0;
>  	struct logic_pio_hwaddr *range;
> +	unsigned long vaddr;
>  
>  	range = kzalloc(sizeof(*range), GFP_ATOMIC);
>  	if (!range)
> -		return;
> +		return -ENOMEM;
>  
> -	range->fwnode = &of_root->fwnode;
> -	range->size = MMIO_LOWER_RESERVED;
> -	range->hw_start = LOONGSON_PCIIO_BASE;
> +	range->fwnode = fwnode;
> +	range->size = size;
> +	range->hw_start = hw_start;
>  	range->flags = LOGIC_PIO_CPU_MMIO;
>  
> -	if (logic_pio_register_range(range)) {
> -		pr_err("Failed to reserve PIO range for legacy ISA\n");
> -		goto free_range;
> +	ret = logic_pio_register_range(range);
> +	if (ret) {
> +		kfree(range);
> +		return ret;
> +	}
> +
> +	/* Legacy ISA must placed at the start of PCI_IOBASE */
> +	if (range->io_start != 0) {
> +		logic_pio_unregister_range(range);
> +		kfree(range);
> +		return -EINVAL;
>  	}
>  
> -	if (WARN(range->io_start != 0,
> -			"Reserved PIO range does not start from 0\n"))
> -		goto unregister;
> -
> -	/*
> -	 * i8259 would access I/O space, so mapping must be done here.
> -	 * Please remove it when all drivers can be managed by logic_pio.
> -	 */
> -	ioremap_page_range(PCI_IOBASE, PCI_IOBASE + MMIO_LOWER_RESERVED,
> -				LOONGSON_PCIIO_BASE,
> -				pgprot_device(PAGE_KERNEL));
> -
> -	return;
> -unregister:
> -	logic_pio_unregister_range(range);
> -free_range:
> -	kfree(range);
> +	vaddr = PCI_IOBASE + range->io_start;
> +
> +	ioremap_page_range(vaddr, vaddr + size, hw_start, pgprot_device(PAGE_KERNEL));
> +
> +	return 0;
> +}
> +
> +static __init void reserve_pio_range(void)
> +{
> +	struct device_node *np;
> +
> +	for_each_node_by_name(np, "isa") {
> +		struct of_range range;
> +		struct of_range_parser parser;
> +
> +		pr_info("ISA Bridge: %pOF\n", np);
> +
> +		if (of_range_parser_init(&parser, np)) {
> +			pr_info("Failed to parse resources.\n");
> +			break;
> +		}
> +
> +		for_each_of_range(&parser, &range) {
> +			switch (range.flags & IORESOURCE_TYPE_BITS) {
> +			case IORESOURCE_IO:
> +				pr_info(" IO 0x%016llx..0x%016llx  ->  0x%016llx\n",
> +					range.cpu_addr,
> +					range.cpu_addr + range.size - 1,
> +					range.bus_addr);
> +				if (add_legacy_isa_io(&np->fwnode, range.cpu_addr, range.size))
> +					pr_warn("Failed to reserve legacy IO in Logic PIO\n");
> +				break;
> +			case IORESOURCE_MEM:
> +				pr_info(" MEM 0x%016llx..0x%016llx  ->  0x%016llx\n",
> +					range.cpu_addr,
> +					range.cpu_addr + range.size - 1,
> +					range.bus_addr);
> +				break;
> +			}
> +		}
> +	}
>  }
>  
>  void __init arch_init_irq(void)
