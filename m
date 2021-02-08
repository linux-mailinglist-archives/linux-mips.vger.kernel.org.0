Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01EF13138B3
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 16:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhBHP6h (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 10:58:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbhBHP6P (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 10:58:15 -0500
X-Greylist: delayed 66354 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 08 Feb 2021 07:57:34 PST
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BA6DEC061786;
        Mon,  8 Feb 2021 07:57:34 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 90BE19200B4; Mon,  8 Feb 2021 16:57:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 8AC289200B3;
        Mon,  8 Feb 2021 16:57:33 +0100 (CET)
Date:   Mon, 8 Feb 2021 16:57:33 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Christoph Hellwig <hch@lst.de>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 5/6] driver core: lift dma_default_coherent into common
 code
In-Reply-To: <20210208145024.3320420-6-hch@lst.de>
Message-ID: <alpine.DEB.2.21.2102081654060.35623@angie.orcam.me.uk>
References: <20210208145024.3320420-1-hch@lst.de> <20210208145024.3320420-6-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 8 Feb 2021, Christoph Hellwig wrote:

> diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
> index e98cc977a735b2..f8c9663e7faa10 100644
> --- a/arch/mips/mti-malta/malta-setup.c
> +++ b/arch/mips/mti-malta/malta-setup.c
> @@ -143,7 +143,7 @@ static void __init plat_setup_iocoherency(void)
>  			pr_crit("IOCU OPERATION DISABLED BY SWITCH - DEFAULTING TO SW IO COHERENCY\n");
>  	}
>  
> -	if (supported)
> +	if (supported) {
>  		if (dma_force_noncoherent) {
>  			pr_info("Hardware DMA cache coherency disabled\n");
>  			return;

 I think this has to go with 1/6; otherwise compilation breaks between 
then and now AFAICT.

 Do you need to have this verified anyhow?  I only have a non-coherent 5Kc 
Malta though.

  Maciej
