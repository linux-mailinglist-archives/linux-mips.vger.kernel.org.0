Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A641EA841
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 19:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbgFARNV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jun 2020 13:13:21 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:51644 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgFARNT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jun 2020 13:13:19 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id BAE0B8030808;
        Mon,  1 Jun 2020 17:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LAyjhD2Voz9V; Mon,  1 Jun 2020 20:13:13 +0300 (MSK)
Date:   Mon, 1 Jun 2020 20:13:11 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paul.burton@imgtec.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Cooper <jason@lakedaemon.net>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        James Hogan <jhogan@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND v2 0/6] mips: Add DT bindings for MIPS CDMM and
 MIPS GIC
Message-ID: <20200601171311.bra7canlvnvswyxq@mobilestation>
References: <20200601122121.15809-1-Sergey.Semin@baikalelectronics.ru>
 <d59ef33155e2ae965e79522ab220c177@kernel.org>
 <20200601152449.2okwqaqw4262nedu@mobilestation>
 <20200601165646.GA12402@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200601165646.GA12402@alpha.franken.de>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 01, 2020 at 06:56:46PM +0200, Thomas Bogendoerfer wrote:
> On Mon, Jun 01, 2020 at 06:24:49PM +0300, Serge Semin wrote:
> > Hello Marc,
> > 
> > On Mon, Jun 01, 2020 at 01:31:27PM +0100, Marc Zyngier wrote:
> > > On 2020-06-01 13:21, Serge Semin wrote:
> > > 
> > > [...]
> > > 
> > > > Since Paul isn't looking after the MIPS arch code anymore, Ralf hasn't
> > > > been seen maintaining MIPS for a long time, Thomas is only responsible
> > > > for the next part of it:
> > > > 	F:      Documentation/devicetree/bindings/mips/
> > > > 	F:      Documentation/mips/
> > > > 	F:      arch/mips/
> > > > 	F:      drivers/platform/mips/
> > > > the MIPS-specific drivers like:
> > > > 	F:	drivers/bus/mips_cdmm.c
> > > > 	F:	drivers/irqchip/irq-mips-cpu.c
> > > > 	F:	drivers/irqchip/irq-mips-gic.c
> > > > 	F:	drivers/clocksource/mips-gic-timer.c
> > > > 	F:	drivers/cpuidle/cpuidle-cps.c
> > > > seem to be left for the subsystems maintainers to support. So if you
> > > > don't
> > > > mind or unless there is a better alternative, I can help with looking
> > > > after them to ease the maintainers review burden and since I'll be
> > > > working
> > > > on our MIPS-based SoC drivers integrating into the mainline kernel repo
> > > > anyway. If you don't like this idea, please just decline the last
> > > > patch in the series.
> > > 
> > 
> > > Given how deeply integrated the MIPS GIC is in the architecture, I'd
> > > really like Thomas to co-maintain it, or at the very least give his
> > > blessing on you being the dedicated point of contact for MIPS GIC
> > > stuff.
> > 
> > I don't mind either way. First option might be even better. Thomas,
> > what do you think?
> 
> sure, I'm happy to be your co-maintainer.
> 

Great! As soon as we finish a discussion regarding the files-list ordering
raised around the last patch in the series, I'll resend the patchset with you
added to the list of the MIPS core drivers maintainers.

-Sergey

> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
