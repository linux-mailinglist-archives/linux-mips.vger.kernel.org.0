Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E221B08FF
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 14:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgDTMNZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 08:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726262AbgDTMNY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 08:13:24 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8890CC061A0C;
        Mon, 20 Apr 2020 05:13:24 -0700 (PDT)
Received: from flygoat-x1e (unknown [IPv6:240e:390:495:8610::d68])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 990632049D;
        Mon, 20 Apr 2020 12:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587384802; bh=idKjj1yAQjx86fx6jHB6ioNV9LvwvWMp3rTVXY9oqy0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TnIbe8U575BKmefFkfM/6Qc7/UzFOdkkZ3ZDfoQ0RidrlpQKpicTm2gOr1VebXMNk
         pZc0W+gNtKzeMfm4PIjy0M4vCtmyufzOwoNKHtyqcK1ItiddvPWLOrd8EgZubdw51S
         20BJGqhDCDJletid0zFC2HufCOW111c2xN6XfPaYlNyJzy9mNgrlzbuh46oCfh7MOy
         SJWOPJ9awezXUcwdRlH6PknIac/65qFmQxHLfP41EM9AVZ9Wi+EPCP2ftz1Q1iFwF3
         F9NsIwXzqpvaKk9+ebo2Sz3yX8I8JQqrWBu7rc93cACebrGFjSGuX0vhDWdNkGjMfc
         PM+KLYeo5YFbw==
Date:   Mon, 20 Apr 2020 20:13:12 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maobibo <maobibo@loongson.cn>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/5] MIPS: Loongson64: Remove dead RTC code
Message-ID: <20200420201312.7afe1bb7@flygoat-x1e>
In-Reply-To: <15923f8b-7278-f510-e06a-99751bd68048@loongson.cn>
References: <20200420073347.157230-1-jiaxun.yang@flygoat.com>
        <20200420073347.157230-2-jiaxun.yang@flygoat.com>
        <15923f8b-7278-f510-e06a-99751bd68048@loongson.cn>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 20 Apr 2020 20:06:02 +0800
maobibo <maobibo@loongson.cn> wrote:

> On 04/20/2020 03:33 PM, Jiaxun Yang wrote:
> > RTC is now enabled by devicetree. So platform code is
> > no longer needed.
> > 
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  .../include/asm/mach-loongson64/mc146818rtc.h | 36
> > ----------------- arch/mips/loongson64/Kconfig                  |
> > 4 -- arch/mips/loongson64/Makefile                 |  1 -
> >  arch/mips/loongson64/rtc.c                    | 39
> > ------------------- arch/mips/loongson64/time.c                   |
> >  8 +--- 5 files changed, 1 insertion(+), 87 deletions(-)
> >  delete mode 100644
> > arch/mips/include/asm/mach-loongson64/mc146818rtc.h delete mode
> > 100644 arch/mips/loongson64/rtc.c
> > 
> > diff --git a/arch/mips/include/asm/mach-loongson64/mc146818rtc.h
> > b/arch/mips/include/asm/mach-loongson64/mc146818rtc.h deleted file
> > mode 100644 index ebdccfee50be..000000000000
> > --- a/arch/mips/include/asm/mach-loongson64/mc146818rtc.h
> > +++ /dev/null
> > @@ -1,36 +0,0 @@
> > -/*
> > - * This file is subject to the terms and conditions of the GNU
> > General Public
> > - * License.  See the file "COPYING" in the main directory of this
> > archive
> > - * for more details.
> > - *
> > - * Copyright (C) 1998, 2001, 03, 07 by Ralf Baechle
> > (ralf@linux-mips.org)
> > - *
> > - * RTC routines for PC style attached Dallas chip.
> > - */
> > -#ifndef __ASM_MACH_LOONGSON64_MC146818RTC_H
> > -#define __ASM_MACH_LOONGSON64_MC146818RTC_H
> > -
> > -#include <linux/io.h>
> > -
> > -#define RTC_PORT(x)	(0x70 + (x))
> > -#define RTC_IRQ		8
> > -
> > -static inline unsigned char CMOS_READ(unsigned long addr)
> > -{
> > -	outb_p(addr, RTC_PORT(0));
> > -	return inb_p(RTC_PORT(1));
> > -}
> > -
> > -static inline void CMOS_WRITE(unsigned char data, unsigned long
> > addr) -{
> > -	outb_p(addr, RTC_PORT(0));
> > -	outb_p(data, RTC_PORT(1));
> > -}
> > -
> > -#define RTC_ALWAYS_BCD	0
> > -
> > -#ifndef mc146818_decode_year
> > -#define mc146818_decode_year(year) ((year) < 70 ? (year) + 2000 :
> > (year) + 1970) -#endif
> > -
> > -#endif /* __ASM_MACH_LOONGSON64_MC146818RTC_H */
> > diff --git a/arch/mips/loongson64/Kconfig
> > b/arch/mips/loongson64/Kconfig index 48b29c198acf..c386b8a3c753
> > 100644 --- a/arch/mips/loongson64/Kconfig
> > +++ b/arch/mips/loongson64/Kconfig
> > @@ -14,8 +14,4 @@ config RS780_HPET
> >  	  If unsure, say Yes.
> >  
> >  
> > -config LOONGSON_MC146818
> > -	bool
> > -	default n
> > -
> >  endif # MACH_LOONGSON64
> > diff --git a/arch/mips/loongson64/Makefile
> > b/arch/mips/loongson64/Makefile index f04461839540..102a19aa92aa
> > 100644 --- a/arch/mips/loongson64/Makefile
> > +++ b/arch/mips/loongson64/Makefile
> > @@ -8,6 +8,5 @@ obj-$(CONFIG_MACH_LOONGSON64) += cop2-ex.o
> > platform.o acpi_init.o dma.o \ obj-$(CONFIG_SMP)	+= smp.o
> >  obj-$(CONFIG_NUMA)	+= numa.o
> >  obj-$(CONFIG_RS780_HPET) += hpet.o
> > -obj-$(CONFIG_LOONGSON_MC146818) += rtc.o
> >  obj-$(CONFIG_SUSPEND) += pm.o
> >  obj-$(CONFIG_PCI_QUIRKS) += vbios_quirk.o
> > diff --git a/arch/mips/loongson64/rtc.c b/arch/mips/loongson64/rtc.c
> > deleted file mode 100644
> > index 8d7628c0f513..000000000000
> > --- a/arch/mips/loongson64/rtc.c
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0-or-later
> > -/*
> > - *  Lemote Fuloong platform support
> > - *
> > - *  Copyright(c) 2010 Arnaud Patard <apatard@mandriva.com>
> > - */
> > -
> > -#include <linux/init.h>
> > -#include <linux/kernel.h>
> > -#include <linux/platform_device.h>
> > -#include <linux/mc146818rtc.h>
> > -
> > -static struct resource loongson_rtc_resources[] = {
> > -	{
> > -		.start	= RTC_PORT(0),
> > -		.end	= RTC_PORT(1),
> > -		.flags	= IORESOURCE_IO,
> > -	}, {
> > -		.start	= RTC_IRQ,
> > -		.end	= RTC_IRQ,
> > -		.flags	= IORESOURCE_IRQ,
> > -	}
> > -};
> > -
> > -static struct platform_device loongson_rtc_device = {
> > -	.name		= "rtc_cmos",
> > -	.id		= -1,
> > -	.resource	= loongson_rtc_resources,
> > -	.num_resources	= ARRAY_SIZE(loongson_rtc_resources),
> > -};
> > -
> > -
> > -static int __init loongson_rtc_platform_init(void)
> > -{
> > -	platform_device_register(&loongson_rtc_device);
> > -	return 0;
> > -}
> > -
> > -device_initcall(loongson_rtc_platform_init);
> > diff --git a/arch/mips/loongson64/time.c
> > b/arch/mips/loongson64/time.c index 1245f22cec84..91e842b58365
> > 100644 --- a/arch/mips/loongson64/time.c
> > +++ b/arch/mips/loongson64/time.c
> > @@ -6,7 +6,7 @@
> >   * Copyright (C) 2009 Lemote Inc.
> >   * Author: Wu Zhangjin, wuzhangjin@gmail.com
> >   */
> > -#include <asm/mc146818-time.h>
> > +
> >  #include <asm/time.h>
> >  #include <asm/hpet.h>
> >  
> > @@ -21,9 +21,3 @@ void __init plat_time_init(void)
> >  	setup_hpet_timer();
> >  #endif
> >  }
> > -
> > -void read_persistent_clock64(struct timespec64 *ts)
> > -{
> > -	ts->tv_sec = mc146818_get_cmos_time();
> > -	ts->tv_nsec = 0;
> > -}
> >   
> Hi Jiaxun,
> 
> Are you sure to remove function read_persistent_clock64 ? which is
> called in kernel/time/timekeeping.c

Hi Bibi,

Thanks for your review.

Pretty sure. It is mc146818 specified, it can never work on LS7A/LS2K
which have another RTC implementation.

I have performed boot test with this patch.
Kernel have safety fallback on platforms without this callback. 

> 
> regards
> bibo,mao
> 

Thanks
--
Jiaxun Yang
