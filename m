Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFA82AEDE3
	for <lists+linux-mips@lfdr.de>; Wed, 11 Nov 2020 10:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbgKKJe0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Nov 2020 04:34:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:60774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727187AbgKKJeY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Nov 2020 04:34:24 -0500
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE41920759;
        Wed, 11 Nov 2020 09:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605087263;
        bh=W9LKJJA9td+bZqyMuy9lW4F+N9UwVvkc4npiuY6/nL8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sdXPT9ufwr9fVZcL/j8i0rSkPmF0K8kpJ0B3ps32DH54CpwRWCpudFmVohdzuLLqI
         mHImJstvBqkfY7Bv9QjqAwcj6zjhETFN9xiOuLzk89U/QDTQzxtFAaQVcY7piZs788
         ANoy8zWl2BQ66ujk5xvfZlBDd0yTXXNHLJG4NJKQ=
Received: by mail-oi1-f171.google.com with SMTP id k26so1527505oiw.0;
        Wed, 11 Nov 2020 01:34:23 -0800 (PST)
X-Gm-Message-State: AOAM531/tfu1fmxpW1CHqwRJIi44O8gJNCAD+Cj1Condi6uFMQwFLMB/
        QBhDfDkRC1g74x5gltk9ujcWlqjJ+jH95NnpMF8=
X-Google-Smtp-Source: ABdhPJxSx93RRc8sf7gftr2sW8DQOQItwMQjHP/P+aqjoIbJAaovKFXVmGh+T6eO80PhsSh1WpQNCpdbCpErwfeE5Gs=
X-Received: by 2002:aca:6004:: with SMTP id u4mr1701769oib.8.1605087262641;
 Wed, 11 Nov 2020 01:34:22 -0800 (PST)
MIME-Version: 1.0
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-11-Sergey.Semin@baikalelectronics.ru>
 <20201111091628.GC4050@kozik-lap> <20201111093213.gio6mrowjvmvnzoi@mobilestation>
In-Reply-To: <20201111093213.gio6mrowjvmvnzoi@mobilestation>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 11 Nov 2020 10:34:10 +0100
X-Gmail-Original-Message-ID: <CAJKOXPcYQjNvuyxYFn3f=YV+P+xSj=5tJckH8w8GgE=rMbeE6w@mail.gmail.com>
Message-ID: <CAJKOXPcYQjNvuyxYFn3f=YV+P+xSj=5tJckH8w8GgE=rMbeE6w@mail.gmail.com>
Subject: Re: [PATCH v4 10/18] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
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
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 11 Nov 2020 at 10:32, Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> On Wed, Nov 11, 2020 at 10:16:28AM +0100, Krzysztof Kozlowski wrote:
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
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> > > deleted file mode 100644
> > > index d03edf9d3935..000000000000
> > > --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> > > +++ /dev/null
> > > @@ -1,125 +0,0 @@
> > > -synopsys DWC3 CORE
> > > -
> > > -DWC3- USB3 CONTROLLER. Complies to the generic USB binding properties
> > > -      as described in 'usb/generic.txt'
> > > -
> > > -Required properties:
> > > - - compatible: must be "snps,dwc3"
> > > - - reg : Address and length of the register set for the device
> > > - - interrupts: Interrupts used by the dwc3 controller.
>
> > > - - clock-names: list of clock names. Ideally should be "ref",
> > > -                "bus_early", "suspend" but may be less or more.
> > > - - clocks: list of phandle and clock specifier pairs corresponding to
> > > -           entries in the clock-names property.
> > > -
> > > -Exception for clocks:
> > > -  clocks are optional if the parent node (i.e. glue-layer) is compatible to
> > > -  one of the following:
> > > -    "cavium,octeon-7130-usb-uctl"
> > > -    "qcom,dwc3"
> > > -    "samsung,exynos5250-dwusb3"
> > > -    "samsung,exynos5433-dwusb3"
> > > -    "samsung,exynos7-dwusb3"
> > > -    "sprd,sc9860-dwc3"
> > > -    "st,stih407-dwc3"
> > > -    "ti,am437x-dwc3"
> > > -    "ti,dwc3"
> > > -    "ti,keystone-dwc3"
> > > -    "rockchip,rk3399-dwc3"
> > > -    "xlnx,zynqmp-dwc3"
> >
> > What happened with this part of dtschema? It sees you removed it.
>
> You meant "bindings", right?
>
> I don't think it's a good idea to implement that weak binding in the
> generic DWC USB3 DT schema. Of course I could have created it under
> the allOf conditional schema and stuff. But in that case we would have
> needed to support the clock-related vendor-specific peculiarities in
> both the generic DWC USB3 DT schema and in the vendor-specific binding
> files. That wouldn't be that maintainable. As I see it all the
> vendor-specific clock requirements should be reflected in the
> glue-node DT schema. The DWC USB3 node binding just declares the
> clocks as optional. Moreover the DWC USB3 driver also considers them
> as optional.

Sure, rationale is good, but it needs to be explained in commit msg.
Otherwise you state that you just "convert" but it's not a simple
conversion. The meaning is changed.


Best regards,
Krzysztof
