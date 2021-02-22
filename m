Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D62B321447
	for <lists+linux-mips@lfdr.de>; Mon, 22 Feb 2021 11:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhBVKnD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Feb 2021 05:43:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhBVKnB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Feb 2021 05:43:01 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 26B2BC061574;
        Mon, 22 Feb 2021 02:42:21 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 5983C92009C; Mon, 22 Feb 2021 11:42:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 5002292009B;
        Mon, 22 Feb 2021 11:42:17 +0100 (CET)
Date:   Mon, 22 Feb 2021 11:42:17 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Christoph Hellwig <hch@lst.de>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 5/6] driver core: lift dma_default_coherent into common
 code
In-Reply-To: <20210222075937.GA21946@lst.de>
Message-ID: <alpine.DEB.2.21.2102221140180.1900@angie.orcam.me.uk>
References: <20210208145024.3320420-1-hch@lst.de> <20210208145024.3320420-6-hch@lst.de> <alpine.DEB.2.21.2102081654060.35623@angie.orcam.me.uk> <20210208161043.GA14083@lst.de> <alpine.DEB.2.21.2102091213070.35623@angie.orcam.me.uk>
 <alpine.DEB.2.21.2102151342050.1521@angie.orcam.me.uk> <alpine.DEB.2.21.2102210407090.2021@angie.orcam.me.uk> <20210222075937.GA21946@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 22 Feb 2021, Christoph Hellwig wrote:

> > I haven't booted Linux on my Malta for a while now, but it turns out to 
> > work just fine, and your patch set does not regress it booting multi-user 
> > NFS-rooted over FDDI.
> > 
> >  I note however that the system does not reboot properly:
> > 
> > sd 0:0:0:0: [sda] Synchronizing SCSI cache
> > reboot: Restarting system
> > Reboot failed -- System halted
> > 
> > which is a regression, and also the MMIO-mapped discrete CBUS UART (ttyS2) 
> > does not sign in anymore either:
> 
> Do you mean a regression with this series, or just compared to when you
> last tested?

 When last tested.  Years ago, so nothing for you to be concerned.  I'll 
look into it sometime unless someone beats me to.  Don't hold your breath 
though.  Sorry to be unclear.

  Maciej
