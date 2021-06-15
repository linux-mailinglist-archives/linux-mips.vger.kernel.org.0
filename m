Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D051A3A7F13
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jun 2021 15:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhFONVo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Jun 2021 09:21:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:39764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230012AbhFONVm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 15 Jun 2021 09:21:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6E186145D;
        Tue, 15 Jun 2021 13:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623763178;
        bh=QUjTO9qA9P0XSpHtk0ljNgiuHJvfQJgoZdIkwhL9kVk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AABeXVMvFm01gQQ4tEeRo70Ttojrt+hEBRyC0NqQk7OqaJvsZ8+YT7ytnzFr9xwus
         358Hr6OOpRmOT4HQeYP45/NavjEX8UyhzYqE2YLJR3Z8YZ+IccNRJw4jYpakzzOB+D
         EgFRZZlKZk1YAFaOBtxCst6+hLobhIsAo+02IP4g=
Date:   Tue, 15 Jun 2021 15:19:35 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] serial: core, 8250: Add a hook for extra port
 property reporting
Message-ID: <YMio51m/EaS0vIsb@kroah.com>
References: <alpine.DEB.2.21.2105181800170.3032@angie.orcam.me.uk>
 <alpine.DEB.2.21.2105190414160.29169@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2105190414160.29169@angie.orcam.me.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 10, 2021 at 08:38:44PM +0200, Maciej W. Rozycki wrote:
> Add a hook for `uart_report_port' to let serial ports report extra 
> properties beyond `irq' and `base_baud'.  Use it with the 8250 backend 
> to report extra baud rates supported above the base rate for ports with 
> the UPF_MAGIC_MULTIPLIER property, so that people have a way to find out 
> that they are supported with their system, e.g.:
> 
> Serial: 8250/16550 driver, 5 ports, IRQ sharing enabled
> printk: console [ttyS0] disabled
> serial8250.0: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200 [+230400, 460800]) is a 16550A
> printk: console [ttyS0] enabled
> printk: console [ttyS0] enabled
> printk: bootconsole [uart8250] disabled
> printk: bootconsole [uart8250] disabled
> serial8250.0: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200 [+230400, 460800]) is a 16550A
> serial8250.0: ttyS2 at MMIO 0x1f000900 (irq = 20, base_baud = 230400) is a 16550A
> 
> Otherwise there is no clear way to figure this out.
> 
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> ---
>  drivers/tty/serial/8250/8250_core.c |   10 ++++++++++
>  drivers/tty/serial/serial_core.c    |   11 +++++++++--
>  include/linux/serial_core.h         |    3 +++
>  3 files changed, 22 insertions(+), 2 deletions(-)
> 
> linux-serial-core-baud-extra.diff
> Index: linux-malta-cbus-uart/drivers/tty/serial/8250/8250_core.c
> ===================================================================
> --- linux-malta-cbus-uart.orig/drivers/tty/serial/8250/8250_core.c
> +++ linux-malta-cbus-uart/drivers/tty/serial/8250/8250_core.c
> @@ -952,6 +952,13 @@ static struct uart_8250_port *serial8250
>  	return NULL;
>  }
>  
> +static void serial8250_report_magic(struct uart_port *port,
> +				    char *report_buf, size_t report_size)
> +{
> +	snprintf(report_buf, report_size,
> +		 " [+%d, %d]", port->uartclk / 8, port->uartclk / 4);
> +}
> +
>  static void serial_8250_overrun_backoff_work(struct work_struct *work)
>  {
>  	struct uart_8250_port *up =
> @@ -1048,6 +1055,9 @@ int serial8250_register_8250_port(struct
>  			}
>  		}
>  
> +		if (up->port.flags & UPF_MAGIC_MULTIPLIER)
> +			uart->port.report_extra = serial8250_report_magic;
> +
>  		serial8250_set_defaults(uart);
>  
>  		/* Possibly override default I/O functions.  */
> Index: linux-malta-cbus-uart/drivers/tty/serial/serial_core.c
> ===================================================================
> --- linux-malta-cbus-uart.orig/drivers/tty/serial/serial_core.c
> +++ linux-malta-cbus-uart/drivers/tty/serial/serial_core.c
> @@ -2309,6 +2309,7 @@ int uart_resume_port(struct uart_driver
>  static inline void
>  uart_report_port(struct uart_driver *drv, struct uart_port *port)
>  {
> +	char report_extra[64];
>  	char address[64];
>  
>  	switch (port->iotype) {
> @@ -2333,11 +2334,17 @@ uart_report_port(struct uart_driver *drv
>  		break;
>  	}
>  
> -	pr_info("%s%s%s at %s (irq = %d, base_baud = %d) is a %s\n",
> +	if (port->report_extra)
> +		port->report_extra(port, report_extra, sizeof(report_extra));
> +	else
> +		report_extra[0] = '\0';
> +
> +	pr_info("%s%s%s at %s (irq = %d, base_baud = %d%s) is a %s\n",
>  	       port->dev ? dev_name(port->dev) : "",
>  	       port->dev ? ": " : "",
>  	       port->name,
> -	       address, port->irq, port->uartclk / 16, uart_type(port));
> +	       address, port->irq, port->uartclk / 16, report_extra,
> +	       uart_type(port));

Ick, really?  What relies on this print message?  Why do we need a whole
new uart port hook for this?

Isn't there some other way for your specific variant to print out
another message if you really want to do something "odd" like this?

And you did not document what your new change did anywhere in the tree,
so people are going to be confused.

I've taken the other patches here, but not this one.

thanks,

greg k-h
