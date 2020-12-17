Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 061F92DCF04
	for <lists+linux-mips@lfdr.de>; Thu, 17 Dec 2020 11:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgLQKCc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Dec 2020 05:02:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgLQKCb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 17 Dec 2020 05:02:31 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94288C061794;
        Thu, 17 Dec 2020 02:01:51 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id p126so31547345oif.7;
        Thu, 17 Dec 2020 02:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E6B0n/kL/wMGsadSYxdkD92oI9sz7hCd/5Y5iCkTsO0=;
        b=JIDnTZ+dkTGkuqQbTjs277atgzSf45QR7PxZJm15m+B1hdcZZu6tvepplmoliRbc71
         6kz7HtKoUOVBC9zWWgtCeXxkkGIOyCTHiTJL23ZY8qrO3xAkUHa5RKyYvD36mrvSvWuX
         FTXHbHN88khTl8J4frq6c+aKhZUm65pJD9R0wQY6Gkmb3Wk/MixSm0aQaJBf3U2PnQyA
         cIlaxxdf1UKFHu9AKQ3RA5Li9gUwNRLEaX4CTxyMc1hgBz3PIcbQ7bxyuy+2lGObqd59
         3SUd99Wg2bIWKiKtqCcOE0c8EGRYluuPwP0CXNXklKT8U3FHmjQ5qiFyg8+ejETPWJGt
         2wmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E6B0n/kL/wMGsadSYxdkD92oI9sz7hCd/5Y5iCkTsO0=;
        b=AO+DZzq7+7GSIuNGlrjLFF5L9W6GA3xYfu7Xx/IIEaanOf8ycFoMWrPxTb1fjoua5s
         Zcj/YAdTaCKNbOTfFcecKTFI+pzRXNtiYykf6fPaPqrk5696CjCcIDxL0uLHJoek14el
         KoBr1FIxNyScX7S3sPovITy1U6ucXBiOUEfTZuArVxAr+2hixRjjIIDHwMHBPletNcK5
         0ylcYX16fu7D7fje8bJgOtL4KQ5IcDEL1DKoyIfTSjjtgTKC8jl8lahGFiMLDOLGotZF
         oR4W/gOpCwBZkBwqKT3ToQzgZ/Q2qJm0NwORTx3EAMHt1KUcQRya4tM2+XO2Zm0MPYcN
         L7Iw==
X-Gm-Message-State: AOAM531cv4gaNe59C9I05PMEoxFyXuWPEeyQh4Kfbwp1yDxFigOum5kh
        ZdpEdNeiPleigOkWggAp3CL4BASk9vTTLP3TOXE=
X-Google-Smtp-Source: ABdhPJyVAjAAhsdi/w80gubLXEKaWwlqeaqjo708M94kRNOPy7Ea3S0UCvh/YvNROEA7LxcBlQSdCVRMwUv+qWWBWiw=
X-Received: by 2002:aca:3ed5:: with SMTP id l204mr4328699oia.149.1608199311015;
 Thu, 17 Dec 2020 02:01:51 -0800 (PST)
MIME-Version: 1.0
References: <20201122095556.21597-1-sergio.paracuellos@gmail.com>
 <20201122095556.21597-3-sergio.paracuellos@gmail.com> <160819550615.1580929.14234996916739809712@swboyd.mtv.corp.google.com>
In-Reply-To: <160819550615.1580929.14234996916739809712@swboyd.mtv.corp.google.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 17 Dec 2020 11:01:39 +0100
Message-ID: <CAMhs-H_EiDot_V4Qj1Q8noAf5RNi9BOyy0WmawE+70wY7=FxDg@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] dt: bindings: add mt7621-clk device tree binding documentation
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <hackpascal@gmail.com>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        NeilBrown <neil@brown.name>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Stephen,

Thanks for the review!

On Thu, Dec 17, 2020 at 9:58 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Sergio Paracuellos (2020-11-22 01:55:52)
> > Adds device tree binding documentation for clocks in the
> > MT7621 SOC.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  .../bindings/clock/mediatek,mt7621-clk.yaml   | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> >
>
> Rob?
>
> > diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> > new file mode 100644
> > index 000000000000..6aca4c1a4a46
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> > @@ -0,0 +1,67 @@
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
> > +  The mt7621 clock node should be the child of a syscon node with the
> > +  required property:
> > +
> > +  - compatible: Should be one of the following:
> > +                "mediatek,mt7621-sysc", "syscon"
> > +
> > +  Refer to the bindings described in
> > +  Documentation/devicetree/bindings/mfd/syscon.yaml
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt7621-clk
> > +
> > +  "#clock-cells":
> > +    description:
> > +      The first cell indicates the clock gate number, see [1] for available
> > +      clocks.
> > +    const: 1
> > +
> > +  clock-output-names:
> > +    maxItems: 8
> > +
> > +required:
> > +  - compatible
> > +  - '#clock-cells'
> > +  - clock-output-names
>
> Why is clock-output-names required? Hopefully it is not required.

Not really, can be removed from here.

>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt7621-clk.h>
> > +
> > +    sysc: sysc@0 {
>
> syscon@0? I don't think sysc is a standard node name.

Ok, I will change this into syscon@0 in both bindings and device tree file.

>
> > +      compatible = "mediatek,mt7621-sysc", "syscon";
> > +      reg = <0x0 0x100>;
> > +
> > +      pll {
>
> clock-controller? Why can't the parent device be the clk provider and
> have #clock-cells?
>

I don't get your point, sorry. Can you please explain this a bit more
or point to me to an example to understand the real meaning of this?


> > +        compatible = "mediatek,mt7621-clk";
> > +        #clock-cells = <1>;
> > +        clock-output-names = "xtal", "cpu", "bus",
> > +                             "50m", "125m", "150m",
> > +                             "250m", "270m";
> > +      };
> > +    };

Best regards,
    Sergio Paracuellos
