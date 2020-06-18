Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5191FED9E
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2020 10:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728525AbgFRI3u (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Jun 2020 04:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728507AbgFRI3t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Jun 2020 04:29:49 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3779C06174E;
        Thu, 18 Jun 2020 01:29:48 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id s10so2613540pgm.0;
        Thu, 18 Jun 2020 01:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PNkYlKMTKD0nY2ft6SL6vkNJkTU4JHHeRX00KlE38Uo=;
        b=HC7oJmceAMFXDvqAs302XPmSJcwa3sGH3SYfkaWHVROr67UEl1LHSP+1zz5ohCpKEU
         DXSohxPyxYCx1febPMLyT7ZdedQLwMtJRuFXKQdn0W5kE8uyfz5E1yD5nP2qxRqqydYq
         bN2HzPqScZO16D6AwcuY28AHCXqxkDTruXRiJk1BOOCk7QqyKJlwqdqrlAmxda6bf84D
         tRQ890EH6o+jtBCH+mgM7S2AwHfxhKy53lsKi/HMYSyr3UXz68maQUKZJcLSUoj2MPpB
         HqBn+VeT5OuFU6rVR0CNyJLaw0MLq8XJr2vDw/NkD48BENqI5SpzF5lwsjOnDXzYatfE
         4qSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PNkYlKMTKD0nY2ft6SL6vkNJkTU4JHHeRX00KlE38Uo=;
        b=QxTfeMpn8Uu3LMWuBIpHEilF4IewNQx0eGqRHMWgN+zzhoBT7Qx3mW88oqle3faA4P
         NnuJscIXrlPyur0oC1nXKsEf3AlTW9uGI1HwpLlaJun2lvBOovVa14G2mCNST7NC55fk
         ZKCIGvotixY4laakC1uzUl5ych4BNB7g0QljPWasdwkZZRoFZmOEx7QTkDqOp3/W2kwz
         1eiOeRXtIktpSLrIdQKY1oaNiXwL/jrXsGiGF0R/+oCUzHrx+dYpuZxE6ui4kVeNjSGK
         i03nl6wm+Kc1wCH1Kzt51ak7mCirY8a3M8cYkeIFGNc0YtcmR9oCxpRzHccOp2A4cYgY
         c8cw==
X-Gm-Message-State: AOAM532EelPBBW6S0DHCWWv7PZJjty6SGOOBKL1EgeDINCSXb+GG2iSO
        baI2J9txCAY5Bgq8cHUPEcF7qY72HtQUBxx2coU=
X-Google-Smtp-Source: ABdhPJxo1rTNkcU25bfjIo8wr+8okh95vw5wNnt/QQ56aTnDHxWEAgUSUGoJhH7bRhnRRZLlmczzNLCm8ubnvibA9MQ=
X-Received: by 2002:a62:3103:: with SMTP id x3mr2561582pfx.130.1592468988208;
 Thu, 18 Jun 2020 01:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200617224813.23853-1-Sergey.Semin@baikalelectronics.ru> <20200617224813.23853-4-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200617224813.23853-4-Sergey.Semin@baikalelectronics.ru>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 Jun 2020 11:29:36 +0300
Message-ID: <CAHp75VcoV+aC9H5TYAxQX2O9HLz==xnts9bcKKQBcdtvohpi6g@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] serial: 8250_dw: Fix common clocks usage race condition
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Tony Lindgren <tony@atomide.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <mripard@kernel.org>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-mips@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 18, 2020 at 1:50 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
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

So, regarding runtime PM...

> +static void dw8250_clk_work_cb(struct work_struct *work)
> +{
> +       struct dw8250_data *d = work_to_dw8250_data(work);
> +       struct uart_8250_port *up;
> +       unsigned long rate;
> +
> +       rate = clk_get_rate(d->clk);
> +       if (rate <= 0)
> +               return;
> +

> +       up = serial8250_get_port(d->data.line);

(Btw, this can be done directly in the definition block above.)

> +       serial8250_update_uartclk(&up->port, rate);

This I think should require a device to be powered on. What in your
opinion is a better place to have it done?
To me it looks like serial8250_update_uartclk() misses it.

> +}

--
With Best Regards,
Andy Shevchenko
