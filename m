Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B87E51CFD31
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2020 20:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730707AbgELSZ0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 May 2020 14:25:26 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:54564 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgELSZX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 May 2020 14:25:23 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id A05C6803088B;
        Tue, 12 May 2020 18:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zxp3zYwZ9_2x; Tue, 12 May 2020 21:25:17 +0300 (MSK)
Date:   Tue, 12 May 2020 21:25:14 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Olof Johansson <olof@lixom.net>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        SoC Team <soc@kernel.org>, <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: memory: Add Baikal-T1 L2-cache
 Control Block binding
Message-ID: <20200512182514.imlmmjhyz73dc6z7@mobilestation>
References: <20200306130731.938808030702@mail.baikalelectronics.ru>
 <20200507230705.6468-1-Sergey.Semin@baikalelectronics.ru>
 <20200507230705.6468-2-Sergey.Semin@baikalelectronics.ru>
 <CAL_Jsq+rka7hXVy46=O3pTrN0DLCAQQ=TSpSqzoB2dxb30h66g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+rka7hXVy46=O3pTrN0DLCAQQ=TSpSqzoB2dxb30h66g@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 11, 2020 at 05:43:58PM -0500, Rob Herring wrote:
> On Thu, May 7, 2020 at 6:07 PM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > There is a single register provided by the SoC system controller,
> > which can be used to tune the L2-cache RAM up. It only provides a way
> > to change the L2-RAM access latencies. So aside from "be,bt1-l2-ctl"
> > compatible string the device node can be optionally equipped with the
> > properties of Tag/Data/WS latencies.
> >
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Olof Johansson <olof@lixom.net>
> > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > Cc: Paul Cercueil <paul@crapouillou.net>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: linux-mips@vger.kernel.org
> > Cc: soc@kernel.org
> >
> > ---
> >
> > Changelog v2:
> > - Move driver to the memory subsystem.
> > - Use dual GPL/BSD license.
> > - Use single lined copyright header.
> > - Move "allOf" restrictions to the root level of the properties.
> > - Discard syscon compatible string and reg property.
> > - The DT node is supposed to be a child of the Baikal-T1 system controller
> >   node.
> > ---
> >  .../memory-controllers/baikal,bt1-l2-ctl.yaml | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/baikal,bt1-l2-ctl.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/baikal,bt1-l2-ctl.yaml b/Documentation/devicetree/bindings/memory-controllers/baikal,bt1-l2-ctl.yaml
> > new file mode 100644
> > index 000000000000..263f0cdab4e6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/memory-controllers/baikal,bt1-l2-ctl.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/memory-controllers/baikal,bt1-l2-ctl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Baikal-T1 L2-cache Control Block
> > +
> > +maintainers:
> > +  - Serge Semin <fancer.lancer@gmail.com>
> > +
> > +description: |
> > +  By means of the System Controller Baikal-T1 SoC exposes a few settings to
> > +  tune the MIPS P5600 CM2 L2 cache performance up. In particular it's possible
> > +  to change the Tag, Data and Way-select RAM access latencies. Baikal-T1
> > +  L2-cache controller block is responsible for the tuning. Its DT node is
> > +  supposed to be a child of the system controller.
> 
> Is there a register range for just the L2 registers in the system
> controller. If so, please add a 'reg' property.

It's just a single register, though almost fully dedicated for this feature.
Should I add the reg property anyway? Since you touched this topic, aside from
this l2-control block the system controller has also got sub-blocks of PLLs, clock
dividers, reboot, reboot-mode and indirectly addressed i2c in the same MMIO space.
These blocks all have got a dedicated registers range within the syscon regmap
space. Shall I add an optional reg property for them too? If so shall their node
names to be in the regexp-format like "^name(@[0-9a-f]+)?" ?

> 
> This should all be part of the system controller schema either as 1
> file or by a $ref from the system controller to this file. That's how
> we ensure "supposed to be a child of the system controller".

Oh, that's clever solution. I was thinking of how to signify this parent-child
dependency. I'll add the $ref in the corresponding properties of the system
controller. So this DT schema should live here, separately from the syscon DT
node. Thanks for the note.

> 
> > +
> > +properties:
> > +  compatible:
> > +    const: baikal,bt1-l2-ctl
> > +
> > +  baikal,l2-ws-latency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Cycles of latency for Way-select RAM accesses
> > +    default: 0
> > +    minimum: 0
> > +    maximum: 3
> > +
> > +  baikal,l2-tag-latency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Cycles of latency for Tag RAM accesses
> > +    default: 0
> > +    minimum: 0
> > +    maximum: 3
> > +
> > +  baikal,l2-data-latency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Cycles of latency for Data RAM accesses
> > +    default: 1
> > +    minimum: 0
> > +    maximum: 3
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +
> > +examples:
> > +  - |
> > +    l2_ctl {
> > +      compatible = "baikal,bt1-l2-ctl";
> > +
> > +      baikal,l2-ws-latency = <0>;
> > +      baikal,l2-tag-latency = <0>;
> 
> 0 is the default, why list it?

1 is the default for the l2-data-latency too. Why not? It's just an
example.

-Sergey

> 
> > +      baikal,l2-data-latency = <1>;
> > +    };
> > +...
> > --
> > 2.25.1
> >
