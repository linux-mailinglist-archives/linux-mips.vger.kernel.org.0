Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECD4F3CA3
	for <lists+linux-mips@lfdr.de>; Fri,  8 Nov 2019 01:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfKHARJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Nov 2019 19:17:09 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40270 "EHLO
        mail.loongson.cn" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfKHARJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Nov 2019 19:17:09 -0500
Received: from [10.20.41.27] (unknown [10.20.41.27])
        by mail (Coremail) with SMTP id QMiowPAxScj8s8RdYo4AAA--.116S3;
        Fri, 08 Nov 2019 08:17:00 +0800 (CST)
Subject: Re: [PATCH REPLY] MIPS: Scan the DMI system information
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20191107112801.7037-1-jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        yangyinglu@loongson.cn, jdelvare@suse.de,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <acd64ec9-e471-6fee-6505-ae3286a2972e@loongson.cn>
Date:   Fri, 8 Nov 2019 08:16:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20191107112801.7037-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: QMiowPAxScj8s8RdYo4AAA--.116S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuryrurW3Aw43ur4fGF4rXwb_yoWrtrWrpa
        9xA3Zayr48GF17G34fA34fuF1Yqws3WF90kFyj9r1xZas8Zw17Jrs3Krs2kryDZrWkKay0
        gF1SgF15CrZFkaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
        4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VCY1x0262k0Y48FwI0_Jr0_Gr1lYx0Ex4A2jsIE14v26r
        4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I
        648v4I1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
        kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
        67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
        CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E
        3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCT
        nIWIevJa73UjIFyTuYvjfU5eHqUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/07/2019 07:28 PM, Jiaxun Yang wrote:
> Hi Tiezhu and Jean,
>
> What about do like this?
> We shouldn't follow x86's Kconfig as most of MIPS devices
> don't support DMI.
>
> And, we can reuse map/unmap from io.h to reduce
> maintinance overhead.

Hi Jiaxun,

Thanks for your modification, it looks better, let me verify and test it,
and then I will send a v2 patch.

Thanks,

Tiezhu Yang

>
> Thanks
>
> Jiaxun
>
>> 8------------------------------------------------------8<
> Enable DMI scanning on the MIPS architecture, this setups DMI identifiers
> (dmi_system_id) for printing it out on task dumps and prepares DIMM entry
> information (dmi_memdev_info) from the SMBIOS table. With this patch, the
> driver can easily match various of mainboards.
>
> In the SMBIOS reference specification, the table anchor string "_SM_" is
> present in the address range 0xF0000 to 0xFFFFF on a 16-byte boundary,
> but there exists a special case for loongson platform, when call function
> dmi_early_remap, it should specify the start address to 0xFFFE000 due to
> it is reserved for SMBIOS and can be normally access in the BIOS.
>
> Co-developed-by: Yinglu Yang <yangyinglu@loongson.cn>
> Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> [jiaxun.yang@flygoat.com: Refine definitions and Kconfig]
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/Kconfig           |  9 +++++++++
>   arch/mips/include/asm/dmi.h | 20 ++++++++++++++++++++
>   arch/mips/kernel/setup.c    |  2 ++
>   drivers/firmware/dmi_scan.c |  6 +++++-
>   4 files changed, 36 insertions(+), 1 deletion(-)
>   create mode 100644 arch/mips/include/asm/dmi.h
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index c3a022ca3345..414f3a0ea397 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2759,6 +2759,15 @@ config HW_PERF_EVENTS
>   	  Enable hardware performance counter support for perf events. If
>   	  disabled, perf events will use software events only.
>   
> +config DMI
> +	default y if MACH_LOONGSON64
> +	select DMI_SCAN_MACHINE_NON_EFI_FALLBACK
> +	bool "Enable DMI scanning"
> +	help
> +	  Enabled scanning of DMI to identify machine quirks. Say Y
> +	  here unless you have verified that your setup is not
> +	  affected by entries in the DMI blacklist.
> +
>   config SMP
>   	bool "Multi-Processing support"
>   	depends on SYS_SUPPORTS_SMP
> diff --git a/arch/mips/include/asm/dmi.h b/arch/mips/include/asm/dmi.h
> new file mode 100644
> index 000000000000..5153ef6fe8a2
> --- /dev/null
> +++ b/arch/mips/include/asm/dmi.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_MIPS_DMI_H
> +#define _ASM_MIPS_DMI_H
> +
> +#include <linux/io.h>
> +#include <linux/memblock.h>
> +
> +#define dmi_early_remap(x, l)		ioremap_cache(x, l)
> +#define dmi_early_unmap(x, l)		iounmap(x)
> +#define dmi_remap(x, l)		ioremap_cache(x, l)
> +#define dmi_unmap(x)			iounmap(x)
> +
> +/* MIPS initialize DMI scan before SLAB is ready, so we use memblock here */
> +#define dmi_alloc(l)			memblock_alloc_low(l, PAGE_SIZE)
> +
> +#if defined(CONFIG_MACH_LOONGSON64)
> +#define SMBIOS_ENTRY_POINT_SCAN_START	0xfffe000
> +#endif
> +
> +#endif /* _ASM_MIPS_DMI_H */
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index c3d4212b5f1d..da7d312e20eb 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -28,6 +28,7 @@
>   #include <linux/decompress/generic.h>
>   #include <linux/of_fdt.h>
>   #include <linux/of_reserved_mem.h>
> +#include <linux/dmi.h>
>   
>   #include <asm/addrspace.h>
>   #include <asm/bootinfo.h>
> @@ -802,6 +803,7 @@ void __init setup_arch(char **cmdline_p)
>   #endif
>   
>   	arch_mem_init(cmdline_p);
> +	dmi_setup();
>   
>   	resource_init();
>   	plat_smp_setup();
> diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
> index 35ed56b9c34f..ee2dbebf2063 100644
> --- a/drivers/firmware/dmi_scan.c
> +++ b/drivers/firmware/dmi_scan.c
> @@ -11,6 +11,10 @@
>   #include <asm/dmi.h>
>   #include <asm/unaligned.h>
>   
> +#ifndef SMBIOS_ENTRY_POINT_SCAN_START
> +#define SMBIOS_ENTRY_POINT_SCAN_START 0xf0000
> +#endif
> +
>   struct kobject *dmi_kobj;
>   EXPORT_SYMBOL_GPL(dmi_kobj);
>   
> @@ -661,7 +665,7 @@ static void __init dmi_scan_machine(void)
>   			return;
>   		}
>   	} else if (IS_ENABLED(CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK)) {
> -		p = dmi_early_remap(0xF0000, 0x10000);
> +		p = dmi_early_remap(SMBIOS_ENTRY_POINT_SCAN_START, 0x10000);
>   		if (p == NULL)
>   			goto error;
>   


