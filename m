Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 236583E1039
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 10:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238541AbhHEI0z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 04:26:55 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:41152 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234559AbhHEI0z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Aug 2021 04:26:55 -0400
From:   John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1628152000;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sDS1DpN+l+aAEkSP0+4dZetYVLkYHfUOpL7O0zwMLwc=;
        b=MImQslRh8bXrcBZeI2HDBMRTK4c/v9imWShtcDMCrlnPalgFEqSiy2FGo68lC1I7yc2RkE
        Em8eGKX0qzihnzwENOEW+Oh9efhvYi2oZJf6xdQ139MGwJguEVfmXcMJL2TxERNkPayZBy
        OtHmI8wIs5nobQLvfZS7PRnMzQtYNnCetnYyIQ5iFpuA6pWaJyOnHOT0oemivFz8+ZGHdk
        UHNiMhA9S69jhkOCxfC2Yzu79L7UdnADSap+2nvqBlEAyjCKqCIgpBoFQZEEgAoE2qNOOJ
        SpRxIr/lpvUnfbS992agNZC/gE7b35WvIK5Spo2m7hQw/axnaea8Z6xM7cCfag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1628152000;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sDS1DpN+l+aAEkSP0+4dZetYVLkYHfUOpL7O0zwMLwc=;
        b=/S1XK1SD2cNKm5oAne6Zd473q9DfZCgTAnfgMziAxO0ToB6fXXJLqRt7JMYFx4wKuVe2sm
        7SczodRzMkLRhxBA==
To:     Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
In-Reply-To: <931ebc1a-3cc9-677c-44c3-7cbd645eb4f4@kernel.org>
References: <20210803131301.5588-1-john.ogness@linutronix.de> <20210803131301.5588-11-john.ogness@linutronix.de> <YQlNtr7TNAWtB8XF@smile.fi.intel.com> <931ebc1a-3cc9-677c-44c3-7cbd645eb4f4@kernel.org>
Date:   Thu, 05 Aug 2021 10:32:38 +0206
Message-ID: <87k0l0wb41.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2021-08-05, Jiri Slaby <jirislaby@kernel.org> wrote:
> On 03. 08. 21, 16:07, Andy Shevchenko wrote:
>> On Tue, Aug 03, 2021 at 03:19:01PM +0206, John Ogness wrote:
>>> Implement an NMI-safe write_atomic() console function in order to
>>> support synchronous console printing.
>>>
>>> Since interrupts need to be disabled during transmit, all usage of
>>> the IER register is wrapped with access functions that use the
>>> printk cpulock to synchronize register access while tracking the
>>> state of the interrupts. This is necessary because write_atomic()
>>> can be called from an NMI context that has preempted write_atomic().
>> 
>> ...
>> 
>>> +static inline void serial8250_set_IER(struct uart_8250_port *up,
>>> +				      unsigned char ier)
>>> +{
>>> +	struct uart_port *port = &up->port;
>>> +	unsigned long flags;
>>> +	bool is_console;
>> 
>>> +	is_console = uart_console(port);
>>> +
>>> +	if (is_console)
>>> +		console_atomic_cpu_lock(flags);
>>> +
>>> +	serial_out(up, UART_IER, ier);
>>> +
>>> +	if (is_console)
>>> +		console_atomic_cpu_unlock(flags);
>> 
>> I would rewrite it as
>> 
>> 	if (uart_console()) {
>> 		console_atomic_cpu_lock(flags);
>> 		serial_out(up, UART_IER, ier);
>> 		console_atomic_cpu_unlock(flags);
>> 	} else {
>> 		serial_out(up, UART_IER, ier);
>> 	}

Some locations have more than just 1 line of code in between
lock/unlock. I agree this looks better, but am unsure how much
copy/paste code is acceptable.

>> No additional variable, easier to get the algorithm on the first
>> glance, less error prone.
>
> Yes, the original is terrible.
>
> Another option:
>
> bool locked = console_atomic_cpu_lock(flags, uart_console());
> serial_out(up, UART_IER, ier);
> console_atomic_cpu_unlock(flags, locked);
>
> Which makes console_atomic_cpu_lock to lock only if second parameter
> is true and return its value too.

I am not sure how common such semantics for lock/unlock functions
are. But since this pattern, using uart_console(), will most likely be a
common pattern for atomic consoles, I can see how this will be useful.

I will choose one of these 2 suggestions for v2. Thanks.

> BTW I actually don't know what console_atomic_cpu_lock does to think 
> about it more as I was not CCed, and neither lore sees the other patches:
> https://lore.kernel.org/linux-mips/20210803131301.5588-1-john.ogness@linutronix.de/

Only the lkml mailing list saw the full series:

https://lore.kernel.org/lkml/20210803131301.5588-1-john.ogness@linutronix.de/

John Ogness
