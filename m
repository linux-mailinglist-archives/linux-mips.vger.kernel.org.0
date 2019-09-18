Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C98E1B6CE5
	for <lists+linux-mips@lfdr.de>; Wed, 18 Sep 2019 21:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731752AbfIRTsm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Sep 2019 15:48:42 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:42200 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731729AbfIRTsm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 18 Sep 2019 15:48:42 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23994220AbfIRTsi136uQ (ORCPT
        <rfc822;linux-kernel@vger.kernel.org> + 1 other);
        Wed, 18 Sep 2019 21:48:38 +0200
Date:   Wed, 18 Sep 2019 20:48:38 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Christoph Hellwig <hch@lst.de>
cc:     Alex Smith <alex.smith@imgtec.com>,
        Sadegh Abbasi <Sadegh.Abbasi@imgtec.com>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: DMA_ATTR_WRITE_COMBINE on mips
In-Reply-To: <20190802063712.GA7553@lst.de>
Message-ID: <alpine.LFD.2.21.1909160545010.32531@eddie.linux-mips.org>
References: <20190802063712.GA7553@lst.de>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Christoph,

> [I hope the imgtec address still works, but maybe the mips folks know
> if it moved to mips]

 Alex left Imagination long before the transition to the interim MIPS 
company.

> you added DMA_ATTR_WRITE_COMBINE support in dma_mmap_attrs to mips
> in commit 8c172467be36f7c9591e59b647e4cd342ce2ef41
> ("MIPS: Add implementation of dma_map_ops.mmap()"), but that commit
> only added the support in mmap, not in dma_alloc_attrs.  This means
> the memory is now used in kernel space through KSEG1, and thus uncached,
> while for userspace mappings through dma_mmap_* pgprot_writebombine
> is used, which creates a write combine mapping, which on some MIPS CPUs
> sets the _CACHE_UNCACHED_ACCELERATED pte bit instead of the
> _CACHE_UNCACHED one.  I know at least on arm, powerpc and x86 such
> mixed page cachability attributes can cause pretty severe problems.
> Are they ok on mips?

 The uncached accelerated mode is implementation-specific, so you won't 
find its definition in the architecture, however the original R10000 
implementation explicitly documents[1] interactions between bus accesses 
using the two modes (essentially a _CACHE_UNCACHED store acts as a barrier 
for any outstanding _CACHE_UNCACHED_ACCELERATED stores; for loads the 
modes are equivalent), so that's clearly supported.

 I've glanced over the interAptiv manual[2] too and it seems to define the 
caching modes similarly.

>  Or was the DMA_ATTR_WRITE_COMBINE supported
> unintended and not correct and we should remove it?

 I don't know, so regrettably I can't comment on this.

References:

[1] "MIPS R10000 Microprocessor", Version 2.0, MIPS Technologies, Inc., 
    January 29, 1997
    <http://techpubs.sgi.com/library/manuals/2000/007-2490-001/pdf/007-2490-001.pdf>

[2] "MIPS32 interAptiv Multiprocessing System Software User's Manual", 
    Imagination Technologies Ltd., Document Number: MD00904, Revision 
    02.01, June 15, 2016

  Maciej
