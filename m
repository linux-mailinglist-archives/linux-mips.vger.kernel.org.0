Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58141EA6BE
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 17:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgFAPTI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jun 2020 11:19:08 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:51066 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgFAPTH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jun 2020 11:19:07 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id BF2248030834;
        Mon,  1 Jun 2020 15:19:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vQXYeRGinzjd; Mon,  1 Jun 2020 18:19:05 +0300 (MSK)
Date:   Mon, 1 Jun 2020 18:19:03 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paul.burton@imgtec.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        James Hogan <jhogan@kernel.org>, <linux-mips@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] MAINTAINERS: Add maintainers for MIPS core drivers
Message-ID: <20200601151903.ipd5ikw35z53eq2t@mobilestation>
References: <20200601122121.15809-1-Sergey.Semin@baikalelectronics.ru>
 <20200601122121.15809-7-Sergey.Semin@baikalelectronics.ru>
 <CAHp75Vec8DA+dVDGif7UhBtxDPFZG0nnCav=qLJON=j8=9QxSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75Vec8DA+dVDGif7UhBtxDPFZG0nnCav=qLJON=j8=9QxSA@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 01, 2020 at 04:56:21PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 1, 2020 at 3:26 PM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > Add myself as a maintainer of MIPS CPU and GIC IRQchip, MIPS GIC timer
> > and MIPS CPS CPUidle drivers.
> ...
> > +MIPS CORE DRIVERS
> > +M:     Serge Semin <fancer.lancer@gmail.com>
> > +L:     linux-mips@vger.kernel.org
> > +S:     Supported
> > +F:     drivers/bus/mips_cdmm.c
> > +F:     drivers/irqchip/irq-mips-cpu.c
> > +F:     drivers/irqchip/irq-mips-gic.c
> > +F:     drivers/clocksource/mips-gic-timer.c
> > +F:     drivers/cpuidle/cpuidle-cps.c
> 
> I think nowadays checkpatch.pl warns on wrong ordering in this data base.

Alas it doesn't. Good point though.

-Sergey

> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
