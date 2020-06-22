Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECE8204386
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 00:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730777AbgFVWY4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jun 2020 18:24:56 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:45742 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730756AbgFVWY4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Jun 2020 18:24:56 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 401AB8030833;
        Mon, 22 Jun 2020 22:24:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ruqNffr3OvTc; Tue, 23 Jun 2020 01:24:52 +0300 (MSK)
Date:   Tue, 23 Jun 2020 01:24:50 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <mripard@kernel.org>,
        Will Deacon <will@kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/3] serial: 8250_dw: Simplify the ref clock rate
 setting procedure
Message-ID: <20200622222450.3sijzrmfxc4ivl6s@mobilestation>
References: <20200619200251.9066-1-Sergey.Semin@baikalelectronics.ru>
 <20200619200251.9066-3-Sergey.Semin@baikalelectronics.ru>
 <20200620081201.GQ1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200620081201.GQ1551@shell.armlinux.org.uk>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Russell,

Thanks for your comments. My response is below.

On Sat, Jun 20, 2020 at 09:12:01AM +0100, Russell King - ARM Linux admin wrote:
> On Fri, Jun 19, 2020 at 11:02:50PM +0300, Serge Semin wrote:
> > Really instead of twice checking the clk_round_rate() return value
> > we could do it once, and if it isn't error the clock rate can be changed.
> > By doing so we decrease a number of ret-value tests and remove a weird
> > goto-based construction implemented in the dw8250_set_termios() method.
> 
> This doesn't look right to me - neither the before code nor the after
> code.
> 
> >  	clk_disable_unprepare(d->clk);
> >  	rate = clk_round_rate(d->clk, baud * 16);
> > -	if (rate < 0)
> > -		ret = rate;
> > -	else if (rate == 0)
> > -		ret = -ENOENT;
> > -	else
> > +	if (rate > 0) {
> >  		ret = clk_set_rate(d->clk, rate);
> > +		if (!ret)
> > +			p->uartclk = rate;
> > +	}
> >  	clk_prepare_enable(d->clk);
> >  
> > -	if (ret)
> > -		goto out;
> > -
> > -	p->uartclk = rate;
> 
> 	newrate = baud * 16;
> 
> 	clk_disable_unprepare(d->clk);

> 	rate = clk_round_rate(newrate);
> 	ret = clk_set_rate(d->clk, newrate);
> 	if (!ret)
> 		p->uartclk = rate;
> 
> 	ret = elk_prepare_enable(d->clk);
> 	/* check ret for failure, means the clock is no longer running */
> 
> is all that should be necessary: note that clk_round_rate() is required
> to return the rate that a successful call to clk_set_rate() would result
> in for that clock.

While I do understand your note regarding the newrate passing to both methods, I
don't fully get it why is it ok to skip checking the clk_round_rate() return
value? As I see it there is no point in calling clk_set_rate() if
clk_round_rate() has returned an error. From that perspective this patch
is full acceptable, right?

In addition to that in order to provide an optimization I'll have to check the
return value of the clk_round_rate() anyway in the next patch of this series
("serial: 8250_dw: Fix common clocks usage race condition") since I'll need to
set uartclk with that value before calling clk_set_rate() (see the patch and
notes there for details). So there is no point in removing the check here since
it will be got back in the next patch anyway.

One more note in favor of checking the clk_round_rate() return value is below.

> It is equivalent to:
> 

> 	ret = clk_set_rate(d->clk, newrate);
> 	if (ret == 0)
> 		p->uartclk = clk_get_rate(d->clk);

Alas neither this nor the suggested code above will work if the clock is
optional. If it is, then d->clk will be NULL and clk_round_rate(),
clk_set_rate() and clk_get_rate() will return zero. Thus in accordance with the
fixes suggested by you we'll rewrite a fixed uartclk value supplied by a
firmware.

To sum it up getting a positive value returned from clk_round_rate() will
mean not only an actual clock frequency, but also having a real reference clock
installed. So we can use that value to update the uartclk field of the UART port
descriptor.

> 
> The other commonly misunderstood thing about the clk API is that the
> rate you pass in to clk_round_rate() to discover the actual clock rate
> and the value passed in to clk_set_rate() _should_ be the same value.
> You should _not_ do clk_set_rate(clk, clk_round_rate(clk, newrate));

Agreed. Thanks for the comment. I'll fix it in the next version of the series.

-Sergey

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
