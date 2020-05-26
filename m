Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57EB21E27C7
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 18:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728731AbgEZQ5D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 12:57:03 -0400
Received: from mga12.intel.com ([192.55.52.136]:58729 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726930AbgEZQ5C (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 12:57:02 -0400
IronPort-SDR: oIHRVtthYxI7JBehFK1KuCLOzFT0WArfgLts5cZ+1vAxwaffI70j2ojBuRXsAZbUpiGZYz/GRP
 R6opfkIno4GA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2020 09:57:02 -0700
IronPort-SDR: Er2zNXmgAzjRa4OAXcIq2b/xKyApj7yAEdoa4+gewOIBv7hNZ1+ASgdTNPQGRDP2fUT7g6IaUD
 cmfxEw6lq4OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; 
   d="scan'208";a="301780640"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 26 May 2020 09:56:59 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdcsv-0092P9-QH; Tue, 26 May 2020 19:57:01 +0300
Date:   Tue, 26 May 2020 19:57:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <mripard@kernel.org>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] serial: 8250_dw: Fix common clocks usage race
 condition
Message-ID: <20200526165701.GX1634618@smile.fi.intel.com>
References: <20200526160316.26136-1-Sergey.Semin@baikalelectronics.ru>
 <20200526160316.26136-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526160316.26136-4-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 26, 2020 at 07:03:16PM +0300, Serge Semin wrote:
> The race condition may happen if the UART reference clock is shared with
> some other device (on Baikal-T1 SoC it's another DW UART port). In this
> case if that device changes the clock rate while serial console is using
> it the DW 8250 UART port might not only end up with an invalid uartclk
> value saved, but may also experience a distorted output data since
> baud-clock could have been changed. In order to fix this lets at least
> try to adjust the 8250 port setting like UART clock rate in case if the
> reference clock rate change is discovered. The driver will call the new
> method to update 8250 UART port clock rate settings. It's done by means of
> the clock event notifier registered at the port startup and unregistered
> in the shutdown callback method.
> 
> Note 1. In order to avoid deadlocks we had to execute the UART port update
> method in a dedicated deferred work. This is due to (in my opinion
> redundant) the clock update implemented in the dw8250_set_termios()
> method.
> Note 2. Before the ref clock is manually changed by the custom
> set_termios() function we swap the port uartclk value with new rate
> adjusted to be suitable for the requested baud. It is necessary in
> order to effectively disable a functionality of the ref clock events
> handler for the current UART port, since uartclk update will be done
> a bit further in the generic serial8250_do_set_termios() function.

...

> +static void dw8250_clk_work_cb(struct work_struct *work)
> +{
> +	struct dw8250_data *d = work_to_dw8250_data(work);
> +	struct uart_8250_port *up;
> +	unsigned long rate;
> +
> +	rate = clk_get_rate(d->clk);

> +	if (rate) {

	if (rate <= 0)
		return;

?

> +		up = serial8250_get_port(d->data.line);
> +
> +		serial8250_update_uartclk(&up->port, rate);
> +	}
> +}

...

> +static int dw8250_startup(struct uart_port *p)
> +{
> +	struct dw8250_data *d = to_dw8250_data(p->private_data);
> +	int ret;
> +
> +	/*
> +	 * Some platforms may provide a reference clock shared between several
> +	 * devices. In this case before using the serial port first we have to
> +	 * make sure that any clock state change is known to the UART port at
> +	 * least post factum.
> +	 */

> +	if (d->clk) {

Do you need this?

> +		ret = clk_notifier_register(d->clk, &d->clk_notifier);

Okay, seems clk_notifier_register() and its counterpart should be fixed for
optional clocks.

> +		if (ret)
> +			dev_warn(p->dev, "Failed to set the clock notifier\n");

So, what does this warning mean on the platforms which does not need notifier
at all (i.o.w. all but baikal)?

> +		/*
> +		 * Get current reference clock rate to make sure the UART port
> +		 * is equipped with an up-to-date value before it's started up.
> +		 */

Why? We call ->set_termios() for it, no?

> +		p->uartclk = clk_get_rate(d->clk);
> +		if (!p->uartclk) {
> +			dev_err(p->dev, "Clock rate not defined\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return serial8250_do_startup(p);
> +}
> +
> +static void dw8250_shutdown(struct uart_port *p)
> +{
> +	struct dw8250_data *d = to_dw8250_data(p->private_data);
> +
> +	serial8250_do_shutdown(p);
> +

> +	if (d->clk) {

Ditto.

> +		clk_notifier_unregister(d->clk, &d->clk_notifier);
> +
> +		flush_work(&d->clk_work);
> +	}
> +}

-- 
With Best Regards,
Andy Shevchenko


