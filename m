Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E40D3DB8BE
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jul 2021 14:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238871AbhG3Mj5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jul 2021 08:39:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:35211 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238806AbhG3Mjz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Jul 2021 08:39:55 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1m9Rno-0006fB-00; Fri, 30 Jul 2021 14:39:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 993C4C2584; Fri, 30 Jul 2021 14:39:39 +0200 (CEST)
Date:   Fri, 30 Jul 2021 14:39:39 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-staging@lists.linux.dev,
        Greg KH <gregkh@linuxfoundation.org>,
        NeilBrown <neil@brown.name>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH v2 1/3] MIPS: ralink: Define PCI_IOBASE
Message-ID: <20210730123939.GA8207@alpha.franken.de>
References: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
 <20210614100617.28753-2-sergio.paracuellos@gmail.com>
 <20210729100146.GA8648@alpha.franken.de>
 <CAMhs-H-9=H2cTMtQxE_DUMraJ1KVNjOX2J-nO_RSdsyUUkSAMA@mail.gmail.com>
 <20210730083007.GA5072@alpha.franken.de>
 <CAMhs-H97LxHeo-4ni=vSiYFhwKrGNMLXHVa263tbDu0+-TwARA@mail.gmail.com>
 <CAMhs-H9EMXi_t=r=LuwudYG0oz0O27xj3_ko-eq-R+75wKE3PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhs-H9EMXi_t=r=LuwudYG0oz0O27xj3_ko-eq-R+75wKE3PQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 30, 2021 at 01:15:36PM +0200, Sergio Paracuellos wrote:
> On Fri, Jul 30, 2021 at 12:22 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > Hi Thomas,
> >
> > On Fri, Jul 30, 2021 at 10:30 AM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > >
> > > On Thu, Jul 29, 2021 at 01:21:45PM +0200, Sergio Paracuellos wrote:
> > > > Hi Thomas,
> > > >
> > > > On Thu, Jul 29, 2021 at 12:02 PM Thomas Bogendoerfer
> > > > <tsbogend@alpha.franken.de> wrote:
> > > > >
> > > > > On Mon, Jun 14, 2021 at 12:06:15PM +0200, Sergio Paracuellos wrote:
> > > > > > PCI_IOBASE is used to create VM maps for PCI I/O ports, it is
> > > > > > required by generic PCI drivers to make memory mapped I/O range
> > > > > > work. Hence define it for ralink architectures to be able to
> > > > > > avoid parsing manually IO ranges in PCI generic driver code.
> > > > > > Function 'plat_mem_setup' for ralink is using 'set_io_port_base'
> > > > > > call using '0xa0000000' as address, so use the same address in
> > > > > > the definition to align things.
> > > > > >
> > > > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > > > ---
> > > > > >  arch/mips/include/asm/mach-ralink/spaces.h | 10 ++++++++++
> > > > > >  1 file changed, 10 insertions(+)
> > > > > >  create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h
> > > > > >
> > > > > > diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
> > > > > > new file mode 100644
> > > > > > index 000000000000..87d085c9ad61
> > > > > > --- /dev/null
> > > > > > +++ b/arch/mips/include/asm/mach-ralink/spaces.h
> > > > > > @@ -0,0 +1,10 @@
> > > > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > > > +#ifndef __ASM_MACH_RALINK_SPACES_H_
> > > > > > +#define __ASM_MACH_RALINK_SPACES_H_
> > > > > > +
> > > > > > +#define PCI_IOBASE   _AC(0xa0000000, UL)
> > > > > > +#define PCI_IOSIZE   SZ_16M
> > > > > > +#define IO_SPACE_LIMIT       (PCI_IOSIZE - 1)
> > > > > > +
> > > > > > +#include <asm/mach-generic/spaces.h>
> > > > > > +#endif
> > > > >
> > > > > does this really work for you ? I tried the same trick for RB532
> > > > > and the generated IO addresses are wrong...
> > > >
> > > > I got pci io resources assigned without complaints from the pci core
> > > > code. I don't have real pci card that uses I/O bars but this is what I
> > > > see in the boot (I added some traces when I was testing this):
> > >
> > > resource handling works, but the addresses generated for IO access
> > > are wrong, because the iomap tries to ioremap it to a fixed
> > > virtual address (PCI_IOBASE), which can't work for KSEG1 addresses.
> > >
> > > > Is this wrong?
> > >
> > > to get it working this way, we would need to put PCI_IOBASE somewhere
> > > into KSEG2, which I don't like since it will create TLB entries for IO
> > > addresses, which most of the time isn't needed on MIPS because of
> > > access via KSEG1.
> > >
> > > I'd much prefer to make the devm_pci_remap_iospace() in drivers/pci/of.c
> > > optional. Something like this
> > >
> > > diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> > > index a143b02b2dcd..657aef39bf63 100644
> > > --- a/drivers/pci/of.c
> > > +++ b/drivers/pci/of.c
> > > @@ -564,12 +564,14 @@ static int pci_parse_request_of_pci_ranges(struct device *dev,
> > >
> > >                 switch (resource_type(res)) {
> > >                 case IORESOURCE_IO:
> > > +#ifdef PCI_IOBASE
> > >                         err = devm_pci_remap_iospace(dev, res, iobase);
> > >                         if (err) {
> > >                                 dev_warn(dev, "error %d: failed to map resource %pR\n",
> > >                                          err, res);
> > >                                 resource_list_destroy_entry(win);
> > >                         }
> > > +#endif
> > >                         break;
> > >                 case IORESOURCE_MEM:
> > >                         res_valid |= !(res->flags & IORESOURCE_PREFETCH);
> > >
> > >
> > > This together with an increased IO space via
> > >
> > > #define IO_SPACE_LIMIT 0x1fffffff
> > >
> > > gives me a working PCI bus on the RB532.
> >
> > BTW, I have tested your changes and they result in a no working pci
> > for mt7621. I get a resource collision error:
> >
> > mt7621-pci 1e140000.pcie: resource collision: [io
> > 0x1e160000-0x1e16ffff] conflicts with PCI IO [io  0x0000-0xffff]
> >
> > My changes:
> >  - avoid PCI_IOBASE to be defined.
> >  - avoid map in pci_parse_request_of_pci_ranges
> >  - Change spaces.h to have the new IO_SPACE_LIMIT to 0x1fffffff
> >
> > Am I missing something?
> 
> I am forced to set ioport_resource stuff at the beginning of the probe
> function to avoid this collision error:
> 
> /* set resources limits */
> ioport_resource.start = 0x1e160000;
> ioport_resource.end = 0x1e16ffff;

yes, that's then neeed, I'm using

        ioport_resource.start = 0;
        ioport_resource.end = ~0UL;

but 

ioport_resource.end = IO_SPACE_LIMIT;

would be more correct.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
