Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 278F628F3D5
	for <lists+linux-mips@lfdr.de>; Thu, 15 Oct 2020 15:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388015AbgJONxa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Oct 2020 09:53:30 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:55510 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730211AbgJONx2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Oct 2020 09:53:28 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 3DD5B803202B;
        Thu, 15 Oct 2020 13:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vPS-zxjKdsJk; Thu, 15 Oct 2020 16:53:21 +0300 (MSK)
Date:   Thu, 15 Oct 2020 16:53:17 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Felipe Balbi <balbi@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Wei Xu <xuwei5@hisilicon.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-snps-arc@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
Message-ID: <20201015135317.5jsrrqmwmdz4lnzm@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <878sc8lx0e.fsf@kernel.org>
 <20201014143720.yny3jco5pkb7dr4b@mobilestation>
 <875z7blrqu.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <875z7blrqu.fsf@kernel.org>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 15, 2020 at 01:15:37PM +0300, Felipe Balbi wrote:
> Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
> 
> > On Wed, Oct 14, 2020 at 05:09:37PM +0300, Felipe Balbi wrote:
> >> 
> >> Hi Serge,
> >> 
> >> Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
> >> > In accordance with the DWC USB3 bindings the corresponding node name is
> >> > suppose to comply with Generic USB HCD DT schema, which requires the USB
> >> 
> >
> >> DWC3 is not a simple HDC, though.
> >
> > Yeah, strictly speaking it is equipped with a lot of vendor-specific stuff,
> > which are tuned by the DWC USB3 driver in the kernel. But after that the
> > controller is registered as xhci-hcd device so it's serviced by the xHCI driver,
> 

> in Dual-role or host-only builds, that's correct. We can also have
> peripheral-only builds (both SW or HW versions) which means xhci isn't
> even in the picture.

Hm, good point. In that case perhaps we'll need to apply the xHCI DT schema
conditionally. Like this:

- allOf:
-   - $ref: usb-xhci.yaml#
+ allOf:
+   - if:
+       properties:
+         dr_mode:
+           const: peripheral
+     then:
+       $ref: usb-hcd.yaml#
+     else:
+       $ref: usb-xhci.yaml#

Note, we need to have the peripheral device being compatible with the
usb-hcd.yaml schema to support the maximum-speed, dr_mode properties and to
comply with the USB node naming constraint.

-Sergey

> 
> -- 
> balbi


