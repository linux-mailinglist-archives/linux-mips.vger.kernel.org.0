Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 354411502A7
	for <lists+linux-mips@lfdr.de>; Mon,  3 Feb 2020 09:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgBCIcW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Feb 2020 03:32:22 -0500
Received: from mail.loongson.cn ([114.242.206.163]:44594 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726244AbgBCIcW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 3 Feb 2020 03:32:22 -0500
Received: from [192.168.68.106] (unknown [111.18.44.203])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL2h+2jdej_YLAA--.374S3;
        Mon, 03 Feb 2020 16:32:00 +0800 (CST)
Subject: Re: [PATCH v2,RESEND] MIPS: Scan the DMI system information
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Jean Delvare <jdelvare@suse.com>,
        Jean Delvare <jdelvare@suse.de>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yinglu Yang <yangyinglu@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1579181165-2493-1-git-send-email-yangtiezhu@loongson.cn>
Message-ID: <a267161f-c8b3-a11c-7416-3ab9ba19aa82@loongson.cn>
Date:   Mon, 3 Feb 2020 16:32:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1579181165-2493-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxL2h+2jdej_YLAA--.374S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKF1rJryDXF4fCFWkXFykGrg_yoW7GF1fpF
        WDAFsYyr4DJF47G34fA34fuF15Xan3WFZ0kFyj9r17ZasxXF17Jrs3Kw4DAryDAr4kKay0
        9F1agF1Yka9FkaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
        n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
        0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
        zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
        4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j
        6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
        BIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 1/16/20 9:26 PM, Tiezhu Yang wrote:
> Enable DMI scanning on the MIPS architecture, this setups DMI identifiers
> (dmi_system_id) for printing it out on task dumps and prepares DIMM entry
> information (dmi_memdev_info) from the SMBIOS table. With this patch, the
> driver can easily match various of mainboards.
>
> In the SMBIOS reference specification, the table anchor string "_SM_" is
> present in the address range 0xF0000 to 0xFFFFF on a 16-byte boundary,
> but there exists a special case for Loongson platform, when call function
> dmi_early_remap, it should specify the start address to 0xFFFE000 due to
> it is reserved for SMBIOS and can be normally access in the BIOS.
>
> This patch works fine on the Loongson 3A3000 platform which belongs to
> MIPS architecture and has no influence on the other architectures such
> as x86 and ARM.
>
> Co-developed-by: Yinglu Yang <yangyinglu@loongson.cn>
> Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
> [jiaxun.yang@flygoat.com: Refine definitions and Kconfig]
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Reviewed-by: Huacai Chen <chenhc@lemote.com>
> ---
>
> v2:
>    - add SMBIOS_ENTRY_POINT_SCAN_START suggested by Jean
>    - refine definitions and Kconfig by Jiaxun
>
>   arch/mips/Kconfig           | 10 ++++++++++
>   arch/mips/include/asm/dmi.h | 20 ++++++++++++++++++++
>   arch/mips/kernel/setup.c    |  2 ++
>   drivers/firmware/dmi_scan.c |  6 +++++-
>   4 files changed, 37 insertions(+), 1 deletion(-)
>   create mode 100644 arch/mips/include/asm/dmi.h


Hi Paul and Jean,

How do you think this patch?

Should I split it into the following two patches?
[PATCH v3 1/2] firmware: dmi: Add macro SMBIOS_ENTRY_POINT_SCAN_START
[PATCH v3 2/2] MIPS: Add support for Desktop Management Interface (DMI)

The first patch is only related with the common dmi code
drivers/firmware/dmi_scan.c, the other patch is only related
with the mips code under arch/mips.

If you have any questions or suggestions, please let me know.
I am looking forward to your early reply.

Thanks,

Tiezhu Yang


>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 4b83507..c097f78 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2773,6 +2773,16 @@ config HW_PERF_EVENTS
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
> +	  affected by entries in the DMI blacklist. Required by PNP
> +	  BIOS code.
> +
>   config SMP
>   	bool "Multi-Processing support"
>   	depends on SYS_SUPPORTS_SMP
> diff --git a/arch/mips/include/asm/dmi.h b/arch/mips/include/asm/dmi.h
> new file mode 100644
> index 0000000..27415a2
> --- /dev/null
> +++ b/arch/mips/include/asm/dmi.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_DMI_H
> +#define _ASM_DMI_H
> +
> +#include <linux/io.h>
> +#include <linux/memblock.h>
> +
> +#define dmi_early_remap(x, l)		ioremap_cache(x, l)
> +#define dmi_early_unmap(x, l)		iounmap(x)
> +#define dmi_remap(x, l)			ioremap_cache(x, l)
> +#define dmi_unmap(x)			iounmap(x)
> +
> +/* MIPS initialize DMI scan before SLAB is ready, so we use memblock here */
> +#define dmi_alloc(l)			memblock_alloc_low(l, PAGE_SIZE)
> +
> +#if defined(CONFIG_MACH_LOONGSON64)
> +#define SMBIOS_ENTRY_POINT_SCAN_START	0xFFFE000
> +#endif
> +
> +#endif /* _ASM_DMI_H */
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 701f4bc..d9bd841 100644
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
> @@ -800,6 +801,7 @@ void __init setup_arch(char **cmdline_p)
>   #endif
>   
>   	arch_mem_init(cmdline_p);
> +	dmi_setup();
>   
>   	resource_init();
>   	plat_smp_setup();
> diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
> index 2045566..f59163c 100644
> --- a/drivers/firmware/dmi_scan.c
> +++ b/drivers/firmware/dmi_scan.c
> @@ -11,6 +11,10 @@
>   #include <asm/dmi.h>
>   #include <asm/unaligned.h>
>   
> +#ifndef SMBIOS_ENTRY_POINT_SCAN_START
> +#define SMBIOS_ENTRY_POINT_SCAN_START 0xF0000
> +#endif
> +
>   struct kobject *dmi_kobj;
>   EXPORT_SYMBOL_GPL(dmi_kobj);
>   
> @@ -663,7 +667,7 @@ static void __init dmi_scan_machine(void)
>   			return;
>   		}
>   	} else if (IS_ENABLED(CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK)) {
> -		p = dmi_early_remap(0xF0000, 0x10000);
> +		p = dmi_early_remap(SMBIOS_ENTRY_POINT_SCAN_START, 0x10000);
>   		if (p == NULL)
>   			goto error;
>   

