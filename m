Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5D42BBEFD
	for <lists+linux-mips@lfdr.de>; Sat, 21 Nov 2020 13:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbgKUMml (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Nov 2020 07:42:41 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38967 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727531AbgKUMmk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 21 Nov 2020 07:42:40 -0500
Received: by mail-oi1-f193.google.com with SMTP id f11so13944384oij.6;
        Sat, 21 Nov 2020 04:42:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LXozwdRHE+FZ/b1kx40K82ndXVnop5+OHYheS/QS4jo=;
        b=YvqdqjLCCEqwFv32LV7yA6YjEXsxCx9s6yTqWS7V5PtJpsrfihoMX7Go8eIQqq676U
         q6gJ+Vw73RCLZZ3gR2IKfUtkk0GBGfqTKBzRWxOAMIXaAaT8SMC9V4cz3bpkofOSHoje
         1K8lMqVtFDAzIIyr9HqgODpS3/kvYB93/vUYUBsxKKfzgjOrb+N9VgOBgfYYDoeP/teK
         PamppFssgyCQHkzXOYGitu0aa47WD0akqG4ZIKMY3+JXsr2KC1THwxjZ63vC9k9656fw
         3jyGo0G9INJ81Q2qc3WHsF5U7NNeH8oDTrRFt2PsRsEmR2WfHPlTPzl8VXxovELM2ySz
         pUWw==
X-Gm-Message-State: AOAM5313D6hqgXwZ1JrHDc3sIFT+djJez6m1XET3TB/Y5ISp+EPmh6pA
        Cyi6c+9aUCZF8eDl5Ym/0Q==
X-Google-Smtp-Source: ABdhPJyZmtH8yI4iwnUoY7nWj64qFOXfpNj0wrhnUYk0B6zYwkPCqh8WJqMVW1w4lXiO0MnHEnfvKg==
X-Received: by 2002:a54:4394:: with SMTP id u20mr3639506oiv.70.1605962557518;
        Sat, 21 Nov 2020 04:42:37 -0800 (PST)
Received: from xps15 ([2607:fb90:5feb:6270:cdf7:680e:59f2:6ccd])
        by smtp.gmail.com with ESMTPSA id u4sm1581412ote.71.2020.11.21.04.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 04:42:36 -0800 (PST)
Received: (nullmailer pid 2064982 invoked by uid 1000);
        Sat, 21 Nov 2020 12:42:28 -0000
Date:   Sat, 21 Nov 2020 06:42:28 -0600
From:   Rob Herring <robh@kernel.org>
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
        linux-arm-kernel@lists.infradead.org,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/18] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
Message-ID: <20201121124228.GA2039998@robh.at.kernel.org>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-11-Sergey.Semin@baikalelectronics.ru>
 <20201111201423.GA1938179@bogus>
 <20201112102946.ipcsiidty4ut4kap@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112102946.ipcsiidty4ut4kap@mobilestation>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 12, 2020 at 01:29:46PM +0300, Serge Semin wrote:
> On Wed, Nov 11, 2020 at 02:14:23PM -0600, Rob Herring wrote:
> > On Wed, Nov 11, 2020 at 12:08:45PM +0300, Serge Semin wrote:
> > > DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> > > Controller schema, but with additional vendor-specific properties, the
> > > controller-specific reference clocks and PHYs. So let's convert the
> > > currently available legacy text-based DWC USB3 bindings to the DT schema
> > > and make sure the DWC USB3 nodes are also validated against the
> > > usb-xhci.yaml schema.
> > > 
> > > Note we have to discard the nodename restriction of being prefixed with
> > > "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> > > are supposed to be named as "^usb(@.*)".
> > > 
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > 
> > > ---
> > > 
> > > Changelog v2:
> > > - Discard '|' from the descriptions, since we don't need to preserve
> > >   the text formatting in any of them.
> > > - Drop quotes from around the string constants.
> > > - Fix the "clock-names" prop description to be referring the enumerated
> > >   clock-names instead of the ones from the Databook.
> > > 
> > > Changelog v3:
> > > - Apply usb-xhci.yaml# schema only if the controller is supposed to work
> > >   as either host or otg.
> > > 
> > > Changelog v4:
> > > - Apply usb-drd.yaml schema first. If the controller is configured
> > >   to work in a gadget mode only, then apply the usb.yaml schema too,
> > >   otherwise apply the usb-xhci.yaml schema.
> > > - Discard the Rob'es Reviewed-by tag. Please review the patch one more
> > >   time.
> > > ---
> > >  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
> > >  .../devicetree/bindings/usb/snps,dwc3.yaml    | 303 ++++++++++++++++++
> > >  2 files changed, 303 insertions(+), 125 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
> > >  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml


> > > diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > > new file mode 100644
> > > index 000000000000..079617891da6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > > @@ -0,0 +1,303 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Synopsys DesignWare USB3 Controller
> > > +
> > > +maintainers:
> > > +  - Felipe Balbi <balbi@kernel.org>
> > > +
> > > +description:
> > > +  This is usually a subnode to DWC3 glue to which it is connected, but can also
> > > +  be presented as a standalone DT node with an optional vendor-specific
> > > +  compatible string.
> > > +
> 
> > > +allOf:
> > > +  - $ref: usb-drd.yaml#
> > > +  - if:
> > > +      properties:
> > > +        dr_mode:
> > > +          const: peripheral

Another thing, this evaluates to true if dr_mode is not present. You 
need to add 'required'? If dr_mode is otg, then don't you need to apply 
both usb.yaml and usb-xhci.yaml?

> > > +    then:
> > > +      $ref: usb.yaml#
> > 
> > This part could be done in usb-drd.yaml?
> 
> Originally I was thinking about that, but then in order to minimize
> the properties validation I've decided to split the properties in
> accordance with the USB controllers functionality:
> 
>             +----- USB Gadget/Peripheral Controller. There is no
>             |      specific schema for the gadgets since there is no
>             |      common gadget properties (at least I failed to find
>             |      ones). So the pure gadget controllers need to be
>             |      validated just against usb.yaml schema.
>             |
> usb.yaml <--+-- usb-hcd.yaml - Generic USB Host Controller. The schema
>                 ^              turns out to include the OHCI/UHCI/EHCI
>                 |              properties, which AFAICS are also
>                 |              applicable for the other host controllers.
>                 |              So any USB host controller node needs to
>                 |              be validated against this schema.
>                 |
>                 +- usb-xhci.yaml - Generic xHCI Host controller.
> 
> usb-drd.yaml -- USB Dual-Role/OTG Controllers. It describes the
>                 DRD/OTG-specific properties and nothing else. So normally
>                 it should be applied together with one of the
>                 schemas described above.
> 
> So the use-cases of the suggested schemas is following:
> 
> 1) USB Controller is pure gadget? Then:
>    + allOf:
>    +  - $ref: usb.yaml#
> 2) USB Controller is pure USB host (including OHCI/UHCI/EHCI)?
>    + allOf:
>    +   - $ref: usb-hcd.yaml#
>    Note this prevents us from fixing all the currently available USB DT
>    schemas, which already apply the usb-hcd.yaml schema.
> 3) USB Controller is pure xHCI host controller? Then:
>    + allOf:
>    +   - $ref: usb-xhci.yaml#
> 4) USB Controller is Dual-Role/OTG controller with USB 2.0 host? Then:
>    + allOf:
>    +   - $ref: usb-drd.yaml#
>    +   - $ref: usb-hcd.yaml#
> 5) USB Controller is Dual-Role/OTG controller with xHCI host? Then:
>    + allOf:
>    +   - $ref: usb-drd.yaml#
>    +   - $ref: usb-xhci.yaml#
> 6) USB Controller is Dual-Role/OTG controller which can only be a
>    gadget? Then:
>    + allOf:
>    +   - $ref: usb-drd.yaml#
>    +   - $ref: usb.yaml#
> 
> * Don't know really if controllers like in 6)-th really exist. Most
> * likely they are still internally capable of dual-roling, but due to
> * some conditions can be used as gadgets only.
> 
> It looks a bit complicated, but at least by having such design we'd minimize
> the number of properties validation.
> 
> Alternatively we could implement a hierarchy like this (as you, Rob,
> suggested in the comment above): 
> 
>             +-- USB Gadget/Peripheral Controller
>             |
>             +-- usb-drd.yaml - USB Dual-Role/OTG Controllers
>             |   
> usb.yaml <--+-- usb-dcd.yaml - Generic USB Host Controller
>                 ^
>                 |
>                 +- usb-xhci.yaml - Generic xHCI Host controller
> 
> But, for instance, if we got to have an OTG controller with USB 2.0
> host capability, the schema would have needed to be validated as
> described in 4) in the list above. That would have caused the usb.yaml
> schema validation twice.
> 
> Of course I could have missed or misunderstood something. So any
> suggestion, any help with making things easier would be very
> appreciated. I asked Greg what he was thinking in this matter in
> the previous patchset thread, but he didn't respond.
> 
> > 
> > > +    else:
> > > +      $ref: usb-xhci.yaml#
> > 
> > I'd really prefer if all the schema can just be applied unconditionally. 
> > Shouldn't someone (like a bootloader) be able to change dr_mode without 
> > changing anything else to set the mode? That would imply all the 
> > schemas can be applied.
> 
> Theoretically it's possible, but I don't really know whether it can be
> practically met. Of course I fully agree with you and it's preferable to
> simplify the schema by getting rid of the condition if it's possible.
> 
> My point of using the conditional schema here has been based
> on the driver implementation. According to the driver code if OTG mode is
> enabled by means of the dr_mode property, then the controller can work as
> either host or gadget. If either host or gadget mode is enabled in
> the dr_mode property, the mode updating won't be supported. So any
> properties specific to the unsupported mode will be just ignored.
> 
> In addition to that DWC USB3 IP-core can be synthesized with different
> DWC_USB3_MODE parameter value. The controller can be either device
> (gadget), or host, or DRD, or HUB. In that case the dr_mode should be
> set in accordance with that parameter value. It means that the
> DWC USB3 controller will support the features in accordance with the
> selected parameter.
> 
> Should we really bother with all of that? Could we just apply the
> schema like: allOf: [$ref: usb-drd.yaml#, $ref: usb-hcd.yaml#] and
> have the things much easier seeing the host-specific properties aren't
> required anyway? That's the main question. I've decided to bother,
> since it give us a better hardware description. If you think it's better
> to keep things easier, I'll be ok with this. It won't be that
> contradicting to the hardware capabilities after all.

Okay, it's probably better to keep things like you have them given 
there's so many combinations of USB controllers.

Rob
