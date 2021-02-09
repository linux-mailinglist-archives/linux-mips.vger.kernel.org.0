Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81534314FE3
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 14:14:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhBINNt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Feb 2021 08:13:49 -0500
Received: from elvis.franken.de ([193.175.24.41]:36604 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230521AbhBINNc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Feb 2021 08:13:32 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l9Soz-0003io-00; Tue, 09 Feb 2021 14:12:49 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 93C26C0DBF; Tue,  9 Feb 2021 14:06:36 +0100 (CET)
Date:   Tue, 9 Feb 2021 14:06:36 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 5/6] driver core: lift dma_default_coherent into common
 code
Message-ID: <20210209130636.GA11915@alpha.franken.de>
References: <20210208145024.3320420-1-hch@lst.de>
 <20210208145024.3320420-6-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210208145024.3320420-6-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 08, 2021 at 03:50:23PM +0100, Christoph Hellwig wrote:
> Lift the dma_default_coherent variable from the mips architecture code
> to the driver core.  This allows an architecture to sdefault all device
> to be DMA coherent at run time, even if the kernel is build with support
> for DMA noncoherent device.  By allowing device_initialize to ѕet the
> ->dma_coherent field to this default the amount of arch hooks required
> for this behavior can be greatly reduced.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
> [..]
> @@ -143,7 +143,7 @@ static void __init plat_setup_iocoherency(void)
>  			pr_crit("IOCU OPERATION DISABLED BY SWITCH - DEFAULTING TO SW IO COHERENCY\n");
>  	}
>  
> -	if (supported)
> +	if (supported) {
>  		if (dma_force_noncoherent) {
>  			pr_info("Hardware DMA cache coherency disabled\n");
>  			return;

this hunk needs to be in patch 1, otherwise it's not compilable

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
