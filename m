Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2227728E86F
	for <lists+linux-mips@lfdr.de>; Wed, 14 Oct 2020 23:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730896AbgJNVgA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Oct 2020 17:36:00 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:50672 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbgJNVgA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Oct 2020 17:36:00 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 2D3BF803073C;
        Wed, 14 Oct 2020 21:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 6J1tBRFocEVe; Thu, 15 Oct 2020 00:35:55 +0300 (MSK)
Date:   Thu, 15 Oct 2020 00:35:54 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
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
Message-ID: <20201014213554.turskjyuntk35syj@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-12-Sergey.Semin@baikalelectronics.ru>
 <20201014201818.GA6926@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201014201818.GA6926@kozik-lap>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 14, 2020 at 10:18:18PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2020 at 01:13:53PM +0300, Serge Semin wrote:
> > The DWC USB3 driver and some DTS files like Exynos 5250, Keystone k2e, etc
> > expects the DWC USB3 DT node to have the compatible string with the
> > "synopsys" vendor prefix. Let's add the corresponding compatible string to
> > the controller DT schema, but mark it as deprecated seeing the Synopsys,
> > Inc. is presented with just "snps" vendor prefix.
> 

> Instead of adding deprecated schema just correct the DTSes to use snps.
> The "synopsys" is not even in vendor prefixes.

Yeah, it's not, but the driver and some dts'es use it this way. I am not sure
that the solution suggested by you is much better than mine. So let's hear the
Rob'es opinion out in this matter. @Rob, what do you think?

-Sergey

> 
> Best regards,
> Krzysztof
