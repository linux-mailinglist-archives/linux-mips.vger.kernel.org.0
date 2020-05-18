Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1C81D8A2E
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 23:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgERVmJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 17:42:09 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:50344 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbgERVmJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 17:42:09 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 65401803080B;
        Mon, 18 May 2020 21:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5IrPr8Pw3O58; Tue, 19 May 2020 00:42:01 +0300 (MSK)
Date:   Tue, 19 May 2020 00:42:00 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-mips@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/7] dt-bindings: watchdog: dw-wdt: Add watchdog TOPs
 array property
Message-ID: <20200518214200.cmkzyzzwxm4kotte@mobilestation>
References: <20200306132758.703FC8030704@mail.baikalelectronics.ru>
 <20200510105807.880-1-Sergey.Semin@baikalelectronics.ru>
 <20200510105807.880-4-Sergey.Semin@baikalelectronics.ru>
 <20200518204037.GA4909@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200518204037.GA4909@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 18, 2020 at 02:40:37PM -0600, Rob Herring wrote:
> On Sun, May 10, 2020 at 01:58:03PM +0300, Serge Semin wrote:
> > In case if DW Watchdog IP core is built with WDT_USE_FIX_TOP == false,
> > a custom timeout periods are used to preset the timer counter. In
> > this case that periods should be specified in a new "snps,watchdog-tops"
> > property of the DW watchdog dts node.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: linux-mips@vger.kernel.org
> > 
> > ---
> > 
> > Rob, I had to remove your Reviewed-by tag, since the patch needed
> > to be updated a bit (see changelog).
> > 
> > Changelog v2:
> > - Rearrange SoBs.
> > - Move $ref to the root level of the "snps,watchdog-tops" property
> >   so does the constraints.
> > - Add default TOP values array.
> > - Discard the label definition from the new bindings example.
> > ---
> >  .../bindings/watchdog/snps,dw-wdt.yaml        | 33 +++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> > index 5bf6dc6377f3..cc741fb5a685 100644
> > --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> > @@ -39,6 +39,24 @@ properties:
> >      description: Phandle to the DW Watchdog reset lane
> >      maxItems: 1
> >  
> > +  snps,watchdog-tops:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description: |
> > +      DW APB Watchdog custom timer intervals - Timeout Period ranges (TOPs).
> > +      Each TOP is a number loaded into the watchdog counter at the moment of
> > +      the timer restart. The counter decrementing happens each tick of the
> > +      reference clock. Therefore the TOPs array is equivalent to an array of
> > +      the timer expiration intervals supported by the DW APB Watchdog. Note
> > +      DW APB Watchdog IP-core might be synthesized with fixed TOP values,
> > +      in which case this property is unnecessary with default TOPs utilized.
> > +    default: [0x0001000 0x0002000 0x0004000 0x0008000
> > +      0x0010000 0x0020000 0x0040000 0x0080000
> > +      0x0100000 0x0200000 0x0400000 0x0800000
> > +      0x1000000 0x2000000 0x4000000 0x8000000]
> > +    items:
> > +      minItems: 16
> > +      maxItems: 16
> 
> Drop 'items' and move these up a level. That may have given you some 
> issues, but I made some fixes recently.

Ok. Thanks.

-Sergey

> 
> With that,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Rob
