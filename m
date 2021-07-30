Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13F63DB715
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jul 2021 12:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238352AbhG3KXU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jul 2021 06:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238368AbhG3KXQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Jul 2021 06:23:16 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEEAEC0613C1
        for <linux-mips@vger.kernel.org>; Fri, 30 Jul 2021 03:23:07 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id v16so5144565vss.7
        for <linux-mips@vger.kernel.org>; Fri, 30 Jul 2021 03:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J5MNyBQTT5CXBciQaEtEHme59/RCeNBFFmttCvDDhME=;
        b=JP0lB5IeQdenDjSIlqyTkyPms/2vrAb1GGWftPJ15wRajtqwqIKBSbHL4YKoOASePn
         FsVQCdyUtFtCOjHo7dutIuiCgeyeNhCcReAIp+I5xSstFkNz43n0vUqUE9cZABH3dTqz
         AaFT1Y5EpapSpkXMxssXAa/l8BS8Y7Y5Ix+Uh3Yov8Y480XbrnC+9ncUrjgqYHNI+zuw
         e/a84z8+ghdsMFLEAGaxwceXPdQP/bE7KtrUUIPxs0kcIuQKxd1QmrnnlAeuGql1nFR7
         7i4fvCE7kDD24GGku9fi9LahfvmkX/ywlkzHyoQpQ2j2VCDwWsuLKKj4GbDkbO7fGJzj
         Ky4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J5MNyBQTT5CXBciQaEtEHme59/RCeNBFFmttCvDDhME=;
        b=bGB9M/Le0oYXazhL2qwiq9xpVCcWaBdY2NDq1wd4KIXQ0DqB0UexHxCBuGcDrYoL5m
         K+G8CQTsxENfwvCt00RpOYkXzlnGg31YsRq0/oWR+RJPKk3S510uKOdWqATqeeDBBGY2
         gjHyggcrp7rcA8+8yUj6+ChWSZAHf2Qj9nIjyBj2oETCyORAiE++tHHmc2NzO5BgZ/QY
         n/KX6Fl8b1f1n8jbfnEcM8I6LvUtq1sk0bh7FMlcg/2Y3ztXj8gyEUYu4k2rQTP7r6gU
         8ICUjuV5RXxwNC6cDMGXoWlaTQpC/bSoCrE2mGuBYZuTwM5W36qhzYaIdd1w/iQsMbFR
         wQ8A==
X-Gm-Message-State: AOAM5306WkipyZvUh8LPQv1tR8T0T/GRvq8Oa/CiyZCAaF3WdIgRSGd5
        YU/h1iP2fzV3gP59uNc9s2bNec4ixb3t75YFkqc=
X-Google-Smtp-Source: ABdhPJwk4Cd5nDCjtmOfjl9+uRtQ5Blj4Kq268ngWdm5YoguoxF1Oek4MC3EWJbc2QN112A1PsJMMvbEtRO5vRzs8UI=
X-Received: by 2002:a05:6102:3231:: with SMTP id x17mr856560vsf.30.1627640586932;
 Fri, 30 Jul 2021 03:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
 <20210614100617.28753-2-sergio.paracuellos@gmail.com> <20210729100146.GA8648@alpha.franken.de>
 <CAMhs-H-9=H2cTMtQxE_DUMraJ1KVNjOX2J-nO_RSdsyUUkSAMA@mail.gmail.com> <20210730083007.GA5072@alpha.franken.de>
In-Reply-To: <20210730083007.GA5072@alpha.franken.de>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 30 Jul 2021 12:22:55 +0200
Message-ID: <CAMhs-H97LxHeo-4ni=vSiYFhwKrGNMLXHVa263tbDu0+-TwARA@mail.gmail.com>
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

Hi Thomas,

On Fri, Jul 30, 2021 at 10:30 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Thu, Jul 29, 2021 at 01:21:45PM +0200, Sergio Paracuellos wrote:
> > Hi Thomas,
> >
> > On Thu, Jul 29, 2021 at 12:02 PM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > >
> > > On Mon, Jun 14, 2021 at 12:06:15PM +0200, Sergio Paracuellos wrote:
> > > > PCI_IOBASE is used to create VM maps for PCI I/O ports, it is
> > > > required by generic PCI drivers to make memory mapped I/O range
> > > > work. Hence define it for ralink architectures to be able to
> > > > avoid parsing manually IO ranges in PCI generic driver code.
> > > > Function 'plat_mem_setup' for ralink is using 'set_io_port_base'
> > > > call using '0xa0000000' as address, so use the same address in
> > > > the definition to align things.
> > > >
> > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > ---
> > > >  arch/mips/include/asm/mach-ralink/spaces.h | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >  create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h
> > > >
> > > > diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
> > > > new file mode 100644
> > > > index 000000000000..87d085c9ad61
> > > > --- /dev/null
> > > > +++ b/arch/mips/include/asm/mach-ralink/spaces.h
> > > > @@ -0,0 +1,10 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +#ifndef __ASM_MACH_RALINK_SPACES_H_
> > > > +#define __ASM_MACH_RALINK_SPACES_H_
> > > > +
> > > > +#define PCI_IOBASE   _AC(0xa0000000, UL)
> > > > +#define PCI_IOSIZE   SZ_16M
> > > > +#define IO_SPACE_LIMIT       (PCI_IOSIZE - 1)
> > > > +
> > > > +#include <asm/mach-generic/spaces.h>
> > > > +#endif
> > >
> > > does this really work for you ? I tried the same trick for RB532
> > > and the generated IO addresses are wrong...
> >
> > I got pci io resources assigned without complaints from the pci core
> > code. I don't have real pci card that uses I/O bars but this is what I
> > see in the boot (I added some traces when I was testing this):
>
> resource handling works, but the addresses generated for IO access
> are wrong, because the iomap tries to ioremap it to a fixed
> virtual address (PCI_IOBASE), which can't work for KSEG1 addresses.
>
> > Is this wrong?
>
> to get it working this way, we would need to put PCI_IOBASE somewhere
> into KSEG2, which I don't like since it will create TLB entries for IO
> addresses, which most of the time isn't needed on MIPS because of
> access via KSEG1.
>
> I'd much prefer to make the devm_pci_remap_iospace() in drivers/pci/of.c
> optional. Something like this
>
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index a143b02b2dcd..657aef39bf63 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -564,12 +564,14 @@ static int pci_parse_request_of_pci_ranges(struct device *dev,
>
>                 switch (resource_type(res)) {
>                 case IORESOURCE_IO:
> +#ifdef PCI_IOBASE
>                         err = devm_pci_remap_iospace(dev, res, iobase);
>                         if (err) {
>                                 dev_warn(dev, "error %d: failed to map resource %pR\n",
>                                          err, res);
>                                 resource_list_destroy_entry(win);
>                         }
> +#endif
>                         break;
>                 case IORESOURCE_MEM:
>                         res_valid |= !(res->flags & IORESOURCE_PREFETCH);
>
>
> This together with an increased IO space via
>
> #define IO_SPACE_LIMIT 0x1fffffff
>
> gives me a working PCI bus on the RB532.

BTW, I have tested your changes and they result in a no working pci
for mt7621. I get a resource collision error:

mt7621-pci 1e140000.pcie: resource collision: [io
0x1e160000-0x1e16ffff] conflicts with PCI IO [io  0x0000-0xffff]

My changes:
 - avoid PCI_IOBASE to be defined.
 - avoid map in pci_parse_request_of_pci_ranges
 - Change spaces.h to have the new IO_SPACE_LIMIT to 0x1fffffff

Am I missing something?

Thanks,
   Sergio Paracuellos
>
> No idea, if the patch would be accepted by the PCI maintainers.
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
