Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0478A1E26A7
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 18:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbgEZQQY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 12:16:24 -0400
Received: from elvis.franken.de ([193.175.24.41]:40101 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728361AbgEZQQX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 12:16:23 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jdcFV-0001AE-00; Tue, 26 May 2020 18:16:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2AB1EC041A; Tue, 26 May 2020 18:00:45 +0200 (CEST)
Date:   Tue, 26 May 2020 18:00:45 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Lichao Liu <liulichao@loongson.cn>,
        Paul Burton <paulburton@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Max Filippov <jcmvbkbc@gmail.com>, yuanjunqing@loongson.cn,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: CPU_LOONGSON2EF need software to maintain cache
 consistency
Message-ID: <20200526160045.GA12325@alpha.franken.de>
References: <20200526111438.3788-1-liulichao@loongson.cn>
 <20200526193859.0adaea3b@halation.net.flygoat.com>
 <e9c015c2-b979-27c8-5f43-7af8d43174c5@loongson.cn>
 <20200526130128.GA8487@alpha.franken.de>
 <1d594568-e457-533e-122a-c7e449c0f05d@arm.com>
 <20200526232556.14a40f6c@halation.net.flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526232556.14a40f6c@halation.net.flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 26, 2020 at 11:25:56PM +0800, Jiaxun Yang wrote:
> On Tue, 26 May 2020 14:29:50 +0100
> Robin Murphy <robin.murphy@arm.com> wrote:
> 
> > On 2020-05-26 14:01, Thomas Bogendoerfer wrote:
> > > On Tue, May 26, 2020 at 08:40:28PM +0800, Lichao Liu wrote:  
> > >> Loongson-2EF need software maintain cache consistency, So when
> > >> using streaming DMA, software needs to maintain consistency.
> > >>
> > >> dma_map_single() is correct, but dma_unmap_single is wrong.
> > >>
> > >> The function call path:
> > >> 'dma_unmap_single->dma_unmap_page_attrs->dma_direct_unmap_page->
> > >>   dma_direct_sync_single_for_cpu->arch_sync_dma_for_cpu->
> > >>   cpu_needs_post_dma_flush'
> > >>
> > >> In current version, 'cpu_needs_post_dma_flush' will return false
> > >> at Loongon-2EF platform, and dma_unmap_single will not invalidate
> > >> cache, driver may access wrong dma data.  
> > > 
> > > why should it ? CPU must not touch data while it's mapped for DMA.
> > >   
> > >> I don't know what's the exact meaning of "fill random cachelines
> > >> with stale data at any time". I always think
> > >> 'cpu_needs_post_dma_flush()' means whether this platform needs
> > >> software to maintain cache consistency.  
> > > 
> > > this will only happen, if cpu speculates creates dirty cache lines
> > > by speculation as R10k type of CPUs do.  
> > 
> > Will it? The usual pattern for this problem is that the CPU 
> > speculatively fills a (clean) cache line after a DMA_FROM_DEVICE 
> > operation has begun, but before the device has actually written to
> > that part of the buffer. Thus a subsequent CPU read after the
> > operation is complete can hit in the cache and return the previous
> > data rather than the updated data that the device wrote. I don't know
> > about MIPS specifically, but that can certainly happen on Arm.
> 
> Checked the manual of Loongson-2F again and I must admit the case may
> happen on Loongson-2EF processor.

so the patch is correct ?
> 
> R4k manual didn't show the details of speculative policy but I think
> that should be applied to all R4k like processors?

R4k doesn't speculate at all.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
