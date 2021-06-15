Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33113A7F22
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jun 2021 15:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbhFON0v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Jun 2021 09:26:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:54262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230146AbhFON0v (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 15 Jun 2021 09:26:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3676F61465;
        Tue, 15 Jun 2021 13:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623763486;
        bh=V4tpiMC8eA/B5+op+TxQhJBdvP2Y7K62zVk556CGsz8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mg0ecllN6Lnek19Zxt/aZ8T/HNJfQBlqWdtiorbaZ3+uIinhLkt9yPQp4RG6diIjX
         ZwdNdqvaCcMHPrJ661+0GlYUk+zy/oaUxFI6AqGVZ3cNF3/JGA583lMsyONIEZCWWB
         62ldCKKRy4oDy1mHZfVI79BkW6E2douBMlzRtc5M=
Date:   Tue, 15 Jun 2021 15:24:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH v2 1/3] MIPS: ralink: Define PCI_IOBASE
Message-ID: <YMiqHBVuoyd4EcIz@kroah.com>
References: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
 <20210614100617.28753-2-sergio.paracuellos@gmail.com>
 <20210615130830.GA7029@alpha.franken.de>
 <CAMhs-H8TM=m2ULVYwOFR8kEw4h1EDHOeGaVh9WpvxmY8oP8NTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhs-H8TM=m2ULVYwOFR8kEw4h1EDHOeGaVh9WpvxmY8oP8NTg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 15, 2021 at 03:12:59PM +0200, Sergio Paracuellos wrote:
> On Tue, Jun 15, 2021 at 3:09 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Mon, Jun 14, 2021 at 12:06:15PM +0200, Sergio Paracuellos wrote:
> > > PCI_IOBASE is used to create VM maps for PCI I/O ports, it is
> > > required by generic PCI drivers to make memory mapped I/O range
> > > work. Hence define it for ralink architectures to be able to
> > > avoid parsing manually IO ranges in PCI generic driver code.
> > > Function 'plat_mem_setup' for ralink is using 'set_io_port_base'
> > > call using '0xa0000000' as address, so use the same address in
> > > the definition to align things.
> > >
> > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > ---
> > >  arch/mips/include/asm/mach-ralink/spaces.h | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >  create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h
> > >
> > > diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
> > > new file mode 100644
> > > index 000000000000..87d085c9ad61
> > > --- /dev/null
> > > +++ b/arch/mips/include/asm/mach-ralink/spaces.h
> > > @@ -0,0 +1,10 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +#ifndef __ASM_MACH_RALINK_SPACES_H_
> > > +#define __ASM_MACH_RALINK_SPACES_H_
> > > +
> > > +#define PCI_IOBASE   _AC(0xa0000000, UL)
> > > +#define PCI_IOSIZE   SZ_16M
> > > +#define IO_SPACE_LIMIT       (PCI_IOSIZE - 1)
> > > +
> > > +#include <asm/mach-generic/spaces.h>
> > > +#endif
> > > --
> > > 2.25.1
> >
> > Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> 
> Fastest response ever :) Thanks!

Thanks, all now queued up.
