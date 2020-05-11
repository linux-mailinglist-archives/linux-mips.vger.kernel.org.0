Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2E31CE718
	for <lists+linux-mips@lfdr.de>; Mon, 11 May 2020 23:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729120AbgEKVID (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 May 2020 17:08:03 -0400
Received: from mga11.intel.com ([192.55.52.93]:44557 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728046AbgEKVID (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 11 May 2020 17:08:03 -0400
IronPort-SDR: Rcp3EDn6fhm2vgJ2fBeDsP/fyMxSfzxOJAyrSHednMDgsRs7lQJg5Mp0cX/mtKyzCNuMTkBAFg
 uz2zkaNdteKA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 14:08:01 -0700
IronPort-SDR: t4AxqHHHkr6vBGqkbBrHjdrapcTu7uZg3Ts+CnG9/CbtCyLSWH4X/mHEA7plgOTYMvOs51mUzw
 YYCBa3V3UedA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,381,1583222400"; 
   d="scan'208";a="251264806"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 11 May 2020 14:07:58 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1jYFea-0063GS-Rm; Tue, 12 May 2020 00:08:00 +0300
Date:   Tue, 12 May 2020 00:08:00 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        dmaengine <dmaengine@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] dmaengine: dw: Print warning if multi-block is
 unsupported
Message-ID: <20200511210800.GP185537@smile.fi.intel.com>
References: <20200508105304.14065-1-Sergey.Semin@baikalelectronics.ru>
 <20200508105304.14065-5-Sergey.Semin@baikalelectronics.ru>
 <20200508112604.GJ185537@smile.fi.intel.com>
 <20200508115334.GE4820@sirena.org.uk>
 <20200511021016.wptcgnc3iq3kadgz@mobilestation>
 <20200511115813.GG8216@sirena.org.uk>
 <20200511134502.hjbu5evkiuh75chr@mobilestation>
 <CAHp75VdOi1rwaKjzowhj0KA-eNNL4NxpiCeqfELFgO_RcnZ-xw@mail.gmail.com>
 <20200511193255.t6orpcdz5ukmwmqo@mobilestation>
 <20200511210714.GO185537@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511210714.GO185537@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 12, 2020 at 12:07:14AM +0300, Andy Shevchenko wrote:
> On Mon, May 11, 2020 at 10:32:55PM +0300, Serge Semin wrote:
> > On Mon, May 11, 2020 at 04:58:53PM +0300, Andy Shevchenko wrote:
> > > On Mon, May 11, 2020 at 4:48 PM Serge Semin
> > > <Sergey.Semin@baikalelectronics.ru> wrote:
> > > >
> > > > On Mon, May 11, 2020 at 12:58:13PM +0100, Mark Brown wrote:
> > > > > On Mon, May 11, 2020 at 05:10:16AM +0300, Serge Semin wrote:
> > > > >
> > > > > > Alas linearizing the SPI messages won't help in this case because the DW DMA
> > > > > > driver will split it into the max transaction chunks anyway.
> > > > >
> > > > > That sounds like you need to also impose a limit on the maximum message
> > > > > size as well then, with that you should be able to handle messages up
> > > > > to whatever that limit is.  There's code for that bit already, so long
> > > > > as the limit is not too low it should be fine for most devices and
> > > > > client drivers can see the limit so they can be updated to work with it
> > > > > if needed.
> > > >
> > > > Hmm, this might work. The problem will be with imposing such limitation through
> > > > the DW APB SSI driver. In order to do this I need to know:
> > > > 1) Whether multi-block LLP is supported by the DW DMA controller.
> > > > 2) Maximum DW DMA transfer block size.
> > > > Then I'll be able to use this information in the can_dma() callback to enable
> > > > the DMA xfers only for the safe transfers. Did you mean something like this when
> > > > you said "There's code for that bit already" ? If you meant the max_dma_len
> > > > parameter, then setting it won't work, because it just limits the SG items size
> > > > not the total length of a single transfer.
> > > >
> > > > So the question is of how to export the multi-block LLP flag from DW DMAc
> > > > driver. Andy?
> > > 
> > > I'm not sure I understand why do you need this being exported. Just
> > > always supply SG list out of single entry and define the length
> > > according to the maximum segment size (it's done IIRC in SPI core).
> > 
> > Finally I see your point. So you suggest to feed the DMA engine with SG list
> > entries one-by-one instead of sending all of them at once in a single
> > dmaengine_prep_slave_sg() -> dmaengine_submit() -> dma_async_issue_pending()
> > session. Hm, this solution will work, but there is an issue. There is no
> > guarantee, that Tx and Rx SG lists are symmetric, consisting of the same
> > number of items with the same sizes. It depends on the Tx/Rx buffers physical
> > address alignment and their offsets within the memory pages. Though this
> > problem can be solved by making the Tx and Rx SG lists symmetric. I'll have
> > to implement a clever DMA IO loop, which would extract the DMA
> > addresses/lengths from the SG entries and perform the single-buffer DMA 
> > transactions with the DMA buffers of the same length.
> > 
> > Regarding noLLP being exported. Obviously I intended to solve the problem in a
> > generic way since the problem is common for noLLP DW APB SSI/DW DMAC combination.
> > In order to do this we need to know whether the multi-block LLP feature is
> > unsupported by the DW DMA controller. We either make such info somehow exported
> > from the DW DMA driver, so the DMA clients (like Dw APB SSI controller driver)
> > could be ready to work around the problem; or just implement a flag-based quirk
> > in the DMA client driver, which would be enabled in the platform-specific basis
> > depending on the platform device actually detected (for instance, a specific
> > version of the DW APB SSI IP). AFAICS You'd prefer the later option. 
> 
> So, we may extend the struct of DMA parameters to tell the consumer amount of entries (each of which is no longer than maximum segment size) it can afford:
> - 0: Auto (DMA driver handles any cases itself)
> - 1: Only single entry
> - 2: Up to two...

It will left implementation details (or i.o.w. obstacles or limitation) why DMA
can't do otherwise.

-- 
With Best Regards,
Andy Shevchenko


