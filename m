Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12EC2019B1
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2020 19:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732780AbgFSRrO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Jun 2020 13:47:14 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:37678 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731681AbgFSRrN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Jun 2020 13:47:13 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 5CD1F8030866;
        Fri, 19 Jun 2020 17:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ok4AU7qgxyVE; Fri, 19 Jun 2020 20:47:09 +0300 (MSK)
Date:   Fri, 19 Jun 2020 20:47:08 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <mripard@kernel.org>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        <linux-mips@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 3/3] serial: 8250_dw: Fix common clocks usage race
 condition
Message-ID: <20200619174708.qcke3w7ltiv7rp7y@mobilestation>
References: <20200617224813.23853-1-Sergey.Semin@baikalelectronics.ru>
 <20200617224813.23853-4-Sergey.Semin@baikalelectronics.ru>
 <CAHp75VcoV+aC9H5TYAxQX2O9HLz==xnts9bcKKQBcdtvohpi6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75VcoV+aC9H5TYAxQX2O9HLz==xnts9bcKKQBcdtvohpi6g@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 18, 2020 at 11:29:36AM +0300, Andy Shevchenko wrote:
> On Thu, Jun 18, 2020 at 1:50 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
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
> So, regarding runtime PM...
> 
> > +static void dw8250_clk_work_cb(struct work_struct *work)
> > +{
> > +       struct dw8250_data *d = work_to_dw8250_data(work);
> > +       struct uart_8250_port *up;
> > +       unsigned long rate;
> > +
> > +       rate = clk_get_rate(d->clk);
> > +       if (rate <= 0)
> > +               return;
> > +
> 
> > +       up = serial8250_get_port(d->data.line);
> 

> (Btw, this can be done directly in the definition block above.)

I would have done like you said if serial8250_get_port() was an inline or
macro. But since it's a normal exported function I'd leave the invocation
here, since calling it takes though small but still some time.

> 
> > +       serial8250_update_uartclk(&up->port, rate);
> 
> This I think should require a device to be powered on. What in your
> opinion is a better place to have it done?

> To me it looks like serial8250_update_uartclk() misses it.

Right. the PM thing should be there similarly to the rest of the serial8250
methods. I'll add the serial8250_rpm_get(up) and serial8250_rpm_put(up)
functions invocation around the divisor update clause, like it's done in the
serial8250_do_set_termios() method.

Thanks for noticing this.

-Sergey

> 
> > +}
> 
> --
> With Best Regards,
> Andy Shevchenko
