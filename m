Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBA1E292B57
	for <lists+linux-mips@lfdr.de>; Mon, 19 Oct 2020 18:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730564AbgJSQXm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Oct 2020 12:23:42 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:46598 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730525AbgJSQW5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Oct 2020 12:22:57 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 060F18030865;
        Mon, 19 Oct 2020 16:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3fyZBKMOX3_k; Mon, 19 Oct 2020 19:22:47 +0300 (MSK)
Date:   Mon, 19 Oct 2020 19:22:45 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
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
        <linux-arm-kernel@lists.infradead.org>,
        <linux-snps-arc@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/20] dt-bindings: usb: dwc3: Add synopsys,dwc3
 compatible string
Message-ID: <20201019162245.j5fsvv355wchuhza@mobilestation.baikal.int>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-12-Sergey.Semin@baikalelectronics.ru>
 <20201014201818.GA6926@kozik-lap>
 <20201014213554.turskjyuntk35syj@mobilestation>
 <20201016185340.GA1734346@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201016185340.GA1734346@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 16, 2020 at 01:53:40PM -0500, Rob Herring wrote:
> On Thu, Oct 15, 2020 at 12:35:54AM +0300, Serge Semin wrote:
> > On Wed, Oct 14, 2020 at 10:18:18PM +0200, Krzysztof Kozlowski wrote:
> > > On Wed, Oct 14, 2020 at 01:13:53PM +0300, Serge Semin wrote:
> > > > The DWC USB3 driver and some DTS files like Exynos 5250, Keystone k2e, etc
> > > > expects the DWC USB3 DT node to have the compatible string with the
> > > > "synopsys" vendor prefix. Let's add the corresponding compatible string to
> > > > the controller DT schema, but mark it as deprecated seeing the Synopsys,
> > > > Inc. is presented with just "snps" vendor prefix.
> > > 
> > 
> > > Instead of adding deprecated schema just correct the DTSes to use snps.
> > > The "synopsys" is not even in vendor prefixes.
> > 
> > Yeah, it's not, but the driver and some dts'es use it this way. I am not sure
> > that the solution suggested by you is much better than mine. So let's hear the
> > Rob'es opinion out in this matter. @Rob, what do you think?
> 

> I think we should fix the dts files given there's only 5.

Ok. I'll do that.

-Sergey

> 
> Rob
