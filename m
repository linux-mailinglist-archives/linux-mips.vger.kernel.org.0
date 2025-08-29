Return-Path: <linux-mips+bounces-10809-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC59B3B8C8
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FDB456222B
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4104730C360;
	Fri, 29 Aug 2025 10:31:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF7C3081D4;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463485; cv=none; b=B85vEmHHN1eVZEH5AbDyU5fnWb9ltDlbYe9FmDXpSaMtleGcqUoyAfXjR/3+RM9O0k0t4TDCbP9CHWQGRIATGsLZKCrWGdkWMIojea6cd/h2X6FdhbzPpxmnTozihZfDTNyAaRS50qL+HhaTGER/JU1xRiszGITeEJ7bavGkfDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463485; c=relaxed/simple;
	bh=92SKU3EpfkGcS6IIcLwXlPj+A5HE40/1CNG66+vsSa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmnzwCJysmuD5byD03baK9NvxCs8TxrZAZeRoPk+Up/a5ySHkXkWmoJKNc+poruh8qUGXHzE+2KpiKMaRgnMeef9IvWaMAK8yGE0yIKsp5tBMICVRIO6WhH5LoKi/ITRn3kb75GEbcqEM0hX4uVkjXLi+0ez9TINMXXlLII/trg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO2-0004Fn-00; Fri, 29 Aug 2025 12:31:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D6AC8C0B87; Fri, 29 Aug 2025 12:25:16 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:25:16 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] MIPS: sgi-ip22: Replace deprecated strcpy() in
 plat_mem_setup()
Message-ID: <aLGADELlnJaBrnhz@alpha.franken.de>
References: <20250817183728.612012-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817183728.612012-1-thorsten.blum@linux.dev>

On Sun, Aug 17, 2025 at 08:37:11PM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy() instead.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/sgi-ip22/ip22-setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/sgi-ip22/ip22-setup.c b/arch/mips/sgi-ip22/ip22-setup.c
> index e06a818fe792..f083b25be13b 100644
> --- a/arch/mips/sgi-ip22/ip22-setup.c
> +++ b/arch/mips/sgi-ip22/ip22-setup.c
> @@ -11,6 +11,7 @@
>  #include <linux/types.h>
>  #include <linux/console.h>
>  #include <linux/sched.h>
> +#include <linux/string.h>
>  #include <linux/tty.h>
>  
>  #include <asm/addrspace.h>
> @@ -65,7 +66,7 @@ void __init plat_mem_setup(void)
>  		static char options[8] __initdata;
>  		char *baud = ArcGetEnvironmentVariable("dbaud");
>  		if (baud)
> -			strcpy(options, baud);
> +			strscpy(options, baud);
>  		add_preferred_console("ttyS", *(ctype + 1) == '2' ? 1 : 0,
>  				      baud ? options : NULL);
>  	} else if (!ctype || *ctype != 'g') {
> -- 
> 2.50.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

