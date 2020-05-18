Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61DB1D7BA9
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 16:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgEROp6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 10:45:58 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:48416 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726989AbgEROp6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 10:45:58 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id A64258030875;
        Mon, 18 May 2020 14:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id CMo5xIvaMlt2; Mon, 18 May 2020 17:45:53 +0300 (MSK)
Date:   Mon, 18 May 2020 17:45:52 +0300
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
Message-ID: <20200518144552.bjlddhuospgmer4j@mobilestation>
References: <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-8-Sergey.Semin@baikalelectronics.ru>
 <20200515171004.GA760381@linaro.org>
 <20200516121647.g6jua35kkihmw5r6@mobilestation>
 <4c723219-62f8-be6a-47ea-a586859d832d@linaro.org>
 <20200518144045.v56fajrhbnnrzbpf@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200518144045.v56fajrhbnnrzbpf@mobilestation>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 18, 2020 at 05:40:46PM +0300, Serge Semin wrote:
> Daniel,
> 
> On Mon, May 18, 2020 at 03:59:16PM +0200, Daniel Lezcano wrote:
> > On 16/05/2020 14:16, Serge Semin wrote:
> > > Hello Daniel,
> > > 
> > > Thanks for your comment. My response is below.
> > > 
> > > On Fri, May 15, 2020 at 07:10:04PM +0200, Daniel Lezcano wrote:
> > >> On Thu, May 07, 2020 at 12:41:07AM +0300, Serge Semin wrote:
> > >>> Currently neither clocksource nor scheduler clock kernel framework
> > >>> support the clocks with variable frequency. Needless to say how many
> > >>> problems may cause the sudden base clocks frequency change. In a
> > >>> simplest case the system time will either slow down or speed up.
> > >>> Since on CM2.5 and earlier MIPS GIC timer is synchronously clocked
> > >>> with CPU we must set some limitations on using it for these frameworks
> > >>> if CPU frequency may change. First of all it's not safe to have the
> > >>> MIPS GIC used for scheduler timings. So we shouldn't proceed with
> > >>> the clocks registration in the sched-subsystem. Secondly we must
> > >>> significantly decrease the MIPS GIC clocksource rating. This will let
> > >>> the system to use it only as a last resort.
> > >>>
> > >>> Note CM3.x-based systems may also experience the problems with MIPS GIC
> > >>> if the CPU-frequency change is activated for the whole CPU cluster
> > >>> instead of using the individual CPC core clocks divider.
> > >>
> > >> May be there is no alternative but the code looks a bit hacksih. Isn't possible
> > >> to do something with the sched_mark_unstable?
> > >>
> > >> Or just not use the timer at all ?
> > > 
> > > Not using the timer might be better, but not that good alternative either
> > > especially in our case due to very slow external timer. Me and Thomas
> > > Bogendoerfer discussed the similar commit I've provided to the csrc-r4k driver
> > > available on MIPS:
> > > https://lkml.org/lkml/2020/5/11/576
> > > 
> > > To cut it short, you are right. The solution with using clocksource_mark_unstable()
> > > is better alternative spied up in x86 tsc implementation. I'll use a similar
> > > approach here and submit the updated patch in v3.
> > > 
> > > Could you please proceed with the rest of the series review? I'd like to send
> > > the next version with as many comments taken into account as possible. The
> > > patchset has been submitted a while ago, but except Rob noone have had any
> > > comments.(
> > 
> > For me other patches are ok.
> > 
> > I can apply patches 1, 2, 4, 5, 6
> > 
> > Will remain patches 3 et 7
> 
> That's be great! Thanks. Is patch 3 supposed to be merged in by Rob or by you?
> I don't see one being in the Rob's repo. He might be waiting for you
> acknowledgment or something.

Ah, it's about the MIPS GIC IRQchip bindings conversion. No questions tabout
patch 3then. I'll ask Thomas about that patch status.

-Sergey 

> 
> I'll send the updated patch 3 shortly today.
> 
> -Sergey
> 
> > 
> > 
> > -- 
> > <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs
> > 
> > Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> > <http://twitter.com/#!/linaroorg> Twitter |
> > <http://www.linaro.org/linaro-blog/> Blog
