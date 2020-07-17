Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF2B2236BB
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jul 2020 10:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgGQIOJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jul 2020 04:14:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:33132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726240AbgGQIOI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Jul 2020 04:14:08 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F160A2074B;
        Fri, 17 Jul 2020 08:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594973648;
        bh=uZeYMXCJtLGh6KMN2nFStTzc1fx/WG+R0GSYBiVJ8vQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=avNKU2emncZKYMwJ/dNul77zD39/U0uTLyZ5KEKPvA/IsNl45CUvnR34pvDfaqc/9
         rDuKcYcE8DgYtHjAxBxLjRTGccx/i9V4QgFD/OtqJr2xSidQ9iOHT6hURGra9KKYAD
         PlBv7DKOnhKXTMsEL/+aaPUAsvLKUr6ORCRezq6E=
Date:   Fri, 17 Jul 2020 13:44:03 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 04/11] dmaengine: Introduce max SG list entries
 capability
Message-ID: <20200717081403.GL82923@vkoul-mobl>
References: <20200709224550.15539-1-Sergey.Semin@baikalelectronics.ru>
 <20200709224550.15539-5-Sergey.Semin@baikalelectronics.ru>
 <d667adda-6576-623d-6976-30f60ab3c3dc@ti.com>
 <20200710092738.z7zyywe46mp7uuf3@mobilestation>
 <427bc5c8-0325-bc25-8637-a7627bcac26f@ti.com>
 <20200710161445.t6eradkgt4terdr3@mobilestation>
 <20200715111315.GK34333@vkoul-mobl>
 <20200715170843.w4rwl7zjwfcr7rg2@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715170843.w4rwl7zjwfcr7rg2@mobilestation>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 15-07-20, 20:08, Serge Semin wrote:
> On Wed, Jul 15, 2020 at 04:43:15PM +0530, Vinod Koul wrote:
> > On 10-07-20, 19:14, Serge Semin wrote:
> > > On Fri, Jul 10, 2020 at 02:51:33PM +0300, Peter Ujfalusi wrote:
> > 
> > > > Since we should be able to handle longer lists and this is kind of a
> > > > hint for clients that above this number of nents the list will be broken
> > > > up to smaller 'bursts', which when traversing could cause latency.
> > > > 
> > > > sg_chunk_len might be another candidate.
> > > 
> > > Ok. We've got four candidates:
> > > - max_sg_nents_burst
> > > - max_sg_burst
> > > - max_sg_chain
> > > - sg_chunk_len
> > > 
> > > @Vinod, @Andy, what do you think?
> > 
> 
> > So IIUC your hw supports single sg and in that you would like to publish
> > the length of each chunk, is that correct?
> 
> No. My DMA engine does support only a single-entry SG-list, but the new DMA
> {~~slave~~,channel,device,peripheral,...} capability isn't about the length, but
> is about the maximum number of SG-list entries a DMA engine is able to
> automatically/"without software help" walk through and execute. In this thread
> we are debating about that new capability naming.
> 
> The name suggested in this patch: max_sg_nents. Peter noted (I mostly agree with
> him), that it might be ambiguous, since from it (without looking into the
> dma_slave_caps structure comment) a user might think that it's a maximum number of
> SG-entries, which can be submitted for the DMA engine execution, while in fact it's
> about the DMA engine capability of automatic/burst/"without software intervention"
> SG-list entries walking through. (Such information will be helpful to solve a
> problem discussed in this mailing thread, and described in the cover-letter to
> this patchset. We also discussed it with you and Andy in the framework of this
> patchset many times.)
> 
> As an alternative Peter suggested: max_sg_nents_burst. I also think it's better
> than "max_sg_nents" but for me it seems a bit long. max_sg_burst seems better.
> There is no need in having the "nents" in the name, since SG-list implies a list,
> which main parameter (if not to say only parameter) is the number of entries.
> "burst" is pointing out to the automatic/accelerated/"without software intervention"
> SG-list entries walking through.
> 
> On the second thought suggested by me "max_sg_chain" sounds worse than "max_sg_burst",
> because it also might be perceived as a parameter limiting the number of SG-list
> entries is able to be submitted for the DMA engine execution, while in fact it
> describes another matter.
> 
> Regarding "sg_chunk_len". I think it's ambiguous too, since the "chunk
> length" might be referred to both the entries length and to the sub-SG-list
> length.
> 
> So what do you think? What name is better describing the new DMA capability?

How about max_nents_per_sg or max_nents_sg to signify that this implies
max nents for sg not sg entries. IMO Burst/chain are not better than
max_sg_nents.

-- 
~Vinod
