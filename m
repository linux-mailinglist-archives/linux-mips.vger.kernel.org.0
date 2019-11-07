Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31DE3F2CBA
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 11:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfKGKmO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 7 Nov 2019 05:42:14 -0500
Received: from mx2.suse.de ([195.135.220.15]:57376 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727278AbfKGKmO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 Nov 2019 05:42:14 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 666DCAF57;
        Thu,  7 Nov 2019 10:42:11 +0000 (UTC)
Date:   Thu, 7 Nov 2019 11:42:09 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Yinglu Yang <yangyinglu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Scan the DMI system information
Message-ID: <20191107114209.5e4cfa4d@endymion>
In-Reply-To: <5c042bd8-40ad-e84f-588d-f3ee56f7216d@loongson.cn>
References: <5959f904-5c46-30a7-7a4f-17f692aca320@loongson.cn>
        <5c042bd8-40ad-e84f-588d-f3ee56f7216d@loongson.cn>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 7 Nov 2019 17:26:58 +0800, Tiezhu Yang wrote:
> Sorry to resend this email because the mail list server was denied
> due to it is not plain text.
> 
> On 11/07/2019 11:42 AM, Jiaxun Yang wrote:
> > 于 2019年11月7日 GMT+08:00 上午10:42:23, Tiezhu Yang<yangtiezhu@loongson.cn>  写到:  
> >> On 11/07/2019 08:35 AM, Jiaxun Yang wrote:  
> >>> 于 2019年11月7日 GMT+08:00 上午12:05:41, Tiezhu Yang  
> >> <yangtiezhu@loongson.cn>  写到:  
> >>>> Enable DMI scanning on the MIPS architecture, this setups DMI
> >>>> identifiers
> >>>> (dmi_system_id) for printing it out on task dumps and prepares DIMM
> >>>> entry
> >>>> information (dmi_memdev_info) from the SMBIOS table. With this  
> >> patch,  
> >>>> the
> >>>> driver can easily match various of mainboards.
> >>>>
> >>>> In the SMBIOS reference specification, the table anchor string  
> >> "_SM_"  
> >>>> is
> >>>> present in the address range 0xF0000 to 0xFFFFF on a 16-byte  
> >> boundary,  
> >>>> but there exists a special case for loongson platform, when call
> >>>> function
> >>>> dmi_early_remap, it should specify the start address to 0xFFFE000  
> >> due  
> >>>> to
> >>>> it is reserved for SMBIOS and can be normally access in the BIOS.
> >>>>
> >>>> Co-developed-by: Yinglu Yang<yangyinglu@loongson.cn>
> >>>> Signed-off-by: Yinglu Yang<yangyinglu@loongson.cn>
> >>>> Signed-off-by: Tiezhu Yang<yangtiezhu@loongson.cn>
> >>>> ---
> >>>> arch/mips/Kconfig           | 12 ++++++++++++
> >>>> arch/mips/include/asm/dmi.h | 43
> >>>> +++++++++++++++++++++++++++++++++++++++++++
> >>>> arch/mips/kernel/setup.c    |  2 ++
> >>>> 3 files changed, 57 insertions(+)
> >>>> create mode 100644 arch/mips/include/asm/dmi.h
> >>>>
> >>>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> >>>> index 7cb8947..0a67b18 100644
> >>>> --- a/arch/mips/Kconfig
> >>>> +++ b/arch/mips/Kconfig
> >>>> @@ -2757,6 +2757,18 @@ config HW_PERF_EVENTS
> >>>> 	  Enable hardware performance counter support for perf events. If
> >>>> 	  disabled, perf events will use software events only.
> >>>>
> >>>> +# Mark as expert because too many people got it wrong.
> >>>> +# The code disables itself when not needed.
> >>>> +config DMI
> >>>> +	default y
> >>>> +	select DMI_SCAN_MACHINE_NON_EFI_FALLBACK
> >>>> +	bool "Enable DMI scanning" if EXPERT
> >>>> +	help
> >>>> +	  Enabled scanning of DMI to identify machine quirks. Say Y
> >>>> +	  here unless you have verified that your setup is not
> >>>> +	  affected by entries in the DMI blacklist. Required by PNP
> >>>> +	  BIOS code.
> >>>> +
> >>>> config SMP
> >>>> 	bool "Multi-Processing support"
> >>>> 	depends on SYS_SUPPORTS_SMP
> >>>> diff --git a/arch/mips/include/asm/dmi.h  
> >> b/arch/mips/include/asm/dmi.h  
> >>>> new file mode 100644
> >>>> index 0000000..1f3da37
> >>>> --- /dev/null
> >>>> +++ b/arch/mips/include/asm/dmi.h
> >>>> @@ -0,0 +1,43 @@
> >>>> +/* SPDX-License-Identifier: GPL-2.0 */
> >>>> +#ifndef _ASM_MIPS_DMI_H
> >>>> +#define _ASM_MIPS_DMI_H
> >>>> +
> >>>> +#define dmi_early_remap		mips_early_memremap
> >>>> +#define dmi_early_unmap		mips_early_memunmap
> >>>> +#define dmi_remap(_x, _l)	mips_memremap(_x, _l, MEMREMAP_WB)
> >>>> +#define dmi_unmap(_x)		mips_memunmap(_x)
> >>>> +
> >>>> +#define dmi_alloc(l)		memblock_alloc_low(l, PAGE_SIZE)
> >>>> +
> >>>> +void __init *mips_early_memremap(resource_size_t phys_addr,  
> >> unsigned  
> >>>> long size)
> >>>> +{
> >>>> +#if defined(CONFIG_MACH_LOONGSON64)
> >>>> +	if (phys_addr == 0xF0000)
> >>>> +		phys_addr = 0xFFFE000;
> >>>> +
> >>>> +	return (void *)TO_CAC(phys_addr);
> >>>> +#else
> >>>> +	return NULL;
> >>>> +#endif
> >>>> +}  
> >>> Hi Tiezhu,
> >>>
> >>> It is really tricky to hijack dmi address here during remap.
> >>> I think we should set the dmi table address at  dmi_scan.c by a marco  
> >> or something else rather than hijack it during remap.
> >>
> >> Hi Jiaxun,
> >>
> >> Thanks for your review. I agree with you, let me think about it and try
> >> to
> >> find a proper way, and then I will send a v2 patch.  
> 
> Hi Jiaxun,
> 
> It seems that there is no absolutely better way to handle this case.
> 
> 1. use conditional compilation in drivers/firmware/dmi_scan.c:
> 
> #if defined(CONFIG_MACH_LOONGSON64)
> 
> p = dmi_early_remap(0xFFFE000, 0x10000);
> 
> #else
> 
> p = dmi_early_remap(0xF0000, 0x10000);
> 
> #endif
> 
> 
> This will influence the common code.
> 
> 2. use callback function in arch/mips/include/asm/dmi.h:

I see no reason to go that route if the decision can be made at build
time. Callback functions are good when the decision is made at run time.

> 
> struct plat_dmi_ops {
> 
>          void (*early_memremap)(void);
> 
>          void (*memremap)(void);
> 
> };
> 
> extern struct plat_dmi_ops *dmi_ops;
> 
> void __init *mips_early_memremap(resource_size_t phys_addr, unsigned long size)
> 
> {
> 
>          dmi_ops->early_memremap();
> 
> }
> 
> void *mips_memremap(resource_size_t offset, size_t size, unsigned long flags)
> 
> {
> 
>          dmi_ops->memremap();
> 
> }
> 
> 
> we can implement the callback function in various of MIPS platforms,
> like this:
> 
> struct plat_dmi_ops loongson3_dmi_ops = {
> 
>          .early_memremap = loongson3_early_memremap,
> 
>          .memremap = loongson3_memremap,
> 
> };
> 
> register_dmi_ops(&loongson3_dmi_ops);
> 
> #ifdef CONFIG_DMI
> 
> void __init *loongson3_early_memremap(resource_size_t phys_addr, unsigned long size)
> 
> {
> 
>          if (phys_addr == 0xF0000)
> 
>                  phys_addr = 0xfffe000;
> 
>          return (void *)TO_CAC(phys_addr);
> 
> }
> 
> void *loongson3_memremap(resource_size_t offset, size_t size, unsigned long flags)
> 
> {
> 
>          return (void *)TO_CAC(phys_addr);
> 
> }
> 
> #else
> 
> void __init __iomem *loongson3_early_memremap(u64 phys_addr, unsigned long size)
> 
> {
> 
>          return NULL;
> 
> }
> 
> void __init __iomem *loongson3_memremap(u64 phys_addr, unsigned long size)
> 
> {
> 
>          return NULL;
> 
> }
> 
> #endif
> 
> 
> This will not influence the common code.
> 
> What do you think?
> 
> 
> Hi Jean,
> 
> Could you give some suggestions?

What about:

#if defined(CONFIG_MACH_LOONGSON64)
#define SMBIOS_ENTRY_POINT_SCAN_START	0xFFFE000
#else
#define SMBIOS_ENTRY_POINT_SCAN_START	0xF0000
#endif

And then just use SMBIOS_ENTRY_POINT_SCAN_START instead of the raw
address everywhere it is needed?

-- 
Jean Delvare
SUSE L3 Support
