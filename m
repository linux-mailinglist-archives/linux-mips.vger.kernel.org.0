Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F13C3DEFC0
	for <lists+linux-mips@lfdr.de>; Tue,  3 Aug 2021 16:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236045AbhHCOIR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Aug 2021 10:08:17 -0400
Received: from mga18.intel.com ([134.134.136.126]:12751 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236469AbhHCOIQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Aug 2021 10:08:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="200888330"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; 
   d="scan'208";a="200888330"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2021 07:08:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; 
   d="scan'208";a="568680226"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2021 07:07:58 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mAv5C-004kW7-El; Tue, 03 Aug 2021 17:07:50 +0300
Date:   Tue, 3 Aug 2021 17:07:50 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     John Ogness <john.ogness@linutronix.de>
Cc:     Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        kuldip dwivedi <kuldip.dwivedi@puresoftware.com>,
        Wang Qing <wangqing@vivo.com>, Andrij Abyzov <aabyzov@slb.com>,
        Johan Hovold <johan@kernel.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Claire Chang <tientzu@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Guenter Roeck <linux@roeck-us.net>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Al Cooper <alcooperx@gmail.com>, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH printk v1 10/10] serial: 8250: implement write_atomic
Message-ID: <YQlNtr7TNAWtB8XF@smile.fi.intel.com>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-11-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803131301.5588-11-john.ogness@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 03, 2021 at 03:19:01PM +0206, John Ogness wrote:
> Implement an NMI-safe write_atomic() console function in order to
> support synchronous console printing.
> 
> Since interrupts need to be disabled during transmit, all usage of
> the IER register is wrapped with access functions that use the
> printk cpulock to synchronize register access while tracking the
> state of the interrupts. This is necessary because write_atomic()
> can be called from an NMI context that has preempted write_atomic().

...

> +static inline void serial8250_set_IER(struct uart_8250_port *up,
> +				      unsigned char ier)
> +{
> +	struct uart_port *port = &up->port;
> +	unsigned long flags;
> +	bool is_console;

> +	is_console = uart_console(port);
> +
> +	if (is_console)
> +		console_atomic_cpu_lock(flags);
> +
> +	serial_out(up, UART_IER, ier);
> +
> +	if (is_console)
> +		console_atomic_cpu_unlock(flags);

I would rewrite it as

	if (uart_console()) {
		console_atomic_cpu_lock(flags);
		serial_out(up, UART_IER, ier);
		console_atomic_cpu_unlock(flags);
	} else {
		serial_out(up, UART_IER, ier);
	}

No additional variable, easier to get the algorithm on the first glance, less
error prone.

> +}

> +static inline unsigned char serial8250_clear_IER(struct uart_8250_port *up)
> +{
> +	struct uart_port *port = &up->port;
> +	unsigned int clearval = 0;
> +	unsigned long flags;
> +	unsigned int prior;
> +	bool is_console;
> +
> +	is_console = uart_console(port);
> +
> +	if (up->capabilities & UART_CAP_UUE)
> +		clearval = UART_IER_UUE;
> +
> +	if (is_console)
> +		console_atomic_cpu_lock(flags);
> +
> +	prior = serial_port_in(port, UART_IER);
> +	serial_port_out(port, UART_IER, clearval);
> +
> +	if (is_console)
> +		console_atomic_cpu_unlock(flags);

Ditto.

> +	return prior;
> +}

...

> +		is_console = uart_console(port);
> +
> +		if (is_console)
> +			console_atomic_cpu_lock(flags);
>  		up->ier = port->serial_in(port, UART_IER);
> +		if (is_console)
> +			console_atomic_cpu_unlock(flags);
> +

I'm wondering why you can't call above function here?

...

> +		is_console = uart_console(p);
> +		if (is_console)
> +			console_atomic_cpu_lock(flags);
>  		ier = p->serial_in(p, UART_IER);
> +		if (is_console)
> +			console_atomic_cpu_unlock(flags);

Ditto.

...

> +	is_console = uart_console(port);
> +
> +	if (is_console)
> +		console_atomic_cpu_lock(flags);
> +
> +	ier = serial_in(up, UART_IER);
> +	serial_out(up, UART_IER, ier & (~mask));
> +
> +	if (is_console)
> +		console_atomic_cpu_unlock(flags);

Ditto.

...

> +	if (uart_console(port))
> +		console_atomic_cpu_lock(flags);
> +
> +	ier = serial_in(up, UART_IER);
> +	serial_out(up, UART_IER, ier | mask);
> +
> +	if (uart_console(port))
> +		console_atomic_cpu_unlock(flags);

Ditto.

Looking into above note, that uart_console(port) can give different results
here, AFAIR.

-- 
With Best Regards,
Andy Shevchenko


