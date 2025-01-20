Return-Path: <linux-mips+bounces-7562-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04120A17510
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jan 2025 00:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F4233A68CF
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 23:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FD51E47C4;
	Mon, 20 Jan 2025 23:36:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24C5155A52;
	Mon, 20 Jan 2025 23:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737416186; cv=none; b=VHoOBS4gFR4tb69TsyVrCtpZbX289unXbX752MuHm7RfGI6cfbbUjQ6s9rdVxX2YLEttuhohkicPmQ+k+zixcEXZ57Cvaqj1N9B1zMB92O1w7qbAUfYmoOh0OHXDNumJ5RBq6z6zqW1zIFcF3JDiCUhfU0CfdeyUnbWVRYtfdM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737416186; c=relaxed/simple;
	bh=ymF9x7S+Akphj0N+B81ZiZVyzQT2APWSc9IDU7jgIwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8Q58PhC3Y7BueWZ9TFBuCUdKmVt1GVh5s/uVKtcTZSSVqOHADq2pHKq4f04QMB8AqhY5BltpTXiH6B0N6MwVn+3Ua4MjAvu3XTV7G40TbK+87Jf9RluQGnTkYg1V2NH/g9eU63U7a3fIhvlBjYlSugBGc8X/XZIa/f0ChyZvtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1ta18z-0006Eq-00; Tue, 21 Jan 2025 00:25:21 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 1A345C014E; Mon, 20 Jan 2025 20:41:28 +0100 (CET)
Date: Mon, 20 Jan 2025 20:41:28 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: env: Use str_on_off() helper in
 prom_lefi_init_env()
Message-ID: <Z46m6MHmRMfUnVrD@alpha.franken.de>
References: <20250115090134.918023-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115090134.918023-2-thorsten.blum@linux.dev>

On Wed, Jan 15, 2025 at 10:01:35AM +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_on_off() helper function.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/loongson64/env.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
> index 09ff05269861..be8d2ad10750 100644
> --- a/arch/mips/loongson64/env.c
> +++ b/arch/mips/loongson64/env.c
> @@ -17,6 +17,7 @@
>  #include <linux/dma-map-ops.h>
>  #include <linux/export.h>
>  #include <linux/pci_ids.h>
> +#include <linux/string_choices.h>
>  #include <asm/bootinfo.h>
>  #include <loongson.h>
>  #include <boot_param.h>
> @@ -162,7 +163,7 @@ void __init prom_lefi_init_env(void)
>  		dma_default_coherent = !eirq_source->dma_noncoherent;
>  	}
>  
> -	pr_info("Firmware: Coherent DMA: %s\n", dma_default_coherent ? "on" : "off");
> +	pr_info("Firmware: Coherent DMA: %s\n", str_on_off(dma_default_coherent));
>  
>  	loongson_sysconf.restart_addr = boot_p->reset_system.ResetWarm;
>  	loongson_sysconf.poweroff_addr = boot_p->reset_system.Shutdown;
> -- 
> 2.47.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

