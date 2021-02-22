Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B1E3211B3
	for <lists+linux-mips@lfdr.de>; Mon, 22 Feb 2021 09:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbhBVIAW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Feb 2021 03:00:22 -0500
Received: from verein.lst.de ([213.95.11.211]:57416 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230314AbhBVIAW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Feb 2021 03:00:22 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 69F6168D0A; Mon, 22 Feb 2021 08:59:38 +0100 (CET)
Date:   Mon, 22 Feb 2021 08:59:37 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 5/6] driver core: lift dma_default_coherent into common
 code
Message-ID: <20210222075937.GA21946@lst.de>
References: <20210208145024.3320420-1-hch@lst.de> <20210208145024.3320420-6-hch@lst.de> <alpine.DEB.2.21.2102081654060.35623@angie.orcam.me.uk> <20210208161043.GA14083@lst.de> <alpine.DEB.2.21.2102091213070.35623@angie.orcam.me.uk> <alpine.DEB.2.21.2102151342050.1521@angie.orcam.me.uk> <alpine.DEB.2.21.2102210407090.2021@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2102210407090.2021@angie.orcam.me.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Feb 21, 2021 at 04:32:38AM +0100, Maciej W. Rozycki wrote:
> I haven't booted Linux on my Malta for a while now, but it turns out to 
> work just fine, and your patch set does not regress it booting multi-user 
> NFS-rooted over FDDI.
> 
>  I note however that the system does not reboot properly:
> 
> sd 0:0:0:0: [sda] Synchronizing SCSI cache
> reboot: Restarting system
> Reboot failed -- System halted
> 
> which is a regression, and also the MMIO-mapped discrete CBUS UART (ttyS2) 
> does not sign in anymore either:

Do you mean a regression with this series, or just compared to when you
last tested?
