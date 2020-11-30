Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0308B2C8862
	for <lists+linux-mips@lfdr.de>; Mon, 30 Nov 2020 16:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728460AbgK3PjL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Nov 2020 10:39:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:44286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727906AbgK3PjK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Nov 2020 10:39:10 -0500
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 932F62087C;
        Mon, 30 Nov 2020 15:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606750708;
        bh=/mwcAGKismYKxXjOUto0bcfFSTR7WENjNq8FNtV/FvQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2aIc5WU4ggx2WEIptvhTRAMMko3vB/+/5Ij+oDy4TXGW9XlJkeGnBZmNnlCEoJrDh
         K5BshOCX5QZ43DT/2PynSqPgRH2pZUtjaCn3Mj/WCcEDXnetQ6AYqf3rjna0rE4qyF
         lOkF/qXz5oNnCQGi6hF7KALTiW7iVxvWrac+Yyls=
Received: by mail-ej1-f48.google.com with SMTP id f23so22665853ejk.2;
        Mon, 30 Nov 2020 07:38:28 -0800 (PST)
X-Gm-Message-State: AOAM533BbnCLHzoP5UnPf6F2oQ6Z4ZjoTVYpvAf+j33w6E0pHV2ndLkK
        zdAoFkBhDj7Hl4jAG2zmoI9oyAQqgity0H58Ow==
X-Google-Smtp-Source: ABdhPJwfi/bEMZouaafRm5GbGn1YKFdYDmO1WDNjm1A+nVHVN3DMiM3lra3WgVaV1huC2tZ8DwNzz0146k2O8pmy8Hk=
X-Received: by 2002:a17:907:2718:: with SMTP id w24mr15750107ejk.525.1606750707036;
 Mon, 30 Nov 2020 07:38:27 -0800 (PST)
MIME-Version: 1.0
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-11-Sergey.Semin@baikalelectronics.ru>
 <20201111201423.GA1938179@bogus> <20201112102946.ipcsiidty4ut4kap@mobilestation>
 <20201121124228.GA2039998@robh.at.kernel.org> <20201125083202.ytoyd62bg3s7kvvg@mobilestation>
In-Reply-To: <20201125083202.ytoyd62bg3s7kvvg@mobilestation>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 30 Nov 2020 08:38:13 -0700
X-Gmail-Original-Message-ID: <CAL_JsqKscjEgArQDbdEgbdNfC7PGVku7Wmk1myjADpsBWqJt+g@mail.gmail.com>
Message-ID: <CAL_JsqKscjEgArQDbdEgbdNfC7PGVku7Wmk1myjADpsBWqJt+g@mail.gmail.com>
Subject: Re: [PATCH v4 10/18] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Nov 25, 2020 at 1:32 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> On Sat, Nov 21, 2020 at 06:42:28AM -0600, Rob Herring wrote:
> > On Thu, Nov 12, 2020 at 01:29:46PM +0300, Serge Semin wrote:
> > > On Wed, Nov 11, 2020 at 02:14:23PM -0600, Rob Herring wrote:
> > > > On Wed, Nov 11, 2020 at 12:08:45PM +0300, Serge Semin wrote:
> > > > > DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> > > > > Controller schema, but with additional vendor-specific properties, the
> > > > > controller-specific reference clocks and PHYs. So let's convert the
> > > > > currently available legacy text-based DWC USB3 bindings to the DT schema
> > > > > and make sure the DWC USB3 nodes are also validated against the
> > > > > usb-xhci.yaml schema.
> > > > >
> > > > > Note we have to discard the nodename restriction of being prefixed with
> > > > > "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> > > > > are supposed to be named as "^usb(@.*)".
> > > > >
> > > > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > > >
> > > > > ---
> > > > >
> > > > > Changelog v2:
> > > > > - Discard '|' from the descriptions, since we don't need to preserve
> > > > >   the text formatting in any of them.
> > > > > - Drop quotes from around the string constants.
> > > > > - Fix the "clock-names" prop description to be referring the enumerated
> > > > >   clock-names instead of the ones from the Databook.
> > > > >
> > > > > Changelog v3:
> > > > > - Apply usb-xhci.yaml# schema only if the controller is supposed to work
> > > > >   as either host or otg.
> > > > >
> > > > > Changelog v4:
> > > > > - Apply usb-drd.yaml schema first. If the controller is configured
> > > > >   to work in a gadget mode only, then apply the usb.yaml schema too,
> > > > >   otherwise apply the usb-xhci.yaml schema.
> > > > > - Discard the Rob'es Reviewed-by tag. Please review the patch one more
> > > > >   time.
> > > > > ---
> > > > >  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
> > > > >  .../devicetree/bindings/usb/snps,dwc3.yaml    | 303 ++++++++++++++++++
> > > > >  2 files changed, 303 insertions(+), 125 deletions(-)
> > > > >  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
> > > > >  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> >
> >
> > > > > diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..079617891da6
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > > > > @@ -0,0 +1,303 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Synopsys DesignWare USB3 Controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Felipe Balbi <balbi@kernel.org>
> > > > > +
> > > > > +description:
> > > > > +  This is usually a subnode to DWC3 glue to which it is connected, but can also
> > > > > +  be presented as a standalone DT node with an optional vendor-specific
> > > > > +  compatible string.
> > > > > +
> > >
> > > > > +allOf:
> > > > > +  - $ref: usb-drd.yaml#
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        dr_mode:
> > > > > +          const: peripheral
> >
>
> > Another thing, this evaluates to true if dr_mode is not present. You
> > need to add 'required'?
>
> Right. Will something like this do that?

Yes.

>
> + allOf:
> +  - $ref: usb-drd.yaml#
> +  - if:
> +      properties:
> +        dr_mode:
> +          const: peripheral
> +
> +      required:
> +        - dr_mode
> +    then:
> +      $ref: usb.yaml#
> +    else
> +      $ref: usb-xhci.yaml#
>
> > If dr_mode is otg, then don't you need to apply
> > both usb.yaml and usb-xhci.yaml?
>
> No I don't. Since there is no peripheral-specific DT schema, then the
> only schema any USB-gadget node needs to pass is usb.yaml, which
> is already included into the usb-xhci.yaml schema. So for pure OTG devices
> with xHCI host and gadget capabilities it's enough to evaluate: allOf:
> [$ref: usb-drd.yaml#, $ref: usb-xhci.yaml#].  Please see the
> sketch/ASCII-figure below and the following text for details.

Okay.

Rob
