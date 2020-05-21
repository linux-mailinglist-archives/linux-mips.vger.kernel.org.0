Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFB6E1DC4C0
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 03:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgEUBdG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 21:33:06 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:34296 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbgEUBdG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 May 2020 21:33:06 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 322108030779;
        Thu, 21 May 2020 01:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id twUONAKbaAJU; Thu, 21 May 2020 04:33:01 +0300 (MSK)
Date:   Thu, 21 May 2020 04:33:00 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Vinod Koul <vkoul@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Williams <dan.j.williams@intel.com>,
        <linux-mips@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: dma: dw: Add max burst transaction
 length property
Message-ID: <20200521013300.pv45323ii4b7ln5x@mobilestation>
References: <20200511213531.wnywlljiulvndx6s@mobilestation>
 <20200512090804.GR185537@smile.fi.intel.com>
 <20200512114946.x777yb6bhe22ccn5@mobilestation>
 <20200512123840.GY185537@smile.fi.intel.com>
 <20200515060911.GF333670@vkoul-mobl>
 <20200515105137.GK185537@smile.fi.intel.com>
 <20200515105658.GR333670@vkoul-mobl>
 <20200515111112.4umynrpgzjnca223@mobilestation>
 <20200517174739.uis3wfievdcmtsxj@mobilestation>
 <20200519171304.GU374218@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200519171304.GU374218@vkoul-mobl.Dlink>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 19, 2020 at 10:43:04PM +0530, Vinod Koul wrote:
> On 17-05-20, 20:47, Serge Semin wrote:
> > On Fri, May 15, 2020 at 02:11:13PM +0300, Serge Semin wrote:
> > > On Fri, May 15, 2020 at 04:26:58PM +0530, Vinod Koul wrote:
> > > > On 15-05-20, 13:51, Andy Shevchenko wrote:
> > > > > On Fri, May 15, 2020 at 11:39:11AM +0530, Vinod Koul wrote:
> > > > > > On 12-05-20, 15:38, Andy Shevchenko wrote:
> > > > > > > On Tue, May 12, 2020 at 02:49:46PM +0300, Serge Semin wrote:
> > > > > > > > On Tue, May 12, 2020 at 12:08:04PM +0300, Andy Shevchenko wrote:
> > > > > > > > > On Tue, May 12, 2020 at 12:35:31AM +0300, Serge Semin wrote:
> > > > > > > > > > On Tue, May 12, 2020 at 12:01:38AM +0300, Andy Shevchenko wrote:
> > > > > > > > > > > On Mon, May 11, 2020 at 11:05:28PM +0300, Serge Semin wrote:
> > > > > > > > > > > > On Fri, May 08, 2020 at 02:12:42PM +0300, Andy Shevchenko wrote:
> > > > > > > > > > > > > On Fri, May 08, 2020 at 01:53:00PM +0300, Serge Semin wrote:
> > > > > 
> > > > > ...
> > > > > 
> > > > > > > I leave it to Rob and Vinod.
> > > > > > > It won't break our case, so, feel free with your approach.
> > > > > > 
> > > > > > I agree the DT is about describing the hardware and looks like value of
> > > > > > 1 is not allowed. If allowed it should be added..
> > > > > 
> > > > > It's allowed at *run time*, it's illegal in *pre-silicon stage* when
> > > > > synthesizing the IP.
> > > > 
> > > > Then it should be added ..
> > > 
> > > Vinod, max-burst-len is "MAXimum" burst length not "run-time or current or any
> > > other" burst length. It's a constant defined at the IP-core synthesis stage and
> > > according to the Data Book, MAX burst length can't be 1. The allowed values are
> > > exactly as I described in the binding [4, 8, 16, 32, ...]. MAX burst length
> > > defines the upper limit of the run-time burst length. So setting it to 1 isn't
> > > about describing a hardware, but using DT for the software convenience.
> > > 
> > > -Sergey
> > 
> > Vinod, to make this completely clear. According to the DW DMAC data book:
> > - In general, run-time parameter of the DMA transaction burst length (set in
> >   the SRC_MSIZE/DST_MSIZE fields of the channel control register) may belong
> >   to the set [1, 4, 8, 16, 32, 64, 128, 256].
> 
> so 1 is valid value for msize

Right.

> 
> > - Actual upper limit of the burst length run-time parameter is limited by a
> >   constant defined at the IP-synthesize stage (it's called DMAH_CHx_MAX_MULT_SIZE)
> >   and this constant belongs to the set [4, 8, 16, 32, 64, 128, 256]. (See, no 1
> >   in this set).
> 
> maximum can be 4 onwards, but in my configuration I can choose 1 as
> value for msize

It's true for all configurations. msize can be at least 0 or 1, which correspond
to 1 and 4 burst length respectively.

> 
> > So the run-time burst length in a case of particular DW DMA controller belongs
> > to the range:
> > 1 <= SRC_MSIZE <= DMAH_CHx_MAX_MULT_SIZE
> > and
> > 1 <= DST_MSIZE <= DMAH_CHx_MAX_MULT_SIZE
> > 
> > See. No mater which DW DMA controller we get each of them will at least support
> > the burst length of 1 and 4 transfer words. This is determined by design of the
> > DW DMA controller IP since DMAH_CHx_MAX_MULT_SIZE constant set starts with 4.
> > 
> > In this patch I suggest to add the max-burst-len property, which specifies
> > the upper limit for the run-time burst length. Since the maximum burst length
> > capable to be set to the SRC_MSIZE/DST_MSIZE fields of the DMA channel control
> > register is determined by the DMAH_CHx_MAX_MULT_SIZE constant (which can't be 1
> > by the DW DMA IP design), max-burst-len property as being also responsible for
> > the maximum burst length setting should be associated with DMAH_CHx_MAX_MULT_SIZE
> > thus should belong to the same set [4, 8, 16, 32, 64, 128, 256].
> > 
> > So 1 shouldn't be in the enum of the max-burst-len property constraint, because
> > hardware doesn't support such limitation by design, while setting 1 as
> > max-burst-len would mean incorrect description of the DMA controller.
> > 
> > Vinod, could you take a look at the info I provided above and say your final word
> > whether 1 should be really allowed to be in the max-burst-len enum constraints?
> > I'll do as you say in the next version of the patchset.
> 
> You are specifying the parameter which will be used to pick, i think
> starting with 4 makes sense as we are specifying maximum allowed values
> for msize. Values lesser than or equal to this would be allowed, I guess
> that should be added to documentation.

Right. Thanks. I'll a proper description to the property in the binding file.

-Sergey

> 
> thanks
> -- 
> ~Vinod
