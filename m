Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20CEA1BB9C9
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 11:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgD1J0g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 05:26:36 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2119 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726904AbgD1J0g (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 05:26:36 -0400
Received: from lhreml724-chm.china.huawei.com (unknown [172.18.7.108])
        by Forcepoint Email with ESMTP id 47F54C196A9CD38E624F;
        Tue, 28 Apr 2020 10:26:34 +0100 (IST)
Received: from [127.0.0.1] (10.47.4.245) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1913.5; Tue, 28 Apr
 2020 10:26:32 +0100
From:   John Garry <john.garry@huawei.com>
Subject: Re: [PATCH v2 3/3] MIPS: Loongson64: Enable PCI_IO_VMMAP
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Stephen Kitt <steve@sk2.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Daniel Silsby <dansilsby@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Helgaas <bhelgaas@google.com>
References: <20200428021437.2000066-1-jiaxun.yang@flygoat.com>
 <20200428021437.2000066-4-jiaxun.yang@flygoat.com>
Message-ID: <952a8ec0-036d-40dc-dd04-05f9e72dc2c3@huawei.com>
Date:   Tue, 28 Apr 2020 10:25:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200428021437.2000066-4-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.4.245]
X-ClientProxiedBy: lhreml706-chm.china.huawei.com (10.201.108.55) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 28/04/2020 03:14, Jiaxun Yang wrote:
> Finally we are able to elegantly add I/O ports for PCI host bridge
> via devicetree with logic_pio.
> 
> To deal with legacy drivers that have fixed I/O ports range we
> reserved 0x10000 in PCI_IOBASE, should be enough for i8259 i8042
> stuff.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/Kconfig                             |  1 +
>   .../include/asm/mach-loongson64/loongson.h    |  2 ++
>   arch/mips/loongson64/init.c                   | 34 ++++++++++++++++---
>   arch/mips/loongson64/pci.c                    |  2 +-
>   4 files changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 4e5308178649..1669735dacd8 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -479,6 +479,7 @@ config MACH_LOONGSON64
>   	select I8259
>   	select IRQ_MIPS_CPU
>   	select NR_CPUS_DEFAULT_64
> +	select PCI_IO_VMMAP
>   	select USE_GENERIC_EARLY_PRINTK_8250
>   	select SYS_HAS_CPU_LOONGSON64
>   	select SYS_HAS_EARLY_PRINTK
> diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
> index fde1b75c45ea..94035a47be5b 100644
> --- a/arch/mips/include/asm/mach-loongson64/loongson.h
> +++ b/arch/mips/include/asm/mach-loongson64/loongson.h
> @@ -86,6 +86,8 @@ extern int mach_i8259_irq(void);
>   #define LOONGSON_PCIIO_SIZE	0x00100000	/* 1M */
>   #define LOONGSON_PCIIO_TOP	(LOONGSON_PCIIO_BASE+LOONGSON_PCIIO_SIZE-1)
>   
> +#define MMIO_LOWER_RESERVED	0x10000
> +
>   /* Loongson Register Bases */
>   
>   #define LOONGSON_PCICONFIGBASE	0x00
> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> index da38944471f4..4592eb2f78dd 100644
> --- a/arch/mips/loongson64/init.c
> +++ b/arch/mips/loongson64/init.c
> @@ -5,6 +5,7 @@
>    */
>   
>   #include <linux/irqchip.h>
> +#include <linux/logic_pio.h>
>   #include <linux/memblock.h>
>   #include <asm/bootinfo.h>
>   #include <asm/traps.h>
> @@ -29,10 +30,6 @@ void __init prom_init(void)
>   	fw_init_cmdline();
>   	prom_init_env();
>   
> -	/* init base address of io space */
> -	set_io_port_base((unsigned long)
> -		ioremap(LOONGSON_PCIIO_BASE, LOONGSON_PCIIO_SIZE));
> -
>   	prom_init_numa_memory();
>   
>   	/* Hardcode to CPU UART 0 */
> @@ -46,7 +43,36 @@ void __init prom_free_prom_memory(void)
>   {
>   }
>   
> +static __init void reserve_pio_range(void)
> +{
> +	struct logic_pio_hwaddr *range;
> +
> +	range = kzalloc(sizeof(*range), GFP_ATOMIC);
> +	if (!range)
> +		return;
> +
> +	range->fwnode = &of_root->fwnode;
> +	range->size = MMIO_LOWER_RESERVED;
> +	range->hw_start = LOONGSON_PCIIO_BASE;
> +	range->flags = LOGIC_PIO_CPU_MMIO;
> +
> +	if (logic_pio_register_range(range)) {
> +		pr_err("Failed to reserve PIO range for legacy ISA\n");
> +		kfree(range);
> +		return;
> +	}

I think that you should also check the range->io_start == 0 is returned 
here, as your code relies on that.

And I would also like to reiterate that this is somewhat fragile and 
relies on ordering. But I feel better than modifying common code. And I 
agree that the right thing to do is take care of the logic pio 
translations for your drivers now, as you mention, below.

Thanks,
John

> +
> +	/*
> +	 * i8259 would access I/O space, so mapping must be done here.
> +	 * Please remove it when all drivers can be managed by logic_pio.
> +	 */
> +	ioremap_page_range(PCI_IO_START, PCI_IO_START + MMIO_LOWER_RESERVED,
> +				  LOONGSON_PCIIO_BASE,
> +				  pgprot_device(PAGE_KERNEL));
> +}
> +
>   void __init arch_init_irq(void)
>   {
> +	reserve_pio_range();
>   	irqchip_init();
>   }
> diff --git a/arch/mips/loongson64/pci.c b/arch/mips/loongson64/pci.c
> index a440a2725a20..7aecb88dd377 100644
> --- a/arch/mips/loongson64/pci.c
> +++ b/arch/mips/loongson64/pci.c
> @@ -37,7 +37,7 @@ extern int sbx00_acpi_init(void);
>   static int __init pcibios_init(void)
>   {
>   
> -	loongson_pci_controller.io_map_base = mips_io_port_base;
> +	loongson_pci_controller.io_map_base = IOPORT_RW_BASE;
>   	loongson_pci_mem_resource.start = loongson_sysconf.pci_mem_start_addr;
>   	loongson_pci_mem_resource.end = loongson_sysconf.pci_mem_end_addr;
>   
> 

