Return-Path: <linux-mips+bounces-11838-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 62790BF84C6
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 21:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2EF3D4EB1C8
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 19:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220D926A08A;
	Tue, 21 Oct 2025 19:45:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486BB1DF269;
	Tue, 21 Oct 2025 19:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761075941; cv=none; b=sJtUDxWI4+63fzKh5swHgdOVDq8GmSAIfM5b8XgxllpaY/UewJcqc5Lm01aa6Eu1e2LoSKz0N8ZzlrAPYdqJid7LRWMTryrBkZyHta7+PSE8FcQDD97EASejuNsy8UpiZuurCf8ayby2aOhHhAnUGk8ObtZX7l75ur4xXpoa4Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761075941; c=relaxed/simple;
	bh=G1hbEtKrRI38BN8uRKmMEJMlIFVWwmAGY2J90k/Z0LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXg5uWhe7y2FtdgPyKU3Q/SQkOMODbwBTTS9t0XWmqUXPf6hHUjL2VBNigdws5plAmAuTeCF5WqjGM1f4xiNnxyYuVBhvoo/PO6GupH5vlkj+EYqfnYYx2wjau3EISubiFEZXSpJkOBbO/xjOhaldEbZcwH6tFHCmZvpeFYOabo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vBIIT-0000NK-00; Tue, 21 Oct 2025 21:45:29 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 90D3AC06A7; Tue, 21 Oct 2025 21:45:16 +0200 (CEST)
Date: Tue, 21 Oct 2025 21:45:16 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: Malta: Fix PCI southbridge legacy resource
 reservations
Message-ID: <aPfizMmOQEl0_DaG@alpha.franken.de>
References: <alpine.DEB.2.21.2510211901530.8377@angie.orcam.me.uk>
 <alpine.DEB.2.21.2510212001250.8377@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2510212001250.8377@angie.orcam.me.uk>

On Tue, Oct 21, 2025 at 08:38:29PM +0100, Maciej W. Rozycki wrote:
> Covering the PCI southbridge legacy port I/O range with a northbridge 
> resource reservation prevents MIPS Malta platform code from claiming its 
> standard legacy resources.  This is because request_resource() calls 
> cause a clash with the previous reservation and consequently fail.
> 
> Change to using insert_resource() so as to prevent the clash, switching 
> the legacy reservations from:
> 
> 00000000-00ffffff : MSC PCI I/O
>   00000020-00000021 : pic1
>   00000070-00000077 : rtc0
>   000000a0-000000a1 : pic2
>   [...]
> 
> to:
> 
> 00000000-00ffffff : MSC PCI I/O
>   00000000-0000001f : dma1
>   00000020-00000021 : pic1
>   00000040-0000005f : timer
>   00000060-0000006f : keyboard
>   00000070-00000077 : rtc0
>   00000080-0000008f : dma page reg
>   000000a0-000000a1 : pic2
>   000000c0-000000df : dma2
>   [...]
> 
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Fixes: ae81aad5c2e1 ("MIPS: PCI: Use pci_enable_resources()")
> Cc: stable@vger.kernel.org # v6.18+
> ---
>  arch/mips/mti-malta/malta-setup.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> linux-mips-malta-setup-insert-resource.diff
> Index: linux-macro/arch/mips/mti-malta/malta-setup.c
> ===================================================================
> --- linux-macro.orig/arch/mips/mti-malta/malta-setup.c
> +++ linux-macro/arch/mips/mti-malta/malta-setup.c
> @@ -213,7 +213,7 @@ void __init plat_mem_setup(void)
>  
>  	/* Request I/O space for devices used on the Malta board. */
>  	for (i = 0; i < ARRAY_SIZE(standard_io_resources); i++)
> -		request_resource(&ioport_resource, standard_io_resources+i);
> +		insert_resource(&ioport_resource, standard_io_resources + i);
>  
>  	/*
>  	 * Enable DMA channel 4 (cascade channel) in the PIIX4 south bridge.

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

