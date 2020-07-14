Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6961E21EA08
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 09:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725803AbgGNH1x (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 03:27:53 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45234 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725306AbgGNH1w (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 14 Jul 2020 03:27:52 -0400
Received: from [10.130.0.75] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_x10Xg1fAUoEAA--.3940S3;
        Tue, 14 Jul 2020 15:27:49 +0800 (CST)
Subject: Re: [PATCH 4/4] MIPS: Loongson64: Reserve legacy MMIO space according
 to bridge type
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1594294424-26218-1-git-send-email-chenhc@lemote.com>
 <1594294424-26218-4-git-send-email-chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <49e77802-d544-1d52-e9b6-85db2c938531@loongson.cn>
Date:   Tue, 14 Jul 2020 15:27:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1594294424-26218-4-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx_x10Xg1fAUoEAA--.3940S3
X-Coremail-Antispam: 1UD129KBjvJXoWxArykXFWUJF43tF13Gr4rXwb_yoW5Zw4rpF
        Z8A3WkCF4kWrW7Kr9Iyr1UCrWrAanagFZa9FWYqr4UZan5Wa42vr1ktF18Xr1UJFWkJ3Wx
        Wrykuw1rZanFkaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JV
        WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
        8wCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
        IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
        6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
        IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv
        67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
        uYvjxU4UGYDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 07/09/2020 07:33 PM, Huacai Chen wrote:
> Define MMIO_LOWER_RESERVED as a constant is incorrect, because different
> PCHs (bridge types) have different legacy MMIO space size. According to
> the datasheets, the legacy MMIO space size of LS7A is 0x20000, and which
> of other PCHs is 0x4000. So it is necessary to reserve legacy MMIO space
> according to the bridge type.
>
> Currently IO_SPACE_LIMIT is defined as 0xffff which is too small for the
> LS7A bridge, so increase it to 0xfffff for LOONGSON64.
>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>

> ---
>   arch/mips/include/asm/io.h                     |  4 ++++
>   arch/mips/include/asm/mach-loongson64/spaces.h |  3 ---
>   arch/mips/loongson64/init.c                    | 18 ++++++++++++++----
>   3 files changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
> index 346fffd..7358372 100644
> --- a/arch/mips/include/asm/io.h
> +++ b/arch/mips/include/asm/io.h
> @@ -51,7 +51,11 @@
>   
>   /* ioswab[bwlq], __mem_ioswab[bwlq] are defined in mangle-port.h */
>   
> +#ifndef CONFIG_CPU_LOONGSON64
>   #define IO_SPACE_LIMIT 0xffff
> +#else
> +#define IO_SPACE_LIMIT 0xfffff
> +#endif
>   
>   /*
>    * On MIPS I/O ports are memory mapped, so we access them using normal
> diff --git a/arch/mips/include/asm/mach-loongson64/spaces.h b/arch/mips/include/asm/mach-loongson64/spaces.h
> index 3de0ac9..93bdd9e 100644
> --- a/arch/mips/include/asm/mach-loongson64/spaces.h
> +++ b/arch/mips/include/asm/mach-loongson64/spaces.h
> @@ -11,8 +11,5 @@
>   #define PCI_IOSIZE	SZ_16M
>   #define MAP_BASE	(PCI_IOBASE + PCI_IOSIZE)
>   
> -/* Reserved at the start of PCI_IOBASE for legacy drivers */
> -#define MMIO_LOWER_RESERVED	0x10000
> -
>   #include <asm/mach-generic/spaces.h>
>   #endif
> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> index 59ddada..606cdc4 100644
> --- a/arch/mips/loongson64/init.c
> +++ b/arch/mips/loongson64/init.c
> @@ -65,14 +65,25 @@ void __init prom_free_prom_memory(void)
>   
>   static __init void reserve_pio_range(void)
>   {
> +	/* Reserved at the start of PCI_IOBASE for legacy drivers */
> +	int mmio_lower_reserved;
>   	struct logic_pio_hwaddr *range;
>   
>   	range = kzalloc(sizeof(*range), GFP_ATOMIC);
>   	if (!range)
>   		return;
>   
> +	switch (loongson_sysconf.bridgetype) {
> +	case LS7A:
> +		mmio_lower_reserved = 0x20000;
> +		break;
> +	default:
> +		mmio_lower_reserved = 0x4000;
> +		break;
> +	}
> +
>   	range->fwnode = &of_root->fwnode;
> -	range->size = MMIO_LOWER_RESERVED;
> +	range->size = mmio_lower_reserved;
>   	range->hw_start = LOONGSON_PCIIO_BASE;
>   	range->flags = LOGIC_PIO_CPU_MMIO;
>   
> @@ -89,9 +100,8 @@ static __init void reserve_pio_range(void)
>   	 * i8259 would access I/O space, so mapping must be done here.
>   	 * Please remove it when all drivers can be managed by logic_pio.
>   	 */
> -	ioremap_page_range(PCI_IOBASE, PCI_IOBASE + MMIO_LOWER_RESERVED,
> -				LOONGSON_PCIIO_BASE,
> -				pgprot_device(PAGE_KERNEL));
> +	ioremap_page_range(PCI_IOBASE, PCI_IOBASE + mmio_lower_reserved,
> +			LOONGSON_PCIIO_BASE, pgprot_device(PAGE_KERNEL));
>   
>   	return;
>   unregister:

