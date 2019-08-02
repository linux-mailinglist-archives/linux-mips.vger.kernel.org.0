Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55AD87ECBE
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2019 08:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729637AbfHBGhQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Aug 2019 02:37:16 -0400
Received: from verein.lst.de ([213.95.11.211]:50078 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729432AbfHBGhP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Aug 2019 02:37:15 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 80CFE68C65; Fri,  2 Aug 2019 08:37:12 +0200 (CEST)
Date:   Fri, 2 Aug 2019 08:37:12 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Alex Smith <alex.smith@imgtec.com>
Cc:     Sadegh Abbasi <Sadegh.Abbasi@imgtec.com>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: DMA_ATTR_WRITE_COMBINE on mips
Message-ID: <20190802063712.GA7553@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

[I hope the imgtec address still works, but maybe the mips folks know
if it moved to mips]

Hi Alex,

you added DMA_ATTR_WRITE_COMBINE support in dma_mmap_attrs to mips
in commit 8c172467be36f7c9591e59b647e4cd342ce2ef41
("MIPS: Add implementation of dma_map_ops.mmap()"), but that commit
only added the support in mmap, not in dma_alloc_attrs.  This means
the memory is now used in kernel space through KSEG1, and thus uncached,
while for userspace mappings through dma_mmap_* pgprot_writebombine
is used, which creates a write combine mapping, which on some MIPS CPUs
sets the _CACHE_UNCACHED_ACCELERATED pte bit instead of the
_CACHE_UNCACHED one.  I know at least on arm, powerpc and x86 such
mixed page cachability attributes can cause pretty severe problems.
Are they ok on mips?  Or was the DMA_ATTR_WRITE_COMBINE supported
unintended and not correct and we should remove it?
