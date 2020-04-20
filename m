Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87D9D1B08B9
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 14:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgDTMGK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 08:06:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48596 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726387AbgDTMGK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 08:06:10 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxlukqkJ1eiiUqAA--.9S3;
        Mon, 20 Apr 2020 20:06:03 +0800 (CST)
Subject: Re: [PATCH RESEND 1/5] MIPS: Loongson64: Remove dead RTC code
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
References: <20200420073347.157230-1-jiaxun.yang@flygoat.com>
 <20200420073347.157230-2-jiaxun.yang@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   maobibo <maobibo@loongson.cn>
Message-ID: <15923f8b-7278-f510-e06a-99751bd68048@loongson.cn>
Date:   Mon, 20 Apr 2020 20:06:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200420073347.157230-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxlukqkJ1eiiUqAA--.9S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAF1Utr43KFy8Jw4DZry3CFg_yoWrKF4kpw
        s3Aa97Gr4akF1UCr93Cry8urWUA398trWIvF429ryYgasrZ34qqrn7tF18t3yDZFyUJ3Wx
        ZFyrur4YkFsFvaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j8GYLUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 04/20/2020 03:33 PM, Jiaxun Yang wrote:
> RTC is now enabled by devicetree. So platform code is
> no longer needed.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../include/asm/mach-loongson64/mc146818rtc.h | 36 -----------------
>  arch/mips/loongson64/Kconfig                  |  4 --
>  arch/mips/loongson64/Makefile                 |  1 -
>  arch/mips/loongson64/rtc.c                    | 39 -------------------
>  arch/mips/loongson64/time.c                   |  8 +---
>  5 files changed, 1 insertion(+), 87 deletions(-)
>  delete mode 100644 arch/mips/include/asm/mach-loongson64/mc146818rtc.h
>  delete mode 100644 arch/mips/loongson64/rtc.c
> 
> diff --git a/arch/mips/include/asm/mach-loongson64/mc146818rtc.h b/arch/mips/include/asm/mach-loongson64/mc146818rtc.h
> deleted file mode 100644
> index ebdccfee50be..000000000000
> --- a/arch/mips/include/asm/mach-loongson64/mc146818rtc.h
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -/*
> - * This file is subject to the terms and conditions of the GNU General Public
> - * License.  See the file "COPYING" in the main directory of this archive
> - * for more details.
> - *
> - * Copyright (C) 1998, 2001, 03, 07 by Ralf Baechle (ralf@linux-mips.org)
> - *
> - * RTC routines for PC style attached Dallas chip.
> - */
> -#ifndef __ASM_MACH_LOONGSON64_MC146818RTC_H
> -#define __ASM_MACH_LOONGSON64_MC146818RTC_H
> -
> -#include <linux/io.h>
> -
> -#define RTC_PORT(x)	(0x70 + (x))
> -#define RTC_IRQ		8
> -
> -static inline unsigned char CMOS_READ(unsigned long addr)
> -{
> -	outb_p(addr, RTC_PORT(0));
> -	return inb_p(RTC_PORT(1));
> -}
> -
> -static inline void CMOS_WRITE(unsigned char data, unsigned long addr)
> -{
> -	outb_p(addr, RTC_PORT(0));
> -	outb_p(data, RTC_PORT(1));
> -}
> -
> -#define RTC_ALWAYS_BCD	0
> -
> -#ifndef mc146818_decode_year
> -#define mc146818_decode_year(year) ((year) < 70 ? (year) + 2000 : (year) + 1970)
> -#endif
> -
> -#endif /* __ASM_MACH_LOONGSON64_MC146818RTC_H */
> diff --git a/arch/mips/loongson64/Kconfig b/arch/mips/loongson64/Kconfig
> index 48b29c198acf..c386b8a3c753 100644
> --- a/arch/mips/loongson64/Kconfig
> +++ b/arch/mips/loongson64/Kconfig
> @@ -14,8 +14,4 @@ config RS780_HPET
>  	  If unsure, say Yes.
>  
>  
> -config LOONGSON_MC146818
> -	bool
> -	default n
> -
>  endif # MACH_LOONGSON64
> diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
> index f04461839540..102a19aa92aa 100644
> --- a/arch/mips/loongson64/Makefile
> +++ b/arch/mips/loongson64/Makefile
> @@ -8,6 +8,5 @@ obj-$(CONFIG_MACH_LOONGSON64) += cop2-ex.o platform.o acpi_init.o dma.o \
>  obj-$(CONFIG_SMP)	+= smp.o
>  obj-$(CONFIG_NUMA)	+= numa.o
>  obj-$(CONFIG_RS780_HPET) += hpet.o
> -obj-$(CONFIG_LOONGSON_MC146818) += rtc.o
>  obj-$(CONFIG_SUSPEND) += pm.o
>  obj-$(CONFIG_PCI_QUIRKS) += vbios_quirk.o
> diff --git a/arch/mips/loongson64/rtc.c b/arch/mips/loongson64/rtc.c
> deleted file mode 100644
> index 8d7628c0f513..000000000000
> --- a/arch/mips/loongson64/rtc.c
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *  Lemote Fuloong platform support
> - *
> - *  Copyright(c) 2010 Arnaud Patard <apatard@mandriva.com>
> - */
> -
> -#include <linux/init.h>
> -#include <linux/kernel.h>
> -#include <linux/platform_device.h>
> -#include <linux/mc146818rtc.h>
> -
> -static struct resource loongson_rtc_resources[] = {
> -	{
> -		.start	= RTC_PORT(0),
> -		.end	= RTC_PORT(1),
> -		.flags	= IORESOURCE_IO,
> -	}, {
> -		.start	= RTC_IRQ,
> -		.end	= RTC_IRQ,
> -		.flags	= IORESOURCE_IRQ,
> -	}
> -};
> -
> -static struct platform_device loongson_rtc_device = {
> -	.name		= "rtc_cmos",
> -	.id		= -1,
> -	.resource	= loongson_rtc_resources,
> -	.num_resources	= ARRAY_SIZE(loongson_rtc_resources),
> -};
> -
> -
> -static int __init loongson_rtc_platform_init(void)
> -{
> -	platform_device_register(&loongson_rtc_device);
> -	return 0;
> -}
> -
> -device_initcall(loongson_rtc_platform_init);
> diff --git a/arch/mips/loongson64/time.c b/arch/mips/loongson64/time.c
> index 1245f22cec84..91e842b58365 100644
> --- a/arch/mips/loongson64/time.c
> +++ b/arch/mips/loongson64/time.c
> @@ -6,7 +6,7 @@
>   * Copyright (C) 2009 Lemote Inc.
>   * Author: Wu Zhangjin, wuzhangjin@gmail.com
>   */
> -#include <asm/mc146818-time.h>
> +
>  #include <asm/time.h>
>  #include <asm/hpet.h>
>  
> @@ -21,9 +21,3 @@ void __init plat_time_init(void)
>  	setup_hpet_timer();
>  #endif
>  }
> -
> -void read_persistent_clock64(struct timespec64 *ts)
> -{
> -	ts->tv_sec = mc146818_get_cmos_time();
> -	ts->tv_nsec = 0;
> -}
> 
Hi Jiaxun,

Are you sure to remove function read_persistent_clock64 ? which is called in kernel/time/timekeeping.c

regards
bibo,mao

