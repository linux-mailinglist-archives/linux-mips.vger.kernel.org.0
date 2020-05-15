Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB12A1D5429
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 17:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgEOPT7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 11:19:59 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:37898 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbgEOPT6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 May 2020 11:19:58 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 534A98029EC9;
        Fri, 15 May 2020 15:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pnymTfqmVuML; Fri, 15 May 2020 18:19:51 +0300 (MSK)
Date:   Fri, 15 May 2020 18:19:48 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Long Cheng <long.cheng@mediatek.com>,
        Maxime Ripard <mripard@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        <linux-mips@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] serial: 8250_dw: Fix common clocks usage race
 condition
Message-ID: <20200515151948.264q2uktwv6xjgle@mobilestation>
References: <20200323024611.16039-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-5-Sergey.Semin@baikalelectronics.ru>
 <20200515141046.GF1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200515141046.GF1634618@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 15, 2020 at 05:10:46PM +0300, Andy Shevchenko wrote:
> On Thu, May 07, 2020 at 02:31:35AM +0300, Serge Semin wrote:
> > The race condition may happen if the UART reference clock is shared with
> > some other device (on Baikal-T1 SoC it's another DW UART port). In this
> > case if that device changes the clock rate while serial console is using
> > it the DW 8250 UART port might not only end up with an invalid uartclk
> > value saved, but may also experience a distorted output data since
> > baud-clock could have been changed. In order to fix this lets at least
> > try to adjust the 8250 port setting like UART clock rate in case if the
> > reference clock rate change is discovered. The driver will call the new
> > method to update 8250 UART port clock rate settings. It's done by means of
> > the clock event notifier registered at the port startup and unregistered
> > in the shutdown callback method.
> 
> I'm wondering if clock framework itself can provide such a notifier?
> 
> > Note 1. In order to avoid deadlocks we had to execute the UART port update
> > method in a dedicated deferred work. This is due to (in my opinion
> > redundant) the clock update implemented in the dw8250_set_termios()
> > method.
> 
> So, and how you propose to update the clock when ->set_termios() is called?

First of all If you are worried about the current implementation, please don't,
it still updates the clock in set_termios (please see the set_termios
code). The method hasn't changed much and does the updating the same way it did
before.

Secondly, 8250 driver should be using the same reference clock as it is
pre-defined by the platform with no change. The baud rate updates are supposed to
be performed by the divider embedded into the 8250 controller, otherwise the
divisor functionality is left completely unused. If a platform engineer needs to
speed the uart up, the ref clock rate can be tuned by for instance the
"assigned-clock-rates" property.

> 
> > Note 2. Before the ref clock is manually changed by the custom
> > set_termios() function we swap the port uartclk value with new rate
> > adjusted to be suitable for the requested baud. It is necessary in
> > order to effectively disable a functionality of the ref clock events
> > handler for the current UART port, since uartclk update will be done
> > a bit further in the generic serial8250_do_set_termios() function.
> 
> ...
> 
> > +	struct notifier_block	clk_notifier;
> > +	struct work_struct	clk_work;
> 
> Oh, this seems too much.
> Perhaps, the compatible based quirk with your initial approach is much better for time being.

It's already in 8250_dw, useful not for a single platform and won't hurt any
other one. So I'll leave it here and wait for the Greg feedback.

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
