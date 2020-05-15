Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81EF81D4F79
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 15:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgEONsa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 09:48:30 -0400
Received: from mga04.intel.com ([192.55.52.120]:61075 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726206AbgEONsa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 09:48:30 -0400
IronPort-SDR: QvqdDjrPExA6hyq/Vmc5TtRH5vIHRyLrbMLW0aoRkgSxt1mCFAACTAv8+nH3hJG+PxfMYhk7U5
 UtORkJ+smkIQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2020 06:48:30 -0700
IronPort-SDR: AgA+QGUcfWXG7JMCt4bkZKGpeJwCLYEmjhD53o86ruEuiXS4tZjJRrdQS4l/MUiU1m+CasJjuD
 MdhoiHBzHs+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; 
   d="scan'208";a="298444952"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 15 May 2020 06:48:25 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jZahP-006scn-I7; Fri, 15 May 2020 16:48:27 +0300
Date:   Fri, 15 May 2020 16:48:27 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Long Cheng <long.cheng@mediatek.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <mripard@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Stefan Roese <sr@denx.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] serial: 8250: Fix max baud limit in generic 8250
 port
Message-ID: <20200515134827.GB1634618@smile.fi.intel.com>
References: <20200323024611.16039-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506233136.11842-2-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 07, 2020 at 02:31:32AM +0300, Serge Semin wrote:
> Standard 8250 UART ports are designed in a way so they can communicate
> with baud rates up to 1/16 of a reference frequency. It's expected from
> most of the currently supported UART controllers. That's why the former
> version of serial8250_get_baud_rate() method called uart_get_baud_rate()
> with min and max baud rates passed as (port->uartclk / 16 / UART_DIV_MAX)
> and ((port->uartclk + tolerance) / 16) respectively. Doing otherwise, like
> it was suggested in commit ("serial: 8250_mtk: support big baud rate."),
> caused acceptance of bauds, which was higher than the normal UART
> controllers actually supported. As a result if some user-space program
> requested to set a baud greater than (uartclk / 16) it would have been
> permitted without truncation, but then serial8250_get_divisor(baud)
> (which calls uart_get_divisor() to get the reference clock divisor) would
> have returned a zero divisor. Setting zero divisor will cause an
> unpredictable effect varying from chip to chip. In case of DW APB UART the
> communications just stop.
> 
> Lets fix this problem by getting back the limitation of (uartclk +
> tolerance) / 16 maximum baud supported by the generic 8250 port. Mediatek
> 8250 UART ports driver developer shouldn't have touched it in the first
> place  notably seeing he already provided a custom version of set_termios()
> callback in that glue-driver which took into account the extended baud
> rate values and accordingly updated the standard and vendor-specific
> divisor latch registers anyway.

Some of the hardware support PS != 16 (8250_mid), but for now it lies to UART
core for real UART clock because of its (core) hard cored assumption PS == 16
here and there.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Fixes: 81bb549fdf14 ("serial: 8250_mtk: support big baud rate.")
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
>  drivers/tty/serial/8250/8250_port.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> index f77bf820b7a3..4d83c85a7389 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -2615,6 +2615,8 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
>  					     struct ktermios *termios,
>  					     struct ktermios *old)
>  {
> +	unsigned int tolerance = port->uartclk / 100;
> +
>  	/*
>  	 * Ask the core to calculate the divisor for us.
>  	 * Allow 1% tolerance at the upper limit so uart clks marginally
> @@ -2623,7 +2625,7 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
>  	 */
>  	return uart_get_baud_rate(port, termios, old,
>  				  port->uartclk / 16 / UART_DIV_MAX,
> -				  port->uartclk);
> +				  (port->uartclk + tolerance) / 16);
>  }
>  
>  void
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


