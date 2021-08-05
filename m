Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65CE43E0F7E
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 09:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238768AbhHEHrg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 03:47:36 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:43544 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238826AbhHEHr3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Aug 2021 03:47:29 -0400
Received: by mail-wm1-f43.google.com with SMTP id l8-20020a05600c1d08b02902b5acf7d8b5so2296589wms.2;
        Thu, 05 Aug 2021 00:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I526ijbe8/74kjOA75IwkOyaPcqEXfx0YMdi/ub5h0M=;
        b=CNUVuwoD+bs9BID+JkSaLIZ2GUCNFulvqOo+Hu9aoGFY3i2YrDFagG5Bftny8vQ+I0
         TZyQfhn/+RnJt+5wbKum24h8ePCDokT8c8zQ6aXD1T3GnHGGK8vocsLWhvqp6PHC8L6Z
         72Ws3qvrBkFp9B2PYh0e4AtBRUXDyTJPAWQUXNPX/PiffiiKewZXgOOuX6rVPsCaERQU
         GpB+i6a+nz+dZOQTJ+dAQ6D1Majpkzqfw1+biIj7llVZk5hBuakG8MVfRQff6Vw5jg4F
         ZttSaDJLBeoYYUVvR0FdcJs8n5C6swpOBBxRyrlQII6zMJWoDx4ikRRyoAaA2xuK0r1q
         b83g==
X-Gm-Message-State: AOAM531WbBYnjSR7/aw9jd7zADyRepkD//levFYY+JEvWPXy0adItB2i
        jnhWmYJh01eRWNsxD396FI8=
X-Google-Smtp-Source: ABdhPJwvOwnv09InkfauY/5dCjERsBYo1U1VQMOeA1IMI5PuQsUW4j8b79rm41Lbc7bMwllLsM9EwQ==
X-Received: by 2002:a05:600c:290:: with SMTP id 16mr13385731wmk.71.1628149634054;
        Thu, 05 Aug 2021 00:47:14 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
        by smtp.gmail.com with ESMTPSA id t1sm4985968wrm.42.2021.08.05.00.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 00:47:13 -0700 (PDT)
Subject: Re: [PATCH printk v1 10/10] serial: 8250: implement write_atomic
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        John Ogness <john.ogness@linutronix.de>
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
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-11-john.ogness@linutronix.de>
 <YQlNtr7TNAWtB8XF@smile.fi.intel.com>
From:   Jiri Slaby <jirislaby@kernel.org>
Message-ID: <931ebc1a-3cc9-677c-44c3-7cbd645eb4f4@kernel.org>
Date:   Thu, 5 Aug 2021 09:47:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQlNtr7TNAWtB8XF@smile.fi.intel.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03. 08. 21, 16:07, Andy Shevchenko wrote:
> On Tue, Aug 03, 2021 at 03:19:01PM +0206, John Ogness wrote:
>> Implement an NMI-safe write_atomic() console function in order to
>> support synchronous console printing.
>>
>> Since interrupts need to be disabled during transmit, all usage of
>> the IER register is wrapped with access functions that use the
>> printk cpulock to synchronize register access while tracking the
>> state of the interrupts. This is necessary because write_atomic()
>> can be called from an NMI context that has preempted write_atomic().
> 
> ...
> 
>> +static inline void serial8250_set_IER(struct uart_8250_port *up,
>> +				      unsigned char ier)
>> +{
>> +	struct uart_port *port = &up->port;
>> +	unsigned long flags;
>> +	bool is_console;
> 
>> +	is_console = uart_console(port);
>> +
>> +	if (is_console)
>> +		console_atomic_cpu_lock(flags);
>> +
>> +	serial_out(up, UART_IER, ier);
>> +
>> +	if (is_console)
>> +		console_atomic_cpu_unlock(flags);
> 
> I would rewrite it as
> 
> 	if (uart_console()) {
> 		console_atomic_cpu_lock(flags);
> 		serial_out(up, UART_IER, ier);
> 		console_atomic_cpu_unlock(flags);
> 	} else {
> 		serial_out(up, UART_IER, ier);
> 	}
> 
> No additional variable, easier to get the algorithm on the first glance, less
> error prone.

Yes, the original is terrible.

Another option:

bool locked = console_atomic_cpu_lock(flags, uart_console());
serial_out(up, UART_IER, ier);
console_atomic_cpu_unlock(flags, locked);


Which makes console_atomic_cpu_lock to lock only if second parameter is 
true and return its value too.

BTW I actually don't know what console_atomic_cpu_lock does to think 
about it more as I was not CCed, and neither lore sees the other patches:
https://lore.kernel.org/linux-mips/20210803131301.5588-1-john.ogness@linutronix.de/

thanks,
-- 
js
suse labs
