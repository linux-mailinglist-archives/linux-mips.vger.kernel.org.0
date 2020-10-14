Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD4F28E56F
	for <lists+linux-mips@lfdr.de>; Wed, 14 Oct 2020 19:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389154AbgJNRhL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Oct 2020 13:37:11 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:49556 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388902AbgJNRhL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Oct 2020 13:37:11 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 0B34B803073E;
        Wed, 14 Oct 2020 17:37:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qiTZazrqpn09; Wed, 14 Oct 2020 20:37:08 +0300 (MSK)
Date:   Wed, 14 Oct 2020 20:37:06 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andy Gross <agross@kernel.org>, <linux-kernel@vger.kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        <linux-usb@vger.kernel.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Felipe Balbi <balbi@kernel.org>, Roger Quadros <rogerq@ti.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        <linux-snps-arc@lists.infradead.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 09/20] dt-bindings: usb: Convert DWC USB3 bindings to DT
 schema
Message-ID: <20201014173706.jojxkhdicyg62hlo@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-10-Sergey.Semin@baikalelectronics.ru>
 <20201014133219.GA1545403@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201014133219.GA1545403@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 14, 2020 at 08:32:19AM -0500, Rob Herring wrote:
> On Wed, 14 Oct 2020 13:13:51 +0300, Serge Semin wrote:
> > DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> > Controller schema, but with additional vendor-specific properties, the
> > controller-specific reference clocks and PHYs. So let's convert the
> > currently available legacy text-based DWC USB3 bindings to the DT schema
> > and make sure the DWC USB3 nodes are also validated against the
> > usb-xhci.yaml schema.
> > 
> > Note we have to discard the nodename restriction of being prefixed with
> > "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> > are supposed to be named as "^usb(@.*)".
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> > 
> > Changelog v2:
> > - Discard '|' from the descriptions, since we don't need to preserve
> >   the text formatting in any of them.
> > - Drop quotes from around the string constants.
> > - Fix the "clock-names" prop description to be referring the enumerated
> >   clock-names instead of the ones from the Databook.
> > ---
> >  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
> >  .../devicetree/bindings/usb/snps,dwc3.yaml    | 295 ++++++++++++++++++
> >  2 files changed, 295 insertions(+), 125 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
> >  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > 
> 
> 

> My bot found errors running 'make dt_binding_check' on your patch:
> 
> ./Documentation/devicetree/bindings/usb/snps,dwc3.yaml:44:4: [warning] wrong indentation: expected 4 but found 3 (indentation)
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: dwc3@a600000: $nodename:0: 'dwc3@a600000' does not match '^usb(@.*)?'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ff500000: snps,quirk-frame-length-adjustment: True is not of type 'array'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> 
> 
> See https://patchwork.ozlabs.org/patch/1382003
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 

Both of these errors are fixed in the following patches of the series:
[PATCH 17/20] dt-bindings: usb: qcom,dwc3: Validate DWC3 sub-node
[PATCH 15/20] dt-bindings: usb: meson-g12a-usb: Fix FL-adj property value

This patch preserves the original legacy bindings and doesn't touch the
depended bogus DT schemas.

-Sergey

