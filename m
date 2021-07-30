Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6379D3DBCA4
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jul 2021 17:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbhG3Pv4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jul 2021 11:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbhG3Pvs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Jul 2021 11:51:48 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE92C06175F
        for <linux-mips@vger.kernel.org>; Fri, 30 Jul 2021 08:51:42 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id c20so2106288vko.7
        for <linux-mips@vger.kernel.org>; Fri, 30 Jul 2021 08:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gKvMmjNFTT3BAck6SMVYU7Q3yMxXk96fB/X1tLYbNoo=;
        b=t8QJZbVPdCX8R0q49b+JYcAA2VDFtdMYDvwxylkFwmIdiAwyVD+zJ24fsuljMy0pMQ
         mBb/9Odw/bf7mC7YAELybRYUIfJ87RuTEsI7/E022CbuvuJMqG/1xBJwG1H5siX3Gqq3
         XUutYrsr6x/M3Ml/WqowN+uUDs8U0Vy3qbJMaTQqpOTefHNeviS0FFKHFh0tLumAu0xX
         BIRLr9KStDwQpGIZPArtFgr3HUd6wU+m3OQjhuQ4XEL/brm3CYt4wItwJGGLygev8uBl
         Wez0UR5dLtpMYdUxlRmN3gFWa6UViKRvQ3kMyb8dH3C+MJs4DP7c217PNq3evp/oHG+R
         sgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gKvMmjNFTT3BAck6SMVYU7Q3yMxXk96fB/X1tLYbNoo=;
        b=eNhO5C/i90D94iMhFOPpmQxwTWAHRXvMdru0TapHLAC+qWH5IFY+ZCSTVDzob/j9Ov
         V2q0jLZvq0A1VXhceXztXKDpP0B8yEgOqV7sxzhsacr1unt53ri3Yc4w1cvecNlvqzfh
         DYggOP6NiJvOX1CZzapnCBAUutiYlBcsD5ceWMqFtxVWhVYwOx2HSbBlYkIm+x9om+nW
         YCC2ihRFH7MhdVBbBeVWsAOKEB12D9n1i5njBBUudLMZ6bSoqVduWkxMRcU3kRaB4SoJ
         gxG9zMFoYTZ3GsXIEnI/9An+AibXAZuXvi60OZeSfK+GP2SBkzEb2L0PlSS+Ij95MP+c
         OA7Q==
X-Gm-Message-State: AOAM5307AFmX2US+oRFD8rVFq3KoHehgtNd9pCf6MQy4bvZ9WE85ITPi
        43id4nt7QRwcjqkTiGkJJwBbi1CKR1vyqWn+5Ik=
X-Google-Smtp-Source: ABdhPJwFJtQAdkN6kb1WpJpt6dD4I4xbJPUXyOlSwwKS4ed4nH1bPIb2OXWDemK/qa9M0rLR5QmyTcRyYbZjZI8cQ+w=
X-Received: by 2002:a1f:9442:: with SMTP id w63mr1342574vkd.8.1627660301164;
 Fri, 30 Jul 2021 08:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
 <20210614100617.28753-2-sergio.paracuellos@gmail.com> <20210729100146.GA8648@alpha.franken.de>
 <CAMhs-H-9=H2cTMtQxE_DUMraJ1KVNjOX2J-nO_RSdsyUUkSAMA@mail.gmail.com>
 <20210730083007.GA5072@alpha.franken.de> <CAMhs-H97LxHeo-4ni=vSiYFhwKrGNMLXHVa263tbDu0+-TwARA@mail.gmail.com>
 <CAMhs-H9EMXi_t=r=LuwudYG0oz0O27xj3_ko-eq-R+75wKE3PQ@mail.gmail.com> <20210730123939.GA8207@alpha.franken.de>
In-Reply-To: <20210730123939.GA8207@alpha.franken.de>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 30 Jul 2021 17:51:29 +0200
Message-ID: <CAMhs-H9UQgbMO6BP4DxSg6RQfZOa0NpZ+NhYhMx=jJMrAY-SrA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] MIPS: ralink: Define PCI_IOBASE
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-staging@lists.linux.dev,
        Greg KH <gregkh@linuxfoundation.org>,
        NeilBrown <neil@brown.name>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 30, 2021 at 2:39 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Fri, Jul 30, 2021 at 01:15:36PM +0200, Sergio Paracuellos wrote:
> > On Fri, Jul 30, 2021 at 12:22 PM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > >
> > > Hi Thomas,
> > >
> > > On Fri, Jul 30, 2021 at 10:30 AM Thomas Bogendoerfer
> > > <tsbogend@alpha.franken.de> wrote:
> > > >
> > > > On Thu, Jul 29, 2021 at 01:21:45PM +0200, Sergio Paracuellos wrote:
> > > > > Hi Thomas,
> > > > >
> > > > > On Thu, Jul 29, 2021 at 12:02 PM Thomas Bogendoerfer
> > > > > <tsbogend@alpha.franken.de> wrote:
> > > > > >
> > > > > > On Mon, Jun 14, 2021 at 12:06:15PM +0200, Sergio Paracuellos wrote:
> > > > > > > PCI_IOBASE is used to create VM maps for PCI I/O ports, it is
> > > > > > > required by generic PCI drivers to make memory mapped I/O range
> > > > > > > work. Hence define it for ralink architectures to be able to
> > > > > > > avoid parsing manually IO ranges in PCI generic driver code.
> > > > > > > Function 'plat_mem_setup' for ralink is using 'set_io_port_base'
> > > > > > > call using '0xa0000000' as address, so use the same address in
> > > > > > > the definition to align things.
> > > > > > >
> > > > > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > > > > ---
> > > > > > >  arch/mips/include/asm/mach-ralink/spaces.h | 10 ++++++++++
> > > > > > >  1 file changed, 10 insertions(+)
> > > > > > >  create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h
> > > > > > >
> > > > > > > diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..87d085c9ad61
> > > > > > > --- /dev/null
> > > > > > > +++ b/arch/mips/include/asm/mach-ralink/spaces.h
> > > > > > > @@ -0,0 +1,10 @@
> > > > > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > > > > +#ifndef __ASM_MACH_RALINK_SPACES_H_
> > > > > > > +#define __ASM_MACH_RALINK_SPACES_H_
> > > > > > > +
> > > > > > > +#define PCI_IOBASE   _AC(0xa0000000, UL)
> > > > > > > +#define PCI_IOSIZE   SZ_16M
> > > > > > > +#define IO_SPACE_LIMIT       (PCI_IOSIZE - 1)
> > > > > > > +
> > > > > > > +#include <asm/mach-generic/spaces.h>
> > > > > > > +#endif
> > > > > >
> > > > > > does this really work for you ? I tried the same trick for RB532
> > > > > > and the generated IO addresses are wrong...
> > > > >
> > > > > I got pci io resources assigned without complaints from the pci core
> > > > > code. I don't have real pci card that uses I/O bars but this is what I
> > > > > see in the boot (I added some traces when I was testing this):
> > > >
> > > > resource handling works, but the addresses generated for IO access
> > > > are wrong, because the iomap tries to ioremap it to a fixed
> > > > virtual address (PCI_IOBASE), which can't work for KSEG1 addresses.
> > > >
> > > > > Is this wrong?
> > > >
> > > > to get it working this way, we would need to put PCI_IOBASE somewhere
> > > > into KSEG2, which I don't like since it will create TLB entries for IO
> > > > addresses, which most of the time isn't needed on MIPS because of
> > > > access via KSEG1.
> > > >
> > > > I'd much prefer to make the devm_pci_remap_iospace() in drivers/pci/of.c
> > > > optional. Something like this
> > > >
> > > > diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> > > > index a143b02b2dcd..657aef39bf63 100644
> > > > --- a/drivers/pci/of.c
> > > > +++ b/drivers/pci/of.c
> > > > @@ -564,12 +564,14 @@ static int pci_parse_request_of_pci_ranges(struct device *dev,
> > > >
> > > >                 switch (resource_type(res)) {
> > > >                 case IORESOURCE_IO:
> > > > +#ifdef PCI_IOBASE
> > > >                         err = devm_pci_remap_iospace(dev, res, iobase);
> > > >                         if (err) {
> > > >                                 dev_warn(dev, "error %d: failed to map resource %pR\n",
> > > >                                          err, res);
> > > >                                 resource_list_destroy_entry(win);
> > > >                         }
> > > > +#endif
> > > >                         break;
> > > >                 case IORESOURCE_MEM:
> > > >                         res_valid |= !(res->flags & IORESOURCE_PREFETCH);
> > > >
> > > >
> > > > This together with an increased IO space via
> > > >
> > > > #define IO_SPACE_LIMIT 0x1fffffff
> > > >
> > > > gives me a working PCI bus on the RB532.
> > >
> > > BTW, I have tested your changes and they result in a no working pci
> > > for mt7621. I get a resource collision error:
> > >
> > > mt7621-pci 1e140000.pcie: resource collision: [io
> > > 0x1e160000-0x1e16ffff] conflicts with PCI IO [io  0x0000-0xffff]
> > >
> > > My changes:
> > >  - avoid PCI_IOBASE to be defined.
> > >  - avoid map in pci_parse_request_of_pci_ranges
> > >  - Change spaces.h to have the new IO_SPACE_LIMIT to 0x1fffffff
> > >
> > > Am I missing something?
> >
> > I am forced to set ioport_resource stuff at the beginning of the probe
> > function to avoid this collision error:
> >
> > /* set resources limits */
> > ioport_resource.start = 0x1e160000;
> > ioport_resource.end = 0x1e16ffff;
>
> yes, that's then neeed, I'm using
>
>         ioport_resource.start = 0;
>         ioport_resource.end = ~0UL;
>
> but
>
> ioport_resource.end = IO_SPACE_LIMIT;
>
> would be more correct.

Makes sense. I guess we can add this assignment in the main ralink
code platform to avoid defining this for every single pci driver.

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
