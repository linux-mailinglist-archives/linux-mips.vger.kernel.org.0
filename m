Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9855F1DCE88
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 15:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729443AbgEUNsT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 09:48:19 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:38094 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729197AbgEUNsT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 May 2020 09:48:19 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 207FF8030776;
        Thu, 21 May 2020 13:48:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WrSPaWNiovgJ; Thu, 21 May 2020 16:48:15 +0300 (MSK)
Date:   Thu, 21 May 2020 16:48:13 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Paul Burton <paul.burton@imgtec.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Olof Johansson <olof@lixom.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 00/14] mips: Prepare MIPS-arch code for Baikal-T1 SoC
 support
Message-ID: <20200521134813.tv2aqikvh45gryc4@mobilestation>
References: <20200521003443.11385-1-Sergey.Semin@baikalelectronics.ru>
 <20200521004217.6gdcpboxaqizreky@mobilestation>
 <20200521071457.GC7309@alpha.franken.de>
 <CAK8P3a2OYtd9Fa44ufbnpFoW3=G+NUtuueAoAV9CGVRBgOhSGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK8P3a2OYtd9Fa44ufbnpFoW3=G+NUtuueAoAV9CGVRBgOhSGw@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Arnd.

On Thu, May 21, 2020 at 09:30:08AM +0200, Arnd Bergmann wrote:
> On Thu, May 21, 2020 at 9:18 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> > On Thu, May 21, 2020 at 03:42:17AM +0300, Serge Semin wrote:
> > > On Thu, May 21, 2020 at 03:34:29AM +0300, Serge Semin wrote:
> > > >
> > > > This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
> > > > base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
> > > > tag: v5.7-rc4
> > >
> > > Thomas,
> > > Please note that this patchset is based on the Linux 5.7-rc4 tree (it most likely
> > > will get cleanly applied on rc6 as well), while mips-next is still at rc1. Due
> > > to that the patchset fails to be applied on mips-next. I think it would be
> > > better first to merge the last Linux tree into the mips-next, then try to merge
> > > this patchset in. Should you have any problem after that, please let me know.
> > > I'll resend the patchset being rebased on top of the new mips-next tree.
> >
> > no, that's not how it works. Please rebase your patches on top of
> > mips-next. Thank you.
> 
> Right, backmerges should generally be avoided. However if something
> between rc1 and rc4 is required to make Baikal-T1 work, rebasing it to
> rc1 would make it non-bisectable, which is also bad.
> 
> Serge, are you aware of something in -rc4 that is needed as a dependency?

Not I am aware of. Regarding my suggestion. It's not like I was going to
delegate a work or something. It's that a merge conflict is connected with
MODULE_PROC_FAMILY macro being moved to a dedicated file vermagic.h file:
62d0fd591db1 ("arch: split MODULE_ARCH_VERMAGIC definitions out to <asm/vermagic.h>").
Since I've already fixed it, Thomas wouldn't need to worry about the problem
anymore if he first merged the kernel master branch in first, which he would
have done anyway eventually. Since it's not an option and as you said backmerges
should be avoided, then I'll rebase the patchset onto the mips-next, and then
resend.

-Sergey

> 
>        Arnd
