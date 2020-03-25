Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA521192D2C
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 16:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbgCYPqT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 11:46:19 -0400
Received: from elvis.franken.de ([193.175.24.41]:34398 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727386AbgCYPqT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 11:46:19 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jH8EN-0003EB-00; Wed, 25 Mar 2020 16:46:11 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 36265C0C3F; Wed, 25 Mar 2020 16:46:00 +0100 (CET)
Date:   Wed, 25 Mar 2020 16:46:00 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Marc Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 06/11] irqchip: mips-cpu: Convert to simple domain
Message-ID: <20200325154600.GA14923@alpha.franken.de>
References: <20200325035537.156911-7-jiaxun.yang@flygoat.com>
 <20200325123742.GA9911@alpha.franken.de>
 <a69f727d37daac6e20ac08de022245b1@kernel.org>
 <C4892878-8463-448D-897B-5F2C56F5A340@flygoat.com>
 <5eb9ce9ea665ee32da40779f00fc9b37@kernel.org>
 <4BB367D3-B8AD-47B6-ACC2-30752137BC1B@flygoat.com>
 <c4520c4b0b0eaaba5fdbaebfce7b4460@kernel.org>
 <39CF835E-D1D9-4B52-ABDC-BDB17B650936@flygoat.com>
 <20200325150437.GA14217@alpha.franken.de>
 <777D8DAA-F462-4E8D-9012-C114DE6D56DE@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <777D8DAA-F462-4E8D-9012-C114DE6D56DE@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 25, 2020 at 11:09:10PM +0800, Jiaxun Yang wrote:
> 
> 
> 于 2020年3月25日 GMT+08:00 下午11:04:37, Thomas Bogendoerfer <tsbogend@alpha.franken.de> 写到:
> >On Wed, Mar 25, 2020 at 10:31:21PM +0800, Jiaxun Yang wrote:
> >> 
> >> 
> >> 于 2020年3月25日 GMT+08:00 下午10:15:16, Marc Zyngier <maz@kernel.org> 写到:
> >> >On 2020-03-25 13:59, Jiaxun Yang wrote:
> >> >
> >> >[...]
> >> >
> >> >>>> So probably we can use legacy domain when  MIPS IRQ BASE is in
> >the
> >> >>>> range of legacy IRQ
> >> >>>> and switch to simple domain when it's not in that range?
> >> >>> 
> >> >>> No, see below.
> >> >>> 
> >> >>>> Here in Loongson systems IRQ 0-15 is occupied by I8259 so I did
> >> >this
> >> >>>> hack.
> >> >>> 
> >> >>> Well, if you have to consider which Linux IRQ gets assigned,
> >> >>> then your platform is definitely not ready for non-legacy
> >> >>> irqdomains. Just stick to legacy for now until you have removed
> >> >>> all the code that knows the hwirq mapping.
> >> >> 
> >> >> Thanks.
> >> >> 
> >> >> So I have to allocate irq_desc here in driver manually?
> >> >
> >> >No, you are probably better off just dropping this patch, as MIPS
> >> >doesn't seem to be ready for a wholesale switch to virtual
> >interrupts.
> >> 
> >> It can't work without this patch.
> >> 
> >> Legacy domain require IRQ number within 0-15 
> >> however it's already occupied by i8259 or "HTPIC" driver.
> >
> >what's the problem here ? AFAIK there could be more than one
> >legacy domain, at least that's what at least IP22/SNI in MIPS world 
> >are doing.
> 
> MIPS_IRQ_BASE must be higher than 15, otherwise it will conflict with i8259.

I still don't get it.

We have following in arch/mips/include/asm/mach-generic/irq.h:

#ifndef MIPS_CPU_IRQ_BASE
#ifdef CONFIG_I8259
#define MIPS_CPU_IRQ_BASE 16
#else
#define MIPS_CPU_IRQ_BASE 0
#endif /* CONFIG_I8259 */
#endif

So every legacy platform with i8259 has MIPS_CPU_IRQ_BASE = 16.

> However we have only preallocated irq_desc for 0-15.
> And legacy domain require irq_desc being preallocated.

maybe I'm too fast by judging the irq code, but without CONFIG_SPARSE_IRQ
the whole irq_desc is pre-allocated.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
