Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C97392E86BB
	for <lists+linux-mips@lfdr.de>; Sat,  2 Jan 2021 09:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbhABIDP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 Jan 2021 03:03:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbhABIDO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 2 Jan 2021 03:03:14 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A4AC061573;
        Sat,  2 Jan 2021 00:02:34 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id a109so21509922otc.1;
        Sat, 02 Jan 2021 00:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7TExBCOw0LcZzYz3KFrFrscDhoNEJlWdv45jq74YsT8=;
        b=qKB9bDb5PcBsKvkTmthnz1v4GDBt2LCh18+IW8eYrWeKcquy5jF77bvAsb9VxyLim1
         N5/3mIGJ3EFpDOmsgxGOHb0zro24D/MJrOWCrhOq9/lWiOqQYdmTMMskQZbUXTuPTMxc
         J8YoR34TUpdGgNM/uqEAvfDx/+uFj9v6zJQrQiErwIwU0DY/12D0LB0PIlDeFKqo/zOn
         jkG7TMhQe6IJynfM3YLWMM6bBrSyLrhbNiCC2lApXoRRpBJxypRzpb1jqNgQSO4tqqL9
         3gBAhY6XXQpBxNdQ1bKRaicZ5jWDRUy3ipKuMMaKYVN1gm7O+Rge+3DxRcDz96O/DQck
         qKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7TExBCOw0LcZzYz3KFrFrscDhoNEJlWdv45jq74YsT8=;
        b=ppc3adc7zwhtVQ/5wn8fb2ydpH3JsHODOLdtwaSFvS8P64NN2kXUp9ARjkCvfSqWxI
         NqL6nWdy2DLhbETKD9rAX/4jsKDEBlzxjornSDYbuREBm/IsPLyyd9NYrpTvs/gV0p2g
         REaPtxQmxDNJ0xdTzD/nJlD2Zx8AVU+i2meNE8pr/pDsDuZ7v+VENfco1HpS/Fl75RHK
         /p/svGw3HX+ecSm+ytO27vo7+l0cB0JJ5269dDpk19SGNwu6eS3rJV4TwjNrwPsdRNa+
         1K+L73G7NnNt8751qeouA37diI7S4EcZIIc8DgeWAF0c2kQrSGW8ywACHegBVUh/iJLo
         SESA==
X-Gm-Message-State: AOAM532Vdcs+k9jrR4ijb6goFIpsq+KSgq59l6NxejJUwoADNo2qQTJT
        R8e2AKrHFpbvFzRdRK3qDpn7g8YyuVfMHus/HXo=
X-Google-Smtp-Source: ABdhPJxFstD1Gid/QFTVPyjQ9kkAWZ/sJgFGNgXr3UsgvWN8isybmHw2/xKEjsNfbCvJ9arI4G0x0cNO0tEQTGveCUI=
X-Received: by 2002:a05:6830:2144:: with SMTP id r4mr47366759otd.72.1609574553599;
 Sat, 02 Jan 2021 00:02:33 -0800 (PST)
MIME-Version: 1.0
References: <20201220093724.4906-1-sergio.paracuellos@gmail.com>
 <20201220093724.4906-3-sergio.paracuellos@gmail.com> <20201231223843.GA2494920@robh.at.kernel.org>
 <CAMhs-H879dSo3CouwA7OPo-W=BO3-mMSx225+q2G1wR3E-DHdA@mail.gmail.com>
In-Reply-To: <CAMhs-H879dSo3CouwA7OPo-W=BO3-mMSx225+q2G1wR3E-DHdA@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sat, 2 Jan 2021 09:02:23 +0100
Message-ID: <CAMhs-H-15M5x22BEWKR_1mxxebmvMXp4EFpR51pU4=1wnKo+9A@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] dt: bindings: add mt7621-clk device tree binding documentation
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <hackpascal@gmail.com>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jan 1, 2021 at 12:51 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi Rob,
>
> Thanks for the review.

Hi again,

>
> On Thu, Dec 31, 2020 at 11:38 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Sun, Dec 20, 2020 at 10:37:20AM +0100, Sergio Paracuellos wrote:
> > > Adds device tree binding documentation for clocks in the
> > > MT7621 SOC.
> > >
> > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > ---
> > >  .../bindings/clock/mediatek,mt7621-clk.yaml   | 52 +++++++++++++++++++
> > >  1 file changed, 52 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> > > new file mode 100644
> > > index 000000000000..f58d01bdc82c
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> > > @@ -0,0 +1,52 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/clock/mediatek,mt7621-clk.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: MT7621 Clock Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > +
> > > +description: |
> > > +  The MT7621 has a PLL controller from where the cpu clock is provided
> > > +  as well as derived clocks for the bus and the peripherals. It also
> > > +  can gate SoC device clocks.
> > > +
> > > +  Each clock is assigned an identifier and client nodes use this identifier
> > > +  to specify the clock which they consume.
> > > +
> > > +  All these identifiers could be found in:
> > > +  [1]: <include/dt-bindings/clock/mt7621-clk.h>.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: mediatek,mt7621-clk
> > > +
> > > +  "#clock-cells":
> > > +    description:
> > > +      The first cell indicates the clock number, see [1] for available
> > > +      clocks.
> > > +    const: 1
> > > +
> > > +  clock-output-names:
> > > +    maxItems: 8
> > > +
> > > +required:
> > > +  - compatible
> > > +  - '#clock-cells'
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/mt7621-clk.h>
> > > +
> > > +    pll {
> > > +      compatible = "mediatek,mt7621-clk";
> > > +      #clock-cells = <1>;
> > > +      clock-output-names = "xtal", "cpu", "bus",
> > > +                           "50m", "125m", "150m",
> > > +                           "250m", "270m";
> >
> > How do you access this h/w. There's nothing defined like 'reg' or
> > a parent node or...
>
> Through read write operations defined in
> "asm/mach-ralink/ralink_regs.h. Please, see my explanation below.
>
> >
> > The suggestion on v4 was to get rid of the child node by merging it with
> > the parent like this:
> >
> > +    sysc: sysc@0 {
> > +      compatible = "mediatek,mt7621-sysc", "syscon";
> > +      reg = <0x0 0x100>;
> > +      #clock-cells = <1>;
> > +      clock-output-names = "xtal", "cpu", "bus",
> > +                             "50m", "125m", "150m",
> > +                             "250m", "270m";
> > +    };
> >
> > Whether you need child nodes or not really depends on what all is in the
> > 'mt7621-sysc' h/w block.
>
> All the drivers in this platform make use of arch operations defined
> in "asm/mach-ralink/ralink_regs.h". This mediatek,mt7621-sysc is
> directly mapped by the architecture
> in arch/mips/ralink/mt7621.c in function void __init
> ralink_of_remap(void). This is the first address in the virtual space
> and from here "rt_sysc_membase" and "rt_memc_membase" are used to
> access the hardware control registers through read and write
> operations. So "mediatek,mt7621-sysc" cannot be remapped from clock
> driver. The benefits I found at first of using the syscon as child
> node was to avoid the use of architecture dependant operations but at
> the end I realized that we need to access another register which is
> not in the syscon block and it is not also well documented so the use
> of arch operations is mandatory to make things work. That's why I end
> up in just follow the architecture driver style and use this in the
> same way, trying to maintain as clean as possible. Is it ok then to
> declare it as it is in this way?

Just to add a bit of more of information. So in the device tree we
currently have two nodes (drivers/staging/mt7621-dts/mt7621.dtsi):

sysc: sysc@0 {
    compatible = "mediatek,mt7621-sysc";
    reg = <0x0 0x100>;
};

memc: memc@5000 {
    compatible = "mediatek,mt7621-memc";
    reg = <0x5000 0x1000>;
};

from here "rt_sysc_membase" and "rt_memc_membase" are set and mapped
in arch/mips/ralink/mt7621.c in function ralink_of_remap:

rt_sysc_membase = plat_of_remap_node("mediatek,mt7621-sysc");
rt_memc_membase = plat_of_remap_node("mediatek,mt7621-memc");

'plat_of_remap_node' is a function common to all ramips architectures
that is implemented in arch/mips/ralink/of.c. There these nodes are
got from DT, a memory region is requested and at the end 'ioremap' is
called using the obtained resource range.

In clock driver, to make things work, we need to access six registers:
five in the sysc address space and one in the memc space. To do this
we can directly use (as I did in current v5 we are discussing here)
operations defined in "asm/mach-ralink/ralink_regs.h" that is the way
other drivers do. I don't know if there is another approach more
device-tree friendly. At the end I also pretend to get out from
staging all the stuff related with this platform and that also
includes its device tree, so I'd like to follow a correct approach
also for this clock node and driver which IMHO is something that we
really need.

Rob, can you please guide me in the correct approach to follow? Maybe
mark these two nodes as "syscon" and from driver code obtain a phandle
to them and use regmap in both of them to avoid the use of
asm/mach-ralink/ralink_regs.h operations? I think doing in this way
this include won't be needed in driver making things a bit "generic"
but I have never seen two syscon handlers in a DT node so I don't know
if this way is worse or better... What seems to be clear is that since
clock driver need to access both of address space from these two
nodes, child nodes seems to be a no way at all. Something like (not
tested at all):

#include <dt-bindings/clock/mt7621-clk.h>

sysc: sysc@0 {
    compatible = "mediatek,mt7621-sysc", "syscon";
    reg = <0x0 0x100>;
};

memc: memc@5000 {
    compatible = "mediatek,mt7621-memc", "syscon";
    reg = <0x5000 0x1000>;
};

pll {
    compatible = "mediatek,mt7621-clk";
    ralink,sysctl = <&sysc>;
    ralink,memctl = <&memc>;
    #clock-cells = <1>;
    clock-output-names = "xtal", "cpu", "bus",
                                        "50m", "125m", "150m",
                                         "250m", "270m";
};

Thanks in advance for your time and help.

Best regards,
    Sergio Paracuellos
