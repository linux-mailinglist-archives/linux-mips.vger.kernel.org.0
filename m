Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE83F1E2562
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 17:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbgEZP0c (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 11:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727921AbgEZP0b (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 11:26:31 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0E6C03E96D
        for <linux-mips@vger.kernel.org>; Tue, 26 May 2020 08:26:27 -0700 (PDT)
Received: from halation.net.flygoat.com (unknown [IPv6:240e:390:49e:d1a0::d68])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id B40CC204CB;
        Tue, 26 May 2020 15:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590506787; bh=Cy4sJrybsIIcV0DWfPR1iSRhV3HmC6oZr85GVbuQKHc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QriFjjUjEbxCamfVI222A95SCxdrESTok7B6brsd4DFOdGXCkpdRrY07edZolKa0G
         gAmt/IfQBbft3KcHukLfGZtNpseV2FjjAziHBuqkEepYcgD5YWQszE+CdBQyQIebzM
         cPV/hIw/ArkTiBsw/AEIRswn7GTMR+YSWe/8bBm6/2hxrAn0Y34vhuPdvuQiySVfnv
         ABfJB62j4cMXLcR0SvkUazsJk3tvQM8ZtH2EDVgullpOTvQSqrKzAUNGyoKpF9x/RL
         VSZi/0eWuREhgCc0cpqiusVdLiLGbK4RYY9neQ8pSFUXkk8fCwiOraSKquc8ZKriaQ
         qdLRRzlgAesIw==
Date:   Tue, 26 May 2020 23:25:56 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Lichao Liu <liulichao@loongson.cn>,
        Paul Burton <paulburton@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Max Filippov <jcmvbkbc@gmail.com>, yuanjunqing@loongson.cn,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: CPU_LOONGSON2EF need software to maintain cache
 consistency
Message-ID: <20200526232556.14a40f6c@halation.net.flygoat.com>
In-Reply-To: <1d594568-e457-533e-122a-c7e449c0f05d@arm.com>
References: <20200526111438.3788-1-liulichao@loongson.cn>
        <20200526193859.0adaea3b@halation.net.flygoat.com>
        <e9c015c2-b979-27c8-5f43-7af8d43174c5@loongson.cn>
        <20200526130128.GA8487@alpha.franken.de>
        <1d594568-e457-533e-122a-c7e449c0f05d@arm.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 26 May 2020 14:29:50 +0100
Robin Murphy <robin.murphy@arm.com> wrote:

> On 2020-05-26 14:01, Thomas Bogendoerfer wrote:
> > On Tue, May 26, 2020 at 08:40:28PM +0800, Lichao Liu wrote:  
> >> Loongson-2EF need software maintain cache consistency, So when
> >> using streaming DMA, software needs to maintain consistency.
> >>
> >> dma_map_single() is correct, but dma_unmap_single is wrong.
> >>
> >> The function call path:
> >> 'dma_unmap_single->dma_unmap_page_attrs->dma_direct_unmap_page->
> >>   dma_direct_sync_single_for_cpu->arch_sync_dma_for_cpu->
> >>   cpu_needs_post_dma_flush'
> >>
> >> In current version, 'cpu_needs_post_dma_flush' will return false
> >> at Loongon-2EF platform, and dma_unmap_single will not invalidate
> >> cache, driver may access wrong dma data.  
> > 
> > why should it ? CPU must not touch data while it's mapped for DMA.
> >   
> >> I don't know what's the exact meaning of "fill random cachelines
> >> with stale data at any time". I always think
> >> 'cpu_needs_post_dma_flush()' means whether this platform needs
> >> software to maintain cache consistency.  
> > 
> > this will only happen, if cpu speculates creates dirty cache lines
> > by speculation as R10k type of CPUs do.  
> 
> Will it? The usual pattern for this problem is that the CPU 
> speculatively fills a (clean) cache line after a DMA_FROM_DEVICE 
> operation has begun, but before the device has actually written to
> that part of the buffer. Thus a subsequent CPU read after the
> operation is complete can hit in the cache and return the previous
> data rather than the updated data that the device wrote. I don't know
> about MIPS specifically, but that can certainly happen on Arm.

Checked the manual of Loongson-2F again and I must admit the case may
happen on Loongson-2EF processor.

R4k manual didn't show the details of speculative policy but I think
that should be applied to all R4k like processors?

So what we need is a post Invalidate after DMA_FROM_DEVICE?
DMA to device should not affected at all.

The origin R10k errata looks like a different story. Both from and to
device is affected because cache line was incorrectly marked as dirty
and it may writeback old data to memory already modified by uncached
write even CPU doesn't perform any cached write to that line. 

See details at Page 22 of R10k UM[1].
Not sure if BMIPS here is the same case. 

Thanks.

[1]:http://www.ece.mtu.edu/faculty/rmkieckh/cla/4173/REFERENCES/MIPS-R10K-uman1.pdf

- Jiaxun

> 
> >> I found this problem in 4.19.90 kernel's ethernet driver,
> >> and this patch can fix this problem.  
> > 
> > if CPU isn't affected by the R10k speculation problem, it sounds
> > more like wrong usage of DMA api.  
> 
> Sure, explicit accesses to the mapped buffer would be a software
> error, but if legitimate non-overlapping accesses to other data
> nearby can trigger the CPU to speculatively fetch lines from the
> DMA-mapped region, that's generally beyond software's control.
> 
> Robin.


