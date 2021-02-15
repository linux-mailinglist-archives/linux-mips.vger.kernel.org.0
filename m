Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 452E031BA10
	for <lists+linux-mips@lfdr.de>; Mon, 15 Feb 2021 14:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhBONNu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Feb 2021 08:13:50 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:33990 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbhBONNq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Feb 2021 08:13:46 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 782F492009D; Mon, 15 Feb 2021 14:13:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 7131192009C;
        Mon, 15 Feb 2021 14:13:03 +0100 (CET)
Date:   Mon, 15 Feb 2021 14:13:03 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Christoph Hellwig <hch@lst.de>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 5/6] driver core: lift dma_default_coherent into common
 code
In-Reply-To: <alpine.DEB.2.21.2102091213070.35623@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2102151342050.1521@angie.orcam.me.uk>
References: <20210208145024.3320420-1-hch@lst.de> <20210208145024.3320420-6-hch@lst.de> <alpine.DEB.2.21.2102081654060.35623@angie.orcam.me.uk> <20210208161043.GA14083@lst.de> <alpine.DEB.2.21.2102091213070.35623@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 9 Feb 2021, Maciej W. Rozycki wrote:

> > >  Do you need to have this verified anyhow?  I only have a non-coherent 5Kc 
> > > Malta though.
> > 
> > If you get a chance to test this logic, that would be great.
> 
>  I'll try to give it a hit in the next few days then.  Installed in my 
> Malta I have a DEFPA, which is about as serious a DMA user as a piece of 
> classic PCI hardware could be.  I need to debug the issue of another DEFPA 
> not working with my POWER9 system, possibly due to an IOMMU handling bug 
> (hopefully not broken host hardware), so I'll take the opportunity and do 
> it all at once.

 FYI still working on it.  The POWER9 issue turned out to be a combination 
of a driver configuration issue with the distribution caused by a chain of 
historical events leading to the use of PCI I/O bus commands not supported 
by the PHB PCIe host bridge and a bad solder joint with the adapter's main 
PDQ IC on a 20+ years old brand new card.

 I hope to have the adapter properly fixed soon and I'll look at the Malta 
side now, possibly using the old server whose DEFPA has worked flawlessly 
for some 20 years now.  I have planned to use the interface to supply NFS 
root, which I think should be enough of a stress test.

 Patches will follow sometime too for the driver's configuration issue, a 
nonsense in 2021 I should have long addressed, and for resource handling 
which I think should explicitly fail port I/O claims on a system that does 
not support port I/O at all and should not allow this:

# cat /proc/ioports
00000000-ffffffffffffffff : 0031:02:04.0
# 

to happen.

  Maciej
