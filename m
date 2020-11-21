Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEBE12BC081
	for <lists+linux-mips@lfdr.de>; Sat, 21 Nov 2020 17:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgKUQXL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Nov 2020 11:23:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgKUQXK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 21 Nov 2020 11:23:10 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E60C0613CF;
        Sat, 21 Nov 2020 08:23:10 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id y24so6263376otk.3;
        Sat, 21 Nov 2020 08:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vtqi5ij/e5CH5+ZSs3AhBza3/9+Xfa/5fcKnLK+RPrA=;
        b=kIH+iFQ3BUUlg+tlGd6B2l+hKxKVyuNrTGmH7ZplX/4YI3bLDPBG+pPEzpS1JmX5ra
         kWucpgdF77cerMO2nidi832uxf5heJTbjCINUKtV2KwgIgPV/JTfBO5cC8XdDxICzOOe
         oY8Za9uwR+hf2YiMarDaacIQ05CIMs4U+H73saGY6crN20QArp60mJmhVCpJp5fuvcST
         eyN1qO8TyraFDOdelomYyLkAohbWu/hooAqGtnwvSP2U+45r8L5vbZxHMVGlfcUSAtQ3
         uHr+GdAclrYIpLBUONIZ7CXOqvweqhr01AZbmj1NGhhH0PPLgaWMO8t4ZOptUREd/+F2
         FRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vtqi5ij/e5CH5+ZSs3AhBza3/9+Xfa/5fcKnLK+RPrA=;
        b=gSBnlc90MA3Sz1ZOuCREvXqBXNjraAh6Dnm+EoYJWE6Azxue9/Vo7tS0MJ3xp2ynWR
         9mX+LLqAwfAAWG9cKf/pBwnY+7T0WQicqENQbfZmv9PuNabT5PbbqmR7Tn0gzAITvb2A
         d6gB1b6uL7mLftTv/oY5IY6QU+BvxRDKADZWv48KxkTN7QgfvoCWAnGBSruEZVpnId0q
         IJtXuWvcLJ4/shuVlivwK/pNfAUMtO2IzdcNK+6n3vxOg8oltc1yPlObXkUNusiv6ad1
         8D9yYOJ1HenrGEn0WYrRj5fynKC4ZXeWk8Qsgmjprg9709rRBhBZ5E9jqq68cYDbuxze
         KQTQ==
X-Gm-Message-State: AOAM530DCY1jIfKFCxp2x4y6hRvr5BthQQi1hhua7qRJQiMMzspQBF/M
        yksdJ1MjyPAbcOa3ya2sE8DoLgscdPOpWJuYs08=
X-Google-Smtp-Source: ABdhPJy8urnKhAW4YsIazNFzsark40KJjqxtfB85kGu9EHtyM8tHCU7JMU3OzFlZfGtRgtq6e2t1fXXP0fPdR2VsiL4=
X-Received: by 2002:a05:6830:160d:: with SMTP id g13mr6763788otr.74.1605975789695;
 Sat, 21 Nov 2020 08:23:09 -0800 (PST)
MIME-Version: 1.0
References: <20201113154632.24973-1-sergio.paracuellos@gmail.com>
 <20201113154632.24973-3-sergio.paracuellos@gmail.com> <20201121133432.GA2130098@robh.at.kernel.org>
 <CAMhs-H9JORHgPmq0-n=hx=yRo0SCT33mP_quxZoRtKYkiVDy_Q@mail.gmail.com>
In-Reply-To: <CAMhs-H9JORHgPmq0-n=hx=yRo0SCT33mP_quxZoRtKYkiVDy_Q@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sat, 21 Nov 2020 17:22:58 +0100
Message-ID: <CAMhs-H8j+OYmBuj-ZzTUr7jFYokS0H4+DSa-QCa4R=Fm00aagw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt: bindings: add mt7621-clk device tree binding documentation
To:     Rob Herring <robh@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <hackpascal@gmail.com>, jiaxun.yang@flygoat.com,
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

On Sat, Nov 21, 2020 at 3:50 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi Rob,
>
> Thanks for the review.
>
> On Sat, Nov 21, 2020 at 2:34 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Nov 13, 2020 at 04:46:29PM +0100, Sergio Paracuellos wrote:
> > > Adds device tree binding documentation for clocks in the
> > > MT7621 SOC.
> > >
> > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > ---
> > >  .../bindings/clock/mediatek,mt7621-clk.yaml   | 61 +++++++++++++++++++
> > >  1 file changed, 61 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> > > new file mode 100644
> > > index 000000000000..363bd9880e29
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> > > @@ -0,0 +1,61 @@
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
> > > +  ralink,sysctl:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description:
> > > +      phandle to the syscon which is in the same address area with syscon
> > > +      device.
> > > +
> > > +  "#clock-cells":
> > > +    description:
> > > +      The first cell indicates the clock gate number, see [1] for available
> > > +      clocks.
> > > +    const: 1
> > > +
> > > +  clock-output-names:
> > > +    maxItems: 8
> > > +
> > > +required:
> > > +  - compatible
> > > +  - ralink,sysctl
> > > +  - '#clock-cells'
> > > +  - clock-output-names
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/mt7621-clk.h>
> > > +
> > > +    pll {
> > > +      compatible = "mediatek,mt7621-clk";
> > > +      ralink,sysctl = <&sysc>;
> >
> > If this is the only control interface, then make this a child of 'sysc'.
> > And use 'reg' if there's a dedicated range of registers.
>
> This is the only one now in the device tree which is still in staging
> but there are several places where this sys control registers are
> accessed from. In the case of the clocks we need:
>
> #define SYSC_REG_SYSTEM_CONFIG0         0x10
> #define SYSC_REG_SYSTEM_CONFIG1         0x14
> #define SYSC_REG_CLKCFG0                0x2c
> #define SYSC_REG_CLKCFG1                0x30
> #define SYSC_REG_CUR_CLK_STS            0x44
>
> where there is not a range as it is but several different registers
> from where we need to read or write things. I wrote the driver using
> syscon and regmap because I thought in that way it might be more
> maintainable but this architecture also has operations to read and
> write registers from sysc and not using regmap at all. This operations
> are defined in arch/mips/include/asm/mach-ralink/ralink_regs.h. But
> because this sysc is currently mapped I cannot request its registers
> using reg in the device tree. If you prefer me to avoid the use of
> this syscon and regmap and use operations defined in ralink_regs.h,
> this will become in a node without "regs" or  "ralink,sysctl"
> property:
>
> pll {
>     compatible = "mediatek,mt7621-clk";
>     #clock-cells = <1>;
>     clock-output-names = "xtal", "cpu", "bus",
>                       "50m", "125m", "150m",
>                        "250m", "270m";
> };
>
> What should I do then?

Ok, I think I understand now what you are saying. You meant just move
this as a child if 'sysc' and
avoid the phandle:

    sysc: sysc@0 {
            compatible = "mtk,mt7621-sysc", "syscon";
            reg = <0x0 0x100>;

            pll: pll {
                compatible = "mediatek,mt7621-clk";
                #clock-cells = <1>;
                clock-output-names = "xtal", "cpu", "bus",
                                  "50m", "125m", "150m",
                                 "250m", "270m";
            };
        };

And because there is not a range of registers 'reg' property is not
needed, right?

And in the driver side make use of 'syscon_node_to_regmap(node->parent)' instead
of 'syscon_regmap_lookup_by_phandle(node, "ralink,sysctl")'.

Ok, thanks for the clarification. Will change when v4 is sent.

Best regards,
    Sergio Paracuellos
>
> Best regards,
>     Sergio Paracuellos
>
> >
> > > +      #clock-cells = <1>;
> > > +      clock-output-names = "xtal", "cpu", "bus",
> > > +                           "50m", "125m", "150m",
> > > +                           "250m", "270m";
> > > +    };
> > > --
> > > 2.25.1
> > >
