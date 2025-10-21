Return-Path: <linux-mips+bounces-11839-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EB8BF84CF
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 21:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85BA35478DF
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 19:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C099827281C;
	Tue, 21 Oct 2025 19:45:42 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4871E21770C;
	Tue, 21 Oct 2025 19:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761075942; cv=none; b=POW+PBOltH1YyFiNeZ4uCshW7WaClUusexGeDNMKpRzduvSTY3HJ/WD6XJrp66nE5hVbzl5V6RVCBY2YmAzzAmgLgfSYVYm30e5n+BVDpovmtrv2n9ztK9t+7KjQIMo2wNjuyfJPuhSZkp9UhNnPluexGBj6V3wBpqjcQQG6vS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761075942; c=relaxed/simple;
	bh=trq5xYSsfiHRKE4xv1kg6eKtR3miAi4dmb2SaKQ5P2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBg1ab5g7dqgSOrlOXi3GOk3Wk8d7KOKi8JC1r7icG15SzOY4EyfmuNmGnCKKYAx4xd81dRhN0dJiWVRRwlVytguxmY19TWfStvoZllGA/rpjxLqpKnNDN045FZ1mI0Mqxv2rmmNvt9QAdJhzSYlQqElWp/g0oPRAMs5T8m0CmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vBIIT-0000NI-00; Tue, 21 Oct 2025 21:45:29 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A85E4C0256; Tue, 21 Oct 2025 21:45:03 +0200 (CEST)
Date: Tue, 21 Oct 2025 21:45:03 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MIPS: Malta: Fix keyboard resource preventing i8042
 driver from registering
Message-ID: <aPfivybVYb-1_tlk@alpha.franken.de>
References: <alpine.DEB.2.21.2510211901530.8377@angie.orcam.me.uk>
 <alpine.DEB.2.21.2510211919240.8377@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2510211919240.8377@angie.orcam.me.uk>

On Tue, Oct 21, 2025 at 08:38:22PM +0100, Maciej W. Rozycki wrote:
> MIPS Malta platform code registers the PCI southbridge legacy port I/O 
> PS/2 keyboard range as a standard resource marked as busy.  It prevents 
> the i8042 driver from registering as it fails to claim the resource in 
> a call to i8042_platform_init().  Consequently PS/2 keyboard and mouse 
> devices cannot be used with this platform.
> 
> Fix the issue by removing the busy marker from the standard reservation, 
> making the driver register successfully:
> 
> serio: i8042 KBD port at 0x60,0x64 irq 1
> serio: i8042 AUX port at 0x60,0x64 irq 12
> 
> and the resource show up as expected among the legacy devices:
> 
> 00000000-00ffffff : MSC PCI I/O
>   00000000-0000001f : dma1
>   00000020-00000021 : pic1
>   00000040-0000005f : timer
>   00000060-0000006f : keyboard
>     00000060-0000006f : i8042
>   00000070-00000077 : rtc0
>   00000080-0000008f : dma page reg
>   000000a0-000000a1 : pic2
>   000000c0-000000df : dma2
>   [...]
> 
> If the i8042 driver has not been configured, then the standard resource 
> will remain there preventing any conflicting dynamic assignment of this 
> PCI port I/O address range.
> 
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> ---
>  arch/mips/mti-malta/malta-setup.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> linux-mips-malta-setup-resource-keyboard.diff
> Index: linux-macro/arch/mips/mti-malta/malta-setup.c
> ===================================================================
> --- linux-macro.orig/arch/mips/mti-malta/malta-setup.c
> +++ linux-macro/arch/mips/mti-malta/malta-setup.c
> @@ -47,7 +47,7 @@ static struct resource standard_io_resou
>  		.name = "keyboard",
>  		.start = 0x60,
>  		.end = 0x6f,
> -		.flags = IORESOURCE_IO | IORESOURCE_BUSY
> +		.flags = IORESOURCE_IO
>  	},
>  	{
>  		.name = "dma page reg",

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

