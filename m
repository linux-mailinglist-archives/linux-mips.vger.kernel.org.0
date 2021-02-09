Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0650C314FE2
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 14:14:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhBINNp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Feb 2021 08:13:45 -0500
Received: from elvis.franken.de ([193.175.24.41]:36608 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230228AbhBINNb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Feb 2021 08:13:31 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l9Soz-0003io-01; Tue, 09 Feb 2021 14:12:49 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 98BE5C0DC4; Tue,  9 Feb 2021 14:12:37 +0100 (CET)
Date:   Tue, 9 Feb 2021 14:12:37 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 4/6] MIPS: refactor the maybe coherent DMA indicators
Message-ID: <20210209131237.GB11915@alpha.franken.de>
References: <20210208145024.3320420-1-hch@lst.de>
 <20210208145024.3320420-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208145024.3320420-5-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 08, 2021 at 03:50:22PM +0100, Christoph Hellwig wrote:
> Replace the global coherentio enum, and the hw_coherentio (fake) boolean
> variables with a single boolean dma_default_coherent flag.  Only the
> malta setup code needs two additional local boolean variables to
> preserved the command line overrides.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/mips/alchemy/common/setup.c      |  3 +--
>  arch/mips/include/asm/dma-coherence.h | 24 ++++--------------------
>  arch/mips/kernel/setup.c              |  8 +++-----
>  arch/mips/mm/c-r4k.c                  |  8 ++------
>  arch/mips/mti-malta/malta-setup.c     | 24 ++++++++++++++----------
>  arch/mips/pci/pci-alchemy.c           |  5 ++---
>  6 files changed, 26 insertions(+), 46 deletions(-)
> 
> diff --git a/arch/mips/alchemy/common/setup.c b/arch/mips/alchemy/common/setup.c
> index c2da68e7984450..39e5b9cd882b10 100644
> --- a/arch/mips/alchemy/common/setup.c
> +++ b/arch/mips/alchemy/common/setup.c
> @@ -65,8 +65,7 @@ void __init plat_mem_setup(void)
>  		/* Clear to obtain best system bus performance */
>  		clear_c0_config(1 << 19); /* Clear Config[OD] */
>  
> -	coherentio = alchemy_dma_coherent() ?
> -		IO_COHERENCE_ENABLED : IO_COHERENCE_DISABLED;
> +	dma_default_coherent = alchemy_dma_coherent();
>  
>  	board_setup();	/* board specific setup */
>  
> diff --git a/arch/mips/include/asm/dma-coherence.h b/arch/mips/include/asm/dma-coherence.h
> index 5eaa1fcc878a88..846c5ade30d12d 100644
> --- a/arch/mips/include/asm/dma-coherence.h
> +++ b/arch/mips/include/asm/dma-coherence.h
> @@ -9,30 +9,14 @@
>  #ifndef __ASM_DMA_COHERENCE_H
>  #define __ASM_DMA_COHERENCE_H
>  
> -enum coherent_io_user_state {
> -	IO_COHERENCE_DEFAULT,
> -	IO_COHERENCE_ENABLED,
> -	IO_COHERENCE_DISABLED,
> -};
> -
> -#if defined(CONFIG_DMA_PERDEV_COHERENT)
> -/* Don't provide (hw_)coherentio to avoid misuse */
> -#elif defined(CONFIG_DMA_MAYBE_COHERENT)
> -extern enum coherent_io_user_state coherentio;
> -extern int hw_coherentio;
> -
> +#ifdef CONFIG_DMA_MAYBE_COHERENT
> +extern bool dma_default_coherent;
>  static inline bool dev_is_dma_coherent(struct device *dev)
>  {
> -	return coherentio == IO_COHERENCE_ENABLED ||
> -		(coherentio == IO_COHERENCE_DEFAULT && hw_coherentio);
> +	return dma_default_coherent;

this breaks overriding of coherentio via command line. plat_mem_setup/
plat_setup_iocoherency is called before earlyparams are handled. So
changing coherentio after that doesn't have any effect.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
