Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B3A3161B2
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 10:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbhBJJAE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 04:00:04 -0500
Received: from verein.lst.de ([213.95.11.211]:49933 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230091AbhBJI6M (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Feb 2021 03:58:12 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 37B6B6736F; Wed, 10 Feb 2021 09:57:25 +0100 (CET)
Date:   Wed, 10 Feb 2021 09:57:24 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 4/6] MIPS: refactor the maybe coherent DMA indicators
Message-ID: <20210210085724.GA24610@lst.de>
References: <20210208145024.3320420-1-hch@lst.de> <20210208145024.3320420-5-hch@lst.de> <20210209131237.GB11915@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209131237.GB11915@alpha.franken.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Feb 09, 2021 at 02:12:37PM +0100, Thomas Bogendoerfer wrote:
> > +#ifdef CONFIG_DMA_MAYBE_COHERENT
> > +extern bool dma_default_coherent;
> >  static inline bool dev_is_dma_coherent(struct device *dev)
> >  {
> > -	return coherentio == IO_COHERENCE_ENABLED ||
> > -		(coherentio == IO_COHERENCE_DEFAULT && hw_coherentio);
> > +	return dma_default_coherent;
> 
> this breaks overriding of coherentio via command line. plat_mem_setup/
> plat_setup_iocoherency is called before earlyparams are handled. So
> changing coherentio after that doesn't have any effect.

Hmm.  In that case a manual override does actually work for alchemy,
as that initializes coherentio from plat_mem_setup().  But the
elaborate sanity checking that malta performs in plat_setup_iocoherency
is rather pointless then, as coherentio will always be set to
IO_COHERENCE_DISABLED at this point.
