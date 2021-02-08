Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1933138F9
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 17:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234228AbhBHQLl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 11:11:41 -0500
Received: from verein.lst.de ([213.95.11.211]:42007 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233278AbhBHQLh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Feb 2021 11:11:37 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 0A05D67373; Mon,  8 Feb 2021 17:10:44 +0100 (CET)
Date:   Mon, 8 Feb 2021 17:10:43 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 5/6] driver core: lift dma_default_coherent into common
 code
Message-ID: <20210208161043.GA14083@lst.de>
References: <20210208145024.3320420-1-hch@lst.de> <20210208145024.3320420-6-hch@lst.de> <alpine.DEB.2.21.2102081654060.35623@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2102081654060.35623@angie.orcam.me.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 08, 2021 at 04:57:33PM +0100, Maciej W. Rozycki wrote:
> > diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
> > index e98cc977a735b2..f8c9663e7faa10 100644
> > --- a/arch/mips/mti-malta/malta-setup.c
> > +++ b/arch/mips/mti-malta/malta-setup.c
> > @@ -143,7 +143,7 @@ static void __init plat_setup_iocoherency(void)
> >  			pr_crit("IOCU OPERATION DISABLED BY SWITCH - DEFAULTING TO SW IO COHERENCY\n");
> >  	}
> >  
> > -	if (supported)
> > +	if (supported) {
> >  		if (dma_force_noncoherent) {
> >  			pr_info("Hardware DMA cache coherency disabled\n");
> >  			return;
> 
>  I think this has to go with 1/6; otherwise compilation breaks between 
> then and now AFAICT.

Indeed.

>  Do you need to have this verified anyhow?  I only have a non-coherent 5Kc 
> Malta though.

If you get a chance to test this logic, that would be great.
