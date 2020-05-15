Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 150EF1D4DFA
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 14:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgEOMp2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 08:45:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:60272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726170AbgEOMp2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 08:45:28 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B349B2074D;
        Fri, 15 May 2020 12:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589546727;
        bh=VxEiO3x4a+oQcWdaaVMQiUJypOo8K7HbBM/nH0w786Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pARATMOWXVPralSCYApjOqgrXBmbXaWUOAVyiklm3wvsFI7cpwChGJ/1ecUuX9fPT
         QVbUFq3kmm+rDg7Ri60N8Dc7rwACXOW292F/3eazEmhAVd9DueYm5iII28jJZ4NtSg
         qJs8bopvK/RAKRqzzLhtcLBXshrJbhvVyAvefRAE=
Date:   Fri, 15 May 2020 14:45:25 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Slaby <jslaby@suse.com>,
        Serge Semin <fancer.lancer@gmail.com>,
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
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, Lukas Wunner <lukas@wunner.de>,
        Stefan Roese <sr@denx.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Allison Randal <allison@lohutok.net>,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] serial: 8250: Add 8250 port clock update method
Message-ID: <20200515124525.GA1888557@kroah.com>
References: <20200323024611.16039-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506233136.11842-3-Sergey.Semin@baikalelectronics.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 07, 2020 at 02:31:33AM +0300, Serge Semin wrote:
> Some platforms can be designed in a way so the UART port reference clock
> might be asynchronously changed at some point. In Baikal-T1 SoC this may
> happen due to the reference clock being shared between two UART ports, on
> the Allwinner SoC the reference clock is derived from the CPU clock, so
> any CPU frequency change should get to be known/reflected by/in the UART
> controller as well. But it's not enough to just update the
> uart_port->uartclk field of the corresponding UART port, the 8250
> controller reference clock divisor should be altered so to preserve
> current baud rate setting. All of these things is done in a coherent
> way by calling the serial8250_update_uartclk() method provided in this
> patch. Though note that it isn't supposed to be called from within the
> UART port callbacks because the locks using to the protect the UART port
> data are already taken in there.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Long Cheng <long.cheng@mediatek.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---
>  drivers/tty/serial/8250/8250_port.c | 38 +++++++++++++++++++++++++++++
>  include/linux/serial_8250.h         |  2 ++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> index 4d83c85a7389..484ff9df1432 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -2628,6 +2628,44 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
>  				  (port->uartclk + tolerance) / 16);
>  }
>  
> +/*
> + * Note in order to avoid the tty port mutex deadlock don't use the next method
> + * within the uart port callbacks. Primarily it's supposed to be utilized to
> + * handle a sudden reference clock rate change.
> + */
> +void serial8250_update_uartclk(struct uart_port *port, unsigned int uartclk)
> +{
> +	struct uart_8250_port *up = up_to_u8250p(port);
> +	unsigned int baud, quot, frac = 0;
> +	struct ktermios *termios;
> +	unsigned long flags;
> +
> +	mutex_lock(&port->state->port.mutex);
> +
> +	if (port->uartclk == uartclk)
> +		goto out_lock;
> +
> +	port->uartclk = uartclk;
> +	termios = &port->state->port.tty->termios;
> +
> +	baud = serial8250_get_baud_rate(port, termios, NULL);
> +	quot = serial8250_get_divisor(port, baud, &frac);
> +
> +	spin_lock_irqsave(&port->lock, flags);
> +
> +	uart_update_timeout(port, termios->c_cflag, baud);
> +
> +	serial8250_set_divisor(port, baud, quot, frac);
> +	serial_port_out(port, UART_LCR, up->lcr);
> +	serial8250_out_MCR(up, UART_MCR_DTR | UART_MCR_RTS);
> +
> +	spin_unlock_irqrestore(&port->lock, flags);
> +
> +out_lock:
> +	mutex_unlock(&port->state->port.mutex);
> +}
> +EXPORT_SYMBOL(serial8250_update_uartclk);

EXPORT_SYMBOL_GPL() please.

thanks,

greg k-h
