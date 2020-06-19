Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07B7C20194F
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2020 19:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732574AbgFSRVg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Jun 2020 13:21:36 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:37534 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgFSRVg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Jun 2020 13:21:36 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 0C2A68030866;
        Fri, 19 Jun 2020 17:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OQ1qZv5ucs0O; Fri, 19 Jun 2020 20:21:32 +0300 (MSK)
Date:   Fri, 19 Jun 2020 20:21:31 +0300
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
Message-ID: <20200619172131.64qnaghsojgxetgf@mobilestation>
References: <20200617224813.23853-1-Sergey.Semin@baikalelectronics.ru>
 <CAHp75VfPEdxN1UeKJ+gCWpgJymK7YzQs1Lznq1aBfoRNBiMHbQ@mail.gmail.com>
 <CAHp75VdD+=L4OQkwVDx2aLKRssW-qBQL2nsF48J=dCntU8N7Ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75VdD+=L4OQkwVDx2aLKRssW-qBQL2nsF48J=dCntU8N7Ng@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 18, 2020 at 11:31:44AM +0300, Andy Shevchenko wrote:
> On Thu, Jun 18, 2020 at 11:17 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Thu, Jun 18, 2020 at 1:52 AM Serge Semin
> > <Sergey.Semin@baikalelectronics.ru> wrote:
> 
> > I'm wondering how this will collaborate with runtime PM.
> 

> Forgot to mention the WIP repository [1] for runtime PM rework  (it
> doesn't mean my comment against patch 3 is not valid). Tony and I are
> working on it, you actually may be interested as well.
> 
> [1]: https://gitlab.com/andy-shev/next

Thanks for the link. I'll take a look at the repo. Though our SoC doesn't
require the RPM moderation that critically.

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
