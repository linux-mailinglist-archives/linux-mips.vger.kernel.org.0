Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8DB1D9664
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2020 14:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728806AbgESMdJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 May 2020 08:33:09 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:53612 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728745AbgESMdI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 May 2020 08:33:08 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 68FF9803087C;
        Tue, 19 May 2020 12:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KO-6LsdpDdS1; Tue, 19 May 2020 15:33:03 +0300 (MSK)
Date:   Tue, 19 May 2020 15:33:02 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>, <linux-mips@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clk: Add Baikal-T1 CCU PLLs binding
Message-ID: <20200519123302.2lydamjy62ugkjb6@mobilestation>
References: <20200306130053.BCBFC803078F@mail.baikalelectronics.ru>
 <20200506222300.30895-1-Sergey.Semin@baikalelectronics.ru>
 <20200506222300.30895-2-Sergey.Semin@baikalelectronics.ru>
 <20200514191318.GA10192@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200514191318.GA10192@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 14, 2020 at 02:13:18PM -0500, Rob Herring wrote:
> On Thu, May 07, 2020 at 01:22:57AM +0300, Serge Semin wrote:
> > Baikal-T1 Clocks Control Unit is responsible for transformation of a
> > signal coming from an external oscillator into clocks of various
> > frequencies to propagate them then to the corresponding clocks
> > consumers (either individual IP-blocks or clock domains). In order
> > to create a set of high-frequency clocks the external signal is
> > firstly handled by the embedded into CCU PLLs. So the corresponding
> > dts-node is just a normal clock-provider node with standard set of
> > properties. Note as being part of the Baikal-T1 System Controller its
> > DT node is supposed to be a child the system controller node.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: linux-mips@vger.kernel.org
> > 
> > ---
> > 

[nip]

> > +examples:
> > +  # Clock Control Unit PLL node:
> > +  - |
> > +    clock-controller-pll {
> > +      compatible = "baikal,bt1-ccu-pll";
> > +      #clock-cells = <1>;
> > +
> > +      clocks = <&clk25m>;
> > +      clock-names = "ref_clk";
> 
> If there's a register range within the system controller for the pll, 
> then add 'reg' even if Linux doesn't use it.

Rob, are you saying that the reg property should be mandatory or optional?
I've got a similar issue in several other patches you've already took a look.
In order to fix it there too could you please clarify this to me?

-Sergey
