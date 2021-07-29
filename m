Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055FF3DA203
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jul 2021 13:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233900AbhG2LWC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Jul 2021 07:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbhG2LWB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Jul 2021 07:22:01 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01756C061765
        for <linux-mips@vger.kernel.org>; Thu, 29 Jul 2021 04:21:58 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id j15so2452844uaa.5
        for <linux-mips@vger.kernel.org>; Thu, 29 Jul 2021 04:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eowpw84yWA/wz2DAnFhJze6svWXqfWXMurQ4S38lKZs=;
        b=VS5KQ7cK93J37XzpUDG2Nb5tFe8boW7JaB8hN8YfzFb1i2jYB8fYXs8CHQHejtiW1r
         qX6Zqq4MqZZPMtbK++gGHuFsD7o+P4pMmJSDARXcW1BBqJheqv3eHpO29QTeYsgo7HTu
         Qm9Qdg5Mkt3ZYajGCTEF36/yMNEjDjwWR9qCicUjEt9uE7qijpfcblOBot1FBPiVafMW
         18jUG9SbXaIpOTLPJ5+2owbct3wf69x+JGU56Ka6vAMV/PwrOnGQ6vcnAuBjBGRvHSjX
         nMNidDO7XqR0WMndiK2dAvdhcnp6neVc546c82kZlW2T3RpGRtjWTNLxJHjHS42qZ2+m
         IhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eowpw84yWA/wz2DAnFhJze6svWXqfWXMurQ4S38lKZs=;
        b=JutDHdGKBCn8dqPA/LP5hTt18Gbxyg7RptSPvq7QX59GKAUvW2R2Xa87ByY3spZ2cu
         RmwPGZS3XswY/ztTECs0CMMP97m2PO37bDh4m6URPfcFrbJprmTVTwDHj3hsO5CNGC4J
         vATSWWQfqktRzFYDA7UBD0ooA6NpVF7SPPuDSRmc1dPIqmptR4pClQD7GjwBNldJlPLH
         TPf8UwyUowmGsCnceIUnd4msPg4aWPGbmVIrWh7qVT5gnd1Ec0+VG2805C89COs+0AFK
         cnxW41no+7+L26OEEazMvszUMg4dkMjH7beLnYrRQ+A2OwMW1upLschDMnGUG5ykx4eW
         o8eg==
X-Gm-Message-State: AOAM530xQHaE81hIo5zOz6YDaypo1r8dax/Stds2bDAoC76Ggym01mzX
        dQVaY51YrmfzoSHTGh+wH7SGUc88xNq7Vhx5MpY=
X-Google-Smtp-Source: ABdhPJxCepbriBdoRtIdfBgK0Ja6+qSqR/JIo/NGojD+yluOR1ZYidFhe7FMPQ4+jC1txQj7SJBUSpCy4C/BGr0DMn0=
X-Received: by 2002:ab0:280a:: with SMTP id w10mr3762983uap.0.1627557717092;
 Thu, 29 Jul 2021 04:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
 <20210614100617.28753-2-sergio.paracuellos@gmail.com> <20210729100146.GA8648@alpha.franken.de>
In-Reply-To: <20210729100146.GA8648@alpha.franken.de>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 29 Jul 2021 13:21:45 +0200
Message-ID: <CAMhs-H-9=H2cTMtQxE_DUMraJ1KVNjOX2J-nO_RSdsyUUkSAMA@mail.gmail.com>
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

On Thu, Jul 29, 2021 at 12:02 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Mon, Jun 14, 2021 at 12:06:15PM +0200, Sergio Paracuellos wrote:
> > PCI_IOBASE is used to create VM maps for PCI I/O ports, it is
> > required by generic PCI drivers to make memory mapped I/O range
> > work. Hence define it for ralink architectures to be able to
> > avoid parsing manually IO ranges in PCI generic driver code.
> > Function 'plat_mem_setup' for ralink is using 'set_io_port_base'
> > call using '0xa0000000' as address, so use the same address in
> > the definition to align things.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  arch/mips/include/asm/mach-ralink/spaces.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >  create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h
> >
> > diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
> > new file mode 100644
> > index 000000000000..87d085c9ad61
> > --- /dev/null
> > +++ b/arch/mips/include/asm/mach-ralink/spaces.h
> > @@ -0,0 +1,10 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __ASM_MACH_RALINK_SPACES_H_
> > +#define __ASM_MACH_RALINK_SPACES_H_
> > +
> > +#define PCI_IOBASE   _AC(0xa0000000, UL)
> > +#define PCI_IOSIZE   SZ_16M
> > +#define IO_SPACE_LIMIT       (PCI_IOSIZE - 1)
> > +
> > +#include <asm/mach-generic/spaces.h>
> > +#endif
>
> does this really work for you ? I tried the same trick for RB532
> and the generated IO addresses are wrong...

I got pci io resources assigned without complaints from the pci core
code. I don't have real pci card that uses I/O bars but this is what I
see in the boot (I added some traces when I was testing this):

[   16.128328] mt7621-pci 1e140000.pcie: host bridge /pcie@1e140000 ranges:
[   16.141595] mt7621-pci 1e140000.pcie:   No bus range found for
/pcie@1e140000, using [bus 00-ff]
[   16.159047] mt7621-pci 1e140000.pcie:      MEM
0x0060000000..0x006fffffff -> 0x0060000000
[   16.189608] mt7621-pci 1e140000.pcie:       IO
0x001e160000..0x001e16ffff -> 0x0000000000
[   16.205847] pci_address_to_pio: addr: 0x1e160000
[   16.214992] LOGIC PIO: PIO TO CPUADDR: ADDR: 0x1e160000 -  addr
HW_START: 0x1e160000 + RANGE IO: 0x00000000
[   16.234344] OF: IO START returned by pci_address_to_pio: 0x0-0xffff
[   16.496670] mt7621-pci 1e140000.pcie: PCIE0 enabled
[   16.506230] mt7621-pci 1e140000.pcie: PCIE1 enabled
[   16.515930] mt7621-pci 1e140000.pcie: PCIE2 enabled
[   16.525604] mt7621-pci 1e140000.pcie: PCI coherence region base:
0x60000000, mask/settings: 0xf0000002
[   16.544284] mt7621-pci 1e140000.pcie: PCI host bridge to bus 0000:00
[   16.556823] pci_bus 0000:00: root bus resource [bus 00-ff]
[   16.567678] pci_bus 0000:00: root bus resource [mem 0x60000000-0x6fffffff]
[   16.581321] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[   16.593658] pci 0000:00:00.0: [0e8d:0801] type 01 class 0x060400
[   16.605533] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x7fffffff]
[   16.617969] pci 0000:00:00.0: reg 0x14: [mem 0x00000000-0x0000ffff]
[   16.630490] pci 0000:00:00.0: supports D1
[   16.638344] pci 0000:00:00.0: PME# supported from D0 D1 D3hot
[   16.650599] pci 0000:00:01.0: [0e8d:0801] type 01 class 0x060400
[   16.662488] pci 0000:00:01.0: reg 0x10: [mem 0x00000000-0x7fffffff]
[   16.674885] pci 0000:00:01.0: reg 0x14: [mem 0x00000000-0x0000ffff]
[   16.687411] pci 0000:00:01.0: supports D1
[   16.695241] pci 0000:00:01.0: PME# supported from D0 D1 D3hot
[   16.707497] pci 0000:00:02.0: [0e8d:0801] type 01 class 0x060400
[   16.719387] pci 0000:00:02.0: reg 0x10: [mem 0x00000000-0x7fffffff]
[   16.731786] pci 0000:00:02.0: reg 0x14: [mem 0x00000000-0x0000ffff]
[   16.744301] pci 0000:00:02.0: supports D1
[   16.752171] pci 0000:00:02.0: PME# supported from D0 D1 D3hot
[   16.765367] pci 0000:00:00.0: bridge configuration invalid ([bus
00-00]), reconfiguring
[   16.781193] pci 0000:00:01.0: bridge configuration invalid ([bus
00-00]), reconfiguring
[   16.797068] pci 0000:00:02.0: bridge configuration invalid ([bus
00-00]), reconfiguring
[   16.813255] pci 0000:01:00.0: [1b21:0611] type 00 class 0x010185
[   16.825112] pci 0000:01:00.0: reg 0x10: [io  0x0000-0x0007]
[   16.836145] pci 0000:01:00.0: reg 0x14: [io  0x0000-0x0003]
[   16.847201] pci 0000:01:00.0: reg 0x18: [io  0x0000-0x0007]
[   16.858258] pci 0000:01:00.0: reg 0x1c: [io  0x0000-0x0003]
[   16.869325] pci 0000:01:00.0: reg 0x20: [io  0x0000-0x000f]
[   16.880373] pci 0000:01:00.0: reg 0x24: [mem 0x00000000-0x000001ff]
[   16.892975] pci 0000:01:00.0: 2.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x1 link at 0000:00:00.0 (capable of 4.000
Gb/s with 5.0 GT/s PCIe x1 link)
[   16.947735] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[   16.958035] pci 0000:00:00.0:   bridge window [io  0x0000-0x0fff]
[   16.970104] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
[   16.983577] pci 0000:00:00.0:   bridge window [mem
0x00000000-0x000fffff pref]
[   16.997928] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[   17.011323] pci 0000:02:00.0: [1b21:0611] type 00 class 0x010185
[   17.023177] pci 0000:02:00.0: reg 0x10: [io  0x0000-0x0007]
[   17.034212] pci 0000:02:00.0: reg 0x14: [io  0x0000-0x0003]
[   17.045261] pci 0000:02:00.0: reg 0x18: [io  0x0000-0x0007]
[   17.056326] pci 0000:02:00.0: reg 0x1c: [io  0x0000-0x0003]
[   17.067405] pci 0000:02:00.0: reg 0x20: [io  0x0000-0x000f]
[   17.078442] pci 0000:02:00.0: reg 0x24: [mem 0x00000000-0x000001ff]
[   17.091042] pci 0000:02:00.0: 2.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x1 link at 0000:00:01.0 (capable of 4.000
Gb/s with 5.0 GT/s PCIe x1 link)
[   17.147757] pci 0000:00:01.0: PCI bridge to [bus 02-ff]
[   17.158059] pci 0000:00:01.0:   bridge window [io  0x0000-0x0fff]
[   17.170127] pci 0000:00:01.0:   bridge window [mem 0x00000000-0x000fffff]
[   17.183601] pci 0000:00:01.0:   bridge window [mem
0x00000000-0x000fffff pref]
[   17.197951] pci_bus 0000:02: busn_res: [bus 02-ff] end is updated to 02
[   17.211347] pci 0000:03:00.0: [1b21:0611] type 00 class 0x010185
[   17.223202] pci 0000:03:00.0: reg 0x10: [io  0x0000-0x0007]
[   17.234235] pci 0000:03:00.0: reg 0x14: [io  0x0000-0x0003]
[   17.245284] pci 0000:03:00.0: reg 0x18: [io  0x0000-0x0007]
[   17.256349] pci 0000:03:00.0: reg 0x1c: [io  0x0000-0x0003]
[   17.267418] pci 0000:03:00.0: reg 0x20: [io  0x0000-0x000f]
[   17.278463] pci 0000:03:00.0: reg 0x24: [mem 0x00000000-0x000001ff]
[   17.291064] pci 0000:03:00.0: 2.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x1 link at 0000:00:02.0 (capable of 4.000
Gb/s with 5.0 GT/s PCIe x1 link)
[   17.347738] pci 0000:00:02.0: PCI bridge to [bus 03-ff]
[   17.358037] pci 0000:00:02.0:   bridge window [io  0x0000-0x0fff]
[   17.370107] pci 0000:00:02.0:   bridge window [mem 0x00000000-0x000fffff]
[   17.383580] pci 0000:00:02.0:   bridge window [mem
0x00000000-0x000fffff pref]
[   17.397930] pci_bus 0000:03: busn_res: [bus 03-ff] end is updated to 03
[   17.411132] pci 0000:00:00.0: BAR 0: no space for [mem size 0x80000000]
[   17.424186] pci 0000:00:00.0: BAR 0: failed to assign [mem size 0x80000000]
[   17.438017] pci 0000:00:01.0: BAR 0: no space for [mem size 0x80000000]
[   17.451148] pci 0000:00:01.0: BAR 0: failed to assign [mem size 0x80000000]
[   17.464970] pci 0000:00:02.0: BAR 0: no space for [mem size 0x80000000]
[   17.478109] pci 0000:00:02.0: BAR 0: failed to assign [mem size 0x80000000]
[   17.491934] pci 0000:00:00.0: BAR 8: assigned [mem 0x60000000-0x600fffff]
[   17.505407] pci 0000:00:00.0: BAR 9: assigned [mem
0x60100000-0x601fffff pref]
[   17.519752] pci 0000:00:01.0: BAR 8: assigned [mem 0x60200000-0x602fffff]
[   17.533233] pci 0000:00:01.0: BAR 9: assigned [mem
0x60300000-0x603fffff pref]
[   17.547583] pci 0000:00:02.0: BAR 8: assigned [mem 0x60400000-0x604fffff]
[   17.561049] pci 0000:00:02.0: BAR 9: assigned [mem
0x60500000-0x605fffff pref]
[   17.575396] pci 0000:00:00.0: BAR 1: assigned [mem 0x60600000-0x6060ffff]
[   17.588880] pci 0000:00:01.0: BAR 1: assigned [mem 0x60610000-0x6061ffff]
[   17.602354] pci 0000:00:02.0: BAR 1: assigned [mem 0x60620000-0x6062ffff]
[   17.615840] pci 0000:00:00.0: BAR 7: assigned [io  0x0000-0x0fff]
[   17.627927] pci 0000:00:01.0: BAR 7: assigned [io  0x1000-0x1fff]
[   17.640017] pci 0000:00:02.0: BAR 7: assigned [io  0x2000-0x2fff]
[   17.652131] pci 0000:01:00.0: BAR 5: assigned [mem 0x60000000-0x600001ff]
[   17.665595] pci 0000:01:00.0: BAR 4: assigned [io  0x0000-0x000f]
[   17.677700] pci 0000:01:00.0: BAR 0: assigned [io  0x0010-0x0017]
[   17.689792] pci 0000:01:00.0: BAR 2: assigned [io  0x0018-0x001f]
[   17.701883] pci 0000:01:00.0: BAR 1: assigned [io  0x0020-0x0023]
[   17.713985] pci 0000:01:00.0: BAR 3: assigned [io  0x0024-0x0027]
[   17.726080] pci 0000:00:00.0: PCI bridge to [bus 01]
[   17.735924] pci 0000:00:00.0:   bridge window [io  0x0000-0x0fff]
[   17.748029] pci 0000:00:00.0:   bridge window [mem 0x60000000-0x600fffff]
[   17.761494] pci 0000:00:00.0:   bridge window [mem
0x60100000-0x601fffff pref]
[   17.775852] pci 0000:02:00.0: BAR 5: assigned [mem 0x60200000-0x602001ff]
[   17.789326] pci 0000:02:00.0: BAR 4: assigned [io  0x1000-0x100f]
[   17.801416] pci 0000:02:00.0: BAR 0: assigned [io  0x1010-0x1017]
[   17.813525] pci 0000:02:00.0: BAR 2: assigned [io  0x1018-0x101f]
[   17.825608] pci 0000:02:00.0: BAR 1: assigned [io  0x1020-0x1023]
[   17.837711] pci 0000:02:00.0: BAR 3: assigned [io  0x1024-0x1027]
[   17.849804] pci 0000:00:01.0: PCI bridge to [bus 02]
[   17.859642] pci 0000:00:01.0:   bridge window [io  0x1000-0x1fff]
[   17.871752] pci 0000:00:01.0:   bridge window [mem 0x60200000-0x602fffff]
[   17.885217] pci 0000:00:01.0:   bridge window [mem
0x60300000-0x603fffff pref]
[   17.899573] pci 0000:03:00.0: BAR 5: assigned [mem 0x60400000-0x604001ff]
[   17.913051] pci 0000:03:00.0: BAR 4: assigned [io  0x2000-0x200f]
[   17.925141] pci 0000:03:00.0: BAR 0: assigned [io  0x2010-0x2017]
[   17.937246] pci 0000:03:00.0: BAR 2: assigned [io  0x2018-0x201f]
[   17.949339] pci 0000:03:00.0: BAR 1: assigned [io  0x2020-0x2023]
[   17.961433] pci 0000:03:00.0: BAR 3: assigned [io  0x2024-0x2027]
[   17.973529] pci 0000:00:02.0: PCI bridge to [bus 03]
[   17.983367] pci 0000:00:02.0:   bridge window [io  0x2000-0x2fff]
[   17.995470] pci 0000:00:02.0:   bridge window [mem 0x60400000-0x604fffff]
[   18.008956] pci 0000:00:02.0:   bridge window [mem
0x60500000-0x605fffff pref]

So the returned address range is the one that is finally being assigned.

Is this wrong?

Best regards,
    Sergio Paracuellos

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
