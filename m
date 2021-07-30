Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05BEF3DB7A7
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jul 2021 13:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238552AbhG3LPz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jul 2021 07:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238403AbhG3LPz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Jul 2021 07:15:55 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986AAC061765
        for <linux-mips@vger.kernel.org>; Fri, 30 Jul 2021 04:15:49 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id d15so1929472vka.13
        for <linux-mips@vger.kernel.org>; Fri, 30 Jul 2021 04:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=croOUpjjpUMCMnvpnZ+Hk+cS1UgIbd5hw1PDQ3eqPGY=;
        b=QEOkhyb3zppVNAkPNnCcPIDIokdiOtxGp7wREvNh50Frvj0oSDaDKoIYJR1yEZagsd
         lfxEEPSw4XT+0qlsLZGmV3l/k/bCbiDGM7dSRIqLTb1fNKoND+iKG8XzqndVJISiJvnL
         LgCphQmg2EHC1yHfp/7EsyXUNmGYYOATuh/SwcQp/0e2f2//UdwUJbhhIB+NpiH1R3/s
         bS90OpRYXKFkhNog+OmHHK0BlQKCy/6SKk2alEQe02NHnBkjr+SdSbbGjboYCjA8lisz
         N8LdlkOwIIDCOQ33wlESPT3rcjsQ+XkfelfHBI1hVt/prH0kxgTTVMNteIwY1ZMqcE4J
         uD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=croOUpjjpUMCMnvpnZ+Hk+cS1UgIbd5hw1PDQ3eqPGY=;
        b=O/2yu5vTiv3x/owH5BvPrlgU2Ib2s0ut79Y6pd/k3J72/lyVDWNBTYwlZ9OCLLzgAL
         HHAp0goqCPW2CP+ub02bRwgBTLIOc2Ejju1t+crazXxqgoRxKW6NOfTtuU8cw3Z0URSf
         3d9gNQ1MXY1sJdajO0FfndiC6DkDBd2BK4T2VKKEgVqziCN/R3NcLpsN4VVFc0B1KoLn
         ICsgQ39OYiYsM0Op2AXcfrjhGcdhiGlDY4S4R2Dw/a2KybOkQCiISuAS/4VvKyGHuaY4
         D//REG9UB6NP/vLDEy+DwYOCIwLIpHzNPJSfefzqfkJMXkDsmOmduNXEdlj9VHU1Uf70
         0XJw==
X-Gm-Message-State: AOAM530qqtqCB1QA0Zt+O8f5Ti6EGLUvK0a2xhdKIBuqjdAqd4Kz4lQO
        y6EVwPJTd3vZ8PmA8VGP0FI19aHQ968yNRDFCeg=
X-Google-Smtp-Source: ABdhPJzvOCsZ6XzFZiO/T2g3Zfq8QB3105V9Kiw3tnPtHw2TuXLx2aEbizRmRD8fNnvu20uGQVVGtpbQ2wb8l95NT44=
X-Received: by 2002:ac5:cdb8:: with SMTP id l24mr897652vka.21.1627643748117;
 Fri, 30 Jul 2021 04:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
 <20210614100617.28753-2-sergio.paracuellos@gmail.com> <20210729100146.GA8648@alpha.franken.de>
 <CAMhs-H-9=H2cTMtQxE_DUMraJ1KVNjOX2J-nO_RSdsyUUkSAMA@mail.gmail.com>
 <20210730083007.GA5072@alpha.franken.de> <CAMhs-H97LxHeo-4ni=vSiYFhwKrGNMLXHVa263tbDu0+-TwARA@mail.gmail.com>
In-Reply-To: <CAMhs-H97LxHeo-4ni=vSiYFhwKrGNMLXHVa263tbDu0+-TwARA@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 30 Jul 2021 13:15:36 +0200
Message-ID: <CAMhs-H9EMXi_t=r=LuwudYG0oz0O27xj3_ko-eq-R+75wKE3PQ@mail.gmail.com>
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

On Fri, Jul 30, 2021 at 12:22 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi Thomas,
>
> On Fri, Jul 30, 2021 at 10:30 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Thu, Jul 29, 2021 at 01:21:45PM +0200, Sergio Paracuellos wrote:
> > > Hi Thomas,
> > >
> > > On Thu, Jul 29, 2021 at 12:02 PM Thomas Bogendoerfer
> > > <tsbogend@alpha.franken.de> wrote:
> > > >
> > > > On Mon, Jun 14, 2021 at 12:06:15PM +0200, Sergio Paracuellos wrote:
> > > > > PCI_IOBASE is used to create VM maps for PCI I/O ports, it is
> > > > > required by generic PCI drivers to make memory mapped I/O range
> > > > > work. Hence define it for ralink architectures to be able to
> > > > > avoid parsing manually IO ranges in PCI generic driver code.
> > > > > Function 'plat_mem_setup' for ralink is using 'set_io_port_base'
> > > > > call using '0xa0000000' as address, so use the same address in
> > > > > the definition to align things.
> > > > >
> > > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > > ---
> > > > >  arch/mips/include/asm/mach-ralink/spaces.h | 10 ++++++++++
> > > > >  1 file changed, 10 insertions(+)
> > > > >  create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h
> > > > >
> > > > > diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
> > > > > new file mode 100644
> > > > > index 000000000000..87d085c9ad61
> > > > > --- /dev/null
> > > > > +++ b/arch/mips/include/asm/mach-ralink/spaces.h
> > > > > @@ -0,0 +1,10 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > > +#ifndef __ASM_MACH_RALINK_SPACES_H_
> > > > > +#define __ASM_MACH_RALINK_SPACES_H_
> > > > > +
> > > > > +#define PCI_IOBASE   _AC(0xa0000000, UL)
> > > > > +#define PCI_IOSIZE   SZ_16M
> > > > > +#define IO_SPACE_LIMIT       (PCI_IOSIZE - 1)
> > > > > +
> > > > > +#include <asm/mach-generic/spaces.h>
> > > > > +#endif
> > > >
> > > > does this really work for you ? I tried the same trick for RB532
> > > > and the generated IO addresses are wrong...
> > >
> > > I got pci io resources assigned without complaints from the pci core
> > > code. I don't have real pci card that uses I/O bars but this is what I
> > > see in the boot (I added some traces when I was testing this):
> >
> > resource handling works, but the addresses generated for IO access
> > are wrong, because the iomap tries to ioremap it to a fixed
> > virtual address (PCI_IOBASE), which can't work for KSEG1 addresses.
> >
> > > Is this wrong?
> >
> > to get it working this way, we would need to put PCI_IOBASE somewhere
> > into KSEG2, which I don't like since it will create TLB entries for IO
> > addresses, which most of the time isn't needed on MIPS because of
> > access via KSEG1.
> >
> > I'd much prefer to make the devm_pci_remap_iospace() in drivers/pci/of.c
> > optional. Something like this
> >
> > diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> > index a143b02b2dcd..657aef39bf63 100644
> > --- a/drivers/pci/of.c
> > +++ b/drivers/pci/of.c
> > @@ -564,12 +564,14 @@ static int pci_parse_request_of_pci_ranges(struct device *dev,
> >
> >                 switch (resource_type(res)) {
> >                 case IORESOURCE_IO:
> > +#ifdef PCI_IOBASE
> >                         err = devm_pci_remap_iospace(dev, res, iobase);
> >                         if (err) {
> >                                 dev_warn(dev, "error %d: failed to map resource %pR\n",
> >                                          err, res);
> >                                 resource_list_destroy_entry(win);
> >                         }
> > +#endif
> >                         break;
> >                 case IORESOURCE_MEM:
> >                         res_valid |= !(res->flags & IORESOURCE_PREFETCH);
> >
> >
> > This together with an increased IO space via
> >
> > #define IO_SPACE_LIMIT 0x1fffffff
> >
> > gives me a working PCI bus on the RB532.
>
> BTW, I have tested your changes and they result in a no working pci
> for mt7621. I get a resource collision error:
>
> mt7621-pci 1e140000.pcie: resource collision: [io
> 0x1e160000-0x1e16ffff] conflicts with PCI IO [io  0x0000-0xffff]
>
> My changes:
>  - avoid PCI_IOBASE to be defined.
>  - avoid map in pci_parse_request_of_pci_ranges
>  - Change spaces.h to have the new IO_SPACE_LIMIT to 0x1fffffff
>
> Am I missing something?

I am forced to set ioport_resource stuff at the beginning of the probe
function to avoid this collision error:

/* set resources limits */
ioport_resource.start = 0x1e160000;
ioport_resource.end = 0x1e16ffff;

Taking into account that we expect pci core code to properly parse and
get the ranges and so on, if we are forced to do something like this
(or reading manually ranges for device tree) in driver code looks
redundant for me...

That said, I get the following pci working platform with your changes
and this initial ioport_resource set up:

[   16.129859] mt7621-pci 1e140000.pcie: host bridge /pcie@1e140000 ranges:
[   16.143130] mt7621-pci 1e140000.pcie:   No bus range found for
/pcie@1e140000, using [bus 00-ff]
[   16.160568] mt7621-pci 1e140000.pcie:      MEM
0x0060000000..0x006fffffff -> 0x0060000000
[   16.176783] OF: IO START returned by pci_address_to_pio:
0x60000000-0x6fffffff
[   16.191133] mt7621-pci 1e140000.pcie:       IO
0x001e160000..0x001e16ffff -> 0x0000000000
[   16.207358] OF: IO START returned by pci_address_to_pio:
0x1e160000-0x1e16ffff
[   16.462156] mt7621-pci 1e140000.pcie: PCIE0 enabled
[   16.471713] mt7621-pci 1e140000.pcie: PCIE1 enabled
[   16.481422] mt7621-pci 1e140000.pcie: PCIE2 enabled
[   16.491095] mt7621-pci 1e140000.pcie: PCI coherence region base:
0x60000000, mask/settings: 0xf0000002
[   16.509802] mt7621-pci 1e140000.pcie: PCI host bridge to bus 0000:00
[   16.522365] pci_bus 0000:00: root bus resource [bus 00-ff]
[   16.533204] pci_bus 0000:00: root bus resource [mem 0x60000000-0x6fffffff]
[   16.546855] pci_bus 0000:00: root bus resource [io
0x1e160000-0x1e16ffff] (bus address [0x0000-0xffff])
[   16.565751] pci 0000:00:00.0: [0e8d:0801] type 01 class 0x060400
[   16.577629] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x7fffffff]
[   16.590063] pci 0000:00:00.0: reg 0x14: [mem 0x00000000-0x0000ffff]
[   16.602580] pci 0000:00:00.0: supports D1
[   16.610413] pci 0000:00:00.0: PME# supported from D0 D1 D3hot
[   16.622887] pci 0000:00:01.0: [0e8d:0801] type 01 class 0x060400
[   16.634799] pci 0000:00:01.0: reg 0x10: [mem 0x00000000-0x7fffffff]
[   16.647186] pci 0000:00:01.0: reg 0x14: [mem 0x00000000-0x0000ffff]
[   16.659697] pci 0000:00:01.0: supports D1
[   16.667559] pci 0000:00:01.0: PME# supported from D0 D1 D3hot
[   16.679943] pci 0000:00:02.0: [0e8d:0801] type 01 class 0x060400
[   16.691851] pci 0000:00:02.0: reg 0x10: [mem 0x00000000-0x7fffffff]
[   16.704240] pci 0000:00:02.0: reg 0x14: [mem 0x00000000-0x0000ffff]
[   16.716751] pci 0000:00:02.0: supports D1
[   16.724610] pci 0000:00:02.0: PME# supported from D0 D1 D3hot
[   16.737915] pci 0000:00:00.0: bridge configuration invalid ([bus
00-00]), reconfiguring
[   16.753756] pci 0000:00:01.0: bridge configuration invalid ([bus
00-00]), reconfiguring
[   16.769631] pci 0000:00:02.0: bridge configuration invalid ([bus
00-00]), reconfiguring
[   16.785811] pci 0000:01:00.0: [1b21:0611] type 00 class 0x010185
[   16.797692] pci 0000:01:00.0: reg 0x10: [io  0x1e160000-0x1e160007]
[   16.810082] pci 0000:01:00.0: reg 0x14: [io  0x1e160000-0x1e160003]
[   16.822533] pci 0000:01:00.0: reg 0x18: [io  0x1e160000-0x1e160007]
[   16.834965] pci 0000:01:00.0: reg 0x1c: [io  0x1e160000-0x1e160003]
[   16.847405] pci 0000:01:00.0: reg 0x20: [io  0x1e160000-0x1e16000f]
[   16.859847] pci 0000:01:00.0: reg 0x24: [mem 0x00000000-0x000001ff]
[   16.872446] pci 0000:01:00.0: 2.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x1 link at 0000:00:00.0 (capable of 4.000
Gb/s with 5.0 GT/s PCIe x1 link)
[   16.933210] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[   16.943503] pci 0000:00:00.0:   bridge window [io  0x1e160000-0x1e160fff]
[   16.956963] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
[   16.970442] pci 0000:00:00.0:   bridge window [mem
0x00000000-0x000fffff pref]
[   16.984789] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[   16.998209] pci 0000:02:00.0: [1b21:0611] type 00 class 0x010185
[   17.010096] pci 0000:02:00.0: reg 0x10: [io  0x1e160000-0x1e160007]
[   17.022483] pci 0000:02:00.0: reg 0x14: [io  0x1e160000-0x1e160003]
[   17.034923] pci 0000:02:00.0: reg 0x18: [io  0x1e160000-0x1e160007]
[   17.047364] pci 0000:02:00.0: reg 0x1c: [io  0x1e160000-0x1e160003]
[   17.059814] pci 0000:02:00.0: reg 0x20: [io  0x1e160000-0x1e16000f]
[   17.072246] pci 0000:02:00.0: reg 0x24: [mem 0x00000000-0x000001ff]
[   17.084844] pci 0000:02:00.0: 2.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x1 link at 0000:00:01.0 (capable of 4.000
Gb/s with 5.0 GT/s PCIe x1 link)
[   17.143234] pci 0000:00:01.0: PCI bridge to [bus 02-ff]
[   17.153527] pci 0000:00:01.0:   bridge window [io  0x1e160000-0x1e160fff]
[   17.166987] pci 0000:00:01.0:   bridge window [mem 0x00000000-0x000fffff]
[   17.180466] pci 0000:00:01.0:   bridge window [mem
0x00000000-0x000fffff pref]
[   17.194813] pci_bus 0000:02: busn_res: [bus 02-ff] end is updated to 02
[   17.208231] pci 0000:03:00.0: [1b21:0611] type 00 class 0x010185
[   17.220107] pci 0000:03:00.0: reg 0x10: [io  0x1e160000-0x1e160007]
[   17.232524] pci 0000:03:00.0: reg 0x14: [io  0x1e160000-0x1e160003]
[   17.244947] pci 0000:03:00.0: reg 0x18: [io  0x1e160000-0x1e160007]
[   17.257386] pci 0000:03:00.0: reg 0x1c: [io  0x1e160000-0x1e160003]
[   17.269839] pci 0000:03:00.0: reg 0x20: [io  0x1e160000-0x1e16000f]
[   17.282269] pci 0000:03:00.0: reg 0x24: [mem 0x00000000-0x000001ff]
[   17.294868] pci 0000:03:00.0: 2.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x1 link at 0000:00:02.0 (capable of 4.000
Gb/s with 5.0 GT/s PCIe x1 link)
[   17.353206] pci 0000:00:02.0: PCI bridge to [bus 03-ff]
[   17.363509] pci 0000:00:02.0:   bridge window [io  0x1e160000-0x1e160fff]
[   17.376962] pci 0000:00:02.0:   bridge window [mem 0x00000000-0x000fffff]
[   17.390438] pci 0000:00:02.0:   bridge window [mem
0x00000000-0x000fffff pref]
[   17.404785] pci_bus 0000:03: busn_res: [bus 03-ff] end is updated to 03
[   17.417985] pci 0000:00:00.0: BAR 0: no space for [mem size 0x80000000]
[   17.431044] pci 0000:00:00.0: BAR 0: failed to assign [mem size 0x80000000]
[   17.444872] pci 0000:00:01.0: BAR 0: no space for [mem size 0x80000000]
[   17.458000] pci 0000:00:01.0: BAR 0: failed to assign [mem size 0x80000000]
[   17.471827] pci 0000:00:02.0: BAR 0: no space for [mem size 0x80000000]
[   17.484964] pci 0000:00:02.0: BAR 0: failed to assign [mem size 0x80000000]
[   17.498787] pci 0000:00:00.0: BAR 8: assigned [mem 0x60000000-0x600fffff]
[   17.512264] pci 0000:00:00.0: BAR 9: assigned [mem
0x60100000-0x601fffff pref]
[   17.526607] pci 0000:00:01.0: BAR 8: assigned [mem 0x60200000-0x602fffff]
[   17.540085] pci 0000:00:01.0: BAR 9: assigned [mem
0x60300000-0x603fffff pref]
[   17.554434] pci 0000:00:02.0: BAR 8: assigned [mem 0x60400000-0x604fffff]
[   17.567907] pci 0000:00:02.0: BAR 9: assigned [mem
0x60500000-0x605fffff pref]
[   17.582248] pci 0000:00:00.0: BAR 1: assigned [mem 0x60600000-0x6060ffff]
[   17.595732] pci 0000:00:01.0: BAR 1: assigned [mem 0x60610000-0x6061ffff]
[   17.609212] pci 0000:00:02.0: BAR 1: assigned [mem 0x60620000-0x6062ffff]
[   17.622693] pci 0000:00:00.0: BAR 7: assigned [io  0x1e160000-0x1e160fff]
[   17.636162] pci 0000:00:01.0: BAR 7: assigned [io  0x1e161000-0x1e161fff]
[   17.649639] pci 0000:00:02.0: BAR 7: assigned [io  0x1e162000-0x1e162fff]
[   17.663130] pci 0000:01:00.0: BAR 5: assigned [mem 0x60000000-0x600001ff]
[   17.676602] pci 0000:01:00.0: BAR 4: assigned [io  0x1e160000-0x1e16000f]
[   17.690086] pci 0000:01:00.0: BAR 0: assigned [io  0x1e160010-0x1e160017]
[   17.703558] pci 0000:01:00.0: BAR 2: assigned [io  0x1e160018-0x1e16001f]
[   17.717036] pci 0000:01:00.0: BAR 1: assigned [io  0x1e160020-0x1e160023]
[   17.730519] pci 0000:01:00.0: BAR 3: assigned [io  0x1e160024-0x1e160027]
[   17.743999] pci 0000:00:00.0: PCI bridge to [bus 01]
[   17.753836] pci 0000:00:00.0:   bridge window [io  0x1e160000-0x1e160fff]
[   17.767314] pci 0000:00:00.0:   bridge window [mem 0x60000000-0x600fffff]
[   17.780793] pci 0000:00:00.0:   bridge window [mem
0x60100000-0x601fffff pref]
[   17.795145] pci 0000:02:00.0: BAR 5: assigned [mem 0x60200000-0x602001ff]
[   17.808628] pci 0000:02:00.0: BAR 4: assigned [io  0x1e161000-0x1e16100f]
[   17.822123] pci 0000:02:00.0: BAR 0: assigned [io  0x1e161010-0x1e161017]
[   17.835575] pci 0000:02:00.0: BAR 2: assigned [io  0x1e161018-0x1e16101f]
[   17.849060] pci 0000:02:00.0: BAR 1: assigned [io  0x1e161020-0x1e161023]
[   17.862541] pci 0000:02:00.0: BAR 3: assigned [io  0x1e161024-0x1e161027]
[   17.876010] pci 0000:00:01.0: PCI bridge to [bus 02]
[   17.885854] pci 0000:00:01.0:   bridge window [io  0x1e161000-0x1e161fff]
[   17.899333] pci 0000:00:01.0:   bridge window [mem 0x60200000-0x602fffff]
[   17.912810] pci 0000:00:01.0:   bridge window [mem
0x60300000-0x603fffff pref]
[   17.927171] pci 0000:03:00.0: BAR 5: assigned [mem 0x60400000-0x604001ff]
[   17.940639] pci 0000:03:00.0: BAR 4: assigned [io  0x1e162000-0x1e16200f]
[   17.954118] pci 0000:03:00.0: BAR 0: assigned [io  0x1e162010-0x1e162017]
[   17.967601] pci 0000:03:00.0: BAR 2: assigned [io  0x1e162018-0x1e16201f]
[   17.981074] pci 0000:03:00.0: BAR 1: assigned [io  0x1e162020-0x1e162023]
[   17.994560] pci 0000:03:00.0: BAR 3: assigned [io  0x1e162024-0x1e162027]
[   18.008030] pci 0000:00:02.0: PCI bridge to [bus 03]
[   18.017873] pci 0000:00:02.0:   bridge window [io  0x1e162000-0x1e162fff]
[   18.031352] pci 0000:00:02.0:   bridge window [mem 0x60400000-0x604fffff]
[   18.044830] pci 0000:00:02.0:   bridge window [mem
0x60500000-0x605fffff pref]


Best regards,
    Sergio Paracuellos

>
> Thanks,
>    Sergio Paracuellos
> >
> > No idea, if the patch would be accepted by the PCI maintainers.
> >
> > Thomas.
> >
> > --
> > Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> > good idea.                                                [ RFC1925, 2.3 ]
