Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACD49E58E
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 16:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728427AbfD2Ozr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 10:55:47 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:45647 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728454AbfD2Ozr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Apr 2019 10:55:47 -0400
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MzhSh-1gYdpR49Nx-00vcL0; Mon, 29 Apr 2019 16:55:13 +0200
Subject: Re: [PATCH 36/41] drivers: tty: serial: 8250: store mmio resource
 size in port struct
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        andrew@aj.id.au, macro@linux-mips.org, vz@mleia.com,
        slemieux.tyco@gmail.com, khilman@baylibre.com, liviu.dudau@arm.com,
        sudeep.holla@arm.com, lorenzo.pieralisi@arm.com,
        davem@davemloft.net, jacmet@sunsite.dk, linux@prisktech.co.nz,
        matthias.bgg@gmail.com, linux-mips@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-37-git-send-email-info@metux.net>
 <20190428151848.GO9224@smile.fi.intel.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <4bab941a-c2f2-7f1c-9bc2-86c63f171c25@metux.net>
Date:   Mon, 29 Apr 2019 16:55:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190428151848.GO9224@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:3sNaGIwVieBtMMPDbaHtnQ9WqDYUZdXDzXdtSPxuDKdaXl1IhJx
 gExeQeuUVBW9F8lPEU32YFMe/ujn/jKm3Qo/yQgDM0nzyQYP+uCPSUDJN/wl74WlUhOFl0H
 b9FygV4JGeGXjaq1ueGEJHfa2utbBtfqmEwr5N/Cg0mgACNio7NSt3lhmpR00vRsMaYfrz8
 XlPVJlU6S0ovAYl+qK9DA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4eAEJ0wqyW0=:R8Lq31LWiuM3bZqp1AQZRZ
 jyqOXktZyU/EhjOWGDvRMWW3paokS57Sx0yc4uwnO6dW+U4GGDyD5OGfx43RER6pilTojd0Cc
 1UvhRZhNvHyNSboccxXg4jxVr61SiKbaiipZqc+naHd1ejutU8kiPSah1j2BPJMskurk632/Y
 nukzV2GRHNrvPqdoyfrS6s+qBz9aDlcAx9P6cdOpirdL0w0XVqfr+tiPUixOrykaqEPKMVtKL
 4OGgSljM9ZDmNeIvVFhlvLWLVFKmPMfuyzdRN0JRAjZGHQP8bk3aTcH8A8onXk/l0QJqHKhDX
 ZQ4bypEgU32hQ4fqOqnWyQmKcfVmdEkraWqwANE/QrsjnJU89kjPxH4M9ZfgkJf1GE7bGdCt1
 XhrQ8ybROPrVDOJCthK1AGoo0AmLPY6uR2O1MZa5KaS3QjuUVPykBRE01dQJR2GvK2jlSiPXW
 zZ6hxOJP8CI1RzsHOkTMtdomXf7Gm8m2tF4WFR6XxuWUgOBnt3ZZIIlrPwEeD6KS08lQpQRZD
 3qMm83rz1mRcgd9SJaG5GP6l1TZznT12n5BWoD4OS3VG6a46jzylv2wemvehNTDk4TTOjt62R
 OncMDUxVV4h+DnfwTXj+a6L5MPoAszfUepWtuwGjKsEhwBb+0x+CAUGIFYQFSjobFQD0BxRfx
 r0b01pqkzW9vQJ/lMSLIZWsbJ91UXnzPMnujJVFsM8G2B6NAhnk2yAV+0RvlzpNVO1H9zAvDC
 XLBBWgy4vh7jwZz35FbEeJ2gzJ9/pMyOzs3Y5+E5mRhxkcAYeGmPmyAuSLg=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 28.04.19 17:18, Andy Shevchenko wrote:
> On Sat, Apr 27, 2019 at 02:52:17PM +0200, Enrico Weigelt, metux IT consult wrote:
>> The io resource size is currently recomputed when it's needed but this
>> actually needs to be done once (or drivers could specify fixed values)
> 
> io -> IO

fixed.

>> Simplify that by doing this computation only once and storing the result
>> into the mapsize field. serial8250_register_8250_port() is now called
>> only once on driver init, the previous call sites now just fetch the
>> value from the mapsize field.
> 
> Do I understand correctly that this has no side effects?

I don't know of any. (except someting changes things like regshift after
the initialization phase ... :o)

>> @@ -979,6 +979,9 @@ int serial8250_register_8250_port(struct uart_8250_port *up)
>>  	if (up->port.uartclk == 0)
>>  		return -EINVAL;
>>  
>> +	/* compute the mapsize in case the driver didn't specify one */
>> +	up->mapsize = serial8250_port_size(up);
> 
> I don't know all quirks in 8250 drivers by heart, though can you guarantee that
> at this point the device reports correct IO resource size? (If I'm not mistaken
> some broken hardware needs some magic to be done before card can be properly
> handled)

Actually, I don't see anything talking to the hardware at all here.
It's all derived from values that are set up before
serial8250_register_8250_port() is called.

>> -	unsigned int size = serial8250_port_size(up);
>>  	struct uart_port *port = &up->port;
> 
>> -	int ret = 0;
> 
> This and Co is a separate change that can be done in its own patch.

I don't really understand :(
Do you mean the splitting off the retval part from the rest ?

>> +			port->membase = ioremap_nocache(port->mapbase,
>> +							port->mapsize);
> 
> You may increase readability by introducing temporary variables
> 
> 	... mapbase = port->mapbase;
> 	... mapsize = port->mapsize;
> 	...
> 	port->membase = ioremap_nocache(mapbase, mapsize);
> 	...

Is that really necessary ? Maybe it's just my personal taste, but I
don't feel the more more verbose one is really easier to read.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
