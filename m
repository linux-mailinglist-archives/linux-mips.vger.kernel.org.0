Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3224A1FED63
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2020 10:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728546AbgFRISC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Jun 2020 04:18:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728540AbgFRISA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Jun 2020 04:18:00 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF38BC06174E;
        Thu, 18 Jun 2020 01:17:59 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id i12so2200056pju.3;
        Thu, 18 Jun 2020 01:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0/j4lz8e312J9gqDQle5+Czh+8aD3rzQh6Eq9ULGAuI=;
        b=RrkJOwr/g8SsBdGksexkQvk3ctT+Mb6RiwWgiCOlkIGDk12nQIblPpzjXep8RUF9q8
         PyESA919QIjX4IaVj2aFv4rejKo0Y0pBtREGjS8m/S7Vaos7yTd5mRk7TK9CvD2JCenG
         zfA5zNiw6q94EYYiq7Sn5KCulLcCaQyUsZlCyO3W3XoRQPQOHCccie7xzFQt6AWeHvbd
         s2PJ73zTxE3+1w1gv0XC/lJ0NFGAUMwOyGswCKuA17cUL0cAZxRbkiVqCupRI/gWWm5R
         3BGiTbjS/wnWA5aYvWpUd3suBl8xY0jn+1H1WaSOqSRQmcp0+L0KxKF8JN5Ma6WyJOsx
         +hLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0/j4lz8e312J9gqDQle5+Czh+8aD3rzQh6Eq9ULGAuI=;
        b=cjmcoFnCUMEKFUIP7fEWmw+x4j4W9VPnHB7UgnvGZDtkdnQ7MseBON5D58W3HYrXIy
         9gR5ibbBcex21xS9f1vyAw/wFShUKIwMzuf1aI7zKC0AyRzrj3srqn4s+E1lvPy9Y0tC
         H/SfzviAPGeo3C80SHMDkWa6h8z8Ox6W0SH8Iavy2E6coEkf4TkxTQuIEssDQVG8QKef
         c39sHJqUBMcjrp9Zq1OouQIhZgchmSTAC+tVldIYc4mlG27OtrZNHpmKBRfYnPYCFhWu
         06q3LuqI1I9BiGuPoKxFgRKJpVmUWwWZpYblgC6BiRJK66F90p95iCUqc/egui6xTbgg
         yGXg==
X-Gm-Message-State: AOAM531RQQfhuv/bemjXsrWdwlz1D2nT0JYsNBBZBRG3b4kk60P6kFnz
        9YEXnSY/GZbVgNwSARBhoFrHlgnEYrHN4LKkBD4=
X-Google-Smtp-Source: ABdhPJyscf5NEQ/BIUYwjTjCSvoTJNw50TUXXg+adzLOX+5uYCSAsbfWwtwy5S9Aw9ln921/3ZR8DWJVxNYy8OXTtfU=
X-Received: by 2002:a17:90a:220f:: with SMTP id c15mr3206084pje.129.1592468279221;
 Thu, 18 Jun 2020 01:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200617224813.23853-1-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200617224813.23853-1-Sergey.Semin@baikalelectronics.ru>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 Jun 2020 11:17:47 +0300
Message-ID: <CAHp75VfPEdxN1UeKJ+gCWpgJymK7YzQs1Lznq1aBfoRNBiMHbQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v6 0/3] serial: 8250_dw: Fix ref clock usage
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Tony Lindgren <tony@atomide.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

On Thu, Jun 18, 2020 at 1:52 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> Greg, Jiri. We've missed the last merge window. It would be pity to miss
> the next one. Please review/merge in the series.
>
> Regarding the patchset. It might be dangerous if an UART port reference
> clock rate is suddenly changed. In particular the 8250 port drivers
> (and AFAICS most of the tty drivers using common clock framework clocks)
> rely either on the exclusive reference clock utilization or on the ref
> clock rate being always constant. Needless to say that it turns out not
> true and if some other service suddenly changes the clock rate behind an
> UART port driver back no good can happen. So the port might not only end
> up with an invalid uartclk value saved, but may also experience a
> distorted output/input data since such action will effectively update the
> programmed baud-clock. We discovered such problem on Baikal-T1 SoC where
> two DW 8250 ports have got a shared reference clock. Allwinner SoC is
> equipped with an UART, which clock is derived from the CPU PLL clock
> source, so the CPU frequency change might be propagated down up to the
> serial port reference clock. This patchset provides a way to fix the
> problem to the 8250 serial port controllers and mostly fixes it for the
> DW 8250-compatible UART. I say mostly because due to not having a facility
> to pause/stop and resume/restart on-going transfers we implemented the
> UART clock rate update procedure executed post factum of the actual
> reference clock rate change.
>
> In addition the patchset includes a small optimization patch. It
> simplifies the DW APB UART ref clock rate setting procedure a bit.
>
> This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
> base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
> tag: v5.7-rc4

I'm wondering how this will collaborate with runtime PM.

> Changelog v3:
> - Refactor the original patch to adjust the UART port divisor instead of
>   requesting an exclusive ref clock utilization.
>
> Changelog v4:
> - Discard commit b426bf0fb085 ("serial: 8250: Fix max baud limit in generic
>   8250 port") since Greg has already merged it into the tty-next branch.
> - Use EXPORT_SYMBOL_GPL() for the serial8250_update_uartclk() method.
>
> Changelog v5:
> - Refactor dw8250_clk_work_cb() function cheking the clk_get_rate()
>   return value for being erroneous and exit if it is.
> - Don't update p->uartclk in the port startup. It will be updated later in
>   the same procedure at the set_termios() function being invoked by the
>   serial_core anyway.
>
> Changelog v6:
> - Resend
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
> Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
> Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
> Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> Serge Semin (3):
>   serial: 8250: Add 8250 port clock update method
>   serial: 8250_dw: Simplify the ref clock rate setting procedure
>   serial: 8250_dw: Fix common clocks usage race condition
>
>  drivers/tty/serial/8250/8250_dw.c   | 116 +++++++++++++++++++++++++---
>  drivers/tty/serial/8250/8250_port.c |  38 +++++++++
>  include/linux/serial_8250.h         |   2 +
>  3 files changed, 144 insertions(+), 12 deletions(-)
>
> --
> 2.26.2
>


-- 
With Best Regards,
Andy Shevchenko
