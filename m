Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE8E21E293C
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 19:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388654AbgEZRl4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 13:41:56 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:59226 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388499AbgEZRl4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 13:41:56 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 44395803086B;
        Tue, 26 May 2020 17:41:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id hZUm0VjOyTcJ; Tue, 26 May 2020 20:41:50 +0300 (MSK)
Date:   Tue, 26 May 2020 20:41:49 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <mripard@kernel.org>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        <linux-mips@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] serial: 8250_dw: Fix common clocks usage race
 condition
Message-ID: <20200526174149.wpmto6vx775idbaj@mobilestation>
References: <20200526160316.26136-1-Sergey.Semin@baikalelectronics.ru>
 <20200526160316.26136-4-Sergey.Semin@baikalelectronics.ru>
 <20200526165701.GX1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200526165701.GX1634618@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 26, 2020 at 07:57:01PM +0300, Andy Shevchenko wrote:
> On Tue, May 26, 2020 at 07:03:16PM +0300, Serge Semin wrote:
> > The race condition may happen if the UART reference clock is shared with
> > some other device (on Baikal-T1 SoC it's another DW UART port). In this
> > case if that device changes the clock rate while serial console is using
> > it the DW 8250 UART port might not only end up with an invalid uartclk
> > value saved, but may also experience a distorted output data since
> > baud-clock could have been changed. In order to fix this lets at least
> > try to adjust the 8250 port setting like UART clock rate in case if the
> > reference clock rate change is discovered. The driver will call the new
> > method to update 8250 UART port clock rate settings. It's done by means of
> > the clock event notifier registered at the port startup and unregistered
> > in the shutdown callback method.
> > 
> > Note 1. In order to avoid deadlocks we had to execute the UART port update
> > method in a dedicated deferred work. This is due to (in my opinion
> > redundant) the clock update implemented in the dw8250_set_termios()
> > method.
> > Note 2. Before the ref clock is manually changed by the custom
> > set_termios() function we swap the port uartclk value with new rate
> > adjusted to be suitable for the requested baud. It is necessary in
> > order to effectively disable a functionality of the ref clock events
> > handler for the current UART port, since uartclk update will be done
> > a bit further in the generic serial8250_do_set_termios() function.
> 
> ...
> 
> > +static void dw8250_clk_work_cb(struct work_struct *work)
> > +{
> > +	struct dw8250_data *d = work_to_dw8250_data(work);
> > +	struct uart_8250_port *up;
> > +	unsigned long rate;
> > +
> > +	rate = clk_get_rate(d->clk);
> 

> > +	if (rate) {
> 
> 	if (rate <= 0)
> 		return;
> 
> ?

Ok. Though there isn't point in a function consisting of a few lines. 

> 
> > +		up = serial8250_get_port(d->data.line);
> > +
> > +		serial8250_update_uartclk(&up->port, rate);
> > +	}
> > +}
> 
> ...
> 
> > +static int dw8250_startup(struct uart_port *p)
> > +{
> > +	struct dw8250_data *d = to_dw8250_data(p->private_data);
> > +	int ret;
> > +
> > +	/*
> > +	 * Some platforms may provide a reference clock shared between several
> > +	 * devices. In this case before using the serial port first we have to
> > +	 * make sure that any clock state change is known to the UART port at
> > +	 * least post factum.
> > +	 */
> 

> > +	if (d->clk) {
> 
> Do you need this?

Yes, I do. The same way as clk_get_rate() needs this.

> 
> > +		ret = clk_notifier_register(d->clk, &d->clk_notifier);
> 
> Okay, seems clk_notifier_register() and its counterpart should be fixed for
> optional clocks.

In order to use the clk_get_rate() function we need to make sure the clk isn't
optional otherwise -EINVAL will be returned, which is indistinguishable from
any another error. The same situation is for the clk_notifier_register() and
clk_notifier_unregister() counterpart.

> 
> > +		if (ret)
> > +			dev_warn(p->dev, "Failed to set the clock notifier\n");
> 
> So, what does this warning mean on the platforms which does not need notifier
> at all

It means "The clk-notifier subsystem is broken. Though if reference clock rate
doesn't change, it won't a problem." Due to the last statement we print a
warning, but not an error message.

> (i.o.w. all but baikal)?

No. As we discussed earlier in the previous pacthset versions there are another
platforms with shared reference clocks behind the DW APB UART, like: Allwinner SoCs,
RPi 3/4, etc.

> 
> > +		/*
> > +		 * Get current reference clock rate to make sure the UART port
> > +		 * is equipped with an up-to-date value before it's started up.
> > +		 */
> 
> Why? We call ->set_termios() for it, no?

This makes sense. Thanks. I'll remove this part.

-Sergey

> 
> > +		p->uartclk = clk_get_rate(d->clk);
> > +		if (!p->uartclk) {
> > +			dev_err(p->dev, "Clock rate not defined\n");
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	return serial8250_do_startup(p);
> > +}
> > +
> > +static void dw8250_shutdown(struct uart_port *p)
> > +{
> > +	struct dw8250_data *d = to_dw8250_data(p->private_data);
> > +
> > +	serial8250_do_shutdown(p);
> > +
> 
> > +	if (d->clk) {
> 
> Ditto.
> 
> > +		clk_notifier_unregister(d->clk, &d->clk_notifier);
> > +
> > +		flush_work(&d->clk_work);
> > +	}
> > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
