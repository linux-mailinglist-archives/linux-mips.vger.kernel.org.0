Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 533391D7903
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 14:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgERMxB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 08:53:01 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:47326 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbgERMxA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 08:53:00 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id B7B468030875;
        Mon, 18 May 2020 12:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id txmeJSYd8bdj; Mon, 18 May 2020 15:52:55 +0300 (MSK)
Date:   Mon, 18 May 2020 15:52:53 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Allison Randal <allison@lohutok.net>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Georgy Vlasov <Georgy.Vlasov@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Clement Leger <cleger@kalray.eu>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 10/19] spi: dw: Use DMA max burst to set the request
 thresholds
Message-ID: <20200518125253.r4fpr4mjflclqpym@mobilestation>
References: <20200508132943.9826-1-Sergey.Semin@baikalelectronics.ru>
 <20200515104758.6934-1-Sergey.Semin@baikalelectronics.ru>
 <20200515104758.6934-11-Sergey.Semin@baikalelectronics.ru>
 <20200515143842.GG1634618@smile.fi.intel.com>
 <20200516200133.wmaqnfjbr7234fzo@mobilestation>
 <20200518110343.GY1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200518110343.GY1634618@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 18, 2020 at 02:03:43PM +0300, Andy Shevchenko wrote:
> On Sat, May 16, 2020 at 11:01:33PM +0300, Serge Semin wrote:
> > On Fri, May 15, 2020 at 05:38:42PM +0300, Andy Shevchenko wrote:
> > > On Fri, May 15, 2020 at 01:47:49PM +0300, Serge Semin wrote:
> > > > Each channel of DMA controller may have a limited length of burst
> > > > transaction (number of IO operations performed at ones in a single
> > > > DMA client request). This parameter can be used to setup the most
> > > > optimal DMA Tx/Rx data level values. In order to avoid the Tx buffer
> > > > overrun we can set the DMA Tx level to be of FIFO depth minus the
> > > > maximum burst transactions length. To prevent the Rx buffer underflow
> > > > the DMA Rx level should be set to the maximum burst transactions length.
> > > > This commit setups the DMA channels and the DW SPI DMA Tx/Rx levels
> > > > in accordance with these rules.
> 
> ...
> 
> > > >  	/* DMA info */
> > > >  	struct dma_chan		*txchan;
> > > > +	u32			txburst;
> > > >  	struct dma_chan		*rxchan;
> > > > +	u32			rxburst;
> > > 
> > > Leave u32 together, it may be optimal on 64-bit architectures where ABIs require padding.
> > 
> > It's not like anyone cared about padding in this structure in the first place)
> 
> I think I have been caring (to some extend).

Well, If you have then instead of asking to rearrange just two members (which
by the way finely grouped by the Tx-Rx affiliation) why not sending a
patch, which would refactor the whole structure so to be optimal for the x64
platforms? I don't really see why this gets very important for you seeing
Mark is Ok with this. My current commit follows the common driver design
including the DW SSI data members grouping. On the second thought I'll leave
it as is then.

-Sergey

> 
> > Though if v3 is required I'll group these members together.
> 
> From what I see v3 is what Mark and me are waiting for. Mark, are we on the
> same page here?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
