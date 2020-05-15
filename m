Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF6E1D5090
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 16:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgEOOdF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 10:33:05 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:37638 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgEOOdF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 May 2020 10:33:05 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id DB4C080004AB;
        Fri, 15 May 2020 14:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DGjAxQRrTWZS; Fri, 15 May 2020 17:32:57 +0300 (MSK)
Date:   Fri, 15 May 2020 17:32:54 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Slaby <jslaby@suse.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Long Cheng <long.cheng@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        <linux-mips@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Lukas Wunner <lukas@wunner.de>, Stefan Roese <sr@denx.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Allison Randal <allison@lohutok.net>,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] serial: 8250: Add 8250 port clock update method
Message-ID: <20200515143254.oicqdkvvh6zkuqyl@mobilestation>
References: <20200323024611.16039-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-3-Sergey.Semin@baikalelectronics.ru>
 <20200515124525.GA1888557@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200515124525.GA1888557@kroah.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 15, 2020 at 02:45:25PM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 07, 2020 at 02:31:33AM +0300, Serge Semin wrote:
> > Some platforms can be designed in a way so the UART port reference clock
> > might be asynchronously changed at some point. In Baikal-T1 SoC this may
> > happen due to the reference clock being shared between two UART ports, on
> > the Allwinner SoC the reference clock is derived from the CPU clock, so
> > any CPU frequency change should get to be known/reflected by/in the UART
> > controller as well. But it's not enough to just update the
> > uart_port->uartclk field of the corresponding UART port, the 8250
> > controller reference clock divisor should be altered so to preserve
> > current baud rate setting. All of these things is done in a coherent
> > way by calling the serial8250_update_uartclk() method provided in this
> > patch. Though note that it isn't supposed to be called from within the
> > UART port callbacks because the locks using to the protect the UART port
> > data are already taken in there.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Long Cheng <long.cheng@mediatek.com>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: linux-mips@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-mediatek@lists.infradead.org
> > ---
> >  drivers/tty/serial/8250/8250_port.c | 38 +++++++++++++++++++++++++++++
> >  include/linux/serial_8250.h         |  2 ++
> >  2 files changed, 40 insertions(+)
> > 
> > diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> > index 4d83c85a7389..484ff9df1432 100644
> > --- a/drivers/tty/serial/8250/8250_port.c
> > +++ b/drivers/tty/serial/8250/8250_port.c
> > @@ -2628,6 +2628,44 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
> >  				  (port->uartclk + tolerance) / 16);
> >  }
> >  
> > +/*
> > + * Note in order to avoid the tty port mutex deadlock don't use the next method
> > + * within the uart port callbacks. Primarily it's supposed to be utilized to
> > + * handle a sudden reference clock rate change.
> > + */
> > +void serial8250_update_uartclk(struct uart_port *port, unsigned int uartclk)
> > +{
> > +	struct uart_8250_port *up = up_to_u8250p(port);
> > +	unsigned int baud, quot, frac = 0;
> > +	struct ktermios *termios;
> > +	unsigned long flags;
> > +
> > +	mutex_lock(&port->state->port.mutex);
> > +
> > +	if (port->uartclk == uartclk)
> > +		goto out_lock;
> > +
> > +	port->uartclk = uartclk;
> > +	termios = &port->state->port.tty->termios;
> > +
> > +	baud = serial8250_get_baud_rate(port, termios, NULL);
> > +	quot = serial8250_get_divisor(port, baud, &frac);
> > +
> > +	spin_lock_irqsave(&port->lock, flags);
> > +
> > +	uart_update_timeout(port, termios->c_cflag, baud);
> > +
> > +	serial8250_set_divisor(port, baud, quot, frac);
> > +	serial_port_out(port, UART_LCR, up->lcr);
> > +	serial8250_out_MCR(up, UART_MCR_DTR | UART_MCR_RTS);
> > +
> > +	spin_unlock_irqrestore(&port->lock, flags);
> > +
> > +out_lock:
> > +	mutex_unlock(&port->state->port.mutex);
> > +}
> > +EXPORT_SYMBOL(serial8250_update_uartclk);
> 
> EXPORT_SYMBOL_GPL() please.

Ok. I guess I've just copied the line from some of the export symbol
statements below. My mistake. Sorry.

-Sergey

> 
> thanks,
> 
> greg k-h
