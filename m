Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6DC2E82AC
	for <lists+linux-mips@lfdr.de>; Fri,  1 Jan 2021 00:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgLaXwg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 31 Dec 2020 18:52:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgLaXwf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 31 Dec 2020 18:52:35 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D3EC061573;
        Thu, 31 Dec 2020 15:51:55 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id 11so19082121oty.9;
        Thu, 31 Dec 2020 15:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CgirU3jbgRz3+G138o2SGfe8IWwZXTAb4h9Spq6+8ec=;
        b=OMQvxrXMGT0/zqM6fVnT7WGWlbNXJm1/hjcWGgy3IGMAbhDo0cJuYXhfvEMl7hsKlr
         dhqrrGhgjOcBizufq67Fi6SI3xdBfVXrI8VFoVktO3FH70s/LO7fb7D0D39CZ2QyA51T
         2/blES+xfRox+hLqwTG3SiYTcTgDgvrjsfsD0pz3rcsXfONbTnWu3dyOkgsSaDBsfWKe
         /vsMNE3I4W52xxeP/hVpzrOf3JW2Yg92pi+0EYrHPTBqPA0bnH3AVyE9Aq7bSGzT9zu+
         4e2pZFaq5mc9XK3HGcLtQ1YaLG9fEBl8lgkkuyS/xrD8lOqviF6CdfZZIIYeIh6AaKdl
         LLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CgirU3jbgRz3+G138o2SGfe8IWwZXTAb4h9Spq6+8ec=;
        b=Jg0JZLSqzau19Ue3DbzWc/v5HzrCj7B8KwuuVtxKpseZmgt8W4AZWS8mHtvv12NalK
         MD/6LG53PYm2kaDA9LdpQbn4liyTxcwB+nK6uRNFnA6qg5y9r57C1q23lcdHM7qlRplt
         sbSkCHni/+vT/2VMylLaeCQMBq+626KNUpmpD4rcqjS5JmEuedHKM3EaQD6y7GlgyXvW
         H1OGqz9rd0W8zy0LBjTqMy5ZH07b4tcZbJMoR1eSCYrblEbxRdLCessDdOOnRPlHuXLc
         gMFbLDuTfQKfFggH4v3EHZiIrlJVb+O0JCXF15NY2/afUlp3jSM53hdpn+XFDY0tzCSi
         I6tA==
X-Gm-Message-State: AOAM531xZ9qNsW4usWczs1JPxs9oohZs7mTg7/S4j8IQ6JdOmy+ucHyV
        nnENaHTAPKs8IGaI9Pfr0UtD9bjhGtgsJ0nIyws=
X-Google-Smtp-Source: ABdhPJyZrynHxYpOS+k4Vszc+yi6fPH73x5z0pmjUonPpnGHf38Ml/NpTQ/Uk5bDvUGsnyHCGduSS1VWP7ucRx9xMz0=
X-Received: by 2002:a9d:2248:: with SMTP id o66mr28322045ota.236.1609458713146;
 Thu, 31 Dec 2020 15:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20201220093724.4906-1-sergio.paracuellos@gmail.com>
 <20201220093724.4906-3-sergio.paracuellos@gmail.com> <20201231223843.GA2494920@robh.at.kernel.org>
In-Reply-To: <20201231223843.GA2494920@robh.at.kernel.org>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 1 Jan 2021 00:51:42 +0100
Message-ID: <CAMhs-H879dSo3CouwA7OPo-W=BO3-mMSx225+q2G1wR3E-DHdA@mail.gmail.com>
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

Hi Rob,

Thanks for the review.

On Thu, Dec 31, 2020 at 11:38 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Dec 20, 2020 at 10:37:20AM +0100, Sergio Paracuellos wrote:
> > Adds device tree binding documentation for clocks in the
> > MT7621 SOC.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  .../bindings/clock/mediatek,mt7621-clk.yaml   | 52 +++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> > new file mode 100644
> > index 000000000000..f58d01bdc82c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/mediatek,mt7621-clk.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MT7621 Clock Device Tree Bindings
> > +
> > +maintainers:
> > +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > +
> > +description: |
> > +  The MT7621 has a PLL controller from where the cpu clock is provided
> > +  as well as derived clocks for the bus and the peripherals. It also
> > +  can gate SoC device clocks.
> > +
> > +  Each clock is assigned an identifier and client nodes use this identifier
> > +  to specify the clock which they consume.
> > +
> > +  All these identifiers could be found in:
> > +  [1]: <include/dt-bindings/clock/mt7621-clk.h>.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt7621-clk
> > +
> > +  "#clock-cells":
> > +    description:
> > +      The first cell indicates the clock number, see [1] for available
> > +      clocks.
> > +    const: 1
> > +
> > +  clock-output-names:
> > +    maxItems: 8
> > +
> > +required:
> > +  - compatible
> > +  - '#clock-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt7621-clk.h>
> > +
> > +    pll {
> > +      compatible = "mediatek,mt7621-clk";
> > +      #clock-cells = <1>;
> > +      clock-output-names = "xtal", "cpu", "bus",
> > +                           "50m", "125m", "150m",
> > +                           "250m", "270m";
>
> How do you access this h/w. There's nothing defined like 'reg' or
> a parent node or...

Through read write operations defined in
"asm/mach-ralink/ralink_regs.h. Please, see my explanation below.

>
> The suggestion on v4 was to get rid of the child node by merging it with
> the parent like this:
>
> +    sysc: sysc@0 {
> +      compatible = "mediatek,mt7621-sysc", "syscon";
> +      reg = <0x0 0x100>;
> +      #clock-cells = <1>;
> +      clock-output-names = "xtal", "cpu", "bus",
> +                             "50m", "125m", "150m",
> +                             "250m", "270m";
> +    };
>
> Whether you need child nodes or not really depends on what all is in the
> 'mt7621-sysc' h/w block.

All the drivers in this platform make use of arch operations defined
in "asm/mach-ralink/ralink_regs.h". This mediatek,mt7621-sysc is
directly mapped by the architecture
in arch/mips/ralink/mt7621.c in function void __init
ralink_of_remap(void). This is the first address in the virtual space
and from here "rt_sysc_membase" and "rt_memc_membase" are used to
access the hardware control registers through read and write
operations. So "mediatek,mt7621-sysc" cannot be remapped from clock
driver. The benefits I found at first of using the syscon as child
node was to avoid the use of architecture dependant operations but at
the end I realized that we need to access another register which is
not in the syscon block and it is not also well documented so the use
of arch operations is mandatory to make things work. That's why I end
up in just follow the architecture driver style and use this in the
same way, trying to maintain as clean as possible. Is it ok then to
declare it as it is in this way?

>
> Rob

Best regards,
    Sergio Paracuellos
