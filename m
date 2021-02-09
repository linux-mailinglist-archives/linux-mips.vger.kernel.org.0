Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3DB3314E33
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 12:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhBILZd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Feb 2021 06:25:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbhBILYT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Feb 2021 06:24:19 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A4908C061794;
        Tue,  9 Feb 2021 03:23:19 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 053939200B4; Tue,  9 Feb 2021 12:23:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id F37559200B3;
        Tue,  9 Feb 2021 12:23:11 +0100 (CET)
Date:   Tue, 9 Feb 2021 12:23:11 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Christoph Hellwig <hch@lst.de>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 5/6] driver core: lift dma_default_coherent into common
 code
In-Reply-To: <20210208161043.GA14083@lst.de>
Message-ID: <alpine.DEB.2.21.2102091213070.35623@angie.orcam.me.uk>
References: <20210208145024.3320420-1-hch@lst.de> <20210208145024.3320420-6-hch@lst.de> <alpine.DEB.2.21.2102081654060.35623@angie.orcam.me.uk> <20210208161043.GA14083@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 8 Feb 2021, Christoph Hellwig wrote:

> >  Do you need to have this verified anyhow?  I only have a non-coherent 5Kc 
> > Malta though.
> 
> If you get a chance to test this logic, that would be great.

 I'll try to give it a hit in the next few days then.  Installed in my 
Malta I have a DEFPA, which is about as serious a DMA user as a piece of 
classic PCI hardware could be.  I need to debug the issue of another DEFPA 
not working with my POWER9 system, possibly due to an IOMMU handling bug 
(hopefully not broken host hardware), so I'll take the opportunity and do 
it all at once.

  Maciej
