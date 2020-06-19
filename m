Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B78D20192F
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2020 19:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731307AbgFSRQZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Jun 2020 13:16:25 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:37460 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730935AbgFSRQY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Jun 2020 13:16:24 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id AFE7480045E4;
        Fri, 19 Jun 2020 17:16:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id hbtS4gjqbfqD; Fri, 19 Jun 2020 20:16:18 +0300 (MSK)
Date:   Fri, 19 Jun 2020 20:16:17 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
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
        <linux-mips@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND v6 0/3] serial: 8250_dw: Fix ref clock usage
Message-ID: <20200619171617.vnzmfds5zvw2ajr7@mobilestation>
References: <20200617224813.23853-1-Sergey.Semin@baikalelectronics.ru>
 <CAHp75VfPEdxN1UeKJ+gCWpgJymK7YzQs1Lznq1aBfoRNBiMHbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75VfPEdxN1UeKJ+gCWpgJymK7YzQs1Lznq1aBfoRNBiMHbQ@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 18, 2020 at 11:17:47AM +0300, Andy Shevchenko wrote:
> On Thu, Jun 18, 2020 at 1:52 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > Greg, Jiri. We've missed the last merge window. It would be pity to miss
> > the next one. Please review/merge in the series.
> >
> > Regarding the patchset. It might be dangerous if an UART port reference
> > clock rate is suddenly changed. In particular the 8250 port drivers
> > (and AFAICS most of the tty drivers using common clock framework clocks)
> > rely either on the exclusive reference clock utilization or on the ref
> > clock rate being always constant. Needless to say that it turns out not
> > true and if some other service suddenly changes the clock rate behind an
> > UART port driver back no good can happen. So the port might not only end
> > up with an invalid uartclk value saved, but may also experience a
> > distorted output/input data since such action will effectively update the
> > programmed baud-clock. We discovered such problem on Baikal-T1 SoC where
> > two DW 8250 ports have got a shared reference clock. Allwinner SoC is
> > equipped with an UART, which clock is derived from the CPU PLL clock
> > source, so the CPU frequency change might be propagated down up to the
> > serial port reference clock. This patchset provides a way to fix the
> > problem to the 8250 serial port controllers and mostly fixes it for the
> > DW 8250-compatible UART. I say mostly because due to not having a facility
> > to pause/stop and resume/restart on-going transfers we implemented the
> > UART clock rate update procedure executed post factum of the actual
> > reference clock rate change.
> >
> > In addition the patchset includes a small optimization patch. It
> > simplifies the DW APB UART ref clock rate setting procedure a bit.
> >
> > This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
> > base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
> > tag: v5.7-rc4
> 

> I'm wondering how this will collaborate with runtime PM.

Thanks for noticing this. You are right. PM should be taken into account.

-Sergey

> 
> > Changelog v3:
> > - Refactor the original patch to adjust the UART port divisor instead of
> >   requesting an exclusive ref clock utilization.
> >
> > Changelog v4:
> > - Discard commit b426bf0fb085 ("serial: 8250: Fix max baud limit in generic
> >   8250 port") since Greg has already merged it into the tty-next branch.
> > - Use EXPORT_SYMBOL_GPL() for the serial8250_update_uartclk() method.
> >
> > Changelog v5:
> > - Refactor dw8250_clk_work_cb() function cheking the clk_get_rate()
> >   return value for being erroneous and exit if it is.
> > - Don't update p->uartclk in the port startup. It will be updated later in
> >   the same procedure at the set_termios() function being invoked by the
> >   serial_core anyway.
> >
> > Changelog v6:
> > - Resend
> >
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
> > Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> > Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
> > Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> > Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
> > Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
> > Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: linux-mips@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-serial@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> >
> > Serge Semin (3):
> >   serial: 8250: Add 8250 port clock update method
> >   serial: 8250_dw: Simplify the ref clock rate setting procedure
> >   serial: 8250_dw: Fix common clocks usage race condition
> >
> >  drivers/tty/serial/8250/8250_dw.c   | 116 +++++++++++++++++++++++++---
> >  drivers/tty/serial/8250/8250_port.c |  38 +++++++++
> >  include/linux/serial_8250.h         |   2 +
> >  3 files changed, 144 insertions(+), 12 deletions(-)
> >
> > --
> > 2.26.2
> >
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
