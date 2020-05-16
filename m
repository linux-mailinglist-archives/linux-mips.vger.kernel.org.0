Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7D431D60BB
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2020 14:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgEPMQw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 May 2020 08:16:52 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:39998 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgEPMQv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 16 May 2020 08:16:51 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 536038030809;
        Sat, 16 May 2020 12:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id XQwN5PDN9x4R; Sat, 16 May 2020 15:16:48 +0300 (MSK)
Date:   Sat, 16 May 2020 15:16:47 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 7/7] clocksource: mips-gic-timer: Set limitations on
 clocksource/sched-clocks usage
Message-ID: <20200516121647.g6jua35kkihmw5r6@mobilestation>
References: <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-8-Sergey.Semin@baikalelectronics.ru>
 <20200515171004.GA760381@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200515171004.GA760381@linaro.org>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Daniel,

Thanks for your comment. My response is below.

On Fri, May 15, 2020 at 07:10:04PM +0200, Daniel Lezcano wrote:
> On Thu, May 07, 2020 at 12:41:07AM +0300, Serge Semin wrote:
> > Currently neither clocksource nor scheduler clock kernel framework
> > support the clocks with variable frequency. Needless to say how many
> > problems may cause the sudden base clocks frequency change. In a
> > simplest case the system time will either slow down or speed up.
> > Since on CM2.5 and earlier MIPS GIC timer is synchronously clocked
> > with CPU we must set some limitations on using it for these frameworks
> > if CPU frequency may change. First of all it's not safe to have the
> > MIPS GIC used for scheduler timings. So we shouldn't proceed with
> > the clocks registration in the sched-subsystem. Secondly we must
> > significantly decrease the MIPS GIC clocksource rating. This will let
> > the system to use it only as a last resort.
> >
> > Note CM3.x-based systems may also experience the problems with MIPS GIC
> > if the CPU-frequency change is activated for the whole CPU cluster
> > instead of using the individual CPC core clocks divider.
> 
> May be there is no alternative but the code looks a bit hacksih. Isn't possible
> to do something with the sched_mark_unstable?
> 
> Or just not use the timer at all ?

Not using the timer might be better, but not that good alternative either
especially in our case due to very slow external timer. Me and Thomas
Bogendoerfer discussed the similar commit I've provided to the csrc-r4k driver
available on MIPS:
https://lkml.org/lkml/2020/5/11/576

To cut it short, you are right. The solution with using clocksource_mark_unstable()
is better alternative spied up in x86 tsc implementation. I'll use a similar
approach here and submit the updated patch in v3.

Could you please proceed with the rest of the series review? I'd like to send
the next version with as many comments taken into account as possible. The
patchset has been submitted a while ago, but except Rob noone have had any
comments.(

-Sergey
